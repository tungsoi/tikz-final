<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Brazzer\Admin\Traits\AdminBuilder;
use Illuminate\Support\Str;

class Picture extends Model
{
    use AdminBuilder;

    /**
     * Table name
     *
     * @var string
     */
    protected $table = "pictures";

    /**
     * Fields
     *
     * @var array
     */
    protected $fillable = ['title', 'code', 'description', 'avatar', 'images', 'user_created_id', 'sub_title', 'slug', 'tags', 'categories'];

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

    public function getTagsAttribute($value)
    {
        return explode(',', $value);
    }

    public function setTagsAttribute($value)
    {
        $this->attributes['tags'] = implode(',', $value);
    }

    public function getCategoriesAttribute($value)
    {
        return explode(',', $value);
    }

    public function setCategoriesAttribute($value)
    {
        $this->attributes['categories'] = implode(',', $value);
    }
}
