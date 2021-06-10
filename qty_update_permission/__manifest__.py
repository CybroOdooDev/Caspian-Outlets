# -*- coding: utf-8 -*-

{
    'name': 'Quantity Update Permission',
    'version': '14.0.1.0.0',
    'category': 'Inventory',
    'summary': """
        Mr Emmanuel's requirements on permission for updating quantity
    """,
    'description': """
        Mr Emmanuel's requirements on permission for updating quantity, ie only the users with permission 
        can update quantity of product and this module also includes the permission for accountant to
        validate session""",
    'author': 'Cybrosys Techno Solutions',
    'company': 'Cybrosys Techno Solutions',
    'maintainer': 'Cybrosys Techno Solutions',
    'website': 'https://www.cybrosys.com',
    'depends': ['stock'],
    'data': [
        # 'security/stock_groups.xml',
        'security/ir.model.access.csv',
        'views/res_users.xml'
    ],
    'installable': True,
    'auto_install': False,
    'application': False,
    'license': 'AGPL-3',
}