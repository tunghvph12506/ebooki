<?php

namespace common\components;

use backend\modules\app\models\AppUser;
use himiklab\thumbnail\EasyThumbnailImage;
use Yii;
use yii\helpers\Html;
use yii\helpers\Url;

class FHtml
{
    const
        CHANGE_TYPE = 'change',
        CLEAR_TYPE = 'clear',
        FILL_TYPE = 'fill',
        SUBMIT_TYPE = 'submit';
    const
        BUTTON_CREATE = 'create',
        BUTTON_UPDATE = 'update',
        BUTTON_DELETE = 'delete',
        BUTTON_PROCESS = 'processing',
        BUTTON_PENDING = 'pending',
        BUTTON_RESET = 'reset',
        BUTTON_SEARCH = 'search',
        BUTTON_EDIT = 'edit',
        BUTTON_CANCEL = 'cancel',
        BUTTON_ADD = 'add',
        BUTTON_REMOVE = 'remove',
        BUTTON_SELECT = 'select',
        BUTTON_MOVE = 'move',
        BUTTON_RELOAD = 'reload',
        BUTTON_OK = 'ok',
        BUTTON_COPY = 'copy',
        BUTTON_ACCEPT = 'accept',
        BUTTON_REJECT = 'reject',
        BUTTON_APPROVED = 'approved',
        BUTTON_BACK = 'back',
        BUTTON_READ = 'read',
        BUTTON_UNREAD = 'unread',
        BUTTON_CONFIRM = 'confirm',
        BUTTON_COMPLETE = 'complete',
        BUTTON_REVERT = 'revert',
        BUTTON_SEND = 'send';


    private static $buttonIcons = array(
        self::BUTTON_CREATE => 'fa fa-plus',
        self::BUTTON_SEARCH => 'fa fa-search',
        self::BUTTON_APPROVED => 'fa fa-check',
        self::BUTTON_UPDATE => 'fa fa-save',
        self::BUTTON_DELETE => 'fa fa-trash',
        self::BUTTON_RESET => 'fa fa-refresh',
        self::BUTTON_EDIT => 'fa fa-pencil',
        self::BUTTON_CANCEL => 'fa fa-cancel',
        self::BUTTON_COPY => 'fa fa-copy',
        self::BUTTON_ADD => 'fa fa-plus',
        self::BUTTON_REMOVE => 'fa fa-trash',
        self::BUTTON_SELECT => 'fa fa-share',
        self::BUTTON_MOVE => 'fa fa-move',
        self::BUTTON_OK => 'fa fa-ok',
        self::BUTTON_ACCEPT => 'fa fa-plus',
        self::BUTTON_REJECT => 'fa fa-lock',
        self::BUTTON_APPROVED => 'fa fa-ok-sign',
        self::BUTTON_BACK => 'fa fa-arrow-left',
        self::BUTTON_READ => 'fa fa-bookmark',
        self::BUTTON_UNREAD => 'fa fa-bookmark',
        self::BUTTON_CONFIRM => 'fa fa-signin',
        self::BUTTON_COMPLETE => 'fa fa-remove',
        self::BUTTON_REVERT => 'fa fa-share',
        self::BUTTON_SEND => 'm-fa fa-swapright',
        self::BUTTON_PROCESS => 'fa fa-play',
        self::BUTTON_PENDING => 'fa fa-pause',
    );

    public static function showBoolean($value)
    {
        if ($value === 1) {
            return 'true';
        } else {
            return 'false';
        }
    }

    public static function button($type, $style, $htmlOptions = array(), $isEditable = TRUE)
    {
        if (empty($type) || empty($style) || !array_key_exists($style, self::$buttonIcons))
            return self::showEmpty();
        if (isset($htmlOptions['class']))
            $htmlOptions['class'] = $htmlOptions['class'] . ' btn btn-' . $style;
        else
            $htmlOptions['class'] = 'btn btn-' . $style;
        if (!$isEditable)
            $htmlOptions['class'] .= ' disabled';
        $html = '<button type="' . $type . '" ' . self::renderAttributes($htmlOptions) . '>';
        $html .= '  <i class="' . self::$buttonIcons[$style] . '"></i>';
        if (isset($htmlOptions['value'])) {
            $html .= '  ' . $htmlOptions['value'];
        } else {
            $html .= '  ' . self::buttonValue($style);
        }
        $html .= '</button>';
        return $html;
    }

    public static function showEmpty()
    {
        $str = '<span style=" font-style: italic" class="text muted">' . Yii::t('common', 'title.empty') . '</span>';
        return $str;
    }

    public static function showEmptyResult()
    {
        $str = '<span style=" font-style: italic" class="text muted">' . Yii::t('common', 'title.noResult') . '</span>';
        return $str;
    }

    public static function renderAttributes($attributes = array())
    {
        $html = "";
        foreach ($attributes as $key => $value) {
            $html .= ' ' . $key . '="' . $value . '" ';
        }
        return $html;
    }

    private static function buttonValue($style)
    {
        $lib = array(
            self::BUTTON_CREATE => Yii::t('common', 'button.create'),
            self::BUTTON_UPDATE => Yii::t('common', 'button.update'),
            self::BUTTON_DELETE => Yii::t('common', 'button.delete'),
            self::BUTTON_RESET => Yii::t('common', 'button.reset'),
            self::BUTTON_SEARCH => Yii::t('common', 'button.search'),
            self::BUTTON_EDIT => Yii::t('common', 'button.edit'),
            self::BUTTON_CANCEL => Yii::t('common', 'button.cancel'),
            self::BUTTON_COPY => Yii::t('common', 'button.copy'),
            self::BUTTON_ADD => Yii::t('common', 'button.add'),
            self::BUTTON_REMOVE => Yii::t('common', 'button.remove'),
            self::BUTTON_SELECT => Yii::t('common', 'button.select'),
            self::BUTTON_MOVE => Yii::t('common', 'button.move'),
            self::BUTTON_OK => Yii::t('common', 'button.ok'),
            self::BUTTON_ACCEPT => Yii::t('common', 'button.accept'),
            self::BUTTON_REJECT => Yii::t('common', 'button.reject'),
            self::BUTTON_APPROVED => Yii::t('common', 'button.approved'),
            self::BUTTON_BACK => Yii::t('common', 'button.back'),
            self::BUTTON_SEND => Yii::t('common', 'button.send'),
            self::BUTTON_READ => Yii::t('common', 'button.read'),
            self::BUTTON_UNREAD => Yii::t('common', 'button.unread'),
            self::BUTTON_CONFIRM => Yii::t('common', 'button.confirm'),
            self::BUTTON_COMPLETE => Yii::t('common', 'button.complete'),
            self::BUTTON_REVERT => Yii::t('common', 'button.revert'),
            self::BUTTON_PROCESS => Yii::t('common', 'button.processing'),
            self::BUTTON_PENDING => Yii::t('common', 'button.pending'),
        );
        return $lib[$style];
    }

    public static function dynamicButton($type, $style, $text, $htmlOptions = array())
    {
        if (empty($type) || empty($style) || !array_key_exists($style, self::$buttonIcons))
            return self::showEmpty();
        if (isset($htmlOptions['class']))
            $htmlOptions['class'] = $htmlOptions['class'] . ' btn btn-' . $style;
        else
            $htmlOptions['class'] = 'btn btn-' . $style;
        $html = '<button type="' . $type . '" ' . self::renderAttributes($htmlOptions) . '>';
        $html .= '  <i class="' . self::$buttonIcons[$style] . '"></i>';
        $html .= '  ' . $text;
        $html .= '</button>';
        return $html;
    }

    public static function buttonSubmit($style, $htmlOptions = array(), $isSmall = FALSE, $isEditable = TRUE, $isShowtext = TRUE)
    {
        $type = self::SUBMIT_TYPE;
        if (empty($type) || empty($style) || !array_key_exists($style, self::$buttonIcons))
            return "";
        if (isset($htmlOptions['class']))
            $htmlOptions['class'] = $htmlOptions['class'] . ' btn btn-' . $style;
        else
            $htmlOptions['class'] = 'btn btn-' . $style;
        if ($isSmall)
            $htmlOptions['class'] .= ' mini';
        if (!$isEditable)
            $htmlOptions['class'] .= ' disabled';
        $html = '<button type="' . $type . '" ' . self::renderAttributes($htmlOptions) . '>';
        $html .= '  <i class="' . self::$buttonIcons[$style] . '"></i>';
        if ($isShowtext)
            $html .= '  ' . self::buttonValue($style);
        $html .= '</button>';
        return $html;
    }

    public static function showLink($text = '', $htmlOptions = array(), $icon = '')
    {
        $html = '<a ' . self::renderAttributes($htmlOptions) . '>';
        if (!empty($icon))
            $html .= '<i class="' . $icon . '"></i> ';
        $html .= $text;
        $html .= '</a>';
        return $html;
    }

    public static function showColor($hex)
    {
        $html = '<span class="label label-sm label-success">' . $hex . '</span>';
        return $html;
    }


    public static function showImage($short_path, $width = 100, $height = 100, $no_dimension = FALSE, $empty_no_image = FALSE)
    {
        //$filename without full path
        if (empty($short_path)) {
            if ($empty_no_image) return '';
            if ($no_dimension) {
                $src = 'http://www.placehold.it/300x300/EFEFEF/AAAAAA&amp;text=no+image';
            } else {
                $src = 'http://www.placehold.it/' . $width . 'x' . $height . '/EFEFEF/AAAAAA&amp;text=no+image';
            }
        } else {
            $path = Yii::getAlias('@' . UPLOAD_DIR) . DS;
            $path .= $short_path;
            $path = str_replace('\\', '/', $path);
            if (!file_exists($path)) {
                if ($empty_no_image) return '';
                if ($no_dimension) {
                    $src = 'http://www.placehold.it/300x300/EFEFEF/AAAAAA&amp;text=no+image';
                } else {
                    $src = 'http://www.placehold.it/' . $width . 'x' . $height . '/EFEFEF/AAAAAA&amp;text=no+image';
                }
            } else {
                $path = Yii::$app->request->baseUrl . DS . UPLOAD_DIR . DS . $short_path;
                $path = str_replace('\\', '/', $path);
                $src = $path;
            }
        }

        if ($no_dimension) {
            $str = '<img alt="" src="' . $src . '"';
        } else {
            $str = '<img alt="" width="' . $width . '" height="' . $height . '" src="' . $src . '"';
        }
        $str .= '/>';
        return $str;
    }

    public static function showImageThumbnail($image, $size = false, $model_dir)
    {
        if (!$size) {
            $size = 100;
        }
        $baseUpload = Yii::getAlias('@' . UPLOAD_DIR);
        if (strlen($image) > 0) {
            if (strpos($image, 'http') === false) {
                $imageLink = $baseUpload . DS . $model_dir . DS . $image;
                if (is_file($imageLink)) {
                    return EasyThumbnailImage::thumbnailImg(
                        $imageLink,
                        $size,
                        $size,
                        EasyThumbnailImage::THUMBNAIL_OUTBOUND,
                        ['alt' => $image]);
                } else {
                    $url = Yii::$app->request->baseUrl . '/' . UPLOAD_DIR . '/' . WWW_DIR . '/' . 'no_image.jpg';
                    return Html::img($url, ['width' => 100]);
                }
            } else {
                $imageLink = $image;
                return Html::img($imageLink, ['width' => $size]);
            }

        } else {
            $url = Yii::$app->request->baseUrl . '/' . UPLOAD_DIR . '/' . WWW_DIR . '/' . 'no_image.jpg';
            return Html::img($url, ['width' => 100]);
        }
    }
    public static function getFileURL($file, $model_dir = '', $position = false, $default_file = '')
    {
        if ($position === false)
            $position = BACKEND;
        if (filter_var($file, FILTER_VALIDATE_URL)) {
            return $file;
        } else {
            $baseUpload = Yii::getAlias('@' . UPLOAD_DIR);
            if ($position != FRONTEND) {
                $base_url = Url::base(true);

                if (is_file($baseUpload . DS . $model_dir . DS . $file)) {
                    $image_path = $base_url . '/' . UPLOAD_DIR . '/' . $model_dir . '/' . $file;
                } else {
                    if (strlen($default_file) == 0) {
                        $image_path = '';
                    } else {
                        $image_path = $base_url . '/' . UPLOAD_DIR . '/' . WEB_DIR . '/' . $default_file;
                    }
                }
                return $image_path;

            } else {
                $base_url = \Yii::$app->urlManagerBackend->baseUrl;

                if (is_file($baseUpload . DS . $model_dir . DS . $file)) {
                    $image_path = $base_url . '/' . UPLOAD_DIR . '/' . $model_dir . '/' . $file;
                } else {
                    if (strlen($default_file) == 0) {
                        $image_path = '';
                    } else {
                        $image_path = $base_url . '/' . UPLOAD_DIR . '/' . WEB_DIR . '/' . $default_file;
                    }
                }
                return $image_path;
            }
        }
    }

    public static function getFilePath($file, $model_dir = '')
    {

        $baseUpload = Yii::getAlias('@' . UPLOAD_DIR);

        $path = $baseUpload . DS . $model_dir . DS . $file;

        if (is_file($path)) {
            $image_path = $path;
        } else {
            $image_path = '';
        }
        return $image_path;

    }

    public static function getImagePath($file, $model_dir = '')
    {
		
        $baseUpload = Yii::getAlias('@' . UPLOAD_DIR);
		
		$path = $baseUpload . DS . $model_dir . DS . $file;
		
        if (is_file($path)) {
            $image_path = $path;
        } else {
            $image_path = $baseUpload . DS . WWW_DIR . DS . FConstant::NO_IMAGE;
        }
        return $image_path;
		
    }

    public static function getStatusLabel($status)
    {
        $key = $status;
        $str = array(
            FConstant::LABEL_ACTIVE => '<span class="label label-sm label-success">' . Yii::t('common', 'label.active') . '</span>',
            FConstant::LABEL_INACTIVE => '<span class="label label-sm label-default">' . Yii::t('common', 'label.inactive') . '</span>',
            FConstant::LABEL_NEW => '<span class="label label-sm label-success">' . Yii::t('common', 'label.new') . '</span>',
            FConstant::LABEL_NORMAL => '<span class="label label-sm label-default">' . Yii::t('common', 'label.normal') . '</span>',
            FConstant::LABEL_PREMIUM => '<span class="label label-sm label-warning">' . Yii::t('common', 'label.premium') . '</span>',
            FConstant::LABEL_OLD => '<span class="label label-sm label-default">' . Yii::t('common', 'label.old') . '</span>',
        );
        return isset($str[$key]) ? $str[$key] : '';
    }

    public static function getColorLabel($color)
    {
        return '<span class="label label-sm" style="background: ' . $color . '">' . $color . '</span>';
    }


    public static function getImageUrl($image, $model_dir = false, $position = false)
    {
        if (filter_var($image, FILTER_VALIDATE_URL)) {
            return $image;
        } else {

            $baseUpload = Yii::getAlias('@' . UPLOAD_DIR);

            if ($position != FRONTEND) {
                $base_url = Url::base(true);
                $image_path = is_file($baseUpload . DS . $model_dir . DS . $image) ? $base_url . '/' . UPLOAD_DIR . '/' . $model_dir . '/' . $image : $base_url . '/' . UPLOAD_DIR . '/' . WWW_DIR . '/' . FConstant::NO_IMAGE;
                return $image_path;
            } else {

                $base_url = \Yii::$app->urlManagerBackend->baseUrl;

                $image_path = $base_url . '/' . UPLOAD_DIR . '/' . $model_dir . '/' . $image;

                if (!is_file($baseUpload . DS . $model_dir . DS . $image)) {
                    $image_path = $base_url . '/' . UPLOAD_DIR . '/' . WWW_DIR . '/' . FConstant::NO_IMAGE;
                }

                return $image_path;
            }

        }
    }

    public static function beautyResponse($array)
    {
        $array = array_map(function ($v) {
            return (!is_null($v)) ? is_array($v) ? array_map(function ($v) {
                return (!is_null($v)) ? $v : "";
            }, $v) : $v : "";
        }, $array);
        return $array;
    }

    public static function generateCode($userId)
    {
        $s = strtoupper(md5(uniqid(rand(), true)));
        //return substr($s . $userId, 18, strlen($s));
        return substr($s . $userId, 18, 6);
    }

    public static function generateRandomCode($length)
    {
        $chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        $count = mb_strlen($chars);

        for ($i = 0, $result = ''; $i < $length; $i++) {
            $index = rand(0, $count - 1);
            $result .= mb_substr($chars, $index, 1);
        }
        return strtoupper($result);
    }

    public static function crypto_rand_secure($min, $max)
    {
        $range = $max - $min;
        if ($range < 1) return $min; // not so random...
        $log = ceil(log($range, 2));
        $bytes = (int)($log / 8) + 1; // length in bytes
        $bits = (int)$log + 1; // length in bits
        $filter = (int)(1 << $bits) - 1; // set all lower bits to 1
        do {
            $rnd = hexdec(bin2hex(openssl_random_pseudo_bytes($bytes)));
            $rnd = $rnd & $filter; // discard irrelevant bits
        } while ($rnd >= $range);
        return $min + $rnd;
    }

    public static function getToken($length)
    {
        $token = "";
        $codeAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        $codeAlphabet .= "abcdefghijklmnopqrstuvwxyz";
        $codeAlphabet .= "0123456789";
        $max = strlen($codeAlphabet) - 1;
        for ($i = 0; $i < $length; $i++) {
            $token .= $codeAlphabet[FHtml::crypto_rand_secure(0, $max)];
        }
        return $token;
    }

    public static function showTime($time)
    {
        if (strlen($time) != 0) {
            return date('g:i A', strtotime($time));
        } else
            return $time ;
    }

    public static function showDateTime($time)
    {
        if (strlen($time) != 0) {
            return date('Y-m d H:i:s', strtotime($time));
        } else
            return $time ;
    }

    public static function t($category, $message, $params = [], $language = null)
    {
        return Yii::t($category, $message, $params, $language);
    }

    //HungHX: 20160801
    public static function config($category, $default_value, $params = [], $language = null)
    {
        if (!empty($category)) {
            $items = explode('.', $category);
            $param = end($items);
            if (isset($_REQUEST[$param]))
                return $_REQUEST[$param];
        }
        //To be done: check if category setting already existed in Configuration table, if not then return $default_value
        return $default_value;
    }

    public static function getActionOptions($model, $field)
    {
        $result = array(
            'icon' => "glyphicon glyphicon-file",
            'child' => array(),
        );
        if ($model == 'app-user') {
            if ($field == 'is_active') {
                $result['icon'] = "glyphicon glyphicon-file";
                $result['child'] = array(
                    1 => 'Active',
                    0 => 'Inactive'
                );
            }
        }
        if ($model == 'book') {
            if ($field == 'is_feature') {
                $result['icon'] = "glyphicon glyphicon-file";
                $result['child'] = array(
                    1 => 'Active',
                    0 => 'Inactive'
                );
            }
        }
        if ($model == 'book') {
            if ($field == 'is_active') {
                $result['icon'] = "glyphicon glyphicon-file";
                $result['child'] = array(
                    1 => 'Active',
                    0 => 'Inactive'
                );
            }
        }
        if ($model == 'object-category') {
            if ($field == 'is_active') {
                $result['icon'] = "glyphicon glyphicon-file";
                $result['child'] = array(
                    1 => 'Active',
                    0 => 'Inactive'
                );
            }
        }
		
		 if ($model == 'book-chapter') {
            if ($field == 'is_active') {
                $result['icon'] = "glyphicon glyphicon-file";
                $result['child'] = array(
                    1 => 'Active',
                    0 => 'Inactive'
                );
            }
        }
		
		 if ($model == 'book-comment') {
            if ($field == 'is_active') {
                $result['icon'] = "glyphicon glyphicon-file";
                $result['child'] = array(
                    1 => 'Active',
                    0 => 'Inactive'
                );
            }
        }
        return $result;
    }


    public static function buildBulkActionsMenu($action, $label, $model, $field)
    {
        $option = self::getActionOptions($model, $field);

        if (count($option['child']) != 0) {
            $child = array();
            foreach ($option['child'] as $id => $name) {
                $child[] = '<li>' . Html::a($name,
                        ["bulk-action", "action" => $action, "field" => $field, "value" => $id],
                        [
                            'role' => 'modal-remote-bulk',
                            'data-confirm' => false, 'data-method' => false,
                            'data-request-method' => 'post',
                            'data-confirm-title' => FHtml::t('common', 'are.you.sure'),
                            'data-confirm-message' => FHtml::t('common', 'message.confirm'),
                        ]) . '</li>';
            }
            $result = ['label' => '<i class="' . $option['icon'] . '"></i> ' . $label, 'items' => $child, 'encode' => false];
        } else {
            $result = '<li>' . Html::a('<i class="' . $option['icon'] . '"></i> ' . $label,
                    ["bulk-action", "action" => $action, "field" => $field],
                    [
                        'role' => 'modal-remote-bulk',
                        'data-confirm' => false, 'data-method' => false,
                        'data-request-method' => 'post',
                        'data-confirm-title' => FHtml::t('common', 'are.you.sure'),
                        'data-confirm-message' => FHtml::t('common', 'message.confirm'),
                    ]) . '</li>';
        }

        return $result;
    }

    public static function buildBulkDeleteMenu()
    {
        return '<li>' . Html::a('<i class="glyphicon glyphicon-trash"></i> ' . FHtml::t('common', 'Delete All'),
            ["bulk-delete"],
            [
                'role' => 'modal-remote-bulk',
                'data-confirm' => false, 'data-method' => false,
                'data-request-method' => 'post',
                'data-confirm-title' => FHtml::t('common', 'are.you.sure'),
                'data-confirm-message' => FHtml::t('common', 'message.confirm'),
            ]) . '</li>';
    }

    public static function toArray($text, $separator1 = ';', $splitter1 = '=')
    {
        $arr = explode($separator1, $text);
        $result = [];
        foreach ($arr as $item) {
            $arr1 = explode($splitter1, $item);
            $key = reset($arr1);
            $value = end($arr1);
            $result = array_merge($result, [$key => $value]);
        }

        return $result;
    }

    public static function toArrayFromDbComment($comment)
    {
        $array = FHtml::toArray($comment, ';', ':');
        if (isset($array['data'])) {
            $a = FHtml::toArray(str_replace(['[', ']'], ['', ''], $array['data']), ',', '=');
            $arr1 = [];
            foreach ($a as $key => $value) {
                $arr1 = array_merge($arr1, [$key => $value]);
            }
            $array['data'] = $arr1;
        }

        return $array;
    }

    public static function getRequestParam($param, $default_value = '')
    {
        if (is_array($param)) {
            foreach ($param as $item) {
                if (key_exists($item, $_REQUEST))
                    return $_REQUEST[$param];
            }
            return $default_value;
        }
        if (key_exists($param, $_REQUEST))
            $result = $_REQUEST[$param];
        return (isset($result)) ? $result : $default_value;
    }

    public static function currentController()
    {
        return Yii::$app->controller->id;
    }

    public static function currentModule()
    {
        return Yii::$app->controller->module->id;
    }

    public static function currentAction()
    {
        return Yii::$app->controller->action->id;
    }

    public static function showIsActiveLabel($key, $label = false)
    {
        if(!$label){
            $label = $key;
        }
        $str = array(
            1 => '<span class="label label-sm label-success">'. Yii::t('common', "Yes").  '</span>',
            0 => '<span class="label label-sm label-danger">'. Yii::t('common', "No"). '</span>',
        );
        return isset($str[$key]) ? $str[$key] : $key;
    }

    public static function showAppUser($user_id)
    {
        if(isset($user_id)){
            $user = AppUser::findOne($user_id);
            if(isset($user)){
                return '#'.$user->id.' '.$user->name;
            }else{
                return '';
            }
        }
        return '';
    }

    public static function getConfig($key, $default_value)
    {
        return FHtml::config($key, $default_value);
    }

    public static function generateRegisterCode()
    {
        $s = strtoupper(md5(time() . rand(1, 100)));
        return $s;
    }

    public static function generateActivationCode($email)
    {
        $s = strtoupper(md5(uniqid(rand(), true)));
        $e = strtoupper(md5($email));
        return substr($s . $e, 5, strlen($s));
    }

    public static function generateTransactionId($userId)
    {
        $s = strtoupper(md5(uniqid(rand(), true)));
        return substr($s . $userId, 18, strlen($s));
    }

}