# -*- coding: utf-8 -*-

{
    'name': 'PoS Discount Request',
    'version': '14.0.1.0.0',
    'category': 'Point of Sale',
    'summary': """
        Cashier requests for discount
    """,
    'description': """Cashier can request supervisors to allow discounts""",
    'author': 'Odoo SA,Cybrosys Techno Solutions',
    'company': 'Cybrosys Techno Solutions',
    'maintainer': 'Cybrosys Techno Solutions',
    'website': 'https://www.cybrosys.com',
    'depends': ['pos_disable_all'],
    'data': [
        'views/requests.xml',
        'views/assets.xml',
        # 'views/pos_config.xml',
        'security/ir.model.access.csv',
        'security/security.xml',
    ],
    'qweb': [
        'static/src/xml/control_button.xml',
    ],
    'installable': True,
    # 'images': ['static/description/banner.png'],
    'auto_install': False,
    'application': False,
    'license': 'AGPL-3',
}