# -*- coding: utf-8 -*-

from odoo import models, fields


class HrExpense(models.Model):
    _name = 'hr.expense.limit'
    _rec_name = 'auth_user_id'

    auth_user_id = fields.Many2one('res.users', string="User")
    threshold_amount = fields.Float(string="Threshold Amount")


class ExpenseSheet(models.Model):
    _inherit = 'hr.expense.sheet'

    def _get_add_approve(self):
        self.add_approve = True
        limit = self.env['hr.expense.limit'].search([], limit=1)
        current_uid = self.env.context.get('uid', False)
        if self.total_amount >= limit.threshold_amount:
            if current_uid != limit.auth_user_id.id:
                self.add_approve = False

    add_approve = fields.Boolean(compute=_get_add_approve)