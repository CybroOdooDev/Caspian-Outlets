# -*- coding: utf-8 -*-
# Part of Odoo. See LICENSE file for full copyright and licensing details.

from odoo import models, fields, api, _
from odoo.exceptions import UserError


class StockWarehouse(models.Model):
    _inherit = 'stock.warehouse'

    auth_employee = fields.Many2many('res.users',
                                     string="Authorised Employees")


class StockPicking(models.Model):
    _inherit = 'stock.picking'

    def _action_done(self):
        """Function search for stock picking with field origin having having
         stock request name, it finds that stock request and update the
         quantity of product in product lines with respect to internal
         transfer orderlines"""
        res = super(StockPicking, self)._action_done()
        stock_request_id = self.env['stock.request'].search(
            [('name', '=', self.origin)])
        if stock_request_id:
            if self.state is 'done':
                demand = done = 0
                for rec in stock_request_id.stock_req_line_ids:
                    product_line_id = self.env['stock.request.line'].search(
                        [('id', '=', int(rec))])
                    for rec2 in self.move_ids_without_package:
                        if product_line_id.product_id.name == rec2.product_id.name:
                            product_line_id.done_qty += rec2.quantity_done
                            demand += product_line_id.demand_qty
                            done += product_line_id.done_qty
                if demand > done:
                    stock_request_id.state = 'partial'
                else:
                    stock_request_id.state = 'done'
                    if not stock_request_id.done_date:
                        stock_request_id.done_date = fields.Datetime.now()
                return res
        else:
            return res


class StockRequestLine(models.Model):
    _name = 'stock.request.line'
    _description = 'Stock Request Line'

    sequence = fields.Integer('Sequence', help="Determine the display order",
                              index=True)
    stock_req_id = fields.Many2one('stock.request',
                                   string='Stock Request Reference')
    product_id = fields.Many2one('product.product', string='Reference',
                                 required=True)
    done_qty = fields.Float(string='Done', store=True)
    demand_qty = fields.Float(string='Demand', default=1.0)


class StockRequest(models.Model):
    _name = 'stock.request'
    _description = 'Warehouse Stock Request'
    _inherit = ['mail.thread', 'mail.activity.mixin']

    name = fields.Char(string='Reference', default='New')
    create_uid = fields.Many2one('res.users', 'Created by', index=True,
                                 default=lambda self: self.env.user,
                                 store=True, readonly=True)
    picking_type_id = fields.Many2one('stock.picking.type', 'Source Warehouse',
                                      required=True,
                                      domain=[('name', '=',
                                               'Internal Transfers')])
    source_location_id = fields.Many2one('stock.location',
                                         string='Source Location', store=True,
                                         domain=[('usage', '=', 'internal')],
                                         related='picking_type_id.default_location_src_id')
    dest_location_id = fields.Many2one('stock.location', required=True,
                                       string='Destination Location',
                                       domain=[('usage', '=', 'internal')])
    request_date = fields.Datetime(string='Request Date',
                                   default=fields.Datetime.now())
    done_date = fields.Datetime(string='Done Date')
    internal_tx_id = fields.Many2one('stock.picking',
                                     string='Internal Transfer Reference')
    state = fields.Selection([('draft', 'Draft'),
                              ('request_sent', 'Request Sent'),
                              ('progress', 'Request in Progress'),
                              ('partial', 'Done Partially'),
                              ('done', 'Done')], readonly=True)
    stock_req_line_ids = fields.One2many('stock.request.line', 'stock_req_id',
                                         string='Product List', store=True)
    note = fields.Text(string='Notes')

    def button_internal_tx(self):
        """Redirect to the list of internal transfers record"""
        return {
            'type': 'ir.actions.act_window',
            'view_mode': 'tree,form',
            'name': _("Transfers"),
            'res_model': 'stock.picking',
            'domain': [('origin', '=', str(self.name))]
        }

    def button_sent_request(self):
        """Sent notification, mail to procurement officers when an ne Stock
         Request is created"""
        message_id = self.env['mail.message'].create({
            'model': 'stock.request',
            'res_id': self.id,
            'subject': 'STOCK REQUEST %s ' % self.name,
            'message_type': 'notification',
            'body': '%s created a new Stock Request' % self.env.user.name,
            'email_from': self.env.user.email
        })
        group = self.env.ref('stock_request.group_procurement_officer')
        procurement_officers = []
        procurement_officers_email = []
        for user in group.users:
            procurement_officers.append(user.partner_id.id)
        for this_user in procurement_officers:
            user_id = self.env['res.partner'].browse(this_user)
            procurement_officers_email.append(user_id.email)
            notification = self.env['mail.notification'].create({
                'mail_message_id': message_id.id,
                'notification_type': 'inbox',
                'res_partner_id': this_user
            })
        for email in procurement_officers_email:
            data = {
                'email': email,
                'to': self.env['res.users'].search(
                    [('login', '=', email)]).name,
                'from': self.env.user.email,
                'user': self.env.user.name,
                'subject': str(self.dest_location_id.location_id.name),
                'dest_loc': self.env['stock.warehouse'].search([('code', '=',
                                                                 self.dest_location_id.location_id.name)]).name
            }
            template = self.env.ref(
                'stock_request.mail_template_stock_request').sudo()
            template.with_context(data).send_mail(
                self.id, force_send=True)
        self.write({'state': 'request_sent'})

    def button_proceed_transfer(self):
        """Create an Internal Transfer with information in stock request"""
        dest_warehouse = self.env['stock.warehouse'].search(
            [('code', '=', self.dest_location_id.location_id.name)])
        auth_user = []
        for auth_emp in dest_warehouse.auth_employee:
            auth_user.append(auth_emp.id)
        for admin in self.env.ref('stock.group_stock_manager').users:
            auth_user.append(int(admin.id))
        for pro_off in self.env.ref(
                'stock_request.group_procurement_officer').users:
            auth_user.append(int(pro_off.id))
        if int(self.env.user.id) in auth_user:
            product_line = []
            for rec in self.stock_req_line_ids:
                rec_list = [0, 0, {'product_id': rec.product_id.id,
                                   'name': rec.product_id.name,
                                   'product_uom': rec.product_id.uom_id.id,
                                   'product_uom_qty': rec.demand_qty}]
                product_line.append(rec_list)
            self.internal_tx_id = self.env['stock.picking'].create({
                'partner_id': int(self.create_uid),
                'picking_type_id': int(self.picking_type_id),
                'location_id': int(self.source_location_id),
                'location_dest_id': int(self.dest_location_id),
                'move_type': 'direct',
                'user_id': int(self.create_uid),
                'note': self.note,
                'origin': self.name,
                'move_lines': product_line
            })
            self.write({'state': 'progress'})
            return {
                'type': 'ir.actions.act_window',
                'view_mode': 'tree,form',
                'name': _("Transfers"),
                'res_model': 'stock.picking',
                'domain': [('id', '=', int(self.internal_tx_id))]
            }
        else:
            raise UserError("You are not an Authorized person to proceed"
                            " with this action !")

    @api.model
    def create(self, vals):
        """Check if it is an authorized person to create a stock request"""
        dest_warehouse = self.env['stock.warehouse'].\
            search([('code', '=', self.env['stock.location'].
                     search([("id", "=", int(vals['dest_location_id']))]).
                     location_id.name)])
        auth_user = []
        for auth_emp in dest_warehouse.auth_employee:
            auth_user.append(auth_emp.id)
        for admin in self.env.ref('stock.group_stock_manager').users:
            auth_user.append(int(admin.id))
        for pro_off in self.env.ref(
                'stock_request.group_procurement_officer').users:
            auth_user.append(int(pro_off.id))
        if int(self.env.user.id) in auth_user:
            src_loc = self.env['stock.picking.type'].search(
                [('id', '=', vals['picking_type_id'])])
            dest_loc = self.env['stock.location'].search(
                [('id', '=', vals['dest_location_id'])])
            auth_user = []
            seq_number = self.env['ir.sequence'].next_by_code(
                'sequence.request.number')
            name = "SREQ" + "/" + str(
                src_loc.default_location_src_id.location_id.name) + "/" + str(
                dest_loc.location_id.name) + "/" + str(seq_number)
            if not self.env['stock.request'].search([('name', '=', name)]):
                vals['name'] = name
                vals['state'] = 'draft'
                stock_request = super(StockRequest, self).create(vals)
                return stock_request
            else:
                vals['name'] = "SREQ" + "/" + str(
                    src_loc.default_location_src_id.location_id.name) + "/" +\
                               str(dest_loc.location_id.name) + "/" +\
                               str(seq_number + 1)
                stock_request = super(StockRequest, self).create(vals)
                return stock_request
        else:
            error_message = _("You are not an Authorized person to create a "
                              "stock request for %s !") % dest_warehouse.name
            raise UserError(error_message)
