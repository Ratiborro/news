<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'NewsController@welcome')->name('welcome');

Auth::routes();
$this->get('admin', 'Auth\LoginController@showLoginForm')->name('login');
$this->post('admin', 'Auth\LoginController@login');

Route::resource('categories', 'CategoryController');

Route::resource('news', 'NewsController');

Route::post('news/{news}/comments/store', 'CommentController@store')->name('comments.store');

Route::get('/home', 'HomeController@index');
