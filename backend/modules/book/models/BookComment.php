<?php

namespace backend\modules\book\models;

/**
 * @property Book $book
 * @property BookChapter $chapter
 */
class BookComment extends BookCommentBase
{

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
        
            [['user_id', 'book_id', 'chapter_id', 'is_active'], 'integer'],
            [['book_id', 'chapter_id', 'name', 'content', 'is_active'], 'required'],
            [['created_date', 'modified_date'], 'safe'],
            [['name'], 'string', 'max' => 50],
            [['content'], 'string', 'max' => 250],                
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
            'name' => 'Name',
            'content' => 'Content',
            'is_active' => 'Is Active',
            'created_date' => 'Created Date',
            'modified_date' => 'Modified Date',
        ];
    }

    public function getBook()
    {
        return $this->hasOne(Book::className(), ['id' => 'book_id']);
    }

    public function getChapter()
    {
        return $this->hasOne(BookChapter::className(), ['id' => 'chapter_id']);
    }
}
