<?php
/**
 * Created by PhpStorm.
 * User: Quyen_Bui
 * Date: 7/12/2016
 * Time: 3:10 PM
 */

namespace projectemplate\ptcrud;

use yii\base\Controller;

class Helper extends Controller
{
    public static function checkHiddenField ($name, $array){

        foreach ($array as $item){
            if(strpos($item,'*') == 0){
                if(strpos($name,trim($item,'*')) !== false){
                    return true;
                }
            }else{
                if ($name == $item){
                    return true;
                }
            }
        }

        return false;
    }
}