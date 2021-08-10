<?php
namespace backend\modules\book\models;

use Yii;

/**
 * @property integer $id
 * @property integer $user_id
 * @property integer $book_id
 * @property integer $chapter_id
 * @property string $name
 * @property string $content
 * @property integer $is_active
 * @property string $created_date
 * @property string $modified_date
 */
class BookCommentBase extends \yii\db\ActiveRecord
{

    /**
    * @inheritdoc
    */
    public $tableName = 'book_comment';

    public static function tableName()
    {
        return 'book_comment';
    }
}
