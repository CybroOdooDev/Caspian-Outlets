odoo.define('pos_disc_req.RequestButton', function (require){
    "use strict";

    const PosComponent = require('point_of_sale.PosComponent');
    const ProductScreen = require('point_of_sale.ProductScreen');
    const Registries = require('point_of_sale.Registries');
    var ajax = require('web.ajax');

    class RequestButton extends PosComponent {
        constructor() {
            super(...arguments);
        }

        async RequestDiscount() {
            var message;
            var self = this;
            var user_id = self.env.pos.user['id'];
            console.log("Button clicked", self);

            self.env.pos.rpc({
                model: 'pos.request',
                method: 'create',
                args: [{
                    'user_id': user_id
                }]
            }).then(function(result){
                console.log("Result ", result);
                self.env.pos.rpc({
                    model: 'mail.message',
                    method: 'create',
                    args: [{
                        'model': 'pos.request',
                        'res_id': result,
                        'subject': "New discount request!",
                        'message_type': 'notification',
                        'body': self.env.pos.user.name + " requests for discount",
                        'email_from': self.env.pos.user.email
                    }]
                }).then(function(result){
                    message = result;
                    console.log("Message created", result);
                    ajax.jsonRpc('/get_users', 'call', {})
                    .then(function(result){
                        console.log("USers ", result);
                        result.forEach( function (user, index){
                            self.env.pos.rpc({
                            model: 'mail.notification',
                            method: 'create',
                            args: [{
                                'mail_message_id': message,
                                'notification_type': 'inbox',
                                'res_partner_id': user
                            }]
                            }).then(function(result){
                                console.log("Notification send ", result);
                            });
                        });
                    });
                });
            });
        }
    }

    RequestButton.template = 'RequestButton';
    ProductScreen.addControlButton({
        component: RequestButton,
        condition: function () {
            return !this.env.pos.user.allow_discount
        }
    });

   Registries.Component.add(RequestButton);
   return RequestButton;

});