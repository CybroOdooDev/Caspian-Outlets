odoo.define('pos_login_odoo.gui', function (require) {
    "use strict";

    const { configureGui } = require('point_of_sale.Gui');
    const Chrome = require('point_of_sale.Chrome');
    var core = require('web.core');
    var session = require('web.session');
    var _t = core._t;
    var rpc = require('web.rpc');
    var session_data = session.uid
    const Registries = require('point_of_sale.Registries');
    const { useListener } = require('web.custom_hooks');

    const gui = (Chrome) =>
        class extends Chrome {
            constructor() {
            super(...arguments);
//            console.log(this);
//            var self = this;
//            this.rpc({
//                model: 'hr.employee',
//                method: 'search',
//                args: [[['user_id', '=', this.env.session.uid]]]
//            }).then(function(result){
//                self.rpc({
//                model: 'hr.attendance',
//                method: 'search',
//                args: [[['employee_id', '=', result]]]
//                }).then(function(result){
//                    console.log("Result ", result[0]);
//                    self.rpc({
//                        model: 'hr.attendance',
//                        method: 'browse',
//                        args: [result]
//                    }).then(function(result){
//                        console.log("Result ", result);
//                    });
//                });
//            });
            }

            async _closePos() {
                var self = this;
//                self.employee_state = 'checked_out';
                var session_data = session.uid    
                    this.rpc({
                            model: 'res.users',
                            method: 'get_config_id',
                            args:  [1,session_data]
                        }).then(function(output) {

                             if(output === true){   
                                self.setLoadingProgress();
                                self.setLoadingMessage(_t('logging out ...'));

                                self.env.pos.push_orders().then(function(){
                                    var url = "/web/session/logout";
                                    window.location = session.debug ? $.param.querystring(url, {debug: session.debug}) : url;
                                });
                            }else{
                                self.setLoadingProgress();
                                self.setLoadingMessage(_t('Closing ...'));
                                self.env.pos.push_orders().then(function(){
                                var url = "/web#action=point_of_sale.action_client_pos_menu";
                                window.location = session.debug ? $.param.querystring(url, {debug: session.debug}) : url;
                                });
                                
                            }
                    });
                }
        }
    Registries.Component.extend(Chrome, gui);

    return Chrome;
});
