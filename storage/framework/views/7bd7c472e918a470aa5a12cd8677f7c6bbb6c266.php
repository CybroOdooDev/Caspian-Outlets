<?php $__env->startSection('content'); ?>
<div class="content-area">
    <div class="mr-breadcrumb">
        <div class="row">
            <div class="col-lg-12">
                <h4 class="heading"><?php echo e(__('Order Invoice')); ?> <a class="add-btn" href="javascript:history.back();"><i
                            class="fas fa-arrow-left"></i> <?php echo e(__('Back')); ?></a></h4>
                <ul class="links">
                    <li>
                        <a href="<?php echo e(route('admin.dashboard')); ?>"><?php echo e(__('Dashboard')); ?> </a>
                    </li>
                    <li>
                        <a href="javascript:;"><?php echo e(__('Orders')); ?></a>
                    </li>
                    <li>
                        <a href="javascript:;"><?php echo e(__('Invoice')); ?></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="order-table-wrap">
        <div class="invoice-wrap">
            <div class="invoice__title">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="invoice__logo text-left">
                           <img src="<?php echo e(asset('assets/images/'.$gs->invoice_logo)); ?>" alt="woo commerce logo">
                        </div>
                    </div>
                    <div class="col-lg-6 text-right">
                        <a class="btn  add-newProduct-btn print" href="<?php echo e(route('admin-order-print',$order->id)); ?>"
                        target="_blank"><i class="fa fa-print"></i> <?php echo e(__('Print Invoice')); ?></a>
                    </div>
                </div>
            </div>
            <br>
            <div class="row invoice__metaInfo mb-4">
                <div class="col-lg-6">
                    <div class="invoice__orderDetails">
                        
                        <p><strong><?php echo e(__('Order Details')); ?> </strong></p>
                        <span><strong><?php echo e(__('Invoice Number')); ?> :</strong> <?php echo e(sprintf("%'.08d", $order->id)); ?></span><br>
                        <span><strong><?php echo e(__('Order Date')); ?> :</strong> <?php echo e(date('d-M-Y',strtotime($order->created_at))); ?></span><br>
                        <span><strong><?php echo e(__('Order ID')); ?> :</strong> <?php echo e($order->order_number); ?></span><br>
                        <?php if($order->dp == 0): ?>
                        <span> <strong><?php echo e(__('Delivery Method')); ?> :</strong>
                            <?php if($order->delivery == "pickup"): ?>
                            <?php echo e(__('Pick Up')); ?>

                            <?php else: ?>
                            <?php echo e(__('Deliver To Address')); ?>

                            <?php endif; ?>
                        </span><br>
                        <?php endif; ?>
                        <span> <strong><?php echo e(__('Payment Method')); ?> :</strong> <?php echo e($order->method); ?></span>
                    </div>
                </div>
            </div>
            <div class="row invoice__metaInfo">
           <?php if($order->dp == 0): ?>
                <div class="col-lg-6">
                        <div class="invoice__delivery">
                            <p><strong><?php echo e(__('Delivery Address')); ?></strong></p>
                           <span><strong><?php echo e(__('Customer Name')); ?></strong>: <?php echo e($order->delivery_name == null ? $order->customer_name : $order->delivery_name); ?></span><br>
                           <span><strong><?php echo e(__('Address')); ?></strong>: <?php echo e($order->delivery_address == null ? $order->customer_address : $order->delivery_address); ?></span><br>
                           <span><strong><?php echo e(__('City')); ?></strong>: <?php echo e($order->delivery_city == null ? $order->customer_city : $order->delivery_city); ?></span><br>
                           <span><strong><?php echo e(__('Country')); ?></strong>: <?php echo e($order->delivery_country == null ? $order->customer_country : $order->delivery_country); ?></span>

                        </div>
                </div>

            <?php endif; ?>

                <div class="col-lg-6">
                        <div class="buyer">
                            <p><strong><?php echo e(__('Billing Details')); ?></strong></p>
                            <span><strong><?php echo e(__('Customer Name')); ?></strong>: <?php echo e($order->customer_name); ?></span><br>
                            <span><strong><?php echo e(__('Address')); ?></strong>: <?php echo e($order->customer_address); ?></span><br>
                            <span><strong><?php echo e(__('City')); ?></strong>: <?php echo e($order->customer_city); ?></span><br>
                            <span><strong><?php echo e(__('Country')); ?></strong>: <?php echo e($order->customer_country); ?></span>
                        </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <div class="invoice_table">
                        <div class="mr-table">
                            <div class="table-responsive">
                                <table id="example2" class="table table-hover dt-responsive" cellspacing="0"
                                    width="100%" >
                                    <thead>
                                        <tr>
                                            <th><?php echo e(__('Product')); ?></th>
                                            <th><?php echo e(__('Details')); ?></th>
                                            <th><?php echo e(__('Total')); ?></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $subtotal = 0;
                                        $tax = 0;
                                        ?>
                                        <?php $__currentLoopData = $cart->items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <tr>
                                            <td width="50%">
                                                <?php if($product['item']['user_id'] != 0): ?>
                                                <?php
                                                $user = App\Models\User::find($product['item']['user_id']);
                                                ?>
                                                <?php if(isset($user)): ?>
                                                <a target="_blank"
                                                    href="<?php echo e(route('front.product', $product['item']['slug'])); ?>"><?php echo e($product['item']['name']); ?></a>
                                                <?php else: ?>
                                                <a href="javascript:;"><?php echo e($product['item']['name']); ?></a>
                                                <?php endif; ?>

                                                <?php else: ?>
                                                <a href="javascript:;"><?php echo e($product['item']['name']); ?></a>

                                                <?php endif; ?>
                                            </td>


                                            <td>
                                                <?php if($product['size']): ?>
                                               <p>
                                                    <strong>Size :</strong> <?php echo e($product['size']); ?>

                                               </p>
                                               <?php endif; ?>
                                               <?php if($product['color']): ?>
                                                <p>
                                                        <strong>color :</strong> <span
                                                        style="width: 40px; height: 20px; display: block; background: <?php echo e($product['color']); ?>;"></span>
                                                </p>
                                                <?php endif; ?>
                                                <p>
                                                        <strong>Price :</strong> <?php echo e($order->currency_sign); ?><?php echo e(round($product['item']['price'] * $order->currency_value , 2)); ?>

                                                </p>
                                               <p>
                                                    <strong>Qty :</strong> <?php echo e($product['qty']); ?> <?php echo e($product['item']['measure']); ?>

                                               </p>
                                            </td>




                                      
                                            <td><?php echo e($order->currency_sign); ?><?php echo e(round($product['price'] * $order->currency_value , 2)); ?>

                                            </td>
                                            <?php
                                            $subtotal += round($product['price'] * $order->currency_value, 2);
                                            ?>

                                        </tr>

                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </tbody>

                                    <tfoot>
                                        <tr>
                                            <td colspan="2"><?php echo e(__('Subtotal')); ?></td>
                                            <td><?php echo e($order->currency_sign); ?><?php echo e(round($subtotal, 2)); ?></td>
                                        </tr>
                                        <?php if($order->delivery_cost != 0): ?>
                                        <tr>
                                            <td colspan="2"><?php echo e(__('Delivery Cost')); ?>(<?php echo e($order->currency_sign); ?>)</td>
                                            <td><?php echo e(round($order->delivery_cost , 2)); ?></td>
                                        </tr>
                                        <?php endif; ?>

                                        <?php if($order->packing_cost != 0): ?>
                                        <tr>
                                            <td colspan="2"><?php echo e(__('Packaging Cost')); ?>(<?php echo e($order->currency_sign); ?>)</td>
                                            <td><?php echo e(round($order->packing_cost , 2)); ?></td>
                                        </tr>
                                        <?php endif; ?>

                                        <?php if($order->tax != 0): ?>
                                        <tr>
                                            <td colspan="2"><?php echo e(__('TAX')); ?>(<?php echo e($order->currency_sign); ?>)</td>
                                            <?php
                                            $tax = ($subtotal / 100) * $order->tax;
                                            ?>
                                            <td><?php echo e(round($tax, 2)); ?></td>
                                        </tr>
                                        <?php endif; ?>
                                        <?php if($order->coupon_discount != null): ?>
                                        <tr>
                                            <td colspan="2"><?php echo e(__('Coupon Discount')); ?>(<?php echo e($order->currency_sign); ?>)</td>
                                            <td><?php echo e(round($order->coupon_discount, 2)); ?></td>
                                        </tr>
                                        <?php endif; ?>
                                        <tr>
                                            <td colspan="1"></td>
                                            <td><?php echo e(__('Total')); ?></td>
                                            <td><?php echo e($order->currency_sign); ?><?php echo e(round($order->pay_amount * $order->currency_value , 2)); ?>

                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Main Content Area End -->
</div>
</div>
</div>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.admin', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>