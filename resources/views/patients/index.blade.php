@extends('layouts.app')

@section('content')

<div class="bg-white p-6 rounded shadow">
	<h1 class="text-2xl font-semibold mb-4">Patients</h1>
	<div class="overflow-x-auto">
		<table class="min-w-full divide-y divide-gray-200">
			<thead class="bg-gray-50">
				<tr>
					<th class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
					<th class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">First Name</th>
					<th class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Last Name</th>
					<th class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">DOB</th>
					<th class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Gender</th>
				</tr>
			</thead>
			<tbody class="bg-white divide-y divide-gray-200">
				@forelse($patients as $patient)
					<tr>
						<td class="px-4 py-2">{{ $patient->id }}</td>
						<td class="px-4 py-2">{{ $patient->first_name ?? '' }}</td>
						<td class="px-4 py-2">{{ $patient->last_name ?? '' }}</td>
						<td class="px-4 py-2">{{ $patient->dob ?? '' }}</td>
						<td class="px-4 py-2">{{ $patient->gender ?? '' }}</td>
					</tr>
				@empty
					<tr>
						<td colspan="5" class="px-4 py-6 text-center text-gray-500">No patients found.</td>
					</tr>
				@endforelse
			</tbody>
		</table>
	</div>
</div>
@endsection
