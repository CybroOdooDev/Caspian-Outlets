odoo.define('pos_custom_invoice.CustomInvoice', function(require) {
'use strict';
   const { Gui } = require('point_of_sale.Gui');
   const PosComponent = require('point_of_sale.PosComponent');
   const { posbus } = require('point_of_sale.utils');
   const ProductScreen = require('point_of_sale.ProductScreen');
   const { useListener } = require('web.custom_hooks');
   const Registries = require('point_of_sale.Registries');
   const PaymentScreen = require('point_of_sale.PaymentScreen');
   class CustomInvoiceButton extends PosComponent {
       constructor() {
           super(...arguments);
//           useListener('click', this.onClick);
       }
       get currentOrder() {
            return this.env.pos.get_order();
       }
       get paymentLines() {
            return this.currentOrder.get_paymentlines();
       }
       get selectedPaymentLine() {
            return this.currentOrder.selected_paymentline;
       }

       async selectClient() {
            // IMPROVEMENT: This code snippet is repeated multiple times.
            // Maybe it's better to create a function for it.
            const currentClient = this.currentOrder.get_client();
            const { confirmed, payload: newClient } = await this.showTempScreen(
                'ClientListScreen',
                { client: currentClient }
            );
            if (confirmed) {
                this.currentOrder.set_client(newClient);
                this.currentOrder.updatePricelist(newClient);
            }
       }

       async IsCustomInvoice(){
            console.log("Current Order :", this.currentOrder);
            let order = this.currentOrder;
            let client = this.currentOrder.get_client();
            let currency_id = this.env.pos.company_currency.id;
            var self = this;
            var order_id = self.env.pos.db.add_order(order.export_as_JSON());

            if (this.currentOrder.get_orderlines().length === 0) {
                this.showPopup('ErrorPopup', {
                    title: this.env._t('Empty Order'),
                    body: this.env._t(
                        'There must be at least one product to create an Invoice'
                    ),
                });
                return false;
            }

            if (!this.currentOrder.get_client()) {
                const { confirmed } = await this.showPopup('ConfirmPopup', {
                    title: this.env._t('Please select the Customer'),
                    body: this.env._t(
                        'You need to select the customer before you can invoice an order.'
                    ),
                });
                if (confirmed) {
                    this.selectClient();
                }
                return false;
            }

            self.env.pos.rpc({
                model: 'pos.order',
                method: 'search',
                args: [[['name', '=', '/']]],
            }).then(function(result){
                self.env.pos.rpc({
                    model: 'pos.order',
                    method: 'unlink',
                    args: [result],
                }).then(function(){
                    console.log("Success");
                });
            });

            var size = Object.keys(this.currentOrder.orderlines._byId).length;
            let invoice_lines = [];
            var i = 0;
            for (let [key, value] of Object.entries(this.currentOrder.orderlines._byId)){
                if(i < size/2){
                    if(value.product.id){
                        var line = (0, 0, {
                            'product_id':value.product.id,
                            'name': value.product.display_name,
                            'price_unit': value.price,
                            'quantity': value.quantity,
                            'discount': value.discount,
                            'tax_ids': value.product.taxes_id
                        })
                    }

                    if(line){
                        invoice_lines.push(line);
                    }
                }
                i = i + 1;
            }
            var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0');
            var yyyy = today.getFullYear();
            var invoice_id;
            today = yyyy + '-' + mm + '-' + dd;
            self.env.pos.rpc({
                model: 'account.move',
                method: 'search',
                args: [[['payment_reference', '=', order_id]]]
            }).then(function(result){
                invoice_id = result;
                self.env.pos.rpc({
                    model: 'account.move',
                    method: 'unlink',
                    args: [invoice_id],
                });
            });

            self.env.pos.rpc({
                    model: 'account.move',
                    method: 'create',
                    args: [{
                        'partner_id': client.id,
                        'currency_id': currency_id,

//                            'name': "INV/"+order_id,
                        'state': 'draft',
                        'move_type': 'out_invoice',
                        'invoice_date': today,

                        'invoice_line_ids': invoice_lines,
                        'payment_reference': order_id
                    }]
                })
                .then(function(result) {
                    invoice_id = result;
                    let base_url = window.location.origin;
                    let url = base_url+"/my/invoices/"+result+"?access_token=None&report_type=pdf&download=true";

                    window.location.href = url;
                    setTimeout( function () {
                        self.env.pos.rpc({
                            model: 'account.move',
                            method: 'unlink',
                            args: [invoice_id],
                        }).then(function(){
                            console.log("Success");
                        });
                        self.env.pos.rpc({
                            model: 'pos.order',
                            method: 'search',
                            args: [[['name', '=', '/']]],
                        }).then(function(result){
                            self.env.pos.rpc({
                                model: 'pos.order',
                                method: 'unlink',
                                args: [result],
                            }).then(function(){
                                console.log("Success");
                            });
                        });
                    }, 3000);
                });
           self.env.pos.rpc({
                model: 'account.move',
                method: 'unlink',
                args: [invoice_id],
            }).then(function(){
                console.log("Success");
            });
       }
   }
   CustomInvoiceButton.template = 'CustomInvoiceButton';
   ProductScreen.addControlButton({
       component: CustomInvoiceButton,
       condition: function() {
           return this.env.pos;
       },
   });
   Registries.Component.add(CustomInvoiceButton);
   return CustomInvoiceButton;
});