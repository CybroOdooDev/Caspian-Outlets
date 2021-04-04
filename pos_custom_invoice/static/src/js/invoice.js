odoo.define('pos_custom_invoice.CustomInvoice', function (require){
    'use strict';

    const PosComponent = require('point_of_sale.PosComponent');
    const ProductScreen = require('point_of_sale.ProductScreen');
    const { useListener } = require('web.custom_hooks');
    const Registries = require('point_of_sale.Registries');
    const PaymentScreen = require('point_of_sale.PaymentScreen');

    const CustomInvoice = (PaymentScreen) =>
    class extends PaymentScreen {
       constructor (){
            super(...arguments);
            useListener('click', this.onClick);
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

        async onClick() {
            console.log("Invoice button clicked");
            this.currentOrder.set_to_invoice(!this.currentOrder.is_to_invoice());
            this.render();
            console.log(this.currentOrder.is_to_invoice());
            if (this.currentOrder.get_orderlines().length === 0) {
                this.showPopup('ErrorPopup', {
                    title: this.env._t('Empty Order'),
                    body: this.env._t(
                        'There must be at least one product to create an Invoice'
                    ),
                });
                return false;
            }

            if (this.currentOrder.is_to_invoice() && !this.currentOrder.get_client()) {
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

            console.log("Now print Invoice");
            this.invoice_order(this.currentOrder);
        }

        invoice_order(order) {
            var self = this;
            console.log("Order :", self);
            var order_id = self.env.pos.db.add_order(order.export_as_JSON());
            var transfer = self._flush_orders([self.env.pos.db.get_order(order_id)], {timeout:30000, to_invoice:true});

            let syncedOrderBackendIds = []
            syncedOrderBackendIds = this.push_and_invoice(this.currentOrder)

            console.log("Entho :", syncedOrderBackendIds)
            transfer.then(function(order_server_id){
                // generate the pdf and download it
                console.log("Transfer ", self);
                self.env.pos.rpc({
                    model: 'pos.order',
                    method: 'search',
                    args: [[['id', '=', order_server_id[0]]]],
                })
                .then(function(result) {
                    console.log("Result ", result);
//                    if (result.action) {
//                        self.do_action(result.action);
//                    } else if (result.warning) {
//                        self.do_warn(result.warning);
//                    }
                });
                if (order_server_id.length) {
                    self.env.pos.do_action('point_of_sale.report_invoice',{additional_context:{
                        active_ids:order_server_id,
                    }}).then(function () {
//                        resolveInvoiced(order_server_id);
//                        resolveDone();
                    }).guardedCatch(function (error) {
//                        rejectInvoiced({code:401, message:'Backend Invoice', data:{order: order}});
//                        rejectDone();
                    });
                } else if (order_server_id.length) {
//                    resolveInvoiced(order_server_id);
//                    resolveDone();
                } else {
                    // The order has been pushed separately in batch when
                    // the connection came back.
                    // The user has to go to the backend to print the invoice
//                    rejectInvoiced({code:401, message:'Backend Invoice', data:{order: order}});
//                    rejectDone();
                }
            });

        }

       _flush_orders(orders, options) {
            var self = this;
            this.set_synch('connecting', orders.length);

            return this._save_to_server(orders, options).then(function (server_ids) {
                self.set_synch('connected');
                for (let i = 0; i < server_ids.length; i++) {
                    self.env.pos.validated_orders_name_server_id_map[server_ids[i].pos_reference] = server_ids[i].id;
                }
                return _.pluck(server_ids, 'id');
            }).catch(function(error){
                self.set_synch(self.env.pos.get('failed') ? 'error' : 'disconnected');
                return Promise.reject(error);
            });
        }

       set_synch(status, pending) {
            if (['connected', 'connecting', 'error', 'disconnected'].indexOf(status) === -1) {
                console.error(status, ' is not a known connection state.');
            }
            pending = pending || this.env.pos.db.get_orders().length + this.env.pos.db.get_ids_to_remove_from_server().length;
            this.env.pos.set('synch', { status, pending });
        }

        _save_to_server(orders, options) {
            if (!orders || !orders.length) {
                return Promise.resolve([]);
            }

            options = options || {};

            var self = this;
            var timeout = typeof options.timeout === 'number' ? options.timeout : 30000 * orders.length;

            // Keep the order ids that are about to be sent to the
            // backend. In between create_from_ui and the success callback
            // new orders may have been added to it.
            var order_ids_to_sync = _.pluck(orders, 'id');

            // we try to send the order. shadow prevents a spinner if it takes too long. (unless we are sending an invoice,
            // then we want to notify the user that we are waiting on something )
            var args = [_.map(orders, function (order) {
                    order.to_invoice = options.to_invoice || false;
                    return order;
                })];
            args.push(options.draft || false);
            return this.rpc({
                    model: 'pos.order',
                    method: 'create_from_ui',
                    args: args,
                    kwargs: {context: this.env.session.user_context},
                }, {
                    timeout: timeout,
                    shadow: !options.to_invoice
                })
                .then(function (server_ids) {
                    _.each(order_ids_to_sync, function (order_id) {
                        self.env.pos.db.remove_order(order_id);
                    });
                    self.env.pos.set('failed',false);
                    return server_ids;
                }).catch(function (reason){
                    var error = reason.message;
                    console.warn('Failed to send orders:', orders);
                    if(error.code === 200 ){    // Business Logic Error, not a connection problem
                        // Hide error if already shown before ...
                        if ((!self.env.pos.get('failed') || options.show_error) && !options.to_invoice) {
                            self.set('failed',error);
                            throw error;
                        }
                    }
                    throw error;
                });
        }

        async push_and_invoice(order) {
            var self = this;
            var invoiced = new Promise(function (resolveInvoiced, rejectInvoiced) {
                if(!order.get_client()){
                    rejectInvoiced({code:400, message:'Missing Customer', data:{}});
                }
                else {
                    var order_id = self.env.pos.db.add_order(order.export_as_JSON());

                    self.env.pos.flush_mutex.exec(function () {
                        var done =  new Promise(function (resolveDone, rejectDone) {
                            // send the order to the server
                            // we have a 30 seconds timeout on this push.
                            // FIXME: if the server takes more than 30 seconds to accept the order,
                            // the client will believe it wasn't successfully sent, and very bad
                            // things will happen as a duplicate will be sent next time
                            // so we must make sure the server detects and ignores duplicated orders

                            var transfer = self.env.pos._flush_orders([self.env.pos.db.get_order(order_id)], {timeout:30000, to_invoice:true});

                            transfer.catch(function (error) {
                                rejectInvoiced(error);
                                rejectDone();
                            });

                            // on success, get the order id generated by the server
                            transfer.then(function(order_server_id){
                                // generate the pdf and download it
                                if (order_server_id.length) {
                                    self.env.pos.do_action('point_of_sale.report_invoice',{additional_context:{
                                        active_ids:order_server_id,
                                    }}).then(function () {
                                        resolveInvoiced(order_server_id);
                                        resolveDone();
                                    }).guardedCatch(function (error) {
                                        rejectInvoiced({code:401, message:'Backend Invoice', data:{order: order}});
                                        rejectDone();
                                    });
                                } else if (order_server_id.length) {
                                    resolveInvoiced(order_server_id);
                                    resolveDone();
                                } else {
                                    // The order has been pushed separately in batch when
                                    // the connection came back.
                                    // The user has to go to the backend to print the invoice
                                    rejectInvoiced({code:401, message:'Backend Invoice', data:{order: order}});
                                    rejectDone();
                                }
                            });
                            return done;
                        });
                    });
                }
            });

            return invoiced;
        }

   };

    class CustomInvoiceButton extends PosComponent{
        constructor (){
            super(...arguments);
            useListener('click', this.onClick);
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

        async onClick() {
            console.log("Invoice button clicked");
            this.currentOrder.set_to_invoice(true);
            this.render();
            console.log(this.currentOrder.is_to_invoice());
            if (this.currentOrder.get_orderlines().length === 0) {
                this.showPopup('ErrorPopup', {
                    title: this.env._t('Empty Order'),
                    body: this.env._t(
                        'There must be at least one product to create an Invoice'
                    ),
                });
                return false;
            }

            if (this.currentOrder.is_to_invoice() && !this.currentOrder.get_client()) {
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

            console.log("Now print Invoice");
            this.invoice_order(this.currentOrder);
        }

        async push_and_invoice(order) {
            var self = this;
            var invoiced = new Promise(function (resolveInvoiced, rejectInvoiced) {
                if(!order.get_client()){
                    rejectInvoiced({code:400, message:'Missing Customer', data:{}});
                }
                else {
                    var order_id = self.env.pos.db.add_order(order.export_as_JSON());

                    self.env.pos.flush_mutex.exec(function () {
                        var done =  new Promise(function (resolveDone, rejectDone) {
                            // send the order to the server
                            // we have a 30 seconds timeout on this push.
                            // FIXME: if the server takes more than 30 seconds to accept the order,
                            // the client will believe it wasn't successfully sent, and very bad
                            // things will happen as a duplicate will be sent next time
                            // so we must make sure the server detects and ignores duplicated orders

                            var transfer = self.env.pos._flush_orders([self.env.pos.db.get_order(order_id)], {timeout:30000, to_invoice:true});

                            transfer.catch(function (error) {
                                rejectInvoiced(error);
                                rejectDone();
                            });

                            // on success, get the order id generated by the server
                            transfer.then(function(order_server_id){
                                // generate the pdf and download it
                                if (order_server_id.length) {
                                    self.env.pos.do_action('point_of_sale.pos_invoice_report',{additional_context:{
                                        active_ids:order_server_id,
                                    }}).then(function () {
                                        resolveInvoiced(order_server_id);
                                        resolveDone();
                                    }).guardedCatch(function (error) {
                                        rejectInvoiced({code:401, message:'Backend Invoice', data:{order: order}});
                                        rejectDone();
                                    });
                                } else if (order_server_id.length) {
                                    resolveInvoiced(order_server_id);
                                    resolveDone();
                                } else {
                                    // The order has been pushed separately in batch when
                                    // the connection came back.
                                    // The user has to go to the backend to print the invoice
                                    rejectInvoiced({code:401, message:'Backend Invoice', data:{order: order}});
                                    rejectDone();
                                }
                            });
                            return done;
                        });
                    });
                }
            });

            return invoiced;
        }

       invoice_order(order) {
            var self = this;
            console.log("Order :", self);
            var order_id = self.env.pos.db.add_order(order.export_as_JSON());
            var transfer = self._flush_orders([self.env.pos.db.get_order(order_id)], {timeout:30000, to_invoice:true});

            let syncedOrderBackendIds = []
            syncedOrderBackendIds = this.push_and_invoice(this.currentOrder)

            console.log("Entho :", syncedOrderBackendIds)
            transfer.then(function(order_server_id){
                // generate the pdf and download it
                console.log("Transfer ", self);
                self.env.pos.rpc({
                    model: 'pos.order',
                    method: 'search',
                    args: [[['id', '=', order_server_id[0]]]],
                })
                .then(function(result) {
                    console.log("Result ", result);
//                    if (result.action) {
//                        self.do_action(result.action);
//                    } else if (result.warning) {
//                        self.do_warn(result.warning);
//                    }
                });
                if (order_server_id.length) {
                    self.env.pos.do_action('point_of_sale.report_invoice',{additional_context:{
                        active_ids:order_server_id,
                    }}).then(function () {
                        resolveInvoiced(order_server_id);
                        resolveDone();
                    }).guardedCatch(function (error) {
                        rejectInvoiced({code:401, message:'Backend Invoice', data:{order: order}});
                        rejectDone();
                    });
                } else if (order_server_id.length) {
                    resolveInvoiced(order_server_id);
                    resolveDone();
                } else {
                    // The order has been pushed separately in batch when
                    // the connection came back.
                    // The user has to go to the backend to print the invoice
                    rejectInvoiced({code:401, message:'Backend Invoice', data:{order: order}});
                    rejectDone();
                }
            });

        }

       _flush_orders(orders, options) {
            var self = this;
            this.set_synch('connecting', orders.length);

            return this._save_to_server(orders, options).then(function (server_ids) {
                self.set_synch('connected');
                for (let i = 0; i < server_ids.length; i++) {
                    self.env.pos.validated_orders_name_server_id_map[server_ids[i].pos_reference] = server_ids[i].id;
                }
                return _.pluck(server_ids, 'id');
            }).catch(function(error){
                self.set_synch(self.env.pos.get('failed') ? 'error' : 'disconnected');
                return Promise.reject(error);
            });
        }

       set_synch(status, pending) {
            if (['connected', 'connecting', 'error', 'disconnected'].indexOf(status) === -1) {
                console.error(status, ' is not a known connection state.');
            }
            pending = pending || this.env.pos.db.get_orders().length + this.env.pos.db.get_ids_to_remove_from_server().length;
            this.env.pos.set('synch', { status, pending });
        }

        _save_to_server(orders, options) {
            if (!orders || !orders.length) {
                return Promise.resolve([]);
            }

            options = options || {};

            var self = this;
            var timeout = typeof options.timeout === 'number' ? options.timeout : 30000 * orders.length;

            // Keep the order ids that are about to be sent to the
            // backend. In between create_from_ui and the success callback
            // new orders may have been added to it.
            var order_ids_to_sync = _.pluck(orders, 'id');

            // we try to send the order. shadow prevents a spinner if it takes too long. (unless we are sending an invoice,
            // then we want to notify the user that we are waiting on something )
            var args = [_.map(orders, function (order) {
                    order.to_invoice = options.to_invoice || false;
                    return order;
                })];
            args.push(options.draft || false);
            return this.rpc({
                    model: 'pos.order',
                    method: 'create_from_ui',
                    args: args,
                    kwargs: {context: this.env.session.user_context},
                }, {
                    timeout: timeout,
                    shadow: !options.to_invoice
                })
                .then(function (server_ids) {
                    _.each(order_ids_to_sync, function (order_id) {
                        self.env.pos.db.remove_order(order_id);
                    });
                    self.env.pos.set('failed',false);
                    return server_ids;
                }).catch(function (reason){
                    var error = reason.message;
                    console.warn('Failed to send orders:', orders);
                    if(error.code === 200 ){    // Business Logic Error, not a connection problem
                        // Hide error if already shown before ...
                        if ((!self.env.pos.get('failed') || options.show_error) && !options.to_invoice) {
                            self.set('failed',error);
                            throw error;
                        }
                    }
                    throw error;
                });
        }
    }

//    ProductScreen.addControlButton({
//        component: CustomInvoiceButton,
//        condition: function() {
//            return this.env.pos;
//        },
//    });

//    Registries.Component.add(CustomInvoiceButton);
    Registries.Component.extend(PaymentScreen, CustomInvoice);
    return CustomInvoice;
});