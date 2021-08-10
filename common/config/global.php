<?php

// SYSTEM CONFIGURATION
define('CACHE_ENABLED', true);
define('LANGUAGES_ENABLED', false); // Multiple Languages or not

define('DEFAULT_APPLICATION_ID', 'default'); // Default Application ID, should not change this value
define('DEFAULT_APPLICATION_THEME', 'unify');
define('ROOT_FOLDER', '/framework');

// PAYPAL
define('PAYPAL_API_USERNAME',"phamvantrang105@gmail.com");
define('PAYPAL_API_EMAIL',"phamvantrang105@gmail.com");

define('PAYPAL_API_PASSWORD',"UBVDUPTMCEGA6Y88");
define('PAYPAL_API_SIGNATURE',"AFcWxV21C7fd0v3bYYYRCpSSRl31AlKUjYQEm9StBtsQZbeWCwCJcHxC");
define('PAYPAL_API_LIVE', true);

// Advanced Configuration: DYNAMIC FORMS etc. Only used for Super Administrators
define('APPLICATIONS_ENABLED', false); // Multiple Applications or not
define('SYSTEM_ADMIN_ENABLED', false); // Allow admin to edit objects, schema, views etc or not
define('DYNAMIC_FORM_ENABLED', false); // Build form dynamically
define('DEFAULT_PASSWORD', '123456');
define('REQUIRED_INDEX_PHP', true); // Auto add index.php in Url
define('DB_SETTINGS_ENABLED', false); // Get Setting from Database
define('DEFAULT_MODULES', 'Cms,Crm,Ecommerce,Music,Travel,Purchase,Pm,Office,App');
define('FRONTEND_MENU_FROM_MODULE', true);
define('FRONTEND_MENU_FROM_DB', true);

define('DEFAULT_FRONTEND_MODULES', 'Cms');

define('DS', DIRECTORY_SEPARATOR);
define('SITE', 'site');
define('WEB_DIR', 'web');
defined('UPLOAD_DIR') or define('UPLOAD_DIR', 'upload');
define('WWW_DIR', 'www');
define('CATEGORY_DIR', 'object-category');
define('APP_USER_DIR', 'app-user');
define('BOOK_DIR', 'book');
define('CHAPTER_DIR', 'book-chapter');

//DEFAULT VALUES
define('DEFAULT_IMAGE', 'no_image.jpg');
defined('FRONTEND') or define('FRONTEND', 'frontend');
defined('BACKEND') or define('BACKEND', 'backend');
define('PEM_DIR', 'pem');

define('DEFAULT_APPLICATION_NAME', 'SUUSOFT CMS');
define('DEFAULT_APPLICATION_WEBSITE', 'http://suusoft.com');
define('DEFAULT_APPLICATION_VERSION', '1.0');

if (!isset($root_dir)) $root_dir = dirname(dirname(dirname(__FILE__)));
Yii::setAlias('@' . UPLOAD_DIR, $root_dir . DS . BACKEND . DS . WEB_DIR . DS . UPLOAD_DIR);
Yii::setAlias('@' . SITE, $root_dir);
