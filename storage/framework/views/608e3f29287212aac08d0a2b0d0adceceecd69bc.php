<?php $__currentLoopData = $prods; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $prod): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
<div class="docname">
	<a href="<?php echo e(route('front.product', $prod->slug)); ?>">
		<?php echo strlen($prod->name) > 66 ? str_replace($slug,'<b>'.$slug.'</b>',substr($prod->name,0,66)).'...' :
		str_replace($slug,'<b>'.$slug.'</b>',$prod->name); ?> - <?php echo e($prod->showPrice()); ?>

	</a>
</div>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>