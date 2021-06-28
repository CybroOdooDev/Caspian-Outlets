# -*- coding: utf-8 -*-
# Part of Odoo. See LICENSE file for full copyright and licensing details.

from odoo import models, fields, api, _
from odoo.exceptions import UserError


class ResUsers(models.Model):
    _inherit = 'res.users'

    allow_qty_update = fields.Boolean('Allow Quantity Update', default=False)


class StockQuant(models.Model):
    _inherit = 'stock.quant'

    @api.onchange('inventory_quantity')
    def _onchange_inventory_quantity(self):
        if not self.env.user.allow_qty_update:
            raise UserError(_('You must have Quantity Update permission to write/modify the quantity available of a stock.'))


class ProductTemplate(models.Model):
    _inherit = 'product.template'

    allow_qty_update = fields.Boolean(string='Allow Quantity Update',
                                      compute='_compute_allow_qty_update')

    def _compute_allow_qty_update(self):
        self.allow_qty_update = self.env.user.allow_qty_update
