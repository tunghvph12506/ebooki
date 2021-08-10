<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\modules\book\models\Book */

?>
<div class="book-create">
    <?= $this->render('_form', [
    'model' => $model,
    ]) ?>
</div>
