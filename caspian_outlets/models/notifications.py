# -*- coding: utf-8 -*-

from odoo import models, fields, api


class PointOfSale(models.Model):
    _inherit = 'pos.session'

    def action_pos_session_closing_control(self):
        res = super(PointOfSale, self).action_pos_session_closing_control()
        print("Test")
        message = self.env['mail.message'].create({
            'model': 'pos.session',
            'res_id': int(self.id),
            'subject': self.config_id.name+' session closed',
            'message_type':  'notification',
            'body': "Total orders: %s<br/>Total Payments Amount: %s"
            % (self.order_count, self.total_payments_amount),
            'email_from': self.env.user.email
        })
        group = self.env.ref('pos_disable_all.group_admin')
        print("group users ", group.users)
        res_partner_ids = []
        for partner in group.users:
            res_partner_ids.append(partner.partner_id.id)
        for user in res_partner_ids:
            notification = self.env['mail.notification'].create({
                'mail_message_id': message.id,
                'notification_type': 'inbox',
                'res_partner_id': user
            })
        return res


class ExpenseReport(models.Model):
    _inherit = 'hr.expense'

    def action_submit_expenses(self):
        res = super(ExpenseReport, self).action_submit_expenses()
        message = self.env['mail.message'].create({
            'model': 'hr.expense',
            'res_id': int(self.id),
            'subject': self.name,
            'message_type': 'notification',
            'body': "%s submitted an expense report having total amount %s"
                    % (self.employee_id.name, self.total_amount),
            'email_from': self.env.user.email
        })
        group = self.env.ref('pos_disable_all.group_admin')
        print("group users ", group.users)
        res_partner_ids = []
        for partner in group.users:
            res_partner_ids.append(partner.partner_id.id)
        for user in res_partner_ids:
            notification = self.env['mail.notification'].create({
                'mail_message_id': message.id,
                'notification_type': 'inbox',
                'res_partner_id': user
            })
        return res


class StockInventory(models.Model):
    _inherit = 'stock.inventory'

    def action_validate(self):
        print("ssssssssssssssssssssssssssssss")
        res = super(StockInventory, self).action_validate()
        message = self.env['mail.message'].create({
            'model': 'stock.inventory',
            'res_id': int(self.id),
            'subject': self.name,
            'message_type': 'notification',
            'body': "%s submitted Inventory adjustment entry"
                    % (self.env.user.name),
            'email_from': self.env.user.email
        })
        group = self.env.ref('pos_disable_all.group_admin')
        print("group users ", group.users)
        res_partner_ids = []
        for partner in group.users:
            res_partner_ids.append(partner.partner_id.id)
        emails = []
        for user in res_partner_ids:
            user_id = self.env['res.partner'].browse(user)
            emails.append(user_id.email)
            notification = self.env['mail.notification'].create({
                'mail_message_id': message.id,
                'notification_type': 'inbox',
                'res_partner_id': user
            })
        lines = self.env['stock.move.line'].search(
            [('move_id', 'in', self.move_ids.ids)])

        moves = []
        for line in lines:
            move = {
                'date': line.date,
                'product': line.product_id.name,
                'from': str(line.location_id.location_id.name) + "/" + str(line.location_id.name),
                'to': str(line.location_dest_id.location_id.name) + "/" + str(line.location_dest_id.name),
                'quantity': line.qty_done
            }
            moves.append(move)
        print("Moves :", moves)
        for email in emails:
            data = {
                'email': email,
                'from': self.env.user.email,
                'moves': moves,
                'user': self.env.user.name
            }
            template = self.env.ref(
                'caspian_outlets.mail_template_inventory').sudo()
            print("Test", template)
            template.with_context(data).send_mail(
                self.id,  force_send=True)
        return res


class PurchaseOrder(models.Model):
    _inherit = 'purchase.order'

    def button_confirm(self):
        res = super(PurchaseOrder, self).button_confirm()
        message = self.env['mail.message'].create({
            'model': 'purchase.order',
            'res_id': int(self.id),
            'subject': self.name,
            'message_type': 'notification',
            'body': "%s has created/confirmed a purchase order"
                    % (self.env.user.name),
            'email_from': self.env.user.email
        })
        group = self.env.ref('pos_disable_all.group_admin')
        res_partner_ids = []
        for partner in group.users:
            res_partner_ids.append(partner.partner_id.id)
        emails = []
        for user in res_partner_ids:
            user_id = self.env['res.partner'].browse(user)
            emails.append(user_id.email)
            notification = self.env['mail.notification'].create({
                'mail_message_id': message.id,
                'notification_type': 'inbox',
                'res_partner_id': user
            })
        # lines = self.env['purchase.order'].search([])

        moves = []
        for line in self.order_line:
            move = {
                'date': self.date_order,
                'product': line.product_id.name,
                'unit price': line.price_unit,
                'subtotal': line.price_subtotal,
                'quantity': line.product_qty
            }
            moves.append(move)
        for email in emails:
            data = {
                'email': email,
                'from': self.env.user.email,
                'moves': moves,
                'user': self.env.user.name,
                'Total': self.amount_total,
            }
            template = self.env.ref(
                'caspian_outlets.mail_template_purchase').sudo()
            template.with_context(data).send_mail(
                self.id,  force_send=True)
        return res
