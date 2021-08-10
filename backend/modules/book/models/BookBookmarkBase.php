<?php
namespace backend\modules\book\models;

use Yii;

/**
 * @property integer $id
 * @property integer $user_id
 * @property integer $book_id
 * @property integer $chapter_id
 * @property integer $page_number
 * @property string $created_date
 * @property string $modified_date
 */
class BookBookmarkBase extends \yii\db\ActiveRecord
{

    /**
    * @inheritdoc
    */
    public $tableName = 'book_bookmark';

    public static function tableName()
    {
        return 'book_bookmark';
    }
}
