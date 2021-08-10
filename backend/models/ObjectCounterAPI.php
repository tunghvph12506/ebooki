<?php
namespace backend\models;

class ObjectCounterAPI extends ObjectCounterBase
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
