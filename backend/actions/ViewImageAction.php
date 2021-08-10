<?php
namespace backend\actions;

use common\components\FConstant;
use common\components\FHtml;
use Yii;

class ViewImageAction extends BaseAction
{

    public function run()
    {
        $d = isset($_REQUEST['d']) ? $_REQUEST['d'] : '';  //directory
        $f = isset($_REQUEST['f']) ? $_REQUEST['f'] : '';  //file name
        $s = isset($_REQUEST['s']) ? $_REQUEST['s'] : '';  //thumb

        $file = FHtml::getImagePath($s.$f, $d); ///also works
        //$file = FHtml::getFileURL($s.$f, $d, BACKEND, FConstant::NO_IMAGE);
		
		//echo $file;die;

        $info = getimagesize($file);

        header("Content-type: {$info['mime']}");

        readfile($file);
    }

//    public function actionFile($filename, $filePath)
//    {
//        // check filename for allowed chars (do not allow ../ to avoid security issue: downloading arbitrary files)
//        if (!preg_match('/^[a-z0-9]+\.[a-z0-9]+$/i', $filename) || !is_file($filePath)) {
//            throw new \yii\web\NotFoundHttpException('The file does not exists.');
//        }
//        return Yii::$app->response->sendFile($filePath, $filename);
//
//
//    }

}
