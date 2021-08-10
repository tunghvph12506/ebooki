<?php
namespace backend\modules\app\models;

use Yii;

/**
 * @property integer $id
 * @property integer $user_id
 * @property string $name
 * @property string $email
 * @property string $subject
 * @property string $content
 * @property integer $is_active
 * @property string $created_date
 * @property string $modified_date
 */
class AppUserFavouriteBase extends \yii\db\ActiveRecord
{

    /**
    * @inheritdoc
    */
    public $tableName = 'app_user_favourite';

    public static function tableName()
    {
        return 'app_user_favourite';
    }
}
