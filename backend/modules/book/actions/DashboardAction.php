<?php

namespace backend\modules\book\actions;

use backend\actions\BaseAction;
use backend\models\ObjectCounterAPI;
use backend\modules\book\models\BookAPI;
use common\components\FApi;
use common\components\FConstant;
use yii\helpers\ArrayHelper;

class DashboardAction extends BaseAction
{
    public $is_secured = false;

    public function run()
    {
        if (($re = $this->isAuthorized()) !== true)
            return $re;

        //$user_id = $this->user_id;

        $new_books = BookAPI::find()->orderBy("created_date DESC")->limit(10)->all();

        $feature_books = BookAPI::find()->where("is_feature = 1")->orderBy("id DESC")->limit(10)->all();

        $now = time();
        $week = date('W', $now);
        $year = date('Y', $now);

        $book_ids = ArrayHelper::getColumn(ObjectCounterAPI::find()->where("object_type = 'book' AND attribute = 'view_count'  AND week = '$week' AND year = '$year' AND focus = 'week'")->orderBy("count DESC")->all(), 'object_id');

        $condition = '1=1';
        $order = "view_count DESC";

        if(count($book_ids)!= 0){
            $condition = ['in', 'id', $book_ids];
            $order = [new \yii\db\Expression('FIELD (id, ' . implode(',', $book_ids) . ')')];
        }

        $hot_books = BookAPI::find()->where($condition)->orderBy($order)->all();

        $data = array('hot' => $hot_books, "new" => $new_books, 'feature' => $feature_books);

        return FApi::getOutputForAPI($data, FConstant::SUCCESS, 'OK', [ 'code' => 200]);

    }
}
