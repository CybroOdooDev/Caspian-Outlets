# -*- coding: utf-8 -*-

{
    'name': 'PoS Stock Quantity',
    'version': '14.0.1.0.0',
    'category': 'Point of Sale',
    'summary': """
        Displays the on-hand quantity of products in the POS Interface
    """,
    'description': """Displays the on-hand quantity""",
    'author': 'Odoo SA,Cybrosys Techno Solutions',
    'company': 'Cybrosys Techno Solutions',
    'maintainer': 'Cybrosys Techno Solutions',
    'website': 'https://www.cybrosys.com',
    'depends': ['point_of_sale'],
    'data': [
        'views/assets.xml'
    ],
    'qweb': [
        'static/src/xml/product_stock.xml',
    ],
    'installable': True,
    'auto_install': False,
    'application': False,
    'license': 'AGPL-3',
}