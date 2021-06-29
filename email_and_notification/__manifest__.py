# -*- coding: utf-8 -*-

{
    'name': 'Emails and Notifications',
    'version': '14.0.1.0.0',
    'category': 'Point of Sale',
    'summary': """
        Mr Emmanuel's requirements on emails and notifications
    """,
    'description': """Includes:-
                    1)Email when someone update quantity
    				2)when purchased products are received""",
    'author': 'Cybrosys Techno Solutions',
    'company': 'Cybrosys Techno Solutions',
    'maintainer': 'Cybrosys Techno Solutions',
    'website': 'https://www.cybrosys.com',
    'depends': ['stock', 'purchase'],
    'data': [
        'data/mail_template.xml'
    ],
    'installable': True,
    'auto_install': False,
    'application': False,
    'license': 'AGPL-3',
}