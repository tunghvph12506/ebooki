<?php

namespace backend\controllers;
use backend\models\Setting;
use backend\models\SettingForm;
use Yii;
use yii\web\UploadedFile;
use common\models\PasswordForm;
use common\models\User;


class SettingController extends BackendController
{


    public function actionIndex()
    {

        $model = new SettingForm();
        $model->loadModel();

        $oldPem = $model->pem;


        if(isset($_POST['SettingForm'])){
            $model->attributes = $_POST['SettingForm'];
            $uploadedFile = UploadedFile::getInstance($model, 'pem');

            if($model->validate()) {

                if ($uploadedFile && $uploadedFile->size > 0) {
                    $name_file = time().'.'.$uploadedFile->extension;
                    $model->pem = $name_file;
                }
                else
                    $model->pem = $oldPem;
                
                if ($uploadedFile && $uploadedFile->size > 0) {
                    $uploadFolder = $this->uploadFolder . DIRECTORY_SEPARATOR . PEM_DIR;

                    if (!file_exists($uploadFolder)) {
                        mkdir($uploadFolder, 0777, true);
                    }
                    $uploadedFile->saveAs($uploadFolder . DIRECTORY_SEPARATOR . $model->pem);  // image
                    $oldPath = $uploadFolder . DIRECTORY_SEPARATOR . $oldPem;
                    if (file_exists($oldPath) && is_file($oldPath)) {
                        unlink($oldPath);
                    }
                }
                $model->save();
            }
        }

        return $this->render('index', array(
            'model' => $model,
        ));
    }

    public function actionChangePassword(){

        $model = new PasswordForm;
        $modeluser = User::find()->where([
            'username'=>Yii::$app->user->identity->username
        ])->one();
        if($model->load(Yii::$app->request->post())){
            if($model->validate()){
                try{
                    $modeluser->password_hash = Yii::$app->getSecurity()->generatePasswordHash($model->newPass);
                    if($modeluser->save()){
                        Yii::$app->getSession()->setFlash(
                            'success','Password changed'
                        );
                        Yii::$app->user->logout();
                        return $this->redirect(['site/login']);
                    }else{
                        Yii::$app->getSession()->setFlash(
                            'error','Password not changed'
                        );
                        return $this->redirect(['change-password']);
                    }
                }catch(\Exception $e){
                    Yii::$app->getSession()->setFlash(
                        'error',"{$e->getMessage()}"
                    );
                    return $this->render('change-password',[
                        'model'=>$model
                    ]);
                }
            }else{
                return $this->render('change-password',[
                    'model'=>$model
                ]);
            }
        }else{
            return $this->render('change-password',[
                'model'=>$model
            ]);
        }
        
    }
}
