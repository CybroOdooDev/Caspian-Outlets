						<div class="item-filter">

							<ul class="filter-list">
								<li class="item-short-area">
									<p><?php echo e($langg->lang64); ?> :</p>
									<select id="sortby" class="short-item">
										<?php if($sort == "new"): ?>
										<option value="new" selected><?php echo e($langg->lang65); ?></option>
										<?php else: ?>
										<option value="new"><?php echo e($langg->lang65); ?></option>
										<?php endif; ?>
										<?php if($sort == "old"): ?>
										<option value="old" selected><?php echo e($langg->lang66); ?></option>
										<?php else: ?>
										<option value="old"><?php echo e($langg->lang66); ?></option>
										<?php endif; ?>
										<?php if($sort == "low"): ?>
										<option value="low" selected><?php echo e($langg->lang67); ?></option>
										<?php else: ?>
										<option value="low"><?php echo e($langg->lang67); ?></option>
										<?php endif; ?>
										<?php if($sort == "high"): ?>
										<option value="high" selected><?php echo e($langg->lang68); ?></option>
										<?php else: ?>
										<option value="high"><?php echo e($langg->lang68); ?></option>
										<?php endif; ?>
									</select>
								</li>
							</ul>
						</div>