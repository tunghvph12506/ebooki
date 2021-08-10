<?php

namespace backend\modules\app\models;

use Yii;
use common\components\FHtml;
use yii\helpers\ArrayHelper;

/**
 *
 * This is the customized model class for table "app_user_token".
 *
 * @property AppUserAPI $user
 */
class AppUserTokenAPI extends AppUserTokenBase
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

    public function getUser()
    {
        return $this->hasOne(AppUserAPI::className(), ['id' => 'user_id']);
    }
}
