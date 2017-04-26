<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    protected $fillable = [
        'name', 'news_id', 'text'
    ];

    // Прокомментированная новость
    public function news() {
        return $this->hasOne('App\News', 'id', 'news_id');
    }

    public function setNameAttribute($value)
    {
        $this->attributes['name'] = strip_tags($value);
    }

    public function setTextAttribute($value)
    {
        $this->attributes['text'] = strip_tags($value);
    }
}
