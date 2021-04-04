# -*- coding: utf-8 -*-

from odoo import models, api, _
from odoo.exceptions import UserError


class PoSCustomInvoice(models.AbstractModel):
    _name = 'report.pos_custom_invoice.report_invoice'
    _description = 'Point of Sale Custom Invoice Report'

    @api.model
    def print_invoice(self, docids, order_id, data=None):
        print("Test", docids, order_id)
        report = self.env['account.move'].sudo().browse(docids)
        print("Report :", report)
        return self.env.ref('account.account_invoices').report_action(self)

