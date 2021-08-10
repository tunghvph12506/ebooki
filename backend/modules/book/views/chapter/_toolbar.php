<?php
use yii\helpers\Html;
use kartik\dropdown\DropdownX;
use common\components\FHtml;
use backend\modules\book\models\Book;

/* @var $book Book */

$bulkActionButton = '<div class="dropdown pull-left">&nbsp;<button class="btn btn-default" data-toggle="dropdown">'. FHtml::t('common', 'Actions'). '</button>' .
    DropdownX::widget([
        'items' => \yii\helpers\ArrayHelper::merge(
                                    [FHtml::buildBulkActionsMenu(FHtml::CHANGE_TYPE, FHtml::t('common', 'Set'). ' '. FHtml::t('common', 'Is Active'), 'book-chapter', 'is_active')],
                        //[FHtml::buildBulkActionsMenu(FHtml::CHANGE_TYPE, FHtml::t('common', 'Set'). ' '. FHtml::t('common', 'Type'), 'book-chapter', 'type')],
                        ['<li class="divider"></li>'],
                        //[FHtml::buildBulkActionsMenu(FHtml::CLEAR_TYPE, ucwords(FHtml::CLEAR_TYPE). ' '. FHtml::t('common', 'Amount'), 'backend\modules\book\models\BookChapter', 'amount')],
            //[FHtml::buildBulkActionsMenu(FHtml::FILL_TYPE, ucwords(FHtml::FILL_TYPE). ' '. FHtml::t('common', 'Amount'), 'backend\modules\book\models\BookChapter', 'amount')],
            //['<li class="divider"></li>'],
            [FHtml::buildBulkDeleteMenu()]
        )
        ])
    . '</div>';
$book_id = Yii::$app->getRequest()->getQueryParam('book_id');

$backToBook = "";
if(strlen($book_id)!=0){
    $backToBook = Html::a('<i class="glyphicon glyphicon-circle-arrow-left"></i>&nbsp;' . FHtml::t('common', 'Back'),
        ['/book/book/view','id'=> $book_id],
    [
        'role' => $this->params['displayType'],
        'data-pjax' =>  $this->params['isAjax'] == true ? 1 : 0,
        'title' => FHtml::t('common', 'title.back'),
        'class' => 'btn btn-danger',
        'style' => 'float:left;margin-left:7px'
    ]);
}
return [
    [
        'content' =>
            Html::a('<i class="glyphicon glyphicon-plus"></i>',  Yii::$app->urlManager->createUrl(['book/chapter/create', "book_id" => $book->id]),
                        [
                            'role' => $this->params['displayType'],
                            'data-pjax' =>  $this->params['isAjax'] == true ? 1 : 0,
                            'title' => Yii::t('common', 'title.create'),
                            'class' => 'btn btn-success',
                            'style' => 'float:left;'
                        ]) .
                    '{export}' .
                    Html::a('<i class="glyphicon glyphicon-repeat"></i>', [''], ['data-pjax' => 1, 'class' => 'btn btn-default', 'title' => 'Reset Grid']) .
                    '{toggleData}' .
					$bulkActionButton.
                    $backToBook,
        'options'=> ['class' => 'text-right kv-panel-before']
    ],
];