<?php $__env->startSection('styles'); ?>
<style type="text/css">


</style>


<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>


<section class="user-dashbord">
    <div class="container">
        <div class="row">
            <?php echo $__env->make('includes.user-dashboard-sidebar', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
            <div class="col-lg-8">
                <div class="user-profile-details">
                    <div class="order-history">
                        <div class="header-area">
                            <h4 class="title">
                                <?php echo e($langg->lang336); ?>

                                <a class="mybtn1" href="<?php echo e(route('user-wwt-index')); ?>"> <i class="fas fa-arrow-left"></i>
                                    <?php echo e($langg->lang337); ?></a>
                            </h4>
                        </div>

                        <div class="gocover"
                            style="background: url(<?php echo e(asset('assets/images/'.$gs->loader)); ?>) no-repeat scroll center center rgba(45, 45, 45, 0.5);">
                        </div>
                        <form id="userform" class="form-horizontal" action="<?php echo e(route('user-wwt-store')); ?>" method="POST"
                            enctype="multipart/form-data">

                            <?php echo e(csrf_field()); ?>


                            <?php echo $__env->make('includes.admin.form-both', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
                            <div class="form-group">
                                <label class="control-label col-sm-4" for="name"><?php echo e($langg->lang355); ?>

                                    <?php echo e(App\Models\Product::vendorConvertPrice(Auth::user()->affilate_income)); ?></label>
                            </div>



                            <div class="form-group">
                                <label class="control-label col-sm-4" for="name"><?php echo e($langg->lang338); ?> *

                                </label>
                                <div class="col-sm-12">
                                    <select class="form-control" name="methods" id="withmethod" required>
                                        <option value=""><?php echo e($langg->lang339); ?></option>
                                        <option value="Paypal"><?php echo e($langg->lang340); ?></option>
                                        <option value="Skrill"><?php echo e($langg->lang341); ?></option>
                                        <option value="Payoneer"><?php echo e($langg->lang342); ?></option>
                                        <option value="Bank"><?php echo e($langg->lang343); ?></option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-12" for="name"><?php echo e($langg->lang344); ?> *

                                </label>
                                <div class="col-sm-12">
                                    <input name="amount" placeholder="<?php echo e($langg->lang344); ?>" class="form-control"
                                        type="text" value="<?php echo e(old('amount')); ?>" required>
                                </div>
                            </div>

                            <div id="paypal" style="display: none;">

                                <div class="form-group">
                                    <label class="control-label col-sm-12" for="name"><?php echo e($langg->lang345); ?> *

                                    </label>
                                    <div class="col-sm-12">
                                        <input name="acc_email" placeholder="<?php echo e($langg->lang345); ?>" class="form-control"
                                            value="<?php echo e(old('email')); ?>" type="email">
                                    </div>
                                </div>

                            </div>
                            <div id="bank" style="display: none;">

                                <div class="form-group">
                                    <label class="control-label col-sm-12" for="name"><?php echo e($langg->lang346); ?> *

                                    </label>
                                    <div class="col-sm-12">
                                        <input name="iban" value="<?php echo e(old('iban')); ?>" placeholder="<?php echo e($langg->lang346); ?>"
                                            class="form-control" type="text">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-12" for="name"><?php echo e($langg->lang347); ?> *

                                    </label>
                                    <div class="col-sm-12">
                                        <input name="acc_name" value="<?php echo e(old('accname')); ?>"
                                            placeholder="<?php echo e($langg->lang347); ?>" class="form-control" type="text">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-12" for="name"><?php echo e($langg->lang348); ?> *

                                    </label>
                                    <div class="col-sm-12">
                                        <input name="address" value="<?php echo e(old('address')); ?>"
                                            placeholder="<?php echo e($langg->lang348); ?>" class="form-control" type="text">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-12" for="name"><?php echo e($langg->lang349); ?> *

                                    </label>
                                    <div class="col-sm-12">
                                        <input name="swift" value="<?php echo e(old('swift')); ?>"
                                            placeholder="<?php echo e($langg->lang349); ?>" class="form-control" type="text">
                                    </div>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-12" for="name"><?php echo e($langg->lang350); ?> *

                                </label>
                                <div class="col-sm-12">
                                    <textarea class="form-control" name="reference" rows="6"
                                        placeholder="<?php echo e($langg->lang350); ?>"><?php echo e(old('reference')); ?></textarea>
                                </div>
                            </div>

                            <div id="resp" class="col-md-12">

                                <span class="help-block">
                                    <strong><?php echo e($langg->lang351); ?> $<?php echo e($gs->withdraw_fee); ?> <?php echo e($langg->lang352); ?>

                                        <?php echo e($gs->withdraw_charge); ?>% <?php echo e($langg->lang353); ?></strong>
                                </span>
                            </div>

                            <hr>
                            <div class="add-product-footer">
                                <button name="addProduct_btn" type="submit"
                                    class="mybtn1"><?php echo e($langg->lang354); ?></button>
                            </div>
                        </form>




                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>


<script type="text/javascript">
    $("#withmethod").change(function () {
        var method = $(this).val();
        if (method == "Bank") {

            $("#bank").show();
            $("#bank").find('input, select').attr('required', true);

            $("#paypal").hide();
            $("#paypal").find('input').attr('required', false);

        }
        if (method != "Bank") {
            $("#bank").hide();
            $("#bank").find('input, select').attr('required', false);

            $("#paypal").show();
            $("#paypal").find('input').attr('required', true);
        }
        if (method == "") {
            $("#bank").hide();
            $("#paypal").hide();
        }

    })
</script>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.front', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>