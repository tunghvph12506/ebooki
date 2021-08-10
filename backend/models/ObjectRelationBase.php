<?php

namespace backend\models;

use Yii;

/**
 * @property string $id
 * @property string $object_id
 * @property string $object_type
 * @property string $object2_id
 * @property string $object2_type
 * @property string $relation_type
 * @property string $created_date
 * @property string $created_user
 */
class ObjectRelationBase extends \yii\db\ActiveRecord
{
    /**
    * @inheritdoc
    */
    public $tableName = 'object_relation';

    public static function tableName()
    {
        return 'object_relation';
    }
}
