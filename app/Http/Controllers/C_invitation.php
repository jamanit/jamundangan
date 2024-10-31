<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\MenuService;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;
use App\Models\M_template;
use App\Models\M_invitation;
use App\Models\M_transaction;
use App\Models\M_discount;
use App\Models\M_payment_method;

class C_invitation extends Controller
{
    protected $menuService;

    public function __construct(MenuService $menuService)
    {
        $this->menuService = $menuService;
    }

    public function template(Request $request)
    {
        $user_id = Auth::user()->id;
        $role_id = Auth::user()->role_id;

        $menus = $this->menuService->getMenus($role_id);

        $templates = M_template::where('publication_status', 'Yes')->orderBy('id', 'desc')->limit(4)->get();

        return view('invitation.V_index_template', compact('menus', 'templates'));
    }

    public function load_more_template(Request $request)
    {
        if ($request->ajax()) {
            $offset    = $request->input('offset', 0);
            $templates = M_template::orderBy('id', 'desc')->skip($offset)->take(6)->get();

            foreach ($templates as $template) {
                $template->id                   = $template->id;
                $template->image                = Storage::url($template->image);
                $template->template_name        = $template->template_name;
                $template->invitation_type_name = $template->invitation_type->invitation_type_name;
                $template->price                = number_format($template->price);
                $template->percent_discount     = number_format($template->percent_discount);
                $template->total_amount         = number_format($template->total_amount);
                $template->example_url          = $template->example_url;
            }

            return response()->json($templates);
        }

        return response()->json([], 404);
    }

    public function store_invitation(Request $request)
    {
        try {
            $user_id = Auth::user()->id;

            $data_invitation['template_id']       = $request->template_id;
            $data_invitation['invitation_code']   = date('Ymd-Hi') . '-' . rand(000, 9999);
            $data_invitation['user_id']           = $user_id;
            $data_invitation['invitation_status'] = 'Tertunda';
            $invitation                           = M_invitation::create($data_invitation);

            $template = M_template::findOrFail($invitation->template_id);

            $data_transaction['invitation_id']    = $invitation->id;
            $data_transaction['transaction_code'] = date('Ymd-Hi') . '-' . rand(000, 9999);
            $data_transaction['price']            = $template->price;
            $data_transaction['percent_discount'] = $template->percent_discount;
            $data_transaction['total_amount']     = $template->price - ($template->price * ($template->percent_discount / 100));

            $transaction = M_transaction::create($data_transaction);

            return redirect()->route('invitations.edit_transaction', $transaction->uuid);
        } catch (ValidationException $e) {
            return redirect()->back()->with('error', 'Gagal menambahkan data, harap periksa kembali.')->withErrors($e->validator)->withInput();
        }
    }

    public function edit_transaction(string $transaction_uuid)
    {
        $user_id = Auth::user()->id;
        $role_id = Auth::user()->role_id;

        $menus = $this->menuService->getMenus($role_id);

        $transaction     = M_transaction::with('invitation.user')->where('uuid', $transaction_uuid)->firstOrFail();
        $payment_methods = M_payment_method::orderBy('id', 'desc')->get();

        return view('invitation.V_edit_transaction', compact('menus', 'transaction', 'payment_methods'));
    }

    public function update_transaction(Request $request, string $transaction_uuid)
    {
        try {
            $request->validate([
                'payment_receipt' => 'required|image|mimes:jpeg,png,jpg,gif|max:5024',
            ]);

            $transaction = M_transaction::where('uuid', $transaction_uuid)->firstOrFail();

            $data_transaction = $request->all();
            if ($request->hasFile('payment_receipt')) {
                if ($transaction->payment_receipt) {
                    Storage::disk('public')->delete($transaction->payment_receipt);
                }

                $filePath                            = $request->file('payment_receipt')->store('transaction', 'public');
                $data_transaction['payment_receipt'] = $filePath;
            }
            $transaction->update($data_transaction);

            $invitation                           = M_invitation::where('id', $transaction->invitation_id)->firstOrFail();
            $data_invitation['invitation_status'] = 'Ditinjau';
            $invitation->update($data_invitation);

            return redirect()->route('invitations.index')->with('success', 'Pembayaran diproses. Harap tunggu pembayaran Anda sedang ditinjau oleh admin.');
        } catch (ValidationException $e) {
            return redirect()->back()->with('error', 'Data gagal diperbarui, harap periksa kembali.')->withErrors($e->validator)->withInput();
        }
    }

    public function update_percent_discount(Request $request, string $transaction_uuid)
    {
        try {
            $request->validate([
                'discount_code'    => 'required|string|max:255',
                'percent_discount' => 'required|string|max:255',
            ]);

            $transaction = M_transaction::where('uuid', $transaction_uuid)->firstOrFail();

            if ($transaction->percent_discount > 0) {
                return redirect()->back()->with('error', 'Kode diskon tidak dapat digunakan karena transaksi ini sudah mendapatkan diskon.')->withInput();
            } else {
                $discount = M_discount::where('discount_code', $request->discount_code)
                    ->where('expired_date', '>=', now())
                    ->first();

                if (!$discount) {
                    return redirect()->back()->with('error', 'Kode diskon tidak valid atau sudah kadaluarsa.')->withInput();
                }

                $data['discount_code']    = $discount->discount_code;
                $data['percent_discount'] = $discount->percent_discount;

                $price                = $transaction->price;
                $total_amount         = $price - ($price * $discount->percent_discount) / 100;
                $data['total_amount'] = $total_amount;
                $transaction->update($data);
                return redirect()->back()->with('success', 'Diskon berhasil diterapkan!');
            }

            return redirect()->route('invitations.index')->with('success', 'Pembayaran berhasil. Harap tunggu pembayaran Anda sedang ditinjau oleh admin.');
        } catch (ValidationException $e) {
            return redirect()->back()->with('error', 'Data gagal diperbarui, harap periksa kembali.')->withErrors($e->validator)->withInput();
        }
    }

    public function update_invitation_status(string $invitaion_id, string $status)
    {
        try {
            $invitation = M_invitation::where('id', $invitaion_id)->firstOrFail();
            if ($status == 'active') {
                $data['invitation_status'] = 'Aktif';
            } elseif ($status == 'rejected') {
                $data['invitation_status'] = 'Ditolak';
            } else {
                $data['invitation_status'] = 'Tidak Aktif';
            }
            $invitation->update($data);

            return redirect()->route('invitations.index')->with('success', 'Data berhasil diperbarui.');
        } catch (ValidationException $e) {
            return redirect()->back()->with('error', 'Data gagal diperbarui, harap periksa kembali.')->withErrors($e->validator)->withInput();
        }
    }

    public function index(Request $request)
    {
        $user_id = Auth::user()->id;
        $role_id = Auth::user()->role_id;

        if ($request->ajax()) {
            $query = M_invitation::with('template.invitation_type', 'transaction')->select('*')->orderBy('id', 'desc');
            if ($role_id === 4) {
                $query->where('user_id', $user_id);
            }
            $invitations = $query->get();

            return DataTables::of($invitations)
                ->addColumn('invitation_type_name', function ($invitation) {
                    return  $invitation->template->invitation_type->invitation_type_name ?? 'N/A';
                })
                ->addColumn('template_name', function ($invitation) {
                    return  $invitation->template->template_name ?? 'N/A';
                })
                ->addColumn('parameter', function ($invitation) {
                    return  $invitation->template->parameter ?? 'N/A';
                })
                ->addColumn('created_at', function ($invitation) {
                    return  date('d-m-Y H:i', strtotime($invitation->created_at)) ?? 'N/A';
                })
                ->addColumn('transaction_uuid', function ($invitation) {
                    return  $invitation->transaction->uuid ?? 'N/A';
                })
                ->make(true);
        } else {
            $menus = $this->menuService->getMenus($role_id);
        }

        return view('invitation.V_index_invitation', compact('menus'));
    }

    public function destroy(M_invitation $invitation)
    {
        try {
            DB::beginTransaction();

            foreach (['transaction', 'cover', 'wedding_couple', 'quote', 'event', 'love_stories', 'galleries', 'streaming', 'gifts', 'audio', 'closing', 'guests', 'messages'] as $relation) {
                if ($invitation->$relation) {
                    $invitation->$relation()->delete();
                }
            }
            $invitation->delete();

            DB::commit();
            return redirect()->route('invitations.index')->with('success', 'Data berhasil dihapus.');
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->route('invitations.index')->with('error', 'Data gagal dihapus.');
        }
    }

    public function show_invitation(string $invitation_id, string $wedding_couple = null, string $guest_name = null)
    {
        $invitation = M_invitation::with([
            'template',
            'transaction',
            'cover',
            'wedding_couple',
            'quote',
            'event',
            'love_stories',
            'streaming',
            'gifts',
            'galleries',
            'audio',
            'closing',
            'guests',
            'messages',
        ])->where('id', $invitation_id)->first();

        return view('invitation.' . $invitation->template->parameter . '.V_' . $invitation->template->template_code, compact('invitation', 'guest_name'));
    }
}
