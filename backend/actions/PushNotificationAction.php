<?php
namespace backend\actions;

use backend\modules\app\models\AppUserDeviceAPI;
use common\components\FApi;
use common\components\FHtml;
use yii\db\Expression;


class PushNotificationAction extends BaseAction
{
    public function run()
    {
        //http://www.yiiframework.com/wiki/780/drills-search-by-a-has_many-relation-in-yii-2-0/

        $message = FHtml::getRequestParam('msg', '');
        $type = FHtml::getRequestParam('type', '');
        $user_id = FHtml::getRequestParam('user_id', '');
        $additional_data = FHtml::getRequestParam('additional_data', '');

        $a_devices = array();
        $i_devices = array();


            $android_devices = AppUserDeviceAPI::find()->where("user_id = $user_id AND type = 1 AND status = 1")->all();
            $ios_devices = AppUserDeviceAPI::find()->where("user_id = $user_id AND type = 2 AND status = 1")->all();


        foreach ($android_devices as $a) {
            array_push($a_devices, $a->gcm_id);
        }
        foreach ($ios_devices as $i) {
            array_push($i_devices, $i->gcm_id);
        }

        if (count($a_devices) > 0) {
            try {
                FApi::pushAndroid($a_devices, $message, $type, $additional_data);
            } catch (\Exception $e) {
                 return $e;
            }
        }

        if (count($i_devices) > 0) {
            try {
                FApi::pushIos($i_devices, $message, $type, $additional_data);
            } catch (\Exception $e) {
                 return $e;
            }
        }
    }
}
