<?php

namespace backend\modules\book\actions;

use backend\actions\BaseAction;
use backend\modules\book\models\BookBookmarkAPI;
use common\components\FApi;
use common\components\FConstant;

class BookmarkListAction extends BaseAction
{
    public $is_secured = true;

    public function run()
    {
        if (($re = $this->isAuthorized()) !== true)
            return $re;

        $user_id = $this->user_id;

        $page = isset($_REQUEST['page']) ? $_REQUEST['page'] : 1;
        $number_per_page = FConstant::DEFAULT_ITEMS_PER_PAGE;

        $condition = "user_id = $user_id";

        $total = BookBookmarkAPI::find()->where($condition)->count();

        $total_page = ceil($total / $number_per_page);
        $start_index = $page * $number_per_page - $number_per_page;

        $distribution_users = BookBookmarkAPI::find()->where($condition)
            ->limit($number_per_page)
            ->offset($start_index)
            ->all();
        return FApi::getOutputForAPI($distribution_users, FConstant::SUCCESS, 'OK', ['total_page' => $total_page, 'code' => 200]);
    }
}
