<?php

namespace App\Http\Controllers;

use App\Category;
use App\News;
use Illuminate\Http\Request;

class NewsController extends Controller
{

    function __construct()
    {
        $this->middleware('admin', ['except' => ['show', 'welcome']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $news = News::with('category')->get();
        return view('news.index', compact('news'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::pluck('title', 'id');
        return view('news.create', compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'required|max:70|unique:news,title',
            'category_id' => 'required|integer|exists:categories,id',
            'announcement' => 'required',
            'text' => 'required',
            'active' => 'required|boolean'
        ]);
        $news = new News;
        $news->fill($request->all());
        $news->title_slug = str_slug($request->title);
        if ($news->save()) :
            return ($request->ajax())
                ? json_encode('Новость успешно создана!')
                : back()->with('message_success', 'Новость успешно создана!');
        else:
            return ($request->ajax())
                ? json_encode('Ошибка при сохранении новости!')
                : back()->with('message_error', 'Ошибка при создании новости!');
        endif;
    }

    /**
     * Display the specified resource.
     *
     * @param $title_slug
     * @return \Illuminate\Http\Response
     * @internal param int $id
     */
    public function show($title_slug)
    {
        $news = News::with('comments')->where('title_slug', $title_slug)->firstOrFail();
        return view('news.show', compact('news'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $news = News::findOrFail($id);
        $categories = Category::all()->pluck('title', 'id');
        return view('news.edit', compact('news','categories'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'title' => 'required|max:70|unique:news,title,'.$id,
            'title_slug' => 'required|alpha_dash|unique:news,title_slug,'.$id,
            'category_id' => 'required|integer|exists:categories,id',
            'announcement' => 'required',
            'text' => 'required',
            'active' => 'required|boolean'
        ]);
        $news = News::findOrFail($id);
        $news->fill($request->all());
        $news->title_slug = str_slug($request->title);
        if ($news->update($request->all())) :
            return ($request->ajax())
                ? json_encode('Новость успешно отредактирована!')
                : back()->with('message_success', 'Новость успешно отредактирована!');
        else:
            return ($request->ajax())
                ? json_encode('Ошибка при редактировании новости!')
                : back()->with('message_error', 'Ошибка при редактировании новости!');
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
        if (News::findOrFail($id)->delete()) :
            return ($request->ajax())
                ? json_encode('Новость успешно удалена!')
                : back()->with('message_success', 'Новость успешно удалена!');
        else:
            return ($request->ajax())
                ? json_encode('Ошибка при удалении новости!')
                : back()->with('message_error', 'Ошибка при удалении новости!');
        endif;
    }

    public function welcome(Request $request) {
        $this->validate($request, [
            'sort' => 'sometimes|in:ASC,DESC'
        ]);
        $categories = Category::getCategoriesTree();
        $sort = ($request->has('sort') && $request->sort == 'ASC') ? 'ASC' : 'DESC';
        $news = News::active()->orderBy('created_at', $sort)->paginate(3);
        return view('welcome', compact('categories','news', 'sort'));
    }
}
