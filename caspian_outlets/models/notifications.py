# -*- coding: utf-8 -*-

from odoo import models, fields, api


class PointOfSale(models.Model):
    _inherit = 'pos.session'

    def action_pos_session_closing_control(self):
        res = super(PointOfSale, self).action_pos_session_closing_control()

        message = self.env['mail.message'].create({
            'model': 'pos.session',
            'res_id': int(self.id),
            'subject': self.config_id.name+' session closed',
            'message_type':  'notification',
            'body': self.config_id.name+' session closed',
            'email_from': self.env.user.email
        })
        user_types_category = self.env.ref('pos_disable_all.group_admin',
                                           raise_if_not_found=False)
        group = self.env['res.groups'].search([('category_id', '=', user_types_category.id)])
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
            'subject': self.name,
            'message_type': 'notification',
            'body': self.env.user.name + " Submitted Expense report",
            'email_from': self.env.user.email
        })
        user_types_category = self.env.ref('pos_disable_all.group_admin',
                                           raise_if_not_found=False)
        group = self.env['res.groups'].search(
            [('category_id', '=', user_types_category.id)])
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