<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\Trade;
use App\Http\Controllers\Controller;

class TradesController extends Controller
{
    public function store(Request $request)
    {
        $trade = new Trade();

        $trade->sneaker_id = $request->input('sneakerId');
        $trade->size = $request->input('size');
        $trade->price = $request->input('tradePrice');
        $trade->trade_date = $request->input('tradeDate');

        $trade->save();

        return response([], 201);
    }

    public function show($id)
    {
        $trade = new Trade();

        $data = $trade->getData($id);

        $data_json = [
            'id' => $id,
            'sneakerNum' => count($data),
            'sneakers' => self::toArray($data),
        ];

        return response()->json(
            $data_json,
            200,
            [],
            JSON_UNESCAPED_UNICODE
        );
    }

    public function showSize($id)
    {
        $trade = new Trade();

        $data = $trade->getSizeData($id);

        $data_json = [
            'id' => $id,
            'sizes' => self::toArraySize($data),
        ];

        return response()->json(
            $data_json,
            200,
            [],
            JSON_UNESCAPED_UNICODE
        );
    }

    private function toArray($requet_obejct)
    {
        $response_arr = [];

        $i = 0;
        while(count($requet_obejct) > $i){
            $arr_data  = [
                'id' => $requet_obejct[$i]->id,
                'size' => $requet_obejct[$i]->size,
                'tradePrice' => $requet_obejct[$i]->tradePrice,
                'tradeDate' => $requet_obejct[$i]->tradeDate,
            ];
            $response_arr[] = $arr_data;

            ++$i;
        }

        return $response_arr;
    }

    private function toArraySize($requet_obejct)
    {
        $response_arr = [];

        $sizeFigure = [0, 25, 25.5, 26, 26.5, 27, 27.5, 28, 28.5, 29, 29.5, 30];

        foreach($sizeFigure as $size){
            $arr_data = [
                'size' => $size,
                'lowestPrice' => self::getPriceFromSize($size, $requet_obejct)
            ];
            $response_arr[] = $arr_data;
        }

        return $response_arr;
    }

    private function getPriceFromSize($size, $requet_obejct)
    {
        if($size == 0){
            $lowestPrice = $requet_obejct[0]->lowestPrice;
            $i = 1;
            while(count($requet_obejct) > $i){
                if($lowestPrice > $requet_obejct[$i]->lowestPrice){
                    $lowestPrice = $requet_obejct[$i]->lowestPrice;
                }
                ++$i;
            }
            return $lowestPrice;
        }

        $i = 0;
        while(count($requet_obejct) > $i){
            if($size == $requet_obejct[$i]->size){
                return $requet_obejct[$i]->lowestPrice;
            }
            ++$i;
        }

        return 0;
    }
}
