<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Trade extends Model
{
    {
        protected $table = 'trades';
    
        protected $guarded = array('id');
      
        public $timestamps = true;
}
