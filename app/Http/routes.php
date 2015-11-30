<?php
 
/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/
 
Route::get('/','ControllerIndex@index');
 
Route::get('/home',['as' => 'home', 'uses' => 'ControllerIndex@index']);
 
//authentication
Route::controllers([
'auth' => 'Auth\AuthController',
'password' => 'Auth\PasswordController',
]);
 
// check for logged in user
Route::group(['middleware' => ['auth']], function()
{
// add head form
Route::get('headentry','HeadMasterController@create');
// save head
Route::post('addhead','HeadMasterController@store');

});
 
//users profile
Route::get('user/{id}','ControllerLoginUser@index')->where('id', '[0-9]+');
 
// display list of posts
Route::get('user/{id}/posts','UserController@user_posts')->where('id', '[0-9]+');
 
// display single post
Route::get('/{slug}',['as' => 'post', 'uses' => 'PostController@show'])->where('slug', '[A-Za-z0-9-_]+');

//Route::resource('headentry', 'PostController@headentry');//'headmaster' is the app alias
//Route::get('headentry','PostController@headentry');