


@if($ps->flash_deal == 1)
<!-- Electronics Area Start -->
<section class="categori-item electronics-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 remove-padding">
				<div class="section-top">
					<h2 class="section-title">
						{{ $langg->lang244 }}
					</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="flash-deals">
					<div class="flas-deal-slider">

						@foreach($discount_products as $prod)
						@include('includes.product.flash-product')
						@endforeach
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Electronics Area start-->
@endif


@if($ps->service == 1)

{{-- Info Area Start --}}
<section class="info-area" style="margin-top: -3.2%; margin-bottom: 1%;">
	<div class="container">

		@foreach($services->chunk(4) as $chunk)

		<div class="row">

			<div class="col-lg-12 p-0">
				<div class="info-big-box">
					<div class="row">
						@foreach($chunk as $service)
						<div class="col-6 col-xl-3 p-0">
							<div class="info-box">
								<div class="icon">
									<img src="{{ asset('assets/images/services/'.$service->photo) }}">
								</div>
								<div class="info">
									<div class="details">
										<h4 class="title">{{ $service->title }}</h4>
										<p class="text">
											{!! $service->details !!}
										</p>
									</div>
								</div>
							</div>
						</div>
						@endforeach
					</div>
				</div>
			</div>

		</div>

		@endforeach

	</div>
</section>
{{-- Info Area End  --}}


@endif

@if($ps->small_banner == 1)
<!-- Banner Area One Start -->
<section class="banner-section">
	<div class="container">
		@foreach($top_small_banners->chunk(2) as $chunk)
		<div class="row">
			@foreach($chunk as $img)
			<div class="col-lg-6 remove-padding">
				<div class="left">
					<a class="banner-effect" href="{{ $img->link }}" target="_blank">
						<img src="{{asset('assets/images/banners/'.$img->photo)}}" alt="">
					</a>
				</div>
			</div>
			@endforeach
		</div>
		@endforeach
	</div>
</section>
<!-- Banner Area One Start -->
@endif

@if($ps->top_rated == 1)
<!-- Electronics Area Start -->
<section class="categori-item electronics-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 remove-padding">
				<div class="section-top">
					<h2 class="section-title">
						{{ $langg->lang28 }}
					</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="row">

					@foreach($top_products as $prod)
					@include('includes.product.top-product')
					@endforeach

				</div>
			</div>
		</div>
	</div>
</section>
<!-- Electronics Area start-->
@endif

@if($ps->large_banner == 1)
<!-- Banner Area One Start -->
<section class="banner-section">
	<div class="container">
		@foreach($large_banners->chunk(1) as $chunk)
		<div class="row">
			@foreach($chunk as $img)
			<div class="col-lg-12 remove-padding">
				<div class="img">
					<a class="banner-effect" href="{{ $img->link }}">
						<img src="{{asset('assets/images/banners/'.$img->photo)}}" alt="">
					</a>
				</div>
			</div>
			@endforeach
		</div>
		@endforeach
	</div>
</section>
<!-- Banner Area One Start -->
@endif


@if($ps->hot_sale == 1)
<!-- hot-and-new-item Area Start -->
<section class="hot-and-new-item">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="accessories-slider">
					<div class="slide-item">
						<div class="row">
							<div class="col-lg-3 col-sm-6">
								<div class="categori">
									<div class="section-top">
										<h2 class="section-title">
											{{ $langg->lang30 }}
										</h2>
									</div>
									<div class="hot-and-new-item-slider">
										@foreach($hot_products->chunk(3) as $chunk)
										<div class="item-slide">
											<ul class="item-list">
												@foreach($chunk as $prod)
												@include('includes.product.list-product')
												@endforeach
											</ul>
										</div>
										@endforeach
									</div>

								</div>
							</div>
							<div class="col-lg-3 col-sm-6">
								<div class="categori">
									<div class="section-top">
										<h2 class="section-title">
											{{ $langg->lang31 }}
										</h2>
									</div>

									<div class="hot-and-new-item-slider">

										@foreach($latest_products->chunk(3) as $chunk)
										<div class="item-slide">
											<ul class="item-list">
												@foreach($chunk as $prod)
												@include('includes.product.list-product')
												@endforeach
											</ul>
										</div>
										@endforeach

									</div>
								</div>
							</div>
							<div class="col-lg-3 col-sm-6">
								<div class="categori">
									<div class="section-top">
										<h2 class="section-title">
											{{ $langg->lang32 }}
										</h2>
									</div>


									<div class="hot-and-new-item-slider">

										@foreach($trending_products->chunk(3) as $chunk)
										<div class="item-slide">
											<ul class="item-list">
												@foreach($chunk as $prod)
												@include('includes.product.list-product')
												@endforeach
											</ul>
										</div>
										@endforeach

									</div>

								</div>
							</div>
							<div class="col-lg-3 col-sm-6">
								<div class="categori">
									<div class="section-top">
										<h2 class="section-title">
											{{ $langg->lang33 }}
										</h2>
									</div>

									<div class="hot-and-new-item-slider">

										@foreach($trending_products->chunk(3) as $chunk)
										<div class="item-slide">
											<ul class="item-list">
												@foreach($chunk as $prod)
												@include('includes.product.list-product')
												@endforeach
											</ul>
										</div>
										@endforeach

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Clothing and Apparel Area start-->
@endif

<!-- main -->
<script src="{{asset('assets/front/js/mainextra.js')}}"></script>