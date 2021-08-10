<?php

namespace backend\modules\book\actions;

use backend\actions\BaseAction;
use backend\models\ObjectCounterAPI;
use backend\modules\book\models\BookAPI;
use common\components\FApi;
use common\components\FConstant;
use yii\helpers\ArrayHelper;

class BookRankingAction extends BaseAction
{
    public $is_secured = false;

    public function run()
    {
        if (($re = $this->isAuthorized()) !== true)
            return $re;

        //$user_id = $this->user_id;

        $mode = isset($_REQUEST['mode']) ? $_REQUEST['mode'] : 'all'; //currently/history/all
        $type = isset($_REQUEST['type']) ? $_REQUEST['type'] : 'weekly'; //daily/weekly/monthly
        $date = isset($_REQUEST['date']) ? $_REQUEST['date'] : ''; // 22
        $week = isset($_REQUEST['week']) ? $_REQUEST['week'] : ''; // 49
        $month = isset($_REQUEST['month']) ? $_REQUEST['month'] : ''; // 06
        $year = isset($_REQUEST['year']) ? $_REQUEST['year'] : ''; // 2017
        $page = isset($_REQUEST['page']) ? $_REQUEST['page'] : 1;
        $number_per_page = FConstant::DEFAULT_ITEMS_PER_PAGE;


        if (strlen($mode) == 0 || ($mode == "history" && strlen($date) == 0 && strlen($month) == 0 && strlen($week) == 0 && strlen($year) == 0)) {
            return FApi::getOutputForAPI('', FConstant::ERROR, FConstant::MISSING_PARAMS, ['code' => 202]);
        }


        $condition = "1 = 1";
        $order = "view_count DESC";

        //get query result as array of values
        //return  ArrayHelper::getColumn(ObjectCounterAPI::find()->all(), 'id');

//            $recipes = Recipes::find()
//                ->where(['in', 'id', $recipeIds])
//                ->orderBy([new \yii\db\Expression('FIELD (id, ' . implode(',', array_reverse(array_keys($params))) . ')')])
//                ->limit($this->count)
//                ->all();

        if($mode == "currently"){
            $now = time();
            $date = date('d', $now);
            $week = date('W', $now);
            $month = date('m', $now);
            $year = date('Y', $now);

            if($type == "daily"){
                $book_ids = ArrayHelper::getColumn(ObjectCounterAPI::find()->
                where("object_type = 'book' AND attribute = 'view_count'  AND date = '$date' AND month = '$month' AND year = '$year' AND focus = 'date'")->orderBy("count DESC")->all(), 'object_id');
                $order = [new \yii\db\Expression('FIELD (id, ' . implode(',', $book_ids) . ')')];
            }elseif($type == "weekly"){
                $book_ids = ArrayHelper::getColumn(ObjectCounterAPI::find()->
                where("object_type = 'book' AND attribute = 'view_count'  AND week = '$week' AND year = '$year' AND focus = 'week'")->orderBy("count DESC")->all(), 'object_id');
                $order = [new \yii\db\Expression('FIELD (id, ' . implode(',', $book_ids) . ')')];
            }elseif($type== "monthly"){

                $book_ids = ArrayHelper::getColumn(ObjectCounterAPI::find()->
                where("object_type = 'book' AND attribute = 'view_count'  AND month = '$month' AND year = '$year' AND focus = 'month'")->orderBy("count DESC")->all(), 'object_id');
                $order = [new \yii\db\Expression('FIELD (id, ' . implode(',', $book_ids) . ')')];
            }else{
                return FApi::getOutputForAPI('', FConstant::ERROR, FApi::getErrorMsg(201), ['code' => 201]);
            }

            $condition = ['in', 'id', $book_ids];

        }elseif($mode == "history"){
            $now = time();
            $date = date('d', $now);
            $week = date('W', $now);
            $month = date('m', $now);
            $year = date('Y', $now);

            if($type == "daily"){

                if (strlen($date) == 0 && strlen($month) == 0 && strlen($week) == 0 && strlen($year) == 0) {
                    return FApi::getOutputForAPI('', FConstant::ERROR, FConstant::MISSING_PARAMS, ['code' => 202]);
                }

                $book_ids = ArrayHelper::getColumn(ObjectCounterAPI::find()->
                where("object_type = 'book' AND attribute = 'view_count'  AND date = '$date' AND month = '$month' AND year = '$year' AND focus = 'date'")->all(), 'object_id');
                $order = [new \yii\db\Expression('FIELD (id, ' . implode(',', $book_ids) . ')')];
            }elseif($type == "weekly"){

                if (strlen($week) == 0 && strlen($year) == 0) {
                    return FApi::getOutputForAPI('', FConstant::ERROR, FConstant::MISSING_PARAMS, ['code' => 202]);
                }

                $book_ids = ArrayHelper::getColumn(ObjectCounterAPI::find()->
                where("object_type = 'book' AND attribute = 'view_count'  AND week = '$week' AND year = '$year' AND focus = 'week'")->all(), 'object_id');
                $order = [new \yii\db\Expression('FIELD (id, ' . implode(',', $book_ids) . ')')];
            }elseif($type== "monthly"){

                if (strlen($month) == 0 && strlen($year) == 0) {
                    return FApi::getOutputForAPI('', FConstant::ERROR, FConstant::MISSING_PARAMS, ['code' => 202]);
                }

                $book_ids = ArrayHelper::getColumn(ObjectCounterAPI::find()->
                where("object_type = 'book' AND attribute = 'view_count'  AND month = '$month' AND year = '$year' AND focus = 'month'")->all(), 'object_id');
                $order = [new \yii\db\Expression('FIELD (id, ' . implode(',', $book_ids) . ')')];
            }else{
                return FApi::getOutputForAPI('', FConstant::ERROR, FApi::getErrorMsg(201), ['code' => 201]);
            }
            $condition = ['in', 'id', $book_ids];
        }

        $total = BookAPI::find()->where($condition)->count();

        $total_page = ceil($total / $number_per_page);
        $start_index = $page * $number_per_page - $number_per_page;

        $distribution_users = BookAPI::find()->where($condition)
            ->orderBy($order)
            ->limit($number_per_page)
            ->offset($start_index)
            ->all();

        return FApi::getOutputForAPI($distribution_users, FConstant::SUCCESS, 'OK', ['total_page' => $total_page, 'code' => 200]);

    }
}
