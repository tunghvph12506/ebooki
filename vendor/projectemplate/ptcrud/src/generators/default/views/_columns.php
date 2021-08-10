<?php
use yii\helpers\Inflector;
use yii\helpers\StringHelper;
use projectemplate\ptcrud\Helper;

/* @var $this yii\web\View */
/* @var $generator yii\gii\generators\crud\Generator */

$modelClass = StringHelper::basename($generator->modelClass);
$urlParams = $generator->generateUrlParams();
$nameAttribute = $generator->getNameAttribute();
$actionParams = $generator->generateActionParams();
$tableSchema = $generator->getTableSchema();

$image_fields = array(
    'image',
    'icon',
    'logo',
    'avatar',
);
$folder_name = Inflector::camel2id($modelClass);
$lower_name = str_replace('-','_',$folder_name);

echo "<?php\n";
?>
use yii\helpers\Url;
use common\components\FHtml;
use kartik\datecontrol\DateControl;

return [
    [
        'class' => 'kartik\grid\CheckboxColumn',
    ],
    //[
    //    'class' => 'kartik\grid\SerialColumn',
    //    'width' => '30px',
    //],
<?php
$width_count = 0;

$system_fields = array(
    'application_id'
);

$hidden_fields = array(
    'id',
    'password',
    '*content',
    '*description'
);

foreach ($generator->getColumnNames() as $name) {
    if(!in_array($name, $system_fields)){
        $is_comment = '';

        $width = 2;

        if(
            $width_count > 9
            || Helper::checkHiddenField($name, $hidden_fields))

        {
            $is_comment = '//';
            $width = 0;
        }

        $column = $tableSchema->columns[$name];

//define start//
        $start="    ".$is_comment."[\n";
        $class ="        ".$is_comment."'class'=>'kartik\grid\DataColumn',\n";
        $format = "";
        $editableOptions = "";
        $attribute = "";
        $vAlign = "";
        $hAlign = "";
        $contentOptions = "";
        $value = "";
        $end ="    ".$is_comment."],\n";
//define end//
//check and modify//
        if($column->dbType == 'tinyint(1)')
        {
            if(strpos($name, 'is_active') !== false || strpos($name, 'status') !== false)
            {
                $class ="        ".$is_comment."'class'=>'kartik\grid\BooleanColumn',\n";
                $width = $is_comment == "" ? 1 : 0;
                $hAlign="        ".$is_comment."'hAlign'=>'center',\n";
                $vAlign="        ".$is_comment."'vAlign'=>'middle',\n";
            }else{
                $width = $is_comment == "" ? 1 : 0;
                $hAlign="        ".$is_comment."'hAlign'=>'center',\n";
                $vAlign="        ".$is_comment."'vAlign'=>'middle',\n";
            }

        }
        else
        {
            if ((strpos($column->dbType, 'varchar') !== false))
            {
                if(in_array($name, $image_fields))
                {
                    $value ="        ".$is_comment."'value' => function(\$model) { return FHtml::showImageThumbnail(\$model-> " . $name . ", false, '". $folder_name ."'); }, \n";
                    $format="        ".$is_comment."'format'=>'html',\n";
                    $hAlign="        ".$is_comment."'hAlign'=>'center',\n";
                    $width = $is_comment == "" ? 1 : 0;
                }
                else
                {
                    $class ="        ".$is_comment."'class'=>'kartik\grid\DataColumn',\n";
                    $hAlign="        ".$is_comment."'hAlign'=>'left',\n";
                    if((substr($column->dbType, strpos($column->dbType,'(')+1, strpos($column->dbType,')') - (strpos($column->dbType,'(') +1))) > 20)
                    {
                        $width = $is_comment == "" ? 2 : 0;
                    }
                }
                $vAlign="        ".$is_comment."'vAlign'=>'middle',\n";
            }
            elseif ($column->dbType == 'date') {
                $class ="        ".$is_comment."'class'=>'kartik\grid\EditableColumn',\n";
                $format="        ".$is_comment."'format'=>'date',\n";
                $editableOptions ="        ".$is_comment."'editableOptions'=>[                       
                            ".$is_comment."'size'=>'md',
                            ".$is_comment."'inputType'=>\kartik\\editable\Editable::INPUT_WIDGET,
                            ".$is_comment."'widgetClass'=> 'kartik\datecontrol\DateControl',
                            ".$is_comment."'options'=>[
                                ".$is_comment."'type'=>\kartik\datecontrol\DateControl::FORMAT_DATE,
                                ".$is_comment."'displayFormat'=>'yyyy-MM-dd',
                                ".$is_comment."'saveFormat'=>'php:Y-m-d',
                                ".$is_comment."'options'=>[
                                    ".$is_comment."'pluginOptions'=>[
                                        ".$is_comment."'autoclose'=>true
                                    ".$is_comment."]
                                ".$is_comment."]
                            ".$is_comment."]
                        ".$is_comment."],\n";
                $hAlign="        ".$is_comment."'hAlign'=>'left',\n";
                $vAlign="        ".$is_comment."'vAlign'=>'middle',\n";
            }elseif($column->dbType == 'date'){
                $width = $is_comment == "" ? 1 : 0;
                $hAlign="        ".$is_comment."'hAlign'=>'center',\n";
                $vAlign="        ".$is_comment."'vAlign'=>'middle',\n";
            }else{
                $hAlign="        ".$is_comment."'hAlign'=>'left',\n";
                $vAlign="        ".$is_comment."'vAlign'=>'middle',\n";
            }
        }

        $attribute="        ".$is_comment."'attribute'=>'" . $name . "',\n";

        if (strpos($name, 'is_') !== false) {
            //$value ="        ".$is_comment."'value' => function(\$model) { return FHtml::showBoolean(\$model-> " . $name . "); }, \n";
            $filterType="        ".$is_comment."'filterType' => 'checkbox', \n";
        }

        $contentOptions ="        ".$is_comment."'contentOptions'=>['class'=>'col-md-".$width." nowrap'],\n";


        if($name != 'password' && $name != 'id' && strpos($name, 'description') === false && strpos($name, 'content') === false ){
            $width_count += $width;
        }

//check and modify end//
//generate code//


        echo $start;
        echo $class;
        if(strlen($format) != 0)
            echo $format;
        if(strlen($attribute) != 0)
            echo $attribute;
        if(strlen($value) != 0)
            echo $value;
        if(strlen($hAlign) != 0)
            echo $hAlign;
        if(strlen($vAlign) != 0)
            echo $vAlign;
        if(strlen($editableOptions) != 0)
            echo $editableOptions;
        if(strlen($contentOptions) != 0)
            echo $contentOptions;
        echo $end;
//generate end//
    }
}
?>
    [
        'class' => 'kartik\grid\ActionColumn',
        'dropdown' => false,
        'vAlign'=>'middle',
        'urlCreator' => function($action, $model) {
            return Url::to([$action, <?= $urlParams ?>]);
        },
        'viewOptions'=>['role'=>'modal-remote','title'=>Yii::t('common', 'title.view'),'data-toggle'=>'tooltip'],
        'updateOptions'=>['role'=>$this->params['displayType'],'title'=>Yii::t('common', 'title.update'), 'data-toggle'=>'tooltip'],
        'deleteOptions'=>[
            'role'=>'modal-remote',
            'title'=>Yii::t('common', 'title.delete'),
            'data-confirm'=>false,
            'data-method'=>false,// for overide yii data api
            'data-request-method'=>'post',
            'data-toggle'=>'tooltip',
            'data-confirm-title'=>'Are you sure?',
            'data-confirm-message'=>'Are you sure want to delete this item'
        ],
    ],
];