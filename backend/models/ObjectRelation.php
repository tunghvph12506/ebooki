<?php
namespace backend\models;

use backend\modules\book\models\Book;


/**
 * @property Book $book
 * @property ObjectCategory $category
 *
 */

class ObjectRelation extends ObjectRelationBase
{

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['object_id', 'object_type', 'object2_id', 'object2_type'], 'required'],
            [['object_id', 'object2_id'], 'integer'],
            [['created_date'], 'safe'],
            [['object_type', 'object2_type', 'relation_type', 'created_user'], 'string', 'max' => 100],                
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
            'object2_id' => 'Object2 ID',
            'object2_type' => 'Object2 Type',
            'relation_type' => 'Relation Type',
            'created_date' => 'Created Date',
            'created_user' => 'Created User',
        ];
    }

    public function getBook()
    {
        return $this->hasOne(Book::className(), ['id' => 'object_id']);

    }

    public function getCategory()
    {
        return $this->hasOne(ObjectCategory::className(), ['id' => 'object2_id']);
    }
}
