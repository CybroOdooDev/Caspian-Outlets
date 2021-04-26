# -*- coding : utf-8 -*-

from odoo import models, fields, api


class PosRequest(models.Model):
    _name = 'pos.request'
    _rec_name = 'user_id'

    user_id = fields.Many2one('res.users', string="User")
    state = fields.Selection(selection=[('approved','Approved'), ('to_approve','To Approve')], string="Status", default='to_approve')

    def action_allow(self):
        user = self.env['res.users'].search([('id', '=', self.user_id.id)])
        user.allow_discount = 1
        self.state = 'approved'
        # user.refresh_page()


# class ReloadPoS(models.Model):
#     _inherit = 'res.users'
#
#     @api.onchange('allow_discount')
#     def refresh_page(self):
#         print("Hehehehe")
#         return {
#             'type': 'ir.actions.client',
#             'tag': 'reload'
#         }
