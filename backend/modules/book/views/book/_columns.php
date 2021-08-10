<?php
use yii\helpers\Html;
use yii\helpers\Url;
use common\components\FHtml;

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
        'class' => 'kartik\grid\DataColumn',
        'format' => 'html',
        'attribute' => 'image',
        'value' => function ($model) {
            return FHtml::showImageThumbnail($model->image, 70, 'book');
        },
        'hAlign' => 'center',
        'vAlign' => 'middle',
        'contentOptions' => ['class' => 'col-md-1 nowrap'],
    ],
    [
        'class' => 'kartik\grid\DataColumn',
        'attribute' => 'title',
        'hAlign' => 'left',
        'vAlign' => 'middle',
        'contentOptions' => ['class' => 'col-md-2 nowrap'],
    ],
    [
        'class' => 'kartik\grid\DataColumn',
        'attribute' => 'author',
        'hAlign' => 'left',
        'vAlign' => 'middle',
        'contentOptions' => ['class' => 'col-md-2 nowrap'],
    ],
    [
        'class' => 'kartik\grid\DataColumn',
        'attribute' => 'publisher',
        'hAlign' => 'left',
        'vAlign' => 'middle',
        'contentOptions' => ['class' => 'col-md-1 nowrap'],
    ],
    //[
    //'class'=>'kartik\grid\DataColumn',
    //'attribute'=>'description',
    //'hAlign'=>'left',
    //'vAlign'=>'middle',
    //'contentOptions'=>['class'=>'col-md-0 nowrap'],
    //],
//    [
//        'attribute' => 'attachment',
//        'class' => 'kartik\grid\DataColumn',
//        'value' => function ($model) {
//            return isset($model->attachment) && strlen($model->attachment) != 0 ?
//                Html::a(
//                    "Link",
//                    ['/site/file', 'file_name' => $model->attachment, 'file_path' => FHtml::getFilePath($model->attachment, BOOK_DIR)],
//                    ['data-pjax' => '0']
//                ) : "";
//        },
//        'format' => 'html',
//        'hAlign' => 'left',
//        'vAlign' => 'middle',
//        'contentOptions' => ['class' => 'col-md-2 nowrap'],
//    ],
    [
        'class' => 'kartik\grid\DataColumn',
        'attribute' => 'type',
        'value' => function ($model) {
            return isset($model->type) && strlen($model->type) != 0 ? \backend\modules\book\Book::getTypeLabel($model->type) : "";
        },
		'filter' => [\backend\modules\book\Book::TYPE_CLASSIC => "Classic", \backend\modules\book\Book::TYPE_EBOOK => "Ebook"],

        'format' => 'html',
        'hAlign' => 'left',
        'vAlign' => 'middle',
        'contentOptions' => ['class' => 'col-md-1 nowrap'],
    ],
//    [
//        'class' => 'kartik\grid\ActionColumn',
//        'name' => "Attachment",
//        'dropdown' => false,
//        'vAlign' => 'middle',
//        'template' => '{link}',
//        'urlCreator' => function ($action, $model, $key, $index) {
//            return Url::to([$action, 'id' => $key]);
//        },
//        'buttons' => [
//            'link' => function ($url, $model, $key) {
//                return isset($model->attachment) && strlen($model->attachment) != 0 ? Html::a('<span class="glyphicon glyphicon-file"></span>', ['/site/file', 'file_name' => $model->attachment, 'file_path' => FHtml::getFilePath($model->attachment, BOOK_DIR)], ['title' => "Link to download file", "data-pjax" => 0]) : "";
//            },
//        ],
//    ],
    //[
    //'class'=>'kartik\grid\DataColumn',
    //'attribute'=>'view_count',
    //'hAlign'=>'left',
    //'vAlign'=>'middle',
    //'contentOptions'=>['class'=>'col-md-0 nowrap'],
    //],
    //[
    //'class'=>'kartik\grid\DataColumn',
    //'attribute'=>'like_count',
    //'hAlign'=>'left',
    //'vAlign'=>'middle',
    //'contentOptions'=>['class'=>'col-md-0 nowrap'],
    //],
	 [
        'class' => 'kartik\grid\DataColumn',
        'attribute' => 'chapters',
		'format' => 'raw',
        'value' => function($model)
        {
            return '<a class="btn btn-xs btn-info" href="'.Yii::$app->urlManager->createUrl(['book/chapter/index','book_id'=>$model->id]).'">'.count($model->chapters).'</span></a>';
        },
        'hAlign'=>'center',
        'vAlign'=>'middle',
        'contentOptions' => ['class' => 'col-md-1 nowrap'],
    ],
    [
        'class' => 'kartik\grid\BooleanColumn',
        'attribute' => 'is_feature',
        'hAlign' => 'center',
        'vAlign' => 'middle',
        'contentOptions' => ['class' => 'col-md-1 nowrap'],
    ],
    [
        'class' => 'kartik\grid\BooleanColumn',
        'attribute' => 'is_active',
        'hAlign' => 'center',
        'vAlign' => 'middle',
        'contentOptions' => ['class' => 'col-md-1 nowrap'],
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
        'vAlign' => 'middle',
        'template' => '{link}&nbsp;&nbsp;&nbsp;{view}{update}{delete}',
        'urlCreator' => function ($action, $model) {
            return Url::to([$action, 'id' => $model->id]);
        },
        'buttons' => [
            'link' => function ($url, $model, $key) {
                $attachment = $model->attachment;
                $attachment_path = FHtml::getFilePath($attachment, BOOK_DIR);
                return isset($attachment) && strlen($attachment) != 0 && strlen($attachment_path) != 0 ? Html::a('<span class="glyphicon glyphicon-file"></span>', ['/site/file', 'file_name' => $attachment, 'file_path' => $attachment_path], ['title' => "Link to download file", "data-pjax" => 0]) : "";
            },
        ],
        'viewOptions' => ['role' => 'modal-remote', 'title' => Yii::t('common', 'title.view'), 'data-toggle' => 'tooltip'],
        'updateOptions' => ['role' => $this->params['displayType'], 'title' => Yii::t('common', 'title.update'), 'data-toggle' => 'tooltip'],
        'deleteOptions' => [
            'role' => 'modal-remote',
            'title' => Yii::t('common', 'title.delete'),
            'data-confirm' => false,
            'data-method' => false,// for overide yii data api
            'data-request-method' => 'post',
            'data-toggle' => 'tooltip',
            'data-confirm-title' => 'Are you sure?',
            'data-confirm-message' => 'Are you sure want to delete this item'
        ],
    ],
];