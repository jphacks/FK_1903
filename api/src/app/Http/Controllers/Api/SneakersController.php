<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\Sneaker;
use App\Http\Controllers\Controller;

define('HOME_CATEGORY_NUM', 3);

class SneakersController extends Controller
{
    public function index()
    {
        $sneaker = new Sneaker();

        $datas = $sneaker->getData();

        $data_json = [
            'id' => 1,
            'num' => HOME_CATEGORY_NUM,
            'popular' => self::toArrayPopular($datas),
            'lowest' => self::toArrayLowest($datas),
            'highest' => self::toArrayHighest($datas),
        ];

        return response()->json(
            $data_json,
            200,
            [],
            JSON_UNESCAPED_UNICODE
        );
    }

    public function store(Request $request)
    {
        $sneaker = new Sneaker();

        $sneaker->name_main = $request->input('nameMain');
        $sneaker->name_sub = $request->input('nameSub');
        $sneaker->image = $request->input('image');
        $sneaker->part_no = $request->input('partNo');
        $sneaker->colors = self::toStringforColors($request);
        $sneaker->release_date = $request->input('releaseDate');
        $sneaker->regular_price = $request->input('regularPrice');

        $sneaker->save();

        return response([], 201);
    }

    public function popular()
    {
        $sneaker = new Sneaker();

        $datas = $sneaker->getData();

        $data_json = [
            'id' => 1,
            'sneakerNum' => HOME_CATEGORY_NUM,
            'sneakers' => self::toArrayPopular($datas),
        ];

        return response()->json(
            $data_json,
            200,
            [],
            JSON_UNESCAPED_UNICODE
        );
    }

    public function lowest()
    {
        $sneaker = new Sneaker();

        $datas = $sneaker->getData();

        $data_json = [
            'id' => 1,
            'sneakerNum' => HOME_CATEGORY_NUM,
            'sneakers' => self::toArrayLowest($datas),
        ];

        return response()->json(
            $data_json,
            200,
            [],
            JSON_UNESCAPED_UNICODE
        );
    }

    public function highest()
    {
        $sneaker = new Sneaker();

        $datas = $sneaker->getData();

        $data_json = [
            'id' => 1,
            'sneakerNum' => HOME_CATEGORY_NUM,
            'sneakers' => self::toArrayHighest($datas),
        ];

        return response()->json(
            $data_json,
            200,
            [],
            JSON_UNESCAPED_UNICODE
        );
    }

    public function show($id)
    {
        $sneaker = new Sneaker();

        $data_json = $sneaker->getData($id);

        return response()->json(
            $data_json,
            200,
            [],
            JSON_UNESCAPED_UNICODE
        );
    }

    public function destroy($id)
    {
        $store = Sneaker::find($id);
        $store->delete();
        return response([], 204);  
    }

    private function toStringforColors($requet_obejct)
    {
        $colors = $requet_obejct->input('colors');

        $response_str = '';
        
        $i = 0;
        while(count($colors) > $i){
            if($i == 0) $response_str = $colors[$i]['name'];
            else $response_str = $response_str . ',' . $colors[$i]['name'];
            ++$i;
        }

        return $response_str;
    }

    private function toArrayPopular($requet_obejct)
    {
        $response_arr = [];

        $i = 0;
        while(HOME_CATEGORY_NUM > $i){
            $arr_data  = [
                'id' => $requet_obejct[$i]->id,
                'nameMain' => $requet_obejct[$i]->nameMain,
                'nameSub' => $requet_obejct[$i]->nameSub,
                'image' => $requet_obejct[$i]->image,
                'price' => $requet_obejct[$i]->regularPrice,
            ];
            $response_arr[] = $arr_data;

            ++$i;
        }

        return $response_arr;
    }

    private function toArrayLowest($requet_obejct)
    {
        $response_arr = [];

        $i = 0;
        while(HOME_CATEGORY_NUM > $i){
            $arr_data  = [
                'id' => $requet_obejct[$i]->id,
                'nameMain' => $requet_obejct[$i]->nameMain,
                'nameSub' => $requet_obejct[$i]->nameSub,
                'image' => $requet_obejct[$i]->image,
                'price' => $requet_obejct[$i]->regularPrice,
            ];
            $response_arr[] = $arr_data;

            ++$i;
        }

        return $response_arr;
    }

    private function toArrayHighest($requet_obejct)
    {
        $response_arr = [];

        $i = 0;
        while(HOME_CATEGORY_NUM > $i){
            $arr_data  = [
                'id' => $requet_obejct[$i]->id,
                'nameMain' => $requet_obejct[$i]->nameMain,
                'nameSub' => $requet_obejct[$i]->nameSub,
                'image' => $requet_obejct[$i]->image,
                'price' => $requet_obejct[$i]->regularPrice,
            ];
            $response_arr[] = $arr_data;

            ++$i;
        }

        return $response_arr;
    }
}
