<!doctype html>
<html lang="en" dir="ltr">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="author" content="GeniusOcean">
	<meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
	<!-- Title -->
	<title><?php echo e($gs->title); ?></title>
	<!-- favicon -->
	<link rel="icon" type="image/x-icon" href="<?php echo e(asset('assets/images/'.$gs->favicon)); ?>" />
	<!-- Bootstrap -->
	<link href="<?php echo e(asset('assets/admin/css/bootstrap.min.css')); ?>" rel="stylesheet" />
	<!-- Fontawesome -->
	<link rel="stylesheet" href="<?php echo e(asset('assets/admin/css/fontawesome.css')); ?>">
	<!-- icofont -->
	<link rel="stylesheet" href="<?php echo e(asset('assets/admin/css/icofont.min.css')); ?>">
	<!-- Sidemenu Css -->
	<link href="<?php echo e(asset('assets/admin/plugins/fullside-menu/css/dark-side-style.css')); ?>" rel="stylesheet" />
	<link href="<?php echo e(asset('assets/admin/plugins/fullside-menu/waves.min.css')); ?>" rel="stylesheet" />

	<link href="<?php echo e(asset('assets/admin/css/plugin.css')); ?>" rel="stylesheet" />

	<link href="<?php echo e(asset('assets/admin/css/jquery.tagit.css')); ?>" rel="stylesheet" />
	<link rel="stylesheet" href="<?php echo e(asset('assets/admin/css/bootstrap-coloroicker.css')); ?>">
	<!-- Main Css -->

	<!-- stylesheet -->
	<?php if(DB::table('admin_languages')->where('is_default','=',1)->first()->rtl == 1): ?>

	<link href="<?php echo e(asset('assets/admin/css/rtl/style.css')); ?>" rel="stylesheet" />
	<link href="<?php echo e(asset('assets/admin/css/rtl/custom.css')); ?>" rel="stylesheet" />
	<link href="<?php echo e(asset('assets/admin/css/rtl/responsive.css')); ?>" rel="stylesheet" />
	<link href="<?php echo e(asset('assets/admin/css/common.css')); ?>" rel="stylesheet" />

	<?php else: ?>

	<link href="<?php echo e(asset('assets/admin/css/style.css')); ?>" rel="stylesheet" />
	<link href="<?php echo e(asset('assets/admin/css/custom.css')); ?>" rel="stylesheet" />
	<link href="<?php echo e(asset('assets/admin/css/responsive.css')); ?>" rel="stylesheet" />
	<link href="<?php echo e(asset('assets/admin/css/common.css')); ?>" rel="stylesheet" />
	<?php endif; ?>

	<?php echo $__env->yieldContent('styles'); ?>

</head>

<body>
	<div class="page">
		<div class="page-main">
			<!-- Header Menu Area Start -->
			<div class="header">
				<div class="container-fluid">
					<div class="d-flex justify-content-between">
						<div class="menu-toggle-button">
							<a class="nav-link" href="javascript:;" id="sidebarCollapse">
								<div class="my-toggl-icon">
									<span class="bar1"></span>
									<span class="bar2"></span>
									<span class="bar3"></span>
								</div>
							</a>
						</div>

						<div class="right-eliment">
							<ul class="list">

								<li class="bell-area">
									<a id="notf_conv" class="dropdown-toggle-1" href="javascript:;">
										<i class="far fa-envelope"></i>
										<span data-href="<?php echo e(route('conv-notf-count')); ?>"
											id="conv-notf-count"><?php echo e(App\Models\Notification::countConversation()); ?></span>
									</a>
									<div class="dropdown-menu">
										<div class="dropdownmenu-wrapper" data-href="<?php echo e(route('conv-notf-show')); ?>"
											id="conv-notf-show">
										</div>
									</div>
								</li>

								<li class="bell-area">
									<a id="notf_product" class="dropdown-toggle-1" href="javascript:;">
										<i class="icofont-cart"></i>
										<span data-href="<?php echo e(route('product-notf-count')); ?>"
											id="product-notf-count"><?php echo e(App\Models\Notification::countProduct()); ?></span>
									</a>
									<div class="dropdown-menu">
										<div class="dropdownmenu-wrapper" data-href="<?php echo e(route('product-notf-show')); ?>"
											id="product-notf-show">
										</div>
									</div>
								</li>

								<li class="bell-area">
									<a id="notf_user" class="dropdown-toggle-1" href="javascript:;">
										<i class="far fa-user"></i>
										<span data-href="<?php echo e(route('user-notf-count')); ?>"
											id="user-notf-count"><?php echo e(App\Models\Notification::countRegistration()); ?></span>
									</a>
									<div class="dropdown-menu">
										<div class="dropdownmenu-wrapper" data-href="<?php echo e(route('user-notf-show')); ?>"
											id="user-notf-show">
										</div>
									</div>
								</li>

								<li class="bell-area">
									<a id="notf_order" class="dropdown-toggle-1" href="javascript:;">
										<i class="far fa-newspaper"></i>
										<span data-href="<?php echo e(route('order-notf-count')); ?>"
											id="order-notf-count"><?php echo e(App\Models\Notification::countOrder()); ?></span>
									</a>
									<div class="dropdown-menu">
										<div class="dropdownmenu-wrapper" data-href="<?php echo e(route('order-notf-show')); ?>"
											id="order-notf-show">
										</div>
									</div>
								</li>

								<li class="login-profile-area">
									<a class="dropdown-toggle-1" href="javascript:;">
										<div class="user-img">
											<img src="<?php echo e(Auth::guard('admin')->user()->photo ? asset('assets/images/admins/'.Auth::guard('admin')->user()->photo ):asset('assets/images/noimage.png')); ?>"
												alt="">
										</div>
									</a>
									<div class="dropdown-menu">
										<div class="dropdownmenu-wrapper">
											<ul>
												<h5><?php echo e(__('Welcome!')); ?></h5>
												<li>
													<a href="<?php echo e(route('admin.profile')); ?>"><i class="fas fa-user"></i>
														<?php echo e(__('Edit Profile')); ?></a>
												</li>
												<li>
													<a href="<?php echo e(route('admin.password')); ?>"><i class="fas fa-cog"></i>
														<?php echo e(__('Change Password')); ?></a>
												</li>
												<li>
													<a href="<?php echo e(route('admin.logout')); ?>"><i
															class="fas fa-power-off"></i> <?php echo e(__('Logout')); ?></a>
												</li>
											</ul>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- Header Menu Area End -->
			<div class="wrapper">
				<!-- Side Menu Area Start -->
				<nav id="sidebar" class="nav-sidebar">
					<ul class="list-unstyled components" id="accordion">
						<li>
							<a href="<?php echo e(route('admin.dashboard')); ?>" class="wave-effect active"><i
									class="fa fa-home mr-2"></i><?php echo e(__('Dashboard')); ?></a>
						</li>
						<li>
							<a href="#order" class="accordion-toggle wave-effect" data-toggle="collapse"
								aria-expanded="false"><i class="fas fa-hand-holding-usd"></i><?php echo e(__('Orders')); ?></a>
							<ul class="collapse list-unstyled" id="order" data-parent="#accordion">
								<li>
									<a href="<?php echo e(route('admin-order-index')); ?>"> <?php echo e(__('All Orders')); ?></a>
								</li>
								<li>
									<a href="<?php echo e(route('admin-order-pending')); ?>"> <?php echo e(__('Pending Orders')); ?></a>
								</li>
								<li>
									<a href="<?php echo e(route('admin-order-processing')); ?>"> <?php echo e(__('Processing Orders')); ?></a>
								</li>
								<li>
									<a href="<?php echo e(route('admin-order-completed')); ?>"> <?php echo e(__('Completed Orders')); ?></a>
								</li>
								<li>
									<a href="<?php echo e(route('admin-order-declined')); ?>"> <?php echo e(__('Declined Orders')); ?></a>
								</li>

							</ul>
						</li>
						<li>
							<a href="#menu2" class="accordion-toggle wave-effect" data-toggle="collapse"
								aria-expanded="false">
								<i class="icofont-cart"></i><?php echo e(__('Products')); ?>

							</a>
							<ul class="collapse list-unstyled" id="menu2" data-parent="#accordion">
								<li>
									<a
										href="<?php echo e(route('admin-prod-types')); ?>"><span><?php echo e(__('Add New Product')); ?></span></a>
								</li>
								<li>
									<a href="<?php echo e(route('admin-prod-index')); ?>"><span><?php echo e(__('All Products')); ?></span></a>
								</li>
								<li>
									<a
										href="<?php echo e(route('admin-prod-deactive')); ?>"><span><?php echo e(__('Deactivated Product')); ?></span></a>
								</li>
							</ul>
						</li>

						<li>
							<a href="#affiliateprod" class="accordion-toggle wave-effect" data-toggle="collapse"
								aria-expanded="false">
								<i class="icofont-cart"></i><?php echo e(__('Affiliate Products')); ?>

							</a>
							<ul class="collapse list-unstyled" id="affiliateprod" data-parent="#accordion">
								<li>
									<a
										href="<?php echo e(route('admin-import-create')); ?>"><span><?php echo e(__('Add Affiliate Product')); ?></span></a>
								</li>
								<li>
									<a
										href="<?php echo e(route('admin-import-index')); ?>"><span><?php echo e(__('All Affiliate Products')); ?></span></a>
								</li>
							</ul>
						</li>

						<li>
							<a href="#menu3" class="accordion-toggle wave-effect" data-toggle="collapse"
								aria-expanded="false">
								<i class="icofont-user"></i><?php echo e(__('Customers')); ?>

							</a>
							<ul class="collapse list-unstyled" id="menu3" data-parent="#accordion">
								<li>
									<a
										href="<?php echo e(route('admin-user-index')); ?>"><span><?php echo e(__('Customers List')); ?></span></a>
								</li>
								<li>
									<a href="<?php echo e(route('admin-withdraw-index')); ?>"><span><?php echo e(__('Withdraws')); ?></span></a>
								</li>
								<li>
									<a
										href="<?php echo e(route('admin-user-image')); ?>"><span><?php echo e(__('Customer Default Image')); ?></span></a>
								</li>
							</ul>
						</li>





						<li>
							<a href="#menu5" class="accordion-toggle wave-effect" data-toggle="collapse"
								aria-expanded="false"><i class="fas fa-sitemap"></i><?php echo e(__('Manage Categories')); ?></a>
							<ul class="collapse list-unstyled" id="menu5" data-parent="#accordion">
								<li>
									<a href="<?php echo e(route('admin-cat-index')); ?>"><span><?php echo e(__('Main Category')); ?></span></a>
								</li>
								<li>
									<a
										href="<?php echo e(route('admin-subcat-index')); ?>"><span><?php echo e(__('Sub Category')); ?></span></a>
								</li>
								<li>
									<a
										href="<?php echo e(route('admin-childcat-index')); ?>"><span><?php echo e(__('Child Category')); ?></span></a>
								</li>
							</ul>
						</li>

						<li>
							<a href="<?php echo e(route('admin-prod-import')); ?>"><i
									class="fas fa-upload"></i><?php echo e(__('Bulk Product Upload')); ?></a>
						</li>

						<li>
							<a href="#menu4" class="accordion-toggle wave-effect" data-toggle="collapse"
								aria-expanded="false">
								<i class="icofont-speech-comments"></i><?php echo e(__('Product Discussion')); ?>

							</a>
							<ul class="collapse list-unstyled" id="menu4" data-parent="#accordion">
								<li>
									<a
										href="<?php echo e(route('admin-rating-index')); ?>"><span><?php echo e(__('Product Reviews')); ?></span></a>
								</li>
								<li>
									<a href="<?php echo e(route('admin-comment-index')); ?>"><span><?php echo e(__('Comments')); ?></span></a>
								</li>
								<li>
									<a href="<?php echo e(route('admin-report-index')); ?>"><span><?php echo e(__('Reports')); ?></span></a>
								</li>
							</ul>
						</li>

						<li>
							<a href="<?php echo e(route('admin-coupon-index')); ?>" class=" wave-effect"><i
									class="fas fa-percentage"></i><?php echo e(__('Set Coupons')); ?></a>
						</li>
						<li>
							<a href="#Blog" class="accordion-toggle wave-effect" data-toggle="collapse"
								aria-expanded="false">
								<i class="fas fa-fw fa-newspaper"></i><?php echo e(__('Blog')); ?>

							</a>
							<ul class="collapse list-unstyled" id="Blog" data-parent="#accordion">
								<li>
									<a href="<?php echo e(route('admin-cblog-index')); ?>"><span><?php echo e(__('Categories')); ?></span></a>
								</li>
								<li>
									<a href="<?php echo e(route('admin-blog-index')); ?>"><span><?php echo e(__('Posts')); ?></span></a>
								</li>
							</ul>
						</li>

						<li>
							<a href="#msg" class="accordion-toggle wave-effect" data-toggle="collapse"
								aria-expanded="false">
								<i class="fas fa-fw fa-newspaper"></i><?php echo e(__('Messages')); ?>

							</a>
							<ul class="collapse list-unstyled" id="msg" data-parent="#accordion">
								<li>
									<a href="<?php echo e(route('admin-message-index')); ?>"><span><?php echo e(__('Tickets')); ?></span></a>
								</li>
								<li>
									<a href="<?php echo e(route('admin-message-dispute')); ?>"><span><?php echo e(__('Disputes')); ?></span></a>
								</li>
							</ul>
						</li>


						<?php if(Auth::guard('admin')->user()->IsAdmin()): ?>

						<li>
							<a href="#general" class="accordion-toggle wave-effect" data-toggle="collapse"
								aria-expanded="false">
								<i class="fas fa-cogs"></i><?php echo e(__('General Settings')); ?>

							</a>
							<ul class="collapse list-unstyled" id="general" data-parent="#accordion">
								<li>
									<a href="<?php echo e(route('admin-gs-logo')); ?>"><span><?php echo e(__('Logo')); ?></span></a>
								</li>
								<li>
									<a href="<?php echo e(route('admin-gs-fav')); ?>"><span><?php echo e(__('Favicon')); ?></span></a>
								</li>
								<li>
									<a href="<?php echo e(route('admin-gs-load')); ?>"><span><?php echo e(__('Loader')); ?></span></a>
								</li>
								<li>
									<a
										href="<?php echo e(route('admin-delivery-index')); ?>"><span><?php echo e(__('Delivery Methods')); ?></span></a>
								</li>
								<li>
									<a href="<?php echo e(route('admin-package-index')); ?>"><span><?php echo e(__('Packagings')); ?></span></a>
								</li>
								<li>
									<a
										href="<?php echo e(route('admin-pick-index')); ?>"><span><?php echo e(__('Pickup Locations')); ?></span></a>
								</li>
								<li>
									<a
										href="<?php echo e(route('admin-gs-contents')); ?>"><span><?php echo e(__('Website Contents')); ?></span></a>
								</li>
								<li>
									<a href="<?php echo e(route('admin-gs-footer')); ?>"><span><?php echo e(__('Footer')); ?></span></a>
								</li>
								<li>
									<a
										href="<?php echo e(route('admin-gs-affilate')); ?>"><span><?php echo e(__('Affiliate Information')); ?></span></a>
								</li>

								<li>
									<a href="<?php echo e(route('admin-gs-popup')); ?>"><span><?php echo e(__('Popup Banner')); ?></span></a>
								</li>


								<li>
									<a
										href="<?php echo e(route('admin-gs-error-banner')); ?>"><span><?php echo e(__('Error Banner')); ?></span></a>
								</li>

							</ul>
						</li>

						<?php endif; ?>


						<li>
							<a href="#homepage" class="accordion-toggle wave-effect" data-toggle="collapse"
								aria-expanded="false">
								<i class="fas fa-edit"></i><?php echo e(__('Home Page Settings')); ?>

							</a>
							<ul class="collapse list-unstyled" id="homepage" data-parent="#accordion">
								<li>
									<a href="<?php echo e(route('admin-sl-index')); ?>"><span><?php echo e(__('Sliders')); ?></span></a>
								</li>
								<li>
									<a href="<?php echo e(route('admin-featuredlink-index')); ?>"><span><?php echo e(__('Featured Links')); ?></span></a>
								</li>
								<li>
									<a href="<?php echo e(route('admin-featuredbanner-index')); ?>"><span><?php echo e(__('Featured Banners')); ?></span></a>
								</li>
								<li>
									<a href="<?php echo e(route('admin-service-index')); ?>"><span><?php echo e(__('Services')); ?></span></a>
								</li>
								<li>
									<a
										href="<?php echo e(route('admin-ps-best-seller')); ?>"><span><?php echo e(__('Right Side Banner1')); ?></span></a>
								</li>
								<li>
									<a
										href="<?php echo e(route('admin-ps-big-save')); ?>"><span><?php echo e(__('Right Side Banner2')); ?></span></a>
								</li>
								<li>
									<a
										href="<?php echo e(route('admin-sb-index')); ?>"><span><?php echo e(__('Top Small Banners')); ?></span></a>
								</li>

								<li>
									<a href="<?php echo e(route('admin-sb-large')); ?>"><span><?php echo e(__('Large Banners')); ?></span></a>
								</li>
								<li>
									<a
										href="<?php echo e(route('admin-sb-bottom')); ?>"><span><?php echo e(__('Bottom Small Banners')); ?></span></a>
								</li>

								<li>
									<a href="<?php echo e(route('admin-review-index')); ?>"><span><?php echo e(__('Reviews')); ?></span></a>
								</li>
								<li>
									<a href="<?php echo e(route('admin-partner-index')); ?>"><span><?php echo e(__('Partners')); ?></span></a>
								</li>


								<li>
									<a
										href="<?php echo e(route('admin-ps-customize')); ?>"><span><?php echo e(__('Home Page Customization')); ?></span></a>
								</li>
							</ul>
						</li>


						<?php if(Auth::guard('admin')->user()->IsAdmin()): ?>


						<li>
							<a href="#menu" class="accordion-toggle wave-effect" data-toggle="collapse"
								aria-expanded="false">
								<i class="fas fa-file-code"></i><?php echo e(__('Menu Page Settings')); ?>

							</a>
							<ul class="collapse list-unstyled" id="menu" data-parent="#accordion">
								<li>
									<a href="<?php echo e(route('admin-Faq-index')); ?>"><span><?php echo e(__('Faq Page')); ?></span></a>
								</li>
								<li>
									<a
										href="<?php echo e(route('admin-ps-contact')); ?>"><span><?php echo e(__('Contact Us Page')); ?></span></a>
								</li>
								<li>
									<a href="<?php echo e(route('admin-page-index')); ?>"><span><?php echo e(__('Other Pages')); ?></span></a>
								</li>
							</ul>
						</li>
						<li>
							<a href="#emails" class="accordion-toggle wave-effect" data-toggle="collapse"
								aria-expanded="false">
								<i class="fas fa-at"></i><?php echo e(__('Email Settings')); ?>

							</a>
							<ul class="collapse list-unstyled" id="emails" data-parent="#accordion">
								<li><a href="<?php echo e(route('admin-mail-index')); ?>"><span><?php echo e(__('Email Template')); ?></span></a>
								</li>
								<li><a
										href="<?php echo e(route('admin-mail-config')); ?>"><span><?php echo e(__('Email Configurations')); ?></span></a>
								</li>
								<li><a href="<?php echo e(route('admin-group-show')); ?>"><span><?php echo e(__('Group Email')); ?></span></a>
								</li>
							</ul>
						</li>

						<li>
							<a href="#payments" class="accordion-toggle wave-effect" data-toggle="collapse"
								aria-expanded="false">
								<i class="fas fa-file-code"></i><?php echo e(__('Payment Settings')); ?>

							</a>
							<ul class="collapse list-unstyled" id="payments" data-parent="#accordion">
								<li><a
										href="<?php echo e(route('admin-gs-payments')); ?>"><span><?php echo e(__('Payment Information')); ?></span></a>
								</li>
								<li><a
										href="<?php echo e(route('admin-payment-index')); ?>"><span><?php echo e(__('Payment Gateways')); ?></span></a>
								</li>
								<li><a href="<?php echo e(route('admin-currency-index')); ?>"><span><?php echo e(__('Currencies')); ?></span></a>
								</li>
							</ul>
						</li>

						<li>
							<a href="#socials" class="accordion-toggle wave-effect" data-toggle="collapse"
								aria-expanded="false">
								<i class="fas fa-paper-plane"></i><?php echo e(__('Social Settings')); ?>

							</a>
							<ul class="collapse list-unstyled" id="socials" data-parent="#accordion">
								<li><a href="<?php echo e(route('admin-social-index')); ?>"><span><?php echo e(__('Social Links')); ?></span></a>
								</li>
								<li><a
										href="<?php echo e(route('admin-social-facebook')); ?>"><span><?php echo e(__('Facebook Login')); ?></span></a>
								</li>
								<li><a href="<?php echo e(route('admin-social-google')); ?>"><span><?php echo e(__('Google Login')); ?></span></a>
								</li>
							</ul>
						</li>

						<li>
							<a href="#langs" class="accordion-toggle wave-effect" data-toggle="collapse"
								aria-expanded="false">
								<i class="fas fa-language"></i><?php echo e(__('Language Settings')); ?>

							</a>
							<ul class="collapse list-unstyled" id="langs" data-parent="#accordion">
								<li><a
										href="<?php echo e(route('admin-lang-index')); ?>"><span><?php echo e(__('Website Language')); ?></span></a>
								</li>
								<li><a
										href="<?php echo e(route('admin-tlang-index')); ?>"><span><?php echo e(__('Admin Panel Language')); ?></span></a>
								</li>

							</ul>
						</li>

						<li>
							<a href="#seoTools" class="accordion-toggle wave-effect" data-toggle="collapse"
								aria-expanded="false">
								<i class="fas fa-wrench"></i><?php echo e(__('SEO Tools')); ?>

							</a>
							<ul class="collapse list-unstyled" id="seoTools" data-parent="#accordion">
								<li>
									<a
										href="<?php echo e(route('admin-prod-popular',30)); ?>"><span><?php echo e(__('Popular Products')); ?></span></a>
								</li>
								<li>
									<a
										href="<?php echo e(route('admin-seotool-analytics')); ?>"><span><?php echo e(__('Google Analytics')); ?></span></a>
								</li>
								<li>
									<a
										href="<?php echo e(route('admin-seotool-keywords')); ?>"><span><?php echo e(__('Website Meta Keywords')); ?></span></a>
								</li>
							</ul>
						</li>
						<li>
							<a href="<?php echo e(route('admin-staff-index')); ?>" class=" wave-effect"><i
									class="fas fa-user-secret"></i><?php echo e(__('Manage Staffs')); ?></a>
						</li>


						<li>
							<a href="<?php echo e(route('admin-subs-index')); ?>" class=" wave-effect"><i
									class="fas fa-users-cog mr-2"></i><?php echo e(__('Subscribers')); ?></a>
						</li>

						<li>
							<a href="#sactive" class="accordion-toggle wave-effect" data-toggle="collapse"
								aria-expanded="false">
								<i class="fas fa-cog"></i><?php echo e(__('System Activation')); ?>

							</a>
							<ul class="collapse list-unstyled" id="sactive" data-parent="#accordion">

								<li><a href="<?php echo e(route('admin-activation-form')); ?>"> <?php echo e(__('Activation')); ?></a></li>
								<li><a href="<?php echo e(route('admin-generate-backup')); ?>"> <?php echo e(__('Generate Backup')); ?></a></li>
							</ul>
						</li>

						<?php endif; ?>


					</ul>

					<p class="version-name"> Version: 1.2</p>
				</nav>
				<!-- Main Content Area Start -->
				<?php echo $__env->yieldContent('content'); ?>
				<!-- Main Content Area End -->
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var mainurl = "<?php echo e(url('/')); ?>";
		var admin_loader = <?php echo e($gs->is_admin_loader); ?>;
		var whole_sell = <?php echo e($gs->wholesell); ?>;
	</script>

	<!-- Dashboard Core -->
	<script src="<?php echo e(asset('assets/admin/js/vendors/jquery-1.12.4.min.js')); ?>"></script>
	<script src="<?php echo e(asset('assets/admin/js/vendors/bootstrap.min.js')); ?>"></script>
	<script src="<?php echo e(asset('assets/admin/js/jqueryui.min.js')); ?>"></script>
	<!-- Fullside-menu Js-->
	<script src="<?php echo e(asset('assets/admin/plugins/fullside-menu/jquery.slimscroll.min.js')); ?>"></script>
	<script src="<?php echo e(asset('assets/admin/plugins/fullside-menu/waves.min.js')); ?>"></script>

	<script src="<?php echo e(asset('assets/admin/js/plugin.js')); ?>"></script>
	<script src="<?php echo e(asset('assets/admin/js/Chart.min.js')); ?>"></script>
	<script src="<?php echo e(asset('assets/admin/js/tag-it.js')); ?>"></script>
	<script src="<?php echo e(asset('assets/admin/js/nicEdit.js')); ?>"></script>
	<script src="<?php echo e(asset('assets/admin/js/bootstrap-colorpicker.min.js')); ?>"></script>
	<script src="<?php echo e(asset('assets/admin/js/notify.js')); ?>"></script>

	<script src="<?php echo e(asset('assets/admin/js/jquery.canvasjs.min.js')); ?>"></script>

	<script src="<?php echo e(asset('assets/admin/js/load.js')); ?>"></script>
	<!-- Custom Js-->
	<script src="<?php echo e(asset('assets/admin/js/custom.js')); ?>"></script>
	<!-- AJAX Js-->
	<script src="<?php echo e(asset('assets/admin/js/myscript.js')); ?>"></script>
	<?php echo $__env->yieldContent('scripts'); ?>

	<?php if($gs->is_admin_loader == 0): ?>
	<style>
		div#geniustable_processing {
			display: none !important;
		}
	</style>
	<?php endif; ?>

</body>

</html>