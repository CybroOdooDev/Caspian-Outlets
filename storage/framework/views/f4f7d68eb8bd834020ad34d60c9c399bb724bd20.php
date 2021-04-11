 

<?php $__env->startSection('content'); ?>  
					<input type="hidden" id="headerdata" value="<?php echo e(__('PICKUP LOCATION')); ?>">
					<div class="content-area">
						<div class="mr-breadcrumb">
							<div class="row">
								<div class="col-lg-12">
										<h4 class="heading"><?php echo e(__('Popular Products')); ?></h4>
										<ul class="links">
											<li>
												<a href="<?php echo e(route('admin.dashboard')); ?>"><?php echo e(__('Dashboard')); ?> </a>
											</li>
											<li>
												<a href="javascript:;"><?php echo e(__('SEO Tools')); ?> </a>
											</li>
											<li>
												<a href="javascript:;"><?php echo e(__('Popular Products')); ?></a>
											</li>
										</ul>
								</div>
							</div>
						</div>
						<div class="product-area">
							<div class="row">
								<div class="col-lg-12">
									<div class="mr-table allproduct">
							          <?php echo $__env->make('includes.form-error', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
							          <?php echo $__env->make('includes.form-success', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
										<div class="table-responsiv">
												<table id="example" class="table table-hover dt-responsive" cellspacing="0" width="100%">
													<thead>
														<tr>
									                        <th><?php echo e(__('Name')); ?></th>
									                        <th><?php echo e(__('Category')); ?></th>
									                        <th><?php echo e(__('Type')); ?></th>
									                        <th><?php echo e(__('Clicks')); ?></th>
														</tr>
													</thead>

                                              <tbody>
                                                <?php $__currentLoopData = $productss; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $productt): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?> 
                    <?php $__currentLoopData = $productt; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $prod): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                                                        <tr>

                                      <td>
                                        <?php echo e(strlen($prod->product->name) > 30 ? substr($prod->product->name,0,30).'...' : $prod->product->name); ?>

                                      </td>
                                                      <td>
                                                        <?php echo e($prod->product->category->name); ?> <br>

                                                        <?php if($prod->product->subcategory_id != null): ?>

                                                        <?php echo e($prod->product->subcategory_name); ?> <br>

                                                        <?php if($prod->product->childcategory_id != null): ?>
                                                        <?php echo e($prod->product->childcategory_name); ?>

                                                        <?php endif; ?>

                                                        <?php endif; ?>
                                                      </td>
												  <td>
												<?php echo e($prod->product->type); ?>

												  </td>
                                      <td><?php echo e($productt->count('product_id')); ?></td>
                                                  </tr>

                                                  <?php break; ?>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>



                                                  <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                  </tbody>

												</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>




<?php $__env->stopSection(); ?>    



<?php $__env->startSection('scripts'); ?>

<script type="text/javascript">

 			$('#example').DataTable({
			   ordering: false
            });

$( document ).ready(function() {
        $(".btn-area").append('<div class="col-sm-4 text-right">'+
        '<select class="form-control" id="prevdate">'+
          '<option value="30" <?php echo e($val==30 ? 'selected':''); ?>>Last 30 Days</option>'+
          '<option value="15" <?php echo e($val==15 ? 'selected':''); ?>>Last 15 Days</option>'+
          '<option value="7" <?php echo e($val==7 ? 'selected':''); ?>>Last 7 Days</option>'+
        '</select>'+
          '</div>'); 

        $("#prevdate").change(function () {
        var sort = $("#prevdate").val();
        window.location = "<?php echo e(url('/admin/products/popular/')); ?>/"+sort;
    });                                                                      
});
</script>

<?php $__env->stopSection(); ?>   
<?php echo $__env->make('layouts.admin', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>