<?php
namespace backend\modules\book\controllers;

class ApiController extends \backend\controllers\ApiController
{
    public function actions()
    {
        return [
            'book' => ['class' => 'backend\modules\book\actions\BookAction', 'checkAccess' => [$this, 'checkAccess']],
            'filter-book' => ['class' => 'backend\modules\book\actions\ListBookAction', 'checkAccess' => [$this, 'checkAccess']],
            'book-list' => ['class' => 'backend\modules\book\actions\BookListAction', 'checkAccess' => [$this, 'checkAccess']],
            'book-ranking' => ['class' => 'backend\modules\book\actions\BookRankingAction', 'checkAccess' => [$this, 'checkAccess']],
            'chapter-list' => ['class' => 'backend\modules\book\actions\ChapterListAction', 'checkAccess' => [$this, 'checkAccess']],
            'comment-list' => ['class' => 'backend\modules\book\actions\CommentListAction', 'checkAccess' => [$this, 'checkAccess']],
            'update-counter' => ['class' => 'backend\modules\book\actions\UpdateCounterAction', 'checkAccess' => [$this, 'checkAccess']],
            'comment' => ['class' => 'backend\modules\book\actions\CommentAction', 'checkAccess' => [$this, 'checkAccess']],
            'bookmark' => ['class' => 'backend\modules\book\actions\BookmarkAction', 'checkAccess' => [$this, 'checkAccess']],
            'bookmark-list' => ['class' => 'backend\modules\book\actions\BookmarkListAction', 'checkAccess' => [$this, 'checkAccess']],
            'dashboard' => ['class' => 'backend\modules\book\actions\DashboardAction', 'checkAccess' => [$this, 'checkAccess']]
        ];
    }
}
