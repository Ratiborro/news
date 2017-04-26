<?php

function displayCategories(array $categories, $level = 0) {
    foreach ($categories as $category) {
        echo str_repeat('>', $level).' <a href="'.route('categories.show', $category['id']).'">'.$category['title'].'</a><br>';
        if (!empty($category['children'])) {
            displayCategories($category['children'], $level + 1);
        }
    }
}