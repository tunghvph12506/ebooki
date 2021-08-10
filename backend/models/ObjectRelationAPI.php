<?php
namespace backend\models;

class ObjectRelationAPI extends ObjectRelationBase
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
