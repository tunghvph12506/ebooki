<?php

namespace backend\modules\book\controllers;

use backend\models\ObjectRelation;
use common\components\FConstant;
use Yii;
use backend\modules\book\models\Book;
use backend\modules\book\models\BookSearch;
//use yii\web\Controller;
use backend\controllers\BackendController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Response;
use yii\helpers\Html;
use yii\helpers\Json;
use common\components\AccessRule;
use common\models\User;
use yii\filters\AccessControl;
use common\components\FHtml;
use yii\web\UploadedFile;


/**
 * BookController implements the CRUD actions for Book model.
 */
class BookController extends BackendController
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                    'bulk-delete' => ['post'],
                ],
            ],
            'access' => [
                'class' => AccessControl::className(),
                'ruleConfig' => [
                    'class' => AccessRule::className(),
                ],
                'only' => ['create', 'update', 'delete', 'view', 'index'],
                'rules' => [
                    [
                        'actions' => ['view', 'index', 'create'],
                        'allow' => true,
                        'roles' => [
                            User::ROLE_USER,
                            User::ROLE_MODERATOR,
                            User::ROLE_ADMIN
                        ],
                    ],
                    [
                        'actions' => ['update'],
                        'allow' => true,
                        'roles' => [
                            User::ROLE_MODERATOR,
                            User::ROLE_ADMIN
                        ],
                    ],
                    [
                        'actions' => ['delete'],
                        'allow' => true,
                        'roles' => [
                            User::ROLE_ADMIN
                        ],
                    ],
                ],
            ],
        ];
    }

    /**
     * Lists all Book models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new BookSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        // validate if there is a editable input saved via AJAX
        if (Yii::$app->request->post('hasEditable')) {
            // instantiate your book model for saving
            $Id = Yii::$app->request->post('editableKey');

            $model = Book::findOne($Id);

            // store a default json response as desired by editable
            $out = Json::encode(['output' => '', 'message' => '']);

            // fetch the first entry in posted data (there should
            // only be one entry anyway in this array for an
            // editable submission)
            // - $posted is the posted data for Book without any indexes
            // - $post is the converted array for single model validation
            $post = [];
            $posted = current($_POST['Book']);
            $post['Book'] = $posted;

            // load model like any single model validation
            if ($model->load($post)) {
                // can save model or do something before saving model
                $model->save();

                // custom output to return to be displayed as the editable grid cell
                // data. Normally this is empty - whereby whatever value is edited by
                // in the input by user is updated automatically.
                $output = '';
                // similarly you can check if the name attribute was posted as well
                // if (isset($posted['name'])) {
                //   $output =  ''; // process as you need
                // }
                $out = Json::encode(['output' => $output, 'message' => '']);
            }
            // return ajax json encoded response and exit
            echo $out;
            return;
        }

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }


    /**
     * Displays a single Book model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        $request = Yii::$app->request;
        if ($request->isAjax) {
            Yii::$app->response->format = Response::FORMAT_JSON;
            return [
                'title' => "Book #" . $id,
                'content' => $this->renderPartial('view', [
                    'model' => $this->findModel($id),
                ]),
                'footer' =>
                    Html::a('Edit', ['update', 'id' => $id], ['class' => 'btn btn-primary pull-left', 'role' => $this->view->params['displayType']]) .
                    Html::a('Manage Chapters', ['chapter/index', 'book_id' => $id], ['class' => 'btn btn-success pull-left', 'role' => $this->view->params['displayType']]) .
                    Html::button('Close', ['class' => 'btn btn-default', 'data-dismiss' => "modal"])
            ];
        } else {
            return $this->render('view', [
                'model' => $this->findModel($id),
            ]);
        }
    }

    /**
     * Creates a new Book model.
     * For ajax request will return json object
     * and for non-ajax request if creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $request = Yii::$app->request;
        $model = new Book();


        if ($request->isAjax) {
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            if ($request->isGet) {
                return [
                    'title' => "Create new Book",
                    'content' => $this->renderPartial('create', [
                        'model' => $model,
                    ]),
                    'footer' => Html::button('Close', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                        Html::button('Save', ['class' => 'btn btn-primary', 'type' => "submit"])
                ];
            } else if ($model->load($request->post()) && $model->save()) {
                return [
                    'forceReload' => '#crud-datatable-pjax',
                    'title' => "Create new Book",
                    'content' => '<span class="text-success">Create Book success</span>',
                    'footer' => Html::button('Close', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                        Html::a('Create More', ['create'], ['class' => 'btn btn-primary', 'role' => 'modal-remote'])

                ];
            } else {
                return [
                    'title' => "Create new Book",
                    'content' => $this->renderAjax('create', [
                        'model' => $model,
                    ]),
                    'footer' => Html::button('Close', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                        Html::button('Save', ['class' => 'btn btn-primary', 'type' => "submit"])

                ];
            }
        } else {
            /*
            *   Process for non-ajax request
            */
            if ($model->load($request->post())) {
                $time_string = time();
                $image_file = UploadedFile::getInstance($model, 'image_file');
                if ($image_file) {
                    $model->image = $time_string . rand(0, 1000) . '_book_image.' . $image_file->extension;
                }
                $image_banner_file= UploadedFile::getInstance($model, 'image_banner_file');
                if ($image_banner_file) {
                    $model->image_banner = $time_string . rand(0, 1000) . '_book_image_banner.' . $image_banner_file->extension;
                }
                $attachment_file = UploadedFile::getInstance($model, 'attachment_file');
                if ($attachment_file) {
                    $model->attachment = $time_string . rand(0, 1000) . '_book_attachment.' . $attachment_file->extension;
                }
                $model->created_date = date('Y-m-d H:i:s', $time_string);
                /* @var $user User */
                $user = Yii::$app->user->identity;
                if ($model->save()) {

                    $categories = $model->category;
                    if (is_array($categories)) {
                        foreach ($categories as $cate) {
                            $relation = new ObjectRelation;
                            $relation->object_id = $model->id;
                            $relation->object_type = \backend\modules\book\Book::OBJECT_TYPE_BOOK;
                            $relation->object2_id = $cate;
                            $relation->object2_type = FConstant::OBJECT_TYPE_CATEGORY;
                            $relation->relation_type = FConstant::OBJECT_TYPE_CATEGORY;
                            $relation->created_date = date('Y-m-d', $time_string);
                            $relation->created_user = $user->username;
                            $relation->save();
                        }
                    }

                    if ($image_file) {
                        $image_path = $this->uploadFolder . '/book/' . $model->image;
                        $image_file->saveAs($image_path);
                    }
                    if ($image_banner_file) {
                        $image_banner_path = $this->uploadFolder . '/book/' . $model->image_banner;
                        $image_banner_file->saveAs($image_banner_path);
                    }
                    if ($attachment_file) {
                        $attachment_path = $this->uploadFolder . '/book/' . $model->attachment;
                        $attachment_file->saveAs($attachment_path);
                    }

                    return $this->redirect(['index']);
                } else {
                    return $this->render('create', [
                        'model' => $model,
                    ]);
                }
            } else {
                return $this->render('create', [
                    'model' => $model,
                ]);
            }
        }

    }

    /**
     * Updates an existing Book model.
     * For ajax request will return json object
     * and for non-ajax request if update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $request = Yii::$app->request;
        $model = $this->findModel($id);

        $image_old = $model->image;
        $image_banner_old = $model->image_banner;
        $attachment_old = $model->attachment;
        $category_ids = array();
        foreach ($model->categories as $val) {
            $category_ids[] = $val->object2_id;
        }
        $model->category = $category_ids;

        if ($request->isAjax) {
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            if ($request->isGet) {
                return [
                    'title' => "Update Book #" . $id,
                    'content' => $this->renderPartial('update', [
                        'model' => $this->findModel($id),
                    ]),
                    'footer' => Html::button('Close', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                        Html::button('Save', ['class' => 'btn btn-primary', 'type' => "submit"])
                ];
            } else if ($model->load($request->post()) && $model->save()) {
                return [
                    'forceReload' => '#crud-datatable-pjax',
                    'title' => "Book #" . $id,
                    'content' => $this->renderAjax('view', [
                        'model' => $model,
                    ]),
                    'footer' => Html::button('Close', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                        Html::a('Edit', ['update', 'id' => $id], ['class' => 'btn btn-primary', 'role' => 'modal-remote'])
                ];
            } else {
                return [
                    'title' => "Update Book #" . $id,
                    'content' => $this->renderAjax('update', [
                        'model' => $model,
                    ]),
                    'footer' => Html::button('Close', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                        Html::button('Save', ['class' => 'btn btn-primary', 'type' => "submit"])
                ];
            }
        } else {
            /*
            *   Process for non-ajax request
            */
            if ($model->load($request->post())) {
                $model->view_count = 0;
                $model->like_count = 0;

                $time_string = time();
                $image_file = UploadedFile::getInstance($model, 'image_file');
                if ($image_file) {
                    if (isset($image_old)) {
                        if (is_file($this->uploadFolder . '/book/' . $image_old)) {
                            unlink($this->uploadFolder . '/book/' . $image_old);
                        }
                    }
                    $model->image = $time_string . rand(0, 1000) . '_book_image.' . $image_file->extension;
                }
                $image_banner_file = UploadedFile::getInstance($model, 'image_banner_file');
                if ($image_banner_file ) {
                    if (isset($image_banner_old )) {
                        if (is_file($this->uploadFolder . '/book/' . $image_banner_old )) {
                            unlink($this->uploadFolder . '/book/' . $image_banner_old );
                        }
                    }
                    $model->image_banner = $time_string . rand(0, 1000) . '_book_image_banner.' . $image_banner_file->extension;
                }
                $attachment_file = UploadedFile::getInstance($model, 'attachment_file');
                if ($attachment_file) {
                    if (isset($attachment_old)) {
                        if (is_file($this->uploadFolder . '/book/' . $attachment_old)) {
                            unlink($this->uploadFolder . '/book/' . $attachment_old);
                        }
                    }
                    $model->attachment = $time_string . rand(0, 1000) . '_book_attachment.' . $attachment_file->extension;
                }
                $model->modified_date = date('Y-m-d H:i:s', $time_string);

                /* @var $user User */
                $user = Yii::$app->user->identity;
                if ($model->save()) {
                    $categories = $_POST["Book"]["category"];
                    ObjectRelation::deleteAll("object_id = $id AND object_type = '" . \backend\modules\book\Book::OBJECT_TYPE_BOOK . "' AND relation_type = '" . FConstant::OBJECT_TYPE_CATEGORY . "'");
                    if (is_array($categories)) {
                        foreach ($categories as $cate) {
                            $relation = new ObjectRelation;
                            $relation->object_id = $model->id;
                            $relation->object_type = \backend\modules\book\Book::OBJECT_TYPE_BOOK;
                            $relation->object2_id = $cate;
                            $relation->object2_type = FConstant::OBJECT_TYPE_CATEGORY;
                            $relation->relation_type = FConstant::OBJECT_TYPE_CATEGORY;
                            $relation->created_date = date('Y-m-d', $time_string);
                            $relation->created_user = $user->username;
                            $relation->save();
                        }

                    }
                    if ($image_file) {
                        $image_path = $this->uploadFolder . '/book/' . $model->image;
                        $image_file->saveAs($image_path);
                    }
                    if ($image_banner_file) {
                        $image_banner_path = $this->uploadFolder . '/book/' . $model->image_banner;
                        $image_banner_file->saveAs($image_banner_path);
                    }
                    if ($attachment_file) {
                        $attachment_path = $this->uploadFolder . '/book/' . $model->attachment;
                        $attachment_file->saveAs($attachment_path);
                    }

                    return $this->redirect(['index']);
                } else {
                    return $this->render('update', [
                        'model' => $model,
                    ]);
                }
            } else {
                return $this->render('update', [
                    'model' => $model,
                ]);
            }
        }
    }

    /**
     * Delete an existing Book model.
     * For ajax request will return json object
     * and for non-ajax request if deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $request = Yii::$app->request;
        $model = $this->findModel($id);
        $model->delete();

        if ($request->isAjax) {
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            return ['forceClose' => true, 'forceReload' => '#crud-datatable-pjax'];
        } else {
            /*
            *   Process for non-ajax request
            */
            return $this->redirect(['index']);
        }
    }

    /**
     * Delete multiple existing Book model.
     * For ajax request will return json object
     * and for non-ajax request if deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionBulkDelete()
    {
        $request = Yii::$app->request;
        $pks = explode(',', $request->post('pks')); // Array or selected records primary keys
        foreach ($pks as $pk) {
            $model = $this->findModel($pk);
            $model->delete();
        }

        if ($request->isAjax) {
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            return ['forceClose' => true, 'forceReload' => '#crud-datatable-pjax'];
        } else {
            /*
            *   Process for non-ajax request
            */
            return $this->redirect(['index']);
        }
    }

    public function actionBulkAction($action = '', $field = '', $value = '')
    {
        $request = Yii::$app->request;
        $pks = explode(',', $request->post('pks')); // Array or selected records primary keys
        foreach ($pks as $pk) {
            $model = $this->findModel($pk);
            if (isset($model)) {
                if ($action == FHtml::CHANGE_TYPE) {
                    $model[$field] = $value;
                    $model->save();
                }
                if ($action == FHtml::CLEAR_TYPE) {
                    $model[$field] = 0;
                    $model->save();
                }
                if ($action == FHtml::FILL_TYPE) {
                    $model[$field] = rand(0, 99999);
                    $model->save();
                }
                //do something with other actions
            }
        }

        if ($request->isAjax) {
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            return ['forceClose' => true, 'forceReload' => '#crud-datatable-pjax'];
        } else {
            /*
            *   Process for non-ajax request
            */
            return $this->redirect(['index']);
        }
    }


    /**
     * Finds the Book model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Book the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Book::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
