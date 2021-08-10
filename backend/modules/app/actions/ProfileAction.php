<?php
namespace backend\modules\app\actions;

use backend\actions\BaseAction;
use backend\modules\app\models\AppUserAPI;
use backend\modules\app\models\AppUserTokenAPI;
use common\components\FConstant;
use common\components\FHtml;
use common\components\FApi;
use Yii;

/* @var $check AppUserAPI*/

class ProfileAction extends BaseAction
{
    public $is_secured = true;

    public function run()
    {
        if (($re = $this->isAuthorized())!== true)
            return $re;

        $destination_id = FHtml::getRequestParam('user_id', '');

        $user_id = $this->user_id;

        //Yii::$app->response->statusCode = 400;

        if(strlen($destination_id)==0)
        {
            $check = AppUserAPI::findOne($user_id);
        }else{
            $check = AppUserAPI::findOne($destination_id);
        }


        if (isset($check)) {

            $data = $check;

            //Yii::$app->response->statusCode = 200;
            return FApi::getOutputForAPI($data, FConstant::SUCCESS, 'OK', ['code'=> 200]);
        } else {
            return FApi::getOutputForAPI('', FConstant::ERROR, FConstant::USER_NOT_FOUND, ['code'=> 221]);
        }
    }

}
