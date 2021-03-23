odoo.define('pos_delivery_charges.pos_delivery_charges', function (require) {
"use strict";
    var models = require('point_of_sale.models');
    const PosComponent = require('point_of_sale.PosComponent');
    const ProductScreen = require('point_of_sale.ProductScreen');
    const { useListener } = require('web.custom_hooks');
    const Registries = require('point_of_sale.Registries');
    var price_new;

    models.load_models([
        {
            model: 'pos.delivery.region',
            fields: ['id', 'name','delivery_charges','product_id'],
            domain: function(self){ return [['id','in', self.config.delivery_region_ids]]; },
            loaded: function (self, delivery_region) {
                self.delivery_region = delivery_region;
            },
        }
    ]);
    var OrderSuper = models.Order;
    models.Order = models.Order.extend({
        initialize: function(attributes,options){
            var result = OrderSuper.prototype.initialize.apply(this,arguments);
            this.selected_delivery_region = false;
            this.selected_delivery_region_name = false;
            return result;
            
        },
        export_for_printing:function(){
            var json = OrderSuper.prototype.export_for_printing.apply(this,arguments);
            json.pos_delivery_region = this.selected_delivery_region;
            json.selected_delivery_region_name = this.selected_delivery_region_name;
            return json;
        },
        export_as_JSON: function(){
            var json = OrderSuper.prototype.export_as_JSON.apply(this,arguments);
            json.pos_delivery_region = this.selected_delivery_region;
            return json;
        },
    });
    

    class SetDeliveryRegionButton extends PosComponent {
        constructor() {
            super(...arguments);
            useListener('click', this.onClick);
        }
        get currentOrder() {
            return this.env.pos.get_order();
        }
        async onClick() {
            var self = this;
            const selectionList = this.env.pos.delivery_region.map(delivery_region => ({
                id: delivery_region.id,
                label: delivery_region.name,
                isSelected: delivery_region.id === this.currentOrder.selected_delivery_region,
                item: delivery_region,
            }));

            const { confirmed, payload: selectedPricelist } = await this.showPopup(
                'SelectionPopup',
                {
                    title: this.env._t('Select the pricelist'),
                    list: selectionList,
                }
            );
            if (confirmed) {
                const { confirmed, payload: inputNote } = await this.showPopup('NumberPopup', {
                startingValue: selectedPricelist.delivery_charges,
                title: this.env._t('Add Delivery Charge'),
                });
                console.log("this :", this);
                if (confirmed) {
                    if(inputNote){
                        this.price_new = inputNote;
                    }
                    else
                    {
                        this.price_new = selectedPricelist.delivery_charges;
                    }

                }
                console.log("Here price: ", this.price_new);
                var product  = self.env.pos.db.get_product_by_id(selectedPricelist.product_id[0]);
                if (product === undefined) {
                    await self.showPopup('ErrorPopup', {
                        title : this.env._t("No delivery product found"),
                        body  : this.env._t("The delivery product seems misconfigured. Make sure it is flagged as 'Can be Sold' and 'Available in Point of Sale'."),
                    });
                    return;
                }
                var order = self.currentOrder
                var lines    = order.get_orderlines();
                // Remove existing discounts
                var i = 0;
                while ( i < lines.length ) {
                    if (lines[i].get_product() === product) {
                        order.remove_orderline(lines[i]);
                    } else {
                        i++;
                    }
                }
                order.add_product(product, {
//                    price: selectedPricelist.delivery_charges,
                    price: this.price_new,
                    extras: {
                        price_manually_set: true,
                    },
                });
                self.currentOrder.selected_delivery_region = selectedPricelist.id;
                self.currentOrder.selected_delivery_region_name = selectedPricelist.name;
            }
        }

        async DeliveryCharge(selectedPricelist){
             const { confirmed, payload: inputNote } = await this.showPopup('NumberPopup', {
                startingValue: selectedPricelist.delivery_charges,
                title: this.env._t('Add Delivery Charge'),
            });
            console.log("this :", this);
            if (confirmed) {
                if(inputNote){
                    this.price_new = inputNote;
                }
                else
                {
                    this.price_new = selectedPricelist.delivery_charges;
                }

            }
            console.log("price ", this.price_new);
            return this.price_new;
        }

        get currentPricelistName() {
            var name = this.env._t('Delivery Region');
            var order = this.env.pos.get_order();
            if (order) {
                if(order.selected_delivery_region_name){
                    name = order.selected_delivery_region_name
                }
            }

            return name;
        }
    }
    SetDeliveryRegionButton.template = 'SetDeliveryRegionButton';

    ProductScreen.addControlButton({
        component: SetDeliveryRegionButton,
        condition: function() {
            return this.env.pos.config.delivery_region_ids;
        },
    });

    Registries.Component.add(SetDeliveryRegionButton);
});

