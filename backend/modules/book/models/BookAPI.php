<?php

namespace backend\modules\book\models;

use common\components\FHtml;
use Yii;

class BookAPI extends BookBase
{
    public function fields()
    {
        //$fields = parent::fields();
        $fields = [
            'id',
            'image',
            'image_banner',
            'title',
            'author',
            'publisher',
            'description',
            'attachment',
            'type',
            'view_count',
            'like_count',
            'is_feature',
            'is_active',
            'created_date',
            'modified_date',
        ];

        if (filter_var($this->image, FILTER_VALIDATE_URL)) {
            $avatar_link = $this->image;
        } else {
            $avatar_link = Yii::$app->urlManager->createAbsoluteUrl(['api/file', 'f' => $this->image, 'd' => BOOK_DIR]);
        }

        if (filter_var($this->image_banner, FILTER_VALIDATE_URL)) {
            $image_banner_link = $this->image_banner;
        } else {
            $image_banner_link = Yii::$app->urlManager->createAbsoluteUrl(['api/file', 'f' => $this->image_banner, 'd' => BOOK_DIR]);
        }

        if (filter_var($this->attachment, FILTER_VALIDATE_URL)) {
            $attachment = $this->attachment;
        } else {
            $attachment = FHtml::getFileURL($this->attachment, BOOK_DIR, BACKEND);
        }

        $this->image = $avatar_link;
        $this->image_banner = $image_banner_link;
        $this->attachment = $attachment;

        return $fields;
    }

    public function rules()
    {
        return [];
    }
}
