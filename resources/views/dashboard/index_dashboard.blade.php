@extends('layouts.app_dashboard')

@push('title')
    Dashboard
@endpush

@section('content')
    <div class="main-content">
        <section class="section">
            <div class="section-header">
                <h1>Dashboard</h1>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="{{ url('/') }}">Beranda</a></div>
                    <div class="breadcrumb-item">Dashboard</div>
                </div>
            </div>
            <div class="section-body">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <a href="{{ route('profiles.index') }}">
                            <div class="card card-statistic-1">
                                <div class="card-icon bg-primary">
                                    <i class="far fa-user"></i>
                                </div>
                                <div class="card-wrap">
                                    <div class="card-header">
                                        <h4>Profile</h4>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <a href="{{ route('invitations.template') }}">
                            <div class="card card-statistic-1">
                                <div class="card-icon bg-info">
                                    <i class="fas fa-plus"></i>
                                </div>
                                <div class="card-wrap">
                                    <div class="card-header">
                                        <h4>Buat Undangan</h4>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <a href="{{ route('invitations.index') }}">
                            <div class="card card-statistic-1">
                                <div class="card-icon bg-success">
                                    <i class="fas fa-envelope"></i>
                                </div>
                                <div class="card-wrap">
                                    <div class="card-header">
                                        <h4>Daftar Undangan</h4>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <a href="{{ route('contacts.show_contact_us') }}">
                            <div class="card card-statistic-1">
                                <div class="card-icon bg-secondary">
                                    <i class="fas fa-phone"></i>
                                </div>
                                <div class="card-wrap">
                                    <div class="card-header">
                                        <h4>Hubungi Kami</h4>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection

@push('styles')
@endpush

@push('scripts')
@endpush
