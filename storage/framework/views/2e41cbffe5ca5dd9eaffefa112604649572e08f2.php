<?php $__env->startSection('content'); ?>


<section class="user-dashbord">
	<div class="container">
		<div class="row">
			<?php echo $__env->make('includes.user-dashboard-sidebar', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
			<div class="col-lg-8">
				<div class="user-profile-details">
					<div class="order-history">
						<div class="header-area">
							<h4 class="title">
								<?php echo e($langg->lang329); ?>

								<a class="mybtn1" href="<?php echo e(route('user-wwt-create')); ?>"> <i class="fas fa-plus"></i>
									<?php echo e($langg->lang330); ?></a>
							</h4>
						</div>
						<div class="mr-table allproduct mt-4">
							<div class="table-responsiv">
								<table id="example" class="table table-hover dt-responsive" cellspacing="0"
									width="100%">
									<thead>
										<tr>
											<th><?php echo e($langg->lang331); ?></th>
											<th><?php echo e($langg->lang332); ?></th>
											<th><?php echo e($langg->lang333); ?></th>
											<th><?php echo e($langg->lang334); ?></th>
											<th><?php echo e($langg->lang335); ?></th>
										</tr>
									</thead>
									<tbody>
										<?php $__currentLoopData = $withdraws; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $withdraw): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
										<tr>
											<td><?php echo e(date('d-M-Y',strtotime($withdraw->created_at))); ?></td>
											<td><?php echo e($withdraw->method); ?></td>
											<?php if($withdraw->method != "Bank"): ?>
											<td><?php echo e($withdraw->acc_email); ?></td>
											<?php else: ?>
											<td><?php echo e($withdraw->iban); ?></td>
											<?php endif; ?>
											<td><?php echo e($sign->sign); ?><?php echo e(round($withdraw->amount * $sign->value , 2)); ?></td>
											<td><?php echo e(ucfirst($withdraw->status)); ?></td>
										</tr>
										<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.front', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>