@extends('app')

@section('head')
Add New Head
@endsection

@section('content')

<form action='{{ url("/addhead") }}' method="post">
	<input type="hidden" name="_token" value="{{ csrf_token() }}">
	<div class="form-group">
		<input required="required" value="{{ old('headid') }}" placeholder="Enter head id here" type="text" style="width: 942px;" name = "headid" class="form-control" />
	</div>
	<div class="form-group">
		<input required="required" value="{{ old('headname') }}" placeholder="Enter head name here" type="text" style="width: 942px;" name = "headname" class="form-control" />
	</div>
	<input type="submit" name='save' class="btn btn-success" value = "Save"/>
	<input type="button" name='cancel' class="btn btn-default" value = "Cancel" onclick="history.back();" />
</form>
@endsection
