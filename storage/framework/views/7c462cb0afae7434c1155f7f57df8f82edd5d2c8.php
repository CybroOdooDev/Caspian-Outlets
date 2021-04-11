 

<?php $__env->startSection('content'); ?>  
					<input type="hidden" id="headerdata" value="<?php echo e(__('COMMENT')); ?>">
					<div class="content-area">
						<div class="mr-breadcrumb">
							<div class="row">
								<div class="col-lg-12">
										<h4 class="heading"><?php echo e(__('Comments')); ?></h4>
										<ul class="links">
											<li>
												<a href="<?php echo e(route('admin.dashboard')); ?>"><?php echo e(__('Dashboard')); ?> </a>
											</li>
											<li>
												<a href="javascript:;"><?php echo e(__('Product Discussion')); ?> </a>
											</li>
											<li>
												<a href="<?php echo e(route('admin-comment-index')); ?>"><?php echo e(__('Comments')); ?></a>
											</li>
										</ul>
								</div>
							</div>
						</div>
						<div class="product-area">
							<div class="row">
								<div class="col-lg-12">
								<div class="heading-area">
									<h4 class="title">
										<?php echo e(__('Product Comment')); ?> :
									</h4>
	                                <div class="action-list">
	                                    <select class="process select droplinks <?php echo e($gs->is_comment == 1 ? 'drop-success' : 'drop-danger'); ?>">
	                                      <option data-val="1" value="<?php echo e(route('admin-gs-iscomment',1)); ?>" <?php echo e($gs->is_comment == 1 ? 'selected' : ''); ?>><?php echo e(__('Activated')); ?></option>
	                                      <option data-val="0" value="<?php echo e(route('admin-gs-iscomment',0)); ?>" <?php echo e($gs->is_comment == 0 ? 'selected' : ''); ?>><?php echo e(__('Deactivated')); ?></option>
	                                    </select>
	                                  </div>
								</div>
									<div class="mr-table allproduct">
										<?php echo $__env->make('includes.admin.form-success', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?> 
										<div class="table-responsiv">
												<table id="geniustable" class="table table-hover dt-responsive" cellspacing="0" width="100%">
													<thead>
														<tr>
									                        <th width="25%"><?php echo e(__('Product')); ?></th>
									                        <th width="15%"><?php echo e(__('Commenter')); ?></th>
									                        <th width="35%"><?php echo e(__('Comment')); ?></th>
									                        <th><?php echo e(__('Actions')); ?></th>
														</tr>
													</thead>
												</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>



				<div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="modal1" aria-hidden="true">
										
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
												<div class="submit-loader">
														<img  src="<?php echo e(asset('assets/images/'.$gs->admin_loader)); ?>" alt="">
												</div>
											<div class="modal-header">
											<h5 class="modal-title"></h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											</div>
											<div class="modal-body">

											</div>
											<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-dismiss="modal"><?php echo e(__('Close')); ?></button>
											</div>
						</div>
					</div>

				</div>






<div class="modal fade" id="confirm-delete">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header text-center">
        <h4 class="modal-title w-100"><?php echo e(__('Confirm Delete')); ?></h4>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
            <p class="text-center"><?php echo e(__('You are about to delete this Comment.')); ?></p>
            <p class="text-center"><?php echo e(__('Do you want to proceed?')); ?></p>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer justify-content-center">
            <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo e(__('Cancel')); ?></button>
            <a class="btn btn-danger btn-ok"><?php echo e(__('Delete')); ?></a>
      </div>

    </div>
  </div>
</div>



<?php $__env->stopSection(); ?>    



<?php $__env->startSection('scripts'); ?>




    <script type="text/javascript">

		var table = $('#geniustable').DataTable({
			   ordering: false,
               processing: true,
               serverSide: true,
               ajax: '<?php echo e(route('admin-comment-datatables')); ?>',
               columns: [
                        { data: 'product', name: 'product', searchable: false, orderable: false },
                        { data: 'commenter', name: 'commenter' },
                        { data: 'text', name: 'text' },
            			{ data: 'action', searchable: false, orderable: false }

                     ],
               language : {
                	processing: '<img src="<?php echo e(asset('assets/images/'.$gs->admin_loader)); ?>">'
                }
            });											
									
    </script>


    
<?php $__env->stopSection(); ?>   
<?php echo $__env->make('layouts.admin', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>