# -*- coding: utf-8 -*-

from odoo import api, fields, models


class LoginTime(models.Model):
    _inherit = 'res.users'

    login_start_time = fields.Float(string="Start Time")
    login_end_time = fields.Float(string="End Time")
