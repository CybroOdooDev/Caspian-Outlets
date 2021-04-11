<?php $__env->startSection('content'); ?>

<div class="content-area">
              <div class="mr-breadcrumb">
                <div class="row">
                  <div class="col-lg-12">
                      <h4 class="heading"><?php echo e(__('Email Configuration')); ?></h4>
                    <ul class="links">
                      <li>
                        <a href="<?php echo e(route('admin.dashboard')); ?>"><?php echo e(__('Dashboard')); ?> </a>
                      </li>
                      <li>
                        <a href="javascript:;"><?php echo e(__('Email Settings')); ?></a>
                      </li>
                      <li>
                        <a href="<?php echo e(route('admin-mail-config')); ?>"><?php echo e(__('Email Configuration')); ?></a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="add-product-content">
                <div class="row">
                  <div class="col-lg-12">
                    <div class="product-description">
                      <div class="body-area">
                        <div class="gocover" style="background: url(<?php echo e(asset('assets/images/'.$gs->admin_loader)); ?>) no-repeat scroll center center rgba(45, 45, 45, 0.5);"></div>
                        <form action="<?php echo e(route('admin-gs-update')); ?>" id="geniusform" method="POST" enctype="multipart/form-data">
                          <?php echo e(csrf_field()); ?>


                        <?php echo $__env->make('includes.admin.form-both', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>  

                        <div class="row justify-content-center">
                            <div class="col-lg-3">
                              <div class="left-area">
                                <h4 class="heading">
                                    <?php echo e(__('SMTP')); ?>

                                </h4>
                              </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="action-list">
                                    <select class="process select droplinks <?php echo e($gs->is_smtp == 1 ? 'drop-success' : 'drop-danger'); ?>">
                                      <option data-val="1" value="<?php echo e(route('admin-gs-issmtp',1)); ?>" <?php echo e($gs->is_smtp == 1 ? 'selected' : ''); ?>><?php echo e(__('Activated')); ?></option>
                                      <option data-val="0" value="<?php echo e(route('admin-gs-issmtp',0)); ?>" <?php echo e($gs->is_smtp == 0 ? 'selected' : ''); ?>><?php echo e(__('Deactivated')); ?></option>
                                    </select>
                                  </div>
                            </div>
                          </div>
                       

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('SMTP Host')); ?> *
                                  </h4>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <input type="text" class="input-field" placeholder="<?php echo e(__('SMTP Host')); ?>" name="smtp_host" value="<?php echo e($gs->smtp_host); ?>" required="">
                          </div>
                        </div>

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('SMTP Port')); ?> *
                                  </h4>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <input type="text" class="input-field" placeholder="<?php echo e(__('SMTP Port')); ?> " name="smtp_port" value="<?php echo e($gs->smtp_port); ?>" required="">
                          </div>
                        </div>

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('SMTP Username')); ?> *
                                  </h4>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <input type="text" class="input-field" placeholder="<?php echo e(__('SMTP Username')); ?> " name="smtp_user" value="<?php echo e($gs->smtp_user); ?>" required="">
                          </div>
                        </div>

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('SMTP Password')); ?> *
                                  </h4>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <input type="text" class="input-field" placeholder="<?php echo e(__('SMTP Password')); ?> " name="smtp_pass" value="<?php echo e($gs->smtp_pass); ?>" required="">
                          </div>
                        </div>

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('From Email')); ?> *
                                  </h4>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <input type="text" class="input-field" placeholder="<?php echo e(__('From Email')); ?> " name="from_email" value="<?php echo e($gs->from_email); ?>" required="">
                          </div>
                        </div>

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('From Name')); ?> *
                                  </h4>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <input type="text" class="input-field" placeholder="<?php echo e(__('From Name')); ?> " name="from_name" value="<?php echo e($gs->from_name); ?>" required="">
                          </div>
                        </div>

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                              
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <button class="addProductSubmit-btn" type="submit"><?php echo e(__('Submit')); ?></button>
                          </div>
                        </div>
                     </form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.admin', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>