# -*- coding : utf-8 -*-

from odoo import models, fields


class PosRequest(models.Model):
    _name = 'pos.request'

    user_id = fields.Many2one('res.users', string="User")
    state = fields.Selection(selection=[('approved','Approved'), ('to_approve','To Approve')], string="Status", default='to_approve')
    disc_status = fields.Boolean(related='user_id.allow_discount')

    def action_allow(self):
        user = self.env['res.users'].search([('id', '=', self.user_id.id)])
        user.allow_discount = 1
        self.state = 'approved'
