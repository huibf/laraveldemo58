{{ $id }}<br>
{{ $user['username'] }}<br>

{{ Auth::guard('admin')->user()->username }}<br>
<a href="{{ url('/admin/loginout') }}">退出</a>
<br>

@if (Session::has('flash_dangermsg'))

        {{Session::get('flash_dangermsg')}}

@endif
