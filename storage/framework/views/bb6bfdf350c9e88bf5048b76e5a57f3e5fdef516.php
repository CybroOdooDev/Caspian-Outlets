        <div class="col-lg-3 col-md-6">
          <div class="left-area">
            <div class="filter-result-area">
              <div class="header-area">
                <h4 class="title">
                  <?php echo e($langg->lang61); ?>

                </h4>
              </div>
              <div class="body-area">
                <input type="hidden" id="searchform" value="<?php echo e(route('front.search')); ?>">
                <form id="catalogform" action="" method="GET">
                  <ul class="filter-list">
                    <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $element): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                    <li>
                      <div class="content">
                        <div class="check-box">
                          <div class="form-check form-check-inline">
                            <input class="form-check-input check-cat" type="checkbox" id="<?php echo e('cb'.$element->id); ?>"
                              value="<?php echo e($element->id); ?>"
                              <?php echo e(isset($cat_id) ? (in_array( $element->id , $cat_id) ? 'checked' : '') : ''); ?>>
                            <span class="checkmark"></span>
                            <label class="form-check-label" for="<?php echo e('cb'.$element->id); ?>">
                              <?php echo e($element->name); ?>

                            </label>
                          </div>
                        </div>
                      </div>
                    </li>

                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                  </ul>
                  <div class="price-range-block">
                    <div id="slider-range" class="price-filter-range" name="rangeInput"></div>
                    <div class="livecount">
                      <input type="number" min=0 name="min" id="min_price" class="price-range-field" />
                      <span><?php echo e($langg->lang62); ?></span>
                      <input type="number" min=0 name="max" id="max_price" class="price-range-field" />
                    </div>
                  </div>

                  <button class="filter-btn" type="submit"><?php echo e($langg->lang58); ?></button>
                </form>
              </div>
            </div>

            <?php if(!isset($vendor)): ?>

            <div class="tags-area">
              <div class="header-area">
                <h4 class="title">
                  <?php echo e($langg->lang63); ?>

                </h4>
              </div>
              <div class="body-area">
                <ul class="taglist">
                  <?php $__currentLoopData = App\Models\Product::showTags(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $tag): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                  <?php if(!empty($tag)): ?>
                  <li>
                    <a class="<?php echo e(isset($tags) ? ($tag == $tags ? 'active' : '') : ''); ?>"
                      href="<?php echo e(route('front.tag',$tag)); ?>">
                      <?php echo e($tag); ?>

                    </a>
                  </li>
                  <?php endif; ?>
                  <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </ul>
              </div>
            </div>


            <?php else: ?>

            <div class="service-center">
              <div class="header-area">
                <h4 class="title">
                  <?php echo e($langg->lang227); ?>

                </h4>
              </div>
              <div class="body-area">
                <ul class="list">
                  <li>
                    <a href="javascript:;" data-toggle="modal"
                      data-target="<?php echo e(Auth::guard('web')->check() ? '#vendorform1' : '#comment-log-reg'); ?>">
                      <i class="icofont-email"></i> <span class="service-text"><?php echo e($langg->lang228); ?></span>
                    </a>
                  </li>
                  <li>
                    <a href="tel:+<?php echo e($vendor->shop_number); ?>">
                      <i class="icofont-phone"></i> <span class="service-text"><?php echo e($vendor->shop_number); ?></span>
                    </a>
                  </li>
                </ul>
                <!-- Modal -->
              </div>

              <div class="footer-area">
                <p class="title">
                  <?php echo e($langg->lang229); ?>

                </p>
                <ul class="list">


                  <?php if($vendor->f_check != 0): ?>
                  <li><a href="<?php echo e($vendor->f_url); ?>" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                  <?php endif; ?>
                  <?php if($vendor->g_check != 0): ?>
                  <li><a href="<?php echo e($vendor->g_url); ?>" target="_blank"><i class="fab fa-google"></i></a></li>
                  <?php endif; ?>
                  <?php if($vendor->t_check != 0): ?>
                  <li><a href="<?php echo e($vendor->t_url); ?>" target="_blank"><i class="fab fa-twitter"></i></a></li>
                  <?php endif; ?>
                  <?php if($vendor->l_check != 0): ?>
                  <li><a href="<?php echo e($vendor->l_url); ?>" target="_blank"><i class="fab fa-linkedin-in"></i></a></li>
                  <?php endif; ?>


                </ul>
              </div>
            </div>


            <?php endif; ?>


          </div>
        </div>