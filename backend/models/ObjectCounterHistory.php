<?php

namespace backend\models;

class ObjectCounterHistory extends ObjectCounterHistoryBase
{

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
        
            [['object_id', 'object_type', 'attribute', 'year', 'focus', 'position'], 'required'],
            [['object_id', 'count', 'position'], 'integer'],
            [['object_type'], 'string', 'max' => 255],
            [['attribute'], 'string', 'max' => 100],
            [['date', 'week', 'month', 'year', 'focus'], 'string', 'max' => 10],                
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'object_id' => 'Object ID',
            'object_type' => 'Object Type',
            'count' => 'Count',
            'attribute' => 'Attribute',
            'date' => 'Date',
            'week' => 'Week',
            'month' => 'Month',
            'year' => 'Year',
            'focus' => 'Focus',
            'position' => 'Position',
        ];
    }
}
