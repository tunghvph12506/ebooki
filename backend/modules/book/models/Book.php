<?php

namespace backend\modules\book\models;

use backend\models\ObjectRelation;
use common\components\FConstant;


/**
 * @property ObjectRelation[] $categories
 * @property BookChapter[] $chapters
 *
 */


class Book extends BookBase
{

    public $image_file;
    public $image_banner_file;
    public $attachment_file;
    public $category;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [

            [['title', 'is_active'], 'required'],
            [['description'], 'string'],
            [['view_count', 'like_count', 'is_feature', 'is_active'], 'integer'],
            [['created_date', 'modified_date'], 'safe'],
            [['image', 'image_banner', 'title', 'author', 'publisher', 'attachment'], 'string', 'max' => 255],
            [['type'], 'string', 'max' => 20],
            [['image_file'], 'file', 'skipOnEmpty' => true, 'extensions' => 'jpg, gif, png'],
            [['image_banner_file'], 'file', 'skipOnEmpty' => true, 'extensions' => 'jpg, gif, png'],
            [['attachment_file'], 'file', 'skipOnEmpty' => true],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'image' => 'Image',
            'image_banner' => 'Image Banner',
            'title' => 'Title',
            'author' => 'Author',
            'publisher' => 'Publisher',
            'description' => 'Description',
            'attachment' => 'Attachment',
            'type' => 'Type',
            'view_count' => 'View Count',
            'like_count' => 'Like Count',
            'is_feature' => 'Is Feature',
            'is_active' => 'Is Active',
            'created_date' => 'Created Date',
            'modified_date' => 'Modified Date',
            'image_file' => 'Image File',
            'attachment_file' => 'Attachment File',
        ];
    }

    public function getCategories()
    {
        return $this->hasMany(ObjectRelation::className(), ['object_id' => 'id'])->andOnCondition(['and',
            ['object_type' => \backend\modules\book\Book::OBJECT_TYPE_BOOK],
            ['relation_type' => FConstant::OBJECT_TYPE_CATEGORY]
        ]);
    }

    public function getChapters()
    {
        return $this->hasMany(BookChapter::className(), ['book_id' => 'id']);
    }
}
