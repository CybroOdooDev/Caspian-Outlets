# -*- coding: utf-8 -*-

{
    'name': 'Quantity Update Permission',
    'version': '14.0.1.0.0',
    'category': 'Inventory',
    'summary': """
        Mr Emmanuel's requirements on permission for updating quantity
    """,
    'description': """
        Mr Emmanuel's requirements on permission for updating quantity,
         ie only the users with permission can update quantity of product""",
    'author': 'Cybrosys Techno Solutions',
    'company': 'Cybrosys Techno Solutions',
    'maintainer': 'Cybrosys Techno Solutions',
    'website': 'https://www.cybrosys.com',
    'depends': ['stock'],
    'data': [
        'security/ir.model.access.csv',
        'views/product_views.xml',
        'security/stock_security.xml'
    ],
    'installable': True,
    'auto_install': False,
    'application': False,
    'license': 'AGPL-3',
}