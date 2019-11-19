<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Brazzer\Admin\Traits\AdminBuilder;

class Tag extends Model
{
    use AdminBuilder;

    /**
     * Table name
     *
     * @var string
     */
    protected $table = "tags";

    /**
     * Fillables
     *
     * @var array
     */
    protected $fillable = ['name'];
}
