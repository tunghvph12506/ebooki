<?php
/**
 * Created by PhpStorm.
 * User: tongd
 * Date: 02/03/2018
 * Time: 10:47 CH
 */

namespace backend\modules\book\actions;


use backend\actions\BaseAction;
use backend\modules\book\models\BookAPI;
use common\components\FApi;
use common\components\FConstant;
use common\components\FHtml;

class ListBookAction extends BaseAction
{
    const IS_FEATURE = 1,
        IS_NEW = 2,
        IS_HOT = 3;

    public $is_secured = false;

    public function run()
    {

        $time = -microtime(true);

        $condition = "1 = 1";
        $distribution_book = null;

        if (($re = $this->isAuthorized()) !== true)
            return $re;

        /*
         * Nếu filter = 1 thì get book is feature - feature
         * filter = 2 lấy book theo mới nhất - new
         * filter = 3 thì lấy book sắp xếp theo lượt tải  - hot
         * */

        $filter = isset($_REQUEST['filter']) ? (string)(int)$_REQUEST['filter'] : '';
        $filter = str_replace('/[^0-9]/', '', $filter);

        $page = isset($_REQUEST['page']) ? (string)(int)$_REQUEST['page'] : 1;
        $page = str_replace('/[^0-9]/', '', $page);

        $number_per_page = isset($_REQUEST['per-page']) ? (string)(int)$_REQUEST['per-page'] : FConstant::DEFAULT_ITEMS_PER_PAGE;
        $number_per_page = str_replace('/[^0-9]/', '', $number_per_page);

        if (preg_match("/[0-9]/", $filter)) {
            if (in_array($filter, array(1, 2, 3))) {
                if ($filter == self::IS_FEATURE) {
                    $condition = ["is_feature" => self::IS_FEATURE];
                }
                $total = BookAPI::find()->where($condition)->count();
                $total_page = ceil($total / $number_per_page);
                $start_index = $page * $number_per_page - $number_per_page;

                switch ($filter) {
                    case self::IS_FEATURE:
                        $distribution_book = BookAPI::find()
                            ->where($condition)
                            ->limit($number_per_page)
                            ->offset($start_index)
                            ->all();
                        break;
                    case self::IS_NEW:
                        $distribution_book = BookAPI::find()
                            ->limit($number_per_page)
                            ->offset($start_index)
                            ->orderBy('created_date DESC')
                            ->all();
                        break;
                    case self::IS_HOT:
                        $distribution_book = BookAPI::find()
                            ->limit($number_per_page)
                            ->offset($start_index)
                            ->orderBy('view_count DESC')
                            ->all();
                        break;
                }
                $time += microtime(true); //thoi gian ket thuc
                return FApi::getOutputForAPI($distribution_book, FConstant::SUCCESS, 'OK', ['total_page' => $total_page, 'code' => 200, "speed_execution" => $time]);

            } else {
                return FApi::getOutputForAPI('', FConstant::NOT_FOUND, "Data not found", ['code' => 215]);
            }

        } else {
            return FApi::getOutputForAPI('', FConstant::ERROR, FConstant::MISSING_PARAMS, ['code' => 202]);
        }
    }
}