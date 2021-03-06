<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace backend\actions;

use backend\modules\app\models\AppUserTokenAPI;
use common\components\FConstant;
use common\components\FHtml;
use common\components\FApi;

/**
 * Action is the base class for action classes that implement RESTful API.
 *
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class BaseAction extends \yii\base\Action
{
    public $is_secured = true;
    public $checkAccess;
    public $user_id;

    protected function html_decode_x2($xml_string_html)
    {
        if (count($xml_string_html) > 0)
            return strip_tags(html_entity_decode(html_entity_decode(str_replace("&nbsp;", "", $xml_string_html))));
        else return $xml_string_html;
    }

    public function beforeRun()
    {
        return parent::beforeRun(); // TODO: Change the autogenerated stub
    }

    public function isAuthorized(){
        if(!$this->is_secured){
            return true;
        }
        $token = FHtml::getRequestParam('token', '');

        if(strlen($token) != 0)
        {
            $login_token = AppUserTokenAPI::find()->where('token = "'.$token.'"')->one();

            if (isset($login_token)){
                if(isset ($login_token->user)){
                    $this->user_id = $login_token->user->id;
                    return true;
                }else{
                    $login_token->delete();
                    return FApi::getOutputForAPI('', FConstant::ERROR, FApi::getErrorMsg(221), ['code' => 221]);
                }
            }
            else{
                return FApi::getOutputForAPI('', FConstant::ERROR, FConstant::TOKEN_MISMATCH, ['code' => 205]);
            }
        }
        else
        {
            return FApi::getOutputForAPI('', FConstant::ERROR, 'Token missing', ['code' => 204]);
        }
    }
}
