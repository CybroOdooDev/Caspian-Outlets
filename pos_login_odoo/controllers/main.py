# -*- coding: utf-8 -*-
# Part of BrowseInfo. See LICENSE file for full copyright and licensing details.

from odoo import http,fields,_
import logging
from odoo.http import request
import datetime, time
from odoo.addons.website.controllers.main import Website
_logger = logging.getLogger(__name__)
from werkzeug.utils import redirect


class PosWebsiteLogin(Website):

    @http.route(website=True, auth="public")
    def web_login(self, redirect=None, *args, **kw):
        response = super(PosWebsiteLogin, self).web_login(redirect=redirect, *args, **kw)
        values = request.params.copy()
        login_start = request.env.user.login_start_time
        login_end = request.env.user.login_end_time
        time_obj = datetime.datetime.strptime(time.asctime(time.localtime(time.time())), "%a %b %d %H:%M:%S %Y")
        current_time = float(time_obj.time().strftime("%H.%M"))

        # print("Time : ", login_start)
        # print("Time : ", login_end)
        # print("Time : ", current_time)
        # print("Test 1 : ", login_start >= current_time)
        # print("Test 2 : ", login_end <= current_time)
        values = request.params.copy()
        session_id = request.env['pos.session'].sudo().search(
            [('state', '=', 'opened'), ('user_id', '=', request.uid)])
        if ((login_start <= current_time) or not login_start) and ((login_end >= current_time) or not login_end):
            if not redirect and request.params['login_success']:
                if request.env['res.users'].browse(request.uid).has_group(
                        'base.group_user'):
                    if request.env['res.users'].browse(request.uid).pos_config:
                        if session_id:
                            config_id = request.env['res.users'].browse(
                                request.uid).pos_config
                            config_id.open_existing_session_cb()
                            redirect = '/pos/web'
                        else:
                            config_id = request.env['res.users'].browse(
                                request.uid).pos_config
                            current_session_id = request.env[
                                'pos.session'].sudo().search(
                                [('state', '=', 'opened'),
                                 ('config_id', '=', config_id.id)])
                            if current_session_id:
                                request.session.logout(keep_db=True)
                                values[
                                    'error'] = "Another session is already opened for this point of sale!"
                                return request.render('web.login', values)
                            else:
                                config_id.open_session_cb()
                                redirect = '/pos/web'
                    else:
                        redirect = '/web?'
                else:
                    redirect = '/'
                return http.redirect_with_hash(redirect)
        else:
            config_id = request.env['res.users'].browse(
                request.uid).pos_config
            current_session_id = request.env[
                'pos.session'].sudo().search(
                [('state', '=', 'opened'),
                 ('config_id', '=', config_id.id)])
            if current_session_id:
                request.session.logout(keep_db=True)
                values['error'] = "You can't access PoS right now"
                return request.render('web.login', values)
        return response

    @http.route('/', type='http', auth='none')
    def direct_login(self):
        return redirect('/web/login')

# vim:expandtab:smartindent:tabstop=4:softtabstop=4:shiftwidth=4:
