                                <li>
                                	<div class="single-box">
                                		<div class="left-area">
                                			<img src="<?php echo e($prod->photo ? asset('assets/images/thumbnails/'.$prod->thumbnail):asset('assets/images/noimage.png')); ?>"
                                				alt="">
                                		</div>
                                		<div class="right-area">
                                			<div class="stars">
                                				<div class="ratings">
                                					<div class="empty-stars"></div>
                                					<div class="full-stars"
                                						style="width:<?php echo e(App\Models\Rating::ratings($prod->id)); ?>%"></div>
                                				</div>
                                			</div>
                                			<h4 class="price"><?php echo e($prod->showPrice()); ?>

                                				<del><?php echo e($prod->showPreviousPrice()); ?></del> </h4>
                                			<p class="text"><a
                                					href="<?php echo e(route('front.product',$prod->slug)); ?>"><?php echo e(strlen($prod->name) > 35 ? substr($prod->name,0,35).'...' : $prod->name); ?></a>
                                			</p>
                                		</div>
                                	</div>
                                </li>