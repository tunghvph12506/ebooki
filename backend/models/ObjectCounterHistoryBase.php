<?php
namespace backend\models;

use Yii;

/**
 * @property integer $id
 * @property integer $object_id
 * @property string $object_type
 * @property integer $count
 * @property string $attribute
 * @property string $date
 * @property string $week
 * @property string $month
 * @property string $year
 * @property string $focus
 * @property integer $position
 */
class ObjectCounterHistoryBase extends \yii\db\ActiveRecord
{

    /**
    * @inheritdoc
    */
    public $tableName = 'object_counter_history';

    public static function tableName()
    {
        return 'object_counter_history';
    }
}
