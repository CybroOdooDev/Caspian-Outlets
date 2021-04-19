odoo.define('pos_disc_req.StockQty', function(require){
    'use strict';

    var models = require('point_of_sale.models');
    var _super_product = models.PosModel.prototype;

    models.PosModel = models.PosModel.extend({
        initialize: function(session, attributes){
            var self = this;
            console.log("Self ", self);
            models.load_fields('product.product', ['qty_available']);
            _super_product.initialize.apply(this, arguments);
        }
    });
});