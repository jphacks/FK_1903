<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Sneaker extends Model
{
    protected $table = 'sneakers';

    protected $guarded = array('id');
  
    public $timestamps = true;

    protected $fillable =[
        'name_main'
        , 'name_sub'
        , 'image'
        , 'part_no'
        , 'colors'
        , 'release_date'
        , 'regular_price'
    ];
  
    public function getData($id=null)
    {
      $query = DB::table($this->table);

      if($id != null) $query->where('id', $id);
    
      $data = $query->select(
                        'id'
                        , 'name_main as nameMain'
                        , 'name_sub as nameSub'
                        , 'image'
                        , 'part_no as partNo'
                        , 'colors'
                        , 'release_date as releaseDate'
                        , 'regular_price as regularPrice'
                        )
                    ->get();

      return $data;
    }
}
