<?php

namespace App\Http\Resources;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class VideoResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id'=>$this->id,
            'title'=>$this->title,
            'url'=>$this->url,
            'author'=>$this->whenLoaded('author'),
            'created_human'=> Carbon::parse($this->created_at)->diffForHumans(),
            'thumb_url'=>'htps',
        ];
    }
}
