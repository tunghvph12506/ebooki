<?php

namespace backend\modules\app\actions;

use backend\actions\BaseAction;
use backend\modules\app\models\AppUserFeedbackAPI;
use backend\modules\app\models\AppUserTokenAPI;
use common\components\FApi;
use common\components\FConstant;

class FeedbackAction extends BaseAction
{
    public $is_secured = false;

    public function run()
    {
        $token = isset($_REQUEST['token']) ? $_REQUEST['token'] : ''; //neu truyen token thi khong can email / name
        $name = isset($_REQUEST['name']) ? $_REQUEST['name'] : '';
        $email = isset($_REQUEST['email']) ? $_REQUEST['email'] : '';
        $subject = isset($_REQUEST['subject']) ? $_REQUEST['subject'] : '';
        $content = isset($_REQUEST['content']) ? $_REQUEST['content'] : '';

        if (strlen($token) != 0) {
            /* @var  $login_token AppUserTokenAPI */
            $login_token = AppUserTokenAPI::find()->where('token = "' . $token . '"')->one();

            if (isset($login_token) && isset ($login_token->user)) {
                $user_id = $login_token->user->id;
                $name = $login_token->user->name;
                $email = $login_token->user->username;
            } else {
                return FApi::getOutputForAPI('', FConstant::ERROR, FConstant::TOKEN_MISMATCH, ['code' => 205]);
            }
        } else {
            if (strlen($name) == 0 || strlen($email) == 0) {
                return FApi::getOutputForAPI('', FConstant::ERROR, FConstant::MISSING_PARAMS, ['code' => 202]);
            }
            $user_id = NULL;
        }
        $now = time();
        $today = date('Y-m-d H:i:s', $now);
        $new_device = new AppUserFeedbackAPI();
        $new_device->user_id = $user_id;
        $new_device->name = $name;
        $new_device->email = $email;
        $new_device->subject = $subject;
        $new_device->content = $content;
        $new_device->is_active = FConstant::STATE_ACTIVE;
        $new_device->created_date = $today;
        if ($new_device->save()) {
            return FApi::getOutputForAPI('', FConstant::SUCCESS, 'OK', ['code' => 200]);
        } else {
            return FApi::getOutputForAPI('', FConstant::ERROR, 'FAIL', ['code' => 201]);
        }

    }

}
