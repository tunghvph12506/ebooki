<?php

use yii\widgets\DetailView;
use yii\helpers\Html;
use common\components\FHtml;

/* @var $this yii\web\View */
/* @var $model backend\modules\book\models\BookComment */
?>
<?php if (!Yii::$app->request->isAjax) {
$this->title = 'Book Comment';

$this->params['breadcrumbs'][] = ['label' => $model->book->title, 'url' => Yii::$app->urlManager->createUrl(['book/book/view', "id" => $model->book_id])];
$this->params['breadcrumbs'][] = ['label' => "Chapter #". $model->chapter->chapter_number. " ". $model->chapter->title, 'url' => Yii::$app->urlManager->createUrl(['book/chapter/view', "id" => $model->chapter_id])];
$this->params['breadcrumbs'][] = ['label' => 'Comments', 'url' => Yii::$app->urlManager->createUrl(['book/comment/index', "chapter_id" => $model->chapter_id])];
$this->params['breadcrumbs'][] = Yii::t('common', 'title.view');
$this->params['toolBarActions'] = array(
'linkButton'=>array(),
'button'=>array(),
'dropdown'=>array(),
);
$this->params['mainIcon'] = 'fa fa-list';
} ?><?php if (Yii::$app->request->isAjax) { ?>
<div class="book-comment-view">

       <?= DetailView::widget([
    'model' => $model,
    'attributes' => [
                    'id',
                'book_id',
                'chapter_id',
                'name',
                'content',
                [
                                'attribute' => 'is_active',
                                'value' => FHtml::showIsActiveLabel($model->is_active),
                                'format' => 'html',
				],
                'created_date',
                'modified_date',
    ],
    ]) ?>
</div>
<?php } else { ?>
<div class="<?= $this->params['portletStyle'] ?>">
    <div class="portlet-title">
        <div class="caption font-dark">
                <span class="caption-subject bold uppercase">
                <i class="<?php  echo $this->params['mainIcon'] ?>"></i>
                    <?= 'Book Comment'?>
</span>
            <span class="caption-helper"><?=  Yii::t('common', 'title.view') ?>
</span>
        </div>
        <div class="tools">
            <a href="#" class="collapse"></a>
            <a href="#" class="fullscreen"></a>
        </div>
        <div class="actions">
        </div>
    </div>
    <div class="portlet-body">
        <div class="row">
            <div class="col-md-12">
                <?= DetailView::widget([
                'model' => $model,
                'attributes' => [
                                           'id',
                           'book_id',
                           'chapter_id',
                           'name',
                           'content',
                           [
                                'attribute' => 'is_active',
                                'value' => FHtml::showIsActiveLabel($model->is_active),
                                'format' => 'html',
							],
                           'created_date',
                           'modified_date',
                ],
                ]) ?>
                <p>
                    <?php /*=  Html::a( Yii::t('common', 'button.update'), ['update', 'id' => $model->id],
                    ['class' => 'btn btn-primary']) */ ?>
                    <?=  Html::a( Yii::t('common', 'button.delete'), ['delete', 'id' => $model->id], [
                    'class' => 'btn btn-danger',
                    'data' => [
                    'confirm' => 'Are you sure you want to delete this item ?',
                    'method' => 'post',
                    ],
                    ]) ?>
                    <?=  Html::a(Yii::t('common', 'button.cancel'), ['index', 'chapter_id' => $model->chapter_id], ['class' => 'btn
                    btn-default']) ?>
                </p>
            </div>
        </div>
    </div>
</div>
<?php } ?>
