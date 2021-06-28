# -*- coding: utf-8 -*-

{
    'name': 'Stock Request',
    'version': '14.0.1.0.0',
    'category': 'Inventory',
    'summary': """
        Mr Emmanuel's requirements on stock request from warehouse
    """,
    'description': """
        Mr Emmanuel's requirements on stock request from warehouse""",
    'author': 'Cybrosys Techno Solutions',
    'company': 'Cybrosys Techno Solutions',
    'maintainer': 'Cybrosys Techno Solutions',
    'website': 'https://www.cybrosys.com',
    'depends': ['stock'],
    'data': [
        'security/groups.xml',
        'security/ir.model.access.csv',
        'views/stock_request.xml',
        'data/mail_template.xml',
    ],
    'installable': True,
    'auto_install': False,
    'application': False,
    'license': 'AGPL-3',
}