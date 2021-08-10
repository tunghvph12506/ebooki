<?php
use yii\helpers\Html;
use kartik\form\ActiveForm;
use kartik\switchinput\SwitchInput;
use kartik\file\FileInput;

/* @var $this yii\web\View */
/* @var $model backend\modules\book\models\BookChapter */
/* @var $form yii\widgets\ActiveForm */
/* @var $book \backend\modules\book\models\Book */

?>

<?php if (!Yii::$app->request->isAjax) {
    $this->title = 'Book Chapter';
    $this->params['breadcrumbs'][] = ['label' => $this->title, 'url' => Yii::$app->urlManager->createUrl(['book/chapter/index', "book_id" => ($model->isNewRecord) ? $book->id : $model->book_id])];
    $this->params['breadcrumbs'][] = ($model->isNewRecord) ? 'Create' : 'Update';
    $this->params['mainIcon'] = 'fa fa-list';
    $this->params['toolBarActions'] = array(
        'linkButton' => array(),
        'button' => array(),
        'dropdown' => array(),
    );
} ?>
<?php if (Yii::$app->request->isAjax) { ?>

    <?php $form = ActiveForm::begin(
        [
            'id' => 'book-chapter-form',
            'type' => $this->params['activeForm_type'],//ActiveForm::TYPE_HORIZONTAL,ActiveForm::TYPE_VERTICAL,ActiveForm::TYPE_INLINE
            'formConfig' => ['labelSpan' => 3, 'deviceSize' => ActiveForm::SIZE_MEDIUM, 'showErrors' => true],
            'staticOnly' => false, // check the Role here
            'readonly' => false, // check the Role here
            'options' => [
                //'class' => 'form-horizontal',
            ]
        ]); ?>

    <input type="hidden" id="saveType" name="saveType">

    <?= $form->field($model, 'image')->textarea(['rows' => 6]) ?>

    <?php //= $form->field($model, 'book_id')->textInput() ?>

    <?= $form->field($model, 'chapter_number')->textInput() ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'type')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'attachment')->textInput() ?>

    <?= $form->field($model, 'content')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'is_active')->textInput() ?>

    <?= $form->field($model, 'created_date')->textInput() ?>

    <?= $form->field($model, 'modified_date')->textInput() ?>

    <?php ActiveForm::end(); ?>


<?php } else { ?>

    <div class="book-chapter-form">
        <div class="<?= $this->params['portletStyle'] ?>">
            <div class="portlet-title">
                <div class="caption font-dark">
                <span class="caption-subject bold uppercase">
                    <i class="<?php echo $this->params['mainIcon'] ?>"></i>
                    <?= 'Book Chapter' ?></span>
                    <span class="caption-helper"><?= ($model->isNewRecord) ? Yii::t('common', 'title.create') : Yii::t('common', 'title.update') ?></span>
                </div>
                <div class="tools">
                    <a href="#" class="collapse"></a>
                    <a href="#" class="fullscreen"></a>
                </div>
                <div class="actions">
                </div>
            </div>
            <div class="portlet-body form">
                <?php $form = ActiveForm::begin([
                    'id' => 'book-chapter-form',
                    'type' => $this->params['activeForm_type'],//ActiveForm::TYPE_HORIZONTAL,ActiveForm::TYPE_VERTICAL,ActiveForm::TYPE_INLINE
                    'formConfig' => ['labelSpan' => 3, 'deviceSize' => ActiveForm::SIZE_MEDIUM, 'showErrors' => true],
                    'staticOnly' => false, // check the Role here
                    'readonly' => false, // check the Role here
                    'options' => [
                        //'class' => 'form-horizontal',
                        'enctype' => 'multipart/form-data'
                    ]
                ]);
                ?>


                <div class="form">
                    <div class="form-body">
                        <?= $form->field($model, 'image_file')->widget(FileInput::classname(),
                            ['options' => [
                                'multiple' => false,
                                'accept' => 'image/*'],
                                'pluginOptions' => [
                                    'previewFileType' => 'image',
                                    'showRemove' => false,
                                    'showUpload' => false
                                ]
                            ]); ?>

                        <?php //= $form->field($model, 'book_id')->textInput() ?>

                        <?= $form->field($model, 'chapter_number')->textInput() ?>

                        <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

                        <?= $form->field($model, 'type')
                            ->dropDownList(
                                [
                                //\backend\modules\book\Book::TYPE_CLASSIC => "Classic",
                                //\backend\modules\book\Book::TYPE_EBOOK => "Ebook",
                                \backend\modules\book\Book::CHAPTER_TYPE_NORMAL => "NORMAL",
                                \backend\modules\book\Book::CHAPTER_TYPE_PDF => "PDF",
                                \backend\modules\book\Book::CHAPTER_TYPE_EPUB => "EPUB",
                                \backend\modules\book\Book::CHAPTER_TYPE_VIDEO => "VIDE0",
                                \backend\modules\book\Book::CHAPTER_TYPE_AUDIO => "AUDIO",
                                ]
                            )
                        ?>

                        <?= $form->field($model, 'attachment_file')->widget(FileInput::classname(),
                            ['options' => [
                                'multiple' => false
                            ],
                                'pluginOptions' => [
                                    'previewFileType' => 'any',
                                    'showRemove' => false,
                                    'showUpload' => false
                                ]
                            ]); ?>
                        <?php
                        $kcfOptions = array_merge(\iutbay\yii2kcfinder\KCFinder::$kcfDefaultOptions, [
                            'uploadURL' => Yii::getAlias('@web') . '/upload/editor',
                            'access' => [
                                'files' => [
                                    'upload' => true,
                                    'delete' => false,
                                    'copy' => false,
                                    'move' => false,
                                    'rename' => false,
                                ],
                                'dirs' => [
                                    'create' => true,
                                    'delete' => false,
                                    'rename' => false,
                                ],
                            ],
                        ]);
                        Yii::$app->session->set('KCFINDER', $kcfOptions);
                        ?>

                        <?= $form->field($model, 'content')->widget(\common\components\CoconutEditor::className(), [
                            'options' => [
                                'rows' => 10,
                                //'disabled' => false
                            ],
                            'preset' => 'full',
                        ]) ?>
                        
                        <?= $form->field($model, 'is_active')->widget(SwitchInput::classname(), ['containerOptions' => ['class' => '']]) ?>

                    </div>
                    <div class="form-actions">
                        <?= Html::submitButton($model->isNewRecord ? Yii::t('common', 'button.create')
                            : Yii::t('common', 'button.update'), ['class' => $model->isNewRecord ? 'btn btn-success' :
                            'btn btn-primary']) ?>
                        <?php if (!$model->isNewRecord) { ?>
                            <?= Html::a(Yii::t('common', 'button.delete'), ['delete', 'id' => $model->id], [
                                'class' => 'btn btn-danger',
                                'data' => [
                                    'confirm' => 'Are you sure you want to delete this item?',
                                    'method' => 'post',
                                ],
                            ]); ?>
                            <?= Html::a(Yii::t('common', 'button.cancel'), ['index', 'book_id' => $model->book_id], ['class' => 'btn btn-default']) ?>
                        <?php } else { ?>
                            <?= Html::a(Yii::t('common', 'button.cancel'), ['index', 'book_id' => $book->id], ['class' => 'btn btn-default']) ?>
                        <?php } ?>
                    </div>
                </div>
                <?php ActiveForm::end(); ?>
            </div>

        </div>
    </div>
<?php } ?>


