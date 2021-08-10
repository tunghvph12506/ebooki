<?php
namespace backend\modules\book\models;

class BookBookmarkAPI extends BookBookmarkBase
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
