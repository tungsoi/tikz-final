<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Brazzer\Admin\Traits\AdminBuilder;
use Illuminate\Support\Str;
use App\Models\PostCategory;

class Post extends Model
{
    use AdminBuilder;

    /**
     * Table name
     *
     * @var string
     */
    protected $table = "posts";

    /**
     * Fields
     *
     * @var array
     */
    protected $fillable = ['title', 'code', 'description', 'avatar', 'images', 'user_created_id', 'sub_title', 'slug', 'categories'];

    public function getAvatarAttribute($avatar)
    {
        return 'images/'.$avatar;
    }

    public function setImagesAttribute($images)
    {
        if (is_array($images)) {
            $data = [];
            foreach ($images as $image) {
                $data[] = str_replace('images/', '', $image);
            }
            $this->attributes['images'] = json_encode($data);
        }
    }

    public function getImagesAttribute($images)
    {
        $decode = json_decode($images, true);
        if (!is_null($decode)) {
            foreach ($decode as $key => $image) {
                $decode[$key] = 'images/'.$image;
            }
        }

        return $decode;
    }

    public function userCreated() {
        return $this->hasOne('App\User', 'id', 'user_created_id');
    }

    public function getCategoriesAttribute($value)
    {
        return explode(',', $value);
    }

    public function setCategoriesAttribute($value)
    {
        $this->attributes['categories'] = implode(',', $value);
    }

    public function category()
    {
        return PostCategory::find($this->categories[0])->name ?? null;
    }
}
