<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    protected $fillable = [
        'title', 'title_slug', 'category_id', 'announcement', 'text', 'active'
    ];

    // Категория новости
    public function category() {
        return $this->hasOne('App\Category', 'id', 'category_id');
    }

    // Комментарии к новости
    public function comments() {
        return $this->hasMany('App\Comment', 'news_id', 'id');
    }

    // Условие получения только активных новостей
    public function scopeActive($query) {
        return $query->where('active', 1);
    }

    public function setAnnouncementAttribute($value)
    {
        $this->attributes['announcement'] = strip_tags($value);
    }

    public function setTextAttribute($value)
    {
        $this->attributes['text'] = strip_tags($value);
    }
}
