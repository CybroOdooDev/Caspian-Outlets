# -*- coding: utf-8 -*-

{
    'name': 'Caspian Outlets',
    'version': '14.0.1.0.0',
    'summary': """
        Restricts Documents on Expense and POS appropriately
    """,
    'description': """Expense report can only approved by certain person above a threshold amount
                      Only displays allocated POS Outlets  """,
    'author': 'Odoo SA,Cybrosys Techno Solutions',
    'company': 'Cybrosys Techno Solutions',
    'maintainer': 'Cybrosys Techno Solutions',
    'website': 'https://www.cybrosys.com',
    'depends': ['hr_expense', 'point_of_sale', 'pos_disable_all', 'purchase'],
    'data': [
        'views/hr_expense.xml',
        'views/assets.xml',
        'security/ir.model.access.csv',
        'data/data.xml',
        'data/mail_template.xml',
    ],
    'qweb': [
    ],
    'installable': True,
    'auto_install': False,
    'application': False,
    'license': 'AGPL-3',
}