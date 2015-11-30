@extends('app')

@section('title')
{{$title}}
@endsection

@section('content')

@if ( !$BlogPost->count() )
There is no post till now. Login and write a new post now!!!
@else
<div class="">
	@foreach( $BlogPost as $post )
	<div class="list-group">
		<div class="list-group-item">
			<h3><a href="{{ url('/'.$post->slug) }}">{{ $post->title }}</a>
				@if(!Auth::guest() && ($post->author_id == Auth::user()->id || Auth::user()->is_admin()))
					@if($post->active == '1')
					<a href="{{ url('edit/'.$post->slug.'&'.$post->id)}}"><button class="btn" style="float: right">Edit Post</button></a>
					@else
					<a href="{{ url('edit/'.$post->slug)}}"><button class="btn" style="float: right">Edit Draft</button></a>
					@endif
				@endif
			</h3>
			<p>{{ $post->created_at->format('M d,Y \a\t h:i a') }} By <a href="{{ url('/user/'.$post->author_id)}}">{{ $post->author->name }}</a></p>
			
		</div>
		<div class="list-group-item">
			<article>
				{!! str_limit($post->body, $limit = 1500, $end = '....... <a href='.url("/".$post->slug).'>Read More</a>') !!}
			</article>
		</div>
	</div>
	@endforeach
	{!! $BlogPost->render() !!}
</div>
@endif

@endsection
