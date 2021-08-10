<?php
namespace backend\modules\book\models;

class BookCommentAPI extends BookCommentBase
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
