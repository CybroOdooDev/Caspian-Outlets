<?php $__env->startSection('content'); ?>


<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <ul class="pages">

          

          <?php if(isset($bcat)): ?>

          <li>
            <a href="<?php echo e(route('front.index')); ?>">
              <?php echo e($langg->lang17); ?>

            </a>
          </li>
          <li>
            <a href="<?php echo e(route('front.blog')); ?>">
              <?php echo e($langg->lang18); ?>

            </a>
          </li>
          <li>
            <a href="<?php echo e(route('front.blogcategory',$bcat->slug)); ?>">
              <?php echo e($bcat->name); ?>

            </a>
          </li>

          <?php elseif(isset($slug)): ?>

          <li>
            <a href="<?php echo e(route('front.index')); ?>">
              <?php echo e($langg->lang17); ?>

            </a>
          </li>
          <li>
            <a href="<?php echo e(route('front.blog')); ?>">
              <?php echo e($langg->lang18); ?>

            </a>
          </li>
          <li>
            <a href="<?php echo e(route('front.blogtags',$slug)); ?>">
              <?php echo e($langg->lang35); ?>: <?php echo e($slug); ?>

            </a>
          </li>

          <?php elseif(isset($search)): ?>

          <li>
            <a href="<?php echo e(route('front.index')); ?>">
              <?php echo e($langg->lang17); ?>

            </a>
          </li>
          <li>
            <a href="<?php echo e(route('front.blog')); ?>">
              <?php echo e($langg->lang18); ?>

            </a>
          </li>
          <li>
            <a href="Javascript:;">
              <?php echo e($langg->lang36); ?>

            </a>
          </li>
          <li>
            <a href="Javascript:;">
              <?php echo e($search); ?>

            </a>
          </li>

          <?php elseif(isset($date)): ?>

          <li>
            <a href="<?php echo e(route('front.index')); ?>">
              <?php echo e($langg->lang17); ?>

            </a>
          </li>
          <li>
            <a href="<?php echo e(route('front.blog')); ?>">
              <?php echo e($langg->lang18); ?>

            </a>
          </li>
          <li>
            <a href="Javascript:;">
              <?php echo e($langg->lang37); ?>: <?php echo e(date('F Y',strtotime($date))); ?>

            </a>
          </li>

          <?php else: ?>

          <li>
            <a href="<?php echo e(route('front.index')); ?>">
              <?php echo e($langg->lang17); ?>

            </a>
          </li>
          <li>
            <a href="<?php echo e(route('front.blog')); ?>">
              <?php echo e($langg->lang18); ?>

            </a>
          </li>
          <?php endif; ?>

        </ul>
      </div>
    </div>
  </div>
</div>
<!-- Breadcrumb Area End -->

<!-- Blog Page Area Start -->
<section class="Blogpagearea">
  <div class="container">
    <div id="ajaxContent">

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
              <a href='<?php echo e(route('front.blogshow',$Blogg->id)); ?>'>
                <h4 class="Blog-title">
                  <?php echo e(strlen($Blogg->title) > 50 ? substr($Blogg->title,0,50)."...":$Blogg->title); ?>

                </h4>
              </a>
              <p class="Blog-text">
                <?php echo e(substr(strip_tags($Blogg->details),0,120)); ?>

              </p>
              <a class="read-more-btn" href="<?php echo e(route('front.blogshow',$Blogg->id)); ?>"><?php echo e($langg->lang38); ?></a>
            </div>
          </div>
        </div>

        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

      </div>

      <div class="page-center">
        <?php echo $Blogs->links(); ?>

      </div>
    </div>

  </div>
</section>
<!-- Blog Page Area Start -->

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.front', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>