<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Brazzer\Admin\Traits\AdminBuilder;

class Category extends Model
{
    use AdminBuilder;

    /**
     * Table name
     *
     * @var string
     */
    protected $table = "categories";

    /**
     * Fields
     *
     * @var array
     */
    protected $fillable = ['name', 'code'];
}
