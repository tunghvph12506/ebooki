<?php

namespace backend\modules\book\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\modules\book\models\BookChapter;

/**
 * BookChapterSearch represents the model behind the search form about `backend\modules\book\models\BookChapter`.
 */
class BookChapterSearch extends BookChapter
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'book_id', 'chapter_number', 'is_active'], 'integer'],
            [['image', 'title', 'type', 'attachment', 'content', 'created_date', 'modified_date'], 'safe'],
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
        $query = BookChapter::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort'=> ['defaultOrder' => ['chapter_number'=>SORT_DESC]]
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
            'chapter_number' => $this->chapter_number,
            'is_active' => $this->is_active,
            'created_date' => $this->created_date,
            'modified_date' => $this->modified_date,
        ]);

        $query->andFilterWhere(['like', 'image', $this->image])
            ->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'type', $this->type])
            ->andFilterWhere(['like', 'attachment', $this->attachment])
            ->andFilterWhere(['like', 'content', $this->content]);

        return $dataProvider;
    }
}
