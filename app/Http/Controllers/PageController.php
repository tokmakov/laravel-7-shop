<?php

namespace App\Http\Controllers;

use App\Models\Page;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;

class PageController extends Controller {
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param App\Models\Page $page
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request, Page $page) {
        return view('page.show', compact('page'));
    }
}
