      <div class="row">

        <?php $__currentLoopData = $Blogs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $Blogg): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <div class="col-md-6 col-lg-4">
          <div class="Blog-box">
            <div class="Blog-images">
              <div class="img">
                <img
                  src="<?php echo e($Blogg->photo ? asset('assets/images/Blogs/'.$Blogg->photo):asset('assets/images/noimage.png')); ?>"
                  class="img-fluid" alt="">
                <div class="date d-flex justify-content-center">
                  <div class="box align-self-center">
                    <p><?php echo e(date('d', strtotime($Blogg->created_at))); ?></p>
                    <p><?php echo e(date('M', strtotime($Blogg->created_at))); ?></p>
                  </div>
                </div>
              </div>
            </div>
            <div class="details">
              <a href='<?php echo e(route('front.Blogshow',$Blogg->id)); ?>'>
                <h4 class="Blog-title">
                  <?php echo e(strlen($Blogg->title) > 50 ? substr($Blogg->title,0,50)."...":$Blogg->title); ?>

                </h4>
              </a>
              <p class="Blog-text">
                <?php echo e(substr(strip_tags($Blogg->details),0,120)); ?>

              </p>
              <a class="read-more-btn" href="<?php echo e(route('front.Blogshow',$Blogg->id)); ?>"><?php echo e($langg->lang38); ?></a>
            </div>
          </div>
        </div>


        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

      </div>

      <div class="page-center">
        <?php echo $Blogs->links(); ?>

      </div>