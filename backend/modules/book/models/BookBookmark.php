<?php

namespace backend\modules\book\models;

class BookBookmark extends BookBookmarkBase
{

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
        
            [['user_id', 'book_id', 'chapter_id', 'page_number'], 'required'],
            [['user_id', 'book_id', 'chapter_id', 'page_number'], 'integer'],
            [['created_date', 'modified_date'], 'safe'],                
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => 'User ID',
            'book_id' => 'Book ID',
            'chapter_id' => 'Chapter ID',
            'page_number' => 'Page Number',
            'created_date' => 'Created Date',
            'modified_date' => 'Modified Date',
        ];
    }
}
