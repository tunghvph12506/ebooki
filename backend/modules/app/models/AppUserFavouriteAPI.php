<?php
namespace backend\modules\app\models;

class AppUserFavouriteAPI extends AppUserFavouriteBase
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
