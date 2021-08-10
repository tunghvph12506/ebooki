<?php
use yii\helpers\Html;
use kartik\form\ActiveForm;

$this->title = 'Settings';
$this->params['breadcrumbs'][] = 'Settings';
$this->params['mainIcon'] = 'glyphicon glyphicon-cog';

/* @var $model \backend\models\SettingForm */
?>

<?php /*
<div class="settings-form">
    <div class="portlet box <?php echo $this->params['mainColor'] ?>">
        <div class="portlet-title">
            <div class="caption">
                <i class="<?php echo $this->params['mainIcon'] ?>"></i>Settings
            </div>
            <div class="tools">
                <a class="btn-icon-only fullscreen" href="#">
                </a>
                <a href="" class="collapse">
                </a>
            </div>
        </div>
        <div class="portlet-body form">
            <?php
            $form = ActiveForm::begin([
                'id' => 'settings-form',
                'type' => $this->params['activeForm_type'],
                'formConfig' => ['labelSpan' => 3, 'deviceSize' => ActiveForm::SIZE_MEDIUM, 'showErrors' => true],
                'options' => ['class' => 'form-horizontal',
                    'enctype' => 'multipart/form-data',
                ],
            ]) ?>
            <div class="form-body">
                <?= $form->field($model, 'api_key') ?>
                <?= $form->field($model, 'pem')->fileInput()->hint('Old pem: '.$model->pem) ?>
            </div>
            <div class="form-actions">
                <?= Html::submitButton('Save', ['class' => 'btn btn-primary']) ?>
            </div>
            <?php ActiveForm::end() ?>
        </div>
    </div>
</div>
*/
?>

<div class="portlet light bordered">
    <div class="portlet-title">
        <div class="caption font-dark">
            <span class="caption-subject bold uppercase">
                <i class="<?php echo $this->params['mainIcon'] ?>"></i>
            Settings</span>
            <span class="caption-helper">customization</span>
        </div>
        <div class="tools">
            <a href="#" class="collapse"></a>
            <a class="fullscreen" href="#"></a>
        </div>
        <div class="actions">
        </div>
    </div>
    <div class="portlet-body">
        <div class="portlet-body form">
            <?php
            $form = ActiveForm::begin([
                'id' => 'settings-form',
                'type' => $this->params['activeForm_type'],
                'formConfig' => ['labelSpan' => 3, 'deviceSize' => ActiveForm::SIZE_MEDIUM, 'showErrors' => true],
                'options' => ['class' => 'form-horizontal',
                    'enctype' => 'multipart/form-data',
                ],
            ]) ?>

            <div class="form-body">
                <?= $form->field($model, 'admin_email') ?>
                <?= $form->field($model, 'api_key') ?>
                <?= $form->field($model, 'pem')->fileInput()->hint('Old pem: ' . $model->pem) ?>
            </div>
            <div class="form-actions">
                <?= Html::submitButton('Save', ['class' => 'btn btn-primary btn-circle']) ?>
            </div>
            <?php ActiveForm::end() ?>
        </div>
    </div>
</div>