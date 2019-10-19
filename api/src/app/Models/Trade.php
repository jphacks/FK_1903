<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Trade extends Model
{
    protected $table = 'trades';

    protected $guarded = array('id');
    
    public $timestamps = true;

    protected $fillable =[
        'sneaker_id'
        , 'size'
        , 'price'
        , 'trade_date'
    ];

    public function getData($id=null)
    {
      $query = DB::table($this->table);

      if($id != null) $query->where('sneaker_id', $id);
    
      $data = $query->select(
                        'id'
                        , 'size'
                        , 'price as tradePrice'
                        , 'trade_date as tradeDate'
                        )
                    ->get();

      return $data;
    }

    public function getSizeData($id=null)
    {
      $query = DB::table($this->table);

      if($id != null) $query->where('sneaker_id', $id);
    
      $data = $query->select(
                        \DB::raw('min(price) as lowestPrice,
                        size'
                    ))
                    ->groupBy(\DB::raw('size'))
                    ->get();

      return $data;
    }
}
