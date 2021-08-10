<?php

namespace backend\modules\app;
use common\components\FHtml;
use Yii;

/**
 * app module definition class
 */
class App extends \yii\base\Module
{
    /**
     * @inheritdoc
     */
    public $controllerNamespace = 'backend\modules\app\controllers';

    /**
     * @inheritdoc
     */
    public function init()
    {
        parent::init();
        // custom initialization code goes here
    }

    public static function createModuleMenu($module, $controller, $action){

        return
            array(
                array(
                    'active' => $module == 'app',
                    'name' => Yii::t('common', 'menu.module.user'),
                    'icon' => 'glyphicon glyphicon-user',
                    'children' => array(
                        array(
                            'name' => Yii::t('common', 'menu.user'),
                            'url' => Yii::$app->urlManager->createUrl(['app/app-user/index']),
                            'active' => $controller == 'app-user',
                            'icon' => '',
                        ),
                        array(
                            'name' => Yii::t('common', 'menu.feedback'),
                            'url' => Yii::$app->urlManager->createUrl(['app/feedback/index']),
                            'active' => $controller == 'feedback' ,
                            'icon' => '',
                        ),
                    ),
                ),
            );

    }

}
