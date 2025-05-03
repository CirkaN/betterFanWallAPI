<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Video extends Model
{
    protected $fillable = ['title', 'url', 'comments_disabled', 'company_id', 'author_id'];


    public function author()
    {
        return $this->belongsTo(User::class, 'author_id', 'id');
    }
}
