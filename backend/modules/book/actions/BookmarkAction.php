<?php

namespace backend\modules\book\actions;

use backend\actions\BaseAction;
use backend\modules\book\models\BookBookmarkAPI;
use common\components\FApi;
use common\components\FConstant;
use common\components\FHtml;

class BookmarkAction extends BaseAction
{
    public $is_secured = true;

    public function run()
    {
        if (($re = $this->isAuthorized()) !== true)
            return $re;

        $book_id = FHtml::getRequestParam('book_id', '');
        $chapter_id = FHtml::getRequestParam('chapter_id', '');
        $page_number = FHtml::getRequestParam('page_number', '');

        if (strlen($book_id)==0 || strlen($chapter_id)==0 & $page_number) {
            return FApi::getOutputForAPI('', FConstant::ERROR, FConstant::MISSING_PARAMS, ['code' => 202]);
        }

        $user_id = $this->user_id;


        $now = time();
        $today = date('Y-m-d H:i:s', $now);

        /* @var BookBookmarkAPI $bookmark*/
        $bookmark = BookBookmarkAPI::find()->where("user_id = $user_id AND book_id = $book_id AND chapter_id = $chapter_id")->one();
        if(isset($bookmark)){
            $bookmark->page_number = $page_number;
            $bookmark->modified_date = $today;
        }else{
            $bookmark = new BookBookmarkAPI();
            $bookmark->user_id = $user_id;
            $bookmark->book_id = $book_id;
            $bookmark->chapter_id = $chapter_id;
            $bookmark->page_number = $page_number;
            $bookmark->created_date = $today;
        }

        if ($bookmark->save()) {
            return FApi::getOutputForAPI('', FConstant::SUCCESS, 'OK', ['code' => 200]);
        } else {
            return FApi::getOutputForAPI('', FConstant::ERROR, 'FAIL', ['code' => 201]);
        }
    }
}