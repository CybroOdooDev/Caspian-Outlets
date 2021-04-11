<?php $__env->startSection('content'); ?>

<section class="user-dashbord">
    <div class="container">
        <div class="row">
            <?php echo $__env->make('includes.user-dashboard-sidebar', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
            <div class="col-lg-8">
                <div class="user-profile-details">
                    <div class="account-info">
                        <div class="header-area">
                            <h4 class="title">
                                <?php echo e($langg->lang322); ?>

                            </h4>
                        </div>
                        <div class="edit-info-area">

                            <div class="body">
                                <div class="edit-info-area-form">
                                    <div class="gocover"
                                        style="background: url(<?php echo e(asset('assets/images/'.$gs->loader)); ?>) no-repeat scroll center center rgba(45, 45, 45, 0.5);">
                                    </div>
                                    <form>
                                        <?php echo $__env->make('includes.admin.form-both', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

                                        <div class="row">
                                            <div class="col-lg-4 text-right pt-2 f-14">
                                                <label><?php echo e($langg->lang323); ?></label>
                                                <br>
                                                <small><?php echo e($langg->lang324); ?></small>
                                            </div>
                                            <div class="col-lg-8 pt-2">
                                                <textarea class="input-field affilate" name="address" disabled=""
                                                    row="5"><?php echo e(url('/').'/?reff='.$user->affilate_code); ?></textarea>
                                            </div>
                                        </div>

                                        <div class="row pb-5">
                                            <div class="col-lg-4 text-right pt-2 f-14">
                                                <label><?php echo e($langg->lang325); ?></label>
                                                <br>
                                                <small><?php echo e($langg->lang326); ?></small>
                                            </div>
                                            <div class="col-lg-8 pt-2 pl-5">
                                                <a href="<?php echo e(url('/').'/?reff='.$user->affilate_code); ?>"
                                                    target="_blank"><img
                                                        src="<?php echo e(asset('assets/images/'.$gs->affilate_banner)); ?>"></a>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-4 text-right pt-2 f-14">
                                                <label><?php echo e($langg->lang327); ?></label>
                                                <br>
                                                <small><?php echo e($langg->lang328); ?></small>
                                            </div>
                                            <div class="col-lg-8 pt-2">
                                                <textarea class="input-field affilate" name="address" disabled=""
                                                    row="5"><a href="<?php echo e(url('/').'/?reff='.$user->affilate_code); ?>" target="_blank"><img src="<?php echo e(asset('assets/images/'.$gs->affilate_banner)); ?>"></a></textarea>
                                            </div>
                                        </div>


                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.front', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>