<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>{{ config('app.name', 'My Clinic') }}</title>
	<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-900">
	<nav class="bg-white border-b border-gray-200">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
			<div class="flex justify-between h-16 items-center">
				<a href="/" class="text-xl font-semibold">{{ config('app.name', 'MyClinic') }}</a>
				<div class="space-x-4">
					@auth
						<a href="{{ route('patients.index') }}" class="text-gray-700 hover:text-gray-900">Patients</a>
						<form method="POST" action="{{ route('logout') }}" class="inline">
							@csrf
							<button type="submit" class="px-3 py-1 bg-gray-800 text-white rounded">Logout</button>
						</form>
					@else
						<a href="{{ route('login') }}" class="text-gray-700 hover:text-gray-900">Login</a>
						<a href="{{ route('register') }}" class="text-gray-700 hover:text-gray-900">Register</a>
					@endauth
				</div>
			</div>
		</div>
	</nav>
	<main class="max-w-7xl mx-auto p-6">
		@yield('content')
	</main>
</body>
</html>
