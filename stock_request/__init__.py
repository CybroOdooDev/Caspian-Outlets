# -*- coding: utf-8 -*-

from . import models

from odoo import api, SUPERUSER_ID


def _update_purchase_order_state(cr, registry):
    """
    This hook is used to update state of purchase orders. The state of
    purchase orders, with receipts in done state, will be set as 'Received'.
    If there is any backorder, the state will be set as 'Partially Received'
    """
    env = api.Environment(cr, SUPERUSER_ID, {})
    purchase_order_ids = env['purchase.order'].search([])
    for purchase_order_id in purchase_order_ids:
        receipts_ids = env['stock.picking'].search(
            [('name', 'like', '/IN/'),
             ('origin', '=', purchase_order_id.name)])
        if receipts_ids:
            if all(receipt.state == 'done' for receipt in receipts_ids):
                purchase_order_id.write({'state': 'received'})
            elif any(receipt.state == 'done' for receipt in receipts_ids):
                purchase_order_id.write({'state': 'partial'})
