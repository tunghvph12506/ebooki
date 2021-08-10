<?php

namespace backend\modules\book\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\modules\book\models\BookComment;

/**
 * BookCommentSearch represents the model behind the search form about `backend\modules\book\models\BookComment`.
 */
class BookCommentSearch extends BookComment
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'book_id', 'chapter_id', 'is_active'], 'integer'],
            [['name', 'content', 'created_date', 'modified_date'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = BookComment::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'book_id' => $this->book_id,
            'chapter_id' => $this->chapter_id,
            'is_active' => $this->is_active,
            'created_date' => $this->created_date,
            'modified_date' => $this->modified_date,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'content', $this->content]);

        return $dataProvider;
    }
}
