<?php $__env->startSection('content'); ?>

<?php if($ps->slider == 1): ?>

<?php if(count($sliders)): ?>

<?php echo $__env->make('includes.slider-style', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

<?php endif; ?>

<?php endif; ?>

<?php if($ps->slider == 1): ?>
<!-- Hero Area Start -->
<section class="hero-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="featured-link-box">
					<h4 class="title">
						<?php echo e($langg->lang220); ?>

					</h4>
					<ul class="link-list">
					<?php $__currentLoopData = DB::table('featured_links')->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $data): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
					<li>
						<a href="<?php echo e($data->link); ?>" target="_blank"><img src="<?php echo e($data->photo ? asset('assets/images/featuredlink/'.$data->photo) :  asset('assets/images/noimage.png')); ?>" alt=""><?php echo e($data->name); ?></a>
						<i class="fas fa-angle-right"></i>
					</li>
					<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
					</ul>
				</div>
			</div>
			<div class="col-lg-9">
				<?php if(count($sliders)): ?>
				<div class="hero-area-slider">
					<div class="intro-carousel">
						<?php $__currentLoopData = $sliders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $data): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
						<div class="intro-content <?php echo e($data->position); ?>"
							style="background-image: url(<?php echo e(asset('assets/images/sliders/'.$data->photo)); ?>)">
							<div class="slider-content">
								<!-- layer 1 -->
								<div class="layer-1">
									<h4 style="font-size: <?php echo e($data->subtitle_size); ?>px; color: <?php echo e($data->subtitle_color); ?>"
										class="subtitle subtitle<?php echo e($data->id); ?>"
										data-animation="animated <?php echo e($data->subtitle_anime); ?>"><?php echo e($data->subtitle_text); ?>

									</h4>
									<h2 style="font-size: <?php echo e($data->title_size); ?>px; color: <?php echo e($data->title_color); ?>"
										class="title title<?php echo e($data->id); ?>"
										data-animation="animated <?php echo e($data->title_anime); ?>"><?php echo e($data->title_text); ?></h2>
								</div>
								<!-- layer 2 -->
								<div class="layer-2">
									<p style="font-size: <?php echo e($data->details_size); ?>px; color: <?php echo e($data->details_color); ?>"
										class="text text<?php echo e($data->id); ?>"
										data-animation="animated <?php echo e($data->details_anime); ?>"><?php echo e($data->details_text); ?></p>
								</div>
								<!-- layer 3 -->
								<div class="layer-3">
									<a href="<?php echo e($data->link); ?>" target="_blank" class="mybtn1"><span><?php echo e($langg->lang25); ?>

											<i class="fas fa-chevron-right"></i></span></a>
								</div>
							</div>
						</div>
						<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
					</div>
				</div>
				<?php endif; ?>
			</div>
		</div>
	</div>
</section>
<!-- Hero Area End -->
<?php endif; ?>

<!-- <?php if($ps->featured_banner == 1): ?>


<section class="slider_bottom_banner">
	<div class="container">
	<?php $__currentLoopData = DB::table('featured_banners')->get()->chunk(4); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $data1): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
		<div class="row">
			<?php $__currentLoopData = $data1; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $data): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
			<div class="col-lg-3 col-6">
			<a href="<?php echo e($data->link); ?>" target="_blank" class="banner-effect">
				<img src="<?php echo e($data->photo ? asset('assets/images/featuredbanner/'.$data->photo) : asset('assets/images/noimage.png')); ?>" alt="">
			</a>
			</div>
			<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
		</div>
		<?php if(!$loop->last): ?>
		<br>
		<?php endif; ?>
	<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>		

		</div>
	</div>
</section>


<?php endif; ?> -->


<?php if($ps->service == 1): ?>


<section class="info-area">
	<div class="container">

		<?php $__currentLoopData = $services->chunk(4); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $chunk): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

		<div class="row">

			<div class="col-lg-12 p-0">
				<div class="info-big-box">
					<div class="row">
						<?php $__currentLoopData = $chunk; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $service): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
						<div class="col-6 col-xl-3 p-0">
							<div class="info-box">
								<div class="icon">
									<img src="<?php echo e(asset('assets/images/services/'.$service->photo)); ?>">
								</div>
								<div class="info">
									<div class="details">
										<h4 class="title"><?php echo e($service->title); ?></h4>
										<p class="text">
											<?php echo $service->details; ?>

										</p>
									</div>
								</div>
							</div>
						</div>
						<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
					</div>
				</div>
			</div>

		</div>

		<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

	</div>
</section>



<?php endif; ?>

<?php if($ps->featured == 1): ?>
<!-- Trending Item Area Start -->
<section class="trending">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 remove-padding">
				<div class="section-top">
					<h2 class="section-title">
						<?php echo e($langg->lang26); ?>

					</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 remove-padding">
				<div class="trending-item-slider">
					<?php $__currentLoopData = $feature_products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $prod): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
					<?php echo $__env->make('includes.product.slider-product', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
					<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
				</div>
			</div>

		</div>
	</div>
</section>
<!-- Tranding Item Area End -->
<?php endif; ?>


<section id="extraData">
	<div class="text-center">
		<img src="<?php echo e(asset('assets/images/'.$gs->loader)); ?>">
	</div>
</section>


<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>
<script>
	$(window).on('load', function () {

		setTimeout(function () {

			$('#extraData').load('<?php echo e(route('front.extraIndex')); ?>');

		}, 500);
	});
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.front', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>