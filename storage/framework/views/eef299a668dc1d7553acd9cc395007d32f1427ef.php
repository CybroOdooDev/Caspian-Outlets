										<div class="col-lg-3 col-md-4 col-6 remove-padding">
											<a class="item" href="<?php echo e(route('front.product', $prod->slug)); ?>">
												<div class="item-img">
													<?php if(!empty($prod->features)): ?>
													<div class="sell-area">
														<?php $__currentLoopData = $prod->features; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $data1): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
														<span class="sale"
															style="background-color:<?php echo e($prod->colors[$key]); ?>"><?php echo e($prod->features[$key]); ?></span>
														<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
													</div>
													<?php endif; ?>
													<img class="img-fluid"
														src="<?php echo e($prod->photo ? asset('assets/images/thumbnails/'.$prod->thumbnail):asset('assets/images/noimage.png')); ?>"
														alt="">
												</div>
												<div class="info">
													<h5 class="name"><?php echo e($prod->showName()); ?></h5>
													<h4 class="price"><?php echo e($prod->showPrice()); ?>

														<del><small><?php echo e($prod->showPreviousPrice()); ?></small></del></h4>
													<div class="stars">
														<div class="ratings">
															<div class="empty-stars"></div>
															<div class="full-stars" style="width:<?php echo e(App\Models\Rating::ratings($prod->id)); ?>%"></div>
														</div>
													</div>
													<div class="item-cart-area">

														<ul class="item-cart-options">
															<li>
																	<?php if(Auth::guard('web')->check()): ?>
		
																	<span href="javascript:;" class="add-to-wish"
																		data-href="<?php echo e(route('user-wishlist-add',$prod->id)); ?>" data-toggle="tooltip"
																		data-placement="top" title="<?php echo e($langg->lang54); ?>"><i
																			class="icofont-heart-alt"></i>
																	</span>
		
																	<?php else: ?>
		
																	<span href="javascript:;" rel-toggle="tooltip" title="<?php echo e($langg->lang54); ?>"
																		data-toggle="modal" id="wish-btn" data-target="#comment-log-reg"
																		data-placement="top">
																		<i class="icofont-heart-alt"></i>
																	</span>
		
																	<?php endif; ?>
															</li>
															<li>
																<span  class="quick-view" rel-toggle="tooltip" title="<?php echo e($langg->lang55); ?>" href="javascript:;" data-href="<?php echo e(route('product.quick',$prod->id)); ?>" data-toggle="modal" data-target="#quickview" data-placement="top">
																		<i class="fas fa-shopping-basket"></i>
																</span>
															</li>
															<li>
																	<span href="javascript:;" class="add-to-compare"
																	data-href="<?php echo e(route('product.compare.add',$prod->id)); ?>" data-toggle="tooltip"
																	data-placement="top" title="<?php echo e($langg->lang57); ?>" >
																	<i class="icofont-exchange"></i>
																</span>
															</li>
														</ul>
													</div>
												</div>
											</a>
										</div>