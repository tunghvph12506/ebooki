<?php
use yii\helpers\Html;

$baseUrl = Yii::$app->getUrlManager()->getBaseUrl();

?>
<!-- BEGIN META -->
<link rel="shortcut icon" href="<?php echo $baseUrl.'/'.UPLOAD_DIR.'/'.WWW_DIR.'/favicon.ico' ?>">
<title><?= Yii::$app->name ?> - <?= Html::encode($this->title) ?></title>
<meta charset="<?= Yii::$app->charset ?>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<!-- END META -->
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>
<link href="<?php echo($baseUrl)?>/themes/metronic/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="<?php echo($baseUrl)?>/themes/metronic/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
<link href="<?php echo($baseUrl)?>/themes/metronic/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="<?php echo($baseUrl)?>/themes/metronic/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->

<!-- BEGIN THEME STYLES -->
<link href="<?php echo($baseUrl)?>/themes/metronic/assets/global/css/<?php echo($this->params['cssComponents']) ?>.min.css" id="style_components" rel="stylesheet" type="text/css"/>
<link href="<?php echo($baseUrl)?>/themes/metronic/assets/global/css/<?php echo($this->params['cssPlugins']) ?>.min.css" rel="stylesheet" type="text/css"/>
<!-- END THEME GLOBAL STYLES -->

<link href="<?php echo($baseUrl)?>/themes/metronic/assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />
<link href="<?php echo($baseUrl)?>/themes/metronic/assets/layouts/layout/css/themes/<?php echo($this->params['mainColor']) ?>.min.css" rel="stylesheet" type="text/css" id="style_color" />
<link href="<?php echo($baseUrl)?>/themes/metronic/assets/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css" />

<link href="<?php echo($baseUrl)?>/css/site.css" rel="stylesheet" type="text/css"/>
<link href="<?php echo($baseUrl)?>/themes/metronic/assets/custom/css/custom.css" rel="stylesheet" type="text/css"/>
<?php $this->head() ?>