<?php

namespace backend\modules\book\actions;

use backend\actions\BaseAction;
use backend\modules\book\models\BookAPI;
use common\components\FApi;
use common\components\FConstant;

class BookListAction extends BaseAction
{
    public $is_secured = false;

    public function run()
    {
        if (($re = $this->isAuthorized()) !== true)
            return $re;

        //$user_id = $this->user_id;

        $type = isset($_REQUEST['type']) ? $_REQUEST['type'] : 'all'; //classic/ebook/all
        $keyword = isset($_REQUEST['keyword']) ? $_REQUEST['keyword'] : '';
        $category_id = isset($_REQUEST['category_id']) ? $_REQUEST['category_id'] : '';  //1,2,3
        $page = isset($_REQUEST['page']) ? $_REQUEST['page'] : 1;
        $number_per_page = FConstant::DEFAULT_ITEMS_PER_PAGE;

        $condition = "1 = 1";

        if($type != "all"){
            $condition .= "AND type = $type";
        }

        if (strlen($keyword) != 0) {
                $condition .= " AND title like '%$keyword%'";
        }

        if(strlen($category_id)!=0){
            $condition .= " AND id IN (SELECT object_id FROM object_relation WHERE object_type = 'book' AND object2_id IN ($category_id) AND object2_type = 'category')";
        }

        $total = BookAPI::find()->where($condition)->count();

        $total_page = ceil($total / $number_per_page);
        $start_index = $page * $number_per_page - $number_per_page;

        $distribution_users = BookAPI::find()->where($condition)
            ->limit($number_per_page)
            ->offset($start_index)
            ->all();
        return FApi::getOutputForAPI($distribution_users, FConstant::SUCCESS, 'OK', ['total_page' => $total_page, 'code' => 200]);
       
    }
}
