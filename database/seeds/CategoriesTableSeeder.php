<?php

use Illuminate\Database\Seeder;
use App\Models\Category;
use Illuminate\Support\Str;

class CategoriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = ["hình học","@","Bản mẫu:@hình học","B","ball","bát giác","C","circle","circumcenter","collinear","D","disk","Đ","đa diện","đa giác","đồng dạng","đường trắc địa","đường tròn","E","edge","H","hình cầu","hình lập phương","hình thang","hình tròn","K","khối cầu","kim tự tháp","L","lập phương","lục giác","M","mặt cầu","midpoint","N","ngũ giác","nội tiếp","Q","quả cầu","R","reflect","S","song song","sphere","T","tam giác","tetrahedron","tia phân giác","trapezoid","trung điểm","tứ diện","tứ giác",
        "V","vòng tròn","vuông góc"];

        foreach ($data as $cate) {
            Category::create([
                'name'  =>  ucfirst($cate),
                'code'  =>  Str::slug($cate)
            ]);
        }
    }
}
