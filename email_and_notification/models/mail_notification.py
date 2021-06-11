# -*- coding: utf-8 -*-
# Part of Odoo. See LICENSE file for full copyright and licensing details.

from odoo import models, fields, api


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
                    'body': '%s submitted an Inventory Adjustment' %(self.env.user.name),
                    'email_from': self.env.user.email
                })
                group = self.env.ref('pos_disable_all.group_admin')
                admins = []
                printadmins = []
                admins_email = []
                for user in group.users:
                    admins.append(user.partner_id.id)
                    printadmins.append(user.partner_id.name)
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
                            line.location_id.location_id.name) + "/" + str(line.location_id.name),
                        'to': str(
                            line.location_dest_id.location_id.name) + "/" + str(line.location_dest_id.name),
                        'quantity': line.qty_done
                    }
                    moves.append(move)
                for email in admins_email:
                    data = {
                        'email': email,
                        'from': self.env.user.email,
                        'moves': moves,
                        'user': self.env.user.name,
                        'subject': 'ADDED' if line_id.location_id.name == 'Inventory adjustment' else 'DEDUCTED'
                    }
                    template = self.env.ref(
                        'email_and_notification.mail_template_quantity_update').sudo()
                    template.with_context(data).send_mail(
                        self.id, force_send=True)
            return line_id
        else:
            return line_id

