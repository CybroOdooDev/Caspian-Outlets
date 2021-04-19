# -*- coding : utf-8 -*-

from odoo import models, fields
from odoo.osv import expression
from odoo import SUPERUSER_ID


class RelatedUser(models.Model):
    _inherit = 'pos.config'

    related_user_id = fields.One2many('res.users', 'pos_config')
