<?php

use Illuminate\Database\Seeder;
use App\Models\Picture;
use App\Models\WpPost;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SyncPicturesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Picture::truncate();

        $temps = WpPost::orderBy('id', 'desc')->get();
        foreach ($temps as $temp) {
            Picture::create([
                'title' =>  $temp->post_title,
                'sub_title' => $temp->post_title,
                'description'   =>  $temp->post_content,
                'slug'  => Str::slug($temp->post_title),
                'user_created_id'   =>  1
            ]);
        }
    }
}
