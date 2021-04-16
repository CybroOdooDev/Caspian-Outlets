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