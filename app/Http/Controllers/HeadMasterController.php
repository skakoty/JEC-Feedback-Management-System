<?php namespace App\Http\Controllers;

use App\HeadMaster;
use App\User;
use Redirect;
use App\Http\Controllers\Controller;
use App\Http\Requests\HeadFormRequest;
 
use Illuminate\Http\Request;

class HeadMasterController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		//
		 
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
		return view('head.add');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store(HeadFormRequest $request)
	{
		$head = new HeadMaster();
	    $head->headid = $request->get('headid');
	    $head->headname = $request->get('headname');
	    	    
	    $head->save();
	    $message = 'Head saved successfully';
	    return redirect('/headentry');
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
    {
      $head = HeadMaster::find($id);
      return view('head.show', array('head' => $head));
    }

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		//
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		//
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		//
	}

}
