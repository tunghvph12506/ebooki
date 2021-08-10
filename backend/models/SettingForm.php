<?php
namespace backend\models;

use common\components\FConstant;
use yii\base\Model;
use Yii;

class SettingForm extends Model
{
    public $admin_email;
    public $api_key;
    public $pem;
    public $company_name;
    public $company_description;
    public $company_homepage;


    /**
     * @return array validation rules for model attributes.
     */

    public function rules()
    {
        return [
            [['admin_email'], 'string', 'max' => 300],
            [['api_key'], 'string', 'max' => 300],
            ['pem', 'file', 'extensions' => ['pem'], 'skipOnEmpty' => true, 'minSize' => 1],
        ];
    }

    /**
     * @return array customized attribute labels (name=>label)
     */
    public function attributeLabels()
    {
        return array(
            'admin_email' => 'Admin Email',
            'api_key' => 'Google API Key',
            'pem' => 'Pem File',
        );
    }

    /**
     * Create instance form $id of model
     */

    public function loadModel()
    {
        $model = new Setting();
        $this->admin_email = $model->getSettingValueByKey(FConstant::ADMIN_EMAIL);
        $this->api_key = $model->getSettingValueByKey(FConstant::GOOGLE_API_KEY);
        $this->pem = $model->getSettingValueByKey(FConstant::PEM_FILE);
    }


    public function save()
    {

        $isSave = FALSE;
        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = new Setting();
            $model->setSettingValueByKey(FConstant::ADMIN_EMAIL, $this->admin_email);
            $model->setSettingValueByKey(FConstant::GOOGLE_API_KEY, $this->api_key);
            $model->setSettingValueByKey(FConstant::PEM_FILE, $this->pem);

            $transaction->commit();
            $isSave = true;

        } catch (\Exception $e) {
            $transaction->rollback();
        }

        if (!$isSave) {
            return false;
        }
        return true;
    }
}