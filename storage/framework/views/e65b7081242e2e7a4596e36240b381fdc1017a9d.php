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
					<li>
						<a href="javascript:;"><?php echo e($langg->lang58); ?></a>
					</li>
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

					<?php if(count($products) > 0): ?>

					<?php echo $__env->make('includes.filter', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

					<div class="categori-item-area">
						<div id="ajaxContent">
							<div class="row">
								<?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $prod): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
								<?php echo $__env->make('includes.product.product', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
								<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

							</div>

							<?php if(isset($min) || isset($max)): ?>

							<div class="page-center category">
								<?php echo $products->appends(['cat_id' => $cat_id ,'min' => $min, 'max' => $max])->links(); ?>

							</div>

							<?php elseif(!empty($sort)): ?>
							<?php if(!empty($category_id)): ?>

							<div class="page-center category">
								<?php echo $products->appends(['category_id' => $category_id, 'search' => $search, 'sort' =>
								$sort])->links(); ?>

							</div>

							<?php else: ?>
							<div class="page-center category">
								<?php echo $products->appends(['cat_id' => $cat_id, 'min' => $min, 'max' => $max, 'sort' =>
								$sort])->links(); ?>

							</div>
							<?php endif; ?>
							<?php else: ?>

							<div class="page-center category">
								<?php echo $products->appends(['category_id' => $category_id, 'search' => $search])->links(); ?>

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
		<?php if(empty($sort)): ?>
		window.location = window.location.href + '&sort=' + sort;
		<?php else: ?>
		var url = window.location.href.split("&sort");;
		window.location = url[0] + '&sort=' + sort;
		<?php endif; ?>
	});

	$(function () {
		$("#slider-range").slider({
			range: true,
			orientation: "horizontal",
			min: 0,
			max: 1000,
			values: [{
				{
					isset($_GET['min']) ? $_GET['min'] : '0'
				}
			}, {
				{
					isset($_GET['max']) ? $_GET['max'] : '1000'
				}
			}],
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