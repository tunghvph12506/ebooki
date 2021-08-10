<?php
use yii\helpers\Html;
use yii\helpers\Url;
use common\components\FHtml;
use kartik\datecontrol\DateControl;

return [
    [
        'class' => 'kartik\grid\CheckboxColumn',
    ],
    //[
    //    'class' => 'kartik\grid\SerialColumn',
    //    'width' => '30px',
    //],
    //[
        //'class'=>'kartik\grid\DataColumn',
        //'attribute'=>'id',
        //'hAlign'=>'left',
        //'vAlign'=>'middle',
        //'contentOptions'=>['class'=>'col-md-0 nowrap'],
    //],
    [
        'class'=>'kartik\grid\DataColumn',
        'format'=>'html',
        'attribute'=>'image',
        'value' => function($model) { return FHtml::showImageThumbnail($model-> image, 70, 'book-chapter'); }, 
        'hAlign'=>'center',
        'vAlign'=>'middle',
        'contentOptions'=>['class'=>'col-md-1 nowrap'],
    ],
    //[
        //'class'=>'kartik\grid\DataColumn',
        //'attribute'=>'book_id',
        //'hAlign'=>'left',
        //'vAlign'=>'middle',
        //'contentOptions'=>['class'=>'col-md-0 nowrap'],
    //],
    [
        'class'=>'kartik\grid\DataColumn',
        'attribute'=>'chapter_number',
        'hAlign'=>'left',
        'vAlign'=>'middle',
        'contentOptions'=>['class'=>'col-md-2 nowrap'],
    ],
    [
        'class'=>'kartik\grid\DataColumn',
        'attribute'=>'title',
        'hAlign'=>'left',
        'vAlign'=>'middle',
        'contentOptions'=>['class'=>'col-md-2 nowrap'],
    ],
    [
        'class' => 'kartik\grid\DataColumn',
        'attribute' => 'type',
        'value' => function ($model) {
            return isset($model->type) && strlen($model->type) != 0 ? \backend\modules\book\Book::getTypeLabel($model->type) : "";
        },
		'filter' =>  [
                                //\backend\modules\book\Book::TYPE_CLASSIC => "Classic",
                                //\backend\modules\book\Book::TYPE_EBOOK => "Ebook",
                                \backend\modules\book\Book::CHAPTER_TYPE_NORMAL => "NORMAL",
                                \backend\modules\book\Book::CHAPTER_TYPE_PDF => "PDF",
                                \backend\modules\book\Book::CHAPTER_TYPE_EPUB => "EPUB",
                                \backend\modules\book\Book::CHAPTER_TYPE_VIDEO => "VIDE0",
                                \backend\modules\book\Book::CHAPTER_TYPE_AUDIO => "AUDIO",
        ],
        'format' => 'html',
        'hAlign' => 'center',
        'vAlign' => 'middle',
        'contentOptions' => ['class' => 'col-md-2 nowrap'],
    ],
//    [
//        'class'=>'kartik\grid\DataColumn',
//        'attribute'=>'attachment',
//        'hAlign'=>'left',
//        'vAlign'=>'middle',
//        'contentOptions'=>['class'=>'col-md-2 nowrap'],
//    ],
    //[
        //'class'=>'kartik\grid\DataColumn',
        //'attribute'=>'content',
        //'hAlign'=>'left',
        //'vAlign'=>'middle',
        //'contentOptions'=>['class'=>'col-md-0 nowrap'],
    //],
    [
        'class'=>'kartik\grid\BooleanColumn',
        'attribute'=>'is_active',
        'hAlign'=>'center',
        'vAlign'=>'middle',
        'contentOptions'=>['class'=>'col-md-1 nowrap'],
    ],
    //[
        //'class'=>'kartik\grid\DataColumn',
        //'attribute'=>'created_date',
        //'hAlign'=>'left',
        //'vAlign'=>'middle',
        //'contentOptions'=>['class'=>'col-md-0 nowrap'],
    //],
    //[
        //'class'=>'kartik\grid\DataColumn',
        //'attribute'=>'modified_date',
        //'hAlign'=>'left',
        //'vAlign'=>'middle',
        //'contentOptions'=>['class'=>'col-md-0 nowrap'],
    //],
    [
        'class' => 'kartik\grid\ActionColumn',
        'dropdown' => false,
        'vAlign'=>'middle',
        'urlCreator' => function($action, $model) {
            return Url::to([$action, 'id' => $model->id]);
        },
        'template' => '{link}{comment}&nbsp;&nbsp;&nbsp;{view}{update}{delete}',
        'buttons' => [
            'link' => function ($url, $model, $key) {
                $attachment = $model->attachment;
                $attachment_path = FHtml::getFilePath($attachment, CHAPTER_DIR);
                return isset($attachment) && strlen($attachment) != 0 && strlen($attachment_path) != 0 ? Html::a('<span class="glyphicon glyphicon-file"></span>', ['/site/file', 'file_name' => $attachment, 'file_path' => $attachment_path], ['title' => "Link to download file", "data-pjax" => 0]) : "";
            },
            'comment' => function ($url, $model, $key) {
                return Html::a('<span class="fa fa-comments"></span>', ['comment/index', 'chapter_id' => $model->id], ['title' => "View Comments", "data-pjax" => 0]);
            },
        ],
        'viewOptions'=>['role'=>'modal-remote','title'=>Yii::t('common', 'title.view'),'data-toggle'=>'tooltip'],
        'updateOptions'=>['role'=>$this->params['displayType'],'title'=>Yii::t('common', 'title.update'), 'data-toggle'=>'tooltip'],
        'deleteOptions'=>[
            'role'=>'modal-remote',
            'title'=>Yii::t('common', 'title.delete'),
            'data-confirm'=>false,
            'data-method'=>false,// for overide yii data api
            'data-request-method'=>'post',
            'data-toggle'=>'tooltip',
            'data-confirm-title'=>'Are you sure?',
            'data-confirm-message'=>'Are you sure want to delete this item'
        ],
    ],
];