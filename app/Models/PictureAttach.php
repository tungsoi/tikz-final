<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Brazzer\Admin\Traits\AdminBuilder;

class PictureAttach extends Model
{
    use AdminBuilder;

    /**
     * Table name
     *
     * @var string
     */
    protected $table = "picture_attachs";

    /**
     * Fields
     *
     * @var array
     */
    protected $fields = ['picture_id', 'attach_id', 'type'];
}
