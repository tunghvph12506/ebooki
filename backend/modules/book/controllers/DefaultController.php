<?php

namespace backend\modules\book\controllers;

use backend\controllers\BackendController;

/**
 * Default controller for the `book` module
 */
class DefaultController extends BackendController
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }
}
