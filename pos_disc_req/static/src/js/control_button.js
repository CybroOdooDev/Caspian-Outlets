odoo.define('pos_disc_req.RequestButton', function (require){
    "use strict";

    const PosComponent = require('point_of_sale.PosComponent');
    const ProductScreen = require('point_of_sale.ProductScreen');
    const Registries = require('point_of_sale.Registries');

    class RequestButton extends PosComponent {
        constructor() {
            super(...arguments);
        }

        async RequestDiscount() {
            var clicked = "True";
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
                console.log("Success ", result);
            })
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