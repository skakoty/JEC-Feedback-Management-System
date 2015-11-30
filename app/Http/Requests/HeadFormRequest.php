<?php namespace App\Http\Requests;

use App\Http\Requests\Request;
use App\User;
use Auth;
class HeadFormRequest extends Request {

	/**
	 * Determine if the user is authorized to make this request.
	 *
	 * @return bool
	 */
	public function authorize()
	{
		if($this->user()->can_post())
	    {
	      return true;
	    }
	    return false;
	}

	/**
	 * Get the validation rules that apply to the request.
	 *
	 * @return array
	 */
	public function rules()
	{
		return [
			'headid' => 'required',
		    'headname' => 'required',
		];
	}

}