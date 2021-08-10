<?php
namespace backend\modules\app\actions;

use backend\actions\BaseAction;
use backend\modules\app\models\AppUserAPI;
use backend\modules\app\models\AppUserDeviceAPI;
use backend\modules\app\models\AppUserTokenAPI;
use common\components\FConstant;
use common\components\FApi;

class LoginAction extends BaseAction
{
    public $is_secured = false;

    public function run()
    {
        $username = isset($_REQUEST['username']) ? $_REQUEST['username'] : '';
        $password = isset($_REQUEST['password']) ? $_REQUEST['password'] : '';
        $ime = isset($_REQUEST['ime']) ? $_REQUEST['ime'] : '';
        $gcm_id = isset($_REQUEST['gcm_id']) ? $_REQUEST['gcm_id'] : '';
        $type = isset($_REQUEST['type']) ? $_REQUEST['type'] : '';
        $login_type = isset($_REQUEST['login_type']) ? $_REQUEST['login_type'] : '';  //n normal/s social network
        $name = isset($_REQUEST['name']) ? $_REQUEST['name'] : '';
        $avatar = isset($_REQUEST['avatar']) ? $_REQUEST['avatar'] : '';

        if (
            (
                strlen($username) == 0
                || strlen($ime) == 0
                //|| strlen($status) == 0
                //|| strlen($gcm_id) == 0
                //|| strlen($type) == 0
            )
            || ($login_type == 'n' && strlen($password) == 0)
            || ($login_type == 's' && strlen($name) == 0)
        ) {
            return FApi::getOutputForAPI('', FConstant::ERROR, FConstant::MISSING_PARAMS, ['code' => 202]);
        }

        /* @var \backend\modules\app\models\AppUserAPI $check */
        /* @var \backend\modules\app\models\AppUserAPI $checkEmail */

        $checkEmail = AppUserAPI::find()->where("username = '" . $username . "'")->one();
        $today = date('Y-m-d H:i:s', time());
        if ($login_type == 'n') { //normal
            if (!isset($checkEmail)) {
                return FApi::getOutputForAPI('', FConstant::ERROR, FApi::getErrorMsg(223), ['code' => 223]);
            }
        } else { //social
            if (!$checkEmail) {
                $check = new AppUserAPI();
                $check->name = $name;
                $check->avatar = $avatar;
                $check->email = $username;
                $check->username = $username;
                $check->is_active = FConstant::STATE_ACTIVE;
                $check->status = FConstant::LABEL_NORMAL;
                $check->created_date = $today;
                $check->save();
            } else {
                $checkEmail->avatar = $avatar;
                $checkEmail->name = $name;
                $checkEmail->save();
            }
        }

        $check = AppUserAPI::findByUsername($username);

        if (isset($check)) {

            if ($login_type == 'n') {
                if (strlen($check->password) == 0) {
                    return FApi::getOutputForAPI('', FConstant::ERROR, FApi::getErrorMsg(233), ['code' => 233]);
                }
                if (!$check->validatePassword($password)) {
                    return FApi::getOutputForAPI('', FConstant::ERROR, FConstant::WRONG_PASSWORD, ['code' => 222]);
                }
            }
            $user_id = $check->id;

            $token = md5($user_id . time());

            /* @var \backend\modules\app\models\AppUserDeviceAPI $checkDevice */
            /* @var \backend\modules\app\models\AppUserTokenAPI $loginToken */

            $checkDevice = AppUserDeviceAPI::find()->where("ime = '" . $ime . "'")->one();
            if (isset($checkDevice)) {
                $checkDevice->user_id = $user_id;
                $checkDevice->gcm_id = $gcm_id;
                $checkDevice->type = $type;
                $checkDevice->save();
            } else {
                $checkDevice = new AppUserDeviceAPI();
                $checkDevice->user_id = $user_id;
                $checkDevice->ime = $ime;
                $checkDevice->status = 1;
                $checkDevice->gcm_id = $gcm_id;
                $checkDevice->type = $type;
                $checkDevice->save();
            }


            $loginToken = AppUserTokenAPI::find()->where('user_id = "' . $check->id . '"')->one();
            if (isset($loginToken)) {
                $loginToken->token = $token;
                $loginToken->time = $today;
                $loginToken->save();
            } else {
                $loginToken = new AppUserTokenAPI();
                $loginToken->user_id = $user_id;
                $loginToken->token = $token;
                $loginToken->time = $today;
                $loginToken->save();
            }

            $check->is_online = FConstant::STATE_ACTIVE;
            $check->save();

            $data = $check;

            //Yii::$app->response->statusCode = 200;
            return FApi::getOutputForAPI($data, FConstant::SUCCESS, 'OK', ['login_token' => $loginToken->token, 'code' => 200]);
        } else {
            return FApi::getOutputForAPI('', FConstant::ERROR, 'Your account is not activated', ['code' => 228]);
        }
    }
}
