<?php

namespace backend\models;

use Yii;

class ObjectCategoryAPI extends ObjectCategoryBase
{
    public function fields()
    {
        $fields = parent::fields();
        if (filter_var($this->image, FILTER_VALIDATE_URL)) {
            $image_link = $this->image;
        } else {
            $image_link = Yii::$app->urlManager->createAbsoluteUrl(['api/file', 'f' => $this->image, 'd' => CATEGORY_DIR]);
        }

        $this->image = $image_link;
        return $fields;
    }

    public function rules()
    {
        return [];
    }
}
