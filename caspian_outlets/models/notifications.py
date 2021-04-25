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
