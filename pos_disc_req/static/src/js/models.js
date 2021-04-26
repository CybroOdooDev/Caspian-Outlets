odoo.define('pos_disc_req.AllowDisc', function(require){
    'use strict';

    const PosComponent = require('point_of_sale.PosComponent');
    const ProductScreen = require('point_of_sale.ProductScreen');
    const Registries = require('point_of_sale.Registries');

    class AllowDisc extends ProductScreen {
        constructor() {
            super(...arguments);
            console.log("Yey");
        }
    }

    Registries.Component.add(AllowDisc);
    return AllowDisc;
});