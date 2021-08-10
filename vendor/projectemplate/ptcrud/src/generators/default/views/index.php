<?php

use yii\helpers\Inflector;
use yii\helpers\StringHelper;
use yii\bootstrap\Modal;
use yii\helpers\Url;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $generator yii\gii\generators\crud\Generator */

$urlParams = $generator->generateUrlParams();
$nameAttribute = $generator->getNameAttribute();

echo "<?php\n";
?>
use yii\helpers\Html;
use yii\bootstrap\Modal;
use kartik\grid\GridView;
use projectemplate\ptcrud\CrudAsset;
use projectemplate\ptcrud\BulkButtonWidget;

/* @var $this yii\web\View */
<?= !empty($generator->searchModelClass) ? "/* @var \$searchModel " . ltrim($generator->searchModelClass, '\\') . " */\n" : '' ?>
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = <?= $generator->generateString(Inflector::camel2words(StringHelper::basename($generator->modelClass))) ?>;

$this->params['breadcrumbs'][] = $this->title;

$this->params['toolBarActions'] = array(
'linkButton'=>array(),
'button'=>array(),
'dropdown'=>array(),
);
$this->params['mainIcon'] = 'fa fa-list';

CrudAsset::register($this);

?>
<div class="<?= Inflector::camel2id(StringHelper::basename($generator->modelClass)) ?>-index">
    <?= "<?php " ?> if ($this->params['displayPortlet']): <?= "?>\n" ?>
    <div class="<?= "<?=" ?> $this->params['portletStyle'] <?= "?>" ?>">
        <div class="portlet-title">
            <div class="caption font-dark">
                <span class="caption-subject bold uppercase">
                <i class="<?= "<?php " ?> echo $this->params['mainIcon'] <?= "?>" ?>"></i>
                <?= "<?= " ?><?= $generator->generateString(Inflector::camel2words(StringHelper::basename($generator->modelClass))) ?><?= "?>" ?></span>
                <span class="caption-helper"><?= "<?= " ?> Yii::t('common', 'title.index') <?= "?>" ?></span>
            </div>
            <div class="tools">
                <a href="#" class="collapse"></a>
                <a href="#" class="fullscreen"></a>
            </div>
            <div class="actions">
            </div>
        </div>
        <div class="portlet-body">
        <?= "<?php " ?> endif; <?= "?>" ?>
            <div class="row">
                <div class="col-md-12">
                    <div id="ajaxCrudDatatable">
                        <?= "<?=" ?>GridView::widget([
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
                        ])<?= "?>\n" ?>
                    </div>
                </div>
            </div>
    <?= "<?php " ?> if ($this->params['displayPortlet']): <?= "?>" ?>
        </div>
    </div>
    <?= "<?php " ?> endif; <?= "?>" ?>
</div>
    <?= '<?php Modal::begin([
    "id"=>"ajaxCrubModal",
    "footer"=>"",
    ])?>' . "\n" ?>
    <?= '<?php Modal::end(); ?>' ?>

