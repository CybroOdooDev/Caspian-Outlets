<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="<?php echo e($seo->meta_keys); ?>">
    <meta name="author" content="GeniusOcean">

    <title><?php echo e($gs->title); ?></title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="<?php echo e(asset('assets/print/bootstrap/dist/css/bootstrap.min.css')); ?>">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<?php echo e(asset('assets/print/font-awesome/css/font-awesome.min.css')); ?>">
    <!-- Ionicons -->
    <link rel="stylesheet" href="<?php echo e(asset('assets/print/Ionicons/css/ionicons.min.css')); ?>">
    <!-- Theme style -->
    <link rel="stylesheet" href="<?php echo e(asset('assets/print/css/style.css')); ?>">
    <link href="<?php echo e(asset('assets/print/css/print.css')); ?>" rel="stylesheet">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <link rel="icon" type="image/png" href="<?php echo e(asset('assets/images/'.$gs->favicon)); ?>">
    <style type="text/css">
        @page  {
            size: auto;
            margin: 0mm;
        }

        @page  {
            size: A4;
            margin: 0;
        }

        @media  print {

            html,
            body {
                width: 210mm;
                height: 287mm;
            }

            html {
                overflow: scroll;
                overflow-x: hidden;
            }

            ::-webkit-scrollbar {
                width: 0px;
                /* remove scrollbar space */
                background: transparent;
                /* optional: just make scrollbar invisible */
            }
    </style>
</head>

<body onload="window.print();">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <!-- Starting of Dashboard data-table area -->
                <div class="section-padding add-product-1">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                            <div class="product__header">
                                <div class="row reorder-xs">
                                    <div class="col-lg-8 col-md-5 col-sm-5 col-xs-12">
                                        <div class="product-header-title">
                                            <h2><?php echo e($langg->lang285); ?> <?php echo e($order->order_number); ?> [<?php echo e($order->status); ?>]</h2>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-10">
                                            <div class="dashboard-content">
                                                <div class="view-order-page" id="print">
                                                    <p class="order-date" style="margin-left: 2%"><?php echo e($langg->lang301); ?>

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
                                                                    <?php echo e($langg->lang291); ?>

                                                                    <?php echo e($order->customer_address); ?><br>
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
                                                    <div class="invoice__metaInfo">

                                                        <div class="col-md-6">
                                                            <h5><?php echo e($langg->lang287); ?></h5>
                                                            <address>
                                                                <?php echo e($langg->lang288); ?> <?php echo e($order->customer_name); ?><br>
                                                                <?php echo e($langg->lang289); ?> <?php echo e($order->customer_email); ?><br>
                                                                <?php echo e($langg->lang290); ?> <?php echo e($order->customer_phone); ?><br>
                                                                <?php echo e($langg->lang291); ?> <?php echo e($order->customer_address); ?><br>
                                                                <?php echo e($order->customer_city); ?>-<?php echo e($order->customer_zip); ?>

                                                            </address>

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

                                                        <div class="col-md-6" style="width: 50%;">
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

                                                            <h5><?php echo e($langg->lang305); ?></h5>
                                                            <?php if($order->delivery == "shipto"): ?>
                                                            <p><?php echo e($langg->lang306); ?></p>
                                                            <?php else: ?>
                                                            <p><?php echo e($langg->lang307); ?></p>
                                                            <?php endif; ?>

                                                        </div>






                                                    </div>

                                                    <?php endif; ?>
                                                    <br>
                                                    <br>
                                                    <div class="table-responsive">
                                                        <table id="example" class="table">
                                                            <h4 class="text-center"><?php echo e($langg->lang308); ?></h4>
                                                            <hr>
                                                            <thead>
                                                                <tr>
                                                                    <th width="10%"><?php echo e($langg->lang309); ?></th>
                                                                    <th><?php echo e($langg->lang310); ?></th>
                                                                    <th width="15%"><?php echo e($langg->lang311); ?></th>
                                                                    <th width="10%"><?php echo e($langg->lang312); ?></th>
                                                                    <th width="10%"><?php echo e($langg->lang313); ?></th>
                                                                    <th width="20%"><?php echo e($langg->lang314); ?></th>
                                                                    <th width="10%"><?php echo e($langg->lang315); ?></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>

                                                                <?php $__currentLoopData = $cart->items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                <tr>
                                                                    <td><?php echo e($product['item']['id']); ?></td>
                                                                    <td><?php echo e(strlen($product['item']['name']) > 25 ? substr($product['item']['name'],0,25).'...' : $product['item']['name']); ?>

                                                                    </td>
                                                                    <td><?php echo e($product['qty']); ?>

                                                                        <?php echo e($product['item']['measure']); ?></td>
                                                                    <td><?php echo e($product['size']); ?></td>
                                                                    <td><span
                                                                            style="width: 40px; height: 20px; display: block; border: 10px solid <?php echo e($product['color'] == "" ? "white" : $product['color']); ?>;"></span>
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
                </div>
                <!-- Ending of Dashboard data-table area -->
            </div>
            <!-- ./wrapper -->
            <!-- ./wrapper -->

            <script type="text/javascript">
                setTimeout(function () {
                    window.close();
                }, 500);
            </script>
</body>

</html>