<?php
use yii\helpers\Html;
use kartik\dropdown\DropdownX;
use common\components\FHtml;

$bulkActionButton = '<div class="dropdown pull-left">&nbsp;<button class="btn btn-default" data-toggle="dropdown">'. FHtml::t('common', 'Actions'). '</button>' .
    DropdownX::widget([
        'items' => \yii\helpers\ArrayHelper::merge(
                                    [FHtml::buildBulkActionsMenu(FHtml::CHANGE_TYPE, FHtml::t('common', 'Set'). ' '. FHtml::t('common', 'Is Active'), 'book-comment', 'is_active')],
                        ['<li class="divider"></li>'],
                        //[FHtml::buildBulkActionsMenu(FHtml::CLEAR_TYPE, ucwords(FHtml::CLEAR_TYPE). ' '. FHtml::t('common', 'Amount'), 'backend\modules\book\models\BookComment', 'amount')],
            //[FHtml::buildBulkActionsMenu(FHtml::FILL_TYPE, ucwords(FHtml::FILL_TYPE). ' '. FHtml::t('common', 'Amount'), 'backend\modules\book\models\BookComment', 'amount')],
            //['<li class="divider"></li>'],
            [FHtml::buildBulkDeleteMenu()]
        )
        ])
    . '</div>';

$chapter_id = Yii::$app->getRequest()->getQueryParam('chapter_id');

$backToChapter = "";
if(strlen($chapter_id)!=0){
    $backToChapter = Html::a('<i class="glyphicon glyphicon-circle-arrow-left"></i>&nbsp;' . FHtml::t('common', 'Back'),
        ['/book/chapter/view','id'=> $chapter_id],
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
        'content' => '{export}' .
                    Html::a('<i class="glyphicon glyphicon-repeat"></i>', [''], ['data-pjax' => 1, 'class' => 'btn btn-default', 'title' => 'Reset Grid']) .
                    '{toggleData}' .
                    $bulkActionButton.
                    $backToChapter,
        'options'=> ['class' => 'text-right kv-panel-before']
    ],
];