<?php
namespace backend\modules\app\models;

class AppUserFeedbackAPI extends AppUserFeedbackBase
{
    public function fields()
    {
        $fields = parent::fields();
        return $fields;
    }

    public function rules()
    {
        return [];
    }
}
