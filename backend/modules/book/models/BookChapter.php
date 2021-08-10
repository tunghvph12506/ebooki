<?php

namespace backend\modules\book\models;
/**
 * @property Book $book
 *
 */
class BookChapter extends BookChapterBase
{

    public $image_file;
    public $attachment_file;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [

            [['book_id', 'title', 'is_active'], 'required'],
            [['book_id', 'chapter_number', 'is_active'], 'integer'],
            [['content'], 'string'],
            [['created_date', 'modified_date'], 'safe'],
            [['image', 'title', 'attachment'], 'string', 'max' => 255],
            [['type'], 'string', 'max' => 20],
            [['image_file'], 'file', 'skipOnEmpty' => true, 'extensions' => 'jpg, gif, png'],
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
            'book_id' => 'Book ID',
            'chapter_number' => 'Chapter Number',
            'title' => 'Title',
            'attachment' => 'Attachment',
            'type' => 'Type',
            'content' => 'Content',
            'is_active' => 'Is Active',
            'created_date' => 'Created Date',
            'modified_date' => 'Modified Date',
            'image_file' => 'Image File',
            'attachment_file' => 'Attachment File',
        ];
    }

    public function getBook()
    {
        return $this->hasOne(Book::className(), ['id' => 'book_id']);
    }
}
