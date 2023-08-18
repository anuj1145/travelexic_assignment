<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Package extends Model
{
    use HasFactory;
    protected $fillable=['destination','price','duration','description'];
    public function images()
    {
        return $this->hasMany(PackageImage::class);
    }
}
