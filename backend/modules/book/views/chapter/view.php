<?php

use yii\widgets\DetailView;
use yii\helpers\Html;
use common\components\FHtml;
use backend\modules\book\models\Book;

/* @var $this yii\web\View */
/* @var $model backend\modules\book\models\BookChapter */
?>
<?php if (!Yii::$app->request->isAjax) {
$this->title = "Chapter #". $model->chapter_number . " ".$model->title;
$book = Book::findOne($model->book_id);
$this->params['breadcrumbs'][] = ['label' => $book->title, 'url' => Yii::$app->urlManager->createUrl(['book/book/view', "id" => $book->id])];
$this->params['breadcrumbs'][] = ['label' => 'Chapters', 'url' => Yii::$app->urlManager->createUrl(['book/chapter/index', "book_id" => $book->id])];
$this->params['breadcrumbs'][] = $this->title;
$this->params['toolBarActions'] = array(
'linkButton'=>array(),
'button'=>array(),
'dropdown'=>array(),
);
$this->params['mainIcon'] = 'fa fa-list';
} ?><?php if (Yii::$app->request->isAjax) { ?>
<div class="book-chapter-view">

       <?= DetailView::widget([
    'model' => $model,
    'attributes' => [
                    'id',
                           [
                           'attribute' => 'image',
                           'value' => FHtml::showImageThumbnail($model->image, 300, 'book-chapter'),
                           'format' => 'html',
                           ],
                'book_id',
                'chapter_number',
                'title',
                [
                                'attribute' => 'type',
                                'value' => \backend\modules\book\Book::getTypeLabel($model->type),
                                'format' => 'html',
                ],
                'attachment',
                'content:html',
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
                    <?= 'Book Chapter'?>
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
                           [
                           'attribute' => 'image',
                           'value' => FHtml::showImageThumbnail($model->image, 300, 'book-chapter'),
                           'format' => 'html',
                           ],
                           'book_id',
                           'chapter_number',
                           'title',
                           [
                                'attribute' => 'type',
                                'value' => \backend\modules\book\Book::getTypeLabel($model->type),
                                'format' => 'html',
                            ],
                           'attachment',
                           'content:html',
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
                    <?=  Html::a( Yii::t('common', 'button.update'), ['update', 'id' => $model->id],
                    ['class' => 'btn btn-primary']) ?>
					<?=  Html::a('View Comments', ['comment/index', 'chapter_id' => $model->id], ['class' => 'btn btn-success'])  ?>
                    <?=  Html::a( Yii::t('common', 'button.delete'), ['delete', 'id' => $model->id], [
                    'class' => 'btn btn-danger',
                    'data' => [
                    'confirm' => 'Are you sure you want to delete this item ?',
                    'method' => 'post',
                    ],
                    ]) ?>
                    <?=  Html::a(Yii::t('common', 'button.cancel'), ['index', "book_id" => $model->book_id], ['class' => 'btn
                    btn-default']) ?>
                </p>
            </div>
        </div>
    </div>
</div>
<?php } ?>
