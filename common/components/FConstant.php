<?php

namespace common\components;


class FConstant
{
    const USER_STATUS_DELETED = 0;
    const USER_STATUS_ACTIVE = 10;
    const ROLE_USER = 10;
    const ROLE_MODERATOR = 20;
    const ROLE_ADMIN = 30;

    const OBJECT_TYPE_CATEGORY = "category";


    const
        SETTINGS_FORM_VIEW_POPUP = 'FORM_VIEW_POPUP',
        SETTINGS_FORM_EDIT_POPUP = 'FORM_EDIT_POPUP',
        SETTINGS_GRID_BUTTONS_TYPE = 'Buttons Style',
        SETTINGS_FORM_TYPE = 'Form Style',
        SETTINGS_ADMIN_INLINE_EDIT = 'Allow Inline Edit',
        SETTINGS_ADMIN_MODULES = 'Admin Menu Modules',
        SETTINGS_FIELD_LAYOUT = 'Field Layout',
        SETTINGS_FORM_LAYOUT = 'Form Layout',
        SETTINGS_AJAX_ENABLED = 'AJAX_ENABLED',
        SETTINGS_MATERIAL_DESIGN = 'Theme Style',
        SETTINGS_CONTROLS_HAS_ROUND_BORDER = 'CONTROLS_HAS_ROUND_BORDER',
        SETTINGS_PORTLET_STYLE = 'Portlet - Style',
        SETTINGS_DISPLAY_PORTLET = 'SETTINGS_DISPLAY_PORTLET',
        SETTINGS_MAIN_COLOR = 'Main Color',
        SETTINGS_LANG = 'lang',
        SETTINGS_ADMIN_MAIN_COLOR = 'Theme Color',
        SETTINGS_FORM_CONTROLS_ALIGNMENT = 'Controls Alignment',
        SETTINGS_DISPLAY_PAGECONTENT_HEADER = 'DISPLAY_PAGECONTENT_HEADER',
        SETTINGS_PAGE_SIZE = 'Page Size',
        SETTINGS_CURRENCY = 'Format Currency',
        SETTINGS_DATE_FORMAT = 'Format Date',
        SETTINGS_THUMBNAIL_SIZE = 'thumbnail_size',
        SETTINGS_DAYS_OF_WEEK_DISABLED = 'DAYS_OF_WEEK_DISABLED',
        SETTINGS_HOURS_DISABLED = 'HOURS_DISABLED',
        SETTINGS_DATETIME_FORMAT = 'Format Datetime',
        SETTINGS_COMPANY_NAME = 'Company name',
        SETTINGS_COMPANY_COPYRIGHT = 'Company copyright',
        SETTINGS_COMPANY_PRIVACY = 'Company privacy',
        SETTINGS_COMPANY_TERMS_OF_SERVICE = 'Company terms_of_service',
        SETTINGS_COMPANY_PROFILE = 'Company profile',
        SETTINGS_COMPANY_DOMAIN = 'Company website',
        SETTINGS_COMPANY_LOGO = 'Company logo',
        SETTINGS_COMPANY_FAVICON = 'Company favicon',
        SETTINGS_COMPANY_FAX = 'Company fax',
        SETTINGS_COMPANY_SLOGAN = 'Company slogan',
        SETTINGS_COMPANY_DESCRIPTION = 'Company description',
        SETTINGS_COMPANY_KEYWORD = 'Company keyword',
        SETTINGS_COMPANY_EMAIL = 'Company email',
        SETTINGS_COMPANY_ADDRESS = 'Company address',
        SETTINGS_COMPANY_MAP = 'Company map',
        SETTINGS_COMPANY_PHONE = 'Company phone',
        SETTINGS_COMPANY_CHAT = 'Company chat',
        SETTINGS_COMPANY_FACEBOOK = 'Company facebook',
        SETTINGS_COMPANY_TWITTER = 'Company twitter',
        SETTINGS_COMPANY_GOOGLE = 'Company google',
        SETTINGS_COMPANY_YOUTUBE = 'Company youtube',
        SETTINGS_PAGE_TITLE = 'Page Title',
        SETTINGS_PAGE_DESCRIPTION = 'Page Description',
        SETTINGS_PAGE_IMAGE = 'Page Image',
        SETTINGS_SITE_ANALYTICS = 'Google Analytics',
        SETTINGS_TIME_FORMAT = 'time_format',
        SETTINGS_WEB_THEME = 'web_theme',
        SETTINGS_BODY_CSS = 'body_css',
        SETTINGS_BODY_STYLE = 'body_style',
        SETTINGS_FRONTEND_INDEX_FILE = 'Frontend Index File',
        SETTINGS_PAGE_CSS = 'page_css',
        SETTINGS_PAGE_STYLE = 'page_style',
        SETTINGS_GOOGLE_API_KEY = 'Google API Key',
        SETTINGS_ADMIN_MENU_OPEN = 'ADMIN_MENU_OPEN',
        SETTINGS_CACHE_ENABLED = 'Cache Enabled',
        SETTINGS_DEFAULT_FRONTEND_MODULE = 'Default Frontend Module',
        SETTINGS_IS_CART_ENABLED = 'Shopping Cart Enabled',
        SETTINGS_PEM_FILE = 'PEM_FILE';

    const
        CONFIG_DB = 'db';

    const
        ACTION_DELETE = 'delete',
        ACTION_EDIT = 'edit',
        ACTION_ADD = 'add',
        ACTION_REJECT = 'reject',
        ACTION_APPROVED = 'approve',
        ACTION_VIEW = 'view',
        ACTION_SAVE = 'save',
        ACTION_LOAD = 'load',
        ACTION_SEND = 'send';
    const
        ACTION_DETAIL = 'detail',
        ACTION_FINISH = 'finish',
        ACTION_DENY = 'deny',
        ACTION_CANCEL = 'cancel',
        ACTION_DEAL = 'deal',
        ACTION_PAY = 'pay',
        ACTION_CREATE = 'create',
        ACTION_UPDATE = 'update';

    const RENDER_TYPE_CODE = 'code';
    const RENDER_TYPE_AUTO = 'auto';
    const RENDER_TYPE_DB_SETTING = 'database';

    const EDIT_TYPE_INLINE = 'inline',
        EDIT_TYPE_POPUP = 'popup',
        EDIT_TYPE_VIEW = 'view',
        EDIT_TYPE_DEFAULT = 'default',
        EDIT_TYPE_INPUT = 'input';

    const COLORS = [0 => 'default', 1 => 'primary', 2 => 'success', 3 => 'warning', 4 => 'danger'];
    const COLORS_BACKGROUND_ARRAYS = ['u', 'red', 'blue', 'sea', 'yellow', 'dark', 'grey'];

    const
        LAYOUT_ONELINE = 'one_line',
        LAYOUT_NEWLINE = 'new_line',
        LAYOUT_ONELINE_RIGHT = 'one_line_right',
        LAYOUT_TEXT = 'text',
        LAYOUT_NO_LABEL = 'nolabel',
        LAYOUT_TABLE = 'table';

    //HungHX: 20160801
    const
        NULL_VALUE = '...',
        ACTIVE_VALUE = 1,
        INACTIVE_VALUE = 0;

    const
        CHANGE_TYPE = 'change',
        CLEAR_TYPE = 'clear',
        FILL_TYPE = 'fill',
        SUBMIT_TYPE = 'submit';
    const
        BUTTON_CREATE = 'create',
        BUTTON_UPDATE = 'update',
        BUTTON_DELETE = 'delete',
        BUTTON_PROCESS = 'processing',
        BUTTON_PENDING = 'pending',
        BUTTON_RESET = 'reset',
        BUTTON_SEARCH = 'search',
        BUTTON_EDIT = 'edit',
        BUTTON_CANCEL = 'cancel',
        BUTTON_ADD = 'add',
        BUTTON_REMOVE = 'remove',
        BUTTON_SELECT = 'select',
        BUTTON_MOVE = 'move',
        BUTTON_RELOAD = 'reload',
        BUTTON_OK = 'ok',
        BUTTON_COPY = 'copy',
        BUTTON_ACCEPT = 'accept',
        BUTTON_REJECT = 'reject',
        BUTTON_APPROVED = 'approved',
        BUTTON_BACK = 'back',
        BUTTON_READ = 'read',
        BUTTON_UNREAD = 'unread',
        BUTTON_CONFIRM = 'confirm',
        BUTTON_COMPLETE = 'complete',
        BUTTON_REVERT = 'revert',
        BUTTON_SEND = 'send';

    public static $buttonIcons = array(
        self::BUTTON_CREATE => 'fa fa-plus',
        self::BUTTON_SEARCH => 'fa fa-search',
        self::BUTTON_APPROVED => 'fa fa-check',
        self::BUTTON_UPDATE => 'fa fa-save',
        self::BUTTON_DELETE => 'fa fa-trash',
        self::BUTTON_RESET => 'fa fa-refresh',
        self::BUTTON_EDIT => 'fa fa-pencil',
        self::BUTTON_CANCEL => 'fa fa-cancel',
        self::BUTTON_COPY => 'fa fa-copy',
        self::BUTTON_ADD => 'fa fa-plus',
        self::BUTTON_REMOVE => 'fa fa-trash',
        self::BUTTON_SELECT => 'fa fa-share',
        self::BUTTON_MOVE => 'fa fa-move',
        self::BUTTON_OK => 'fa fa-ok',
        self::BUTTON_ACCEPT => 'fa fa-plus',
        self::BUTTON_REJECT => 'fa fa-lock',
        self::BUTTON_APPROVED => 'fa fa-ok-sign',
        self::BUTTON_BACK => 'fa fa-arrow-left',
        self::BUTTON_READ => 'fa fa-bookmark',
        self::BUTTON_UNREAD => 'fa fa-bookmark',
        self::BUTTON_CONFIRM => 'fa fa-signin',
        self::BUTTON_COMPLETE => 'fa fa-remove',
        self::BUTTON_REVERT => 'fa fa-share',
        self::BUTTON_SEND => 'm-fa fa-swapright',
        self::BUTTON_PROCESS => 'fa fa-play',
        self::BUTTON_PENDING => 'fa fa-pause',
    );

    const
        ADMIN_EMAIL = 'ADMIN_EMAIL',
        GOOGLE_API_KEY = 'GOOGLE_API_KEY',
        PEM_FILE = 'PEM_FILE',
        PRIVACY = 'PRIVACY',
        COMPANY_NAME = 'COMPANY_NAME',
        COMPANY_DESCRIPTION = 'COMPANY_DESCRIPTION',
        COMPANY_HOMEPAGE = 'COMPANY_HOMEPAGE',
        WINNING_RATE = 'WINNING_RATE',
        DEAL_ONLINE_RATE = 'DEAL_ONLINE_RATE',
        PREMIUM_DEAL_ONLINE_RATE = 'PREMIUM_DEAL_ONLINE_RATE',
        DRIVER_ONLINE_RATE = 'DRIVER_ONLINE_RATE',
        SEARCHING_DEAL_DISTANCE = 'SEARCHING_DEAL_DISTANCE',
        SEARCHING_DRIVER_DISTANCE = 'SEARCHING_DRIVER_DISTANCE',
        EXCHANGE_FEE = 'EXCHANGE_FEE',
        TRANSFER_FEE = 'TRANSFER_FEE',
        REDEEM_FEE = 'REDEEM_FEE',
        TRIP_PAYMENT_FEE = 'TRIP_PAYMENT_FEE',
        DEAL_PAYMENT_FEE = 'DEAL_PAYMENT_FEE',
        PAGE_FAQ = 'PAGE_FAQ',
        PAGE_ABOUT = 'PAGE_ABOUT',
        PAGE_HELP = 'PAGE_HELP',
        PAGE_TERM = 'PAGE_TERM',

        SUCCESS = 'SUCCESS',
        ERROR = 'ERROR',
        NOT_FOUND = 'NOT FOUND',
        STATUS_ACTIVE = '1',
        STATUS_INACTIVE = '0',
        MISSING_PARAMS = 'Missing parameters',
        MALFORMED_PARAMS = 'Malformed parameters',
        STATE_ACTIVE = 1,
        STATE_INACTIVE = 0,
        STATE_DELETED = -1;

    const
        TYPE_ANDROID = 1,
        TYPE_IOS = 2,
        NO_IMAGE = 'no_image.jpg';
    const
        DEFAULT_ITEMS_PER_PAGE = 10;
    const
        WIDGET_COLOR_DEFAULT = "default",
        WIDGET_TYPE_DEFAULT = "light bordered",
        WIDGET_TYPE_BOX = "box",
        WIDGET_TYPE_NONE = "light", // light, light bordered, box
        WIDGET_TYPE_LIGHT = "light bordered";

    const
        LABEL_ACTIVE = 'active',
        LABEL_INACTIVE = 'inactive',
        LABEL_NEW = 'new',
        LABEL_NORMAL = 'normal',
        LABEL_PREMIUM = 'premium',
        LABEL_OLD = 'old';

    const
        UPLOAD_FAIL = 'Upload fail';
    const
        DEFAULT_AVATAR = 'default_avatar.jpg';
    const

        STATUS_PUBLISH = 'publish',
        STATUS_DRAFT = 'draft',
        DEVICE_TYPE_ANDROID = 1,
        DEVICE_TYPE_IOS = 2,

        PAYMENT_STATUS_PAID = 1,//'paid'
        PAYMENT_STATUS_PENDING = 0;//'pending'

    const
        STATUS_FAIL = 'fail',
        STATUS_APPROVED = 'approved',
        STATUS_REJECTED = 'rejected',
        STATUS_PROCESSING = 'processing',
        STATUS_FINISH = 'finish',
        STATUS_PENDING = 'pending';

    const
        EMAIL_OR_USERNAME_EXIST = 'Email or username existed',
        EMAIL_EXIST = 'Email exist',
        EMAIL_DOES_NOT_EXIST = 'Email does not exist',
        EMAIL_OR_USERNAME_DOES_NOT_EXIST = 'Email or username does not exist',
        WRONG_PASSWORD = 'Wrong password',
        USER_NOT_FOUND = 'User not found',
        DATA_NOT_FOUND = 'Data not found',
        TOKEN_MISMATCH = 'Token mismatch',
        CAN_NOT_PERFORM = 'You can not perform this action';
}