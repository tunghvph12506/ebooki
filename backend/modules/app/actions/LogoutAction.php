<?php
namespace backend\modules\app\actions;

use backend\actions\BaseAction;
use backend\modules\app\models\AppUserAPI;
use backend\modules\app\models\AppUserTokenAPI;
use common\components\FConstant;
use common\components\FApi;
use Yii;

class LogoutAction extends BaseAction
{
    public function run()
    {
        $token = isset($_REQUEST['token']) ? $_REQUEST['token'] : '';

        if (strlen($token) == 0) {
            return FApi::getOutputForAPI('', FConstant::ERROR, FConstant::MISSING_PARAMS, ['code'=> 202]);
        }

        $login_token = AppUserTokenAPI::find()->where('token = "' . $token . '"')->one();

        /* @var AppUserTokenAPI $login_token*/

        if (isset($login_token) && isset ($login_token->user)) {
            $user_id = $login_token->user->id;
        } else {
            if(isset($login_token)){
                $login_token->delete();
            }
            return FApi::getOutputForAPI('', FConstant::ERROR, FConstant::TOKEN_MISMATCH, ['code'=> 205]);
        }

        $login_token->delete();

        $check = AppUserAPI::findOne($user_id);
        $check->is_online = FConstant::STATE_INACTIVE;
        $check->save();

        $login_token->token = NULL;
        $login_token->time = time();
        $login_token->save();

        return FApi::getOutputForAPI('', FConstant::SUCCESS, 'OK', ['code'=> 200]);
    }
}
