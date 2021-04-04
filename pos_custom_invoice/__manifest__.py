# -*- coding: utf-8 -*-

{
    'name': 'PoS Custom Invoice',
    'version': '14.0.1.0.0',
    'category': 'Point of Sale',
    'sequence': 6,
    'author': 'Sreerag',
    'company': 'Cybrosys Techno Solutions',
    'maintainer': 'Sreerag',
    'website': 'https://www.cybrosys.com',
    'summary': 'Generate invoice before validation',
    'description': "Invoice without validating / payment from PoS Interface",
    'depends': ['point_of_sale'],
    'data': [
        'views/views.xml',
        'views/report.xml',
    ],
    'qweb': [
        # 'static/src/xml/invoice.xml',
        'static/src/xml/invoice_button.xml'
    ],
    'images': [
    ],
    'installable': True,
    'auto_install': False,
    'license': 'AGPL-3',
}
