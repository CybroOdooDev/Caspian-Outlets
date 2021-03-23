# -*- coding: utf-8 -*-

from odoo import models, fields ,api


class PosDeliveryRegion(models.Model):
    _name = 'pos.delivery.region'

    name = fields.Char(string="Delivery Region", required=True)
    delivery_charges = fields.Float(string="Delivery Charges",required=True)
    product_id = fields.Many2one("product.product", string="Product",required=True)


class pos_config(models.Model):
    _inherit = 'pos.config' 
    
    delivery_region_ids = fields.Many2many('pos.delivery.region', 'pos_cofing_delivery_region','delivery_region_pos_cofing', string="Delivery Region")



class PosOrder(models.Model):
    _inherit = "pos.order"

    pos_delivery_region = fields.Many2one("pos.delivery.region","Delivery Region")

    @api.model
    def _order_fields(self,ui_order):
        fields = super(PosOrder,self)._order_fields(ui_order)
        if 'pos_delivery_region' in ui_order:
            fields['pos_delivery_region'] = ui_order.get('pos_delivery_region',False)
        return fields



