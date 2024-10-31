<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\MenuService;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\Storage;
use App\Models\M_template;
use App\Models\M_invitation_type;

class C_template extends Controller
{
    protected $menuService;

    public function __construct(MenuService $menuService)
    {
        $this->menuService = $menuService;
    }

    public function index(Request $request)
    {
        $user_id = Auth::user()->id;
        $role_id = Auth::user()->role_id;

        if ($request->ajax()) {
            $templates = M_template::with('invitation_type')->orderBy('id', 'desc');

            return DataTables::of($templates)
                ->addColumn('invitation_type_name', function ($template) {
                    return $template->invitation_type->invitation_type_name ?? 'N/A';
                })
                ->make(true);
        } else {
            $menus = $this->menuService->getMenus($role_id);
        }

        return view('template.V_index_template', compact('menus'));
    }

    public function create()
    {
        $user_id = Auth::user()->id;
        $role_id = Auth::user()->role_id;

        $menus = $this->menuService->getMenus($role_id);
        $invitation_type_list = M_invitation_type::orderBy('invitation_type_name', 'ASC')->get()
            ->mapWithKeys(function ($item) {
                return [$item->id => $item->invitation_type_name];
            })->toArray();

        $publication_status_list = [
            'Yes' => 'Yes',
            'No'  => 'No',
        ];

        return view('template.V_create_template', compact('menus', 'invitation_type_list', 'publication_status_list'));
    }

    public function store(Request $request)
    {
        try {
            $request->validate([
                'image'              => 'required|image|mimes:jpeg,png,jpg,gif|max:5120',
                'invitation_type_id' => 'required|integer',
                'template_code'      => 'required|string|max:255',
                'parameter'          => 'required|string|max:255',
                'template_name'      => 'required|string|max:255',
                'example_url'        => 'required|string',
                'price'              => 'required|string|max:255',
                'percent_discount'   => 'required|string|max:255',
                'publication_status' => 'required|string|max:255',
            ]);

            $data = $request->all();
            if ($request->hasFile('image')) {
                $filePath      = $request->file('image')->store('templates', 'public');
                $data['image'] = $filePath;
            }
            $data['total_amount'] = $request->price - ($request->price * ($request->percent_discount / 100));
            M_template::create($data);

            return redirect()->route('templates.index')->with('success', 'Data added successfully.');
        } catch (ValidationException $e) {
            return redirect()->back()->with('error', 'Data added failed, please check again.')->withErrors($e->validator)->withInput();
        }
    }

    public function edit(M_template $template)
    {
        $user_id = Auth::user()->id;
        $role_id = Auth::user()->role_id;

        $menus = $this->menuService->getMenus($role_id);
        $invitation_type_list = M_invitation_type::orderBy('invitation_type_name', 'ASC')->get()
            ->mapWithKeys(function ($item) {
                return [$item->id => $item->invitation_type_name];
            })->toArray();

        $publication_status_list = [
            'Yes' => 'Yes',
            'No'  => 'No',
        ];

        return view('template.V_edit_template', compact('menus', 'template', 'invitation_type_list', 'publication_status_list'));
    }

    public function update(Request $request, M_template $template)
    {
        try {
            $request->validate([
                'image'              => 'nullable|image|mimes:jpeg,png,jpg,gif|max:5120',
                'invitation_type_id' => 'required|integer',
                'template_code'      => 'required|string|max:255',
                'parameter'          => 'required|string|max:255',
                'template_name'      => 'required|string|max:255',
                'example_url'        => 'required|string',
                'price'              => 'required|string|max:255',
                'percent_discount'   => 'required|string|max:255',
                'publication_status' => 'required|string|max:255',
            ]);

            $data = $request->all();
            if ($request->hasFile('image')) {
                if ($template->image) {
                    Storage::disk('public')->delete($template->image);
                }

                $filePath      = $request->file('image')->store('templates', 'public');
                $data['image'] = $filePath;
            }
            $data['total_amount'] = $request->price - ($request->price * ($request->percent_discount / 100));
            $template->update($data);

            return redirect()->route('templates.index')->with('success', 'Data updated successfully.');
        } catch (ValidationException $e) {
            return redirect()->back()->with('error', 'Data failed to update, please check again.')->withErrors($e->validator)->withInput();
        }
    }

    public function destroy(M_template $template)
    {
        try {
            $template->delete();
            return redirect()->route('templates.index')->with('success', 'Data deleted successfully.');
        } catch (\Exception $e) {
            return redirect()->route('templates.index')->with('error', 'Data failed to delete.');
        }
    }
}
