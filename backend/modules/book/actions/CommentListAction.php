<?php

namespace backend\modules\book\actions;

use backend\actions\BaseAction;
use backend\modules\book\models\BookCommentAPI;
use common\components\FApi;
use common\components\FConstant;

class CommentListAction extends BaseAction
{
    public $is_secured = false;

    public function run()
    {
        if (($re = $this->isAuthorized()) !== true)
            return $re;

        //$user_id = $this->user_id;

        $chapter_id = isset($_REQUEST['chapter_id']) ? $_REQUEST['chapter_id'] : '';  //1
        $book_id = isset($_REQUEST['book_id']) ? $_REQUEST['book_id'] : '';  //1
        $page = isset($_REQUEST['page']) ? $_REQUEST['page'] : 1;
        $number_per_page = FConstant::DEFAULT_ITEMS_PER_PAGE;

        $condition = "1 = 1";
        
        $order = "id DESC";

        if (strlen($book_id) != 0) {
            $condition .= " AND book_id = $book_id";
        }
        if (strlen($chapter_id) != 0) {
            $condition .= " AND chapter_id = $chapter_id";
        }
        $total = BookCommentAPI::find()->where($condition)->count();

        $total_page = ceil($total / $number_per_page);
        $start_index = $page * $number_per_page - $number_per_page;

        $distribution_users = BookCommentAPI::find()->where($condition)
            ->limit($number_per_page)
            ->offset($start_index)
            ->orderBy($order)
            ->all();
        return FApi::getOutputForAPI($distribution_users, FConstant::SUCCESS, 'OK', ['total_page' => $total_page, 'code' => 200]);
    }
}
