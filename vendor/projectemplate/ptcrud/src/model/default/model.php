<?php
/**
 * This is the template for generating the model class of a specified table.
 */

/* @var $this yii\web\View */
/* @var $generator yii\gii\generators\model\Generator */
/* @var $tableName string full table name */
/* @var $className string class name */
/* @var $queryClassName string query class name */
/* @var $tableSchema yii\db\TableSchema */
/* @var $labels string[] list of attribute labels (name => label) */
/* @var $rules string[] list of validation rules */
/* @var $relations array list of relations (name => relation declaration) */

echo "<?php\n";
?>

namespace <?= $generator->ns ?>;

class <?= $className ?> extends <?= $className ?>Base
{
<?php
    $image_fields = array(
        'image',
        'icon',
        'logo',
        'avatar'
    );
    $file_fields = array(
        'attachment',
    );
    $file_names = array();
    foreach ($labels as $name => $label){
        $file_names [] = $name;
    }
    $check_image = array_intersect($image_fields, $file_names);
    $check_file = array_intersect($file_fields, $file_names);
?>

<?php if(count($check_image)!=0) {
    foreach ($check_image as $field_image_name){ ?>
        <?= 'public $'.$field_image_name."_file;\n" ?>
        <?php
    }
}
?>
<?php if(count($check_file)!=0) {
    foreach ($check_file as $field_file_name){ ?>
    <?= 'public $'.$field_file_name."_file;\n" ?>
        <?php
    }
}
?>

<?php if ($generator->db !== 'db'): ?>

    /**
     * @return \yii\db\Connection the database connection used by this AR class.
     */
    public static function getDb()
    {
        return Yii::$app->get('<?= $generator->db ?>');
    }
<?php endif; ?>
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [<?= "
        \n            " . implode(",\n            ", $rules) . "," ?>
        <?php if(count($check_image)!=0) {
            foreach ($check_image as $field_image_name){ ?>
                <?= "\n            [['" ?><?= $field_image_name ?><?="_file'], 'file','skipOnEmpty' => true, 'extensions'=>'jpg, gif, png'],"?>
                <?php
            }
        } ?>
        <?php if(count($check_file)!=0) {
            foreach ($check_file as $field_file_name){ ?>
                <?= "\n            [['" ?><?= $field_file_name ?><?="_file'], 'file','skipOnEmpty' => true],"?>
                <?php
            }
        } ?>
        <?= "\n        " ?>];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
<?php foreach ($labels as $name => $label): ?>
            <?= "'$name' => " . $generator->generateString($label) . ",\n" ?>
<?php endforeach; ?>
<?php if(count($check_image)!=0): ?>
<?php foreach ($check_image as $field_image_original_name):
            $field_image_name = $field_image_original_name.'_file';
            $field_label = \yii\helpers\Inflector::camel2words($field_image_name); ?>
            <?= "'$field_image_name' => " . $generator->generateString($field_label) . ",\n" ?>
    <?php endforeach; ?>
<?php endif ?>
<?php if(count($check_file)!=0): ?>
    <?php foreach ($check_file as $field_file_original_name):
            $field_file_name = $field_file_original_name.'_file';
            $field_label = \yii\helpers\Inflector::camel2words($field_file_name); ?>
            <?= "'$field_file_name' => " . $generator->generateString($field_label) . ",\n" ?>
    <?php endforeach; ?>
<?php endif ?>
        ];
    }
<?php foreach ($relations as $name => $relation): ?>

    /**
     * @return \yii\db\ActiveQuery
     */
    public function get<?= $name ?>()
    {
        <?= $relation[0] . "\n" ?>
    }
<?php endforeach; ?>
<?php if ($queryClassName): ?>
<?php
    $queryClassFullName = ($generator->ns === $generator->queryNs) ? $queryClassName : '\\' . $generator->queryNs . '\\' . $queryClassName;
    echo "\n";
?>
    /**
     * @inheritdoc
     * @return <?= $queryClassFullName ?> the active query used by this AR class.
     */
    public static function find()
    {
        return new <?= $queryClassFullName ?>(get_called_class());
    }
<?php endif; ?>
}
