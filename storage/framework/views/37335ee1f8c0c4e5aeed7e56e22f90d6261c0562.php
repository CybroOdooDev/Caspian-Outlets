<?php $__env->startSection('content'); ?>

<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <ul class="pages">
                    <li>
                        <a href="<?php echo e(route('front.index')); ?>">
                            <?php echo e($langg->lang17); ?>

                        </a>
                    </li>
                    <li>
                        <a href="<?php echo e(route('payment.return')); ?>">
                            <?php echo e($langg->lang169); ?>

                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Area End -->







<section class="tempcart">

    <?php if(!empty($tempcart)): ?>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <!-- Starting of Dashboard data-table area -->
                <div class="content-box section-padding add-product-1">
                    <div class="top-area">
                        <div class="content">
                            <h4 class="heading">
                                <?php echo e($langg->order_title); ?>

                            </h4>
                            <p class="text">
                                <?php echo e($langg->order_text); ?>

                            </p>
                            <a href="<?php echo e(route('front.index')); ?>" class="link"><?php echo e($langg->lang170); ?></a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">

                            <div class="product__header">
                                <div class="row reorder-xs">
                                    <div class="col-lg-12">
                                        <div class="product-header-title">
                                            <h2><?php echo e($langg->lang285); ?> <?php echo e($order->order_number); ?></h2>
                                        </div>
                                    </div>
                                    <?php echo $__env->make('includes.form-success', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
                                    <div class="col-md-12" id="tempview">
                                        <div class="dashboard-content">
                                            <div class="view-order-page" id="print">
                                                <p class="order-date"><?php echo e($langg->lang301); ?>

                                                    <?php echo e(date('d-M-Y',strtotime($order->created_at))); ?></p>


                                                <?php if($order->dp == 1): ?>

                                                <div class="billing-add-area">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <h5><?php echo e($langg->lang287); ?></h5>
                                                            <address>
                                                                <?php echo e($langg->lang288); ?> <?php echo e($order->customer_name); ?><br>
                                                                <?php echo e($langg->lang289); ?> <?php echo e($order->customer_email); ?><br>
                                                                <?php echo e($langg->lang290); ?> <?php echo e($order->customer_phone); ?><br>
                                                                <?php echo e($langg->lang291); ?> <?php echo e($order->customer_address); ?><br>
                                                                <?php echo e($order->customer_city); ?>-<?php echo e($order->customer_zip); ?>

                                                            </address>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <h5><?php echo e($langg->lang292); ?></h5>
                                                            <p><?php echo e($langg->lang293); ?>

                                                                <?php echo e($order->currency_sign); ?><?php echo e(round($order->pay_amount * $order->currency_value , 2)); ?>

                                                            </p>
                                                            <p><?php echo e($langg->lang294); ?> <?php echo e($order->method); ?></p>

                                                            <?php if($order->method != "Cash On Delivery"): ?>
                                                            <?php if($order->method=="Stripe"): ?>
                                                            <?php echo e($order->method); ?> <?php echo e($langg->lang295); ?> <p>
                                                                <?php echo e($order->charge_id); ?></p>
                                                            <?php endif; ?>
                                                            <?php echo e($order->method); ?> <?php echo e($langg->lang296); ?> <p id="ttn">
                                                                <?php echo e($order->txnid); ?></p>

                                                            <?php endif; ?>
                                                        </div>
                                                    </div>
                                                </div>

                                                <?php else: ?>
                                                <div class="delivery-add-area">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <?php if($order->delivery == "shipto"): ?>
                                                            <h5><?php echo e($langg->lang302); ?></h5>
                                                            <address>
                                                                <?php echo e($langg->lang288); ?>

                                                                <?php echo e($order->delivery_name == null ? $order->customer_name : $order->delivery_name); ?><br>
                                                                <?php echo e($langg->lang289); ?>

                                                                <?php echo e($order->delivery_email == null ? $order->customer_email : $order->delivery_email); ?><br>
                                                                <?php echo e($langg->lang290); ?>

                                                                <?php echo e($order->delivery_phone == null ? $order->customer_phone : $order->delivery_phone); ?><br>
                                                                <?php echo e($langg->lang291); ?>

                                                                <?php echo e($order->delivery_address == null ? $order->customer_address : $order->delivery_address); ?><br>
                                                                <?php echo e($order->delivery_city == null ? $order->customer_city : $order->delivery_city); ?>-<?php echo e($order->delivery_zip == null ? $order->customer_zip : $order->delivery_zip); ?>

                                                            </address>
                                                            <?php else: ?>
                                                            <h5><?php echo e($langg->lang303); ?></h5>
                                                            <address>
                                                                <?php echo e($langg->lang304); ?> <?php echo e($order->pickup_location); ?><br>
                                                            </address>
                                                            <?php endif; ?>

                                                        </div>
                                                        <div class="col-md-6">
                                                            <h5><?php echo e($langg->lang305); ?></h5>
                                                            <?php if($order->delivery == "shipto"): ?>
                                                            <p><?php echo e($langg->lang306); ?></p>
                                                            <?php else: ?>
                                                            <p><?php echo e($langg->lang307); ?></p>
                                                            <?php endif; ?>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="billing-add-area">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <h5><?php echo e($langg->lang287); ?></h5>
                                                            <address>
                                                                <?php echo e($langg->lang288); ?> <?php echo e($order->customer_name); ?><br>
                                                                <?php echo e($langg->lang289); ?> <?php echo e($order->customer_email); ?><br>
                                                                <?php echo e($langg->lang290); ?> <?php echo e($order->customer_phone); ?><br>
                                                                <?php echo e($langg->lang291); ?> <?php echo e($order->customer_address); ?><br>
                                                                <?php echo e($order->customer_city); ?>-<?php echo e($order->customer_zip); ?>

                                                            </address>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <h5><?php echo e($langg->lang292); ?></h5>
                                                            <p><?php echo e($langg->lang293); ?>

                                                                <?php echo e($order->currency_sign); ?><?php echo e(round($order->pay_amount * $order->currency_value , 2)); ?>

                                                            </p>
                                                            <p><?php echo e($langg->lang294); ?> <?php echo e($order->method); ?></p>

                                                            <?php if($order->method != "Cash On Delivery"): ?>
                                                            <?php if($order->method=="Stripe"): ?>
                                                            <?php echo e($order->method); ?> <?php echo e($langg->lang295); ?> <p>
                                                                <?php echo e($order->charge_id); ?></p>
                                                            <?php endif; ?>
                                                            <?php echo e($order->method); ?> <?php echo e($langg->lang296); ?> <p id="ttn">
                                                                <?php echo e($order->txnid); ?></p>

                                                            <?php endif; ?>
                                                        </div>
                                                    </div>
                                                </div>
                                                <?php endif; ?>
                                                <br>
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <h4 class="text-center"><?php echo e($langg->lang308); ?></h4>
                                                        <thead>
                                                            <tr>

                                                                <th width="60%"><?php echo e($langg->lang310); ?></th>
                                                                <th width="20%">Details</th>
                                                                <th width="10%"><?php echo e($langg->lang314); ?></th>
                                                                <th width="10%"><?php echo e($langg->lang315); ?></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>

                                                            <?php $__currentLoopData = $tempcart->items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                            <tr>

                                                                <td><?php echo e($product['item']['name']); ?></td>
                                                                <td>
                                                                    <b><?php echo e($langg->lang311); ?></b>: <?php echo e($product['qty']); ?>

                                                                    <br>
                                                                    <?php if(!empty($product['size'])): ?>
                                                                    <b><?php echo e($langg->lang312); ?></b>:
                                                                    <?php echo e($product['item']['measure']); ?><?php echo e($product['size']); ?>

                                                                    <br>
                                                                    <?php endif; ?>
                                                                    <?php if(!empty($product['color'])): ?>
                                                                    <div class="d-flex mt-2">
                                                                        <b><?php echo e($langg->lang313); ?></b>: <span
                                                                            id="color-bar"
                                                                            style="border: 10px solid <?php echo e($product['color'] == "" ? "white" : $product['color']); ?>;"></span>
                                                                    </div>
                                                                    <?php endif; ?>
                                                                </td>
                                                                <td><?php echo e($order->currency_sign); ?><?php echo e(round($product['item']['price'] * $order->currency_value,2)); ?>

                                                                </td>
                                                                <td><?php echo e($order->currency_sign); ?><?php echo e(round($product['price'] * $order->currency_value,2)); ?>

                                                                </td>

                                                            </tr>
                                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>



                                                        </tbody>
                                                    </table>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- Ending of Dashboard data-table area -->
            </div>

            <?php endif; ?>

</section>


<!--modal --->
<!-- Button trigger modal -->
<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button> -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<!-- end modal  -->

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.front', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>