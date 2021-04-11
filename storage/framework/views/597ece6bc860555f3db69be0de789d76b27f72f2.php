<?php $__env->startSection('content'); ?>

<div class="content-area">
              <div class="mr-breadcrumb">
                <div class="row">
                  <div class="col-lg-12">
                      <h4 class="heading"><?php echo e(__('Contact Us')); ?></h4>
                    <ul class="links">
                      <li>
                        <a href="<?php echo e(route('admin.dashboard')); ?>"><?php echo e(__('Dashboard')); ?> </a>
                      </li>
                      <li>
                        <a href="javascript:;"><?php echo e(__('Menu Page Settings')); ?></a>
                      </li>
                      <li>
                        <a href="<?php echo e(route('admin-ps-contact')); ?>"><?php echo e(__('Contact Us Page')); ?></a>
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
                        <form id="geniusform" action="<?php echo e(route('admin-ps-update')); ?>" method="POST" enctype="multipart/form-data">
                          <?php echo e(csrf_field()); ?>


                        <?php echo $__env->make('includes.admin.form-both', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>  

                        <div class="row justify-content-center">
                            <div class="col-lg-3">
                              <div class="left-area">
                                <h4 class="heading">
                                    <?php echo e(__('Contact Page')); ?>:
                                </h4>
                              </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="action-list">
                                    <select class="process select droplinks <?php echo e($gs->is_contact == 1 ? 'drop-success' : 'drop-danger'); ?>">
                                      <option data-val="1" value="<?php echo e(route('admin-gs-iscontact',1)); ?>" <?php echo e($gs->is_contact == 1 ? 'selected' : ''); ?>><?php echo e(__('Activated')); ?></option>
                                      <option data-val="0" value="<?php echo e(route('admin-gs-iscontact',0)); ?>" <?php echo e($gs->is_contact == 0 ? 'selected' : ''); ?>><?php echo e(__('Deactivated')); ?></option>
                                    </select>
                                  </div>
                            </div>
                          </div>
                          <div class="row justify-content-center">
                              <div class="col-lg-3">
                                <div class="left-area">
                                  <h4 class="heading">
                                      <?php echo e(__('Contact Title')); ?> *
                                      <p class="sub-heading"><?php echo e(__('(In Any Language)')); ?></p>
                                  </h4>
                                </div>
                              </div>
                              <div class="col-lg-6">
                                  <div class="tawk-area">
                                    <textarea class="nic-edit"  name="contact_title"> <?php echo e($data->contact_title); ?> </textarea>
                                  </div>
                              </div>
                            </div>
                          <div class="row justify-content-center">
                              <div class="col-lg-3">
                                <div class="left-area">
                                  <h4 class="heading">
                                      <?php echo e(__('Contact Description')); ?> *
                                      <p class="sub-heading"><?php echo e(__('(In Any Language)')); ?></p>
                                  </h4>
                                </div>
                              </div>
                              <div class="col-lg-6">
                                  <div class="tawk-area">
                                    <textarea class="nic-edit"  name="contact_text"> <?php echo e($data->contact_text); ?> </textarea>
                                  </div>
                              </div>
                            </div>


                          <div class="row justify-content-center">
                              <div class="col-lg-3">
                                <div class="left-area">
                                  <h4 class="heading">
                                      <?php echo e(__('Side Title')); ?> *
                                      <p class="sub-heading"><?php echo e(__('(In Any Language)')); ?></p>
                                  </h4>
                                </div>
                              </div>
                              <div class="col-lg-6">
                                  <div class="tawk-area">
                                    <textarea class="nic-edit"  name="side_title"> <?php echo e($data->side_title); ?> </textarea>
                                  </div>
                              </div>
                            </div>
                          <div class="row justify-content-center">
                              <div class="col-lg-3">
                                <div class="left-area">
                                  <h4 class="heading">
                                      <?php echo e(__('Side Description')); ?> *
                                      <p class="sub-heading"><?php echo e(__('(In Any Language)')); ?></p>
                                  </h4>
                                </div>
                              </div>
                              <div class="col-lg-6">
                                  <div class="tawk-area">
                                    <textarea class="nic-edit"  name="side_text"> <?php echo e($data->side_text); ?> </textarea>
                                  </div>
                              </div>
                            </div>


                          <div class="row justify-content-center">
                              <div class="col-lg-3">
                                <div class="left-area">
                                  <h4 class="heading">
                                      <?php echo e(__('Contact Us Email Address')); ?> *
                                  </h4>
                                </div>
                              </div>
                              <div class="col-lg-6">
                                  <div class="tawk-area">
                                    <textarea name="contact_email"> <?php echo e($data->contact_email); ?> </textarea>
                                  </div>
                              </div>
                            </div>
                          <div class="row justify-content-center">
                              <div class="col-lg-3">
                                <div class="left-area">
                                  <h4 class="heading">
                                      <?php echo e(__('Contact Form Success Text')); ?> *
                                      <p class="sub-heading"><?php echo e(__('(In Any Language)')); ?></p>
                                  </h4>
                                </div>
                              </div>
                              <div class="col-lg-6">
                                  <div class="tawk-area">
                                    <textarea name="contact_success"> <?php echo e($data->contact_success); ?> </textarea>
                                  </div>
                              </div>
                            </div>

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('Email')); ?> *
                                  </h4>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <input type="email" class="input-field" placeholder="<?php echo e(__('Enter Email')); ?>" name="email" value="<?php echo e($data->email); ?>">
                          </div>
                        </div>


                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('Website')); ?> *
                                  </h4>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <input type="text" class="input-field" placeholder="<?php echo e(__('Enter Website')); ?>" name="site" value="<?php echo e($data->site); ?>">
                          </div>
                        </div>

                          <div class="row justify-content-center">
                              <div class="col-lg-3">
                                <div class="left-area">
                                  <h4 class="heading">
                                      <?php echo e(__('Street Address')); ?> *
                                      <p class="sub-heading"><?php echo e(__('(In Any Language)')); ?></p>
                                  </h4>
                                </div>
                              </div>
                              <div class="col-lg-6">
                                  <div class="tawk-area">
                                    <textarea name="street" placeholder="Enter Street Address"> <?php echo e($data->street); ?> </textarea>
                                  </div>
                              </div>
                            </div>

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('Phone')); ?> *
                                  </h4>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <input type="text" class="input-field" placeholder="<?php echo e(__('Enter Phone')); ?>" name="phone" value="<?php echo e($data->phone); ?>">
                          </div>
                        </div>

                        <div class="row justify-content-center">
                          <div class="col-lg-3">
                            <div class="left-area">
                                <h4 class="heading"><?php echo e(__('Fax')); ?> *
                                  </h4>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <input type="text" class="input-field" placeholder="<?php echo e(__('Enter Fax')); ?>" name="fax" value="<?php echo e($data->fax); ?>">
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