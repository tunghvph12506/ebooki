<?php
namespace backend\modules\app\actions;

use backend\actions\BaseAction;
use backend\modules\app\models\AppUserAPI;
use common\components\FConstant;
use common\components\FApi;
use Yii;

class ForgetPasswordAction extends BaseAction
{

    public function run()
    {
        $email = isset($_REQUEST['email']) ? $_REQUEST['email'] : '';

        if (strlen($email) == 0) {
            return FApi::getOutputForAPI('', FConstant::ERROR, FConstant::MISSING_PARAMS, ['code' => 202]);
        }

        $checkEmail = AppUserAPI::find()->where("email = '" . $email . "'")->one();

        if (!isset($checkEmail)) {

            return FApi::getOutputForAPI('', FConstant::ERROR, FApi::getErrorMsg(223), ['code' => 223]);

        }
        /* @var AppUserAPI $checkEmail*/
        $token = md5(time().$checkEmail->id);
        $checkEmail->password_reset_token = $token;
        $checkEmail->save();

        $send = Yii::$app->mailer->compose(['html' => 'forget-html', 'text' => 'forget-text'], ['token' => $token])
            ->setFrom('fruity.tester@gmail.com')
            ->setTo($email)
            ->setSubject(Yii::$app->name .' - Reset Password Token')
            ->send();
        if($send)
        {
            return FApi::getOutputForAPI('', FConstant::SUCCESS, 'OK');
        }
        else
        {
            return FApi::getOutputForAPI('', FConstant::ERROR, 'Fail to send email, please check your email address', ['code'=> 229]);
        }

    }

}
