


<?php if($ps->flash_deal == 1): ?>
<!-- Electronics Area Start -->
<section class="categori-item electronics-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 remove-padding">
				<div class="section-top">
					<h2 class="section-title">
						<?php echo e($langg->lang244); ?>

					</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="flash-deals">
					<div class="flas-deal-slider">

						<?php $__currentLoopData = $discount_products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $prod): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
						<?php echo $__env->make('includes.product.flash-product', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
						<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Electronics Area start-->
<?php endif; ?>

<?php if($ps->small_banner == 1): ?>
<!-- Banner Area One Start -->
<section class="banner-section">
	<div class="container">
		<?php $__currentLoopData = $top_small_banners->chunk(2); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $chunk): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
		<div class="row">
			<?php $__currentLoopData = $chunk; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $img): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
			<div class="col-lg-6 remove-padding">
				<div class="left">
					<a class="banner-effect" href="<?php echo e($img->link); ?>" target="_blank">
						<img src="<?php echo e(asset('assets/images/banners/'.$img->photo)); ?>" alt="">
					</a>
				</div>
			</div>
			<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
		</div>
		<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
	</div>
</section>
<!-- Banner Area One Start -->
<?php endif; ?>

<?php if($ps->top_rated == 1): ?>
<!-- Electronics Area Start -->
<section class="categori-item electronics-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 remove-padding">
				<div class="section-top">
					<h2 class="section-title">
						<?php echo e($langg->lang28); ?>

					</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="row">

					<?php $__currentLoopData = $top_products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $prod): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
					<?php echo $__env->make('includes.product.top-product', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
					<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

				</div>
			</div>
		</div>
	</div>
</section>
<!-- Electronics Area start-->
<?php endif; ?>

<?php if($ps->large_banner == 1): ?>
<!-- Banner Area One Start -->
<section class="banner-section">
	<div class="container">
		<?php $__currentLoopData = $large_banners->chunk(1); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $chunk): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
		<div class="row">
			<?php $__currentLoopData = $chunk; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $img): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
			<div class="col-lg-12 remove-padding">
				<div class="img">
					<a class="banner-effect" href="<?php echo e($img->link); ?>">
						<img src="<?php echo e(asset('assets/images/banners/'.$img->photo)); ?>" alt="">
					</a>
				</div>
			</div>
			<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
		</div>
		<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
	</div>
</section>
<!-- Banner Area One Start -->
<?php endif; ?>


<?php if($ps->hot_sale == 1): ?>
<!-- hot-and-new-item Area Start -->
<section class="hot-and-new-item">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="accessories-slider">
					<div class="slide-item">
						<div class="row">
							<div class="col-lg-3 col-sm-6">
								<div class="categori">
									<div class="section-top">
										<h2 class="section-title">
											<?php echo e($langg->lang30); ?>

										</h2>
									</div>
									<div class="hot-and-new-item-slider">
										<?php $__currentLoopData = $hot_products->chunk(3); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $chunk): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
										<div class="item-slide">
											<ul class="item-list">
												<?php $__currentLoopData = $chunk; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $prod): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
												<?php echo $__env->make('includes.product.list-product', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
												<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
											</ul>
										</div>
										<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
									</div>

								</div>
							</div>
							<div class="col-lg-3 col-sm-6">
								<div class="categori">
									<div class="section-top">
										<h2 class="section-title">
											<?php echo e($langg->lang31); ?>

										</h2>
									</div>

									<div class="hot-and-new-item-slider">

										<?php $__currentLoopData = $latest_products->chunk(3); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $chunk): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
										<div class="item-slide">
											<ul class="item-list">
												<?php $__currentLoopData = $chunk; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $prod): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
												<?php echo $__env->make('includes.product.list-product', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
												<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
											</ul>
										</div>
										<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

									</div>
								</div>
							</div>
							<div class="col-lg-3 col-sm-6">
								<div class="categori">
									<div class="section-top">
										<h2 class="section-title">
											<?php echo e($langg->lang32); ?>

										</h2>
									</div>


									<div class="hot-and-new-item-slider">

										<?php $__currentLoopData = $trending_products->chunk(3); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $chunk): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
										<div class="item-slide">
											<ul class="item-list">
												<?php $__currentLoopData = $chunk; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $prod): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
												<?php echo $__env->make('includes.product.list-product', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
												<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
											</ul>
										</div>
										<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

									</div>

								</div>
							</div>
							<div class="col-lg-3 col-sm-6">
								<div class="categori">
									<div class="section-top">
										<h2 class="section-title">
											<?php echo e($langg->lang33); ?>

										</h2>
									</div>

									<div class="hot-and-new-item-slider">

										<?php $__currentLoopData = $trending_products->chunk(3); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $chunk): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
										<div class="item-slide">
											<ul class="item-list">
												<?php $__currentLoopData = $chunk; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $prod): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
												<?php echo $__env->make('includes.product.list-product', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
												<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
											</ul>
										</div>
										<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Clothing and Apparel Area start-->
<?php endif; ?>

<!-- main -->
<script src="<?php echo e(asset('assets/front/js/mainextra.js')); ?>"></script>