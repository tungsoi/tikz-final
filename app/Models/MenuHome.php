<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Brazzer\Admin\Traits\AdminBuilder;

class MenuHome extends Model
{
    use AdminBuilder;

    /**
     * Table name
     *
     * @var string
     */
    protected $table = "menu_homes";

    /**
     * Fields
     *
     * @var array
     */
    protected $fillable = ['code', 'name', 'order', 'path', 'status'];
}
