{
    'name': "Security Group for POS Cashier",
    'version': '14.0.1.0.0',
    'summary': """User Access""",
    'category': 'Inventory',
    'depends': ['stock', 'point_of_sale'],
# , 'pos_disable_all'
    'data': [
        'security/security.xml',
        'security/ir.model.access.csv',
        'views/views.xml'

    ],
    'installable': True,
    'auto_install': False,
    'application': False,
}
