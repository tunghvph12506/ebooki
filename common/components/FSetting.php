<?php

namespace common\components;

use backend\modules\app\App;
use backend\modules\book\Book;
use Yii;

class FSetting
{
    public static function backendMenu($module, $controller, $action)
    {
        $menu[] =  array(
            'active' => $controller == 'site' && ( $action == 'index' || $action == 'error'),
            'name' => Yii::t('common', 'menu.home'),
            'icon' => 'glyphicon glyphicon-home',
            'url' => Yii::$app->urlManager->createUrl(['/site/index']),
        );

        $menu = array_merge($menu, App::createModuleMenu($module, $controller, $action));
        $menu = array_merge($menu, Book::createModuleMenu($module, $controller, $action));

        $menu[] = array(
            'name' => Yii::t('common', 'menu.about'),
            'url' => Yii::$app->urlManager->createUrl(['/site/about']),
            'active' => $controller == 'site' AND $action == 'about',
            'icon' => 'fa fa-info-circle'
        );
        $menu[] = array(
            'name' => Yii::t('common', 'menu.setting'),
            'url' => Yii::$app->urlManager->createUrl(['/setting/index']),
            'active' => $controller == 'setting',
            'icon' => 'glyphicon glyphicon-cog'
        );

        return $menu;
    }
}