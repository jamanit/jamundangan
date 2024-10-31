@extends('layouts.app_dashboard')

@push('title')
    Transaksi Undangan
@endpush

@section('content')
    <div class="main-content">
        <section class="section">
            <div class="section-header">
                <h1>Transaksi Undangan</h1>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="{{ url('dashboard') }}">Dashboard</a></div>
                    <div class="breadcrumb-item active"><a href="{{ url('invitations') }}">Daftar Undangan</a></div>
                    <div class="breadcrumb-item">Transaksi Undangan</div>
                </div>
            </div>
            <div class="section-body">
                <div class="row">
                    <div class="col-12">
                        @if (session('success') || session('error'))
                            <x-alert :type="session('success') ? 'success' : 'danger'" :message="session('success') ? session('success') : session('error')" />
                        @endif

                        <div class="card">
                            <div class="card-body">
                                @if ($transaction->invitation->invitation_status == 'Tertunda')
                                    <x-alert :type="'warning'" :message="'Silakan melakukan pembayaran dan mengirimkan bukti pembayaran.'" />
                                @endif

                                @if ($transaction->invitation->invitation_status == 'Ditinjau')
                                    <x-alert :type="'primary'" :message="'Pembayaran diproses. Harap tunggu karena pembayaran Anda sedang ditinjau oleh admin.'" />
                                @endif

                                @if ($transaction->invitation->invitation_status == 'Ditolak')
                                    <x-alert :type="'danger'" :message="'Pembayaran gagal. Silakan periksa kembali bukti pembayaran Anda.'" />
                                @endif

                                @if ($transaction->invitation->invitation_status == 'Aktif')
                                    <x-alert :type="'success'" :message="'Pembayaran berhasil. Silakan lengkapi data undangan Anda.'" />
                                @endif

                                @if ($transaction->invitation->invitation_status == 'Tidak Aktif')
                                    <x-alert :type="'secondary'" :message="'Undangan tidak aktif.'" />
                                @endif

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <x-input type="text" name="" label="Kode Transaksi" :value="$transaction->transaction_code" readonly />
                                        </div>
                                        <div class="mb-3">
                                            <x-input type="text" name="" label="Tanggal Transaksi" :value="$transaction->created_at" readonly />
                                        </div>
                                        <div class="mb-3">
                                            <x-input type="text" name="" label="Nama" :value="$transaction->invitation->user->nick_name" readonly />
                                        </div>
                                        <div class="mb-3">
                                            <x-input type="text" name="" label="Email" :value="$transaction->invitation->user->email" readonly />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <x-input type="text" name="" label="Status Undangan" :value="$transaction->invitation->invitation_status" readonly />
                                        </div>
                                        <div class="mb-3">
                                            <x-input type="text" name="" label="Harga" :value="'Rp. ' . number_format($transaction->price)" readonly />
                                        </div>

                                        <form action="{{ route('invitations.update_percent_discount', $transaction->uuid) }}" method="POST">
                                            @csrf
                                            @method('PUT')
                                            <div class="mb-3">
                                                <label for="discount_code">Diskon</label>
                                                <div class="d-flex">
                                                    <input type="text" name="discount_code" id="discount_code" placeholder="Masukkan Kode Diskon" class="form-control  @error('discount_code') is-invalid @enderror">
                                                    <input type="text" name="percent_discount" id="percent_discount" value="{{ $transaction->percent_discount }}%" class="form-control ml-1" style="width: 20%" readonly>
                                                    <button type="submit" class="btn btn-primary ml-1">Cek Kode</button>
                                                </div>
                                                @error('discount_code')
                                                    <div class="text-danger small font-weight-bold" role="alert">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </form>

                                        <div class="mb-3">
                                            <x-input type="text" name="" label="Total Harga" :value="'Rp. ' . number_format($transaction->total_amount)" readonly />
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <hr>
                                        <h6 class="mb-3">Silakan membayar melalui daftar metode pembayaran berikut, dan kirimkan bukti gambar kepada kami:</h6>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <ul class="list-group">
                                                    @foreach ($payment_methods as $item)
                                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                                            <span>
                                                                {{ $item->account_name . ' / ' . $item->account_number . ' / ' . $item->account_holder }}
                                                            </span>
                                                            <i class="fas fa-copy copy-icon" onclick="copyToClipboard('{{ $item->account_number }}')" title="Copy" style="cursor: pointer;"></i>
                                                        </li>
                                                    @endforeach
                                                </ul>
                                            </div>
                                            <div class="col-md-6">

                                                <form id="form-transaction" action="{{ route('invitations.update_transaction', $transaction->uuid) }}" method="POST" enctype="multipart/form-data">
                                                    @csrf
                                                    @method('PUT')
                                                    <div class="mb-3">
                                                        <x-input_file type="file" name="payment_receipt" label="Bukti Pembayaran" :value="$transaction->payment_receipt" image readonly />
                                                    </div>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer bg-whitesmoke d-flex">
                                <button type="button" class="btn btn-primary btn-loading" id="btn-transaction" data-loading-text="Memuat">Kirim</button>
                                @if (Auth::user()->role->button_access == 1)
                                    <a href="#" class="btn btn-warning text-white ml-auto" data-toggle="modal" data-target="#paymentStatusModal">
                                        Ubah Status Undangan
                                    </a>
                                @endif
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
    </div>

    <div class="modal fade" tabindex="-1" role="dialog" id="paymentStatusModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Ubah Status Undangan</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Pilih status undangan di bawah.</p>
                </div>
                <div class="modal-footer bg-whitesmoke br">
                    <a href="{{ url('invitations/update_invitation_status/' . $transaction->invitation_id . '/active') }}" class="btn btn-success btn-loading" data-loading-text="Memuat">Aktif</a>
                    <a href="{{ url('invitations/update_invitation_status/' . $transaction->invitation_id . '/rejected') }}" class="btn btn-warning btn-loading" data-loading-text="Memuat">Ditolak</a>
                    <a href="{{ url('invitations/update_invitation_status/' . $transaction->invitation_id . '/inactive') }}" class="btn btn-secondary btn-loading" data-loading-text="Memuat">Tidak Aktif</a>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('styles')
    <style>
        .copy-icon {
            cursor: pointer;
            margin-left: 8px;
            transition: color 0.3s;
            font-size: 18px;
        }

        .copy-icon:hover {
            color: #6777ef;
        }
    </style>
@endpush

@push('scripts')
    <script>
        function copyToClipboard(accountNumber) {
            const el = document.createElement('input');
            el.value = accountNumber;
            document.body.appendChild(el);
            el.select();
            document.execCommand('copy');
            document.body.removeChild(el);

            Swal.fire({
                toast: true,
                position: 'top-end',
                icon: 'success',
                title: 'Disalin',
                showConfirmButton: false,
                timer: 3000
            });
        }
    </script>

    <script>
        $(document).ready(function() {
            $('#btn-transaction').on('click', function() {
                $('#form-transaction').submit();
            });
        });
    </script>
@endpush
