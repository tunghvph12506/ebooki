<?php
use yii\helpers\Html;
use yii\bootstrap\Modal;
use kartik\grid\GridView;
use projectemplate\ptcrud\CrudAsset;
use projectemplate\ptcrud\BulkButtonWidget;

/* @var $this yii\web\View */
/* @var $searchModel backend\modules\book\models\BookChapterSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
/* @var $book \backend\modules\book\models\Book */

$this->title = 'Chapters';
$this->params['breadcrumbs'][] = ['label' => $book->title, 'url' => Yii::$app->urlManager->createUrl(['book/book/view', "id" => $book->id])];
$this->params['breadcrumbs'][] = $this->title;

$this->params['toolBarActions'] = array(
'linkButton'=>array(),
'button'=>array(),
'dropdown'=>array(),
);
$this->params['mainIcon'] = 'fa fa-list';

CrudAsset::register($this);

?>
<div class="book-chapter-index">
    <?php  if ($this->params['displayPortlet']): ?>
    <div class="<?= $this->params['portletStyle'] ?>">
        <div class="portlet-title">
            <div class="caption font-dark">
                <span class="caption-subject bold uppercase">
                <i class="<?php  echo $this->params['mainIcon'] ?>"></i>
                <?= 'Chapter'?></span>
                <span class="caption-helper"><?=  Yii::t('common', 'title.index') ?></span>
            </div>
            <div class="tools">
                <a href="#" class="collapse"></a>
                <a href="#" class="fullscreen"></a>
            </div>
            <div class="actions">
            </div>
        </div>
        <div class="portlet-body">
        <?php  endif; ?>            <div class="row">
                <div class="col-md-12">
                    <div id="ajaxCrudDatatable">
                        <?=GridView::widget([
                        'id'=>'crud-datatable',
                        //'floatHeader' => true, // enable this will keep header when scroll but disable resizeable column feature
                        'dataProvider' => $dataProvider,
                        'filterModel' => $searchModel,
                        'pjax' => true,
                        'pager' => [
                        'firstPageLabel' => 'First',
                        'lastPageLabel' => 'Last',
                        ],
                        'toolbar' => require(__DIR__ . '/_toolbar.php'),
                        'columns' => require(__DIR__.'/_columns.php'),
                        'striped' => true,
                        'condensed' => true,
                        'responsive' => true,
                        'layout' => "{toolbar}\n{items}\n{summary}\n{pager}",
                        'panel' => false
                        ])?>
                    </div>
                </div>
            </div>
    <?php  if ($this->params['displayPortlet']): ?>        </div>
    </div>
    <?php  endif; ?></div>
    <?php Modal::begin([
    "id"=>"ajaxCrubModal",
    "footer"=>"",
    ])?>
    <?php Modal::end(); ?>
