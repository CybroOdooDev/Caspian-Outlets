# -*- coding: utf-8 -*-

{
    'name': 'Stock Request',
    'version': '14.0.1.1.0',
    'category': 'Inventory',
    'summary': """
        Mr Emmanuel's requirements on stock request from warehouse
    """,
    'description': """
        -Mr Emmanuel's requirements on stock request from warehouse
        -New state in purchase for purchase order with products received
        """,
    'author': 'Cybrosys Techno Solutions',
    'company': 'Cybrosys Techno Solutions',
    'maintainer': 'Cybrosys Techno Solutions',
    'website': 'https://www.cybrosys.com',
    'depends': ['stock', 'purchase'],
    'data': [
        'security/groups.xml',
        'security/ir.model.access.csv',
        'views/stock_request.xml',
        'data/mail_template.xml',
        'data/stock_request_data.xml',
    ],
    'installable': True,
    'auto_install': False,
    'application': False,
    'license': 'AGPL-3',
    'post_init_hook': '_update_purchase_order_state',
}
