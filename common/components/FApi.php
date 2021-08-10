<?php
/**
 * Created by PhpStorm.
 * User: Darkness
 * Date: 11/30/2016
 * Time: 2:00 PM
 */
namespace common\components;

use backend\models\Setting;
use yii\base\Component;
use yii\base\Exception;
use Yii;

class FApi
{
    public static $imageExtension = array('jpg', 'png', 'gif');

    public static function pushAndroid($a_devices, $msg, $type, $additional_data)
    {
        $api_key = Setting::getSettingValueByKey(FConstant::GOOGLE_API_KEY);

        //$url = 'https://android.googleapis.com/gcm/send';
        $url = 'https://fcm.googleapis.com/fcm/send';

        $loop = ceil(count($a_devices) / 1000);
        $msg = array
        (
            'message' => $msg,
            'notificationType' => $type, //system / deal / trip / balance
            'additionalData' => $additional_data
        );

        for ($i = 1; $i <= $loop; $i++) {
            if (0 < count($a_devices) && count($a_devices) < 1000)
                $registrationID = $a_devices;
            else {
                $registrationID = array_slice($a_devices, 0, 1000);
                $a_devices = array_slice($a_devices, 1000, count($a_devices));
            }

            $fields = array
            (
                'registration_ids' => $registrationID,
                'data' => $msg
            );

            $headers = array(
                'Authorization: key=' . $api_key,
                'Content-Type: application/json'
            );
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
            curl_exec($ch);
            curl_close($ch);
        }
    }

    public static function pushIosX($i_devices, $message)
    {
        //Working well if all device token is right
        //if 1st right / 2nd wrong : Push on first
        //if 1st wrong / 2nd right : No push on both
        //Push will terminated if have any error

        $badge = 1;
        $sound = 'default';
        $development = true;//make it false if it is not in development mode
        $passphrase = 'My Application';//your passphrase

        $payload = array();
        $payload['aps'] = array(
            'alert' => $message,
            'badge' => intval($badge),
            'sound' => $sound
        );

        $payload = json_encode($payload);

        $apns_url = NULL;
        $apns_cert = NULL;
        $apns_port = 2195;

        $pem = Setting::getSettingValueByKey(FConstant::PEM_FILE);

        if ($development) {
            $apns_url = 'gateway.sandbox.push.apple.com';
            $apns_cert = dirname(Yii::$app->request->scriptFile) . '/' . UPLOAD_DIR . '/' . PEM_DIR . '/' . $pem;
        } else {
            $apns_url = 'gateway.push.apple.com';
            $apns_cert = dirname(Yii::$app->request->scriptFile) . '/' . UPLOAD_DIR . '/' . PEM_DIR . '/' . $pem;
        }

        $stream_context = stream_context_create();
        stream_context_set_option($stream_context, 'ssl', 'local_cert', $apns_cert);
        stream_context_set_option($stream_context, 'ssl', 'passphrase', $passphrase);

        $apns = stream_socket_client('ssl://' . $apns_url . ':' . $apns_port, $error, $error_string, 2, STREAM_CLIENT_CONNECT, $stream_context);
        foreach ($i_devices as $idevice) {
            $token = $idevice;
            $device_tokens = str_replace("<", "", $token);
            $device_tokens1 = str_replace(">", "", $device_tokens);
            $device_tokens2 = str_replace(' ', '', $device_tokens1);
            $apns_message = chr(0) . chr(0) . chr(32) . pack('H*', $device_tokens2) . chr(0) . chr(strlen($payload)) . $payload;
            fwrite($apns, $apns_message);
        }
        //cause fatal errors
        //@socket_close($apns);
        @fclose($apns);

    }

    public static function pushIos($i_devices, $message, $type, $additional_data)
    {
        //working any case
        $badge = 1;
        $sound = 'default';
        $development = true;//make it false if it is not in development mode
        $passphrase = 'My Application';

        $payload = array();
        $payload['aps'] = array(
            'alert' => $message,
            'badge' => intval($badge),
            'sound' => $sound
        );
        $payload['notificationType'] = $type;
        $payload['additionalData'] = $additional_data;

        $payload = json_encode($payload);

        $apns_url = NULL;
        $apns_cert = NULL;
        $apns_port = 2195;

        $pem = Setting::getSettingValueByKey(FConstant::PEM_FILE);

        if (strlen($pem) > 0) {
            if ($development) {
                $apns_url = 'gateway.sandbox.push.apple.com';
                $apns_cert = dirname(Yii::$app->request->scriptFile) . '/' . UPLOAD_DIR . '/' . PEM_DIR . '/' . $pem;
            } else {
                $apns_url = 'gateway.push.apple.com';
                $apns_cert = dirname(Yii::$app->request->scriptFile) . '/' . UPLOAD_DIR . '/' . PEM_DIR . '/' . $pem;
            }
        }

        $stream_context = stream_context_create();
        stream_context_set_option($stream_context, 'ssl', 'local_cert', $apns_cert);
        stream_context_set_option($stream_context, 'ssl', 'passphrase', $passphrase);

        try {
            $apns = stream_socket_client('ssl://' . $apns_url . ':' . $apns_port, $error, $error_string, 2, STREAM_CLIENT_CONNECT, $stream_context);
        } catch (Exception $e) {
            var_dump($e);
            die('Can not connect to APNS');
        }

        $number = 0;

        foreach ($i_devices as $idevice) {
            $number += 1;
            $token = $idevice;
            $device_tokens = str_replace("<", "", $token);
            $device_tokens1 = str_replace(">", "", $device_tokens);
            $device_tokens2 = str_replace(' ', '', $device_tokens1);

            $expiry = time() + 30;

            $apns_message = chr(1) . pack("N", rand(1000, 9999)) . pack("N", $expiry) . pack("n", 32) . pack('H*', $device_tokens2) . pack("n", strlen($payload)) . $payload;
            $msgapns = fwrite($apns, $apns_message);

            usleep(2000);

            if (!$msgapns) {
                //@socket_close($apns);
                @fclose($apns);
            }
            else
            {
                $read = array($apns);
                $null = null;
                $changedStreams = stream_select($read, $null, $null, 0, 1000000);

                if ($changedStreams === false) {
                    //fail
                } elseif ($changedStreams > 0) {
                    $responseBinary = fread($apns, 6);
                    if ($responseBinary !== false || strlen($responseBinary) == 6) {
                        $response = unpack('Ccommand/Cstatus_code/Nidentifier', $responseBinary);
                        if ($response['status_code']) {
                            //echo $number . ' Fail!. ';
                            //fail
                            //@socket_close($apns);
                            @fclose($apns);
                            $stream_context = stream_context_create();
                            stream_context_set_option($stream_context, 'ssl', 'local_cert', $apns_cert);
                            stream_context_set_option($stream_context, 'ssl', 'passphrase', $passphrase);
                            $apns = stream_socket_client('ssl://' . $apns_url . ':' . $apns_port, $error, $error_string, 2, STREAM_CLIENT_CONNECT, $stream_context);
                            stream_set_blocking($apns, 0);
                        }
                    }
                } else {
                    //echo $number . ' Success!. ';
                }
            }
        }
        //cause fatal errors
        //@socket_close($apns);
        @fclose($apns);
    }

    public static function getOutputForAPI($data , $status = '', $message = '', $others = array())
    {
        $out = array();
        $out['status'] = $status;
        foreach ($others as $key=> $value){
            $out[$key] = $value;
        }
        $out['message'] = $message;
        $out['data'] = $data;

        return $out;
    }

    public static function getErrorMessage($errors)
    {
        $error_message = 'FAIL';
        $error_array = array();
        foreach ($errors as $field => $messages) {
            foreach ($messages as $message) {
                $error_array[] = $message;
            }
        }
        if (count($error_array) != 0) {
            $error_message = implode('. ', $error_array);
        }
        return $error_message;
    }


    public static function getErrorMsg($code)
    {
        $str = array(

            200 => 'Success',
            201 => 'Fail',
            202 => FConstant::MISSING_PARAMS,
            210 => FConstant::MALFORMED_PARAMS,
            203 => 'Invalid input',
            204 => 'Token missing',
            205 => FConstant::TOKEN_MISMATCH,
            206 => FConstant::CAN_NOT_PERFORM,
            209 => 'Activation code mismatch',
            211 => 'Can not save data',

            215 => 'Data not found',

            221 => 'User not found',
            222 => 'Wrong password',
            223 => 'Email does not exist',
            224 => 'Email or username does not exist',
            225 => 'Email existed',
            226 => 'Email or username existed',
            227 => 'Current password mismatch',
            228 => 'Your account is not activated',
            229 => 'Fail to send email, please check your email address',
            230 => 'Your account balance is not enough to do this action',
            232 => 'You another request is pending, please try again later',

        );
        if($code == 'all')
            return $str;
        else
            return isset($str[$code]) ? $str[$code] : '';
    }

    public static function async($des){
        $url = Yii::$app->urlManager->createAbsoluteUrl($des);

        ignore_user_abort(true); // CAUTION!  run over return
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); // comment when test
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_FRESH_CONNECT, TRUE);
        curl_setopt($ch, CURLOPT_TIMEOUT, 1); // Skip receive return
        curl_exec($ch);
        curl_close($ch);
    }
}