# -*- coding : utf-8 -*-

from odoo import http
from odoo.http import request


class NotificationUsers(http.Controller):

    @http.route('/get_users', auth='public', type='json', website=True)
    def get_users(self):
        group = request.env.ref('pos_disable_all.group_supervisor')
        print("group users ", group.users)
        res_partner_ids = []
        for partner in group.users:
            res_partner_ids.append(partner.partner_id.id)
        return res_partner_ids
