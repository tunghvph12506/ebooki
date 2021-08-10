<?php

use yii\helpers\Inflector;
use yii\helpers\StringHelper;

/* @var $this yii\web\View */
/* @var $generator yii\gii\generators\crud\Generator */

$urlParams = $generator->generateUrlParams();
$modelClass = StringHelper::basename($generator->modelClass);

$image_fields = array(
    'image',
    'icon',
    'logo',
    'avatar',
);
$folder_name = Inflector::camel2id($modelClass);
$lower_name = str_replace('-','_',$folder_name);

echo "<?php\n";
?>

use yii\widgets\DetailView;
use yii\helpers\Html;
use common\components\FHtml;

/* @var $this yii\web\View */
/* @var $model <?= ltrim($generator->modelClass, '\\') ?> */
?>
<?= "<?php" ?> if (!Yii::$app->request->isAjax) {
$this->title = <?= $generator->generateString(Inflector::camel2words($modelClass)) ?>;
$this->params['breadcrumbs'][] = ['label' => <?= $generator->generateString(Inflector::camel2words($modelClass)) ?>, 'url' => 'index'];
$this->params['breadcrumbs'][] = Yii::t('common', 'title.view');
$this->params['toolBarActions'] = array(
'linkButton'=>array(),
'button'=>array(),
'dropdown'=>array(),
);
$this->params['mainIcon'] = 'fa fa-list';
}<?= " ?>" ?>
<?= '<?php if (Yii::$app->request->isAjax) { ?>' . "\n" ?>
<div class="<?= Inflector::camel2id($modelClass) ?>-view">

    <?= "   <?= " ?>DetailView::widget([
    'model' => $model,
    'attributes' => [
    <?php
    if (($tableSchema = $generator->getTableSchema()) === false) {
        foreach ($generator->getColumnNames() as $name) {
            echo "          '" . $name . "',\n";
        }
    } else {
        foreach ($generator->getTableSchema()->columns as $column) {
            $format = $generator->generateColumnFormat($column);
            if(in_array($column->name, $image_fields)) {
                echo "                           " . "[" . "\n";
                echo "                           " . "'attribute' => '".$column->name."'," . "\n";
                echo "                           " . "'value' => FHtml::showImageThumbnail(\$model->".$column->name.", 300, '". $folder_name ."')". ",\n";
                echo "                           " . "'format' => 'html'". ",\n";
                echo "                           " . "]" . ",\n";
            }
            else{
                echo "                '" . $column->name . ($format === 'text' ? "" : ":" . $format) . "',\n";
            }
        }
    }
    ?>
    ],
    ]) ?>
</div>
<?= '<?php } else { ?>' . "\n" ?>
<div class="<?= "<?=" ?> $this->params['portletStyle'] <?= "?>" ?>">
    <div class="portlet-title">
        <div class="caption font-dark">
                <span class="caption-subject bold uppercase">
                <i class="<?= "<?php " ?> echo $this->params['mainIcon'] <?= "?>" ?>"></i>
                    <?= "<?= " ?><?= $generator->generateString(Inflector::camel2words($modelClass)) ?><?= "?>\n" ?></span>
            <span class="caption-helper"><?= "<?= " ?> Yii::t('common', 'title.view') <?= "?>\n" ?></span>
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
                <?= "<?= " ?>DetailView::widget([
                'model' => $model,
                'attributes' => [
                <?php
                if (($tableSchema = $generator->getTableSchema()) === false) {
                    foreach ($generator->getColumnNames() as $name) {
                            echo "            '" . $name . "',\n";
                    }
                } else {
                    foreach ($generator->getTableSchema()->columns as $column) {
                        $format = $generator->generateColumnFormat($column);
                        if(in_array($column->name, $image_fields)) {
                            echo "                           " . "[" . "\n";
                            echo "                           " . "'attribute' => '".$column->name."'," . "\n";
                            echo "                           " . "'value' => FHtml::showImageThumbnail(\$model->".$column->name.", 300, '". $folder_name ."')". ",\n";
                            echo "                           " . "'format' => 'html'". ",\n";
                            echo "                           " . "]" . ",\n";
                        }
                        else{
                            echo "                           '" . $column->name . ($format === 'text' ? "" : ":" . $format) . "',\n";
                        }
                    }
                }
                ?>
                ],
                ]) ?>
                <p>
                    <?= "<?= " ?> Html::a( Yii::t('common', 'button.update'), ['update', <?= $urlParams ?>],
                    ['class' => 'btn btn-primary']) ?>
                    <?= "<?= " ?> Html::a( Yii::t('common', 'button.delete'), ['delete', <?= $urlParams ?>], [
                    'class' => 'btn btn-danger',
                    'data' => [
                    'confirm' => 'Are you sure you want to delete this item ?',
                    'method' => 'post',
                    ],
                    ]) ?>
                    <?= "<?= " ?> Html::a(Yii::t('common', 'button.cancel'), ['index'], ['class' => 'btn
                    btn-default']) ?>
                </p>
            </div>
        </div>
    </div>
</div>
<?= '<?php } ?>' ?>

