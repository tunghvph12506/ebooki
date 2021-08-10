<?php

namespace backend\modules\app\models;

use Yii;
use common\components\FHtml;
use yii\helpers\ArrayHelper;

/**
 * 
 * This is the customized model class for table "app_user_device".
 * @property AppUserSettingAPI $setting
 */
class AppUserDeviceAPI extends AppUserDeviceBase
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

    public function getSetting()
    {
        return $this->hasOne(AppUserSettingAPI::className(), ['user_id' => 'user_id']);
    }
}
