<?php

namespace backend\modules\book\actions;

use backend\actions\BaseAction;
use backend\models\ObjectCounterAPI;
use backend\models\ObjectCounterHistoryAPI;
use backend\modules\book\models\Book;
use common\components\FApi;
use common\components\FConstant;
use common\components\FHtml;

class UpdateCounterAction extends BaseAction
{
    public $is_secured = false;

    public function run()
    {
        if (($re = $this->isAuthorized()) !== true)
            return $re;

        $object_id = FHtml::getRequestParam('object_id', '');
        $object_type = FHtml::getRequestParam('object_type', '');
        if (strlen($object_id) == 0 || strlen($object_type) == 0) {
            return FApi::getOutputForAPI('', FConstant::ERROR, FConstant::MISSING_PARAMS, ['code' => 202]);
        }

        $now = time();
        //$today = date('Y-m-d H:i:s', $now);
        $date = date('d', $now);
        $week = date('W', $now);
        $month = date('m', $now);
        $year = date('Y', $now);

        if ($object_type == \backend\modules\book\Book::OBJECT_TYPE_BOOK) {

            $check = Book::findOne($object_id);
            if (isset($check)) {

                $check->updateCounters(['view_count' => 1]);
                $check->save();

                $condition = "object_id = $object_id AND object_type = '$object_type' AND attribute = 'view_count'";

                $daily_condition = $condition . " AND date = '$date' AND month = '$month' AND year = '$year' AND focus = 'date'";
                $daily = ObjectCounterAPI::find()->where($daily_condition)->one();

//                $query = ObjectCounterAPI::find()->where($daily_condition);
//                var_dump($query->prepare(Yii::$app->db->queryBuilder)->createCommand()->rawSql);
//                exit();

                if (isset($daily)) {
                    $daily->updateCounters(['count' => 1]);
                    $daily->save();
                } else {
                    $new_daily = new ObjectCounterAPI();
                    $new_daily->object_id = $object_id;
                    $new_daily->object_type = $object_type;
                    $new_daily->attribute = 'view_count';
                    $new_daily->date = $date;
                    $new_daily->month = $month;
                    $new_daily->year = $year;
                    $new_daily->focus = "date";
                    $new_daily->count = 1;
                    $new_daily->save();
                }

                $weekly_condition = $condition . " AND week = '$week' AND year = '$year' AND focus = 'week'";
                $weekly = ObjectCounterAPI::find()->where($weekly_condition)->one();
                if (isset($weekly)) {
                    $weekly->updateCounters(['count' => 1]);
                    $weekly->save();
                } else {
                    $new_weekly = new ObjectCounterAPI();
                    $new_weekly->object_id = $object_id;
                    $new_weekly->object_type = $object_type;
                    $new_weekly->attribute = 'view_count';
                    $new_weekly->week = $week;
                    $new_weekly->month = $month;
                    $new_weekly->year = $year;
                    $new_weekly->focus = "week";
                    $new_weekly->count = 1;
                    $new_weekly->save();
                }

                $monthly_condition = $condition . " AND month = '$month' AND year = '$year' AND focus = 'month'";
                $monthly = ObjectCounterAPI::find()->where($monthly_condition)->one();
                if (isset($monthly)) {
                    $monthly->updateCounters(['count' => 1]);
                    $monthly->save();
                } else {
                    $new_monthly = new ObjectCounterAPI();
                    $new_monthly->object_id = $object_id;
                    $new_monthly->object_type = $object_type;
                    $new_monthly->attribute = 'view_count';
                    $new_monthly->month = $month;
                    $new_monthly->year = $year;
                    $new_monthly->focus = "month";
                    $new_monthly->count = 1;
                    $new_monthly->save();
                }

                //Move to history table
                $i = 1;
                //daily
                $old_daily_condition = "object_type = '$object_type' AND attribute = 'view_count' AND date != '$date' AND focus = 'date'";
                $old_daily = ObjectCounterAPI::find()->where($old_daily_condition)->orderBy("count DESC")->limit(40)->all();
                /* @var $item ObjectCounterHistoryAPI*/
                ObjectCounterAPI::deleteAll($old_daily_condition);
                foreach($old_daily as $item){
                    $i+=1;
                    $new_daily_history = new ObjectCounterHistoryAPI();
                    $new_daily_history->object_id = $item->object_id;
                    $new_daily_history->object_type = $item->object_type;;
                    $new_daily_history->attribute = $item->attribute;
                    $new_daily_history->date = $item->date;
                    $new_daily_history->month = $item->month;
                    $new_daily_history->year = $item->year;
                    $new_daily_history->focus = $item->focus;
                    $new_daily_history->count = $item->count;
                    $new_daily_history->position = $i;
                    $new_daily_history->save();
                }
                //weekly
                $old_weekly_condition = "object_type = '$object_type' AND attribute = 'view_count' AND week != '$week' AND focus = 'week'";
                $old_weekly = ObjectCounterAPI::find()->where($old_weekly_condition)->orderBy("count DESC")->limit(40)->all();
                /* @var $item1 ObjectCounterHistoryAPI*/
                ObjectCounterAPI::deleteAll($old_weekly_condition);
                foreach($old_weekly as $item1){
                    $i+=1;
                    $new_weekly_history = new ObjectCounterHistoryAPI();
                    $new_weekly_history->object_id = $item1->object_id;
                    $new_weekly_history->object_type = $item1->object_type;;
                    $new_weekly_history->attribute = $item1->attribute;
                    $new_weekly_history->week = $item1->week;
                    $new_weekly_history->year = $item1->year;
                    $new_weekly_history->focus = $item1->focus;
                    $new_weekly_history->count = $item1->count;
                    $new_weekly_history->position = $i;
                    $new_weekly_history->save();
                }

                //monthly
                $old_monthly_condition = "object_type = '$object_type' AND attribute = 'view_count' AND month != '$month' AND focus = 'month'";
                $old_monthly = ObjectCounterAPI::find()->where($old_monthly_condition)->orderBy("count DESC")->limit(40)->all();
                /* @var $item2 ObjectCounterHistoryAPI*/
                ObjectCounterAPI::deleteAll($old_monthly_condition);
                foreach($old_monthly as $item2){
                    $i+=1;
                    $new_monthly_history = new ObjectCounterHistoryAPI();
                    $new_monthly_history->object_id = $item2->object_id;
                    $new_monthly_history->object_type = $item2->object_type;;
                    $new_monthly_history->attribute = $item2->attribute;
                    $new_monthly_history->month = $item2->month;
                    $new_monthly_history->year = $item2->year;
                    $new_monthly_history->focus = $item2->focus;
                    $new_monthly_history->count = $item2->count;
                    $new_monthly_history->position = $i;
                    $new_monthly_history->save();
                }
            }
        }
    }
}