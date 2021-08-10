<?php

namespace backend\modules\book\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;

/**
 * BookSearch represents the model behind the search form about `backend\modules\book\models\Book`.
 */
class BookSearch extends Book
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'view_count', 'like_count', 'is_active', 'is_feature'], 'integer'],
            [['image', 'title', 'author', 'publisher', 'description', 'attachment', 'type', 'created_date', 'modified_date'], 'safe'],
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
        $query = Book::find();

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
            'view_count' => $this->view_count,
            'like_count' => $this->like_count,
            'is_feature' => $this->is_feature,
            'is_active' => $this->is_active,
            'created_date' => $this->created_date,
            'modified_date' => $this->modified_date,
        ]);

        $query->andFilterWhere(['like', 'image', $this->image])
            ->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'author', $this->author])
            ->andFilterWhere(['like', 'publisher', $this->publisher])
            ->andFilterWhere(['like', 'description', $this->description])
            ->andFilterWhere(['like', 'attachment', $this->attachment])
            ->andFilterWhere(['like', 'type', $this->type]);

        return $dataProvider;
    }
}
