<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Brazzer\Admin\Traits\AdminBuilder;

class Slide extends Model
{
    use AdminBuilder;

    /**
     * Table name
     *
     * @var string
     */
    protected $table = "slides";

    /**
     * Fields
     *
     * @var array
     */
    protected $fillable = ['picture_id', 'order'];

    public function picture() {
        return $this->hasOne('App\Models\Picture', 'id', 'picture_id');
    }
}
