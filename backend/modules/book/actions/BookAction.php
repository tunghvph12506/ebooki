<?php

namespace backend\modules\book\actions;

use backend\actions\BaseAction;
use backend\modules\book\models\Book;
use common\components\FApi;
use common\components\FConstant;
use common\components\FHtml;

class BookAction extends BaseAction
{
    public $is_secured = false;

    public function run()
    {
        if (($re = $this->isAuthorized()) !== true)
            return $re;

        $action = isset($_REQUEST['action']) ? $_REQUEST['action'] : ''; //read
        $book_id = FHtml::getRequestParam('book_id', '');

        if (strlen($action) == 0 || strlen($book_id) == 0) {
            return FApi::getOutputForAPI('', FConstant::ERROR, FConstant::MISSING_PARAMS, ['code' => 202]);
        }

        $check = Book::findOne($book_id);

        if (isset($check)) {
            if ($action == "read") {
                $url = ['book/api/update-counter',
                    'object_id' => $book_id,
                    'object_type' => \backend\modules\book\Book::OBJECT_TYPE_BOOK
                ];
                FApi::async($url);
            }
            return FApi::getOutputForAPI('', FConstant::SUCCESS, 'OK', ['code' => 200]);
        } else {
            return FApi::getOutputForAPI('', FConstant::ERROR, FConstant::DATA_NOT_FOUND, ['code' => 221]);
        }
    }
}