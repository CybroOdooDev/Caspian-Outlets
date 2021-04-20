<?xml version="1.0" encoding="utf-8"?>
<templates id="template" xml:space="preserve">
    <t t-name="OrderReceipt" t-inherit="point_of_sale.OrderReceipt" t-inherit-mode="extension" owl="1">
        <xpath expr="//div[hasclass('orderlines')]" position="before">
            <t t-if="receipt.client">
                <div class="pos-receipt-center-align">
                    <div><t t-esc="receipt.client.name" /></div>
                    <t t-if="receipt.client.phone">
                        <div>
                            <span>Phone: </span>
                            <t t-esc="receipt.client.phone" />
                        </div>
                    </t>
                    <br />
                </div>
            </t>
        </xpath>
    </t>
</templates>
