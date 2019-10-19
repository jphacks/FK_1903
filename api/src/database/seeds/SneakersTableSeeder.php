<?php

use Illuminate\Database\Seeder;

class SneakersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('sneakers')->insert([
            [
              'name_main' => 'NYC City of Athletes',
              'name_sub' => 'Air Force 1 Low',
              'image' => 'https://jphacks-looker.s3-ap-northeast-1.amazonaws.com/sneaker/travis.jpg',
              'part_no' => 'CT3610-100',
              'colors' => 'WHITE,BLACK-HYPER',
              'release_date' => '2019/10/17',
              'regular_price' => 13000,
              'created_at' => new DateTime(),
              'updated_at' => new DateTime(),
            ],
            [
              'name_main' => 'Travis Scott',
              'name_sub' => 'Jordan6 Retro',
              'image' => 'https://jphacks-looker.s3-ap-northeast-1.amazonaws.com/sneaker/travis.jpg',
              'part_no' => 'CN1084-200',
              'colors' => 'OLIVE,BLACK',
              'release_date' => '2019/10/11',
              'regular_price' => 25000,
              'created_at' => new DateTime(),
              'updated_at' => new DateTime(),
            ],
            [
              'name_main' => 'Mid sacai Black Grey',
              'name_sub' => 'Nike Blazer',
              'image' => 'https://jphacks-looker.s3-ap-northeast-1.amazonaws.com/sneaker/travis.jpg',
              'part_no' => 'BV0072-002',
              'colors' => 'BLACK,WHITE,GREY',
              'release_date' => '2019/10/10',
              'regular_price' => 14000,
              'created_at' => new DateTime(),
              'updated_at' => new DateTime(),
            ],
            [
              'name_main' => 'V2 Cloud White',
              'name_sub' => 'adidas Yeezy Boost 350',
              'image' => 'https://jphacks-looker.s3-ap-northeast-1.amazonaws.com/sneaker/travis.jpg',
              'part_no' => 'FW3043',
              'colors' => 'WHITE',
              'release_date' => '2019/09/21',
              'regular_price' => 22000,
              'created_at' => new DateTime(),
              'updated_at' => new DateTime(),
            ],
            [
              'name_main' => 'Black Orange',
              'name_sub' => 'Air VaporMax',
              'image' => 'https://jphacks-looker.s3-ap-northeast-1.amazonaws.com/sneaker/travis.jpg',
              'part_no' => 'AH8449-001',
              'colors' => 'ANTHRACITE,BLACK,ORANGE',
              'release_date' => '2018/02/01',
              'regular_price' => 19000,
              'created_at' => new DateTime(),
              'updated_at' => new DateTime(),
            ],
            [
              'name_main' => 'Green Strike',
              'name_sub' => 'Kobe AD Exodus',
              'image' => 'https://jphacks-looker.s3-ap-northeast-1.amazonaws.com/sneaker/travis.jpg',
              'part_no' => 'AR5515-301',
              'colors' => 'GREEN,BLACK',
              'release_date' => '2018/09/24',
              'regular_price' => 14000,
              'created_at' => new DateTime(),
              'updated_at' => new DateTime(),
            ],
            [
              'name_main' => 'Electric Green',
              'name_sub' => 'Jordan 1 Retro',
              'image' => 'https://jphacks-looker.s3-ap-northeast-1.amazonaws.com/sneaker/travis.jpg',
              'part_no' => '580514-150',
              'colors' => 'WHITE,GREEN,BLACK,GREY',
              'release_date' => '2019/10/12',
              'regular_price' => 18000,
              'created_at' => new DateTime(),
              'updated_at' => new DateTime(),
            ],
            [
              'name_main' => 'FG 25 Year Pack David Beckham',
              'name_sub' => 'adidas Predator Precision',
              'image' => 'https://jphacks-looker.s3-ap-northeast-1.amazonaws.com/sneaker/travis.jpg',
              'part_no' => 'F97223',
              'colors' => 'WHITE,SILVER,RED',
              'release_date' => '2019/03/07',
              'regular_price' => 35000,
              'created_at' => new DateTime(),
              'updated_at' => new DateTime(),
            ],
            [
              'name_main' => 'Vol. 4 Black White',
              'name_sub' => 'adidas Harden',
              'image' => 'https://jphacks-looker.s3-ap-northeast-1.amazonaws.com/sneaker/travis.jpg',
              'part_no' => 'EH2410',
              'colors' => 'BLACK-CLOUD WHITE-CORE BLACK',
              'release_date' => '2019/10/19',
              'regular_price' => 13000,
              'created_at' => new DateTime(),
              'updated_at' => new DateTime(),
            ],
          ]);
    }
}
