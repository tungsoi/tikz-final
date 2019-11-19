<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Brazzer\Admin\Traits\AdminBuilder;

class ConfigSite extends Model
{
    use AdminBuilder;

    /**
     * Table name
     *
     * @var string
     */
    protected $table = "config_sites";

    /**
     * Fillables
     *
     * @var array
     */
    protected $fillable = ['code', 'content'];
}
