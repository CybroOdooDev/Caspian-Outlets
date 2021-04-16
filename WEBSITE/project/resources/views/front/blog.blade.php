@extends('layouts.front')
@section('content')


<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <ul class="pages">

          {{-- Category Breadcumbs --}}

          @if(isset($bcat))

          <li>
            <a href="{{ route('front.index') }}">
              {{ $langg->lang17 }}
            </a>
          </li>
          <li>
            <a href="{{ route('front.blog') }}">
              {{ $langg->lang18 }}
            </a>
          </li>
          <li>
            <a href="{{ route('front.blogcategory',$bcat->slug) }}">
              {{ $bcat->name }}
            </a>
          </li>

          @elseif(isset($slug))

          <li>
            <a href="{{ route('front.index') }}">
              {{ $langg->lang17 }}
            </a>
          </li>
          <li>
            <a href="{{ route('front.blog') }}">
              {{ $langg->lang18 }}
            </a>
          </li>
          <li>
            <a href="{{ route('front.blogtags',$slug) }}">
              {{ $langg->lang35 }}: {{ $slug }}
            </a>
          </li>

          @elseif(isset($search))

          <li>
            <a href="{{ route('front.index') }}">
              {{ $langg->lang17 }}
            </a>
          </li>
          <li>
            <a href="{{ route('front.blog') }}">
              {{ $langg->lang18 }}
            </a>
          </li>
          <li>
            <a href="Javascript:;">
              {{ $langg->lang36 }}
            </a>
          </li>
          <li>
            <a href="Javascript:;">
              {{ $search }}
            </a>
          </li>

          @elseif(isset($date))

          <li>
            <a href="{{ route('front.index') }}">
              {{ $langg->lang17 }}
            </a>
          </li>
          <li>
            <a href="{{ route('front.blog') }}">
              {{ $langg->lang18 }}
            </a>
          </li>
          <li>
            <a href="Javascript:;">
              {{ $langg->lang37 }}: {{ date('F Y',strtotime($date)) }}
            </a>
          </li>

          @else

          <li>
            <a href="{{ route('front.index') }}">
              {{ $langg->lang17 }}
            </a>
          </li>
          <li>
            <a href="{{ route('front.blog') }}">
              {{ $langg->lang18 }}
            </a>
          </li>
          @endif

        </ul>
      </div>
    </div>
  </div>
</div>
<!-- Breadcrumb Area End -->

<!-- Blog Page Area Start -->
<section class="Blogpagearea">
  <div class="container">
    <div id="ajaxContent">

      <div class="row">

        @foreach($Blogs as $Blogg)
        
        <div class="col-md-6 col-lg-4">
          <div class="Blog-box">
            <div class="Blog-images">
              <div class="img">
                <img
                  src="{{ $Blogg->photo ? asset('assets/images/Blogs/'.$Blogg->photo):asset('assets/images/noimage.png') }}"
                  class="img-fluid" alt="">
                <div class="date d-flex justify-content-center">
                  <div class="box align-self-center">
                    <p>{{date('d', strtotime($Blogg->created_at))}}</p>
                    <p>{{date('M', strtotime($Blogg->created_at))}}</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="details">
              <a href='{{route('front.blogshow',$Blogg->id)}}'>
                <h4 class="Blog-title">
                  {{strlen($Blogg->title) > 50 ? substr($Blogg->title,0,50)."...":$Blogg->title}}
                </h4>
              </a>
              <p class="Blog-text">
                {{substr(strip_tags($Blogg->details),0,120)}}
              </p>
              <a class="read-more-btn" href="{{route('front.blogshow',$Blogg->id)}}">{{ $langg->lang38 }}</a>
            </div>
          </div>
        </div>

        @endforeach

      </div>

      <div class="page-center">
        {!! $Blogs->links() !!}
      </div>
    </div>

  </div>
</section>
<!-- Blog Page Area Start -->

@endsection