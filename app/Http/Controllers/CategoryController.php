<?php

namespace App\Http\Controllers;

use App\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    function __construct()
    {
        $this->middleware('admin', ['except' => 'show']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Category::with('parent')->get();
        return view('categories.index', compact('categories'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::all()->pluck('title', 'id');
        return view('categories.create', compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'required|max:70|unique:categories,title|regex:/^[a-zа-яё0-9\s]+$/iu',
            'parent_id' => 'nullable|integer|exists:categories,id',
        ]);
        if (Category::create($request->all())) :
            return ($request->ajax())
                ? json_encode('Категория успешно создана!')
                : back()->with('message_success', 'Категория успешно создана!');
        else:
            return ($request->ajax())
                ? json_encode('Ошибка при сохранении категории!')
                : back()->with('message_error', 'Ошибка при создании категории!');
        endif;
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $category = Category::with(
            [
                'news' => function ($q) {
                    $q->active();
                }
            ]
        )->findOrFail($id);
        return view('categories.show', compact('category'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $category = Category::findOrFail($id);
        $categories = Category::all()->pluck('title', 'id');
        return view('categories.edit', compact('category', 'categories'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'title' => 'required|max:70|unique:categories,title,' . $id . '|regex:/^[a-zа-яё0-9\s]+$/iu',
            'parent_id' => 'nullable|integer|exists:categories,id',
        ]);
        $category = Category::findOrFail($id);
        if ($category->update($request->all())) :
            return ($request->ajax())
                ? json_encode('Категория успешно отредактирована!')
                : back()->with('message_success', 'Категория успешно отредактирована!');
        else:
            return ($request->ajax())
                ? json_encode('Ошибка при редактировании категории!')
                : back()->with('message_error', 'Ошибка при редактировании категории!');
        endif;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $id)
    {
        $category = Category::findOrFail($id);
        $childs = Category::childs($id);
        $category->delete();
        if ($category) :
            $childs->update(['parent_id' => null]);
            return ($request->ajax())
                ? json_encode('Категория успешно удалена!')
                : back()->with('message_success', 'Категория успешно удалена!');
        else:
            return ($request->ajax())
                ? json_encode('Ошибка при удалении категории!')
                : back()->with('message_error', 'Ошибка при удалении категории!');
        endif;
    }
}
