<?php
namespace backend\actions;

use common\components\FApi;
use common\components\FConstant;
use backend\models\ObjectCategoryAPI;

class CategoryAction extends BaseAction
{
    public $is_secured = false;

    public function run()
    {
        if (($re = $this->isAuthorized())!== true)
            return $re;
        //$user_id = $this->user_id;

        $categories = ObjectCategoryAPI::find()->all();
        $data = array();
        foreach ($categories as $item) {
            $data[] = $item;
        }

        return FApi::getOutputForAPI($data, FConstant::SUCCESS, 'OK', ['code'=> 200]);

    }


}

