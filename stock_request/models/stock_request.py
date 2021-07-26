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
        """Function search for stock picking with field origin having
         stock request name, it finds that stock request and update the
         quantity of product in product lines with respect to internal
         transfer orderlines"""
        res = super(StockPicking, self)._action_done()
        stock_request_id = self.env['stock.request'].search(
            [('name', '=', self.origin)])
        if stock_request_id:
            if self.state == 'done':
                demand = done = 0
                for rec in stock_request_id.stock_req_line_ids:
                    product_line_id = self.env['stock.request.line'].search(
                        [('id', '=', int(rec))])
                    for rec2 in self.move_ids_without_package:
                        if product_line_id.product_id.name == \
                                rec2.product_id.name:
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

    @api.depends('move_type', 'immediate_transfer', 'move_lines.state',
                 'move_lines.picking_id')
    def _compute_state(self):
        """
        Function modified to set new state.
        State of a picking depends on the state of its related stock.move
        - Draft: only used for "planned pickings"
        - Waiting: if the picking is not ready to be sent so if
          - (a) no quantity could be reserved at all or if
          - (b) some quantities could be reserved and the shipping policy is
                "deliver all at once"
        - Waiting another move: if the picking is waiting for another move
        - Ready: if the picking is ready to be sent so if:
          - (a) all quantities are reserved or if
          - (b) some quantities could be reserved and the shipping policy is
                "as soon as possible"
        - Done: if the picking is done.
        - Cancelled: if the picking is cancelled
        """
        for picking in self:
            if not picking.move_lines:
                picking.state = 'draft'
            elif any(move.state == 'draft' for move in
                     picking.move_lines):  # TDE FIXME: should be all ?
                picking.state = 'draft'
            elif all(move.state == 'cancel' for move in picking.move_lines):
                picking.state = 'cancel'
            elif all(
                    move.state in [
                        'cancel', 'done'] for move in picking.move_lines):
                picking.state = 'done'
                if picking.origin:
                    purchase_order_id = self.env['purchase.order'].search(
                        [('name', '=', picking.origin)])
                    receipts_ids = self.env['stock.picking'].search(
                        [('name', 'like', '/IN/'),
                         ('origin', '=', purchase_order_id.name)])
                    if receipts_ids:
                        if all(receipt.state == 'done' for receipt in
                               receipts_ids):
                            purchase_order_id.write({'state': 'received'})
                        elif any(receipt.state == 'done' for receipt in
                                 receipts_ids):
                            purchase_order_id.write({'state': 'partial'})
            else:
                relevant_move_state = \
                    picking.move_lines._get_relevant_state_among_moves()
                if picking.immediate_transfer and \
                        relevant_move_state not in ('draft', 'cancel', 'done'):
                    picking.state = 'assigned'
                elif relevant_move_state == 'partially_available':
                    picking.state = 'assigned'
                else:
                    picking.state = relevant_move_state


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
    create_uid = fields.Many2one(
        'res.users', 'Created by', index=True,
        default=lambda self: self.env.user, store=True, readonly=True)
    picking_type_id = fields.Many2one(
        'stock.picking.type', 'Source Warehouse', required=True,
        domain=[('name', '=', 'Internal Transfers')])
    source_location_id = fields.Many2one(
        'stock.location', string='Source Location',
        related='picking_type_id.default_location_src_id',
        domain=[('usage', '=', 'internal')], store=True)
    dest_location_id = fields.Many2one(
        'stock.location', required=True, string='Destination Location',
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

    @api.onchange('dest_location_id')
    def _onchange_dest_location_id(self):
        location_id = self.dest_location_id.location_id
        for iterate in range(0, 10):
            if location_id.location_id.name == 'Physical Locations':
                break
            location_id = location_id.location_id
        destination_warehouse_id = self.env['stock.warehouse'].search(
            [('code', '=', location_id.name)])
        print(destination_warehouse_id.name)

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
        """Sent notification, mail to procurement officers whenever a Stock
         Request is created"""
        location_id = self.dest_location_id.location_id
        for iterate in range(0, 10):
            if location_id.location_id.name == 'Physical Locations':
                break
            location_id = location_id.location_id
        destination_warehouse_id = self.env['stock.warehouse'].search(
            [('code', '=', location_id.name)])
        message_id = self.env['mail.message'].create({
            'model': 'stock.request',
            'res_id': self.id,
            'subject': 'STOCK REQUEST %s ' % self.name,
            'message_type': 'notification',
            'body': '%s created a new Stock Request' % self.env.user.name,
            'email_from': self.env.user.email
        })
        procurement_officer_ids = self.env['res.users'].search(
            [('id', 'in', (self.env['res.groups'].search(
                [('name', 'ilike', 'Procurement Officer')]).users).ids)])
        procurement_officers_emails = []
        for procurement_officer_id in procurement_officer_ids:
            procurement_officers_emails.append(procurement_officer_id.email)
            self.env['mail.notification'].create({
                'mail_message_id': message_id.id,
                'notification_type': 'inbox',
                'res_partner_id': procurement_officer_id.partner_id.id,
            })
        request_lines = []
        total = 0
        for line in self.stock_req_line_ids:
            subtotal = line.demand_qty * line.product_id.standard_price
            request_line = {
                'product': line.product_id.name,
                'demand': line.demand_qty,
                'unit_price': line.product_id.standard_price,
                'subtotal': subtotal,
            }
            total += subtotal
            request_lines.append(request_line)
        print("Request Lines :", request_lines)
        for email in procurement_officers_emails:
            data = {
                'email': email,
                'from': self.env.user.email,
                'user': self.env.user.name,
                'destination_warehouse': destination_warehouse_id.name,
                'request_lines': request_lines,
                'total': total,
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


class PurchaseOrder(models.Model):
    _inherit = "purchase.order"

    state = fields.Selection(
        selection_add=[
            ('partial', 'Partially Received'), ('received', 'Received')],
        ondelete={'partial': lambda self: self.set_state(),
                  'received': lambda self: self.set_state()})

    def set_state(self):
        """Function to set state of purchase order from 'Received' or
        'Partially Received' to 'Locked' if lock confirmed order is enabled
        unless to 'Purchase Order'"""
        lock_order = self.env['res.config.settings'].search(
            [('lock_confirmed_po', '=', True)])
        print('lock_order:  ', lock_order)
        for record in self:
            if record.state in ['received', 'partial']:
                print("name:  ", record.name, "state:  ", record.state)
                if lock_order:
                    record.state = 'done'
                else:
                    record.state = 'purchase'

    def _update_purchase_order_state(self):
        """
        This function is used to update state of purchase orders. The state of
        purchase orders, with receipts in done state, will be set as 'Received'.
        If there is any backorder, the state will be set as 'Partially Received'
        """
        records = self.search([])
        for record in records:
            receipts_ids = self.env['stock.picking'].search(
                [('name', 'like', '/IN/'), ('origin', '=', record.name)])
            if receipts_ids:
                if all(receipt.state == 'done' for receipt in receipts_ids):
                    record.write({'state': 'received'})
                elif any(receipt.state == 'done' for receipt in receipts_ids):
                    record.write({'state': 'partial'})
