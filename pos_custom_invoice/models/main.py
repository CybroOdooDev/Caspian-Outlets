# -*- coding: utf-8 -*-

from odoo import models, fields


class DraftInvoice(models.Model):
    _inherit = 'account.move'

    draft_invoice = fields.Boolean("Draft Invoice")


class PosConfig(models.Model):
    _inherit = 'pos.config'

    pos_custom_invoice = fields.Boolean("Print Draft Invoice", default=1)