<?php
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
    //[
        //'class'=>'kartik\grid\DataColumn',
        //'attribute'=>'book_id',
        //'hAlign'=>'left',
        //'vAlign'=>'middle',
        //'contentOptions'=>['class'=>'col-md-0 nowrap'],
    //],
    //[
        //'class'=>'kartik\grid\DataColumn',
        //'attribute'=>'chapter_id',
        //'hAlign'=>'left',
        //'vAlign'=>'middle',
        //'contentOptions'=>['class'=>'col-md-0 nowrap'],
    //],
    [
        'class'=>'kartik\grid\DataColumn',
        'attribute'=>'name',
        'hAlign'=>'left',
        'vAlign'=>'middle',
        'contentOptions'=>['class'=>'col-md-2 nowrap'],
    ],
    [
        'class'=>'kartik\grid\DataColumn',
        'attribute'=>'content',
		'value' => function($model)
        {
			return strlen($model->content) > 100 ? substr($model->content, 0, 100)."..." : $model->content;
        },
        'hAlign'=>'left',
        'vAlign'=>'middle',
        'contentOptions'=>['class'=>'col-md-0 nowrap'],
    ],
    [
        'class'=>'kartik\grid\BooleanColumn',
        'attribute'=>'is_active',
        'hAlign'=>'center',
        'vAlign'=>'middle',
        'contentOptions'=>['class'=>'col-md-1 nowrap'],
    ],
    [
        'class'=>'kartik\grid\DataColumn',
        'attribute'=>'created_date',
        'hAlign'=>'left',
        'vAlign'=>'middle',
        'contentOptions'=>['class'=>'col-md-2 nowrap'],
    ],
    // [
        // 'class'=>'kartik\grid\DataColumn',
        // 'attribute'=>'modified_date',
        // 'hAlign'=>'left',
        // 'vAlign'=>'middle',
        // 'contentOptions'=>['class'=>'col-md-2 nowrap'],
    // ],
    [
        'class' => 'kartik\grid\ActionColumn',
        'dropdown' => false,
        'vAlign'=>'middle',
        'urlCreator' => function($action, $model) {
            return Url::to([$action, 'id' => $model->id]);
        },
        'template' => '{view}{delete}',
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