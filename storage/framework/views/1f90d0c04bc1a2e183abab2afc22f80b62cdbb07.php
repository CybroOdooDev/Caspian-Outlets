<?php $__env->startSection('content'); ?>

<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<ul class="pages">
					<li>
						<a href="<?php echo e(route('front.index')); ?>"><?php echo e($langg->lang17); ?></a>
					</li>
					<?php if(isset($cat)): ?>
					<li>
						<a href="<?php echo e(route('front.category',$cat->slug)); ?>"><?php echo e($cat->name); ?></a>
					</li>
					<?php endif; ?>

					<?php if(isset($subcat)): ?>
					<li>
						<a href="<?php echo e(route('front.category',$subcat->category->slug)); ?>"><?php echo e($subcat->category->name); ?></a>
					</li>
					<li>
						<a
							href="<?php echo e(route('front.subcat',['slug1' => $subcat->category->slug, 'slug2' => $subcat->slug])); ?>"><?php echo e($subcat->name); ?></a>
					</li>
					<?php endif; ?>


					<?php if(isset($childcat)): ?>
					<li>
						<a
							href="<?php echo e(route('front.category',$childcat->subcategory->category->slug)); ?>"><?php echo e($childcat->subcategory->category->name); ?></a>
					</li>
					<li>
						<a
							href="<?php echo e(route('front.subcat',['slug1' => $childcat->subcategory->category->slug, 'slug2' => $childcat->subcategory->slug])); ?>"><?php echo e($childcat->subcategory->name); ?></a>
					</li>
					<li>
						<a
							href="<?php echo e(route('front.childcat',['slug1' => $childcat->subcategory->category->slug, 'slug2' => $childcat->subcategory->slug, 'slug3' => $childcat->slug])); ?>"><?php echo e($childcat->name); ?></a>
					</li>
					<?php endif; ?>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb Area End -->

<!-- SubCategori Area Start -->
<section class="sub-categori">
	<div class="container">
		<div class="row">

			<?php echo $__env->make('includes.catalog', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

			<div class="col-lg-9 order-first order-lg-last">

				<div class="right-area">

					<?php if(count($cats) > 0): ?>

					<?php echo $__env->make('includes.filter', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

					<div class="categori-item-area">
						<div id="ajaxContent">
							<div class="row">
								<?php $__currentLoopData = $cats; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $prod): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
								<?php echo $__env->make('includes.product.product', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
								<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

							</div>

							<?php if(isset($min) || isset($max)): ?>

							<div class="page-center category">
								<?php echo $cats->appends(['min' => $min, 'max' => $max])->links(); ?>

							</div>

							<?php elseif(isset($sort)): ?>

							<div class="page-center category">
								<?php echo $cats->appends(['sort' => $sort])->links(); ?>

							</div>

							<?php else: ?>

							<div class="page-center category">
								<?php echo $cats->links(); ?>

							</div>

							<?php endif; ?>

						</div>
					</div>
					<?php else: ?>
					<div class="page-center">
						<h4 class="text-center"><?php echo e($langg->lang60); ?></h4>
					</div>
					<?php endif; ?>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- SubCategori Area End -->
<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>

<script type="text/javascript">

	$("#sortby").on('change', function () {
		var sort = $("#sortby").val();
		<?php if(isset($cat)): ?>
		window.location = "<?php echo e(url('/category')); ?>/<?php echo e($cat->slug); ?>?sort=" + sort;
		<?php endif; ?>
		<?php if(isset($subcat)): ?>
		window.location = "<?php echo e(url('/category')); ?>/<?php echo e($subcat->category->slug); ?>/<?php echo e($subcat->slug); ?>?sort=" + sort;
		<?php endif; ?>
		<?php if(isset($childcat)): ?>
		window.location ="<?php echo e(url('/category')); ?>/<?php echo e($childcat->subcategory->category->slug); ?>/<?php echo e($childcat->subcategory->slug); ?>/<?php echo e($childcat->slug); ?>?sort=" +sort;
		<?php endif; ?>
	});


	$(function () {
		$("#slider-range").slider({
			range: true,
			orientation: "horizontal",
			min: 0,
			max: 1000,
			values: [<?php echo e(isset($_GET['min']) ? $_GET['min'] : '0'); ?>, 
			<?php echo e(isset($_GET['max']) ? $_GET['max'] : '1000'); ?>],
			step: 5,
			slide: function (event, ui) {
				if (ui.values[0] == ui.values[1]) {
					return false;
				}
				$("#min_price").val(ui.values[0]);
				$("#max_price").val(ui.values[1]);
			}
		});

		$("#min_price").val($("#slider-range").slider("values", 0));
		$("#max_price").val($("#slider-range").slider("values", 1));
	});

</script>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.front', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>