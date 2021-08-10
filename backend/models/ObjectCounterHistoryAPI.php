<?php
namespace backend\models;

class ObjectCounterHistoryAPI extends ObjectCounterHistoryBase
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
