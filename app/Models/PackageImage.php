<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PackageImage extends Model
{
    use HasFactory;
    protected $fillable=['package_id','name','caption'];

     public function package()
    {
        return $this->belongsTo(Package::class);
    }
}
