<?php $__env->startSection('styles'); ?>

<style type="text/css">
.img-upload #image-preview {
  background-size: unset !important;
  }
</style>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>

<div class="content-area">
              <div class="mr-breadcrumb">
                <div class="row">
                  <div class="col-lg-12">
                      <h4 class="heading"><?php echo e(__('Payment Informations')); ?></h4>
                    <ul class="links">
                      <li>
                        <a href="<?php echo e(route('admin.dashboard')); ?>"><?php echo e(__('Dashboard')); ?> </a>
                      </li>
                      <li>
                        <a href="javascript:;"><?php echo e(__('Payment Settings')); ?></a>
                      </li>
                      <li>
                        <a href="<?php echo e(route('admin-gs-payments')); ?>"><?php echo e(__('Payment Informations')); ?></a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="add-product-content social-links-area">
                <div class="row">
                  <div class="col-lg-12">
                    <div class="product-description">
                      <div class="body-area">
                        <div class="gocover" style="background: url(<?php echo e(asset('assets/images/'.$gs->admin_loader)); ?>) no-repeat scroll center center rgba(45, 45, 45, 0.5);"></div>
                        <form action="<?php echo e(route('admin-gs-update-payment')); ?>" id="geniusform" method="POST" enctype="multipart/form-data">
                          <?php echo e(csrf_field()); ?>


                        <?php echo $__env->make('includes.admin.form-both', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>  


                        <div class="row justify-content-center">
                            <div class="col-lg-3">
                              <div class="left-area">
                                <h4 class="heading">
                                    <?php echo e(__('Stripe')); ?>

                                </h4>
                              </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="action-list">
                                    <select class="process select droplinks <?php echo e($gs->stripe_check == 1 ? 'drop-success' : 'drop-danger'); ?>">
                                      <option data-val="1" value="<?php echo e(route('admin-gs-stripe',1)); ?>" <?php echo e($gs->stripe_check == 1 ? 'selected' : ''); ?>><?php echo e(__('Activated')); ?></option>
                                      <option data-val="0" value="<?php echo e(route('admin-gs-stripe',0)); ?>" <?php echo e($gs->stripe_check == 0 ? 'selected' : ''); ?>><?php echo e(__('Deactivated')); ?></option>
                                    </select>
                                  </div>
                            </div>
                          </div>


                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('Stripe Key')); ?> *
                                  </h4>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <input type="text" class="input-field" placeholder="<?php echo e(__('Stripe Key')); ?>" name="stripe_key" value="<?php echo e($gs->stripe_key); ?>" required="">
                          </div>
                        </div>

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('Stripe Secret')); ?> *
                                  </h4>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <input type="text" class="input-field" placeholder="<?php echo e(__('Stripe Secret')); ?>" name="stripe_secret" value="<?php echo e($gs->stripe_secret); ?>" required="">
                          </div>
                        </div>


                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('Stripe Text')); ?> *</h4>

                            </div>
                          </div>
                          <div class="col-lg-6">
                            <textarea class="input-field" name="stripe_text" placeholder="<?php echo e(__('Stripe Text')); ?>"><?php echo e($gs->stripe_text); ?></textarea>

                          </div>
                        </div>


<hr>


                        <div class="row justify-content-center">
                            <div class="col-lg-3">
                              <div class="left-area">
                                <h4 class="heading">
                                    <?php echo e(__('Paypal')); ?>

                                </h4>
                              </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="action-list">
                                    <select class="process select droplinks <?php echo e($gs->paypal_check == 1 ? 'drop-success' : 'drop-danger'); ?>">
                                      <option data-val="1" value="<?php echo e(route('admin-gs-paypal',1)); ?>" <?php echo e($gs->paypal_check == 1 ? 'selected' : ''); ?>><?php echo e(__('Activated')); ?></option>
                                      <option data-val="0" value="<?php echo e(route('admin-gs-paypal',0)); ?>" <?php echo e($gs->paypal_check == 0 ? 'selected' : ''); ?>><?php echo e(__('Deactivated')); ?></option>
                                    </select>
                                  </div>
                            </div>
                          </div>  

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('Paypal User Name')); ?> *
                                  </h4>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <input type="text" class="input-field" placeholder="<?php echo e(__('Paypal User Name')); ?>" name="paypal_username" value="<?php echo e($gs->paypal_username); ?>" required="">
                          </div>
                        </div>


                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('Paypal Password')); ?> *
                                  </h4>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <input type="text" class="input-field" placeholder="<?php echo e(__('Paypal Password')); ?>" name="paypal_password" value="<?php echo e($gs->paypal_password); ?>" required="">
                          </div>
                        </div>

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('Paypal Secret Key')); ?> *
                                  </h4>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <input type="text" class="input-field" placeholder="<?php echo e(__('Paypal Secret Key')); ?>" name="paypal_secret" value="<?php echo e($gs->paypal_secret); ?>" required="">
                          </div>
                        </div>


                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('Paypal Text')); ?> *</h4>

                            </div>
                          </div>
                          <div class="col-lg-6">
                            <textarea class="input-field" name="paypal_text" placeholder="<?php echo e(__('Paypal Text')); ?>"><?php echo e($gs->paypal_text); ?></textarea>

                          </div>
                        </div>


                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('Paypal Sandbox Check')); ?> *
                                  </h4>
                            </div>
                          </div>

                          <div class="col-lg-6">
                            <label class="switch">
                              <input type="checkbox" name="paypal_mode" value="1" <?php echo e($gs->paypal_mode == 'sandbox' ? "checked":""); ?>>
                              <span class="slider round"></span>
                            </label>
                          </div>
                          </div>



<hr>

                        <div class="row justify-content-center">
                            <div class="col-lg-3">
                              <div class="left-area">
                                <h4 class="heading">
                                    <?php echo e(__('Instamojo')); ?>

                                </h4>
                              </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="action-list">
                                    <select class="process select droplinks <?php echo e($gs->is_instamojo == 1 ? 'drop-success' : 'drop-danger'); ?>">
                                      <option data-val="1" value="<?php echo e(route('admin-gs-instamojo',1)); ?>" <?php echo e($gs->is_instamojo == 1 ? 'selected' : ''); ?>><?php echo e(__('Activated')); ?></option>
                                      <option data-val="0" value="<?php echo e(route('admin-gs-instamojo',0)); ?>" <?php echo e($gs->is_instamojo == 0 ? 'selected' : ''); ?>><?php echo e(__('Deactivated')); ?></option>
                                    </select>
                                  </div>
                            </div>
                          </div> 

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('Instamojo API Key ')); ?>*
                                  </h4>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <input type="text" class="input-field" placeholder="<?php echo e(__('Instamojo API Key')); ?>" name="instamojo_key" value="<?php echo e($gs->instamojo_key); ?>" required="">
                          </div>
                        </div>

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('Instamojo Auth Token')); ?> *
                                  </h4>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <input type="text" class="input-field" placeholder="<?php echo e(__('Instamojo Auth Token')); ?>" name="instamojo_token" value="<?php echo e($gs->instamojo_token); ?>" required="">
                          </div>
                        </div>


                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('Instamojo Text')); ?> *</h4>

                            </div>
                          </div>
                          <div class="col-lg-6">
                            <textarea class="input-field" name="instamojo_text" placeholder="<?php echo e(__('Instamojo Text')); ?>"><?php echo e($gs->instamojo_text); ?></textarea>

                          </div>
                        </div>

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('Instamojo Sandbox Check')); ?> *
                                  </h4>
                            </div>
                          </div>

                          <div class="col-lg-6">
                            <label class="switch">
                              <input type="checkbox" name="instamojo_sandbox" value="1" <?php echo e($gs->instamojo_sandbox == 1 ? "checked":""); ?>>
                              <span class="slider round"></span>
                            </label>
                          </div>
                          </div>


<hr>


                        <div class="row justify-content-center">
                            <div class="col-lg-3">
                              <div class="left-area">
                                <h4 class="heading">
                                    <?php echo e(__('Paystack')); ?>

                                </h4>
                              </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="action-list">
                                    <select class="process select droplinks <?php echo e($gs->is_paystack == 1 ? 'drop-success' : 'drop-danger'); ?>">
                                      <option data-val="1" value="<?php echo e(route('admin-gs-paystack',1)); ?>" <?php echo e($gs->is_paystack == 1 ? 'selected' : ''); ?>><?php echo e(__('Activated')); ?></option>
                                      <option data-val="0" value="<?php echo e(route('admin-gs-paystack',0)); ?>" <?php echo e($gs->is_paystack == 0 ? 'selected' : ''); ?>><?php echo e(__('Deactivated')); ?></option>
                                    </select>
                                  </div>
                            </div>
                          </div> 


                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('Paystack Public Key')); ?> *
                                  </h4>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <input type="text" class="input-field" placeholder="<?php echo e(__('Paystack Public Key')); ?>" name="paystack_key" value="<?php echo e($gs->paystack_key); ?>" required="">
                          </div>
                        </div>

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('Paystack Business Email')); ?> *
                                  </h4>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <input type="text" class="input-field" placeholder="<?php echo e(__('Paystack Business Email')); ?>" name="paystack_email" value="<?php echo e($gs->paystack_email); ?>" required="">
                          </div>
                        </div>


                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('Paystack Text')); ?> *</h4>

                            </div>
                          </div>
                          <div class="col-lg-6">
                            <textarea class="input-field" name="paystack_text" placeholder="<?php echo e(__('Paystack Text')); ?>"><?php echo e($gs->paystack_text); ?></textarea>

                          </div>
                        </div>


                        <hr>

                        <div class="row justify-content-center">
                            <div class="col-lg-3">
                              <div class="left-area">
                                <h4 class="heading">
                                    <?php echo e(__('Guest Checkout')); ?>

                                </h4>
                              </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="action-list">
                                    <select class="process select droplinks <?php echo e($gs->guest_checkout == 1 ? 'drop-success' : 'drop-danger'); ?>">
                                      <option data-val="1" value="<?php echo e(route('admin-gs-guest',1)); ?>" <?php echo e($gs->guest_checkout == 1 ? 'selected' : ''); ?>><?php echo e(__('Activated')); ?></option>
                                      <option data-val="0" value="<?php echo e(route('admin-gs-guest',0)); ?>" <?php echo e($gs->guest_checkout == 0 ? 'selected' : ''); ?>><?php echo e(__('Deactivated')); ?></option>
                                    </select>
                                  </div>
                            </div>
                          </div>

                        <div class="row justify-content-center">
                            <div class="col-lg-3">
                              <div class="left-area">
                                <h4 class="heading">
                                    <?php echo e(__('Cash On Delivery')); ?>

                                </h4>
                              </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="action-list">
                                    <select class="process select droplinks <?php echo e($gs->cod_check == 1 ? 'drop-success' : 'drop-danger'); ?>">
                                      <option data-val="1" value="<?php echo e(route('admin-gs-cod',1)); ?>" <?php echo e($gs->cod_check == 1 ? 'selected' : ''); ?>><?php echo e(__('Activated')); ?></option>
                                      <option data-val="0" value="<?php echo e(route('admin-gs-cod',0)); ?>" <?php echo e($gs->cod_check == 0 ? 'selected' : ''); ?>><?php echo e(__('Deactivated')); ?></option>
                                    </select>
                                  </div>
                            </div>
                          </div>

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(_('Cash On Delivery Text')); ?> *</h4>

                            </div>
                          </div>
                          <div class="col-lg-6">
                            <textarea class="input-field" name="cod_text" placeholder="<?php echo e(__('Cash On Delivery Text')); ?>"><?php echo e($gs->cod_text); ?></textarea>

                          </div>
                        </div>
<hr>



                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('Currency Format')); ?> *</h4>
                            </div>
                          </div>
                          <div class="col-lg-6">
                              <select name="currency_format" required="">
                                  <option value="0" <?php echo e($gs->currency_format == 0 ? 'selected' : ''); ?>><?php echo e(__('Before Price')); ?></option>
                                  <option value="1" <?php echo e($gs->currency_format == 1 ? 'selected' : ''); ?>><?php echo e(__('After Price')); ?></option>
                              </select>
                          </div>
                        </div>

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('Withdraw Fee')); ?> *
                                  </h4>
                                  <p class="sub-heading"><?php echo e(__("(Set the value = 0 if you don't want to add it.)")); ?></p>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <input type="text" class="input-field" placeholder="<?php echo e(__('Withdraw Fee')); ?>" name="withdraw_fee" value="<?php echo e($gs->withdraw_fee); ?>" required="">
                          </div>
                        </div>

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('Withdraw Charge(%)')); ?> *
                                  </h4>
                                  <p class="sub-heading"><?php echo e(__("(Set the value = 0 if you don't want to add it.)")); ?></p>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <input type="text" class="input-field" placeholder="<?php echo e(__('Withdraw Charge(%)')); ?>" name="withdraw_charge" value="<?php echo e($gs->withdraw_charge); ?>" required="">
                          </div>
                        </div>

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('Tax(%)')); ?> *
                                  </h4>
                                  <p class="sub-heading"><?php echo e(__("(Set the value = 0 if you don't want to add it.)")); ?></p>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <input type="text" class="input-field" placeholder="<?php echo e(__('Tax(%)')); ?>" name="tax" value="<?php echo e($gs->tax); ?>" required="">
                          </div>
                        </div>

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                              
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <button class="addProductSubmit-btn" type="submit"><?php echo e(__('Save')); ?></button>
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