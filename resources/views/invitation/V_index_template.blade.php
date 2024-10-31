@extends('layouts.app_dashboard')

@push('title')
    Templat Undangan
@endpush

@section('content')
    <div class="main-content">
        <section class="section">
            <div class="section-header">
                <h1>Templat Undangan</h1>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="{{ url('dashboard') }}">Dashboard</a></div>
                    <div class="breadcrumb-item active"><a href="{{ url('invitations') }}">Daftar Undangan</a></div>
                    <div class="breadcrumb-item">Templat Undangan</div>
                </div>
            </div>
            <div class="section-body">
                <div class="row" id="template">
                    @foreach ($templates as $item)
                        <div class="col-6 col-sm-4 col-md-3 col-lg-3">
                            <div class="card position-relative">
                                <div class="discount-label" style="position: absolute; top: 10px; right: 10px; background-color: red; color: white; padding: 5px; border-radius: 5px; display: {{ $item->percent_discount > 0 ? 'block' : 'none' }};">
                                    {{ $item->percent_discount }}% Diskon
                                </div>
                                <div class="card-body text-left p-2">
                                    <div class="text-center">
                                        <img src="{{ Storage::url($item->image) }}" class="img-thumbnail" style="height: 200px; object-fit: contain;">
                                    </div>
                                    <div class="mt-2 mb-2">
                                        <h6 class="mb-0">{{ $item->template_name }}</h6>
                                        <small>{{ $item->invitation_type->invitation_type_name }}</small>
                                    </div>

                                    @if ($item->percent_discount <= 0)
                                        <h6 class="text-success">Rp. {{ number_format($item->price) }}</h6>
                                    @else
                                        <div class="row">
                                            <div class="col-md-6 text-nowrap">
                                                <h6><del>Rp. {{ number_format($item->price) }}</del></h6>
                                            </div>
                                            <div class="col-md-6 text-nowrap">
                                                <h6 class="text-success">Rp. {{ number_format($item->total_amount) }}</h6>
                                            </div>
                                        </div>
                                    @endif

                                </div>
                                <div class="card-footer p-2 d-flex">
                                    <a href="{{ asset($item->example_url) }}" class="btn btn-sm btn-info" target="_blank">Lihat Contoh</a>
                                    <form action="{{ route('invitations.store_invitation') }}" method="POST" class="ml-auto">
                                        @csrf
                                        <input type="hidden" name="template_id" id="template_id" value="{{ $item->id }}">
                                        <button type="submit" class="btn btn-sm btn-primary">Pilih</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>

                @if (!$templates->isEmpty())
                    <div class="text-center">
                        <button id="load-more-template" class="btn btn-primary">
                            Lihat templat lainnya
                        </button>
                    </div>
                @endif

            </div>
        </section>
    </div>
@endsection

@push('styles')
@endpush

@push('scripts')
    <script>
        let offset = {{ count($templates) }};

        $('#load-more-template').on('click', function() {
            $.ajax({
                url: '/invitations/load_more_template',
                type: 'GET',
                data: {
                    offset: offset
                },
                success: function(data) {
                    if (data.length > 0) {
                        data.forEach(item => {
                            $('#template').append(`       
                                                <div class="col-6 col-sm-4 col-md-3 col-lg-3">
                                                    <div class="card position-relative">
                                                        <div class="discount-label" style="position: absolute; top: 10px; right: 10px; background-color: red; color: white; padding: 5px; border-radius: 5px; display: ${item.percent_discount > 0 ? 'block' : 'none'};">
                                                            ${item.percent_discount}% Diskon
                                                        </div>
                                                        <div class="card-body text-left p-2">
                                                            <div class="text-center">
                                                                <img src="${item.image}" class="img-thumbnail" style="height: 200px; object-fit: contain;">
                                                            </div>
                                                            <div class="mt-2 mb-2">
                                                                <h6 class="mb-0">${item.template_name}</h6>
                                                                <small>${item.invitation_type_name}</small>
                                                            </div>

                                                           ${item.percent_discount <= 0 ?
                                                                `<h6 class="text-success">Rp. ${item.price}</h6>` :
                                                                `<div class="row">
                                                                        <div class="col-md-6 text-nowrap">
                                                                            <h6><del>Rp. ${item.price}</del></h6>
                                                                        </div>
                                                                        <div class="col-md-6 text-nowrap">
                                                                            <h6 class="text-success">Rp. ${item.total_amount}</h6>
                                                                        </div>
                                                                     </div>`
                                                            }

                                                        </div>
                                                        <div class="card-footer p-2 d-flex">
                                                            <a href="${item.example_url}" class="btn btn-sm btn-info" target="_blank">Lihat Contoh</a>
                                                            <form action="{{ route('invitations.store_invitation') }}" method="POST" class="ml-auto">
                                                                @csrf
                                                                <input type="hidden" name="template_id" id="template_id" value="${item.id}">
                                                                <button type="submit" class="btn btn-sm btn-primary">Pilih</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                                `);
                        });
                        offset += data.length;
                    } else {
                        $('#load-more-template').text('Tidak ada lagi templat yang tersedia').prop('disabled', true);
                    }
                },
                error: function() {
                    alert('Terjadi kesalahan saat memuat templat.');
                }
            });
        });
    </script>
@endpush
