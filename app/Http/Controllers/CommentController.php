<?php

namespace App\Http\Controllers;

use App\News;
use Illuminate\Http\Request;

class CommentController extends Controller
{

    public function store(Request $request, $newsId) {
        $news = News::findOrFail((int)$newsId);
        $this->validate($request, [
            'name' => 'required|max:70',
            'text' => 'required',
        ]);
        if ($news->comments()->create($request->all())) :
            return ($request->ajax())
                ? json_encode('Комментарий успешно создан!')
                : back()->with('message_success', 'Комментарий успешно создан!');
        else:
            return ($request->ajax())
                ? json_encode('Ошибка при сохранении комментария!')
                : back()->with('message_error', 'Ошибка при сохранении комментария!');
        endif;
    }
}
