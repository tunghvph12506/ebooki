<?php

use yii\widgets\DetailView;
use yii\helpers\Html;
use common\components\FHtml;
use backend\modules\book\models\BookChapter;
use backend\modules\book\Book;

/* @var $this yii\web\View */
/* @var $model backend\modules\book\models\Book */
?>
<?php
$chapter_count = count($model->chapters);
$latest_chapters =  BookChapter::find()->where("book_id = $model->id")
    ->orderBy("chapter_number DESC")
    ->limit(10)
    ->all();
/* @var  BookChapter $chapter*/

?>
<?php if (!Yii::$app->request->isAjax) {
    $this->title = 'Book';
    $this->params['breadcrumbs'][] = ['label' => 'Book', 'url' => 'index'];
    $this->params['breadcrumbs'][] = Yii::t('common', 'title.view');
    $this->params['toolBarActions'] = array(
        'linkButton' => array(),
        'button' => array(),
        'dropdown' => array(),
    );
    $this->params['mainIcon'] = 'fa fa-list';

} ?><?php if (Yii::$app->request->isAjax) { ?>
    <div class="book-view">

        <?= DetailView::widget([
            'model' => $model,
            'attributes' => [
                'id',
                [
                    'attribute' => 'image',
                    'value' => FHtml::showImageThumbnail($model->image, 300, 'book'),
                    'format' => 'html',
                ],
                [
                    'attribute' => 'image_banner',
                    'value' => FHtml::showImageThumbnail($model->image_banner, 300, 'book'),
                    'format' => 'html',
                ],
                [
                    'attribute' => 'category',
                    'value' => Book::getCategories($model->categories),
                ],
                'title',
                'author',
                'publisher',
                'description:html',
                'attachment',
                [
                                'attribute' => 'type',
                                'value' => \backend\modules\book\Book::getTypeLabel($model->type),
                                'format' => 'html',
                ],
                'view_count',
                'like_count',
				[
                                'attribute' => 'is_feature',
                                'value' => FHtml::showIsActiveLabel($model->is_feature),
                                'format' => 'html',
                ],
				[
                                'attribute' => 'is_active',
                                'value' => FHtml::showIsActiveLabel($model->is_active),
                                'format' => 'html',
                ],
                'created_date',
                'modified_date',
            ],
        ]) ?>
        <b>Chapter Count: </b><?= $chapter_count ?><br><br>

        <b>Latest Chapters</b><br><br>
        <?php
        foreach ($latest_chapters as $chapter) {
            echo "Chapter ". $chapter->chapter_number. ": ". $chapter->title."<br>";
        } ?>
        <?php if($chapter_count > 10){
            echo "...";
        } ?>
    </div>
<?php } else { ?>
    <div class="<?= $this->params['portletStyle'] ?>">
        <div class="portlet-title">
            <div class="caption font-dark">
                <span class="caption-subject bold uppercase">
                <i class="<?php echo $this->params['mainIcon'] ?>"></i>
                    <?= 'Book' ?>
</span>
                <span class="caption-helper"><?= Yii::t('common', 'title.view') ?>
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
                                'value' => FHtml::showImageThumbnail($model->image, 300, 'book'),
                                'format' => 'html',
                            ],
                            'title',
                            'author',
                            'publisher',
                            'description:html',
                            'attachment',
							[
                                'attribute' => 'type',
                                'value' => \backend\modules\book\Book::getTypeLabel($model->type),
                                'format' => 'html',
                            ],
                            'view_count',
                            'like_count',
                            [
                                'attribute' => 'is_feature',
                                'value' => FHtml::showIsActiveLabel($model->is_feature),
                                'format' => 'html',
							],
							[
                                'attribute' => 'is_active',
                                'value' => FHtml::showIsActiveLabel($model->is_active),
                                'format' => 'html',
							],
                            'created_date',
                            'modified_date',
                        ],
                    ]) ?>

                    <b>Chapter Count: </b><?= $chapter_count ?><br><br>
                    <b>Latest Chapters</b><br><br>
                    <?php
                    foreach ($latest_chapters as $chapter) {
                        echo "Chapter ". $chapter->chapter_number. ": ". $chapter->title."<br>";
                    } ?>
                    <?php if($chapter_count > 10){
                        echo "...";
                    }
                    echo "<br>";
                    ?>

                    <p>
                        <?= Html::a(Yii::t('common', 'button.update'), ['update', 'id' => $model->id],
                            ['class' => 'btn btn-primary']) ?>
                        <?=  Html::a('Manage Chapters', ['chapter/index', 'book_id' => $model->id], ['class' => 'btn btn-success'])  ?>
                        <?= Html::a(Yii::t('common', 'button.delete'), ['delete', 'id' => $model->id], [
                            'class' => 'btn btn-danger',
                            'data' => [
                                'confirm' => 'Are you sure you want to delete this item ?',
                                'method' => 'post',
                            ],
                        ]) ?>
                        <?= Html::a(Yii::t('common', 'button.cancel'), ['index'], ['class' => 'btn
                    btn-default']) ?>
                    </p>
                </div>
            </div>
        </div>
    </div>
<?php } ?>
