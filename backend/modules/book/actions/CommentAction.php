<?php

namespace backend\modules\book\actions;

use backend\actions\BaseAction;
use backend\modules\app\models\AppUserTokenAPI;
use backend\modules\book\models\BookCommentAPI;
use common\components\FApi;
use common\components\FConstant;
use common\components\FHtml;

class CommentAction extends BaseAction
{
    public $is_secured = false;

    public function run()
    {
        if (($re = $this->isAuthorized()) !== true)
            return $re;

        $book_id = FHtml::getRequestParam('book_id', '');
        $chapter_id = FHtml::getRequestParam('chapter_id', '');
        $content = FHtml::getRequestParam('content', '');
        $name = FHtml::getRequestParam('name', '');
        $token = isset($_REQUEST['token']) ? $_REQUEST['token'] : ''; //neu truyen token thi khong can name

        if (strlen($token) != 0) {
            /* @var  $login_token AppUserTokenAPI */
            $login_token = AppUserTokenAPI::find()->where('token = "' . $token . '"')->one();

            if (isset($login_token) && isset ($login_token->user)) {
                $user_id = $login_token->user->id;
                $name = $login_token->user->name;
            } else {
                return FApi::getOutputForAPI('', FConstant::ERROR, FConstant::TOKEN_MISMATCH, ['code' => 205]);
            }
        } else {
            if (strlen($name) == 0) {
                return FApi::getOutputForAPI('', FConstant::ERROR, FConstant::MISSING_PARAMS, ['code' => 202]);
            }
            $user_id = NULL;
        }

        if (strlen($book_id)==0 || strlen($chapter_id)==0 ) {
            return FApi::getOutputForAPI('', FConstant::ERROR, FConstant::MISSING_PARAMS, ['code' => 202]);
        }


        $now = time();
        $today = date('Y-m-d H:i:s', $now);

        $new_device = new BookCommentAPI();
        $new_device->user_id = $user_id;
        $new_device->name = $name;
        $new_device->book_id= $book_id;
        $new_device->chapter_id= $chapter_id;
        $new_device->content = $content;
        $new_device->is_active = FConstant::STATE_ACTIVE;
        $new_device->created_date = $today;
        if ($new_device->save()) {
            return FApi::getOutputForAPI('', FConstant::SUCCESS, 'OK', ['code' => 200]);
        } else {
            return FApi::getOutputForAPI('', FConstant::ERROR, 'FAIL', ['code' => 201]);
        }
    }
}