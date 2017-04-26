<?php

namespace App;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = [
        'title', 'parent_id'
    ];

    // Получение дерева категорий
    // Получаем все категории, в которых есть хотя бы одна новость и выстраиваем их в дерево.
    // Если в любой из категорий, являющейся родительской к найденной, нет ни одной новости, то
    // дочерняя категория сама становится родительской (чтобы не плодить ссылок на пустые родительские категории)
    // Изначальная вложенность категорий будет показана только тогда, когда в каждой категории из цепочки есть новость(-и)
    protected static function getCategoriesTree() {
        $categories = self::has('news')->with('parent')->get()->keyBy('id')->toArray();
        $children = [];
        foreach ($categories as $id => &$category) {
            if (!empty($category['parent_id']) && !empty($categories[$id])) {
                $children[] = $id;
                $categories[$category['parent_id']]['children'][$id] =& $category;
            }
        }
        // Циклы не объединены в один, так как это бы работало корректно только при ORDER BY id DESC
        // данный вариант работает для любого порядка id
        foreach ($children as $childId) {
            unset($categories[$childId]);
        }
        return $categories;
    }

    // Родительская категория
    public function parent() {
        return $this->hasOne('App\Category', 'id', 'parent_id');
    }

    // Новости в этой категории
    public function news() {
        return $this->hasMany('App\News', 'category_id', 'id');
    }

    // Условие получения дочерних категорий
    public function scopeChilds($query, $parentId) {
        return $query->where('parent_id',$parentId);
    }
}
