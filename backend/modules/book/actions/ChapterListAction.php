<?php

namespace backend\modules\book\actions;

use backend\actions\BaseAction;
use backend\modules\book\models\BookChapterAPI;
use common\components\FApi;
use common\components\FConstant;

class ChapterListAction extends BaseAction
{
    public $is_secured = false;

    public function run()
    {
        if (($re = $this->isAuthorized()) !== true)
            return $re;

        //$user_id = $this->user_id;

        $type = isset($_REQUEST['type']) ? $_REQUEST['type'] : 'all'; //classic/ebook/all
        $keyword = isset($_REQUEST['keyword']) ? $_REQUEST['keyword'] : '';
        $book_id = isset($_REQUEST['book_id']) ? $_REQUEST['book_id'] : '';  //1
        $page = isset($_REQUEST['page']) ? $_REQUEST['page'] : 1;
        $number_per_page = FConstant::DEFAULT_ITEMS_PER_PAGE;

        $condition = "1 = 1";

        if($type != "all"){
            $condition .= "AND type = $type";
        }

        if (strlen($keyword) != 0) {
                $condition .= " AND title like '%$keyword%'";
        }

        if(strlen($book_id)!=0){
            $condition .= " AND book_id = $book_id";
        }

        $total = BookChapterAPI::find()->where($condition)->count();

        $total_page = ceil($total / $number_per_page);
        $start_index = $page * $number_per_page - $number_per_page;

        $distribution_users = BookChapterAPI::find()->where($condition)
            ->limit($number_per_page)
            ->offset($start_index)
            ->all();

        return FApi::getOutputForAPI($distribution_users, FConstant::SUCCESS, 'OK', ['total_page' => $total_page, 'code' => 200]);
        
    }
}
