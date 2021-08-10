<?php
namespace backend\modules\book\models;

use common\components\FHtml;
use Yii;

class BookChapterAPI extends BookChapterBase
{
    public function fields()
    {
        $fields = parent::fields();

        if (filter_var($this->image, FILTER_VALIDATE_URL)) {
            $avatar_link = $this->image;
        } else {
            $avatar_link = Yii::$app->urlManager->createAbsoluteUrl(['api/file', 'f' => $this->image, 'd' => CHAPTER_DIR]);
        }

        if (filter_var($this->attachment, FILTER_VALIDATE_URL)) {
            $attachment = $this->attachment;
        } else {
            $attachment = FHtml::getFileURL($this->attachment, CHAPTER_DIR, BACKEND);
        }

        $this->image = $avatar_link;
        $this->attachment = $attachment;

        return $fields;
    }

    public function rules()
    {
        return [];
    }
}
