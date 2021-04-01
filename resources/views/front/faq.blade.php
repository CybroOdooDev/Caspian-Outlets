@extends('layouts.front')
@section('content')

<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <ul class="pages">
          <li>
            <a href="{{ route('front.index') }}">
              {{ $langg->lang17 }}
            </a>
          </li>
          <li>
            <a href="{{ route('front.Faq') }}">
              {{ $langg->lang19 }}
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>
<!-- Breadcrumb Area End -->



<!-- Faq Area Start -->
<section class="Faq-section">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-8 col-md-10">
        <div id="accordion">

          @foreach($Faqs as $fq)
          <h3 class="heading">{{ $fq->title }}</h3>
          <div class="content">
            <p>{!! $fq->details !!}</p>
          </div>
          @endforeach
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Faq Area End-->

@endsection