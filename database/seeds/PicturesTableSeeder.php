<?php

use Illuminate\Database\Seeder;
use App\Models\Picture;

class PicturesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = Picture::first()->toArray();
        unset($data['id']);
        for ($i = 0; $i < 50; $i++) {
            Picture::create($data);
        }
    }
}
