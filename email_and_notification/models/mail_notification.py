# -*- coding: utf-8 -*-
# Part of Odoo. See LICENSE file for full copyright and licensing details.

from odoo import models, fields, api


class StockPicking(models.Model):
    _inherit = 'stock.picking'

    def _action_done(self):
        res = super(StockPicking, self)._action_done()
        po_id = self.env['purchase.order'].search([('name', '=', self.origin)])
        if po_id:
            if self.state == 'done':
                group = self.env.ref('pos_disable_all.group_admin')
                admins = []
                admins_email = []
                for user in group.users:
                    admins.append(user.partner_id.id)
                for admin in admins:
                    user_id = self.env['res.partner'].browse(admin)
                    admins_email.append(user_id.email)
                trans_ref_id = self.env['stock.picking'].search([('origin', '=', self.origin)])
                trans_ref_list = []
                for rec in trans_ref_id:
                    trans_ref_list.append(rec.name)
                moves = []
                demand = 0
                total_demand = 0
                total_received = 0
                total_subtotal = 0
                for line in po_id.order_line:
                    move = {
                        'product': line.product_id.name,
                        'demand_qty': line.product_qty,
                        'done_qty': line.qty_received,
                        'unit_price': line.price_unit,
                        'price_subtotal': line.price_subtotal
                    }
                    total_subtotal += line.price_subtotal
                    total_demand += line.product_qty
                    total_received += line.qty_received
                    if line.qty_received != line.product_qty:
                        demand += 1
                    moves.append(move)
                for email in admins_email:
                    data = {
                        'email': email,
                        'from': self.env.user.email,
                        'moves': moves,
                        'po_id': self.origin,
                        'validated': self.env.user.name,
                        'vendor': self.partner_id.name,
                        'deliver_to': str(
                            self.location_dest_id.location_id.name) + "/" + str(
                            self.location_dest_id.name),
                        'done_date': self.date_done,
                        'backorder': 'YES' if po_id.picking_count > 1 else 'NO',
                        'trans_ref': (', '.join(trans_ref_list)),
                        'demand': 'YES' if demand > 1 else 'NO',
                        'total_demand': total_demand,
                        'total_received': total_received,
                        'total_subtotal': total_subtotal
                    }
                    template = self.env.ref(
                        'email_and_notification.mail_template_receive_product').sudo()
                    template.with_context(data).send_mail(
                        self.id, force_send=True)
                return res
        else:
            return res


class StockMoveLine(models.Model):
    _inherit = 'stock.move.line'

    @api.model_create_multi
    def create(self, vals_list):
        line_id = super(StockMoveLine, self).create(vals_list)

        for rec in line_id:
            if rec.reference == 'Product Quantity Updated':
                message_id = self.env['mail.message'].create({
                    'model': 'stock.move.line',
                    'res_id': self.id,
                    'subject': self.reference,
                    'message_type': 'notification',
                    'body': '%s submitted an Inventory Adjustment' % (
                        self.env.user.name),
                    'email_from': self.env.user.email
                })
                group = self.env.ref('pos_disable_all.group_admin')
                admins = []
                admins_email = []
                for user in group.users:
                    admins.append(user.partner_id.id)
                for admin in admins:
                    user_id = self.env['res.partner'].browse(admin)
                    admins_email.append(user_id.email)
                    notification = self.env['mail.notification'].create({
                        'mail_message_id': message_id.id,
                        'notification_type': 'inbox',
                        'res_partner_id': admin
                    })

                moves = []
                for line in line_id:
                    move = {
                        'date': line.date,
                        'product': line.product_id.name,
                        'from': str(
                            line.location_id.location_id.name) + "/" + str(
                            line.location_id.name),
                        'to': str(
                            line.location_dest_id.location_id.name) + "/" + str(
                            line.location_dest_id.name),
                        'quantity': line.qty_done
                    }
                    moves.append(move)
                for email in admins_email:
                    data = {
                        'email': email,
                        'from': self.env.user.email,
                        'moves': moves,
                        'user': self.env.user.name,
                        'subject': 'Added' if line_id.location_id.name == 'Inventory adjustment' else 'Deducted'
                    }
                    template = self.env.ref(
                        'email_and_notification.mail_template_quantity_update').sudo()
                    template.with_context(data).send_mail(
                        self.id, force_send=True)
            return line_id
        else:
            return line_id
