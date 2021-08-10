<?php

namespace backend\modules\app\models;

class AppUserFeedback extends AppUserFeedbackBase
{

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
        
            [['user_id', 'is_active'], 'integer'],
            [['name', 'email', 'subject', 'content'], 'required'],
            [['content'], 'string'],
            [['created_date', 'modified_date'], 'safe'],
            [['name', 'email', 'subject'], 'string', 'max' => 255],                
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => 'User ID',
            'name' => 'Name',
            'email' => 'Email',
            'subject' => 'Subject',
            'content' => 'Content',
            'is_active' => 'Is Active',
            'created_date' => 'Created Date',
            'modified_date' => 'Modified Date',
        ];
    }
}
