@extends('layouts.app')

@section('content')
<div class="max-w-md mx-auto bg-white p-6 rounded shadow">
	<h1 class="text-2xl font-semibold mb-4">Login</h1>
	@if ($errors->any())
		<div class="mb-4 text-red-600">
			{{ $errors->first() }}
		</div>
	@endif
	<form method="POST" action="{{ url('/login') }}" class="space-y-4">
		@csrf
		<div>
			<label class="block text-sm font-medium">Email</label>
			<input name="email" type="email" value="{{ old('email') }}" required class="mt-1 w-full border rounded px-3 py-2" />
		</div>
		<div>
			<label class="block text-sm font-medium">Password</label>
			<input name="password" type="password" required class="mt-1 w-full border rounded px-3 py-2" />
		</div>
		<div class="flex items-center justify-between">
			<label class="inline-flex items-center text-sm">
				<input type="checkbox" name="remember" class="mr-2"> Remember me
			</label>
			<a href="{{ url('/') }}" class="text-sm text-blue-600">Back</a>
		</div>
		<button type="submit" class="w-full bg-blue-600 text-white py-2 rounded">Login</button>
	</form>
</div>
@endsection
