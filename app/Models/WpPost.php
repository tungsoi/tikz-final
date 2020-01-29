<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WpPost extends Model
{
    protected $table = "wp_posts_copy";

    protected $fillable = ['post_content', 'post_title', 'post_name', 'post_excerpt'];
}
