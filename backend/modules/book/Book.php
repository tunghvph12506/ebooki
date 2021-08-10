<?php
namespace backend\modules\book;

use backend\models\ObjectRelation;
use Yii;

/**
 * book module definition class
 */
class Book extends \yii\base\Module
{
    const
        OBJECT_TYPE_BOOK = "book",
        OBJECT_TYPE_CHAPTER = "chapter";
    const
        TYPE_CLASSIC = "classic",
        TYPE_EBOOK = "ebook",
        CHAPTER_TYPE_PDF = "pdf",
        CHAPTER_TYPE_EPUB = "epub",
        CHAPTER_TYPE_VIDEO = "video",
        CHAPTER_TYPE_AUDIO = "audio",
	CHAPTER_TYPE_NORMAL = "normal";
    /**
     * @inheritdoc
     */
    public $controllerNamespace = 'backend\modules\book\controllers';

    /**
     * @inheritdoc
     */
    public function init()
    {
        parent::init();
        // custom initialization code goes here
    }

    public static function createModuleMenu($module, $controller, $action){

        return
            array(
                array(
                    'active' => $module == 'book' ||  $controller == 'category',
                    'name' => Yii::t('common', 'menu.module.book'),
                    'icon' => 'glyphicon glyphicon-book',
                    'children' => array(
                        array(
                            'active' => $controller == 'category',
                            'name' => Yii::t('common', 'menu.category'),
                            'icon' => '',
                            'url' => Yii::$app->urlManager->createUrl(['/category/index']),
                        ),
                        array(
                            'active' => $controller == 'book',
                            'name' => Yii::t('common', 'menu.book'),
                            'icon' => '',
                            'url' => Yii::$app->urlManager->createUrl(['/book/book/index']),
                        )
                    ),
                ),
            );

    }

    public static function getTypeLabel($status)
    {
        $key = $status;
        $str = array(
            Book::TYPE_EBOOK => '<span class="label label-sm label-primary">' . Book::TYPE_EBOOK. '</span>',
            Book::TYPE_CLASSIC => '<span class="label label-sm label-success">' . Book::TYPE_CLASSIC . '</span>',
            Book::CHAPTER_TYPE_PDF => '<span class="label label-sm label-success">' . Book::CHAPTER_TYPE_PDF . '</span>',
            Book::CHAPTER_TYPE_EPUB => '<span class="label label-sm label-info">' . Book::CHAPTER_TYPE_EPUB . '</span>',
            Book::CHAPTER_TYPE_VIDEO => '<span class="label label-sm label-wanring">' . Book::CHAPTER_TYPE_VIDEO . '</span>',
            Book::CHAPTER_TYPE_AUDIO => '<span class="label label-sm label-danger">' . Book::CHAPTER_TYPE_AUDIO . '</span>',
            Book::CHAPTER_TYPE_NORMAL => '<span class="label label-sm label-default">' . Book::CHAPTER_TYPE_NORMAL . '</span>',

         );
        return isset($str[$key]) ? $str[$key] : '';
    }
    public static function getCategories($categories)
    {
        $category_names = array();
        /* @var ObjectRelation $category*/
        foreach ($categories as $category){
            $category_names[] = $category->category->name;
        }
        return implode(", ", $category_names);
    }
}
