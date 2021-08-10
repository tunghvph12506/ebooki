<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\modules\book\models\BookChapter */
/* @var $book backend\modules\book\models\Book */

?>
<div class="book-chapter-create">
    <?= $this->render('_form', [
        'model' => $model,
        'book' => $book
    ]) ?>
</div>
