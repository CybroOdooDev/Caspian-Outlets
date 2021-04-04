odoo.define('pos_custom_invoice', function (require){
    "use strict";

    const ProductScreen = require('point_of_sale.ProductScreen');
    const { useListener } = require('web.custom_hooks');
    const Registries = require('point_of_sale.Registries');
    const PaymentScreen = require('point_of_sale.PaymentScreen');

    const CustomInvoiceButton = (PaymentScreen) =>
    class extends PaymentScreen{
        constructor (){
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

        IsCustomInvoice(){
            console.log("Current Order :", this.currentOrder);
            let order = this.currentOrder;
            let client = this.currentOrder.get_client();
            let currency_id = this.env.pos.company_currency.id;
            var self = this;
            var order_id = self.env.pos.db.add_order(order.export_as_JSON());

            console.log("Order ID : ", order.id, "Client :", client);
            console.log("Test : ", Object.keys(this.currentOrder.orderlines._byId).length);
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
                            'discount': value.product.discount,
                            'tax_ids': value.product.taxes_id
                        })
                    }

                    if(line){
                        console.log(line);
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
                console.log("Invoice ID : ", result);
                invoice_id = result;
                self.env.pos.rpc({
                    model: 'account.move',
                    method: 'unlink',
                    args: [invoice_id],
                });
            });
            console.log("Invoice ID : ", invoice_id);
            if(typeof invoice_id != 'undefined'){
                console.log("Invoice ", result);
                let url = "http://localhost:8014/my/invoices/"+result+"?access_token=87a264eb-35e8-409b-82f1-7375bb3d1ae1&report_type=pdf&download=true";
//                    +"?access_token=87a264eb-35e8-409b-82f1-7375bb3d1ae1&report_type=pdf&download=true";
                window.location.href = url;
            }else if(typeof invoice_id == 'undefined'){
                self.env.pos.rpc({
                        model: 'account.move',
                        method: 'create',
                        args: [{
                            'partner_id': client.id,
                            'currency_id': currency_id,
    //                        # 'l10n_in_gst_treatment': 'consumer',
                            'name': "INV/"+order_id,
                            'state': 'draft',
                            'move_type': 'out_invoice',
                            'invoice_date': today,
    //                        # 'account_id': self.account_receivable.id,
                            'invoice_line_ids': invoice_lines,
                            'payment_reference': order_id
                        }]
                    })
                    .then(function(result) {
                        console.log("Invoice ", result);
                        invoice_id = result;
                        let url = "http://localhost:8014/my/invoices/"+result+"?access_token=87a264eb-35e8-409b-82f1-7375bb3d1ae1&report_type=pdf&download=true";
//    //                    +"?access_token=87a264eb-35e8-409b-82f1-7375bb3d1ae1&report_type=pdf&download=true";
                        window.location.href = url;
                        self.env.pos.rpc({
                            model: 'account.move',
                            method: 'unlink',
                            args: [invoice_id],
                        }).then(function(){
                            console.log("Success");
                        });
                    });
               }
               self.env.pos.rpc({
                    model: 'account.move',
                    method: 'unlink',
                    args: [invoice_id],
                }).then(function(){
                    console.log("Success");
                });
            };
    }

    Registries.Component.extend(PaymentScreen, CustomInvoiceButton);
    return CustomInvoiceButton;
});