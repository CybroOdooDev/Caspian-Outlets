odoo.define('pos_custom_invoice.CustomInvoice', function(require) {
'use strict';

   const PosComponent = require('point_of_sale.PosComponent');
   const ProductScreen = require('point_of_sale.ProductScreen');
   const Registries = require('point_of_sale.Registries');
   var account_id;

   class CustomInvoiceButton extends PosComponent {
       constructor() {
           super(...arguments);
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

       get accountid() {
            var self = this;
            this.env.pos.rpc({
                model: 'account.account',
                method: 'search',
                args: [[]]
            }).then(function(result){
                console.log("account",result[0]);
                self.account_id = result[0];
            });
            return account_id;
       }

//       This function gets executed when the control button is clicked
       async IsCustomInvoice(){
            console.log("Current Order :", this.currentOrder);
            let order = this.currentOrder;
            let client = this.currentOrder.get_client();
            let currency_id = this.env.pos.company_currency.id;

            var self = this;
//            self.env.pos.rpc({
//                model: 'account.account',
//                method: 'search',
//                args: [[]]
//            }).then(function(result){
//                console.log("account",result);
//                self.account_id = result[0];
//            });

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
                            'tax_ids': value.product.taxes_id,
                        })
                    }
                    console.log("Line ", line)
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
                args: [[['draft_invoice', '=', 1]]]
            }).then(function(result){
                invoice_id = result;
                self.env.pos.rpc({
                    model: 'account.move',
                    method: 'unlink',   // Removing the previously generated invoice drafts
                    args: [invoice_id],
                });
            });

            self.env.pos.rpc({
                model: 'account.move',
                method: 'create',
                args: [{
                    'partner_id': client.id,
                    'currency_id': currency_id,
                    'state': 'draft',
                    'move_type': 'out_invoice',
                    'invoice_date': today,
                    'invoice_line_ids': invoice_lines,
                    'draft_invoice': 1,
                }]
            })
            .then(function(result) {
                invoice_id = result;
                let base_url = window.location.origin;
                let url = base_url+"/my/invoices/"+result+"?access_token=None&report_type=pdf&download=true";

                window.location.href = url; // Downloads the Invoice pdf
                setTimeout( function () {
                    self.env.pos.rpc({
                        model: 'account.move',
                        method: 'unlink',
                        args: [invoice_id],
                    }).then(function(){
                        console.log("Success", self);
                    });
                }, 3000); // Waiting for 3 seconds before deleting the generated draft invoice
            });

       }
   }
   CustomInvoiceButton.template = 'CustomInvoiceButton';
   ProductScreen.addControlButton({
       component: CustomInvoiceButton,
       condition: function() {
           return this.env.pos.config.pos_custom_invoice;
       },
   });
   Registries.Component.add(CustomInvoiceButton);
   return CustomInvoiceButton;
});
