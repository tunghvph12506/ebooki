<?php

namespace backend\models;

use common\components\FConstant;
/**
 * @property ObjectRelation[] $books
 *
 */

class ObjectCategory extends ObjectCategoryBase
{

    public $image_file;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
        
            [['parent_id', 'sort_order', 'is_active'], 'integer'],
            [['name', 'is_active', 'object_type'], 'required'],
            [['description'], 'string'],
            [['created_date', 'modified_date'], 'safe'],
            [['image', 'name'], 'string', 'max' => 255],
            [['object_type'], 'string', 'max' => 50],                        
            [['image_file'], 'file','skipOnEmpty' => true, 'extensions'=>'jpg, gif, png'],                        
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'parent_id' => 'Parent ID',
            'image' => 'Image',
            'name' => 'Name',
            'description' => 'Description',
            'sort_order' => 'Sort Order',
            'is_active' => 'Is Active',
            'object_type' => 'Object Type',
            'created_date' => 'Created Date',
            'modified_date' => 'Modified Date',
            'image_file' => 'Image File',
            ];
    }

    public function getBooks()
    {
        return $this->hasMany(ObjectRelation::className(), ['object2_id' => 'id'])->andOnCondition(['and',
            ['object2_type' => FConstant::OBJECT_TYPE_CATEGORY],
            ['relation_type' => FConstant::OBJECT_TYPE_CATEGORY]
        ]);
    }
}
