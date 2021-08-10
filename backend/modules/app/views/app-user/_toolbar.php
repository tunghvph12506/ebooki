<?php
use yii\helpers\Html;
use kartik\dropdown\DropdownX;
use common\components\FHtml;

$bulkActionButton = '<div class="dropdown pull-left">&nbsp;<button class="btn btn-default" data-toggle="dropdown">' . FHtml::t('common', 'Actions') . '</button>' .
    DropdownX::widget([
        'items' => \yii\helpers\ArrayHelper::merge(
            [FHtml::buildBulkActionsMenu(FHtml::CHANGE_TYPE, FHtml::t('common', 'Set') . ' ' . FHtml::t('common', 'Is Active'), 'app-user', 'is_active')],
            ['<li class="divider"></li>'],
            [FHtml::buildBulkDeleteMenu()]
        )
    ])
    . '</div>';

return [
    [
        'content' =>
//            Html::a('<i class="glyphicon glyphicon-plus"></i>', ['create'],
//                [
//                    'role' => $this->params['displayType'],
//                    'data-pjax' => $this->params['isAjax'] == true ? 1 : 0,
//                    'title' => Yii::t('common', 'title.create'),
//                    'class' => 'btn btn-success',
//                    'style' => 'float:left;'
//                ]) .
            '{export}' .
            Html::a('<i class="glyphicon glyphicon-repeat"></i>', [''], ['data-pjax' => 1, 'class' => 'btn btn-default', 'title' => 'Reset Grid']) .
            '{toggleData}'
            //. $bulkActionButton
        ,
        'options' => ['class' => 'text-right kv-panel-before']
    ],
];