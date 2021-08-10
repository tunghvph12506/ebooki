<?php
namespace backend\modules\book\models;

use backend\models\ObjectRelation;
use Yii;

/**
 * @property integer $id
 * @property string $image
 * @property string $image_banner
 * @property string $title
 * @property string $author
 * @property string $publisher
 * @property string $description
 * @property string $attachment
 * @property string $type
 * @property integer $view_count
 * @property integer $like_count
 * @property integer $is_feature
 * @property integer $is_active
 * @property string $created_date
 * @property string $modified_date
 */
class BookBase extends \yii\db\ActiveRecord
{

    /**
    * @inheritdoc
    */
    public $tableName = 'book';

    public static function tableName()
    {
        return 'book';
    }

    public function afterDelete(){
        $id = $this->id;
        $uploadFolder = Yii::getAlias('@'.UPLOAD_DIR);
        $image_old = $this->image;
        if (strlen($image_old) > 0) {
            if (is_file($uploadFolder . '/book/' . $image_old)) {
                unlink($uploadFolder . '/book/' . $image_old);
            }
        }
        $attachment_old = $this->attachment;
        if (strlen($attachment_old) > 0) {
            if (is_file($uploadFolder . '/book/' . $attachment_old)) {
                unlink($uploadFolder . '/book/' . $attachment_old);
            }
        }
        $image_banner_old = $this->image_banner;
        if (strlen($image_banner_old ) > 0) {
            if (is_file($uploadFolder . '/book/' . $image_banner_old )) {
                unlink($uploadFolder . '/book/' . $image_banner_old );
            }
        }

        ObjectRelation::deleteAll("object_id = $id AND object_type ='" . \backend\modules\book\Book::OBJECT_TYPE_BOOK . "'");
        $chapters = BookChapter::find()->where("book_id = $id")->all();
        foreach ($chapters as $chapter) {
            $chapter->delete();
        }


        //BookChapter::deleteAll("book_id = $id");
        /*
        Method \yii\db\ActiveRecord::deleteAll([ ... ]); not triggers events
        ActiveRecord::EVENT_AFTER_DELETE
        ActiveRecord::EVENT_BEFORE_DELETE

        This is by design because there is no AR instance being deleted. deleteAll() is equivalent to DELETE FROM table.
        foreach (User::find()->where('status=3')->all() as $user) {
             $user->delete();
        }
        */
        parent::afterDelete(); // TODO: Change the autogenerated stub
    }
}
