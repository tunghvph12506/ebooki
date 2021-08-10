<?php
namespace backend\controllers;
use common\components\FConstant;
use common\components\FHtml;
use common\components\FSetting;
use kartik\form\ActiveForm;
use Yii;
use yii\web\Controller;


class BackendController extends Controller
{
    public $mainMenu = array();
    public $uploadFolder;

    public function init()
    {
        parent::init();
        $this->view->params['toolBarActions'] = FHtml::config('toolBarActions', array());
        $this->view->params['uploadFolder'] = $this->uploadFolder;
        $isAjax = FHtml::config('isAjax', false);
        $this->view->params['isAjax'] = $isAjax;
        $this->view->params['displayType'] = $isAjax ? "modal-remote" : "";

        $isMD = FHtml::config('isMD', true); //material design

        if ($isMD == false) {
            $this->view->params['cssComponents'] = "components-rounded";
            $this->view->params['cssPlugins'] = "plugins";
            $this->view->params['page-md'] = "";
        } else {
            $this->view->params['cssComponents'] = "components-md";
            $this->view->params['cssPlugins'] = "plugins-md";
            $this->view->params['page-md'] = "page-md";
        }
        $this->view->params['portletStyle'] = FHtml::config('portletStyle', FConstant::WIDGET_TYPE_BOX);


        $color = (FHtml::config('portletStyle', FConstant::WIDGET_TYPE_BOX) == FConstant::WIDGET_TYPE_BOX) ? FHtml::config('mainColor', FConstant::WIDGET_COLOR_DEFAULT) : '';

        $this->view->params['portletStyle'] = 'portlet'.' '.FConstant::WIDGET_TYPE_LIGHT;
        $this->view->params['mainIcon'] = FHtml::config('mainIcon', '');
        $this->view->params['mainColor'] = FHtml::config('mainColor', FConstant::WIDGET_COLOR_DEFAULT);
        $this->view->params['displayPortlet'] = FHtml::config('displayPortlet', true);
        $this->view->params['activeForm_type'] = FHtml::config('activeForm_type', ActiveForm::TYPE_HORIZONTAL);
        $this->view->params['displayPageContentHeader'] = FHtml::config('displayPageContentHeader', true);

    }

    public function beforeAction($action){
        $this->uploadFolder = Yii::getAlias('@'.UPLOAD_DIR);
        $this->createMenu();
        return parent::beforeAction($action);
    }


    public function createMenu(){
        $module = $this->module->id;
        $controller = Yii::$app->controller->id;
        $action = $this->action->id;

        $menu = FSetting::backendMenu($module, $controller, $action);

        $this->mainMenu = $menu;
        $this->view->params['mainMenu'] = $this->mainMenu;
    }
}

