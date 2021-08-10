-- phpMyAdmin SQL Dump
-- version 4.3.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 30, 2018 at 03:54 AM
-- Server version: 5.5.51-38.2
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `trangpv_ebook`
--

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE IF NOT EXISTS `application` (
  `id` int(11) NOT NULL,
  `logo` varchar(300) DEFAULT NULL COMMENT 'editor:upload',
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `keywords` varchar(1000) DEFAULT NULL,
  `note` varchar(3000) DEFAULT NULL,
  `lang` varchar(100) DEFAULT NULL,
  `modules` varchar(500) DEFAULT NULL,
  `storage_max` bigint(20) DEFAULT NULL COMMENT 'group:storage',
  `storage_current` bigint(20) DEFAULT NULL COMMENT 'group:storage',
  `address` varchar(255) DEFAULT NULL COMMENT 'group:contact',
  `map` varchar(255) DEFAULT NULL COMMENT 'group:contact;grid:hidden',
  `website` varchar(255) DEFAULT NULL COMMENT 'group:contact',
  `email` varchar(255) DEFAULT NULL COMMENT 'group:contact',
  `phone` varchar(255) DEFAULT NULL COMMENT 'group:contact',
  `fax` varchar(255) DEFAULT NULL COMMENT 'group:contact',
  `chat` varchar(255) DEFAULT NULL COMMENT 'group:contact',
  `facebook` varchar(255) DEFAULT NULL COMMENT 'grid:hidden;group:social',
  `twitter` varchar(255) DEFAULT NULL COMMENT 'grid:hidden;group:social',
  `google` varchar(255) DEFAULT NULL COMMENT 'grid:hidden;group:social',
  `youtube` varchar(255) DEFAULT NULL COMMENT 'grid:hidden;group:social',
  `copyright` varchar(255) DEFAULT NULL COMMENT 'grid:hidden;',
  `terms_of_service` varchar(300) DEFAULT NULL COMMENT 'editor:file;group:common',
  `profile` varchar(300) DEFAULT NULL COMMENT 'editor:file;group:common',
  `privacy_policy` varchar(300) DEFAULT NULL COMMENT 'editor:file;group:common',
  `is_active` tinyint(1) DEFAULT NULL COMMENT 'group:common',
  `type` varchar(100) DEFAULT NULL COMMENT 'data:ONEPAGE,COMPANY,ECOMMERCE,SOCIAL,MUSIC,EDUCATION',
  `status` varchar(100) DEFAULT NULL COMMENT 'data:DEMO,LIVE,CLOSED,SUSPEND',
  `page_size` int(5) DEFAULT NULL COMMENT 'group:setting',
  `main_color` varchar(255) DEFAULT NULL COMMENT 'lookup:#COLORS;group:setting;editor:input',
  `cache_enabled` tinyint(1) DEFAULT NULL,
  `currency_format` varchar(255) DEFAULT NULL COMMENT 'lookup:#CURRENCY;group:setting',
  `date_format` varchar(255) DEFAULT NULL COMMENT 'group:setting;editor:input',
  `web_theme` varchar(255) DEFAULT NULL COMMENT 'group:style',
  `admin_form_alignment` varchar(255) DEFAULT NULL COMMENT 'data:vertical,horizontal,inline;group:setting',
  `body_css` varchar(255) DEFAULT NULL COMMENT 'group:style',
  `body_style` varchar(255) DEFAULT NULL COMMENT 'group:style',
  `page_css` varchar(255) DEFAULT NULL COMMENT 'group:style',
  `page_style` varchar(255) DEFAULT NULL COMMENT 'group:style',
  `owner_id` varchar(100) DEFAULT NULL COMMENT 'editor:select;lookup:@user,id,username;group:common',
  `created_date` datetime DEFAULT NULL,
  `created_user` varchar(100) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_user` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `application`
--

INSERT INTO `application` (`id`, `logo`, `code`, `name`, `description`, `keywords`, `note`, `lang`, `modules`, `storage_max`, `storage_current`, `address`, `map`, `website`, `email`, `phone`, `fax`, `chat`, `facebook`, `twitter`, `google`, `youtube`, `copyright`, `terms_of_service`, `profile`, `privacy_policy`, `is_active`, `type`, `status`, `page_size`, `main_color`, `cache_enabled`, `currency_format`, `date_format`, `web_theme`, `admin_form_alignment`, `body_css`, `body_style`, `page_css`, `page_style`, `owner_id`, `created_date`, `created_user`, `modified_date`, `modified_user`) VALUES
(1, 'application1_logo.png', 'default', 'SUUSOFT', 'Always the best', '', '', 'en', NULL, 50000, 33333, 'Ha noi, Vietnam.', '', 'http://suusoft.com', 'suusoft@gmail.com', '+841658296686', '', '', '', 't', '', '', 'Copyright by SUUSOFT', '', '', '', 1, '', '', NULL, 'red', NULL, '', 'yyyy-m-d', '', '', 'bg-color-light', '.container {     width:90% !important;     padding-left:50px !important;padding-right: 50px !important;', '', '', '6', '2016-10-03 13:15:39', '6', '2017-01-05 20:28:36', '6'),
(2, 'vinh-hung_application2_logo.png', 'vinh_hung', 'SUUSOFT', '', '', '', NULL, NULL, NULL, NULL, 'Thành phố Hà Nội - Việt Nam, Đại Kim, Hoàng Mai, Hà Nội', '', 'http://suusoft.com', 'suusoft@gmail.com', '+841658296686', '', '', '', '', '', '', 'Copyright by', '', '', '', NULL, '', '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '2017-03-09 05:03:41', '6', '2017-03-09 05:03:41', '6'),
(12, '', 'ebook', 'Content Management System', '', '', '', 'en', '', NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-08-02 14:44:31', '6', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `app_notification`
--

CREATE TABLE IF NOT EXISTS `app_notification` (
  `id` bigint(20) NOT NULL,
  `message` varchar(2000) NOT NULL,
  `content` text,
  `action` varchar(100) DEFAULT NULL COMMENT 'data:INFO,URL,CONTENT,REFRESH,CLEAR,CLOSE',
  `receiver_count` bigint(20) DEFAULT NULL,
  `receiver_users` text COMMENT 'lookup:user',
  `sent_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_user` varchar(100) DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app_user`
--

CREATE TABLE IF NOT EXISTS `app_user` (
  `id` int(11) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `auth_key` varchar(32) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `content` text,
  `gender` varchar(100) DEFAULT NULL COMMENT 'group:PERSONAL',
  `dob` varchar(255) DEFAULT NULL COMMENT 'group:PERSONAL',
  `phone` varchar(25) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL COMMENT 'group:PERSONAL',
  `height` varchar(255) DEFAULT NULL COMMENT 'group:PERSONAL',
  `address` varchar(255) DEFAULT NULL COMMENT 'group:LOCATION',
  `country` varchar(100) DEFAULT NULL COMMENT 'group:LOCATION',
  `state` varchar(100) DEFAULT NULL COMMENT 'group:LOCATION',
  `city` varchar(100) DEFAULT NULL COMMENT 'group:LOCATION',
  `balance` decimal(10,0) DEFAULT NULL COMMENT 'group:FINANCE',
  `point` int(11) DEFAULT NULL COMMENT 'group:FINANCE',
  `card_number` varchar(255) DEFAULT NULL COMMENT 'group:PAYMENT',
  `card_cvv` varchar(255) DEFAULT NULL COMMENT 'editor:text;group:PAYMENT',
  `card_exp` varchar(255) DEFAULT NULL COMMENT 'group:PAYMENT',
  `lat` varchar(255) DEFAULT NULL COMMENT 'group:LOCATION',
  `long` varchar(255) DEFAULT NULL COMMENT 'group:LOCATION',
  `rate` float DEFAULT NULL COMMENT 'group:RATINGS;',
  `rate_count` int(11) DEFAULT NULL COMMENT 'group:RATINGS;',
  `is_online` tinyint(1) DEFAULT NULL COMMENT 'group:GROUPING',
  `is_active` tinyint(1) DEFAULT NULL COMMENT 'group:GROUPING',
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL COMMENT 'data:PENDING,BANNED,REJECTED,NORMAL,PRO,VIP',
  `role` int(2) DEFAULT NULL COMMENT 'data:10:USER,20:MODERATOR,30:ADMIN;editor:select;group:GROUPING',
  `provider_id` varchar(100) DEFAULT NULL COMMENT 'lookup:@provider',
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_user`
--

INSERT INTO `app_user` (`id`, `avatar`, `name`, `username`, `email`, `password`, `auth_key`, `password_hash`, `password_reset_token`, `description`, `content`, `gender`, `dob`, `phone`, `weight`, `height`, `address`, `country`, `state`, `city`, `balance`, `point`, `card_number`, `card_cvv`, `card_exp`, `lat`, `long`, `rate`, `rate_count`, `is_online`, `is_active`, `type`, `status`, `role`, `provider_id`, `created_date`, `modified_date`) VALUES
(1, '', 'Mr Cuong Hy', 'immrhy@gmail.com', 'immrhy@gmail.com', '$2y$13$LRvAS.EQ5jfb6rT0/KRg0eKf2c1YB02VN2V1Dzz0ze/ISVEH1Yawe', 'gRS6h1See-FfeNWrV2gjeLl42UkUNH5t', NULL, NULL, '', NULL, '', NULL, '', NULL, NULL, '', NULL, NULL, '', NULL, 5, '', '', '', '', '', NULL, NULL, NULL, 1, NULL, 'BANNED', 10, NULL, NULL, '2016-11-23 11:49:26'),
(3, NULL, '', 'admin@gmail.com', 'admin@gmail.com', '$2y$13$6Q.axFyEYMDuuAmqtv/I3uIxYiiL5h5UmMC21zL661c1.oUTGIiiO', 'UWa_--r2UJzDZcNImYoe269dxi6qDfaF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '1', 30, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_user_bookmark`
--

CREATE TABLE IF NOT EXISTS `app_user_bookmark` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL COMMENT 'lookup:@app_user',
  `object_id` varchar(100) NOT NULL,
  `object_type` varchar(100) NOT NULL,
  `name` varchar(2000) NOT NULL COMMENT '1-full 2-chapter 3-text',
  `content` text,
  `created_date` datetime DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app_user_device`
--

CREATE TABLE IF NOT EXISTS `app_user_device` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT 'lookup:@app_user',
  `ime` varchar(255) NOT NULL,
  `gcm_id` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app_user_feedback`
--

CREATE TABLE IF NOT EXISTS `app_user_feedback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_user_feedback`
--

INSERT INTO `app_user_feedback` (`id`, `user_id`, `name`, `email`, `subject`, `content`, `is_active`, `created_date`, `modified_date`) VALUES
(1, NULL, 'Dang Tin', 'tin@gmail.com', 'Feedback', 'Very good', 1, '2017-07-18 01:51:56', NULL),
(2, NULL, 'Thuy', 'tin@gmail.com', 'Tin', 'Test', 1, '2017-07-20 03:19:39', NULL),
(3, NULL, 'Thuy', 'tin@gmail.com', 'Tin', 'Test', 1, '2017-07-20 03:19:48', NULL),
(4, NULL, 'Teddt', 'ted@gmail.com', 'Ted', 'Ted', 1, '2017-08-04 03:55:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_user_logs`
--

CREATE TABLE IF NOT EXISTS `app_user_logs` (
  `id` bigint(20) NOT NULL,
  `user_id` varchar(100) NOT NULL COMMENT 'lookup:@app_user',
  `action` varchar(100) DEFAULT NULL COMMENT 'data:register,login,purchase,feedback',
  `duration` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `app_user_pro`
--

CREATE TABLE IF NOT EXISTS `app_user_pro` (
  `user_id` int(11) NOT NULL,
  `rate` float(3,1) DEFAULT NULL,
  `rate_count` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `business_name` varchar(255) DEFAULT NULL,
  `business_email` varchar(255) DEFAULT NULL,
  `business_address` varchar(255) DEFAULT NULL,
  `business_website` varchar(255) DEFAULT NULL,
  `business_phone` varchar(20) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_user_pro`
--

INSERT INTO `app_user_pro` (`user_id`, `rate`, `rate_count`, `description`, `business_name`, `business_email`, `business_address`, `business_website`, `business_phone`, `is_active`, `created_date`, `modified_date`) VALUES
(51, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(54, 8.0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(55, 10.0, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(88, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_user_token`
--

CREATE TABLE IF NOT EXISTS `app_user_token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `app_user_token`
--

INSERT INTO `app_user_token` (`id`, `user_id`, `token`, `time`) VALUES
(66, 12, '5c804ecda04320124cd26a6ff4be7f1f', '2016-06-30 10:24:38'),
(108, 6, '0380c4baf39d05a2937b1d1f55ebcad8', '2016-07-01 17:23:50'),
(115, 1, '790e8065b42517072891b761c0f9de2d', '2016-07-07 01:16:15'),
(119, 8, 'e552d7af875986ffa6da843bd077d59e', '2016-07-05 11:32:38'),
(131, 14, '7b57883f8d0f12fc0463c425dd8f09bf', '2016-07-06 10:17:20'),
(135, 2, '628565b445f604ede847942c7af3d3f4', '2016-07-07 11:05:21'),
(136, 10, '492de1fc848a6cf9fffb02d971dcf5bf', '2016-07-07 11:07:16'),
(137, 15, 'aacdee4a314980d048fb22bc2b107543', '2016-07-07 11:20:01');

-- --------------------------------------------------------

--
-- Table structure for table `app_user_transaction`
--

CREATE TABLE IF NOT EXISTS `app_user_transaction` (
  `id` bigint(20) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `receiver_user_id` varchar(100) NOT NULL COMMENT 'lookup:@app_user',
  `object_id` varchar(100) DEFAULT NULL,
  `object_type` varchar(100) DEFAULT NULL,
  `amount` decimal(20,2) NOT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `payment_method` varchar(100) NOT NULL COMMENT 'data:POINT,CREDIT,CASH,BANK,PAYPAL,WU',
  `note` varchar(2000) DEFAULT NULL,
  `time` varchar(20) NOT NULL,
  `action` varchar(255) DEFAULT NULL COMMENT 'data:SYSTEM_ADJUST,CANCELLATION_ORDER_FEE,EXCHANGE_POINT,REDEEM_POINT,TRANSFER_POINT,TRIP_PAYMENT,PASSENGER_SHARE_BONUS,DRIVER_SHARE_BONUS',
  `type` varchar(100) DEFAULT NULL COMMENT 'data:PLUS,MINUS',
  `status` varchar(100) NOT NULL COMMENT 'data:PENDING=0,APPROVED=1,REJECTED=-1',
  `created_date` datetime DEFAULT NULL,
  `created_user` varchar(100) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_user` varchar(100) DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`, `is_active`, `created_date`, `modified_date`, `application_id`) VALUES
(8, 'Cms Admin', 1, '2017-05-26 10:36:41', NULL, ''),
(9, 'Cms User', 1, '2017-05-26 10:40:26', '2017-05-27 02:12:39', ''),
(10, 'Ecommerce User', 1, '2017-05-26 10:41:02', NULL, ''),
(11, 'Ecommerce Admin', 1, '2017-05-26 10:41:02', NULL, ''),
(12, 'Travel User', 1, '2017-05-26 10:41:43', NULL, ''),
(13, 'Travel Admin', 1, '2017-05-26 10:41:43', NULL, ''),
(14, 'App User', 1, '2017-05-26 10:41:49', NULL, ''),
(15, 'App Admin', 1, '2017-05-26 10:41:49', NULL, ''),
(16, 'Administration User', 1, '2017-05-27 03:16:38', NULL, ''),
(17, 'Administration Admin', 1, '2017-05-27 03:16:39', NULL, ''),
(18, 'Book User', 1, '2017-06-30 11:58:42', NULL, 'mozaebook'),
(19, 'Book Admin', 1, '2017-06-30 11:58:42', NULL, 'mozaebook'),
(20, 'App User', 1, '2017-07-18 22:32:34', NULL, 'mozaebook'),
(21, 'App Admin', 1, '2017-07-18 22:32:34', NULL, 'mozaebook'),
(22, 'Administration User', 1, '2017-07-18 22:32:56', NULL, 'mozaebook'),
(23, 'Administration Admin', 1, '2017-07-18 22:32:56', NULL, 'mozaebook'),
(24, 'Book User', 1, '2017-08-02 14:53:53', NULL, 'ebook'),
(25, 'Book Admin', 1, '2017-08-02 14:53:53', NULL, 'ebook');

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` bigint(20) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `object_type` varchar(100) NOT NULL,
  `object2_id` bigint(20) NOT NULL,
  `object2_type` varchar(100) NOT NULL,
  `relation_type` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(5) NOT NULL,
  `created_date` date DEFAULT NULL,
  `created_user` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `object_id`, `object_type`, `object2_id`, `object2_type`, `relation_type`, `is_active`, `sort_order`, `created_date`, `created_user`) VALUES
(78, 10, 'auth_group', 110, 'auth_role', 'group-role', NULL, 0, '2017-05-26', NULL),
(79, 11, 'auth_group', 111, 'auth_role', 'group-role', NULL, 0, '2017-05-26', NULL),
(88, 14, 'auth_group', 121, 'auth_role', 'group-role', NULL, 0, '2017-05-27', NULL),
(89, 15, 'auth_group', 122, 'auth_role', 'group-role', NULL, 0, '2017-05-27', NULL),
(97, 16, 'auth_group', 114, 'auth_role', 'group-role', NULL, 0, '2017-05-29', NULL),
(106, 12, 'auth_group', 137, 'auth_role', 'group-role', NULL, 0, '2017-05-30', NULL),
(107, 13, 'auth_group', 138, 'auth_role', 'group-role', NULL, 0, '2017-05-30', NULL),
(108, 9, 'auth_group', 91, 'auth_role', 'group-role', NULL, 0, '2017-05-30', NULL),
(109, 8, 'auth_group', 92, 'auth_role', 'group-role', NULL, 0, '2017-05-30', NULL),
(120, 18, 'auth_group', 152, 'auth_role', 'group-role', NULL, 0, '2017-07-18', NULL),
(121, 19, 'auth_group', 153, 'auth_role', 'group-role', NULL, 0, '2017-07-18', NULL),
(126, 20, 'auth_group', 158, 'auth_role', 'group-role', NULL, 0, '2017-07-18', NULL),
(127, 21, 'auth_group', 159, 'auth_role', 'group-role', NULL, 0, '2017-07-18', NULL),
(130, 22, 'auth_group', 164, 'auth_role', 'group-role', NULL, 0, '2017-07-18', NULL),
(131, 24, 'auth_group', 173, 'auth_role', 'group-role', NULL, 0, '2017-08-02', NULL),
(132, 25, 'auth_group', 174, 'auth_role', 'group-role', NULL, 0, '2017-08-02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_role`
--

CREATE TABLE IF NOT EXISTS `auth_role` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_role`
--

INSERT INTO `auth_role` (`id`, `code`, `name`, `description`, `is_active`, `created_date`, `modified_date`, `application_id`) VALUES
(89, 'home', 'Home - View', 'View, List', 1, '2017-05-26 10:58:42', NULL, ''),
(90, 'home/manage', 'Home - Manage', 'Create, Update, Delete', 1, '2017-05-26 10:58:42', NULL, ''),
(91, 'cms', 'Cms - View', 'View, List', 1, '2017-05-26 10:58:56', NULL, ''),
(92, 'cms/manage', 'Cms - Manage', 'Create, Update, Delete', 1, '2017-05-26 10:58:57', NULL, ''),
(93, 'cms_blogs', 'Cms Blogs - View', 'View, List', 1, '2017-05-26 10:58:57', NULL, ''),
(94, 'cms_blogs/manage', 'Cms Blogs - Manage', 'Create, Update, Delete', 1, '2017-05-26 10:58:57', NULL, ''),
(95, 'cms_article', 'Cms Article - View', 'View, List', 1, '2017-05-26 10:59:01', NULL, ''),
(96, 'cms_article/manage', 'Cms Article - Manage', 'Create, Update, Delete', 1, '2017-05-26 10:59:01', NULL, ''),
(97, 'cms_slide', 'Cms Slide - View', 'View, List', 1, '2017-05-26 10:59:04', NULL, ''),
(98, 'cms_slide/manage', 'Cms Slide - Manage', 'Create, Update, Delete', 1, '2017-05-26 10:59:04', NULL, ''),
(99, 'cms_service', 'Cms Service - View', 'View, List', 1, '2017-05-26 10:59:06', NULL, ''),
(100, 'cms_service/manage', 'Cms Service - Manage', 'Create, Update, Delete', 1, '2017-05-26 10:59:06', NULL, ''),
(101, 'cms_about', 'Cms About - View', 'View, List', 1, '2017-05-26 10:59:09', NULL, ''),
(102, 'cms_about/manage', 'Cms About - Manage', 'Create, Update, Delete', 1, '2017-05-26 10:59:09', NULL, ''),
(103, 'cms_employee', 'Cms Employee - View', 'View, List', 1, '2017-05-26 10:59:11', NULL, ''),
(104, 'cms_employee/manage', 'Cms Employee - Manage', 'Create, Update, Delete', 1, '2017-05-26 10:59:11', NULL, ''),
(105, 'cms_contact', 'Cms Contact - View', 'View, List', 1, '2017-05-26 10:59:14', NULL, ''),
(106, 'cms_contact/manage', 'Cms Contact - Manage', 'Create, Update, Delete', 1, '2017-05-26 10:59:14', NULL, ''),
(107, 'cms_album', 'Cms Album - View', 'View, List', 1, '2017-05-26 10:59:16', NULL, ''),
(108, 'cms_album/manage', 'Cms Album - Manage', 'Create, Update, Delete', 1, '2017-05-26 10:59:16', NULL, ''),
(109, 'cms_testimonial', 'Cms Testimonial - View', 'View, List', 1, '2017-05-26 10:59:19', NULL, ''),
(110, 'ecommerce', 'Ecommerce - View', 'View, List', 1, '2017-05-26 10:59:23', NULL, ''),
(111, 'ecommerce/manage', 'Ecommerce - Manage', 'Create, Update, Delete', 1, '2017-05-26 10:59:23', NULL, ''),
(112, 'product', 'Product - View', 'View, List', 1, '2017-05-26 10:59:23', NULL, ''),
(113, 'product/manage', 'Product - Manage', 'Create, Update, Delete', 1, '2017-05-26 10:59:23', NULL, ''),
(114, 'administration', 'Administration - View', 'View, List', 1, '2017-05-26 10:59:28', NULL, ''),
(115, 'ecommerce_order', 'Ecommerce Order - View', 'View, List', 1, '2017-05-26 11:01:35', NULL, ''),
(116, 'provider', 'Provider - View', 'View, List', 1, '2017-05-26 11:01:37', NULL, ''),
(117, 'provider/manage', 'Provider - Manage', 'Create, Update, Delete', 1, '2017-05-26 11:01:37', NULL, ''),
(118, 'promotion', 'Promotion - View', 'View, List', 1, '2017-05-26 11:05:35', NULL, ''),
(119, 'promotion/manage', 'Promotion - Manage', 'Create, Update, Delete', 1, '2017-05-26 11:05:35', NULL, ''),
(120, 'object_setting', 'Object Setting - View', 'View, List', 1, '2017-05-27 03:16:39', NULL, ''),
(121, 'app', 'App - View', 'View, List', 1, '2017-05-27 03:35:00', NULL, ''),
(122, 'app/manage', 'App - Manage', 'Create, Update, Delete', 1, '2017-05-27 03:35:00', NULL, ''),
(123, 'app_user', 'App User - View', 'View, List', 1, '2017-05-27 03:35:00', NULL, ''),
(124, 'app_user/manage', 'App User - Manage', 'Create, Update, Delete', 1, '2017-05-27 03:35:00', NULL, ''),
(125, 'app_user_device', 'App User Device - View', 'View, List', 1, '2017-05-27 03:35:06', NULL, ''),
(126, 'app_user_feedback', 'App User Feedback - View', 'View, List', 1, '2017-05-27 03:35:09', NULL, ''),
(127, 'cms_feedback', 'Cms Feedback - View', 'View, List', 1, '2017-05-28 10:32:08', NULL, ''),
(128, 'cms_feedback/manage', 'Cms Feedback - Manage', 'Create, Update, Delete', 1, '2017-05-28 10:32:08', NULL, ''),
(129, 'cms_statistics', 'Cms Statistics - View', 'View, List', 1, '2017-05-28 10:32:37', NULL, ''),
(130, 'cms_partner', 'Cms Partner - View', 'View, List', 1, '2017-05-28 16:12:21', NULL, ''),
(131, 'cms_partner/manage', 'Cms Partner - Manage', 'Create, Update, Delete', 1, '2017-05-28 16:12:21', NULL, ''),
(132, 'object_category', 'Object Category - View', 'View, List', 1, '2017-05-29 20:42:34', NULL, ''),
(133, 'settings_menu', 'Settings Menu - View', 'View, List', 1, '2017-05-29 20:42:48', NULL, ''),
(134, 'settings_menu/manage', 'Settings Menu - Manage', 'Create, Update, Delete', 1, '2017-05-29 20:42:48', NULL, ''),
(135, 'cms_faq', 'Cms Faq - View', 'View, List', 1, '2017-05-29 20:45:43', NULL, ''),
(136, 'cms_faq/manage', 'Cms Faq - Manage', 'Create, Update, Delete', 1, '2017-05-29 20:45:43', NULL, ''),
(137, 'travel', 'Travel - View', 'View, List', 1, '2017-05-30 04:19:56', NULL, ''),
(138, 'travel/manage', 'Travel - Manage', 'Create, Update, Delete', 1, '2017-05-30 04:19:56', NULL, ''),
(139, 'travel_attractions', 'Travel Attractions - View', 'View, List', 1, '2017-05-30 04:19:56', NULL, ''),
(140, 'travel_sites', 'Travel Sites - View', 'View, List', 1, '2017-05-30 05:46:55', NULL, ''),
(141, 'travel_sites/manage', 'Travel Sites - Manage', 'Create, Update, Delete', 1, '2017-05-30 05:46:55', NULL, ''),
(142, 'travel_itinerary', 'Travel Itinerary - View', 'View, List', 1, '2017-05-30 05:46:57', NULL, ''),
(143, 'travel_scores', 'Travel Scores - View', 'View, List', 1, '2017-05-30 05:48:29', NULL, ''),
(144, 'travel_scores/manage', 'Travel Scores - Manage', 'Create, Update, Delete', 1, '2017-05-30 05:48:29', NULL, ''),
(145, 'cms_portfolio', 'Cms Portfolio - View', 'View, List', 1, '2017-05-30 05:54:02', NULL, ''),
(146, 'cms_portfolio/manage', 'Cms Portfolio - Manage', 'Create, Update, Delete', 1, '2017-05-30 05:54:02', NULL, ''),
(147, 'administration', 'Administration - View', 'View, List', 1, '2017-06-06 23:18:32', NULL, 'cms'),
(148, 'app', 'App - View', 'View, List', 1, '2017-06-09 20:13:11', NULL, 'trayolo'),
(149, 'app/manage', 'App - Manage', 'Create, Update, Delete', 1, '2017-06-09 20:13:11', NULL, 'trayolo'),
(150, 'app', 'App - View', 'View, List', 1, '2017-06-09 20:13:17', NULL, 'trayolo'),
(151, 'app/manage', 'App - Manage', 'Create, Update, Delete', 1, '2017-06-09 20:13:17', NULL, 'trayolo'),
(152, 'book', 'Book - View', 'View, List', 1, '2017-06-30 11:58:42', NULL, 'mozaebook'),
(153, 'book/manage', 'Book - Manage', 'Create, Update, Delete', 1, '2017-06-30 11:58:42', NULL, 'mozaebook'),
(154, 'book_comment', 'Book Comment - View', 'View, List', 1, '2017-06-30 12:00:12', NULL, 'mozaebook'),
(155, 'book_comment/manage', 'Book Comment - Manage', 'Create, Update, Delete', 1, '2017-06-30 12:00:13', NULL, 'mozaebook'),
(156, 'book_chapter', 'Book Chapter - View', 'View, List', 1, '2017-06-30 12:00:22', NULL, 'mozaebook'),
(157, 'book_chapter/manage', 'Book Chapter - Manage', 'Create, Update, Delete', 1, '2017-06-30 12:00:22', NULL, 'mozaebook'),
(158, 'app', 'App - View', 'View, List', 1, '2017-07-18 22:32:34', NULL, 'mozaebook'),
(159, 'app/manage', 'App - Manage', 'Create, Update, Delete', 1, '2017-07-18 22:32:34', NULL, 'mozaebook'),
(160, 'app_user', 'App User - View', 'View, List', 1, '2017-07-18 22:32:34', NULL, 'mozaebook'),
(161, 'app_user/manage', 'App User - Manage', 'Create, Update, Delete', 1, '2017-07-18 22:32:34', NULL, 'mozaebook'),
(162, 'app_user_device', 'App User Device - View', 'View, List', 1, '2017-07-18 22:32:38', NULL, 'mozaebook'),
(163, 'app_user_feedback', 'App User Feedback - View', 'View, List', 1, '2017-07-18 22:32:51', NULL, 'mozaebook'),
(164, 'administration', 'Administration - View', 'View, List', 1, '2017-07-18 22:32:54', NULL, 'mozaebook'),
(165, 'object_setting', 'Object Setting - View', 'View, List', 1, '2017-07-18 22:32:56', NULL, 'mozaebook'),
(166, 'object_category', 'Object Category - View', 'View, List', 1, '2017-07-18 22:32:57', NULL, 'mozaebook'),
(167, 'settings_menu', 'Settings Menu - View', 'View, List', 1, '2017-07-18 22:33:18', NULL, 'mozaebook'),
(168, 'settings_menu/manage', 'Settings Menu - Manage', 'Create, Update, Delete', 1, '2017-07-18 22:33:19', NULL, 'mozaebook'),
(169, 'home', 'Home - View', 'View, List', 1, '2017-07-18 22:33:38', NULL, 'mozaebook'),
(170, 'home/manage', 'Home - Manage', 'Create, Update, Delete', 1, '2017-07-18 22:33:38', NULL, 'mozaebook'),
(171, 'home', 'Home - View', 'View, List', 1, '2017-08-02 14:53:41', NULL, 'ebook'),
(172, 'home/manage', 'Home - Manage', 'Create, Update, Delete', 1, '2017-08-02 14:53:41', NULL, 'ebook'),
(173, 'book', 'Book - View', 'View, List', 1, '2017-08-02 14:53:53', NULL, 'ebook'),
(174, 'book/manage', 'Book - Manage', 'Create, Update, Delete', 1, '2017-08-02 14:53:53', NULL, 'ebook');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_banner` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  `description` text,
  `attachment` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL COMMENT 'classic/file',
  `view_count` int(11) DEFAULT '0',
  `like_count` int(11) DEFAULT '0',
  `is_feature` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `image`, `image_banner`, `title`, `author`, `publisher`, `category_id`, `description`, `attachment`, `type`, `view_count`, `like_count`, `is_feature`, `is_active`, `created_date`, `modified_date`, `application_id`) VALUES
(2, '1527176820684_book_image.jpg', '1527176820741_book_image_banner.jpg', 'Grimms_Fairy_Tales', 'Jacob Ludwig Carl Grimm, Wilhelm Carl Grimm', 'Anastasia', '4', 'Truyện kể gia đình cho trẻ em là một tập hợp các truyện cổ tích tiếng Đức lần đầu tiên được xuất bản năm 1812 bởi Anh em nhà Grimm, Jacob và Wilhelm. Bộ truyện này thường được biết tới là Truyện cổ tích Grimm', '1527242920840_book_attachment.pdf', 'ebook', 16, 0, 1, 1, '2017-06-30 04:12:35', '2018-05-25 05:08:40', 'ebook'),
(3, '1527177064752_book_image.jpg', '1527177064865_book_image_banner.jpg', 'Homer_The_Odyssey', 'Homer', 'Hjkoe', '5', 'Odýsseia, sử thi nổi tiếng của Hy Lạp, thường được coi là sáng tạo của Homer. Odýsseia kể lại hành trình trở về quê hương của Odysseus sau khi hạ thành Troia.', '152717706441_book_attachment.epub', 'ebook', 51, 0, 1, 1, '2017-06-30 04:21:55', '2018-05-24 10:51:04', 'ebook'),
(4, '1527177536207_book_image.jpg', '1527177536748_book_image_banner.jpg', 'How to Study 7th Edition', 'Ron Fry', 'sansan', ',5,1,2,4,', 'It is 1984. The world is in a state of perpetual war and Big Brother sees and controls all. Winston Smith, a member of the Outer Party and propaganda-writer at the Ministry of Truth, is keeping a journal he should not be keeping and falling in love with Julia, a woman he should not be seeing. Outwardly compliant, Winston dreams of rebellion against the oppressive Big Brother, risking everything to recover his lost sense of individuality and control of his own future. One of the bestselling books of the twentieth century, 1984 is the dystopian classic that introduced such Orwellian terms as ‘Big Brother,’ ‘doublethink,’ ‘Newspeak,’ and ‘thoughtcrime’ to the collective consciousness, giving official terminology to state-sanctioned deception, surveillance, and historical revisionism.', '1527177536956_book_attachment.pdf', 'ebook', 28, 0, 1, 1, '2017-07-17 22:51:32', '2018-05-24 10:58:56', 'ebook'),
(5, '1527177901679_book_image.jpg', '152717790141_book_image_banner.jpg', 'Nathaniel Hawthorne The Scarlet Letter', 'Nathaniel Hawthorne', 'Ticknor and Fields', '4', 'The Scarlet Letter (Tạm dịch: Chữ A màu đỏ hay Nét chữ màu đỏ) là một cuốn tiểu thuyết xuất bản năm 1850 của Nathaniel Hawthorne và được xem là một kiệt tác của ông. Lấy bối cảnh thành phố Boston thế kỷ 17, tiểu thuyết kể về Hester Prynne, một phụ nữ trẻ đẹp bị buộc phải mang mẫu tự "A" (viết tắt của Adultery nghĩa là ngoại tình) màu đỏ thắm thêu trên ngực áo suốt đời vì bị khép vào tội ngoại tình - một tội mà xã hội thời bấy giờ kết án hết sức nghiêm khắc – tử hình nếu không có yếu tố khoan dung. Xuyên suốt tác phẩm, Hawthorne đề cập đến tội lỗi, hình phạt và sự khoan dung.', '1527177901471_book_attachment.epub', 'ebook', 7, 0, 1, 1, '2017-07-17 23:14:26', '2018-05-24 11:05:01', 'ebook'),
(7, '152724397718_book_image.jpg', '1527243977311_book_image_banner.jpg', 'Harry Potter', ' J. K. Rowling', '	Bloomsbury Publishing (Anh Quốc) Scholastic (Hoa Kỳ) Nhà xuất bản Trẻ (Việt Nam)', ',1,2,4,', 'Harry Potter\r\nalt = Logo của Harry Potter, được sử dụng trong các bản in của bộ tiểu thuyết và trên phim sau này\r\nLogo của Harry Potter, được sử dụng lần đầu trong các bản in của Mỹ của loạt tiểu thuyết và sau này được sử dụng trong phim\r\nHarry Potter and the Philosopher''s Stone (1997)\r\nHarry Potter and the Chamber of Secrets (1998)\r\nHarry Potter and the Prisoner of Azkaban (1999)\r\nHarry Potter and the Goblet of Fire (2000)\r\nHarry Potter and the Order of the Phoenix (2003)\r\nHarry Potter and the Half-Blood Prince (2005)\r\nHarry Potter and the Deathly Hallows (2007)\r\nTác giả	Anh J. K. Rowling\r\nNgười dịch	Việt Nam Lý Lan\r\nQuốc gia	Vương quốc Anh\r\nNgôn ngữ	Tiếng Anh\r\nThể loại	Giả tưởng, kịch, hư cấu giai đoạn tuổi mới lớn, huyền bí, giật gân\r\nNhà xuất bản	Bloomsbury Publishing (Anh Quốc)\r\nScholastic (Hoa Kỳ)\r\nNhà xuất bản Trẻ (Việt Nam)\r\nNgày phát hành	26 tháng 6, 1997 – 21 tháng 7, 2007 (xuất bản lần đầu)\r\nTháng 9, 2000 – 27 tháng 10, 2007 (xuất bản lần đầu tại Việt Nam)\r\nKiểu sách	\r\nẤn bản (bìa cứng và bìa mềm)\r\nAudiobook\r\nE-book (tính đến tháng 3 năm 2012)\r\nSố tập	7\r\nTrang web	www.pottermore.com\r\nHarry Potter là tên của bộ truyện (gồm bảy phần) của nữ nhà văn nước Anh J. K. Rowling. Bộ truyện viết về những cuộc phiêu lưu phù thủy của cậu bé Harry Potter và những người bạn Ronald Weasley, Hermione Granger, lấy bối cảnh tại Trường Phù thủy và Pháp sư Hogwarts nước Anh. Những cuộc phiêu lưu tập trung vào cuộc chiến của Harry Potter trong việc chống lại tên Chúa tể hắc ám Voldemort - người có tham vọng muốn trở nên bất tử, thống trị thế giới phù thủy, nô dịch hóa những người phi ', '1527243977345_book_attachment.pdf', 'ebook', 17, 0, 1, 1, '2017-07-18 02:36:01', '2018-05-29 20:51:18', 'ebook'),
(8, '1527211262851_book_image.jpg', '1527211262408_book_image_banner.jpg', 'Siddhartha Hermann Hesse', 'Hermann Hesse', 'New Directions (U.S.)', ',2,', 'Siddhartha\r\nVorzugsausgabe der Erstauflage von 1922, Originalverlagseinband.JPG\r\nFirst edition cover\r\nAuthor	Hermann Hesse\r\nTranslator	Hilda Rosner\r\nCountry	Germany\r\nLanguage	German\r\nPublisher	New Directions (U.S.)\r\nPublication date\r\n1922, 1951 (U.S.)\r\nMedia type	Print (paperback)\r\nPages	152\r\nOCLC	9766655\r\nDewey Decimal\r\n833.912\r\nSiddhartha is a novel by Hermann Hesse that deals with the spiritual journey of self-discovery of a man named Siddhartha during the time of the Gautama Buddha. The book, Hesse''s ninth novel, was written in German, in a simple, lyrical style. It was published in the U.S. in 1951 and became influential during the 1960s. Hesse dedicated the first part of it to Romain Rolland[1] and the second part to Wilhelm Gundert, his cousin.\r\n\r\nThe word Siddhartha is made up of two words in Sanskrit language, siddha (achieved) + artha (what was searched for), which together means "he who has found meaning (of existence)" or "he who has attained his goals".[2] In fact, the Buddha''s own name, before his renunciation, was Siddhartha Gautama, Prince of Kapilavastu. In this book, the Buddha is referred to as ', '1527211262492_book_attachment.epub', 'ebook', 15, 0, 1, 1, '2017-07-18 02:46:13', '2018-05-24 20:21:02', 'ebook'),
(9, '1527211415529_book_image.jpg', '1527211415482_book_image_banner.jpg', 'Venus in Furs by Ritter von Leopold Sacher Masoch', 'Leopold von Sacher-Masoch', '', NULL, '\r\nVenus in Furs\r\nAuthor	Leopold von Sacher-Masoch\r\nCountry	Austria\r\nLanguage	German\r\nPublication date\r\n1870\r\n\r\nFanny Pistor (in furs, with whip) and Sacher-Masoch\r\n\r\nThe Titian painting Venus with a Mirror, from which Severin gets the idea of Venus in furs.\r\nVenus in Furs (German: Venus im Pelz) is a novella by the Austrian author Leopold von Sacher-Masoch, and the best known of his works. The novel was to be part of an epic series that Sacher-Masoch envisioned called Legacy of Cain. Venus in Furs was part of Love, the first volume of the series. It was published in 1870.', '1527211415277_book_attachment.epub', 'ebook', 36, 0, 1, 1, '2018-03-05 19:12:18', '2018-05-24 20:23:35', NULL),
(10, '1527211543865_book_image.jpg', '1527211543755_book_image_banner.jpg', 'The dictionary of dreams 10 000 dreams interpreted', 'Gustavus Hindman Miller', 'Conoxon SRA ', NULL, '"Interpretation of Dreams" redirects here. For other uses, see Interpretation of dreams (disambiguation).\r\nThe Interpretation of Dreams\r\nDie Traumdeutung (Congress scan).jpg\r\nTitle page of the original German edition\r\nAuthor	Sigmund Freud\r\nOriginal title	Die Traumdeutung\r\nTranslators	A. A. Brill (first version)\r\nJames Strachey (authorized version)\r\nJoyce Crick (most recent version)\r\nCountry	Austria\r\nLanguage	German\r\nSubject	Dream interpretation\r\nPublisher	Franz Deuticke, Leipzig & Vienna\r\nPublication date\r\nNovember 4, 1899\r\n(dated 1900)\r\nPublished in English\r\n1913 (Macmillan, translation of the German third edition)\r\nMedia type	Print\r\nPart of a series of articles on\r\nPsychoanalysis\r\nFreud''s couch, London, 2004 (2).jpeg\r\nConcepts[show]\r\nImportant figures[show]\r\nImportant works[hide]\r\nThe Interpretation of Dreams (1899)\r\nThe Psychopathology of Everyday Life (1901)\r\nThree Essays on the Theory\r\nof Sexuality (1905)\r\nBeyond the Pleasure Principle (1920)\r\nThe Ego and the Id (1923)\r\nSchools of thought[show]\r\nTraining[show]\r\nPsi2.svg Psychology portal\r\nv t e\r\nThe Interpretation of Dreams (German: Die Traumdeutung) is an 1899 book by the psychoanalyst Sigmund Freud, in which the author introduces his theory of the unconscious with respect to dream interpretation, and discusses what would later become the theory of the Oedipus complex. Freud revised the book at least eight times and, in the third edition, added an extensive section which treated dream symbolism very literally, following the influence of Wilhelm Stekel. Freud said of this work, "Insight such as this falls to one''s lot but once in a lifetime."[1]\r\n\r\nThe book was first published in an edition of 600 copies, which did not sell out for eight years. The Interpretation of Dreams later gained in popularity, and seven more editions were published in Freud''s lifetime.[2]\r\n\r\nBecause of the book''s length and complexity, Freud also wrote an abridged version called On Dreams. The original text is widely regarded as one of Freud''s most significant works.', '1527211543740_book_attachment.pdf', 'ebook', 22, 0, 1, 1, '2018-03-05 19:13:54', '2018-05-24 20:25:43', NULL),
(11, '1527440724241_book_image.jpg', '1527440724733_book_image_banner.jpg', 'Lớn Lên Trên Đảo Vắng', 'Johann Wyss', '123', NULL, 'GIA ĐÌNH TÔI, GIÔ-DÉP XTÁC – CHÚNG TÔI LÊN ĐƯỜNG SANG CHÂU MỸ – BÃO TÁP – TRÊN CHIẾC TÀU BỊ NẠN – NHỮNG CHIẾC PHAO BƠI KIỂU MỚI – LẦN THĂM DÒ THỨ NHẤT TRÊN TÀU – CHIẾC THUYỀN CHẬU.', '1527440724667_book_attachment.epub', 'ebook', 15, 0, 1, 1, '2018-05-27 12:05:24', NULL, NULL),
(12, '1527575853845_book_image.jpg', '1527575853308_book_image_banner.jpg', 'Epub example', 'Author', 'Publesher', NULL, 'Epub example', '1527576032714_book_attachment.epub', 'ebook', 42, 0, 1, 1, '2018-05-29 01:35:24', '2018-05-29 01:40:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book_bookmark`
--

CREATE TABLE IF NOT EXISTS `book_bookmark` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `chapter_id` int(11) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `book_chapter`
--

CREATE TABLE IF NOT EXISTS `book_chapter` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `book_id` int(11) NOT NULL,
  `chapter_number` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL COMMENT 'classic/file',
  `content` text,
  `is_active` tinyint(1) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book_chapter`
--

INSERT INTO `book_chapter` (`id`, `image`, `book_id`, `chapter_number`, `title`, `attachment`, `type`, `content`, `is_active`, `created_date`, `modified_date`, `application_id`) VALUES
(5, '1527243273120_book_chapter_image.jpg', 4, 1, 'How to Study 7th Edition', '1527243273719_book_chapter_attachment.pdf', 'pdf', '<p><span style="background-color:rgb(251, 252, 253); font-family:open sans,sans-serif; font-size:14px">One of the bestselling books of the twentieth century</span></p>\r\n', 1, '2017-07-17 23:07:52', '2018-05-25 05:14:33', 'ebook'),
(7, '1527243407481_book_chapter_image.jpg', 5, 1, 'The Scarlet Letter', '1527243451328_book_chapter_attachment.pdf', 'pdf', '<p>They were four of the greatest minds in the Universe: Two men and two women, all Psionic Primes, lost in an experimental spaceship billions of parsecs from home.&nbsp;</p>\r\n', 1, '2017-07-17 23:23:23', '2018-05-25 05:18:09', 'ebook'),
(10, '1520302329734_book_chapter_image.png', 7, 1, 'Hòn đá phù thủy', '152764395075_book_chapter_attachment.epub', 'epub', '<p><span style="background-color:rgb(251, 252, 253); font-family:open sans,sans-serif; font-size:14px">This is the Most Popular Punjabi Animation Video.This is the Biggest Hit Punjabi Animation Show.&nbsp;</span><span style="color:rgba(0, 0, 0, 0.87); font-family:roboto,sans-serif; font-size:15px">With magnificent ingenuity, Cervantes tells us the story about the adventures of an impoverished nobleman, who lives in a dream world of honourable knights, and his faithful armour bearer Sancho Panza. L</span></p>\r\n', 1, '2017-07-18 02:37:35', '2018-05-30 02:14:28', 'ebook'),
(12, '1527244107962_book_chapter_image.jpg', 8, 1, 'Siddhartha Hermann Hesse', '1527643201937_book_chapter_attachment.epub', 'epub', '<table class="infobox" style="background-color:rgb(249, 249, 249); border-spacing:5px; border:1px solid rgb(170, 170, 170); clear:right; color:black; float:right; font-family:sans-serif; font-size:0.88em; line-height:1.25em; margin:5px 0px 5px 10px; max-width:320px; min-width:294px; width:22em; word-wrap:break-word">\r\n	<tbody>\r\n		<tr>\r\n			<th colspan="2" style="text-align:center; vertical-align:middle">Siddhartha</th>\r\n		</tr>\r\n		<tr>\r\n			<td colspan="2" style="text-align:center; vertical-align:top"><a class="image" href="https://vi.wikipedia.org/wiki/T%E1%BA%ADp_tin:Siddhartha_Novel.jpg" style="text-decoration-line: none; color: rgb(11, 0, 128); background: none;"><img alt="Siddhartha Novel.jpg" src="https://upload.wikimedia.org/wikipedia/vi/thumb/c/cb/Siddhartha_Novel.jpg/150px-Siddhartha_Novel.jpg" style="border-style:initial; border-width:0px; height:254px; vertical-align:middle; width:150px" /></a></td>\r\n		</tr>\r\n		<tr>\r\n			<th colspan="2" style="text-align:center; vertical-align:super">Th&ocirc;ng tin s&aacute;ch</th>\r\n		</tr>\r\n		<tr>\r\n			<th scope="row" style="text-align:left; vertical-align:top; width:8em">T&aacute;c giả</th>\r\n			<td style="vertical-align:top">Hermann Hesse</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope="row" style="text-align:left; vertical-align:top; width:8em">Quốc gia</th>\r\n			<td style="vertical-align:top"><a href="https://vi.wikipedia.org/wiki/%C4%90%E1%BB%A9c" style="text-decoration-line: none; color: rgb(11, 0, 128); background: none;" title="Đức">Đức</a></td>\r\n		</tr>\r\n		<tr>\r\n			<th scope="row" style="text-align:left; vertical-align:top; width:8em">Ng&ocirc;n ngữ</th>\r\n			<td style="vertical-align:top"><a href="https://vi.wikipedia.org/wiki/Ti%E1%BA%BFng_%C4%90%E1%BB%A9c" style="text-decoration-line: none; color: rgb(11, 0, 128); background: none;" title="Tiếng Đức">tiếng Đức</a></td>\r\n		</tr>\r\n		<tr>\r\n			<th scope="row" style="text-align:left; vertical-align:top; width:8em">Thể loại</th>\r\n			<td style="vertical-align:top">Allegorical buddha</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope="row" style="text-align:left; vertical-align:top; width:8em">Nh&agrave; xuất bản</th>\r\n			<td style="vertical-align:top">Bantam Books</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope="row" style="text-align:left; vertical-align:top; width:8em">Ng&agrave;y ph&aacute;t h&agrave;nh</th>\r\n			<td style="vertical-align:top">1922, 1951 (Hoa Kỳ)</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope="row" style="text-align:left; vertical-align:top; width:8em">Kiểu s&aacute;ch</th>\r\n			<td style="vertical-align:top">Print (<a class="new" href="https://vi.wikipedia.org/w/index.php?title=Paperback&amp;action=edit&amp;redlink=1" style="text-decoration-line: none; color: rgb(165, 88, 88); background: none;" title="Paperback (trang chưa được viết)">Paperback</a>)</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope="row" style="text-align:left; vertical-align:top; width:8em">Số trang</th>\r\n			<td style="vertical-align:top">152</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope="row" style="text-align:left; vertical-align:top; width:8em"><a href="https://vi.wikipedia.org/wiki/ISBN" style="text-decoration-line: none; color: rgb(11, 0, 128); background: none;" title="ISBN">ISBN</a></th>\r\n			<td style="vertical-align:top"><a href="https://vi.wikipedia.org/wiki/%C4%90%E1%BA%B7c_bi%E1%BB%87t:Ngu%E1%BB%93n_s%C3%A1ch/0-553-20884-5" style="text-decoration-line: none; color: rgb(11, 0, 128); background: none;" title="Đặc biệt:Nguồn sách/0-553-20884-5">0-553-20884-5</a></td>\r\n		</tr>\r\n		<tr>\r\n			<th colspan="2" style="text-align:center; vertical-align:super">Bản tiếng Việt</th>\r\n		</tr>\r\n		<tr>\r\n			<th scope="row" style="text-align:left; vertical-align:top; width:8em">Người dịch</th>\r\n			<td style="vertical-align:top">Ph&ugrave;ng Kh&aacute;nh &amp; Ph&ugrave;ng Thăng</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>Siddhartha</strong>, hay&nbsp;<strong>Tất Đạt Đa</strong>&nbsp;được bi&ecirc;n dịch sang&nbsp;<a href="https://vi.wikipedia.org/wiki/Ti%E1%BA%BFng_Vi%E1%BB%87t" style="text-decoration-line: none; color: rgb(11, 0, 128); background: none;" title="Tiếng Việt">tiếng Việt</a>&nbsp;với tựa đề&nbsp;<strong>C&acirc;u chuyện d&ograve;ng s&ocirc;ng</strong>&nbsp;l&agrave; một cuốn&nbsp;<a href="https://vi.wikipedia.org/wiki/Ti%E1%BB%83u_thuy%E1%BA%BFt" style="text-decoration-line: none; color: rgb(11, 0, 128); background: none;" title="Tiểu thuyết">tiểu thuyết</a>mang t&iacute;nh&nbsp;<a class="new" href="https://vi.wikipedia.org/w/index.php?title=C%C3%A1ch_ng%C3%B4n&amp;action=edit&amp;redlink=1" style="text-decoration-line: none; color: rgb(165, 88, 88); background: none;" title="Cách ngôn (trang chưa được viết)">c&aacute;ch ng&ocirc;n</a>&nbsp;của&nbsp;<a href="https://vi.wikipedia.org/wiki/Hermann_Hesse" style="text-decoration-line: none; color: rgb(11, 0, 128); background: none;" title="Hermann Hesse">Hermann Hesse</a>&nbsp;kể về h&agrave;nh tr&igrave;nh t&acirc;m linh của một người&nbsp;<a href="https://vi.wikipedia.org/wiki/%E1%BA%A4n_%C4%90%E1%BB%99" style="text-decoration-line: none; color: rgb(11, 0, 128); background: none;" title="Ấn Độ">Ấn Độ</a>&nbsp;t&ecirc;n l&agrave; Siddhartha trong thời đại của&nbsp;<a href="https://vi.wikipedia.org/wiki/T%E1%BA%A5t-%C4%91%E1%BA%A1t-%C4%91a_C%E1%BB%93-%C4%91%C3%A0m" style="text-decoration-line: none; color: rgb(11, 0, 128); background: none;" title="Tất-đạt-đa Cồ-đàm">Tất-đạt-đa Cồ-đ&agrave;m</a>.</p>\r\n\r\n<p>Cuốn s&aacute;ch, tiểu thuyết thứ ch&iacute;n của Hesse, được viết bằng&nbsp;<a href="https://vi.wikipedia.org/wiki/Ti%E1%BA%BFng_%C4%90%E1%BB%A9c" style="text-decoration-line: none; color: rgb(11, 0, 128); background: none;" title="Tiếng Đức">tiếng Đức</a>, trong một ng&ocirc;n ngữ đơn giản nhưng c&oacute; vần điệu. S&aacute;ch được xuất bản lần đầu ti&ecirc;n v&agrave;o năm&nbsp;<a href="https://vi.wikipedia.org/wiki/1922" style="text-decoration-line: none; color: rgb(11, 0, 128); background: none;" title="1922">1922</a>, sau khi Hesse trải qua một thời gian ở Ấn Độ trong&nbsp;<a href="https://vi.wikipedia.org/wiki/Th%E1%BA%ADp_ni%C3%AAn_1910" style="text-decoration-line: none; color: rgb(11, 0, 128); background: none;" title="Thập niên 1910">thập ni&ecirc;n 1910</a>. S&aacute;ch được xuất bản ở Mỹ năm 1951 v&agrave; trở n&ecirc;n c&oacute; ảnh hưởng lớn v&agrave;o&nbsp;<a href="https://vi.wikipedia.org/wiki/Th%E1%BA%ADp_ni%C3%AAn_1960" style="text-decoration-line: none; color: rgb(11, 0, 128); background: none;" title="Thập niên 1960">thập ni&ecirc;n 1960</a>.</p>\r\n\r\n<p>&quot;Siddhartha&quot; nghĩa l&agrave; &quot;người đ&atilde; đạt được những mục đ&iacute;ch của m&igrave;nh&quot; hoặc &quot;anh ta l&agrave; người chiến thắng.&quot; T&ecirc;n của&nbsp;<a href="https://vi.wikipedia.org/wiki/Ph%E1%BA%ADt" style="text-decoration-line: none; color: rgb(11, 0, 128); background: none;" title="Phật">Phật</a>, trước khi xuất gia, l&agrave; Ho&agrave;ng tử Siddhartha Gautama (<em>Tất Đạt Đa Cồ Đ&agrave;m</em>). Nh&acirc;n vật ch&iacute;nh Siddhartha trong cuốn s&aacute;ch kh&ocirc;ng phải l&agrave; Phật, m&agrave; Phật Th&iacute;ch Ca trong cuốn s&aacute;ch n&agrave;y được Hesse gọi l&agrave; &quot;Gotama&quot; (<em>Cồ Đ&agrave;m</em>).</p>\r\n\r\n<p>Cuốn s&aacute;ch kể lại chuyện xảy ra ở&nbsp;<a href="https://vi.wikipedia.org/wiki/%E1%BA%A4n_%C4%90%E1%BB%99" style="text-decoration-line: none; color: rgb(11, 0, 128); background: none;" title="Ấn Độ">Ấn Độ</a>&nbsp;v&agrave;o thời cổ đại v&agrave;o khoảng thời gian của Phật (<a class="new" href="https://vi.wikipedia.org/w/index.php?title=Th%E1%BA%BF_k%E1%BB%B7_th%E1%BB%A9_6_TCN&amp;action=edit&amp;redlink=1" style="text-decoration-line: none; color: rgb(165, 88, 88); background: none;" title="Thế kỷ thứ 6 TCN (trang chưa được viết)">thế kỷ thứ 6 TCN</a>). Truyện bắt đầu khi Siddhartha, con của một&nbsp;<a href="https://vi.wikipedia.org/wiki/B%C3%A0-la-m%C3%B4n" style="text-decoration-line: none; color: rgb(11, 0, 128); background: none;" title="Bà-la-môn">Brahmin</a>, bỏ nh&agrave; ra đi để tham gia những nh&agrave; tu khổ hạnh c&ugrave;ng với người bạn th&acirc;n l&agrave; Govinda. Cả hai đều ra đi để t&igrave;m&nbsp;<a href="https://vi.wikipedia.org/wiki/Gi%C3%A1c_ng%E1%BB%99" style="text-decoration-line: none; color: rgb(11, 0, 128); background: none;" title="Giác ngộ">sự khai s&aacute;ng</a>. Siddhartha đ&atilde; đi qua một chuỗi c&aacute;c thay đổi v&agrave; tự nhận thức khi anh cố gắng đạt&nbsp;</p>\r\n', 1, '2017-07-18 02:48:13', '2018-05-29 20:20:01', 'ebook'),
(17, '152724268469_book_chapter_image.png', 2, 1, 'Chapter 1', '1527642916107_book_chapter_attachment.epub', 'epub', '<p><span style="background-color:rgb(251, 252, 253); font-family:open sans,sans-serif; font-size:14px">Hidden reality is present in every day in the human society. Cognition of its secrets helps a human not only to gain experience of existence in this world but to make a step in studying of his own essence&hellip;</span></p>\r\n', 1, '2017-07-18 05:49:36', '2018-05-29 20:15:16', 'ebook'),
(18, '1527243102951_book_chapter_image.jpg', 3, 1, 'The Odyssey', '1527243102914_book_chapter_attachment.pdf', 'pdf', '<p><span style="background-color:rgb(251, 252, 253)">Three captivating stories of this book: &ldquo;Duty&rdquo;, &ldquo;Everything is so simple&rdquo; and &ldquo;Birds and a stone&rdquo; tell about unusual people who reconsider their life values.</span></p>\r\n', 1, '2017-07-18 05:57:14', '2018-05-25 05:11:42', 'ebook'),
(20, '1527244273873_book_chapter_image.jpg', 9, 1, 'Leopold von Sacher Venus in Furs', '1527244273322_book_chapter_attachment.pdf', 'pdf', '<p><em><strong>Venus in Furs</strong></em><span style="color:rgb(34, 34, 34); font-family:sans-serif; font-size:14px">&nbsp;(German:&nbsp;</span><em>Venus im Pelz</em><span style="color:rgb(34, 34, 34); font-family:sans-serif; font-size:14px">) is a&nbsp;</span><a href="https://en.wikipedia.org/wiki/Novella" style="text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;" title="Novella">novella</a><span style="color:rgb(34, 34, 34); font-family:sans-serif; font-size:14px">&nbsp;by the Austrian author&nbsp;</span><a href="https://en.wikipedia.org/wiki/Leopold_von_Sacher-Masoch" style="text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;" title="Leopold von Sacher-Masoch">Leopold von Sacher-Masoch</a><span style="color:rgb(34, 34, 34); font-family:sans-serif; font-size:14px">, and the best known of his works. The novel was to be part of an epic series that Sacher-Masoch envisioned called&nbsp;</span><em><a href="https://en.wikipedia.org/wiki/Legacy_of_Cain" style="text-decoration-line: none; color: rgb(11, 0, 128); background: none;" title="Legacy of Cain">Legacy of Cain</a></em><span style="color:rgb(34, 34, 34); font-family:sans-serif; font-size:14px">.&nbsp;</span><em>Venus in Furs</em><span style="color:rgb(34, 34, 34); font-family:sans-serif; font-size:14px">was part of&nbsp;</span><em>Love</em><span style="color:rgb(34, 34, 34); font-family:sans-serif; font-size:14px">, the first volume of the series. It was published in 1870</span></p>\r\n', 1, '2018-03-05 19:15:11', '2018-05-25 05:31:13', NULL),
(23, '1527244452838_book_chapter_image.jpg', 10, 1, 'Ten Thousand dreams', '1527244452908_book_chapter_attachment.pdf', 'pdf', '<p><span style="color:rgba(0, 0, 0, 0.87); font-family:roboto,sans-serif; font-size:15px">With magnificent ingenuity, Cervantes tells us the story about the adventures of an impoverished nobleman, who lives in a dream world of honourable knights, and his faithful armour bearer Sancho Panza. L</span></p>\r\n', 1, '2018-03-05 20:05:42', '2018-05-25 05:34:12', NULL),
(28, '1527441337349_book_chapter_image.jpg', 11, 13, 'Lhttp://epub.ebookfull.net/wp-content/data/images/2242-lon-len-tren-dao-vang.jpg', '1527441337372_book_chapter_attachment.epub', 'epub', '<p>123</p>\r\n', 1, '2018-05-27 12:15:37', NULL, NULL),
(29, '1527575911392_book_chapter_image.jpg', 12, 1, 'Epub book', '1527575911457_book_chapter_attachment.epub', 'epub', '<p>Описание</p>\r\n', 1, '2018-05-29 01:38:31', '2018-05-29 01:41:04', NULL),
(30, NULL, 7, NULL, 'Harry Potter Và Hòn Đá Phù Thủy', '1527645126999_book_chapter_attachment.pdf', 'pdf', '<p>Harry Potter V&agrave; H&ograve;n Đ&aacute; Ph&ugrave; Thủy PDF</p>\r\n', 1, '2018-05-29 20:52:06', '2018-05-29 20:58:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book_comment`
--

CREATE TABLE IF NOT EXISTS `book_comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `book_id` int(11) NOT NULL,
  `chapter_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `content` varchar(250) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book_comment`
--

INSERT INTO `book_comment` (`id`, `user_id`, `book_id`, `chapter_id`, `name`, `content`, `is_active`, `created_date`, `modified_date`) VALUES
(7, NULL, 2, 17, 'Dangtin', 'Good', 1, '2017-07-24 22:57:28', NULL),
(8, NULL, 2, 17, 'Thuy', 'Error', 1, '2017-07-24 22:58:04', NULL),
(9, NULL, 2, 17, 'Thanh', 'Great', 1, '2017-07-24 22:58:29', NULL),
(14, NULL, 8, 12, 'Dangtin', 'Bad', 1, '2017-08-01 23:13:15', NULL),
(15, NULL, 0, 0, 'Long', 'Good good', 1, '2017-12-15 03:49:36', NULL),
(16, NULL, 0, 0, 'Hahah', 'Great', 1, '2017-12-15 03:49:54', NULL),
(17, NULL, 0, 0, 'Hehe', 'Hay hay', 1, '2017-12-15 03:50:37', NULL),
(18, NULL, 0, 0, 'Hyhy', 'Hoho', 1, '2017-12-15 04:05:41', NULL),
(22, NULL, 9, 20, 'John', 'Good buk', 1, '2018-03-06 02:17:22', NULL),
(23, NULL, 9, 20, 'Skith Kol', 'Gok buk', 1, '2018-03-06 02:26:53', NULL),
(24, NULL, 9, 20, 'Tamani', 'I love this book', 1, '2018-03-06 02:42:39', NULL),
(25, NULL, 9, 20, 'Truong Loti', 'This book is very good for me. And app is very beautiful ', 1, '2018-03-06 02:43:33', NULL),
(26, NULL, 9, 20, 'Amanda ', 'Yeah. Thanks you for free book', 1, '2018-03-06 02:44:18', NULL),
(27, NULL, 9, 20, 'text', 'text', 1, '2018-03-06 22:13:07', NULL),
(30, NULL, 9, 20, 'Smith ', 'I love this buk', 1, '2018-03-08 04:04:08', NULL),
(31, NULL, 9, 20, 'Adam Hok', 'Guk buk', 1, '2018-03-08 04:14:50', NULL),
(33, NULL, 9, 20, 'Hh', 'Nkbkk', 1, '2018-05-28 14:34:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `object_actions`
--

CREATE TABLE IF NOT EXISTS `object_actions` (
  `id` bigint(20) NOT NULL,
  `object_id` varchar(100) NOT NULL,
  `object_type` varchar(100) NOT NULL,
  `name` varchar(2000) DEFAULT NULL,
  `old_content` text,
  `content` text NOT NULL,
  `action` varchar(100) NOT NULL COMMENT 'data:comment,create,update,delete,approve,reject,feedback',
  `is_active` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_user` varchar(100) DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `object_actions`
--

INSERT INTO `object_actions` (`id`, `object_id`, `object_type`, `name`, `old_content`, `content`, `action`, `is_active`, `created_date`, `created_user`, `application_id`) VALUES
(1, '6', 'user', 'UPDATE. Changed fields: is_online, last_logout,', '{"id":6,"code":null,"name":"Ho Xuan Hung","username":"admin","image":"user6_image.png","overview":null,"content":null,"auth_key":"WmzV9waECMlzP_EhXKd4PLw-_sGeMz12","password_hash":"$2y$13$s5yLryk16awaMfDWpiQy7OZbs\\/ueqFKNE7DG5UA6yDbmrGwfL8I7i","password_reset_token":"Nph5RP9UXI9F0I0jITJqUnzxnhobKs2S_1473239211","birth_date":null,"birth_place":null,"gender":null,"identity_card":null,"email":"hung.hoxuan@gmail.com","phone":null,"skype":null,"address":null,"country":null,"city":null,"organization":null,"department":null,"position":null,"start_date":null,"end_date":null,"role":30,"type":null,"status":10,"is_online":1,"last_login":"2017-06-12 00:15:58","last_logout":"2017-06-12 00:15:36","created_at":1473239211,"updated_at":1477291259,"application_id":"trayolo"}', '[["is_online",1,0],["last_logout","2017-06-12 00:15:36","2017-07-01 12:55:19"]]', 'update', 1, '2017-07-01 12:55:22', '6', 'mozaebook'),
(2, '6', 'user', 'UPDATE. Changed fields: is_online, last_login,', '{"id":6,"code":null,"name":"Ho Xuan Hung","username":"admin","image":"user6_image.png","overview":null,"content":null,"auth_key":"WmzV9waECMlzP_EhXKd4PLw-_sGeMz12","password_hash":"$2y$13$s5yLryk16awaMfDWpiQy7OZbs\\/ueqFKNE7DG5UA6yDbmrGwfL8I7i","password_reset_token":"Nph5RP9UXI9F0I0jITJqUnzxnhobKs2S_1473239211","birth_date":null,"birth_place":null,"gender":null,"identity_card":null,"email":"hung.hoxuan@gmail.com","phone":null,"skype":null,"address":null,"country":null,"city":null,"organization":null,"department":null,"position":null,"start_date":null,"end_date":null,"role":30,"type":null,"status":10,"is_online":0,"last_login":"2017-06-12 00:15:58","last_logout":"2017-07-01 12:55:19","created_at":1473239211,"updated_at":1477291259,"application_id":"trayolo"}', '[["is_online",0,1],["last_login","2017-06-12 00:15:58","2017-07-01 12:56:23"]]', 'update', 1, '2017-07-01 12:56:23', '6', 'mozaebook'),
(3, '6', 'user', 'UPDATE. Changed fields: is_online, last_login,', '{"id":6,"code":null,"name":"Ho Xuan Hung","username":"admin","image":"user6_image.png","overview":null,"content":null,"auth_key":"WmzV9waECMlzP_EhXKd4PLw-_sGeMz12","password_hash":"$2y$13$s5yLryk16awaMfDWpiQy7OZbs\\/ueqFKNE7DG5UA6yDbmrGwfL8I7i","password_reset_token":"Nph5RP9UXI9F0I0jITJqUnzxnhobKs2S_1473239211","birth_date":null,"birth_place":null,"gender":null,"identity_card":null,"email":"hung.hoxuan@gmail.com","phone":null,"skype":null,"address":null,"country":null,"city":null,"organization":null,"department":null,"position":null,"start_date":null,"end_date":null,"role":30,"type":null,"status":10,"is_online":0,"last_login":"2017-06-12 00:15:58","last_logout":"2017-07-01 12:55:19","created_at":1473239211,"updated_at":1477291259,"application_id":"trayolo"}', '[["is_online",0,1],["last_login","2017-06-12 00:15:58","2017-07-01 12:56:23"]]', 'update', 1, '2017-07-01 12:56:23', '6', 'mozaebook'),
(4, '54', 'book', 'UPDATE. Changed fields:', '{"id":54,"image":"1467597684.jpg","title":"konutveyapi","author":"hakan","publisher":"emedya","description":"konutve yap\\u0131 gazetesi  say\\u0131 33","attachment":"","type":"classic","category_id":0,"view_count":180,"like_count":null,"is_feature":0,"is_active":1,"created_date":null,"modified_date":"2017-06-30 12:04:57"}', '[]', 'update', 1, '2017-07-01 07:05:34', '6', 'mozaebook'),
(5, '54', 'book', 'UPDATE. Changed fields:', '{"id":54,"image":"1467597684.jpg","title":"konutveyapi","author":"hakan","publisher":"emedya","description":"konutve yap\\u0131 gazetesi  say\\u0131 33","attachment":"","type":"classic","category_id":0,"view_count":180,"like_count":null,"is_feature":0,"is_active":1,"created_date":null,"modified_date":"2017-06-30 12:04:57"}', '[]', 'update', 1, '2017-07-01 07:05:54', '6', 'mozaebook'),
(6, '6', 'user', 'UPDATE. Changed fields: last_login,', '{"id":6,"code":null,"name":"Ho Xuan Hung","username":"admin","image":"user6_image.png","overview":null,"content":null,"auth_key":"WmzV9waECMlzP_EhXKd4PLw-_sGeMz12","password_hash":"$2y$13$s5yLryk16awaMfDWpiQy7OZbs\\/ueqFKNE7DG5UA6yDbmrGwfL8I7i","password_reset_token":"Nph5RP9UXI9F0I0jITJqUnzxnhobKs2S_1473239211","birth_date":null,"birth_place":null,"gender":null,"identity_card":null,"email":"hung.hoxuan@gmail.com","phone":null,"skype":null,"address":null,"country":null,"city":null,"organization":null,"department":null,"position":null,"start_date":null,"end_date":null,"role":30,"type":null,"status":10,"is_online":1,"last_login":"2017-07-01 12:56:23","last_logout":"2017-07-01 12:55:19","created_at":1473239211,"updated_at":1477291259,"application_id":"trayolo"}', '[["last_login","2017-07-01 12:56:23","2017-07-01 09:57:28"]]', 'update', 1, '2017-07-01 09:57:28', '6', 'mozaebook'),
(7, '6', 'user', 'UPDATE. Changed fields: last_login,', '{"id":6,"code":null,"name":"Ho Xuan Hung","username":"admin","image":"user6_image.png","overview":null,"content":null,"auth_key":"WmzV9waECMlzP_EhXKd4PLw-_sGeMz12","password_hash":"$2y$13$s5yLryk16awaMfDWpiQy7OZbs\\/ueqFKNE7DG5UA6yDbmrGwfL8I7i","password_reset_token":"Nph5RP9UXI9F0I0jITJqUnzxnhobKs2S_1473239211","birth_date":null,"birth_place":null,"gender":null,"identity_card":null,"email":"hung.hoxuan@gmail.com","phone":null,"skype":null,"address":null,"country":null,"city":null,"organization":null,"department":null,"position":null,"start_date":null,"end_date":null,"role":30,"type":null,"status":10,"is_online":1,"last_login":"2017-07-01 09:57:28","last_logout":"2017-07-01 12:55:19","created_at":1473239211,"updated_at":1477291259,"application_id":"trayolo"}', '[["last_login","2017-07-01 09:57:28","2017-07-01 10:00:05"]]', 'update', 1, '2017-07-01 10:00:05', '6', 'mozaebook'),
(8, '54', 'book', 'UPDATE. Changed fields:', '{"id":54,"image":"1467597684.jpg","title":"konutveyapi","author":"hakan","publisher":"emedya","description":"konutve yap\\u0131 gazetesi  say\\u0131 33","attachment":"","type":"classic","category_id":0,"view_count":180,"like_count":null,"is_feature":0,"is_active":1,"created_date":null,"modified_date":"2017-06-30 12:04:57"}', '[]', 'update', 1, '2017-07-01 10:05:25', '6', 'mozaebook'),
(9, '54', 'book', 'UPDATE. Changed fields:', '{"id":54,"image":"1467597684.jpg","title":"konutveyapi","author":"hakan","publisher":"emedya","description":"konutve yap\\u0131 gazetesi  say\\u0131 33","attachment":"","type":"classic","category_id":0,"view_count":180,"like_count":null,"is_feature":0,"is_active":1,"created_date":null,"modified_date":"2017-06-30 12:04:57"}', '[]', 'update', 1, '2017-07-01 10:06:33', '6', 'mozaebook'),
(10, '22', 'book', 'UPDATE. Changed fields: category_id,', '{"id":22,"image":"1426909805.jpeg","title":"Stuff My Stocking: M\\/M Romance Stories that are Nice and\\u2026 Naughty","author":"Varivous","publisher":"Diane W. Jason B. Kathy H.","description":"","attachment":"","type":"classic","category_id":1,"view_count":3,"like_count":0,"is_feature":0,"is_active":1,"created_date":null,"modified_date":"2017-06-15 05:38:33"}', '[["category_id",1,"2"]]', 'update', 1, '2017-07-01 10:21:52', '6', 'mozaebook'),
(11, '54', 'book', 'UPDATE. Changed fields:', '{"id":54,"image":"1467597684.jpg","title":"konutveyapi","author":"hakan","publisher":"emedya","description":"konutve yap\\u0131 gazetesi  say\\u0131 33","attachment":"","type":"classic","category_id":0,"view_count":180,"like_count":null,"is_feature":0,"is_active":1,"created_date":null,"modified_date":"2017-06-30 12:04:57"}', '[]', 'update', 1, '2017-07-01 10:22:05', '6', 'mozaebook'),
(12, '55', 'book', 'CREATE. Changed fields: id, title, type, category_id, is_feature, is_active, created_date,', '[]', '[["id","",55],["title","","\\u1ee9adfas"],["type","","classic"],["category_id","",",2,"],["is_feature","","0"],["is_active","","0"],["created_date","","2017-07-01 10:22:56"]]', 'create', 1, '2017-07-01 10:22:56', '6', 'mozaebook'),
(13, '55', 'book', 'UPDATE. Changed fields: is_active, modified_date,', '{"id":55,"image":"","title":"\\u1ee9adfas","author":"","publisher":"","description":"","attachment":"","type":"classic","category_id":0,"view_count":null,"like_count":null,"is_feature":0,"is_active":0,"created_date":"2017-07-01 10:22:56","modified_date":null}', '[["is_active",0,"1"],["modified_date",null,"2017-07-01 10:30:21"]]', 'update', 1, '2017-07-01 10:30:21', '6', 'mozaebook'),
(14, '54', 'book', 'UPDATE. Changed fields: category_id,', '{"id":54,"image":"1467597684.jpg","title":"konutveyapi","author":"hakan","publisher":"emedya","description":"konutve yap\\u0131 gazetesi  say\\u0131 33","attachment":"","type":"classic","category_id":0,"view_count":180,"like_count":null,"is_feature":0,"is_active":1,"created_date":null,"modified_date":"2017-06-30 12:04:57"}', '[["category_id",0,"1"]]', 'update', 1, '2017-07-01 10:30:31', '6', 'mozaebook'),
(15, '55', 'book', 'Deleted successful !', '{"id":55,"image":"","title":"\\u1ee9adfas","author":"","publisher":"","description":"","attachment":"","type":"classic","category_id":0,"view_count":null,"like_count":null,"is_feature":0,"is_active":1,"created_date":"2017-07-01 10:22:56","modified_date":"2017-07-01 10:30:21"}', '[]', 'delete', 1, '2017-07-01 10:31:07', '6', 'mozaebook'),
(16, '50', 'book', 'Deleted successful !', '{"id":50,"image":"1448442120.jpg","title":"LOVE SO LIFE","author":"Kouichi Kaede","publisher":"Kouichi Kaede","description":"From Which Scanlations: Shiharu is a high school student who loves kids, lives in an orphanage, and works at a daycare... Until the handsome uncle of two-year-old twins offers her a raise if she''ll be their babysitter. Often relying on memories of her mother''s actions for guidan...","attachment":"1448442120.pdf","type":"3","category_id":null,"view_count":125,"like_count":null,"is_feature":0,"is_active":1,"created_date":null,"modified_date":"2017-06-30 12:05:28"}', '[]', 'delete', 1, '2017-07-01 10:31:07', '6', 'mozaebook'),
(17, '48', 'book', 'Deleted successful !', '{"id":48,"image":"1448440674.jpg","title":"HAIKYU!!","author":"Furudate Haruichi","publisher":"Furudate Haruichi","description":"Hinata Shouyou, upon seeing a volleyball match, is aiming \\r\\nto become \\"The Small Giant\\", and joins his middle school volleyball club.","attachment":"1448440674.epub","type":"classic","category_id":null,"view_count":0,"like_count":0,"is_feature":0,"is_active":1,"created_date":null,"modified_date":"2017-06-29 03:45:03"}', '[]', 'delete', 1, '2017-07-01 10:31:07', '6', 'mozaebook'),
(18, '47', 'book', 'Deleted successful !', '{"id":47,"image":"1448440077.png","title":"Demo 1","author":"ad","publisher":"ad","description":"ad","attachment":"1448440077.epub","type":"2","category_id":null,"view_count":62,"like_count":null,"is_feature":0,"is_active":1,"created_date":null,"modified_date":"2017-06-30 12:05:29"}', '[]', 'delete', 1, '2017-07-01 10:31:07', '6', 'mozaebook'),
(19, '46', 'book', 'Deleted successful !', '{"id":46,"image":"1448440050.jpg","title":"TATE NO YUUSHA NO NARIAGARI","author":"Aneko Yusagi","publisher":"Aneko Yusagi","description":"Iwatani Naofumi is summoned to another world to become one of the four heroes, namely the Shield Hero. Starting out with poor popularity and labeled as the weakest, Naofumi found himself betrayed on the third day of his adventure. Having losing faith and money","attachment":"1448440050.epub","type":"2","category_id":null,"view_count":49,"like_count":null,"is_feature":0,"is_active":1,"created_date":null,"modified_date":"2017-06-30 12:05:29"}', '[]', 'delete', 1, '2017-07-01 10:31:07', '6', 'mozaebook'),
(20, '44', 'book', 'Deleted successful !', '{"id":44,"image":"1442299766.jpg","title":"A Love Story","author":"A Bushman","publisher":"Distributed Proofreaders","description":"The author of these pages considered that a lengthened explanation might be necessary to account for the present work.\\r\\n\\r\\nHe had therefore, at some length, detailed the motives that influenced him in its composition. He had shown that as a solitary companionless bushman, it had been a pleasure to him in his lone evenings\\r\\n\\r\\n\\"To create, and in creating live A being more intense.\\"\\r\\n\\r\\nHe had expatiated on the love he bears his adopted country, and had stated that he was greatly influenced by the hope that although\\r\\n\\r\\n\\"Sparta hath many a worthier son than he,\\"","attachment":"1442299766.epub","type":"ebook","category_id":null,"view_count":0,"like_count":0,"is_feature":0,"is_active":1,"created_date":null,"modified_date":"2017-06-15 06:57:32"}', '[]', 'delete', 1, '2017-07-01 10:31:07', '6', 'mozaebook'),
(21, '23', 'book', 'Deleted successful !', '{"id":23,"image":"1467597710.jpg","title":"Broken By Kathleen Hayes","author":"Obrien, Heather K","publisher":"Kathleen Hayes","description":"","attachment":"1448438782.epub","type":"classic","category_id":null,"view_count":1,"like_count":0,"is_feature":0,"is_active":1,"created_date":null,"modified_date":"2017-06-29 12:50:27"}', '[]', 'delete', 1, '2017-07-01 10:31:07', '6', 'mozaebook'),
(22, '22', 'book', 'Deleted successful !', '{"id":22,"image":"1426909805.jpeg","title":"Stuff My Stocking: M\\/M Romance Stories that are Nice and\\u2026 Naughty","author":"Varivous","publisher":"Diane W. Jason B. Kathy H.","description":"","attachment":"","type":"classic","category_id":2,"view_count":3,"like_count":0,"is_feature":0,"is_active":1,"created_date":null,"modified_date":"2017-06-15 05:38:33"}', '[]', 'delete', 1, '2017-07-01 10:31:07', '6', 'mozaebook'),
(23, '21', 'book', 'Deleted successful !', '{"id":21,"image":"1497492060553_book_image.jpg","title":"My Fairy Tale Ending *Complete*","author":"Lucyheartfillia","publisher":"Lucyheartfillia","description":"","attachment":"1497492060336_book_attachment.png","type":"ebook","category_id":null,"view_count":12,"like_count":0,"is_feature":1,"is_active":1,"created_date":null,"modified_date":"2017-06-15 05:38:08"}', '[]', 'delete', 1, '2017-07-01 10:31:07', '6', 'mozaebook'),
(24, '20', 'book', 'Deleted successful !', '{"id":20,"image":"1497492021547_book_image.jpg","title":"Crime and Punishment","author":"Fyodor Dostoyevsky","publisher":"Constance Garnett","description":"A few words about Dostoevsky himself may help the English reader to understand his work.","attachment":"149864477275_book_attachment.ppk","type":"classic","category_id":0,"view_count":3,"like_count":0,"is_feature":1,"is_active":1,"created_date":null,"modified_date":"2017-06-28 12:12:52"}', '[]', 'delete', 1, '2017-07-01 10:31:07', '6', 'mozaebook'),
(25, '53', 'book', 'UPDATE. Changed fields: category_id,', '{"id":53,"image":"1452777429.jpg","title":"BUSIAD","author":"hakan","publisher":"emedya","description":"Busiad magazine","attachment":"","type":"classic","category_id":null,"view_count":1136,"like_count":1,"is_feature":1,"is_active":1,"created_date":null,"modified_date":"2017-06-30 12:05:23"}', '[["category_id",null,",2,"]]', 'update', 1, '2017-07-01 10:31:18', '6', 'mozaebook'),
(26, '53', 'book', 'UPDATE. Changed fields: category_id,', '{"id":53,"image":"1452777429.jpg","title":"BUSIAD","author":"hakan","publisher":"emedya","description":"Busiad magazine","attachment":"","type":"classic","category_id":0,"view_count":1136,"like_count":1,"is_feature":1,"is_active":1,"created_date":null,"modified_date":"2017-06-30 12:05:23"}', '[["category_id",0,"1"]]', 'update', 1, '2017-07-01 10:32:35', '6', 'mozaebook'),
(27, '56', 'book', 'CREATE. Changed fields: id, title, type, category_id, is_feature, is_active, created_date,', '[]', '[["id","",56],["title","","1234"],["type","","classic"],["category_id","",",1,2,"],["is_feature","","0"],["is_active","","1"],["created_date","","2017-07-01 10:35:22"]]', 'create', 1, '2017-07-01 10:35:24', '6', 'mozaebook'),
(28, '56', 'book', 'UPDATE. Changed fields: modified_date,', '{"id":56,"image":"","title":"1234","author":"","publisher":"","description":"","attachment":"","type":"classic","category_id":0,"view_count":null,"like_count":null,"is_feature":0,"is_active":1,"created_date":"2017-07-01 10:35:22","modified_date":null}', '[["modified_date",null,"2017-07-01 10:43:11"]]', 'update', 1, '2017-07-01 10:43:11', '6', 'mozaebook'),
(29, '56', 'book', 'UPDATE. Changed fields: category_id,', '{"id":56,"image":"","title":"1234","author":"","publisher":"","description":"","attachment":"","type":"classic","category_id":0,"view_count":null,"like_count":null,"is_feature":0,"is_active":1,"created_date":"2017-07-01 10:35:22","modified_date":"2017-07-01 10:43:11"}', '[["category_id",0,"2"]]', 'update', 1, '2017-07-01 10:56:04', '6', 'mozaebook'),
(30, '54', 'book', 'UPDATE. Changed fields: title, category_id,', '{"id":54,"image":"1467597684.jpg","title":"konutveyapi","author":"hakan","publisher":"emedya","description":"konutve yap\\u0131 gazetesi  say\\u0131 33","attachment":"","type":"classic","category_id":1,"view_count":180,"like_count":null,"is_feature":0,"is_active":1,"created_date":null,"modified_date":"2017-06-30 12:04:57"}', '[["title","konutveyapi","123"],["category_id",1,",1,2,"]]', 'update', 1, '2017-07-01 10:57:12', '6', 'mozaebook'),
(31, '54', 'book', 'UPDATE. Changed fields:', '{"id":54,"image":"1467597684.jpg","title":"123","author":"hakan","publisher":"emedya","description":"konutve yap\\u0131 gazetesi  say\\u0131 33","attachment":"","type":"classic","category_id":0,"view_count":180,"like_count":null,"is_feature":0,"is_active":1,"created_date":null,"modified_date":"2017-06-30 12:04:57"}', '[]', 'update', 1, '2017-07-01 10:58:18', '6', 'mozaebook'),
(32, '6', 'user', 'UPDATE. Changed fields: last_login,', '{"id":6,"code":null,"name":"Ho Xuan Hung","username":"admin","image":"user6_image.png","overview":null,"content":null,"auth_key":"WmzV9waECMlzP_EhXKd4PLw-_sGeMz12","password_hash":"$2y$13$s5yLryk16awaMfDWpiQy7OZbs\\/ueqFKNE7DG5UA6yDbmrGwfL8I7i","password_reset_token":"Nph5RP9UXI9F0I0jITJqUnzxnhobKs2S_1473239211","birth_date":null,"birth_place":null,"gender":null,"identity_card":null,"email":"hung.hoxuan@gmail.com","phone":null,"skype":null,"address":null,"country":null,"city":null,"organization":null,"department":null,"position":null,"start_date":null,"end_date":null,"role":30,"type":null,"status":10,"is_online":1,"last_login":"2017-07-01 10:00:05","last_logout":"2017-07-01 12:55:19","created_at":1473239211,"updated_at":1477291259,"application_id":"trayolo"}', '[["last_login","2017-07-01 10:00:05","2017-07-01 11:38:44"]]', 'update', 1, '2017-07-01 11:38:44', '6', 'mozaebook'),
(33, '6', 'user', 'UPDATE. Changed fields: last_login,', '{"id":6,"code":null,"name":"Ho Xuan Hung","username":"admin","image":"user6_image.png","overview":null,"content":null,"auth_key":"WmzV9waECMlzP_EhXKd4PLw-_sGeMz12","password_hash":"$2y$13$s5yLryk16awaMfDWpiQy7OZbs\\/ueqFKNE7DG5UA6yDbmrGwfL8I7i","password_reset_token":"Nph5RP9UXI9F0I0jITJqUnzxnhobKs2S_1473239211","birth_date":null,"birth_place":null,"gender":null,"identity_card":null,"email":"hung.hoxuan@gmail.com","phone":null,"skype":null,"address":null,"country":null,"city":null,"organization":null,"department":null,"position":null,"start_date":null,"end_date":null,"role":30,"type":null,"status":10,"is_online":1,"last_login":"2017-07-01 11:38:44","last_logout":"2017-07-01 12:55:19","created_at":1473239211,"updated_at":1477291259,"application_id":"trayolo"}', '[["last_login","2017-07-01 11:38:44","2017-07-02 20:17:06"]]', 'update', 1, '2017-07-02 20:17:06', '6', 'mozaebook'),
(34, '6', 'user', 'UPDATE. Changed fields: last_login,', '{"id":6,"code":null,"name":"Ho Xuan Hung","username":"admin","image":"user6_image.png","overview":null,"content":null,"auth_key":"WmzV9waECMlzP_EhXKd4PLw-_sGeMz12","password_hash":"$2y$13$s5yLryk16awaMfDWpiQy7OZbs\\/ueqFKNE7DG5UA6yDbmrGwfL8I7i","password_reset_token":"Nph5RP9UXI9F0I0jITJqUnzxnhobKs2S_1473239211","birth_date":null,"birth_place":null,"gender":null,"identity_card":null,"email":"hung.hoxuan@gmail.com","phone":null,"skype":null,"address":null,"country":null,"city":null,"organization":null,"department":null,"position":null,"start_date":null,"end_date":null,"role":30,"type":null,"status":10,"is_online":1,"last_login":"2017-07-02 20:17:06","last_logout":"2017-07-01 12:55:19","created_at":1473239211,"updated_at":1477291259,"application_id":"trayolo"}', '[["last_login","2017-07-02 20:17:06","2017-07-02 20:17:41"]]', 'update', 1, '2017-07-02 20:17:41', '6', 'mozaebook'),
(35, '6', 'user', 'UPDATE. Changed fields: last_login,', '{"id":6,"code":null,"name":"Ho Xuan Hung","username":"admin","image":"user6_image.png","overview":null,"content":null,"auth_key":"WmzV9waECMlzP_EhXKd4PLw-_sGeMz12","password_hash":"$2y$13$s5yLryk16awaMfDWpiQy7OZbs\\/ueqFKNE7DG5UA6yDbmrGwfL8I7i","password_reset_token":"Nph5RP9UXI9F0I0jITJqUnzxnhobKs2S_1473239211","birth_date":null,"birth_place":null,"gender":null,"identity_card":null,"email":"hung.hoxuan@gmail.com","phone":null,"skype":null,"address":null,"country":null,"city":null,"organization":null,"department":null,"position":null,"start_date":null,"end_date":null,"role":30,"type":null,"status":10,"is_online":1,"last_login":"2017-07-02 20:17:06","last_logout":"2017-07-01 12:55:19","created_at":1473239211,"updated_at":1477291259,"application_id":"trayolo"}', '[["last_login","2017-07-02 20:17:06","2017-07-02 20:17:42"]]', 'update', 1, '2017-07-02 20:17:42', '6', 'mozaebook');

-- --------------------------------------------------------

--
-- Table structure for table `object_attributes`
--

CREATE TABLE IF NOT EXISTS `object_attributes` (
  `id` bigint(20) NOT NULL,
  `object_id` int(11) NOT NULL,
  `object_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `application_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `object_category`
--

CREATE TABLE IF NOT EXISTS `object_category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `sort_order` int(5) DEFAULT NULL,
  `is_hot` tinyint(1) DEFAULT NULL,
  `is_top` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `object_type` varchar(50) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `object_category`
--

INSERT INTO `object_category` (`id`, `parent_id`, `image`, `name`, `description`, `sort_order`, `is_hot`, `is_top`, `is_active`, `object_type`, `created_date`, `modified_date`, `application_id`) VALUES
(1, NULL, '1498812479148_object_category_image.jpg', 'Love Book', 'Where do I begin To tell the story Of how greatful love can be The sweet love story That is older than the sea', 1, NULL, NULL, 1, 'book', '2017-06-30 03:47:59', '2017-07-20 23:12:14', 'ebook'),
(2, NULL, '149881268767_object_category_image.jpg', 'Detective Story', 'The detective novel has been around for a long, long, long time. Most of us have read and enjoyed the canon, but now we want something different: a realistic storyline and detectives that feel like real people.', 2, NULL, NULL, 1, 'book', '2017-06-30 03:51:27', '2017-07-20 23:12:20', 'ebook'),
(3, NULL, '1498812937328_object_category_image.jpg', 'Action Book', 'Experience great stories', 3, NULL, NULL, 1, 'book', '2017-06-30 03:55:37', '2017-07-20 23:12:27', 'ebook'),
(4, NULL, '150037596168_object_category_image.jpg', 'Book Chidlren', 'Love Music', 4, NULL, NULL, 1, 'book', '2017-07-18 06:06:01', '2017-07-20 23:12:34', 'ebook'),
(5, NULL, '1520303240841_object_category_image.jpg', 'Technology', '', 5, NULL, NULL, 1, 'book', '2017-12-19 20:31:51', '2018-03-05 20:27:20', 'ebook'),
(6, NULL, '1520303122246_object_category_image.jpg', 'Academic ', '', 6, NULL, NULL, 1, 'book', '2018-03-05 20:25:22', '2018-03-05 20:27:27', NULL),
(7, NULL, '1520303143901_object_category_image.jpg', 'Art', '', 7, NULL, NULL, 1, 'book', '2018-03-05 20:25:43', '2018-03-05 20:27:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `object_change`
--

CREATE TABLE IF NOT EXISTS `object_change` (
  `id` bigint(20) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `object_type` varchar(100) DEFAULT NULL,
  `begin` int(11) DEFAULT NULL,
  `increase` int(11) DEFAULT NULL,
  `decrease` int(11) DEFAULT NULL,
  `end` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_user` varchar(100) DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `object_comment`
--

CREATE TABLE IF NOT EXISTS `object_comment` (
  `id` bigint(20) NOT NULL,
  `object_id` varchar(255) NOT NULL,
  `object_type` varchar(100) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `comment` varchar(4000) DEFAULT NULL,
  `app_user_id` varchar(100) DEFAULT NULL COMMENT 'lookup:@app_user',
  `user_id` varchar(100) DEFAULT NULL COMMENT 'lookup:@user',
  `user_type` varchar(100) DEFAULT NULL COMMENT 'data:app_user,user',
  `created_date` datetime DEFAULT NULL,
  `created_user` varchar(100) DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `object_comment`
--

INSERT INTO `object_comment` (`id`, `object_id`, `object_type`, `parent_id`, `comment`, `app_user_id`, `user_id`, `user_type`, `created_date`, `created_user`, `application_id`) VALUES
(25, '5', 'app_user_feedback', NULL, 'Admin', '', '', 'user', '2017-03-08 00:00:00', '6', 'default'),
(26, '5', 'app_user_feedback', NULL, 'Ok', '', '', 'user', '2017-03-08 00:00:00', '6', 'default'),
(27, '4', 'app_user_feedback', NULL, 'OK :)', '2', '', 'app_user', '2017-03-08 00:00:00', '6', 'default'),
(28, '4', 'app_user_feedback', NULL, 'What is this :)', '6', '', 'app_user', '2017-03-08 00:00:00', '6', 'default'),
(29, '4', 'app_user_feedback', NULL, 'You need to do like this bro', '', '', 'user', '2017-03-08 00:00:00', '6', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `object_counter`
--

CREATE TABLE IF NOT EXISTS `object_counter` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `object_type` varchar(255) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attribute` varchar(100) NOT NULL,
  `date` varchar(10) DEFAULT NULL,
  `week` varchar(10) DEFAULT NULL,
  `month` varchar(10) DEFAULT NULL,
  `year` varchar(10) NOT NULL,
  `focus` varchar(10) NOT NULL COMMENT 'date/week/month/year'
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `object_counter`
--

INSERT INTO `object_counter` (`id`, `object_id`, `object_type`, `count`, `attribute`, `date`, `week`, `month`, `year`, `focus`) VALUES
(111, 1, 'book', 117, 'view_count', NULL, NULL, '05', '2018', 'month'),
(114, 9, 'book', 66, 'view_count', NULL, NULL, '05', '2018', 'month'),
(117, 2, 'book', 39, 'view_count', NULL, NULL, '05', '2018', 'month'),
(121, 10, 'book', 38, 'view_count', NULL, NULL, '05', '2018', 'month'),
(124, 8, 'book', 29, 'view_count', NULL, NULL, '05', '2018', 'month'),
(138, 3, 'book', 55, 'view_count', NULL, NULL, '05', '2018', 'month'),
(142, 6, 'book', 17, 'view_count', NULL, NULL, '05', '2018', 'month'),
(159, 4, 'book', 28, 'view_count', NULL, NULL, '05', '2018', 'month'),
(169, 5, 'book', 7, 'view_count', NULL, NULL, '05', '2018', 'month'),
(179, 7, 'book', 40, 'view_count', NULL, NULL, '05', '2018', 'month'),
(190, 11, 'book', 15, 'view_count', NULL, NULL, '05', '2018', 'month'),
(192, 3, 'book', 25, 'view_count', NULL, '22', '05', '2018', 'week'),
(194, 4, 'book', 16, 'view_count', NULL, '22', '05', '2018', 'week'),
(196, 9, 'book', 17, 'view_count', NULL, '22', '05', '2018', 'week'),
(198, 7, 'book', 39, 'view_count', NULL, '22', '05', '2018', 'week'),
(200, 8, 'book', 7, 'view_count', NULL, '22', '05', '2018', 'week'),
(202, 11, 'book', 12, 'view_count', NULL, '22', '05', '2018', 'week'),
(204, 12, 'book', 44, 'view_count', NULL, '22', '05', '2018', 'week'),
(205, 12, 'book', 44, 'view_count', NULL, NULL, '05', '2018', 'month'),
(207, 10, 'book', 7, 'view_count', NULL, '22', '05', '2018', 'week'),
(214, 2, 'book', 4, 'view_count', NULL, '22', '05', '2018', 'week'),
(217, 5, 'book', 2, 'view_count', NULL, '22', '05', '2018', 'week'),
(218, 12, 'book', 2, 'view_count', '30', NULL, '05', '2018', 'date'),
(219, 7, 'book', 10, 'view_count', '30', NULL, '05', '2018', 'date'),
(220, 8, 'book', 1, 'view_count', '30', NULL, '05', '2018', 'date'),
(221, 11, 'book', 1, 'view_count', '30', NULL, '05', '2018', 'date'),
(222, 4, 'book', 1, 'view_count', '30', NULL, '05', '2018', 'date');

-- --------------------------------------------------------

--
-- Table structure for table `object_counter_history`
--

CREATE TABLE IF NOT EXISTS `object_counter_history` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `object_type` varchar(255) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attribute` varchar(100) NOT NULL,
  `date` varchar(10) DEFAULT NULL,
  `week` varchar(10) DEFAULT NULL,
  `month` varchar(10) DEFAULT NULL,
  `year` varchar(10) NOT NULL,
  `focus` varchar(10) NOT NULL COMMENT 'date/week/month/year',
  `position` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `object_counter_history`
--

INSERT INTO `object_counter_history` (`id`, `object_id`, `object_type`, `count`, `attribute`, `date`, `week`, `month`, `year`, `focus`, `position`) VALUES
(1, 23, 'book', 5, 'view_count', '27', NULL, '06', '2017', 'date', 2),
(2, 21, 'book', 4, 'view_count', '27', NULL, '06', '2017', 'date', 3),
(3, 20, 'book', 2, 'view_count', '27', NULL, '06', '2017', 'date', 4),
(4, 22, 'book', 1, 'view_count', '27', NULL, '06', '2017', 'date', 5),
(5, 23, 'book', 5, 'view_count', NULL, '25', NULL, '2017', 'week', 2),
(6, 21, 'book', 4, 'view_count', NULL, '25', NULL, '2017', 'week', 3),
(7, 20, 'book', 2, 'view_count', NULL, '25', NULL, '2017', 'week', 4),
(8, 22, 'book', 1, 'view_count', NULL, '25', NULL, '2017', 'week', 5),
(9, 23, 'book', 5, 'view_count', NULL, NULL, '05', '2017', 'month', 6),
(10, 21, 'book', 4, 'view_count', NULL, NULL, '05', '2017', 'month', 7),
(11, 20, 'book', 2, 'view_count', NULL, NULL, '05', '2017', 'month', 8),
(12, 22, 'book', 1, 'view_count', NULL, NULL, '05', '2017', 'month', 9),
(13, 20, 'book', 10, 'view_count', '28', NULL, '06', '2017', 'date', 2),
(14, 21, 'book', 6, 'view_count', '28', NULL, '06', '2017', 'date', 3),
(15, 23, 'book', 5, 'view_count', '28', NULL, '06', '2017', 'date', 4),
(16, 22, 'book', 1, 'view_count', '28', NULL, '06', '2017', 'date', 5),
(17, 20, 'book', 3, 'view_count', '30', NULL, '06', '2017', 'date', 2),
(18, 23, 'book', 1, 'view_count', '30', NULL, '06', '2017', 'date', 3),
(19, 22, 'book', 18, 'view_count', NULL, '26', NULL, '2017', 'week', 4),
(20, 20, 'book', 13, 'view_count', NULL, '26', NULL, '2017', 'week', 5),
(21, 21, 'book', 6, 'view_count', NULL, '26', NULL, '2017', 'week', 6),
(22, 23, 'book', 6, 'view_count', NULL, '26', NULL, '2017', 'week', 7),
(23, 20, 'book', 13, 'view_count', NULL, NULL, '06', '2017', 'month', 8),
(24, 21, 'book', 6, 'view_count', NULL, NULL, '06', '2017', 'month', 9),
(25, 23, 'book', 6, 'view_count', NULL, NULL, '06', '2017', 'month', 10),
(26, 22, 'book', 1, 'view_count', NULL, NULL, '06', '2017', 'month', 11),
(27, 8, 'book', 1, 'view_count', '27', NULL, '12', '2017', 'date', 2),
(28, 8, 'book', 1, 'view_count', NULL, '52', NULL, '2017', 'week', 3),
(29, 8, 'book', 1, 'view_count', NULL, NULL, '12', '2017', 'month', 4),
(30, 8, 'book', 5, 'view_count', '03', NULL, '03', '2018', 'date', 2),
(31, 7, 'book', 1, 'view_count', '03', NULL, '03', '2018', 'date', 3),
(32, 8, 'book', 5, 'view_count', NULL, '09', NULL, '2018', 'week', 4),
(33, 7, 'book', 1, 'view_count', NULL, '09', NULL, '2018', 'week', 5),
(34, 8, 'book', 18, 'view_count', '05', NULL, '03', '2018', 'date', 2),
(35, 2, 'book', 6, 'view_count', '05', NULL, '03', '2018', 'date', 3),
(36, 9, 'book', 4, 'view_count', '05', NULL, '03', '2018', 'date', 4),
(37, 1, 'book', 3, 'view_count', '05', NULL, '03', '2018', 'date', 5),
(38, 9, 'book', 31, 'view_count', '06', NULL, '03', '2018', 'date', 2),
(39, 8, 'book', 10, 'view_count', '06', NULL, '03', '2018', 'date', 3),
(40, 10, 'book', 7, 'view_count', '06', NULL, '03', '2018', 'date', 4),
(41, 2, 'book', 5, 'view_count', '06', NULL, '03', '2018', 'date', 5),
(42, 1, 'book', 2, 'view_count', '06', NULL, '03', '2018', 'date', 6),
(43, 2, 'book', 2, 'view_count', '07', NULL, '03', '2018', 'date', 2),
(44, 9, 'book', 1, 'view_count', '07', NULL, '03', '2018', 'date', 3),
(45, 5, 'book', 1, 'view_count', '07', NULL, '03', '2018', 'date', 4),
(46, 9, 'book', 9, 'view_count', '08', NULL, '03', '2018', 'date', 2),
(47, 10, 'book', 4, 'view_count', '08', NULL, '03', '2018', 'date', 3),
(48, 8, 'book', 1, 'view_count', '08', NULL, '03', '2018', 'date', 4),
(49, 5, 'book', 1, 'view_count', '08', NULL, '03', '2018', 'date', 5),
(50, 9, 'book', 45, 'view_count', NULL, '10', NULL, '2018', 'week', 6),
(51, 8, 'book', 29, 'view_count', NULL, '10', NULL, '2018', 'week', 7),
(52, 2, 'book', 13, 'view_count', NULL, '10', NULL, '2018', 'week', 8),
(53, 10, 'book', 11, 'view_count', NULL, '10', NULL, '2018', 'week', 9),
(54, 1, 'book', 5, 'view_count', NULL, '10', NULL, '2018', 'week', 10),
(55, 5, 'book', 2, 'view_count', NULL, '10', NULL, '2018', 'week', 11),
(56, 9, 'book', 45, 'view_count', NULL, NULL, '03', '2018', 'month', 12),
(57, 8, 'book', 34, 'view_count', NULL, NULL, '03', '2018', 'month', 13),
(58, 2, 'book', 13, 'view_count', NULL, NULL, '03', '2018', 'month', 14),
(59, 10, 'book', 11, 'view_count', NULL, NULL, '03', '2018', 'month', 15),
(60, 1, 'book', 5, 'view_count', NULL, NULL, '03', '2018', 'month', 16),
(61, 5, 'book', 2, 'view_count', NULL, NULL, '03', '2018', 'month', 17),
(62, 7, 'book', 1, 'view_count', NULL, NULL, '03', '2018', 'month', 18),
(63, 10, 'book', 4, 'view_count', '12', NULL, '04', '2018', 'date', 2),
(64, 3, 'book', 1, 'view_count', '13', NULL, '04', '2018', 'date', 2),
(65, 10, 'book', 4, 'view_count', NULL, '15', NULL, '2018', 'week', 3),
(66, 3, 'book', 1, 'view_count', NULL, '15', NULL, '2018', 'week', 4),
(67, 10, 'book', 1, 'view_count', '17', NULL, '04', '2018', 'date', 2),
(68, 1, 'book', 1, 'view_count', '17', NULL, '04', '2018', 'date', 3),
(69, 3, 'book', 1, 'view_count', '17', NULL, '04', '2018', 'date', 4),
(70, 9, 'book', 1, 'view_count', '17', NULL, '04', '2018', 'date', 5),
(71, 10, 'book', 1, 'view_count', NULL, '16', NULL, '2018', 'week', 6),
(72, 1, 'book', 1, 'view_count', NULL, '16', NULL, '2018', 'week', 7),
(73, 3, 'book', 1, 'view_count', NULL, '16', NULL, '2018', 'week', 8),
(74, 9, 'book', 1, 'view_count', NULL, '16', NULL, '2018', 'week', 9),
(75, 8, 'book', 1, 'view_count', '23', NULL, '04', '2018', 'date', 2),
(76, 8, 'book', 1, 'view_count', NULL, '17', NULL, '2018', 'week', 3),
(77, 10, 'book', 5, 'view_count', NULL, NULL, '04', '2018', 'month', 4),
(78, 3, 'book', 2, 'view_count', NULL, NULL, '04', '2018', 'month', 5),
(79, 1, 'book', 1, 'view_count', NULL, NULL, '04', '2018', 'month', 6),
(80, 9, 'book', 1, 'view_count', NULL, NULL, '04', '2018', 'month', 7),
(81, 8, 'book', 1, 'view_count', NULL, NULL, '04', '2018', 'month', 8),
(82, 1, 'book', 1, 'view_count', '19', NULL, '05', '2018', 'date', 2),
(83, 10, 'book', 5, 'view_count', '20', NULL, '05', '2018', 'date', 2),
(84, 1, 'book', 4, 'view_count', '20', NULL, '05', '2018', 'date', 3),
(85, 8, 'book', 4, 'view_count', '20', NULL, '05', '2018', 'date', 4),
(86, 9, 'book', 3, 'view_count', '20', NULL, '05', '2018', 'date', 5),
(87, 2, 'book', 3, 'view_count', '20', NULL, '05', '2018', 'date', 6),
(88, 1, 'book', 5, 'view_count', NULL, '20', NULL, '2018', 'week', 7),
(89, 10, 'book', 5, 'view_count', NULL, '20', NULL, '2018', 'week', 8),
(90, 8, 'book', 4, 'view_count', NULL, '20', NULL, '2018', 'week', 9),
(91, 9, 'book', 3, 'view_count', NULL, '20', NULL, '2018', 'week', 10),
(92, 2, 'book', 3, 'view_count', NULL, '20', NULL, '2018', 'week', 11),
(93, 1, 'book', 12, 'view_count', '21', NULL, '05', '2018', 'date', 2),
(94, 9, 'book', 7, 'view_count', '21', NULL, '05', '2018', 'date', 3),
(95, 10, 'book', 1, 'view_count', '21', NULL, '05', '2018', 'date', 4),
(96, 2, 'book', 1, 'view_count', '21', NULL, '05', '2018', 'date', 5),
(97, 1, 'book', 14, 'view_count', '22', NULL, '05', '2018', 'date', 2),
(98, 9, 'book', 8, 'view_count', '22', NULL, '05', '2018', 'date', 3),
(99, 10, 'book', 5, 'view_count', '22', NULL, '05', '2018', 'date', 4),
(100, 6, 'book', 3, 'view_count', '22', NULL, '05', '2018', 'date', 5),
(101, 8, 'book', 2, 'view_count', '22', NULL, '05', '2018', 'date', 6),
(102, 2, 'book', 1, 'view_count', '22', NULL, '05', '2018', 'date', 7),
(103, 3, 'book', 1, 'view_count', '22', NULL, '05', '2018', 'date', 8),
(104, 1, 'book', 15, 'view_count', '23', NULL, '05', '2018', 'date', 2),
(105, 3, 'book', 3, 'view_count', '23', NULL, '05', '2018', 'date', 3),
(106, 9, 'book', 3, 'view_count', '23', NULL, '05', '2018', 'date', 4),
(107, 8, 'book', 2, 'view_count', '23', NULL, '05', '2018', 'date', 5),
(108, 2, 'book', 2, 'view_count', '23', NULL, '05', '2018', 'date', 6),
(109, 6, 'book', 1, 'view_count', '23', NULL, '05', '2018', 'date', 7),
(110, 1, 'book', 49, 'view_count', '24', NULL, '05', '2018', 'date', 2),
(111, 6, 'book', 11, 'view_count', '24', NULL, '05', '2018', 'date', 3),
(112, 9, 'book', 10, 'view_count', '24', NULL, '05', '2018', 'date', 4),
(113, 2, 'book', 8, 'view_count', '24', NULL, '05', '2018', 'date', 5),
(114, 8, 'book', 6, 'view_count', '24', NULL, '05', '2018', 'date', 6),
(115, 10, 'book', 6, 'view_count', '24', NULL, '05', '2018', 'date', 7),
(116, 3, 'book', 3, 'view_count', '24', NULL, '05', '2018', 'date', 8),
(117, 4, 'book', 2, 'view_count', '24', NULL, '05', '2018', 'date', 9),
(118, 1, 'book', 22, 'view_count', '25', NULL, '05', '2018', 'date', 2),
(119, 3, 'book', 15, 'view_count', '25', NULL, '05', '2018', 'date', 3),
(120, 10, 'book', 9, 'view_count', '25', NULL, '05', '2018', 'date', 4),
(121, 2, 'book', 9, 'view_count', '25', NULL, '05', '2018', 'date', 5),
(122, 9, 'book', 9, 'view_count', '25', NULL, '05', '2018', 'date', 6),
(123, 4, 'book', 7, 'view_count', '25', NULL, '05', '2018', 'date', 7),
(124, 8, 'book', 4, 'view_count', '25', NULL, '05', '2018', 'date', 8),
(125, 5, 'book', 4, 'view_count', '25', NULL, '05', '2018', 'date', 9),
(126, 6, 'book', 2, 'view_count', '25', NULL, '05', '2018', 'date', 10),
(127, 2, 'book', 8, 'view_count', '26', NULL, '05', '2018', 'date', 2),
(128, 9, 'book', 5, 'view_count', '26', NULL, '05', '2018', 'date', 3),
(129, 10, 'book', 3, 'view_count', '26', NULL, '05', '2018', 'date', 4),
(130, 8, 'book', 3, 'view_count', '26', NULL, '05', '2018', 'date', 5),
(131, 3, 'book', 1, 'view_count', '26', NULL, '05', '2018', 'date', 6),
(132, 7, 'book', 1, 'view_count', '26', NULL, '05', '2018', 'date', 7),
(133, 5, 'book', 1, 'view_count', '26', NULL, '05', '2018', 'date', 8),
(134, 4, 'book', 1, 'view_count', '26', NULL, '05', '2018', 'date', 9),
(135, 3, 'book', 7, 'view_count', '27', NULL, '05', '2018', 'date', 2),
(136, 9, 'book', 4, 'view_count', '27', NULL, '05', '2018', 'date', 3),
(137, 2, 'book', 3, 'view_count', '27', NULL, '05', '2018', 'date', 4),
(138, 11, 'book', 3, 'view_count', '27', NULL, '05', '2018', 'date', 5),
(139, 4, 'book', 2, 'view_count', '27', NULL, '05', '2018', 'date', 6),
(140, 10, 'book', 2, 'view_count', '27', NULL, '05', '2018', 'date', 7),
(141, 8, 'book', 1, 'view_count', '27', NULL, '05', '2018', 'date', 8),
(142, 1, 'book', 112, 'view_count', NULL, '21', NULL, '2018', 'week', 9),
(143, 9, 'book', 46, 'view_count', NULL, '21', NULL, '2018', 'week', 10),
(144, 2, 'book', 32, 'view_count', NULL, '21', NULL, '2018', 'week', 11),
(145, 3, 'book', 30, 'view_count', NULL, '21', NULL, '2018', 'week', 12),
(146, 10, 'book', 26, 'view_count', NULL, '21', NULL, '2018', 'week', 13),
(147, 8, 'book', 18, 'view_count', NULL, '21', NULL, '2018', 'week', 14),
(148, 6, 'book', 17, 'view_count', NULL, '21', NULL, '2018', 'week', 15),
(149, 4, 'book', 12, 'view_count', NULL, '21', NULL, '2018', 'week', 16),
(150, 5, 'book', 5, 'view_count', NULL, '21', NULL, '2018', 'week', 17),
(151, 11, 'book', 3, 'view_count', NULL, '21', NULL, '2018', 'week', 18),
(152, 7, 'book', 1, 'view_count', NULL, '21', NULL, '2018', 'week', 19),
(153, 7, 'book', 5, 'view_count', '28', NULL, '05', '2018', 'date', 2),
(154, 3, 'book', 4, 'view_count', '28', NULL, '05', '2018', 'date', 3),
(155, 9, 'book', 4, 'view_count', '28', NULL, '05', '2018', 'date', 4),
(156, 4, 'book', 2, 'view_count', '28', NULL, '05', '2018', 'date', 5),
(157, 8, 'book', 1, 'view_count', '28', NULL, '05', '2018', 'date', 6),
(158, 11, 'book', 1, 'view_count', '28', NULL, '05', '2018', 'date', 7),
(159, 12, 'book', 42, 'view_count', '29', NULL, '05', '2018', 'date', 2),
(160, 7, 'book', 24, 'view_count', '29', NULL, '05', '2018', 'date', 3),
(161, 3, 'book', 21, 'view_count', '29', NULL, '05', '2018', 'date', 4),
(162, 4, 'book', 13, 'view_count', '29', NULL, '05', '2018', 'date', 5),
(163, 9, 'book', 13, 'view_count', '29', NULL, '05', '2018', 'date', 6),
(164, 11, 'book', 10, 'view_count', '29', NULL, '05', '2018', 'date', 7),
(165, 10, 'book', 7, 'view_count', '29', NULL, '05', '2018', 'date', 8),
(166, 8, 'book', 5, 'view_count', '29', NULL, '05', '2018', 'date', 9),
(167, 2, 'book', 4, 'view_count', '29', NULL, '05', '2018', 'date', 10),
(168, 5, 'book', 2, 'view_count', '29', NULL, '05', '2018', 'date', 11);

-- --------------------------------------------------------

--
-- Table structure for table `object_file`
--

CREATE TABLE IF NOT EXISTS `object_file` (
  `id` bigint(20) NOT NULL,
  `object_id` int(11) NOT NULL,
  `object_type` varchar(100) NOT NULL,
  `file` varchar(555) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  `file_duration` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` tinyint(5) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_user` varchar(100) DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `object_file`
--

INSERT INTO `object_file` (`id`, `object_id`, `object_type`, `file`, `title`, `description`, `file_type`, `file_size`, `file_duration`, `is_active`, `sort_order`, `created_date`, `created_user`, `application_id`) VALUES
(7, 0, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 1, 'music_artist', 'music_artist_1_file_19.png', 'Test Hihi', '', 'image/png', NULL, NULL, 1, 0, '2016-09-26 00:00:00', '6', ''),
(21, 1, 'cms_testimonial', 'cms_testimonial_1_file_21.png', 'hihi', '', 'image/png', NULL, NULL, 1, 0, '2016-09-26 00:00:00', '6', ''),
(22, 1, 'music_artist', 'music_artist_1_file_22.png', 'DDDDDD', '', 'image/png', NULL, NULL, 1, 1, '2016-09-27 00:00:00', '6', ''),
(24, 2, 'music_artist', 'music_artist_2_file_24.png', 'jjjjjjjjjj', '', 'image/png', NULL, NULL, 1, 0, '2016-09-27 00:00:00', '6', ''),
(25, 2, 'music_artist', 'music_artist_2_file_25.png', 'DDDDDDDD', '', 'image/png', NULL, NULL, 1, 1, '2016-09-27 00:00:00', '6', ''),
(26, 1, 'music_song', 'music_song_1_file_26.png', 'fsdfdsfafas', '', 'image/png', NULL, NULL, 1, 0, '2016-09-28 00:00:00', '6', ''),
(30, 1, 'music_artist', 'www.vnexpress.net', '2', '', 'image/png', NULL, NULL, 1, 2, '2016-10-01 00:00:00', '6', ''),
(31, 1, 'music_artist', 'vnexpress.net', '3', '', '', NULL, NULL, 1, 3, '2016-10-01 00:00:00', '6', ''),
(32, 1, 'music_artist', 'music_artist_1_file_32.png', '4', '', 'image/png', NULL, NULL, 1, 4, '2016-10-01 00:00:00', '6', ''),
(33, 1, 'crm_client', 'crm_client_1_file_33.pdf', 'Company profile', '', 'application/pdf', NULL, NULL, 1, 0, '2016-10-06 00:00:00', '6', 'education'),
(34, 1, 'cms_blogs', 'cms_blogs_1_file_34.png', 'Test', '', 'image/png', '602113', '111', 1, 0, '2016-12-05 00:00:00', '6', 'education'),
(35, 1, 'cms_blogs', 'cms_blogs_1_file_35.png', 'Ok', '', 'image/png', '', '3333', 1, 1, '2016-12-05 00:00:00', '6', 'education'),
(36, 1, 'travel_attractions', 'ddd', 'ss', '', '', '', 'ss', 1, 0, '2017-01-18 00:00:00', '6', 'default'),
(37, 1, 'travel_attractions', 'fdsfsd', 'fasf', '', '', '', 'fsd', 1, 1, '2017-01-18 00:00:00', '6', 'default'),
(38, 13, 'cms_blogs', 'cms_blogs_13_file_38.png', 'Test 1', '', 'image/png', '121057', '12', 1, 0, '2017-03-22 00:00:00', '6', 'default'),
(39, 13, 'cms_blogs', 'cms_blogs_13_file_39.png', 'Test 2', '', 'image/png', '763871', '15', 1, 1, '2017-03-22 00:00:00', '6', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `object_message`
--

CREATE TABLE IF NOT EXISTS `object_message` (
  `id` bigint(1) NOT NULL,
  `object_id` varchar(100) NOT NULL COMMENT 'lookup:@app_user',
  `object_type` varchar(100) DEFAULT NULL,
  `message` varchar(4000) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL COMMENT 'data:Plan,Sent,Received,Read',
  `type` varchar(100) DEFAULT NULL COMMENT 'data:Warning,Birthday,Remind,Promotion',
  `method` varchar(100) DEFAULT NULL COMMENT 'data:Push,Email,SMS',
  `sent_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_user` varchar(100) DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `object_people`
--

CREATE TABLE IF NOT EXISTS `object_people` (
  `id` bigint(20) NOT NULL,
  `object_id` varchar(100) DEFAULT NULL,
  `object_type` varchar(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL COMMENT 'group:Chat',
  `google` varchar(255) DEFAULT NULL COMMENT 'group:Chat',
  `linkedin` varchar(255) DEFAULT NULL COMMENT 'group:Chat',
  `skype` varchar(255) DEFAULT NULL COMMENT 'group:Chat',
  `instagram` varchar(255) DEFAULT NULL COMMENT 'group:Chat',
  `twitter` varchar(255) DEFAULT NULL,
  `yahoo` varchar(255) DEFAULT NULL COMMENT 'group:Chat',
  `sort_order` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `object_relation`
--

CREATE TABLE IF NOT EXISTS `object_relation` (
  `id` bigint(20) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `object_type` varchar(100) NOT NULL,
  `object2_id` bigint(20) NOT NULL,
  `object2_type` varchar(100) NOT NULL,
  `relation_type` varchar(100) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_user` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `object_relation`
--

INSERT INTO `object_relation` (`id`, `object_id`, `object_type`, `object2_id`, `object2_type`, `relation_type`, `sort_order`, `created_date`, `created_user`) VALUES
(52, 4, 'book', 5, 'object-category', '', 2, '2017-12-27', '13'),
(53, 4, 'book', 1, 'object-category', '', 3, '2017-12-27', '13'),
(54, 4, 'book', 2, 'object-category', '', 4, '2017-12-27', '13'),
(55, 4, 'book', 4, 'object-category', '', 5, '2017-12-27', '13'),
(56, 8, 'book', 2, 'object-category', '', 2, '2017-12-27', '13'),
(59, 7, 'book', 1, 'object-category', '', 2, '2017-12-27', '13'),
(60, 7, 'book', 2, 'object-category', '', 3, '2017-12-27', '13'),
(61, 7, 'book', 4, 'object-category', '', 4, '2017-12-27', '13'),
(144, 3, 'book', 1, 'category', 'category', NULL, '2018-05-24', 'admin'),
(145, 3, 'book', 2, 'category', 'category', NULL, '2018-05-24', 'admin'),
(146, 3, 'book', 3, 'category', 'category', NULL, '2018-05-24', 'admin'),
(147, 3, 'book', 4, 'category', 'category', NULL, '2018-05-24', 'admin'),
(148, 4, 'book', 4, 'category', 'category', NULL, '2018-05-24', 'admin'),
(154, 8, 'book', 1, 'category', 'category', NULL, '2018-05-24', 'admin'),
(155, 8, 'book', 2, 'category', 'category', NULL, '2018-05-24', 'admin'),
(156, 8, 'book', 6, 'category', 'category', NULL, '2018-05-24', 'admin'),
(157, 8, 'book', 7, 'category', 'category', NULL, '2018-05-24', 'admin'),
(158, 9, 'book', 1, 'category', 'category', NULL, '2018-05-24', 'admin'),
(159, 9, 'book', 2, 'category', 'category', NULL, '2018-05-24', 'admin'),
(160, 9, 'book', 3, 'category', 'category', NULL, '2018-05-24', 'admin'),
(161, 9, 'book', 4, 'category', 'category', NULL, '2018-05-24', 'admin'),
(162, 9, 'book', 5, 'category', 'category', NULL, '2018-05-24', 'admin'),
(163, 9, 'book', 6, 'category', 'category', NULL, '2018-05-24', 'admin'),
(164, 9, 'book', 7, 'category', 'category', NULL, '2018-05-24', 'admin'),
(165, 10, 'book', 1, 'category', 'category', NULL, '2018-05-24', 'admin'),
(166, 10, 'book', 2, 'category', 'category', NULL, '2018-05-24', 'admin'),
(167, 10, 'book', 3, 'category', 'category', NULL, '2018-05-24', 'admin'),
(168, 10, 'book', 4, 'category', 'category', NULL, '2018-05-24', 'admin'),
(169, 10, 'book', 5, 'category', 'category', NULL, '2018-05-24', 'admin'),
(170, 10, 'book', 6, 'category', 'category', NULL, '2018-05-24', 'admin'),
(171, 10, 'book', 7, 'category', 'category', NULL, '2018-05-24', 'admin'),
(172, 2, 'book', 1, 'category', 'category', NULL, '2018-05-25', 'admin'),
(173, 2, 'book', 2, 'category', 'category', NULL, '2018-05-25', 'admin'),
(179, 12, 'book', 3, 'category', 'category', NULL, '2018-05-29', 'admin'),
(182, 7, 'book', 2, 'category', 'category', NULL, '2018-05-29', 'admin'),
(183, 7, 'book', 7, 'category', 'category', NULL, '2018-05-29', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `object_reviews`
--

CREATE TABLE IF NOT EXISTS `object_reviews` (
  `id` bigint(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `object_type` varchar(100) NOT NULL,
  `rate` float DEFAULT NULL,
  `comment` varchar(2000) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT 'lookup:@app_user',
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `object_seo`
--

CREATE TABLE IF NOT EXISTS `object_seo` (
  `object_id` int(11) NOT NULL,
  `object_type` varchar(255) NOT NULL,
  `slug` varchar(500) NOT NULL,
  `title` varchar(500) NOT NULL,
  `keywords` varchar(2000) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `object_setting`
--

CREATE TABLE IF NOT EXISTS `object_setting` (
  `id` int(11) NOT NULL,
  `object_type` varchar(255) NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `description` text,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `sort_order` int(5) NOT NULL,
  `application_id` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `object_setting`
--

INSERT INTO `object_setting` (`id`, `object_type`, `meta_key`, `key`, `value`, `description`, `icon`, `color`, `is_active`, `sort_order`, `application_id`) VALUES
(43, 'common', 'stores', 'SG', 'Sài Gòn', '', 'metasetting43_icon.png', '', 1, 6, ''),
(44, 'common', 'stores', 'HN', 'Hà nội', '', 'metasetting44_icon.png', '#0000ff', 1, 7, ''),
(45, 'common', 'stores', 'DN', 'Đà nẵng', NULL, NULL, '', 1, 8, ''),
(50, 'product', 'type', 'course', 'Course', NULL, NULL, 'primary', 1, 7, 'trayolo'),
(51, 'product', 'type', 'clothes', 'Clothes', NULL, NULL, 'warning', 1, 8, 'trayolo'),
(52, 'product', 'type', 'smartphone', 'Smartphone', NULL, NULL, 'success', 1, 9, 'trayolo'),
(53, 'product', 'status', 'new', 'New', NULL, NULL, 'primary', 1, 3, 'trayolo'),
(54, 'product', 'status', 'instock', 'In Stock', NULL, NULL, 'success', 1, 4, 'trayolo'),
(55, 'product', 'status', 'outstock', 'Out of Stock', NULL, NULL, 'danger', 1, 6, 'trayolo'),
(56, 'product', 'status', 'discount', 'Discount', NULL, NULL, 'warning', 1, 5, 'trayolo'),
(57, 'article', 'type', 'about', 'About', NULL, NULL, '', 1, 2, 'trayolo'),
(58, 'article', 'type', 'help', 'Help', NULL, NULL, '', 1, 1, 'trayolo'),
(59, 'article', 'type', 'testimonial', 'Testmonial', NULL, NULL, '', 1, 3, ''),
(60, 'article', 'type', 'service', 'Service', NULL, NULL, '', 1, 4, ''),
(61, 'article', 'type', 'member', 'Members', NULL, NULL, '', 1, 5, ''),
(62, 'article', 'type', 'slide', 'Slide', NULL, NULL, '', 1, 6, ''),
(63, 'article', 'type', 'home', 'Home', NULL, NULL, '', 1, 7, ''),
(64, 'cms_blogs', 'type', 'events', 'Events', NULL, NULL, 'primary', 1, 16, ''),
(65, 'cms_blogs', 'type', 'news', 'News', NULL, NULL, 'warning', 1, 17, ''),
(66, 'cms_blogs', 'status', 'draft', 'Draft', NULL, NULL, '', 1, 14, ''),
(67, 'cms_blogs', 'status', 'published', 'Published', NULL, NULL, '', 1, 13, ''),
(68, 'purchase_item', 'purchase_status', '0_new', 'Mới', NULL, NULL, 'danger', 1, 1, ''),
(69, 'purchase_item', 'purchase_status', '1_plan', 'Đang đặt', NULL, NULL, 'success', 1, 1, ''),
(70, 'purchase_item', 'purchase_status', '2_started', 'Đang về', NULL, NULL, 'warning', 1, 1, ''),
(71, 'purchase_item', 'request_location', 'HN', 'Hà nội', NULL, NULL, '', 1, 1, ''),
(72, 'purchase_item', 'request_location', 'SG', 'Sài gòn', NULL, NULL, '', 1, 1, ''),
(73, 'purchase_item', 'request_location', 'DN', 'Đà nẵng', NULL, NULL, '', 1, 1, ''),
(74, 'purchase_item', 'request_provider', 'QC', 'Quảng châu', NULL, NULL, '', 1, 1, ''),
(75, 'purchase_item', 'request_provider', 'SMD', 'SMD', NULL, NULL, '', 1, 1, ''),
(76, 'purchase_item', 'request_provider', 'QVM', 'QVM', NULL, NULL, '', 1, 1, ''),
(77, 'purchase_item', 'request_provider', 'VN', 'Việt nam', NULL, NULL, '', 1, 1, ''),
(78, 'purchase_item', 'product_unit', 'pcs', 'PCS', NULL, NULL, '', 1, 1, ''),
(79, 'purchase_item', 'product_unit', 'set', 'Set', NULL, NULL, '', 1, 1, ''),
(80, 'purchase_item', 'product_unit', 'item', 'Item', NULL, NULL, '', 1, 1, ''),
(81, 'purchase_item', 'product_unit', 'kg', 'Kg', NULL, NULL, '', 1, 1, ''),
(82, 'purchase_item', 'product_unit', 'ton', 'Tấn', NULL, NULL, '', 1, 1, ''),
(83, 'purchase_item', 'receive_habor', 'HP', 'Hải Phòng', NULL, NULL, '', 1, 1, ''),
(84, 'purchase_item', 'receive_habor', 'HG', 'Hòn Gai', NULL, NULL, '', 1, 1, ''),
(85, 'purchase_item', 'receive_habor', 'TH', 'Nghi Sơn', NULL, NULL, '', 1, 1, ''),
(86, 'purchase_item', 'receive_habor', 'HCM', 'TP. Hồ Chí Minh', NULL, NULL, '', 1, 1, ''),
(87, 'purchase_item', 'receive_habor', 'VT', 'Vũng Tàu', NULL, NULL, '', 1, 1, ''),
(88, 'purchase_item', 'receive_habor', 'DN', 'Đà nẵng', NULL, NULL, '', 1, 1, ''),
(89, 'purchase_item', 'store_code', 'HP', 'Hải phòng', NULL, NULL, '', 1, 1, ''),
(90, 'purchase_item', 'store_code', 'HN', 'Hà nội', NULL, NULL, '', 1, 1, ''),
(91, 'purchase_item', 'store_code', 'DN', 'Đà nẵng', NULL, NULL, '', 1, 1, ''),
(92, 'purchase_item', 'store_code', 'HCM', 'Hồ Chí Minh', NULL, NULL, '', 1, 1, ''),
(93, 'purchase_item', 'store_quality', 'good', 'Đạt', NULL, NULL, '', 1, 1, ''),
(94, 'purchase_item', 'store_quality', 'bad', 'Không đạt', NULL, NULL, '', 1, 1, ''),
(95, 'purchase_item', 'store_quality', 'n/a', 'Chưa kiểm tra', NULL, NULL, '', 1, 1, ''),
(96, 'purchase_item', 'product_group', 'goi', 'Gối', NULL, NULL, '', 1, 1, ''),
(97, 'purchase_item', 'product_group', 'neo', 'Bộ NEO', NULL, NULL, '', 1, 1, ''),
(98, 'purchase_item', 'product_group', 'cap127', 'Cáp 12.7mm', NULL, NULL, '', 1, 1, ''),
(99, 'purchase_item', 'purchase_status', '3_finished', 'Hoàn thành', NULL, NULL, 'primary', 1, 1, ''),
(100, 'purchase_item', 'purchase_status', 'late', 'Chậm', NULL, NULL, 'danger', 1, 1, ''),
(101, 'purchase_item', 'purchase_status', '25_half', 'Về Đợt 1', NULL, NULL, 'warning', 1, 1, ''),
(102, 'purchase_item', 'purchase_status', 'lost', 'Thất lạc', NULL, NULL, 'danger', 1, 1, ''),
(103, 'provider', 'type', 'si', 'Sỉ', NULL, NULL, '', 1, 1, ''),
(104, 'provider', 'type', 'le', 'Lẻ', NULL, NULL, '', 1, 1, ''),
(105, 'provider', 'type', 'NN', 'nước ngoài', NULL, NULL, '', 1, 1, ''),
(106, 'user', 'status', '0', 'inactive', NULL, NULL, 'default', 1, 1, ''),
(107, 'user', 'status', '10', 'active', NULL, NULL, 'success', 1, 1, ''),
(108, 'user', 'status', '-1', 'disabled', NULL, NULL, 'warning', 1, 1, ''),
(109, 'purchase_order', 'purchase_department', 'KD', 'Phòng Kinh doanh', NULL, NULL, '', 1, 1, ''),
(110, 'purchase_order', 'purchase_department', 'KDHN', 'Phòng Kinh doanh Hà Nội', NULL, NULL, '', 1, 1, ''),
(111, 'purchase_order', 'purchase_department', 'KDSG', 'Phòng Kinh doanh Sài gòn', NULL, NULL, '', 1, 1, ''),
(112, 'purchase_order', 'purchase_department', 'KDDN', 'Phòng Kinh doanh Đà nẵng', NULL, NULL, '', 1, 1, ''),
(113, 'purchase_order', 'purchase_department', 'MH', 'Phòng Mua sắm', NULL, NULL, '', 1, 1, ''),
(114, 'purchase_order', 'purchase_department', 'KT', 'Kế toán', NULL, NULL, '', 1, 1, ''),
(115, 'purchase_order', 'term_quality', 'ISO2700', 'ISO 2700', NULL, NULL, '', 1, 1, ''),
(116, 'purchase_order', 'term_quality', 'EU', 'EU 28000', NULL, NULL, '', 1, 1, ''),
(117, 'purchase_order', 'term_variant', '90', '90%', NULL, NULL, '', 1, 1, ''),
(118, 'purchase_order', 'term_variant', '100', '100%', NULL, NULL, '', 1, 1, ''),
(119, 'purchase_order', 'term_original', 'EU', 'Châu âu', NULL, NULL, '', 1, 1, ''),
(120, 'purchase_order', 'term_original', 'QC', 'Quảng Châu', NULL, NULL, '', 1, 1, ''),
(121, 'purchase_order', 'term_original', 'VN', 'Trong nước', NULL, NULL, '', 1, 1, ''),
(122, 'purchase_order', 'term_certificate', 'SK', 'Sao khuê', NULL, NULL, '', 1, 1, ''),
(123, 'purchase_order', 'term_certificate', 'ISO', 'ISO 12000', NULL, NULL, '', 1, 1, ''),
(124, 'test', 'status', 'T1', 'T1 V', NULL, NULL, '', 1, 1, ''),
(125, 'test', 'status', 'T2', 'T2 V', NULL, NULL, '', 1, 1, ''),
(126, 'test', 'status', 'T3', 'T3 V', NULL, NULL, '', 1, 1, ''),
(127, 'truck_container', 'type', '1', 'Type 1', NULL, NULL, '', 1, 1, ''),
(128, 'truck_container', 'type', '2', 'Type 2', NULL, NULL, '', 1, 0, ''),
(129, 'cms_article', 'type', 'about', 'About', NULL, NULL, '', 1, 11, ''),
(130, 'cms_article', 'type', 'service', 'Service', NULL, NULL, '', 1, 9, ''),
(131, 'cms_article', 'type', 'testimonial', 'Testimonial', NULL, NULL, '', 1, 10, ''),
(133, 'music_artist', 'type', 'type2', 'Artist Type2', NULL, NULL, '', 1, 3, ''),
(134, 'common', 'lang', 'hindi', 'Hindi', NULL, NULL, '', 1, 3, 'education'),
(135, 'common', 'lang', 'bunJi', 'Bunji', NULL, NULL, '', 1, 2, 'education'),
(136, 'music_song', 'type', 'Nhac vang', 'Nhac vang', NULL, NULL, '', 1, 4, 'education'),
(137, 'music', 'mood', 'sad', 'sad', '', '', '', 1, 1, 'education'),
(138, 'music', 'mood', 'happy', 'happy :)', 'hihi fdsfsd', '', '', 1, 0, 'education'),
(139, 'music', 'mood', 'love', 'love', NULL, NULL, '', 1, 2, 'education'),
(140, 'common', 'city', 'Kuala Lumpur', 'Kuala Lumpur', NULL, NULL, '', 1, 1, 'education'),
(141, 'common', 'city', 'Johor', 'Johor', NULL, NULL, '', 1, 0, 'education'),
(142, 'travel', 'keywords', 'Attractions', 'Attractions', NULL, NULL, '', 1, 1, 'education'),
(143, 'travel', 'keywords', 'Hotels', 'Hotels', NULL, NULL, '', 1, 1, 'education'),
(144, 'travel', 'keywords', 'Restaurants', 'Restaurants', NULL, NULL, '', 1, 1, 'education'),
(145, 'travel_attractions', 'default_duration', '15', '00:15', NULL, NULL, '', 1, 1, 'education'),
(146, 'travel_attractions', 'default_duration', '30', '00:30', NULL, NULL, '', 1, 1, 'education'),
(147, 'travel_attractions', 'default_duration', '45', '00:45', NULL, NULL, '', 1, 1, 'education'),
(148, 'travel_attractions', 'default_duration', '60', '1 hour', NULL, NULL, '', 1, 1, 'default'),
(149, 'travel_attractions', 'default_duration', '90', '1 hour 30 mins', NULL, NULL, '', 1, 1, 'default'),
(150, 'product', 'type', 'book', 'Book', NULL, NULL, '', 1, 1, 'default'),
(151, 'common', 'Role', '31', 'Bet Admin', '', '', '', 1, 4, 'default'),
(152, 'common', 'Role', '32', 'Finance Admin', '', '', '', 1, 5, 'default'),
(153, 'travel', 'fdsf', 'dsfds', 'fsdf', NULL, NULL, NULL, 1, 0, ''),
(154, '', 'type', 'aaa', 'b dddd', NULL, NULL, NULL, 1, 0, 'trayolo'),
(162, 'common', 'FSD', 'key', 'value', NULL, '', NULL, 1, 1, 'trayolo'),
(166, 'user', 'position', 'M', 'Manager', NULL, NULL, '', 1, 1, 'trayolo'),
(169, 'user', 'department', 'KT', 'Accountant', NULL, NULL, NULL, 1, 0, 'trayolo'),
(170, 'user', 'department', 'HR', 'HR', NULL, NULL, NULL, 1, 0, 'trayolo');

-- --------------------------------------------------------

--
-- Table structure for table `object_tag`
--

CREATE TABLE IF NOT EXISTS `object_tag` (
  `id` bigint(20) NOT NULL,
  `object_id` varchar(255) NOT NULL,
  `object_type` varchar(100) NOT NULL,
  `tag` varchar(100) DEFAULT NULL COMMENT 'lookup:@settings_tag',
  `sort_order` tinyint(1) DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `object_translation`
--

CREATE TABLE IF NOT EXISTS `object_translation` (
  `id` bigint(20) NOT NULL,
  `object_id` bigint(20) DEFAULT NULL,
  `object_type` varchar(100) DEFAULT NULL,
  `lang` varchar(100) DEFAULT NULL,
  `content` text,
  `created_date` datetime DEFAULT NULL,
  `created_user` varchar(100) DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `object_translation`
--

INSERT INTO `object_translation` (`id`, `object_id`, `object_type`, `lang`, `content`, `created_date`, `created_user`, `application_id`) VALUES
(40, 54, 'book', 'vi', '{"id":"54","image":"1467597684.jpg","title":"123","author":"hakan","publisher":"emedya","description":"konutve yap\\u0131 gazetesi  say\\u0131 33","attachment":"","type":"classic","category_id":",1,2,3,","view_count":"180","like_count":"","is_feature":"0","is_active":"1","created_date":"","modified_date":"2017-06-30 12:04:57"}', '2017-07-01 10:58:04', '6', 'mozaebook'),
(41, 8, 'book', 'en', '{"id":"8","image":"1501224517673_book_image.jpg","title":"The Whale","author":"Arzia","publisher":"Arzia","category_id":",5,2,","description":"The Whale Who Ate Everything is a funny little tale about a very hungry whale who eats a little too much for his own good.","attachment":"1501224517963_book_attachment.mp4","type":"","view_count":"48","like_count":"0","is_feature":"1","is_active":"1","created_date":"2017-07-18 02:46:13","modified_date":"2017-07-28 01:48:37","application_id":"ebook"}', '2017-12-19 19:51:53', '13', 'ebook'),
(42, 7, 'book', 'en', '{"id":"7","image":"1501216777654_book_image.jpg","title":"The melody of time","author":"Ng\\u1ea3i Ti\\u1ec3u \\u0110\\u1ed3","publisher":"Maria","category_id":",1,4,","description":"Th\\u1ea9m An B\\u00ecnh c\\u00f3 c\\u1ea3m t\\u00ecnh v\\u1edbi C\\u1ed1 B\\u00ecnh An, nh\\u01b0ng C\\u1ed1 B\\u00ecnh An l\\u00fac n\\u00e0o c\\u0169ng c\\u1ef1 tuy\\u1ec7t t\\u00ecnh c\\u1ea3m \\u1ea5y. Khi Th\\u1ea9m An B\\u00ecnh du h\\u1ecdc \\u1edf n\\u01b0\\u1edbc ngo\\u00e0i, v\\u00ec qu\\u00e1 nh\\u1edb nhung C\\u1ed1 B\\u00ecnh An n\\u00ean \\u0111\\u00e3 \\u0111\\u00e1p m\\u00e1y bay tr\\u1edf v\\u1ec1 g\\u1eb7p c\\u00f4, kh\\u00f4ng ng\\u1edd v\\u1eeba \\u0111\\u00fang l\\u00fac ch\\u1ee9ng ki\\u1ebfn c\\u1ea3nh th\\u00e2n m\\u1eadt gi\\u1eefa T\\u1ea5t Nhi\\u1ec5m v\\u00e0 C\\u1ed1 B\\u00ecnh An trong v\\u01b0\\u1eddn tr\\u01b0\\u1eddng. Th\\u1ea9m An B\\u00ecnh \\u0111au kh\\u1ed5 bu\\u1ed3n b\\u00e3, u\\u1ed1ng m\\u1ed9t tr\\u1eadn th\\u1eadt say r\\u1ed3i quy\\u1ebft \\u0111\\u1ecbnh bu\\u00f4ng x\\u00f5a, c\\u00f2n C\\u1ed1 B\\u00ecnh An th\\u00ec kh\\u00f4ng h\\u1ec1 bi\\u1ebft g\\u00ec.","attachment":"1501216777308_book_attachment.epub","type":"classical","view_count":"3","like_count":"0","is_feature":"1","is_active":"1","created_date":"2017-07-18 02:36:01","modified_date":"2017-07-28 01:57:51","application_id":"ebook"}', '2017-12-19 19:51:59', '13', 'ebook'),
(43, 6, 'book', 'en', '{"id":"6","image":"1500360826147_book_image.jpg","title":"The Cruise of The Snark","author":"Jack London","publisher":"sansan","category_id":",1,3,","description":"The Snark had two masts and was 43 feet long at the waterline, and on it London claims to have spent thirty thousand dollars. The snark was primarily a sailboat, however, it also had an auxiliary 70-horsepower engine. It was further equipped with one lifeboat. In 1906, Author Jack London began to build a 45-foot yacht on which he planned a round-the-world voyage, to last seven years. After many delays, Jack and Charmian London and a small crew sailed out of San Francisco Bay on April 23, 1907, bound for the South Pacific","attachment":"1500360826599_book_attachment.epub","type":"","view_count":"10","like_count":"0","is_feature":"1","is_active":"1","created_date":"2017-07-18 01:53:46","modified_date":"2017-08-02 18:02:05","application_id":"ebook"}', '2017-12-19 19:52:05', '13', 'ebook'),
(44, 5, 'book', 'en', '{"id":"5","image":"15012173864_book_image.png","title":"I''m in love with my best friend","author":"Fearless Pinoy","publisher":"sansan","category_id":",2,4,","description":"They were four of the greatest minds in the Universe: Two men and two women, all Psionic Primes, lost in an experimental spaceship billions of parsecs from home. And as they mentally charted the cosmos to find their way back to Earth, their own loves and hates were as startling as the worlds they encountered.","attachment":"1500351266269_book_attachment.epub","type":"","view_count":"1","like_count":"0","is_feature":"1","is_active":"1","created_date":"2017-07-17 23:14:26","modified_date":"2017-07-27 23:50:03","application_id":"ebook"}', '2017-12-19 19:52:11', '13', 'ebook'),
(45, 4, 'book', 'en', '{"id":"4","image":"1500373925459_book_image.png","title":"Nineteen Eighty-Four","author":"George Orwell","publisher":"sansan","category_id":",1,3,","description":"It is 1984. The world is in a state of perpetual war and Big Brother sees and controls all. Winston Smith, a member of the Outer Party and propaganda-writer at the Ministry of Truth, is keeping a journal he should not be keeping and falling in love with Julia, a woman he should not be seeing. Outwardly compliant, Winston dreams of rebellion against the oppressive Big Brother, risking everything to recover his lost sense of individuality and control of his own future. One of the bestselling books of the twentieth century, 1984 is the dystopian classic that introduced such Orwellian terms as \\u2018Big Brother,\\u2019 \\u2018doublethink,\\u2019 \\u2018Newspeak,\\u2019 and \\u2018thoughtcrime\\u2019 to the collective consciousness, giving official terminology to state-sanctioned deception, surveillance, and historical revisionism.","attachment":"1500349892681_book_attachment.epub","type":"","view_count":"10","like_count":"0","is_feature":"1","is_active":"1","created_date":"2017-07-17 22:51:32","modified_date":"2017-07-18 05:32:05","application_id":"ebook"}', '2017-12-19 19:52:15', '13', 'ebook'),
(46, 3, 'book', 'en', '{"id":"3","image":"1500375017211_book_image.png","title":"Birds and a Stone","author":"Anastasia Novykh","publisher":"Hjkoe","category_id":"5","description":"Three captivating stories of this book: \\u201cDuty\\u201d, \\u201cEverything is so simple\\u201d and \\u201cBirds and a stone\\u201d tell about unusual people who reconsider their life values.","attachment":"1498814515843_book_attachment.pdf","type":"ebook","view_count":"22","like_count":"0","is_feature":"1","is_active":"1","created_date":"2017-06-30 04:21:55","modified_date":"2017-07-18 05:50:17","application_id":"ebook"}', '2017-12-19 19:52:21', '13', 'ebook'),
(47, 2, 'book', 'en', '{"id":"2","image":"1501216489783_book_image.jpg","title":"365 Stories night","author":"L\\u01b0u H\\u1ed3ng H\\u00e0","publisher":"Anastasia","category_id":",5,1,3,","description":"365 TRUY\\u1ec6N K\\u1ec2 H\\u1eb0NG \\u0110\\u00caM l\\u00e0 series truy\\u1ec7n k\\u1ec3 d\\u00e0nh cho b\\u00e9 \\u0111\\u01b0\\u1ee3c tuy\\u1ec3n ch\\u1ecdn theo \\u201ctinh th\\u1ea7n\\u201d b\\u1ed1n m\\u00f9a xu\\u00e2n, h\\u1ea1, thu, \\u0111\\u00f4ng\\u2026 g\\u1ed3m nh\\u1eefng truy\\u1ec7n k\\u1ec3 \\u1edf x\\u1ee9 th\\u1ea7n ti\\u00ean, truy\\u1ec7n k\\u1ec3 tri th\\u1ee9c, truy\\u1ec7n hay r\\u00e8n th\\u00f3i quen t\\u1ed1t, truy\\u1ec7n k\\u1ec3 v\\u1ec1 danh nh\\u00e2n, truy\\u1ec7n k\\u1ec3 d\\u00e2n gian\\u2026 M\\u1ed7i c\\u00e2u chuy\\u1ec7n s\\u1ebd m\\u1edf ra m\\u1ed9t tr\\u1ea3i nghi\\u1ec7m \\u0111\\u1eb7c bi\\u1ec7t, cung c\\u1ea5p m\\u1ed9t ki\\u1ebfn th\\u1ee9c th\\u00fa v\\u1ecb, b\\u1ed3i d\\u01b0\\u1ee1ng m\\u1ed9t ph\\u1ea9m ch\\u1ea5t \\u01b0u t\\u00fa\\u2026 gi\\u00fap b\\u00e9 tr\\u01b0\\u1edfng th\\u00e0nh.","attachment":"1501216489180_book_attachment.epub","type":"","view_count":"7","like_count":"0","is_feature":"1","is_active":"1","created_date":"2017-06-30 04:12:35","modified_date":"2017-07-28 01:58:39","application_id":"ebook"}', '2017-12-19 19:52:30', '13', 'ebook'),
(48, 1, 'book', 'en', '{"id":"1","image":"1501216303412_book_image.jpg","title":"The Art of Choosing","author":"Sheena IYengar","publisher":"Novykh","category_id":",2,3,","description":"Trong cu\\u1ed1n Ngh\\u1ec7 thu\\u1eadt ch\\u1ecdn l\\u1ef1a, gi\\u00e1o s\\u01b0 \\u0111\\u1ea1i h\\u1ecdc Columbia, Sheena Iyengar, m\\u1ed9t chuy\\u00ean gia h\\u00e0ng \\u0111\\u1ea7u v\\u1ec1 ch\\u1ecdn l\\u1ef1a, \\u0111\\u1eb7t m\\u00ecnh v\\u00e0o nhi\\u1ec7m v\\u1ee5 n\\u1eb7ng n\\u1ec1 \\u0111\\u00f3 l\\u00e0 gi\\u00fap ch\\u00fang ta tr\\u1edf th\\u00e0nh nh\\u1eefng ng\\u01b0\\u1eddi ch\\u1ecdn l\\u1ef1a s\\u00e1ng su\\u1ed1t h\\u01a1n. C\\u00f4 \\u0111\\u00e3 n\\u00eau ra nhi\\u1ec1u c\\u00e2u h\\u1ecfi \\u0111\\u1ea7y th\\u00fa v\\u1ecb: Khao kh\\u00e1t l\\u1ef1a ch\\u1ecdn l\\u00e0 b\\u1ea9m sinh hay \\u0111\\u01b0\\u1ee3c t\\u1ea1o n\\u00ean b\\u1edfi v\\u0103n h\\u00f3a? T\\u1ea1i sao \\u0111\\u00f4i khi ch\\u00fang ta ch\\u1ecdn l\\u1ef1a nh\\u1eefng \\u0111i\\u1ec1u ng\\u01b0\\u1ee3c l\\u1ea1i v\\u1edbi s\\u1edf th\\u00edch c\\u1ee7a c\\u00e1 nh\\u00e2n? Ch\\u00fang ta th\\u1ef1c s\\u1ef1 c\\u00f3 bao nhi\\u00eau quy\\u1ec1n n\\u0103ng \\u0111\\u1ed1i v\\u1edbi nh\\u1eefng ch\\u1ecdn l\\u1ef1a c\\u1ee7a m\\u00ecnh? Cu\\u1ed1i c\\u00f9ng, c\\u00f4 \\u0111\\u01b0a ra nh\\u1eefng c\\u00e2u tr\\u1ea3 l\\u1eddi b\\u1ea5t ng\\u1edd v\\u00e0 r\\u1ea5t s\\u00e2u s\\u1eafc, t\\u1eeb nghi\\u00ean c\\u1ee9u nghi\\u00eam t\\u00fac, b\\u00e0i b\\u1ea3n \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c trao gi\\u1ea3i th\\u01b0\\u1edfng c\\u1ee7a c\\u00f4.","attachment":"150121630334_book_attachment.epub","type":"","view_count":"3","like_count":"0","is_feature":"1","is_active":"1","created_date":"2017-06-30 04:04:08","modified_date":"2017-07-28 01:55:42","application_id":"ebook"}', '2017-12-19 19:52:35', '13', 'ebook'),
(49, 5, 'object_category', 'en', '{"id":"5","parent_id":"","image":"chidlren_object_category__image_20171219_201251.png","name":"Chidlren","description":"","sort_order":"","is_hot":"1","is_top":"1","is_active":"1","object_type":"","created_date":"2017-12-19 20:31:51","modified_date":"2017-12-19 20:34:51","application_id":"ebook"}', '2017-12-19 20:34:51', '13', 'ebook'),
(50, 3, 'book_chapter', 'en', '{"id":"3","image":"sensei_iii_book_chapter_3_image3_20171219_221235.png","book_id":"1","chapter_number":"3","title":"Sensei III","attachment":"sensei_iii_book_chapter_3_attachment3_20171219_221224.pdf","type":"pdf","content":"<p><span style=\\"background-color:rgb(251, 252, 253)\\">The latest developments in the world &ndash; world economic crisis and geopolitical changes &ndash; set every person thinking about the cause of their origin.<\\/span><\\/p>","is_active":"1","created_date":"2017-06-30 04:08:07","modified_date":"2017-07-20 06:10:48","application_id":"ebook"}', '2017-12-19 22:35:28', '8', 'ebook'),
(51, 11, 'book_chapter', 'en', '{"id":"11","image":"chapter_2_book_chapter_11_image11_20171219_221229.png","book_id":"7","chapter_number":"2","title":"Chapter 2 2","attachment":"chapter_2_book_chapter_11_attachment11_20171219_221229.pdf","type":"pdf","content":"<p><span style=\\"background-color:rgb(251, 252, 253)\\">This is the Most Popular Punjabi Animation Video.This is the Biggest Hit Punjabi Animation Show.&nbsp;<\\/span><\\/p>","is_active":"1","created_date":"2017-07-18 02:39:18","modified_date":"2017-07-20 06:15:27","application_id":"ebook"}', '2017-12-19 22:50:29', '8', 'ebook');

-- --------------------------------------------------------

--
-- Table structure for table `object_type`
--

CREATE TABLE IF NOT EXISTS `object_type` (
  `object_type` varchar(255) NOT NULL,
  `group` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `sort_order` int(5) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_system` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `object_type`
--

INSERT INTO `object_type` (`object_type`, `group`, `name`, `sort_order`, `is_active`, `is_system`) VALUES
('application', 'common', 'Application', NULL, 0, 1),
('app_user', 'app', 'App User', 4, 1, 1),
('app_user_bookmark', 'app', 'App User Bookmark', 9, 0, 1),
('app_user_device', 'app', 'App User Device', 8, 0, 1),
('app_user_feedback', 'app', 'App User Feedback', 10, 0, 1),
('app_user_logs', 'app', 'App User Logs', 7, 0, 1),
('app_user_pro', 'app', 'App User Pro', 5, 0, 1),
('app_user_token', 'app', 'App User Token', 6, 0, 1),
('app_user_transaction', 'app', 'App User Transaction', 11, 0, 1),
('cms_about', 'cms', 'Cms About', 18, 0, 1),
('cms_album', 'cms', 'Cms Album', 20, 0, 1),
('cms_article', 'cms', 'Cms Article', 16, 0, 1),
('cms_blogs', 'cms', 'Cms Blogs', 15, 1, 1),
('cms_contact', 'cms', 'Cms Contact', 21, 0, 1),
('cms_employee', 'cms', 'Cms Employee', 20, 0, 1),
('cms_faq', 'cms', 'Cms Faq', 17, 0, 1),
('cms_partner', 'cms', 'Cms Partner', 19, 0, 1),
('cms_portfolio', 'cms', 'Cms Portfolio', 21, 0, 1),
('cms_service', 'cms', 'Cms Service', 21, 0, 1),
('cms_slide', 'cms', 'Cms Slide', 20, 0, 1),
('cms_statistics', 'cms', 'Cms Statistics', 13, 0, 1),
('cms_testimonial', 'cms', 'Cms Testimonial', 14, 0, 1),
('common', '', 'Common', 0, 1, NULL),
('crm_client', 'crm', 'Crm Client', 1, 0, 1),
('crm_deals', 'crm', 'Crm Deals', NULL, 0, 1),
('crm_invoice', 'crm', 'Crm Invoice', NULL, 0, 1),
('finance_deposit', 'finance', 'Finance Deposit', NULL, 0, 1),
('finance_expense', 'finance', 'Finance Expense', NULL, 0, 1),
('finance_transfer', 'finance', 'Finance Transfer', NULL, 0, 1),
('migration', 'migration', 'Migration', NULL, 0, 1),
('music', '', 'Music :)', 2, 1, 1),
('music_artist', 'music', 'Music Artist', 5, 0, 1),
('music_playlist', 'music', 'Music Playlist', 12, 0, 1),
('music_song', 'music', 'Music Song', 10, 0, 1),
('object_actions', 'common', 'Object Actions', NULL, 0, 1),
('object_article', 'common', 'Object Article', NULL, 0, 1),
('object_attributes', 'common', 'Object Attributes', NULL, 0, 1),
('object_booking', 'common', 'Object Booking', NULL, 0, 1),
('object_cache', 'common', 'Object Cache', NULL, 0, 1),
('object_category', 'common', 'Object Category', NULL, 0, 1),
('object_comment', 'common', 'Object Comment', NULL, 0, 1),
('object_favourites', 'common', 'Object Favourites', NULL, 0, 1),
('object_file', 'common', 'Object File', NULL, 0, 1),
('object_message', 'common', 'Object Message', NULL, 0, 1),
('object_people', 'common', 'Object People', NULL, 0, 1),
('object_relation', 'common', 'Object Relation', NULL, 0, 1),
('object_reviews', 'common', 'Object Reviews', NULL, 0, 1),
('object_seo', 'common', 'Object Seo', NULL, 0, 1),
('object_setting', 'common', 'Object Setting', NULL, 0, 1),
('object_tag', 'common', 'Object Tag', NULL, 0, 1),
('object_type', 'common', 'Object Type', NULL, 0, 1),
('office_document', 'office', 'Office Document', NULL, 0, 1),
('pm_issue', 'pm', 'Pm Issue', NULL, 0, 1),
('pm_project', 'pm', 'Pm Project', NULL, 0, 1),
('pm_task', 'pm', 'Pm Task', NULL, 0, 1),
('product', 'ecommerce', 'Product', 9, 0, 1),
('product_book', 'ecommerce', 'Product Book', NULL, 0, 1),
('product_clothes', 'ecommerce', 'Product Clothes', NULL, 0, 1),
('product_course', 'ecommerce', 'Product Course', NULL, 0, 1),
('product_deal', 'ecommerce', 'Product Deal', NULL, 0, 1),
('product_items', 'ecommerce', 'Product Items', NULL, 0, 1),
('product_order', 'ecommerce', 'Product Order', NULL, 0, 1),
('product_order_item', 'ecommerce', 'Product Order Item', NULL, 0, 1),
('product_reservation', 'ecommerce', 'Product Reservation', NULL, 0, 1),
('product_smartphone', 'ecommerce', 'Product Smartphone', NULL, 0, 1),
('promotion', 'ecommerce', 'Promotion', NULL, 1, 1),
('provider', 'ecommerce', 'Provider', 4, 1, 1),
('purchase_item', 'purchase', 'Purchase Item', 11, 0, 1),
('purchase_order', 'purchase', 'Purchase Order', 13, 0, 1),
('purchase_request', 'purchase', 'Purchase Request', NULL, 0, 1),
('settings', 'settings', 'Settings', NULL, 0, 1),
('settings_languages', 'common', 'Settings Languages', NULL, 0, 1),
('settings_lookup', 'common', 'Settings Lookup', NULL, 0, 1),
('settings_menu', 'common', 'Settings Menu', NULL, 0, 1),
('settings_schema', 'common', 'Settings Schema', NULL, 0, 1),
('settings_text', 'common', 'Settings Text', NULL, 0, 1),
('settings_theme', 'common', 'Settings Theme', NULL, 0, 1),
('software', 'software', 'Software', NULL, 0, 1),
('transport_driver', 'transport', 'Transport Driver', NULL, 0, 1),
('transport_request', 'transport', 'Transport Request', NULL, 0, 1),
('transport_trip', 'transport', 'Transport Trip', NULL, 0, 1),
('transport_vehicle', 'transport', 'Transport Vehicle', NULL, 0, 1),
('transport_vehicle_img', 'transport', 'Transport Vehicle Img', NULL, 0, 1),
('travel', '', 'Travel', 1, 1, NULL),
('travel_attractions', 'travel', 'Travel Attractions', 2, 0, 1),
('travel_distance', 'travel', 'Travel Distance', NULL, 0, 1),
('travel_itinerary', 'travel', 'Travel Itinerary', NULL, 0, 1),
('travel_plans', 'travel', 'Travel Plans', NULL, 0, 1),
('travel_scores', 'travel', 'Travel Scores', NULL, 0, 1),
('travel_sites', 'travel', 'Travel Sites', NULL, 0, 1),
('user', 'common', 'User', 6, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE IF NOT EXISTS `promotion` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  `banner` varchar(300) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `overview` varchar(2000) DEFAULT NULL,
  `content` text,
  `link_url` varchar(255) DEFAULT NULL,
  `discount_type` varchar(100) DEFAULT NULL COMMENT 'data:percent,price_off;group:Discount',
  `discount` int(11) DEFAULT NULL COMMENT 'group:Discount',
  `usage_limit` int(12) DEFAULT NULL COMMENT 'group:Usage',
  `usage_current` int(11) DEFAULT NULL COMMENT 'group:Usage',
  `apply_type` varchar(100) DEFAULT NULL COMMENT 'data:all,sales_over,products; group:Apply',
  `sales_over` int(11) DEFAULT NULL COMMENT 'group:Apply',
  `products` varchar(500) DEFAULT NULL COMMENT 'group:Apply;lookup:@product',
  `start_date` date DEFAULT NULL COMMENT 'group:Duration',
  `end_date` date DEFAULT NULL COMMENT 'group:Duration',
  `is_top` tinyint(1) DEFAULT NULL COMMENT 'group:Group',
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `count_views` int(11) DEFAULT NULL,
  `count_shares` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_user` varchar(100) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_user` varchar(100) DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `provider`
--

CREATE TABLE IF NOT EXISTS `provider` (
  `id` int(11) NOT NULL,
  `image` varchar(300) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `content` text,
  `start_date` varchar(255) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL COMMENT 'group:CONTACT',
  `phone` varchar(255) DEFAULT NULL COMMENT 'group:CONTACT',
  `email` varchar(255) DEFAULT NULL COMMENT 'group:CONTACT',
  `address` varchar(2000) DEFAULT NULL COMMENT 'group:CONTACT',
  `website` varchar(255) DEFAULT NULL COMMENT 'group:CONTACT',
  `city` varchar(100) DEFAULT NULL COMMENT 'group:LOCATION',
  `country` varchar(100) DEFAULT NULL COMMENT 'group:LOCATION',
  `lat` float DEFAULT NULL COMMENT 'group:LOCATION',
  `long` float DEFAULT NULL COMMENT 'group:LOCATION',
  `rate` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL COMMENT 'data:Author,Partner,Distributor,Manufacturer',
  `status` varchar(100) DEFAULT NULL COMMENT 'data:New,VIP,Partner,Normal,Closed',
  `is_top` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_user` varchar(100) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_user` varchar(100) DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `overview` varchar(2000) DEFAULT NULL,
  `content` text,
  `type` varchar(100) DEFAULT NULL COMMENT 'data:Text,Audio,Video',
  `status` varchar(100) DEFAULT NULL COMMENT 'data:Draft,Final',
  `category_id` varchar(500) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_user` varchar(100) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_user` varchar(100) DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `question_options`
--

CREATE TABLE IF NOT EXISTS `question_options` (
  `id` bigint(20) NOT NULL,
  `question_id` varchar(100) NOT NULL COMMENT 'lookup:@question',
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `id` int(11) NOT NULL,
  `metaKey` varchar(255) DEFAULT NULL,
  `metaValue` text,
  `group` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `metaKey`, `metaValue`, `group`, `is_active`, `application_id`) VALUES
(1, 'ADMIN_EMAIL', 'admin-email@gmail.com', NULL, NULL, NULL),
(2, 'GOOGLE_API_KEY', 'AIzaSyAKb1Qz5tE3P9O0F-mRAPQdXgQi5UfGE1g', NULL, NULL, NULL),
(3, 'PEM_FILE', '1483088916.pem', NULL, NULL, NULL),
(4, 'COMPANY_NAME', 'PT', NULL, NULL, NULL),
(5, 'COMPANY_DESCRIPTION', 'App & Template', NULL, NULL, NULL),
(6, 'COMPANY_HOMEPAGE', 'projectemplate.com', NULL, NULL, NULL),
(7, 'EXCHANGE_RATE', '1', NULL, NULL, NULL),
(8, 'DEAL_ONLINE_RATE', '1', NULL, NULL, NULL),
(9, 'PREMIUM_DEAL_ONLINE_RATE', '3', NULL, NULL, NULL),
(10, 'DRIVER_ONLINE_RATE', '3', NULL, NULL, NULL),
(11, 'SEARCHING_DEAL_DISTANCE', '5', NULL, NULL, NULL),
(12, 'SEARCHING_DRIVER_DISTANCE', '10', NULL, NULL, NULL),
(13, 'EXCHANGE_FEE', '1', NULL, NULL, NULL),
(14, 'TRANSFER_FEE', '0', NULL, NULL, NULL),
(15, 'REDEEM_FEE', '0', NULL, NULL, NULL),
(16, 'TRIP_PAYMENT_FEE', '0', NULL, NULL, NULL),
(17, 'DEAL_PAYMENT_FEE', '0', NULL, NULL, NULL),
(18, 'PAGE_FAQ', '<h1 style="text-align:center">FAQs</h1>\n\n<h4 style="text-align:center">&quot;Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...&quot;</h4>\n\n<h5 style="text-align:center">&quot;There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...&quot;</h5>\n\n<p>&nbsp;</p>\n\n<p><strong>Frequently asked questions</strong>&nbsp;(<strong>FAQ</strong>) or&nbsp;<strong>Questions and Answers</strong>&nbsp;(<strong>Q&amp;A</strong>), are listed questions and answers, all supposed to be commonly asked in some context, and pertaining to a particular topic. The format is commonly used on email mailing lists and other online forums, where certain common questions tend to recur.</p>\n\n<p>&quot;FAQ&quot; is pronounced as either an&nbsp;<a class="mw-redirect" href="https://en.wikipedia.org/wiki/Initialism" style="text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Initialism">initialism</a>&nbsp;(F-A-Q) or an&nbsp;<a href="https://en.wikipedia.org/wiki/Acronym" style="text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Acronym">acronym</a>. Since the acronym&nbsp;<em>FAQ</em>&nbsp;originated in textual media, its&nbsp;<a href="https://en.wikipedia.org/wiki/Pronunciation" style="text-decoration: none; color: rgb(11, 0, 128); background: none;" title="Pronunciation">pronunciation</a>&nbsp;varies; &quot;F-A-Q&quot;,<sup><a href="https://en.wikipedia.org/wiki/FAQ#cite_note-pron-1" style="text-decoration: none; color: rgb(11, 0, 128); background: none;">[1]</a></sup>&nbsp;is commonly heard. Depending on usage, the term may refer specifically to a single frequently asked question, or to an assembled list of many questions and their answers. Web page designers often label a single list of questions as a &quot;FAQ&quot;, such as on Google.com,<sup><a href="https://en.wikipedia.org/wiki/FAQ#cite_note-2" style="text-decoration: none; color: rgb(11, 0, 128); background: none;">[2]</a></sup>&nbsp;while using &quot;FAQs&quot; to denote multiple lists of questions such as on United States Treasury sites.<sup><a href="https://en.wikipedia.org/wiki/FAQ#cite_note-3" style="text-decoration: none; color: rgb(11, 0, 128); background: none;">[3]</a></sup></p>\n', NULL, NULL, NULL),
(19, 'PAGE_ABOUT', '<h1 style="text-align:center">About us</h1>\n\n<h4 style="text-align:center">&quot;Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...&quot;</h4>\n\n<h5 style="text-align:center">&quot;There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...&quot;</h5>\n\n<p>&nbsp;</p>\n', NULL, NULL, NULL),
(20, 'PAGE_HELP', '<h1 style="text-align:center">Help</h1>\n\n<h4 style="text-align:center">&quot;Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...&quot;</h4>\n\n<h5 style="text-align:center">&quot;There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...&quot;</h5>\n\n<p>&nbsp;</p>\n', NULL, NULL, NULL),
(21, 'PAGE_TERM', '<h1 style="text-align:center">Term and Condition</h1>\n\n<h4 style="text-align:center">&quot;Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...&quot;</h4>\n\n<h5 style="text-align:center">&quot;There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...&quot;</h5>\n\n<hr />\n<div id="Content" style="margin: 0px; padding: 0px; position: relative; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: center;">\n<div class="boxed" style="margin: 10px 28.7969px; padding: 0px; clear: both;">\n<div id="lipsum" style="margin: 0px; padding: 0px; text-align: justify;">\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus accumsan sapien ut dolor blandit, vitae volutpat lectus egestas. Duis interdum tortor eget ultrices ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam placerat molestie diam eu placerat. Vestibulum ac libero metus. Proin eget congue eros. Sed non sollicitudin ante. Ut vehicula consectetur turpis, at pretium augue viverra id. Curabitur elementum metus sed nibh malesuada, dapibus molestie metus aliquam. Morbi eleifend quis turpis posuere finibus. Nullam aliquam nisl et sollicitudin porta. Nullam eu bibendum nulla. Ut scelerisque tristique mauris in malesuada. Aliquam erat volutpat.</p>\n</div>\n</div>\n</div>\n', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL,
  `metaKey` varchar(255) NOT NULL,
  `metaValue` varchar(255) DEFAULT NULL,
  `group` varchar(255) DEFAULT NULL,
  `editor` varchar(255) DEFAULT NULL COMMENT 'editor:select;lookup:editor',
  `lookup` varchar(255) DEFAULT NULL COMMENT 'editor:select;lookup:object_type',
  `is_active` tinyint(1) DEFAULT NULL,
  `is_system` tinyint(1) DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2455 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `metaKey`, `metaValue`, `group`, `editor`, `lookup`, `is_active`, `is_system`, `application_id`) VALUES
(2210, 'Main Color', 'green', 'Theme', '\\kartik\\widgets\\Select2', 'color', 1, 0, 'cms'),
(2211, 'Footer View', 'footer.php', 'Website', 'textarea', '', 1, 0, 'cms'),
(2212, 'Header View', 'header.php', 'Website', 'textarea', '', 1, 0, 'cms'),
(2213, 'keyword', '', 'Information', 'textarea', '', 1, 0, 'cms'),
(2214, 'Page Header Content (HTML, CSS, JS)', '', 'Website', 'textarea', '', 1, 0, 'cms'),
(2215, 'body_css', '', 'Config', 'textarea', '', 1, 0, 'cms'),
(2216, 'description', '', 'Config', 'textarea', '', 1, 0, 'cms'),
(2217, 'Website Version', 'beta', 'Website', 'textarea', '', 1, 0, 'cms'),
(2218, 'Cart Enabled', '', 'Ecommerce', 'textarea', '', 1, 0, 'cms'),
(2219, 'Is User Messages Enabled', '1', 'Website', '\\kartik\\checkbox\\CheckboxX', '', 1, 0, 'cms'),
(2220, 'address', '', 'Config', 'textarea', '', 1, 0, 'cms'),
(2221, 'phone', '', 'Config', 'textarea', '', 1, 0, 'cms'),
(2222, 'email', '', 'Config', 'textarea', '', 1, 0, 'cms'),
(2223, 'copyright', '', 'Config', 'textarea', '', 1, 0, 'cms'),
(2224, 'name', '', 'Config', 'textarea', '', 1, 0, 'cms'),
(2225, 'slogan', '', 'Config', 'textarea', '', 1, 0, 'cms'),
(2226, 'privacy', '', 'Config', 'textarea', '', 1, 0, 'cms'),
(2227, 'terms_of_service', '', 'Config', 'textarea', '', 1, 0, 'cms'),
(2228, 'facebook', '', 'Config', 'textarea', '', 1, 0, 'cms'),
(2229, 'twitter', '', 'Config', 'textarea', '', 1, 0, 'cms'),
(2230, 'google', '', 'Config', 'textarea', '', 1, 0, 'cms'),
(2231, 'youtube', '', 'Config', 'textarea', '', 1, 0, 'cms'),
(2232, 'Format Date', 'd.m.Y', 'Format', 'textarea', '', 1, 0, 'cms'),
(2233, 'Format Currency', 'USD', 'Format', 'textarea', '', 1, 0, 'cms'),
(2234, 'Digit After Decimal', '0', 'Format', 'textarea', '', 1, 0, 'cms'),
(2235, 'Decimal Symbol', '.', 'Format', 'textarea', '', 1, 0, 'cms'),
(2236, 'Thousand Grouping Symbol', ',', 'Format', 'textarea', '', 1, 0, 'cms'),
(2237, 'Buttons Style', 'icons', 'Theme', '\\kartik\\widgets\\Select2', 'buttons_style', 1, 0, 'cms'),
(2238, 'Theme Style', 'Material Design', 'Theme', '\\kartik\\widgets\\Select2', 'theme_style', 1, 0, 'cms'),
(2239, 'Theme Color', 'light', 'Theme', '\\kartik\\widgets\\Select2', 'theme_color', 1, 0, 'cms'),
(2240, 'Controls Alignment', 'horizontal', 'Theme', '\\kartik\\widgets\\Select2', 'controls_alignment', 1, 0, 'cms'),
(2241, 'Languages', '{"en":"English","vi":"Vietnam"}', 'Config', 'textarea', '', 1, 0, 'cms'),
(2242, 'chat', '', 'Config', 'textarea', '', 1, 0, 'cms'),
(2243, 'Backend/Cms-blogs/ Index  View', '_index', 'Cms', 'textarea', '', 1, 0, 'cms'),
(2244, 'Grid Display Type', '', 'Information', 'textarea', '', 1, 0, 'cms'),
(2245, 'Backend/Cms-testimonial/ Index  View', '_index', 'Cms', 'textarea', '', 1, 0, 'cms'),
(2246, 'Backend/Cms-testimonial/ Update Form View', '_form', 'Cms', 'textarea', '', 1, 0, 'cms'),
(2247, 'Accepted Files uploaded', 'image/*,video/*,audio/*,.docx,.txt,.xls,.pdf,.xlsx,.doc,.ppt', 'Format', 'textarea', '', 1, 0, 'cms'),
(2248, 'Max File Size', '900000', 'Format', 'textarea', '', 1, 0, 'cms'),
(2249, 'Backend/Application/ Index  View', '_index', 'System', 'textarea', '', 1, 0, 'cms'),
(2250, 'Backend/Cms-article/ Index  View', '_index', 'Cms', 'textarea', '', 1, 0, 'cms'),
(2251, 'Backend/Cms-portfolio/ Index  View', '_index', 'Cms', 'textarea', '', 1, 0, 'cms'),
(2252, 'Backend/Cms-partner/ Index  View', '_index', 'Cms', 'textarea', '', 1, 0, 'cms'),
(2253, 'Backend/Cms-about/ Index  View', '_index', 'Cms', 'textarea', '', 1, 0, 'cms'),
(2254, 'Backend/Cms-album/ Index  View', '_index', 'Cms', 'textarea', '', 1, 0, 'cms'),
(2255, 'Backend/Cms-feedback/ Index  View', '_index', 'Cms', 'textarea', '', 1, 0, 'cms'),
(2256, 'Backend/Cms-slide/ Index  View', '_index', 'Cms', 'textarea', '', 1, 0, 'cms'),
(2257, 'Backend/Cms-service/ Index  View', '_index', 'Cms', 'textarea', '', 1, 0, 'cms'),
(2258, 'Backend/Object-actions/ Index  View', '_index', 'System', 'textarea', '', 1, 0, 'cms'),
(2265, 'ADMIN_INLINE_EDIT', '1', 'Config', 'textarea', '', 1, 0, 'cms'),
(2266, 'Field Layout', 'table', 'Theme', '\\kartik\\widgets\\Select2', 'field_layout', 1, 0, 'cms'),
(2267, 'Backend/Auth-role/ Index  View', '_index', 'System', 'textarea', '', 1, 0, 'cms'),
(2268, 'Backend/Auth-group/ Index  View', '_index', 'System', 'textarea', '', 1, 0, 'cms'),
(2269, 'Backend/User/ Index  View', '_index', 'System', 'textarea', '', 1, 0, 'cms'),
(2270, 'Backend/Settings/ Index  View', '_index', 'System', 'textarea', '', 1, 0, 'cms'),
(2271, 'Backend/Cms-contact/ Index  View', '_index', 'Cms', 'textarea', '', 1, 0, 'cms'),
(2272, 'Backend/Cms-faq/ Index  View', '_index', 'Cms', 'textarea', '', 1, 0, 'cms'),
(2273, 'Backend/Cms-employee/ Index  View', '_index', 'Cms', 'textarea', '', 1, 0, 'cms'),
(2274, 'Backend/Cms-statistics/ Index  View', '_index', 'Cms', 'textarea', '', 1, 0, 'cms'),
(2275, 'Backend/App-user/ Index  View', '_index', 'App', 'textarea', '', 1, 0, 'cms'),
(2276, 'Backend/App-user-device/ Index  View', '_index', 'App', 'textarea', '', 1, 0, 'cms'),
(2277, 'Backend/App-user-feedback/ Index  View', '_index', 'App', 'textarea', '', 1, 0, 'cms'),
(2294, 'Buttons Style', 'icons', 'Theme', '\\kartik\\widgets\\Select2', 'buttons_style', 1, 0, 'default'),
(2295, 'Theme Style', 'Material Design', 'Theme', '\\kartik\\widgets\\Select2', 'theme_style', 1, 0, 'default'),
(2296, 'Theme Color', 'light', 'Theme', '\\kartik\\widgets\\Select2', 'theme_color', 1, 0, 'default'),
(2297, 'Controls Alignment', 'horizontal', 'Theme', '\\kartik\\widgets\\Select2', 'controls_alignment', 1, 0, 'default'),
(2298, 'Languages', '{"en":"English","vi":"Vietnam"}', 'Config', 'textarea', '', 1, 0, 'default'),
(2299, 'copyright', 'Copyright by', 'Config', 'textarea', '', 1, 0, 'default'),
(2300, 'website', 'http://wwww.mozagroup.com', 'Config', 'textarea', '', 1, 0, 'default'),
(2301, 'name', 'MOZA TECH', 'Config', 'textarea', '', 1, 0, 'default'),
(2302, 'slogan', '', 'Config', 'textarea', '', 1, 0, 'default'),
(2303, 'address', '', 'Config', 'textarea', '', 1, 0, 'default'),
(2304, 'email', 'support@mozagroup.com', 'Config', 'textarea', '', 1, 0, 'default'),
(2305, 'phone', '', 'Config', 'textarea', '', 1, 0, 'default'),
(2306, 'chat', '', 'Config', 'textarea', '', 1, 0, 'default'),
(2307, 'Buttons Style', 'icons', 'Theme', '\\kartik\\widgets\\Select2', 'buttons_style', 1, 0, 'vinh_hung'),
(2308, 'Theme Style', 'Material Design', 'Theme', '\\kartik\\widgets\\Select2', 'theme_style', 1, 0, 'vinh_hung'),
(2309, 'Theme Color', 'light', 'Theme', '\\kartik\\widgets\\Select2', 'theme_color', 1, 0, 'vinh_hung'),
(2310, 'Controls Alignment', 'horizontal', 'Theme', '\\kartik\\widgets\\Select2', 'controls_alignment', 1, 0, 'vinh_hung'),
(2311, 'Backend/User/ Index  View', '_index', 'System', 'textarea', '', 1, 0, 'vinh_hung'),
(2312, 'Grid Display Type', '', 'Information', 'textarea', '', 1, 0, 'vinh_hung'),
(2313, 'Languages', '{"en":"English","vi":"Vietnam"}', 'Config', 'textarea', '', 1, 0, 'vinh_hung'),
(2314, 'copyright', 'Copyright by', 'Config', 'textarea', '', 1, 0, 'vinh_hung'),
(2315, 'website', 'http://wwww.mozagroup.com', 'Config', 'textarea', '', 1, 0, 'vinh_hung'),
(2316, 'name', 'MOZA TECH', 'Config', 'textarea', '', 1, 0, 'vinh_hung'),
(2317, 'slogan', '', 'Config', 'textarea', '', 1, 0, 'vinh_hung'),
(2318, 'address', '', 'Config', 'textarea', '', 1, 0, 'vinh_hung'),
(2319, 'email', 'support@mozagroup.com', 'Config', 'textarea', '', 1, 0, 'vinh_hung'),
(2320, 'phone', '', 'Config', 'textarea', '', 1, 0, 'vinh_hung'),
(2321, 'chat', '', 'Config', 'textarea', '', 1, 0, 'vinh_hung'),
(2322, 'Backend/User/ Create Form View', '_form', 'System', 'textarea', '', 1, 0, 'vinh_hung'),
(2323, 'Accepted Files uploaded', 'image/*,video/*,audio/*,.docx,.txt,.xls,.pdf,.xlsx,.doc,.ppt', 'Format', 'textarea', '', 1, 0, 'vinh_hung'),
(2324, 'Max File Size', '900000', 'Format', 'textarea', '', 1, 0, 'vinh_hung'),
(2325, 'Format Date', 'd.m.Y', 'Format', 'textarea', '', 1, 0, 'vinh_hung'),
(2372, 'Buttons Style', 'icons', 'Theme', '\\kartik\\widgets\\Select2', 'buttons_style', 1, 0, 'trayolo'),
(2373, 'Theme Style', 'Material Design', 'Theme', '\\kartik\\widgets\\Select2', 'theme_style', 1, 0, 'trayolo'),
(2374, 'Theme Color', 'light', 'Theme', '\\kartik\\widgets\\Select2', 'theme_color', 1, 0, 'trayolo'),
(2375, 'Controls Alignment', 'horizontal', 'Theme', '\\kartik\\widgets\\Select2', 'controls_alignment', 1, 0, 'trayolo'),
(2376, 'ADMIN_INLINE_EDIT', '1', 'Config', 'textarea', '', 1, 0, 'trayolo'),
(2377, 'Grid Display Type', '', 'Information', 'textarea', '', 1, 0, 'trayolo'),
(2378, 'Languages', '{"en":"English","vi":"Vietnam"}', 'Config', 'textarea', '', 1, 0, 'trayolo'),
(2379, 'copyright', 'Copyright by', 'Config', 'textarea', '', 1, 0, 'trayolo'),
(2380, 'website', 'http://wwww.mozagroup.com', 'Config', 'textarea', '', 1, 0, 'trayolo'),
(2381, 'name', 'MOZA TECH', 'Config', 'textarea', '', 1, 0, 'trayolo'),
(2382, 'slogan', '', 'Config', 'textarea', '', 1, 0, 'trayolo'),
(2383, 'address', '', 'Config', 'textarea', '', 1, 0, 'trayolo'),
(2384, 'email', 'support@mozagroup.com', 'Config', 'textarea', '', 1, 0, 'trayolo'),
(2385, 'phone', '', 'Config', 'textarea', '', 1, 0, 'trayolo'),
(2386, 'chat', '', 'Config', 'textarea', '', 1, 0, 'trayolo'),
(2387, 'Decimal Symbol', '.', 'Format', 'textarea', '', 1, 0, 'trayolo'),
(2388, 'Thousand Grouping Symbol', ',', 'Format', 'textarea', '', 1, 0, 'trayolo'),
(2389, 'Accepted Files uploaded', 'image/*,video/*,audio/*,.docx,.txt,.xls,.pdf,.xlsx,.doc,.ppt', 'Format', 'textarea', '', 1, 0, 'trayolo'),
(2390, 'Max File Size', '900000', 'Format', 'textarea', '', 1, 0, 'trayolo'),
(2391, 'Format Date', 'd.m.Y', 'Format', 'textarea', '', 1, 0, 'trayolo'),
(2392, 'FILE_SIZE_MAX', '4000', 'Config', 'textarea', '', 1, 0, 'trayolo'),
(2393, 'test', 'test', '', '', '', 1, NULL, 'trayolo'),
(2394, 'Field Layout', 'table', 'Theme', '\\kartik\\widgets\\Select2', 'field_layout', 1, 0, 'trayolo'),
(2395, 'Grid Display Type', '', 'Information', 'textarea', '', 1, 0, 'default'),
(2396, 'Decimal Symbol', '.', 'Format', 'textarea', '', 1, 0, 'default'),
(2397, 'Thousand Grouping Symbol', ',', 'Format', 'textarea', '', 1, 0, 'default'),
(2398, 'Accepted Files uploaded', 'image/*,video/*,audio/*,.docx,.txt,.xls,.pdf,.xlsx,.doc,.ppt', 'Format', 'textarea', '', 1, 0, 'default'),
(2399, 'Max File Size', '900000', 'Format', 'textarea', '', 1, 0, 'default'),
(2400, 'Format Date', 'd.m.Y', 'Format', 'textarea', '', 1, 0, 'default'),
(2401, 'ADMIN_INLINE_EDIT', '1', 'Config', 'textarea', '', 1, 0, 'default'),
(2402, 'website', 'http://wwww.mozagroup.com', 'Config', 'textarea', '', 1, 0, 'cms'),
(2403, 'logo', 'logo.png', 'Information', 'textarea', '', 1, 0, 'trayolo'),
(2404, 'Main Color', 'green', 'Theme', '\\kartik\\widgets\\Select2', 'color', 1, 0, 'trayolo'),
(2405, 'Page Description', '', 'Website', 'textarea', '', 1, 0, 'trayolo'),
(2406, 'Page Image', '', 'Website', 'textarea', '', 1, 0, 'trayolo'),
(2407, 'keyword', '', 'Information', 'textarea', '', 1, 0, 'trayolo'),
(2408, 'PAGE HEADER', '', 'Website', 'textarea', '', 1, 0, 'trayolo'),
(2409, 'description', '', 'Config', 'textarea', '', 1, 0, 'trayolo'),
(2410, 'Website Version', '', 'Website', 'textarea', '', 1, 0, 'trayolo'),
(2411, 'Cart Enabled', '', 'Ecommerce', 'textarea', '', 1, 0, 'trayolo'),
(2412, 'Is User Messages Enabled', '1', 'Website', '\\kartik\\checkbox\\CheckboxX', '', 1, 0, 'trayolo'),
(2413, 'Web Zoom', '80%', 'Website', 'textarea', '', 1, 0, 'trayolo'),
(2414, 'Google API Key', 'AIzaSyCHpSPTym5KTydcgF5iwSE721IG0E-VNQA', 'Google', 'textarea', '', NULL, 0, 'trayolo'),
(2415, 'Buttons Style', 'icons', 'Theme', '\\kartik\\widgets\\Select2', 'buttons_style', 1, 0, 'mozaebook'),
(2416, 'Theme Style', 'Material Design', 'Theme', '\\kartik\\widgets\\Select2', 'theme_style', 1, 0, 'mozaebook'),
(2417, 'Theme Color', 'light', 'Theme', '\\kartik\\widgets\\Select2', 'theme_color', 1, 0, 'mozaebook'),
(2418, 'Controls Alignment', 'horizontal', 'Theme', '\\kartik\\widgets\\Select2', 'controls_alignment', 1, 0, 'mozaebook'),
(2419, 'logo', '', 'Information', 'textarea', '', 1, 0, 'mozaebook'),
(2420, 'copyright', 'Copyright by', 'Config', 'textarea', '', 1, 0, 'mozaebook'),
(2421, 'website', 'http://wwww.mozagroup.com', 'Config', 'textarea', '', 1, 0, 'mozaebook'),
(2422, 'name', 'MOZA TECH', 'Config', 'textarea', '', 1, 0, 'mozaebook'),
(2423, 'slogan', '', 'Config', 'textarea', '', 1, 0, 'mozaebook'),
(2424, 'address', '', 'Config', 'textarea', '', 1, 0, 'mozaebook'),
(2425, 'email', 'support@mozagroup.com', 'Config', 'textarea', '', 1, 0, 'mozaebook'),
(2426, 'phone', '', 'Config', 'textarea', '', 1, 0, 'mozaebook'),
(2427, 'chat', '', 'Config', 'textarea', '', 1, 0, 'mozaebook'),
(2428, 'Grid Display Type', '', 'Information', 'textarea', '', 1, 0, 'mozaebook'),
(2429, 'FILE_SIZE_MAX', '4000000', 'Config', 'textarea', '', 1, 0, 'mozaebook'),
(2430, 'Field Layout', 'table', 'Theme', '\\kartik\\widgets\\Select2', 'field_layout', 1, 0, 'mozaebook'),
(2431, 'Buttons Style', 'icons', 'Theme', '\\kartik\\widgets\\Select2', 'buttons_style', 1, 0, 'ebook'),
(2432, 'Theme Style', 'Material Design', 'Theme', '\\kartik\\widgets\\Select2', 'theme_style', 1, 0, 'ebook'),
(2433, 'Theme Color', 'light', 'Theme', '\\kartik\\widgets\\Select2', 'theme_color', 1, 0, 'ebook'),
(2434, 'Controls Alignment', 'horizontal', 'Theme', '\\kartik\\widgets\\Select2', 'controls_alignment', 1, 0, 'ebook'),
(2435, 'description', '', 'Config', 'textarea', '', 1, 0, 'ebook'),
(2436, 'keywords', '', 'Website', 'textarea', '', 1, 0, 'ebook'),
(2437, 'website', '', 'Config', 'textarea', '', 1, 0, 'ebook'),
(2438, 'slogan', '', 'Config', 'textarea', '', 1, 0, 'ebook'),
(2439, 'address', '', 'Config', 'textarea', '', 1, 0, 'ebook'),
(2440, 'email', '', 'Config', 'textarea', '', 1, 0, 'ebook'),
(2441, 'phone', '', 'Config', 'textarea', '', 1, 0, 'ebook'),
(2442, 'chat', '', 'Config', 'textarea', '', 1, 0, 'ebook'),
(2443, 'Portlet Style', 'box', 'Theme', '\\kartik\\widgets\\Select2', 'portlet_style', 1, 0, 'ebook'),
(2444, 'Grid Display Type', '', 'Config', 'textarea', '', 1, 0, 'ebook'),
(2445, 'FILE_SIZE_MAX', '4000000', 'Config', 'textarea', '', 1, 0, 'ebook'),
(2446, 'logo', '', 'Config', 'textarea', '', 1, 0, 'ebook'),
(2447, 'copyright', 'Copyright by', 'Config', 'textarea', '', 1, 0, 'ebook'),
(2448, 'name', 'MOZA TECH', 'Config', 'textarea', '', 1, 0, 'ebook'),
(2449, 'Format Date', 'Y.m.d', 'Format', 'textarea', '', 1, 0, 'ebook'),
(2450, 'backend_menu_style', 'open', 'Theme', '\\kartik\\widgets\\Select2', 'backend_menu_style', 1, 0, 'ebook'),
(2451, 'backend_font_size', '14px', 'Theme', '\\kartik\\widgets\\Select2', 'backend_font_size', 1, 0, 'ebook'),
(2452, 'backend_login_position', 'center', 'Theme', '\\kartik\\widgets\\Select2', 'backend_login_position', NULL, 0, 'ebook'),
(2453, 'backend_social_login', 'google, facebook, git, twitter', 'Security', '\\kartik\\widgets\\Select2', 'backend_social_login', NULL, 0, 'ebook'),
(2454, 'chat_url', 'https://code.tidio.co/3zqbdsmxw4qy5tpiss8l6dbjjvfvughj.js', 'Website', 'textarea', '', 1, 0, 'ebook');

-- --------------------------------------------------------

--
-- Table structure for table `settings_languages`
--

CREATE TABLE IF NOT EXISTS `settings_languages` (
  `id` int(11) NOT NULL,
  `lang` varchar(10) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `date_format` varchar(100) DEFAULT NULL,
  `sort_order` tinyint(4) DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `settings_lookup`
--

CREATE TABLE IF NOT EXISTS `settings_lookup` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `object_type` varchar(100) DEFAULT NULL,
  `params` varchar(2000) DEFAULT NULL,
  `fields` varchar(2000) DEFAULT NULL,
  `orderby` varchar(255) DEFAULT NULL,
  `limit` varchar(255) DEFAULT NULL,
  `sql` varchar(2000) DEFAULT NULL,
  `is_cached` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `sort_order` tinyint(4) DEFAULT NULL,
  `created_user` varchar(100) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings_lookup`
--

INSERT INTO `settings_lookup` (`id`, `name`, `object_type`, `params`, `fields`, `orderby`, `limit`, `sql`, `is_cached`, `is_active`, `sort_order`, `created_user`, `created_date`, `application_id`) VALUES
(1, 'Top10Products', 'product', '', 'id,name,description,price', 'price desc', '10', '', 1, 1, NULL, '6', '2017-01-17', 'default'),
(2, '5Products', 'product', '', '', '', '', '', 1, 1, NULL, '6', '2017-01-17', 'default'),
(3, 'AllUsers', 'user', '', 'user_id,user_name,email,role', '', '', '', 1, 1, NULL, '6', '2017-01-17', 'default'),
(4, 'AllSongs', 'music_song', '', 'id,name,description', '', '', '', 1, 1, NULL, '6', '2017-01-17', 'default'),
(5, 'Top5Blogs', 'cms_blogs', '', 'id,name,overview,is_active', 'name desc', '', '', 1, 1, NULL, '6', '2017-01-16', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `settings_menu`
--

CREATE TABLE IF NOT EXISTS `settings_menu` (
  `id` int(11) NOT NULL,
  `icon` varchar(300) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `object_type` varchar(100) DEFAULT NULL,
  `module` varchar(100) DEFAULT NULL COMMENT 'lookup:module',
  `group` varchar(100) DEFAULT NULL COMMENT 'data:FRONTEND,BACKEND',
  `role` varchar(100) DEFAULT NULL,
  `menu_type` varchar(100) DEFAULT NULL COMMENT 'data:CATEGORY,TYPE,STATUS,MIXED',
  `display_type` varchar(100) DEFAULT NULL COMMENT 'data:DEFAULT,TREE,MEGA',
  `sort_order` int(11) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_user` varchar(100) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_user` varchar(100) DEFAULT NULL,
  `application_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings_menu`
--

INSERT INTO `settings_menu` (`id`, `icon`, `name`, `url`, `object_type`, `module`, `group`, `role`, `menu_type`, `display_type`, `sort_order`, `is_active`, `created_date`, `created_user`, `modified_date`, `modified_user`, `application_id`) VALUES
(18, 'fa fa-list', 'Home', 'site/index', '', 'Home', 'backend', 'null', NULL, NULL, 1, 1, '2017-08-02 14:53:41', '6', NULL, NULL, 'ebook'),
(19, 'glyphicon glyphicon-book', 'Book', '/book/book/index', 'book', 'Book', 'backend', 'null', NULL, NULL, 1, 1, '2017-08-02 14:53:52', '6', NULL, NULL, 'ebook'),
(20, 'glyphicon glyphicon-book', 'BOOK', '#', NULL, 'Book', 'backend', 'null', NULL, NULL, 0, 1, '2017-08-02 14:53:53', '6', NULL, NULL, 'ebook');

-- --------------------------------------------------------

--
-- Table structure for table `settings_onepay_coin`
--

CREATE TABLE IF NOT EXISTS `settings_onepay_coin` (
  `id` int(11) NOT NULL,
  `coin` int(11) NOT NULL,
  `vnd` float NOT NULL,
  `usd` float NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1' COMMENT '1:Active 0:Inactive',
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings_onepay_coin`
--

INSERT INTO `settings_onepay_coin` (`id`, `coin`, `vnd`, `usd`, `is_active`, `created_date`, `modified_date`) VALUES
(1, 10, 100, 4, 1, '2017-03-07 11:10:41', '2017-03-08 05:19:15'),
(2, 20, 200, 8, 1, '2017-03-07 11:10:41', '2017-03-08 05:19:52'),
(3, 100, 900, 30, 1, '2017-03-07 11:10:41', '2017-03-08 05:20:16'),
(4, 200, 1800, 60, 1, '2017-03-07 11:10:41', '2017-03-07 11:11:56');

-- --------------------------------------------------------

--
-- Table structure for table `settings_schema`
--

CREATE TABLE IF NOT EXISTS `settings_schema` (
  `id` int(11) NOT NULL,
  `object_type` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `dbType` varchar(100) DEFAULT NULL COMMENT 'data:numeric,bool,float,varchar,text,date,time,datetime',
  `editor` varchar(100) DEFAULT NULL COMMENT 'data:text,textarea,select,numeric,currency,boolean,date,time,datetime,range,file,image',
  `lookup` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `algorithm` varchar(255) DEFAULT NULL,
  `group` varchar(255) DEFAULT NULL,
  `roles` varchar(500) DEFAULT NULL COMMENT 'lookup:role',
  `sort_order` int(5) DEFAULT NULL,
  `is_group` tinyint(1) DEFAULT NULL,
  `is_column` tinyint(1) DEFAULT NULL,
  `is_readonly` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_system` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2452 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings_schema`
--

INSERT INTO `settings_schema` (`id`, `object_type`, `name`, `description`, `dbType`, `editor`, `lookup`, `format`, `algorithm`, `group`, `roles`, `sort_order`, `is_group`, `is_column`, `is_readonly`, `is_active`, `is_system`) VALUES
(1848, 'cms_blogs', 'id', '', 'bigint(20)', '', '', '', '', '', '', 2, NULL, 1, NULL, 1, 1),
(1849, 'cms_blogs', 'image', '', 'varchar(300)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(1850, 'cms_blogs', 'banner', '', 'varchar(300)', '', '', '', '', '', '', 6, NULL, 0, NULL, 1, 1),
(1851, 'cms_blogs', 'code', '', 'varchar(255)', '', '', '', '', '', '', 5, NULL, 0, NULL, 1, 1),
(1852, 'cms_blogs', 'name', '', 'varchar(255)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(1853, 'cms_blogs', 'type', '', 'varchar(100)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(1854, 'cms_blogs', 'status', '', 'varchar(100)', '', '', '', '', '', '', 14, NULL, 1, NULL, 1, 1),
(1855, 'cms_blogs', 'category_id', '', 'varchar(500)', '', '', '', '', '', '', 15, NULL, 1, NULL, 1, 1),
(1856, 'cms_blogs', 'is_active', '', 'tinyint(1)', '', '', '', '', '', '', 19, NULL, 1, NULL, 1, 1),
(1857, 'cms_blogs', 'lang', '', 'varchar(50)', '', '', '', '', '', '', 13, NULL, 1, NULL, 1, 1),
(1858, 'cms_blogs', 'linkurl', '', 'varchar(255)', '', '', '', '', '', '', 10, NULL, 1, NULL, 1, 1),
(1859, 'cms_blogs', 'author', '', 'varchar(255)', '', '', '', '', '', '', 11, NULL, 1, NULL, 1, 1),
(1860, 'cms_blogs', 'is_top', '', 'tinyint(1)', '', '', '', '', '', '', 16, NULL, 1, NULL, 1, 1),
(1861, 'cms_blogs', 'is_new', '', 'tinyint(1)', '', '', '', '', '', '', 17, NULL, 1, NULL, 1, 1),
(1862, 'cms_blogs', 'is_hot', '', 'tinyint(1)', '', '', '', '', '', '', 18, NULL, 1, NULL, 1, 1),
(1863, 'cms_blogs', 'thumbnail', '', 'varchar(300)', '', '', '', '', '', '', 1, NULL, NULL, NULL, 1, 1),
(1864, 'cms_blogs', 'overview', '', 'varchar(2000)', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(1865, 'cms_blogs', 'content', '', 'text', '', '', '', '', '', '', 9, NULL, NULL, NULL, 1, 1),
(1866, 'cms_blogs', 'tags', '', 'varchar(1000)', '', '', '', '', '', '', 12, NULL, NULL, NULL, 1, 1),
(1867, 'cms_blogs', 'count_views', '', 'int(11)', '', '', '', '', '', '', 20, NULL, NULL, 1, 1, 1),
(1868, 'cms_blogs', 'count_comments', '', 'int(11)', '', '', '', '', '', '', 21, NULL, NULL, 1, 1, 1),
(1869, 'cms_blogs', 'count_likes', '', 'int(11)', '', '', '', '', '', '', 22, NULL, NULL, 1, 1, 1),
(1870, 'cms_blogs', 'rates', '', 'int(11)', '', '', '', '', '', '', 23, NULL, NULL, 1, 1, 1),
(1871, 'cms_blogs', 'created_date', '', 'date', '', '', '', '', '', '', 25, NULL, NULL, 1, 1, 1),
(1872, 'cms_blogs', 'created_user', '', 'varchar(100)', '', '', '', '', '', '', 26, NULL, NULL, 1, 1, 1),
(1873, 'cms_blogs', 'modified_date', '', 'date', '', '', '', '', '', '', 27, NULL, NULL, 1, 1, 1),
(1874, 'cms_blogs', 'modified_user', '', 'varchar(100)', '', '', '', '', '', '', 28, NULL, NULL, 1, 1, 1),
(1875, 'cms_blogs', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 29, NULL, NULL, NULL, 1, 1),
(1876, 'cms_blogs', 'count_rates', '', 'int(11)', '', '', '', '', '', '', 23, NULL, NULL, 1, 1, 1),
(1877, 'cms_article', 'id', '', 'bigint(20)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(1878, 'cms_article', 'image', '', 'varchar(300)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(1879, 'cms_article', 'banner', '', 'varchar(300)', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(1880, 'cms_article', 'code', '', 'varchar(255)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(1881, 'cms_article', 'name', '', 'varchar(250)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(1882, 'cms_article', 'linkurl', '', 'varchar(255)', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(1883, 'cms_article', 'type', '', 'varchar(50)', '', '', '', '', '', '', 9, NULL, 1, NULL, 1, 1),
(1884, 'cms_article', 'lang', '', 'varchar(50)', '', '', '', '', '', '', 10, NULL, 1, NULL, 1, 1),
(1885, 'cms_article', 'is_active', '', 'tinyint(1)', '', '', '', '', '', '', 11, NULL, 1, NULL, 1, 1),
(1886, 'cms_article', 'is_top', '', 'tinyint(1)', '', '', '', '', '', '', 12, NULL, 1, NULL, 1, 1),
(1887, 'cms_article', 'thumbnail', '', 'varchar(300)', '', '', '', '', '', '', 2, NULL, NULL, NULL, 1, 1),
(1888, 'cms_article', 'overview', '', 'varchar(2000)', '', '', '', '', '', '', 7, NULL, NULL, NULL, 1, 1),
(1889, 'cms_article', 'content', '', 'text', '', '', '', '', '', '', 8, NULL, NULL, NULL, 1, 1),
(1890, 'cms_article', 'sort_order', '', 'int(5)', '', '', '', '', '', '', 10, NULL, NULL, NULL, 1, 1),
(1891, 'cms_article', 'created_date', '', 'date', '', '', '', '', '', '', 15, NULL, NULL, 1, 1, 1),
(1892, 'cms_article', 'created_user', '', 'varchar(150)', '', '', '', '', '', '', 16, NULL, NULL, 1, 1, 1),
(1893, 'cms_article', 'modified_date', '', 'date', '', '', '', '', '', '', 17, NULL, NULL, 1, 1, 1),
(1894, 'cms_article', 'modified_user', '', 'varchar(150)', '', '', '', '', '', '', 18, NULL, NULL, 1, 1, 1),
(1895, 'cms_article', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 19, NULL, NULL, NULL, 1, 1),
(1896, 'cms_service', 'id', '', 'bigint(20)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(1897, 'cms_service', 'image', '', 'varchar(300)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(1898, 'cms_service', 'name', '', 'varchar(250)', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(1899, 'cms_service', 'linkurl', '', 'varchar(255)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(1900, 'cms_service', 'lang', '', 'varchar(50)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(1901, 'cms_service', 'is_active', '', 'tinyint(1)', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(1902, 'cms_service', 'is_top', '', 'tinyint(1)', '', '', '', '', '', '', 9, NULL, 1, NULL, 1, 1),
(1903, 'cms_service', 'thumbnail', '', 'varchar(300)', '', '', '', '', '', '', 2, NULL, NULL, NULL, 1, 1),
(1904, 'cms_service', 'overview', '', 'varchar(2000)', '', '', '', '', '', '', 5, NULL, NULL, NULL, 1, 1),
(1905, 'cms_service', 'content', '', 'text', '', '', '', '', '', '', 6, NULL, NULL, NULL, 1, 1),
(1906, 'cms_service', 'sort_order', '', 'int(5)', '', '', '', '', '', '', 8, NULL, NULL, NULL, 1, 1),
(1907, 'cms_service', 'created_date', '', 'date', '', '', '', '', '', '', 12, NULL, NULL, 1, 1, 1),
(1908, 'cms_service', 'created_user', '', 'varchar(150)', '', '', '', '', '', '', 13, NULL, NULL, 1, 1, 1),
(1909, 'cms_service', 'modified_date', '', 'date', '', '', '', '', '', '', 14, NULL, NULL, 1, 1, 1),
(1910, 'cms_service', 'modified_user', '', 'varchar(150)', '', '', '', '', '', '', 15, NULL, NULL, 1, 1, 1),
(1911, 'cms_service', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 16, NULL, NULL, NULL, 1, 1),
(1912, 'cms_portfolio', 'id', '', 'int(11)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(1913, 'cms_portfolio', 'image', '', 'varchar(300)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(1914, 'cms_portfolio', 'banner', '', 'varchar(300)', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(1915, 'cms_portfolio', 'name', '', 'varchar(255)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(1916, 'cms_portfolio', 'status', '', 'varchar(50)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(1917, 'cms_portfolio', 'linkurl', '', 'varchar(255)', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(1918, 'cms_portfolio', 'testimonial_id', '', 'int(11)', 'select', '@cms_testimonial', '', '', '', '', 9, NULL, 1, NULL, 1, 1),
(1919, 'cms_portfolio', 'product_id', '', 'int(11)', 'select', '@product', '', '', '', '', 10, NULL, 1, NULL, 1, 1),
(1920, 'cms_portfolio', 'product_category_id', '', 'varchar(500)', 'select', '@object_category', '', '', '', '', 11, NULL, 1, NULL, 1, 1),
(1921, 'cms_portfolio', 'lang', '', 'varchar(50)', '', '', '', '', '', '', 12, NULL, 1, NULL, 1, 1),
(1922, 'cms_portfolio', 'is_active', '', 'tinyint(1)', '', '', '', '', '', '', 13, NULL, 1, NULL, 1, 1),
(1923, 'cms_portfolio', 'is_top', '', 'tinyint(1)', '', '', '', '', '', '', 14, NULL, 1, NULL, 1, 1),
(1924, 'cms_portfolio', 'overview', '', 'varchar(2000)', '', '', '', '', '', '', 5, NULL, NULL, NULL, 1, 1),
(1925, 'cms_portfolio', 'content', '', 'text', '', '', '', '', '', '', 6, NULL, NULL, NULL, 1, 1),
(1926, 'cms_portfolio', 'tags', '', 'varchar(2000)', '', '', '', '', '', '', 7, NULL, NULL, NULL, 1, 1),
(1927, 'cms_portfolio', 'sort_order', '', 'int(11)', '', '', '', '', '', '', 14, NULL, NULL, NULL, 1, 1),
(1928, 'cms_portfolio', 'created_date', '', 'date', '', '', '', '', '', '', 17, NULL, NULL, 1, 1, 1),
(1929, 'cms_portfolio', 'created_user', '', 'varchar(100)', '', '', '', '', '', '', 18, NULL, NULL, 1, 1, 1),
(1930, 'cms_portfolio', 'modified_date', '', 'date', '', '', '', '', '', '', 19, NULL, NULL, 1, 1, 1),
(1931, 'cms_portfolio', 'modified_user', '', 'varchar(100)', '', '', '', '', '', '', 20, NULL, NULL, 1, 1, 1),
(1932, 'cms_portfolio', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 21, NULL, NULL, NULL, 1, 1),
(1933, 'cms_partner', 'id', '', 'int(11)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(1934, 'cms_partner', 'image', '', 'varchar(300)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(1935, 'cms_partner', 'name', '', 'varchar(255)', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(1936, 'cms_partner', 'linkurl', '', 'varchar(255)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(1937, 'cms_partner', 'is_active', '', 'tinyint(1)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(1938, 'cms_partner', 'overview', '', 'varchar(1000)', '', '', '', '', '', '', 4, NULL, NULL, NULL, 1, 1),
(1939, 'cms_partner', 'sort_order', '', 'tinyint(5)', '', '', '', '', '', '', 6, NULL, NULL, NULL, 1, 1),
(1940, 'cms_partner', 'created_date', '', 'date', '', '', '', '', '', '', 8, NULL, NULL, 1, 1, 1),
(1941, 'cms_partner', 'created_user', '', 'varchar(100)', '', '', '', '', '', '', 9, NULL, NULL, 1, 1, 1),
(1942, 'cms_partner', 'modified_date', '', 'date', '', '', '', '', '', '', 10, NULL, NULL, 1, 1, 1),
(1943, 'cms_partner', 'modified_user', '', 'varchar(100)', '', '', '', '', '', '', 11, NULL, NULL, 1, 1, 1),
(1944, 'cms_partner', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 12, NULL, NULL, NULL, 1, 1),
(1945, 'cms_about', 'id', '', 'bigint(20)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(1946, 'cms_about', 'image', '', 'varchar(300)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(1947, 'cms_about', 'name', '', 'varchar(250)', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(1948, 'cms_about', 'icon', '', 'varchar(255)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(1949, 'cms_about', 'color', '', 'varchar(100)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(1950, 'cms_about', 'linkurl', '', 'varchar(255)', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(1951, 'cms_about', 'lang', '', 'varchar(50)', '', '', '', '', '', '', 9, NULL, 1, NULL, 1, 1),
(1952, 'cms_about', 'is_active', '', 'tinyint(1)', '', '', '', '', '', '', 10, NULL, 1, NULL, 1, 1),
(1953, 'cms_about', 'is_top', '', 'tinyint(1)', '', '', '', '', '', '', 11, NULL, 1, NULL, 1, 1),
(1954, 'cms_about', 'thumbnail', '', 'varchar(300)', '', '', '', '', '', '', 2, NULL, NULL, NULL, 1, 1),
(1955, 'cms_about', 'overview', '', 'varchar(2000)', '', '', '', '', '', '', 5, NULL, NULL, NULL, 1, 1),
(1956, 'cms_about', 'content', '', 'text', '', '', '', '', '', '', 8, NULL, NULL, NULL, 1, 1),
(1957, 'cms_about', 'sort_order', '', 'int(5)', '', '', '', '', '', '', 10, NULL, NULL, NULL, 1, 1),
(1958, 'cms_about', 'created_date', '', 'date', '', '', '', '', '', '', 14, NULL, NULL, 1, 1, 1),
(1959, 'cms_about', 'created_user', '', 'varchar(150)', '', '', '', '', '', '', 15, NULL, NULL, 1, 1, 1),
(1960, 'cms_about', 'modified_date', '', 'date', '', '', '', '', '', '', 16, NULL, NULL, 1, 1, 1),
(1961, 'cms_about', 'modified_user', '', 'varchar(150)', '', '', '', '', '', '', 17, NULL, NULL, 1, 1, 1),
(1962, 'cms_about', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 18, NULL, NULL, NULL, 1, 1),
(1963, 'cms_slide', 'id', '', 'int(11)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(1964, 'cms_slide', 'image', '', 'varchar(300)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(1965, 'cms_slide', 'name', '', 'varchar(255)', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(1966, 'cms_slide', 'transition_type', '', 'varchar(50)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(1967, 'cms_slide', 'transition_speed', '', 'varchar(50)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(1968, 'cms_slide', 'alignment', '', 'varchar(50)', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(1969, 'cms_slide', 'lang', '', 'varchar(20)', '', '', '', '', '', '', 9, NULL, 1, NULL, 1, 1),
(1970, 'cms_slide', 'url1_label', '', 'varchar(255)', '', '', '', '', '', '', 10, NULL, 1, NULL, 1, 1),
(1971, 'cms_slide', 'url1_link', '', 'varchar(255)', '', '', '', '', '', '', 11, NULL, 1, NULL, 1, 1),
(1972, 'cms_slide', 'url2_label', '', 'varchar(255)', '', '', '', '', '', '', 12, NULL, 1, NULL, 1, 1),
(1973, 'cms_slide', 'url2_link', '', 'varchar(255)', '', '', '', '', '', '', 13, NULL, 1, NULL, 1, 1),
(1974, 'cms_slide', 'url3_label', '', 'varchar(255)', '', '', '', '', '', '', 14, NULL, 1, NULL, 1, 1),
(1975, 'cms_slide', 'is_active', '', 'tinyint(1)', '', '', '', '', '', '', 15, NULL, 1, NULL, 1, 1),
(1976, 'cms_slide', 'overview', '', 'varchar(1000)', '', '', '', '', '', '', 4, NULL, NULL, NULL, 1, 1),
(1977, 'cms_slide', 'url3_link', '', 'varchar(255)', '', '', '', '', '', '', 14, NULL, NULL, NULL, 1, 1),
(1978, 'cms_slide', 'sort_order', '', 'int(11)', '', '', '', '', '', '', 15, NULL, NULL, NULL, 1, 1),
(1979, 'cms_slide', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 17, NULL, NULL, NULL, 1, 1),
(1980, 'cms_testimonial', 'id', '', 'int(11)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(1981, 'cms_testimonial', 'image', '', 'varchar(300)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(1982, 'cms_testimonial', 'name', '', 'varchar(255)', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(1983, 'cms_testimonial', 'location', '', 'varchar(255)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(1984, 'cms_testimonial', 'rate', '', 'int(10)', '', '', '', '', '', '', 7, NULL, 1, 1, 1, 1),
(1985, 'cms_testimonial', 'linkurl', '', 'varchar(255)', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(1986, 'cms_testimonial', 'is_active', '', 'tinyint(1)', '', '', '', '', '', '', 9, NULL, 1, NULL, 1, 1),
(1987, 'cms_testimonial', 'is_top', '', 'tinyint(1)', '', '', '', '', '', '', 10, NULL, 1, NULL, 1, 1),
(1988, 'cms_testimonial', 'description', '', 'varchar(255)', '', '', '', '', '', '', 4, NULL, NULL, NULL, 1, 1),
(1989, 'cms_testimonial', 'content', '', 'varchar(1000)', '', '', '', '', '', '', 6, NULL, NULL, NULL, 1, 1),
(1990, 'cms_testimonial', 'sort_order', '', 'int(11)', '', '', '', '', '', '', 9, NULL, NULL, NULL, 1, 1),
(1991, 'cms_testimonial', 'created_date', '', 'date', '', '', '', '', '', '', 12, NULL, NULL, 1, 1, 1),
(1992, 'cms_testimonial', 'created_user', '', 'varchar(100)', '', '', '', '', '', '', 13, NULL, NULL, 1, 1, 1),
(1993, 'cms_testimonial', 'modified_date', '', 'date', '', '', '', '', '', '', 14, NULL, NULL, 1, 1, 1),
(1994, 'cms_testimonial', 'modified_user', '', 'varchar(100)', '', '', '', '', '', '', 15, NULL, NULL, 1, 1, 1),
(1995, 'cms_testimonial', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 16, NULL, NULL, NULL, 1, 1),
(1996, 'cms_employee', 'id', '', 'int(11)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(1997, 'cms_employee', 'image', '', 'varchar(300)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(1998, 'cms_employee', 'name', '', 'varchar(255)', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(1999, 'cms_employee', 'position', '', 'varchar(255)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(2000, 'cms_employee', 'google', '', 'varchar(255)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(2001, 'cms_employee', 'email', '', 'varchar(255)', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(2002, 'cms_employee', 'mobile', '', 'varchar(255)', '', '', '', '', '', '', 9, NULL, 1, NULL, 1, 1),
(2003, 'cms_employee', 'chat', '', 'varchar(255)', '', '', '', '', '', '', 10, NULL, 1, NULL, 1, 1),
(2004, 'cms_employee', 'is_contact', '', 'tinyint(1)', '', '', '', '', '', '', 11, NULL, 1, NULL, 1, 1),
(2005, 'cms_employee', 'is_top', '', 'tinyint(1)', '', '', '', '', '', '', 12, NULL, 1, NULL, 1, 1),
(2006, 'cms_employee', 'is_active', '', 'tinyint(1)', '', '', '', '', '', '', 13, NULL, 1, NULL, 1, 1),
(2007, 'cms_employee', 'overview', '', 'varchar(2000)', '', '', '', '', '', '', 5, NULL, NULL, NULL, 1, 1),
(2008, 'cms_employee', 'content', '', 'text', '', '', '', '', '', '', 6, NULL, NULL, NULL, 1, 1),
(2009, 'cms_employee', 'link_url', '', 'varchar(255)', '', '', '', '', '', '', 7, NULL, NULL, NULL, 1, 1),
(2010, 'cms_employee', 'facebook', '', 'varchar(255)', '', '', '', '', '', '', 8, NULL, NULL, NULL, 1, 1),
(2011, 'cms_employee', 'twitter', '', 'varchar(255)', '', '', '', '', '', '', 9, NULL, NULL, NULL, 1, 1),
(2012, 'cms_employee', 'linkedin', '', 'varchar(255)', '', '', '', '', '', '', 11, NULL, NULL, NULL, 1, 1),
(2013, 'cms_employee', 'sort_order', '', 'int(5)', '', '', '', '', '', '', 15, NULL, NULL, NULL, 1, 1),
(2014, 'cms_employee', 'created_date', '', 'date', '', '', '', '', '', '', 19, NULL, NULL, 1, 1, 1),
(2015, 'cms_employee', 'created_user', '', 'varchar(100)', '', '', '', '', '', '', 20, NULL, NULL, 1, 1, 1),
(2016, 'cms_employee', 'modified_date', '', 'date', '', '', '', '', '', '', 21, NULL, NULL, 1, 1, 1),
(2017, 'cms_employee', 'modified_user', '', 'varchar(100)', '', '', '', '', '', '', 22, NULL, NULL, 1, 1, 1),
(2018, 'cms_employee', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 23, NULL, NULL, NULL, 1, 1),
(2019, 'cms_album', 'id', '', 'int(11)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(2020, 'cms_album', 'image', '', 'varchar(300)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(2021, 'cms_album', 'name', '', 'varchar(255)', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(2022, 'cms_album', 'linkurl', '', 'varchar(255)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(2023, 'cms_album', 'type', '', 'varchar(50)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(2024, 'cms_album', 'is_active', '', 'tinyint(1)', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(2025, 'cms_album', 'description', '', 'varchar(1000)', '', '', '', '', '', '', 4, NULL, NULL, NULL, 1, 1),
(2026, 'cms_album', 'sort_order', '', 'int(11)', '', '', '', '', '', '', 6, NULL, NULL, NULL, 1, 1),
(2027, 'cms_album', 'created_date', '', 'date', '', '', '', '', '', '', 9, NULL, NULL, 1, 1, 1),
(2028, 'cms_album', 'created_user', '', 'varchar(100)', '', '', '', '', '', '', 10, NULL, NULL, 1, 1, 1),
(2029, 'cms_album', 'modified_date', '', 'date', '', '', '', '', '', '', 11, NULL, NULL, 1, 1, 1),
(2030, 'cms_album', 'modified_user', '', 'varchar(100)', '', '', '', '', '', '', 12, NULL, NULL, 1, 1, 1),
(2031, 'cms_album', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 13, NULL, NULL, NULL, 1, 1),
(2032, 'cms_statistics', 'id', '', 'int(11)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(2033, 'cms_statistics', 'name', '', 'varchar(255)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(2034, 'cms_statistics', 'value', '', 'bigint(20)', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(2035, 'cms_statistics', 'is_active', '', 'int(11)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(2036, 'cms_statistics', 'is_top', '', 'int(11)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(2037, 'cms_statistics', 'sort_order', '', 'int(11)', '', '', '', '', '', '', 4, NULL, NULL, NULL, 1, 1),
(2038, 'cms_statistics', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 7, NULL, NULL, NULL, 1, 1),
(2039, 'cms_faq', 'id', '', 'int(11)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(2040, 'cms_faq', 'name', '', 'varchar(255)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(2041, 'cms_faq', 'type', '', 'varchar(100)', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(2042, 'cms_faq', 'lang', '', 'varchar(50)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(2043, 'cms_faq', 'is_active', '', 'tinyint(1)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(2044, 'cms_faq', 'is_top', '', 'tinyint(1)', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(2045, 'cms_faq', 'content', '', 'text', 'html', '', '', '', '', '', 3, NULL, NULL, NULL, 1, 1),
(2046, 'cms_faq', 'sort_order', '', 'int(5)', '', '', '', '', '', '', 5, NULL, NULL, NULL, 1, 1),
(2047, 'cms_faq', 'created_date', '', 'date', '', '', '', '', '', '', 9, NULL, NULL, 1, 1, 1),
(2048, 'cms_faq', 'created_user', '', 'varchar(100)', '', '', '', '', '', '', 10, NULL, NULL, 1, 1, 1),
(2049, 'cms_faq', 'modified_date', '', 'date', '', '', '', '', '', '', 11, NULL, NULL, 1, 1, 1),
(2050, 'cms_faq', 'modified_user', '', 'varchar(100)', '', '', '', '', '', '', 12, NULL, NULL, 1, 1, 1),
(2051, 'cms_faq', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 13, NULL, NULL, NULL, 1, 1),
(2052, 'product', 'id', '', 'bigint(11)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(2053, 'product', 'image', '', 'varchar(255)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(2054, 'product', 'banner', '', 'varchar(300)', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(2055, 'product', 'code', '', 'varchar(45)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(2056, 'product', 'name', '', 'varchar(255)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(2057, 'product', 'cost', '', 'decimal(15,2)', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(2058, 'product', 'price', '', 'decimal(15,2)', '', '', '', '', '', '', 9, NULL, 1, NULL, 1, 1),
(2059, 'product', 'unit', '', 'varchar(100)', '', '', '', '', '', '', 10, NULL, 1, NULL, 1, 1),
(2060, 'product', 'currency', '', 'varchar(100)', '', '', '', '', '', '', 11, NULL, 1, NULL, 1, 1),
(2061, 'product', 'color', '', 'varchar(100)', '', '', '', '', '', '', 12, NULL, 1, NULL, 1, 1),
(2062, 'product', 'type', '', 'varchar(100)', '', '', '', '', '', '', 13, NULL, 1, NULL, 1, 1),
(2063, 'product', 'status', '', 'varchar(100)', '', '', '', '', '', '', 14, NULL, 1, NULL, 1, 1),
(2064, 'product', 'category_id', '', 'varchar(500)', '', '', '', '', '', '', 15, NULL, 1, NULL, 1, 1),
(2065, 'product', 'is_active', '', 'tinyint(1)', '', '', '', '', '', '', 16, NULL, 1, NULL, 1, 1),
(2066, 'product', 'is_hot', '', 'tinyint(1)', '', '', '', '', '', '', 17, NULL, 1, NULL, 1, 1),
(2067, 'product', 'is_top', '', 'tinyint(1)', '', '', '', '', '', '', 18, NULL, 1, NULL, 1, 1),
(2068, 'product', 'thumbnail', '', 'varchar(255)', '', '', '', '', '', '', 2, NULL, NULL, NULL, 1, 1),
(2069, 'product', 'overview', '', 'varchar(2000)', '', '', '', '', '', '', 7, NULL, NULL, NULL, 1, 1),
(2070, 'product', 'content', '', 'text', '', '', '', '', '', '', 8, NULL, NULL, NULL, 1, 1),
(2071, 'product', 'brand_id', '', 'varchar(100)', '', '@provider', '', '', '', '', 16, NULL, NULL, NULL, 1, 1),
(2072, 'product', 'promotion_id', '', 'varchar(100)', '', '@promotion', '', '', '', '', 21, NULL, NULL, NULL, 1, 1),
(2073, 'product', 'quantity', '', 'varchar(255)', '', '', '', '', '', '', 22, NULL, NULL, NULL, 1, 1),
(2074, 'product', 'discount', '', 'int(10)', '', '', '', '', '', '', 23, NULL, NULL, NULL, 1, 1),
(2075, 'product', 'tax', '', 'varchar(100)', '', '', '', '', '', '', 24, NULL, NULL, NULL, 1, 1),
(2076, 'product', 'sort_order', '', 'int(11)', '', '', '', '', '', '', 25, NULL, NULL, NULL, 1, 1),
(2077, 'product', 'count_views', '', 'int(11)', '', '', '', '', '', '', 26, NULL, NULL, 1, 1, 1),
(2078, 'product', 'count_comments', '', 'int(11)', '', '', '', '', '', '', 27, NULL, NULL, 1, 1, 1),
(2079, 'product', 'count_purchase', '', 'int(11)', '', '', '', '', '', '', 28, NULL, NULL, 1, 1, 1),
(2080, 'product', 'count_likes', '', 'int(11)', '', '', '', '', '', '', 29, NULL, NULL, 1, 1, 1),
(2081, 'product', 'count_rates', '', 'int(11)', '', '', '', '', '', '', 30, NULL, NULL, 1, 1, 1),
(2082, 'product', 'rates', '', 'int(11)', '', '', '', '', '', '', 31, NULL, NULL, 1, 1, 1),
(2083, 'product', 'qrcode_image', '', 'varchar(255)', '', '', '', '', '', '', 32, NULL, NULL, NULL, 1, 1),
(2084, 'product', 'barcode_image', '', 'varchar(255)', '', '', '', '', '', '', 33, NULL, NULL, NULL, 1, 1),
(2085, 'product', 'created_date', '', 'datetime', '', '', '', '', '', '', 34, NULL, NULL, 1, 1, 1),
(2086, 'product', 'created_user', '', 'varchar(100)', '', '', '', '', '', '', 35, NULL, NULL, 1, 1, 1),
(2087, 'product', 'modified_date', '', 'datetime', '', '', '', '', '', '', 36, NULL, NULL, 1, 1, 1),
(2088, 'product', 'modified_user', '', 'varchar(100)', '', '', '', '', '', '', 37, NULL, NULL, 1, 1, 1),
(2089, 'product', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 38, NULL, NULL, NULL, 1, 1),
(2090, 'ecommerce_order', 'id', '', 'int(11)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(2091, 'ecommerce_order', 'user_id', '', 'varchar(100)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(2092, 'ecommerce_order', 'billing_name', '', 'varchar(255)', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(2093, 'ecommerce_order', 'billing_phone', '', 'varchar(255)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(2094, 'ecommerce_order', 'billing_address', '', 'varchar(1000)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(2095, 'ecommerce_order', 'billing_email', '', 'varchar(255)', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(2096, 'ecommerce_order', 'billing_postcode', '', 'varchar(255)', '', '', '', '', '', '', 9, NULL, 1, NULL, 1, 1),
(2097, 'ecommerce_order', 'billing_city', '', 'varchar(255)', '', '', '', '', '', '', 10, NULL, 1, NULL, 1, 1),
(2098, 'ecommerce_order', 'billing_state', '', 'varchar(255)', '', '', '', '', '', '', 11, NULL, 1, NULL, 1, 1),
(2099, 'ecommerce_order', 'billing_country', '', 'varchar(255)', '', '', '', '', '', '', 12, NULL, 1, NULL, 1, 1),
(2100, 'ecommerce_order', 'shipping_name', '', 'varchar(255)', '', '', '', '', '', '', 13, NULL, 1, NULL, 1, 1),
(2101, 'ecommerce_order', 'shipping_phone', '', 'varchar(255)', '', '', '', '', '', '', 14, NULL, 1, NULL, 1, 1),
(2102, 'ecommerce_order', 'is_active', '', 'tinyint(1)', '', '', '', '', '', '', 15, NULL, 1, NULL, 1, 1),
(2103, 'ecommerce_order', 'shipping_address', '', 'varchar(255)', '', '', '', '', '', '', 13, NULL, NULL, NULL, 1, 1),
(2104, 'ecommerce_order', 'shipping_email', '', 'varchar(255)', '', '', '', '', '', '', 14, NULL, NULL, NULL, 1, 1),
(2105, 'ecommerce_order', 'shipping_postcode', '', 'varchar(255)', '', '', '', '', '', '', 15, NULL, NULL, NULL, 1, 1),
(2106, 'ecommerce_order', 'shipping_city', '', 'varchar(255)', '', '', '', '', '', '', 16, NULL, NULL, NULL, 1, 1),
(2107, 'ecommerce_order', 'shipping_state', '', 'varchar(255)', '', '', '', '', '', '', 17, NULL, NULL, NULL, 1, 1),
(2108, 'ecommerce_order', 'shipping_country', '', 'varchar(255)', '', '', '', '', '', '', 18, NULL, NULL, NULL, 1, 1),
(2109, 'ecommerce_order', 'shipping_method', '', 'varchar(100)', '', '', '', '', '', '', 19, NULL, NULL, NULL, 1, 1),
(2110, 'ecommerce_order', 'order_date', '', 'varchar(200)', '', '', '', '', '', '', 20, NULL, NULL, NULL, 1, 1),
(2111, 'ecommerce_order', 'order_detail', '', 'text', '', '', '', '', '', '', 21, NULL, NULL, NULL, 1, 1),
(2112, 'ecommerce_order', 'order_note', '', 'text', '', '', '', '', '', '', 22, NULL, NULL, NULL, 1, 1),
(2113, 'ecommerce_order', 'promotion_code', '', 'varchar(255)', '', '', '', '', '', '', 23, NULL, NULL, NULL, 1, 1),
(2114, 'ecommerce_order', 'tax', '', 'varchar(500)', '', '', '', '', '', '', 24, NULL, NULL, NULL, 1, 1),
(2115, 'ecommerce_order', 'order_type', '', 'varchar(100)', '', '', '', '', '', '', 25, NULL, NULL, NULL, 1, 1),
(2116, 'ecommerce_order', 'order_status', '', 'varchar(100)', '', '', '', '', '', '', 26, NULL, NULL, NULL, 1, 1),
(2117, 'ecommerce_order', 'price_total', '', 'float(10,2)', '', '', '', '', '', '', 28, NULL, NULL, NULL, 1, 1),
(2118, 'ecommerce_order', 'price_shipping', '', 'float(10,2)', '', '', '', '', '', '', 29, NULL, NULL, NULL, 1, 1),
(2119, 'ecommerce_order', 'price_tax', '', 'float(10,2)', '', '', '', '', '', '', 30, NULL, NULL, NULL, 1, 1),
(2120, 'ecommerce_order', 'price_discount', '', 'float(10,0)', '', '', '', '', '', '', 31, NULL, NULL, NULL, 1, 1),
(2121, 'ecommerce_order', 'price_final', '', 'float', '', '', '', '', '', '', 32, NULL, NULL, NULL, 1, 1),
(2122, 'ecommerce_order', 'payment_method', '', 'varchar(100)', '', '', '', '', '', '', 33, NULL, NULL, NULL, 1, 1),
(2123, 'ecommerce_order', 'payment_status', '', 'varchar(100)', '', '', '', '', '', '', 34, NULL, NULL, NULL, 1, 1),
(2124, 'ecommerce_order', 'delivery_time', '', 'varchar(12)', '', '', '', '', '', '', 35, NULL, NULL, NULL, 1, 1),
(2125, 'ecommerce_order', 'delivery_status', '', 'varchar(100)', '', '', '', '', '', '', 36, NULL, NULL, NULL, 1, 1),
(2126, 'ecommerce_order', 'delivery_type', '', 'varchar(100)', '', '', '', '', '', '', 37, NULL, NULL, NULL, 1, 1),
(2127, 'ecommerce_order', 'delivery_note', '', 'text', '', '', '', '', '', '', 38, NULL, NULL, NULL, 1, 1),
(2128, 'ecommerce_order', 'created_date', '', 'datetime', '', '', '', '', '', '', 39, NULL, NULL, 1, 1, 1),
(2129, 'ecommerce_order', 'created_user', '', 'varchar(100)', '', '', '', '', '', '', 40, NULL, NULL, 1, 1, 1),
(2130, 'ecommerce_order', 'modified_date', '', 'datetime', '', '', '', '', '', '', 41, NULL, NULL, 1, 1, 1),
(2131, 'ecommerce_order', 'modified_user', '', 'varchar(100)', '', '', '', '', '', '', 42, NULL, NULL, 1, 1, 1),
(2132, 'provider', 'id', '', 'int(11)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(2133, 'provider', 'image', '', 'varchar(300)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(2134, 'provider', 'code', '', 'varchar(255)', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(2135, 'provider', 'name', '', 'varchar(255)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(2136, 'provider', 'start_date', '', 'varchar(255)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(2137, 'provider', 'contact_name', '', 'varchar(255)', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(2138, 'provider', 'phone', '', 'varchar(255)', '', '', '', '', '', '', 9, NULL, 1, NULL, 1, 1),
(2139, 'provider', 'email', '', 'varchar(255)', '', '', '', '', '', '', 10, NULL, 1, NULL, 1, 1),
(2140, 'provider', 'address', '', 'varchar(2000)', '', '', '', '', '', '', 11, NULL, 1, NULL, 1, 1),
(2141, 'provider', 'website', '', 'varchar(255)', '', '', '', '', '', '', 12, NULL, 1, NULL, 1, 1),
(2142, 'provider', 'city', '', 'varchar(100)', '', '', '', '', '', '', 13, NULL, 1, NULL, 1, 1),
(2143, 'provider', 'type', '', 'varchar(100)', '', '', '', '', '', '', 14, NULL, 1, NULL, 1, 1),
(2144, 'provider', 'status', '', 'varchar(100)', '', '', '', '', '', '', 15, NULL, 1, NULL, 1, 1),
(2145, 'provider', 'is_top', '', 'tinyint(1)', '', '', '', '', '', '', 16, NULL, 1, NULL, 1, 1),
(2146, 'provider', 'is_active', '', 'tinyint(1)', '', '', '', '', '', '', 17, NULL, 1, NULL, 1, 1),
(2147, 'provider', 'description', '', 'varchar(2000)', '', '', '', '', '', '', 5, NULL, NULL, NULL, 1, 1),
(2148, 'provider', 'content', '', 'text', '', '', '', '', '', '', 6, NULL, NULL, NULL, 1, 1),
(2149, 'provider', 'country', '', 'varchar(100)', '', '', '', '', '', '', 14, NULL, NULL, 1, 1, 1),
(2150, 'provider', 'lat', '', 'float', '', '', '', '', '', '', 15, NULL, NULL, NULL, 1, 1),
(2151, 'provider', 'long', '', 'float', '', '', '', '', '', '', 16, NULL, NULL, NULL, 1, 1),
(2152, 'provider', 'rate', '', 'int(11)', '', '', '', '', '', '', 17, NULL, NULL, 1, 1, 1),
(2153, 'provider', 'sort_order', '', 'int(11)', '', '', '', '', '', '', 22, NULL, NULL, NULL, 1, 1),
(2154, 'provider', 'created_date', '', 'date', '', '', '', '', '', '', 23, NULL, NULL, 1, 1, 1),
(2155, 'provider', 'created_user', '', 'varchar(100)', '', '', '', '', '', '', 24, NULL, NULL, 1, 1, 1),
(2156, 'provider', 'modified_date', '', 'date', '', '', '', '', '', '', 25, NULL, NULL, 1, 1, 1),
(2157, 'provider', 'modified_user', '', 'varchar(100)', '', '', '', '', '', '', 26, NULL, NULL, 1, 1, 1),
(2158, 'provider', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 27, NULL, NULL, NULL, 1, 1),
(2159, 'promotion', 'id', '', 'int(11)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(2160, 'promotion', 'code', '', 'varchar(255)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(2161, 'promotion', 'image', '', 'varchar(300)', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(2162, 'promotion', 'banner', '', 'varchar(300)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(2163, 'promotion', 'name', '', 'varchar(255)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(2164, 'promotion', 'start_date', '', 'date', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(2165, 'promotion', 'end_date', '', 'date', '', '', '', '', '', '', 9, NULL, 1, NULL, 1, 1),
(2166, 'promotion', 'is_active', '', 'tinyint(1)', '', '', '', '', '', '', 10, NULL, 1, NULL, 1, 1),
(2167, 'promotion', 'is_top', '', 'tinyint(1)', '', '', '', '', '', '', 11, NULL, 1, NULL, 1, 1),
(2168, 'promotion', 'category_id', '', 'varchar(500)', '', '', '', '', '', '', 12, NULL, 1, NULL, 1, 1),
(2169, 'promotion', 'count_views', '', 'int(11)', '', '', '', '', '', '', 13, NULL, 1, 1, 1, 1),
(2170, 'promotion', 'count_purchase', '', 'int(11)', '', '', '', '', '', '', 14, NULL, 1, 1, 1, 1),
(2171, 'promotion', 'overview', '', 'varchar(2000)', '', '', '', '', '', '', 6, NULL, NULL, NULL, 1, 1),
(2172, 'promotion', 'content', '', 'text', '', '', '', '', '', '', 7, NULL, NULL, NULL, 1, 1),
(2173, 'promotion', 'count_shares', '', 'int(11)', '', '', '', '', '', '', 15, NULL, NULL, 1, 1, 1),
(2174, 'promotion', 'created_date', '', 'date', '', '', '', '', '', '', 16, NULL, NULL, 1, 1, 1),
(2175, 'promotion', 'created_user', '', 'varchar(100)', '', '', '', '', '', '', 17, NULL, NULL, 1, 1, 1),
(2176, 'promotion', 'modified_date', '', 'date', '', '', '', '', '', '', 18, NULL, NULL, 1, 1, 1),
(2177, 'promotion', 'modified_user', '', 'varchar(100)', '', '', '', '', '', '', 19, NULL, NULL, 1, 1, 1),
(2178, 'promotion', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 20, NULL, NULL, NULL, 1, 1),
(2179, 'music_artist', 'id', '', 'bigint(20)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(2180, 'music_artist', 'image', '', 'varchar(300)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(2181, 'music_artist', 'name', '', 'varchar(255)', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(2182, 'music_artist', 'count_views', '', 'bigint(11)', '', '', '', '', '', '', 6, NULL, 1, 1, 1, 1),
(2183, 'music_artist', 'count_likes', '', 'bigint(11)', '', '', '', '', '', '', 7, NULL, 1, 1, 1, 1),
(2184, 'music_artist', 'count_rates', '', 'bigint(11)', '', '', '', '', '', '', 8, NULL, 1, 1, 1, 1),
(2185, 'music_artist', 'rates', '', 'int(11)', '', '', '', '', '', '', 9, NULL, 1, 1, 1, 1),
(2186, 'music_artist', 'is_top', '', 'tinyint(1)', '', '', '', '', '', '', 10, NULL, 1, NULL, 1, 1),
(2187, 'music_artist', 'is_new', '', 'tinyint(1)', '', '', '', '', '', '', 11, NULL, 1, NULL, 1, 1),
(2188, 'music_artist', 'is_hot', '', 'tinyint(1)', '', '', '', '', '', '', 12, NULL, 1, NULL, 1, 1),
(2189, 'music_artist', 'is_active', '', 'tinyint(1)', '', '', '', '', '', '', 13, NULL, 1, NULL, 1, 1),
(2190, 'music_artist', 'lang', '', 'varchar(100)', '', '', '', '', '', '', 14, NULL, 1, NULL, 1, 1),
(2191, 'music_artist', 'type', '', 'varchar(100)', '', '', '', '', '', '', 15, NULL, 1, NULL, 1, 1),
(2192, 'music_artist', 'status', '', 'varchar(100)', '', '', '', '', '', '', 16, NULL, 1, NULL, 1, 1),
(2193, 'music_artist', 'category_id', '', 'varchar(500)', '', 'music', '', '', '', '', 17, NULL, 1, NULL, 1, 1),
(2194, 'music_artist', 'thumbnail', '', 'varchar(300)', '', '', '', '', '', '', 2, NULL, NULL, NULL, 1, 1),
(2195, 'music_artist', 'real_name', '', 'varchar(255)', '', '', '', '', '', '', 5, NULL, NULL, NULL, 1, 1),
(2196, 'music_artist', 'description', '', 'varchar(2000)', '', '', '', '', '', '', 6, NULL, NULL, NULL, 1, 1),
(2197, 'music_artist', 'content', '', 'text', '', '', '', '', '', '', 7, NULL, NULL, NULL, 1, 1),
(2198, 'music_artist', 'birth_date', '', 'date', '', '', '', '', '', '', 8, NULL, NULL, NULL, 1, 1),
(2199, 'music_artist', 'location', '', 'varchar(255)', '', '', '', '', '', '', 9, NULL, NULL, NULL, 1, 1),
(2200, 'music_artist', 'created_date', '', 'date', '', '', '', '', '', '', 22, NULL, NULL, 1, 1, 1),
(2201, 'music_artist', 'created_user', '', 'varchar(100)', '', '', '', '', '', '', 23, NULL, NULL, 1, 1, 1),
(2202, 'music_artist', 'modified_date', '', 'date', '', '', '', '', '', '', 24, NULL, NULL, 1, 1, 1),
(2203, 'music_artist', 'modified_user', '', 'varchar(100)', '', '', '', '', '', '', 25, NULL, NULL, 1, 1, 1),
(2204, 'music_artist', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 26, NULL, NULL, NULL, 1, 1),
(2205, 'music_song', 'id', '', 'bigint(20)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(2206, 'music_song', 'image', '', 'varchar(300)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(2207, 'music_song', 'song_file', '', 'varchar(300)', 'file', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(2208, 'music_song', 'name', '', 'varchar(255)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(2209, 'music_song', 'duration', '', 'varchar(8)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(2210, 'music_song', 'release_date', '', 'date', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(2211, 'music_song', 'artist_singer_id', '', 'varchar(100)', 'select', '@music_artist', '', '', '', '', 9, NULL, 1, NULL, 1, 1),
(2212, 'music_song', 'artist_composer_id', '', 'varchar(100)', 'select', '@music_artist', '', '', '', '', 10, NULL, 1, NULL, 1, 1),
(2213, 'music_song', 'album_id', '', 'varchar(100)', 'select', '@music_playlist', '', '', '', '', 11, NULL, 1, NULL, 1, 1),
(2214, 'music_song', 'is_hot', '', 'tinyint(1)', '', '', '', '', '', '', 12, NULL, 1, NULL, 1, 1),
(2215, 'music_song', 'is_top', '', 'tinyint(1)', '', '', '', '', '', '', 13, NULL, 1, NULL, 1, 1),
(2216, 'music_song', 'is_active', '', 'tinyint(1)', '', '', '', '', '', '', 14, NULL, 1, NULL, 1, 1),
(2217, 'music_song', 'is_video', '', 'tinyint(1)', '', '', '', '', '', '', 15, NULL, 1, NULL, 1, 1),
(2218, 'music_song', 'lang', '', 'varchar(100)', '', '', '', '', '', '', 16, NULL, 1, NULL, 1, 1),
(2219, 'music_song', 'type', '', 'varchar(100)', '', '', '', '', '', '', 17, NULL, 1, NULL, 1, 1),
(2220, 'music_song', 'status', '', 'varchar(100)', '', '', '', '', '', '', 18, NULL, 1, NULL, 1, 1),
(2221, 'music_song', 'category_id', '', 'varchar(500)', '', 'music', '', '', '', '', 19, NULL, 1, NULL, 1, 1),
(2222, 'music_song', 'thumbnail', '', 'varchar(300)', '', '', '', '', '', '', 2, NULL, NULL, NULL, 1, 1),
(2223, 'music_song', 'description', '', 'varchar(2000)', '', '', '', '', '', '', 6, NULL, NULL, NULL, 1, 1),
(2224, 'music_song', 'content', '', 'text', '', '', '', '', '', '', 7, NULL, NULL, NULL, 1, 1),
(2225, 'music_song', 'price', '', 'decimal(10,2)', '', '', '', '', '', '', 8, NULL, NULL, NULL, 1, 1),
(2226, 'music_song', 'mood', '', 'varchar(100)', '', '', '', '', '', '', 21, NULL, NULL, NULL, 1, 1),
(2227, 'music_song', 'count_views', '', 'bigint(20)', '', '', '', '', '', '', 23, NULL, NULL, 1, 1, 1),
(2228, 'music_song', 'count_likes', '', 'bigint(20)', '', '', '', '', '', '', 24, NULL, NULL, 1, 1, 1),
(2229, 'music_song', 'count_purchase', '', 'bigint(20)', '', '', '', '', '', '', 25, NULL, NULL, 1, 1, 1),
(2230, 'music_song', 'count_comments', '', 'int(10)', '', '', '', '', '', '', 26, NULL, NULL, 1, 1, 1),
(2231, 'music_song', 'count_rates', '', 'bigint(20)', '', '', '', '', '', '', 27, NULL, NULL, 1, 1, 1),
(2232, 'music_song', 'rates', '', 'int(11)', '', '', '', '', '', '', 28, NULL, NULL, 1, 1, 1),
(2233, 'music_song', 'created_date', '', 'date', '', '', '', '', '', '', 29, NULL, NULL, 1, 1, 1),
(2234, 'music_song', 'created_user', '', 'varchar(100)', '', '', '', '', '', '', 30, NULL, NULL, 1, 1, 1),
(2235, 'music_song', 'modified_date', '', 'date', '', '', '', '', '', '', 31, NULL, NULL, 1, 1, 1),
(2236, 'music_song', 'modified_user', '', 'varchar(100)', '', '', '', '', '', '', 32, NULL, NULL, 1, 1, 1),
(2237, 'music_song', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 33, NULL, NULL, NULL, 1, 1),
(2238, 'music_playlist', 'id', '', 'int(11)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(2239, 'music_playlist', 'image', '', 'varchar(300)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(2240, 'music_playlist', 'name', '', 'varchar(255)', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(2241, 'music_playlist', 'release_date', '', 'date', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(2242, 'music_playlist', 'songs_count', '', 'int(11)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(2243, 'music_playlist', 'songs_duration', '', 'varchar(8)', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(2244, 'music_playlist', 'is_active', '', 'tinyint(1)', '', '', '', '', '', '', 9, NULL, 1, NULL, 1, 1),
(2245, 'music_playlist', 'is_top', '', 'tinyint(1)', '', '', '', '', '', '', 10, NULL, 1, NULL, 1, 1),
(2246, 'music_playlist', 'is_new', '', 'tinyint(1)', '', '', '', '', '', '', 11, NULL, 1, NULL, 1, 1),
(2247, 'music_playlist', 'is_hot', '', 'tinyint(1)', '', '', '', '', '', '', 12, NULL, 1, NULL, 1, 1),
(2248, 'music_playlist', 'is_album', '', 'tinyint(1)', '', '', '', '', '', '', 13, NULL, 1, NULL, 1, 1),
(2249, 'music_playlist', 'is_video', '', 'tinyint(1)', '', '', '', '', '', '', 14, NULL, 1, NULL, 1, 1),
(2250, 'music_playlist', 'lang', '', 'varchar(100)', '', '', '', '', '', '', 15, NULL, 1, NULL, 1, 1),
(2251, 'music_playlist', 'type', '', 'varchar(100)', '', '', '', '', '', '', 16, NULL, 1, NULL, 1, 1),
(2252, 'music_playlist', 'category_id', '', 'varchar(500)', '', 'music', '', '', '', '', 17, NULL, 1, NULL, 1, 1),
(2253, 'music_playlist', 'thumbnail', '', 'varchar(300)', '', '', '', '', '', '', 2, NULL, NULL, NULL, 1, 1),
(2254, 'music_playlist', 'description', '', 'varchar(2000)', '', '', '', '', '', '', 5, NULL, NULL, NULL, 1, 1),
(2255, 'music_playlist', 'count_views', '', 'bigint(20)', '', '', '', '', '', '', 18, NULL, NULL, 1, 1, 1),
(2256, 'music_playlist', 'count_likes', '', 'bigint(20)', '', '', '', '', '', '', 19, NULL, NULL, 1, 1, 1),
(2257, 'music_playlist', 'count_purchase', '', 'bigint(20)', '', '', '', '', '', '', 20, NULL, NULL, 1, 1, 1),
(2258, 'music_playlist', 'count_rates', '', 'bigint(20)', '', '', '', '', '', '', 21, NULL, NULL, 1, 1, 1),
(2259, 'music_playlist', 'rates', '', 'int(11)', '', '', '', '', '', '', 22, NULL, NULL, 1, 1, 1),
(2260, 'music_playlist', 'created_date', '', 'date', '', '', '', '', '', '', 23, NULL, NULL, 1, 1, 1),
(2261, 'music_playlist', 'created_user', '', 'varchar(100)', '', '', '', '', '', '', 24, NULL, NULL, 1, 1, 1),
(2262, 'music_playlist', 'modified_date', '', 'date', '', '', '', '', '', '', 25, NULL, NULL, 1, 1, 1),
(2263, 'music_playlist', 'modified_user', '', 'varchar(100)', '', '', '', '', '', '', 26, NULL, NULL, 1, 1, 1),
(2264, 'music_playlist', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 27, NULL, NULL, NULL, 1, 1),
(2265, 'travel_attractions', 'id', '', 'bigint(20)', '', '', '', '', '', '', 2, NULL, 1, NULL, 1, 1),
(2266, 'travel_attractions', 'image', '', 'varchar(300)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(2267, 'travel_attractions', 'name', '', 'varchar(255)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(2268, 'travel_attractions', 'tel', '', 'varchar(255)', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(2269, 'travel_attractions', 'address', '', 'varchar(255)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(2270, 'travel_attractions', 'budget', '', 'varchar(255)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(2271, 'travel_attractions', 'default_duration', '', 'varchar(100)', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(2272, 'travel_attractions', 'score', '', 'int(10)', '', '', '', '', '', '', 9, NULL, 1, NULL, 1, 1),
(2273, 'travel_attractions', 'open', '', 'varchar(255)', 'numeric', '', '', '', '', '', 10, NULL, 1, NULL, 1, 1),
(2274, 'travel_attractions', 'close', '', 'varchar(255)', 'numeric', '', '', '', '', '', 11, NULL, 1, NULL, 1, 1),
(2275, 'travel_attractions', 'city', '', 'varchar(255)', '', '', '', '', '', '', 12, NULL, 1, NULL, 1, 1),
(2276, 'travel_attractions', 'type', '', 'varchar(100)', '', '', '', '', '', '', 13, NULL, 1, NULL, 1, 1),
(2277, 'travel_attractions', 'is_active', '', 'tinyint(1)', '', '', '', '', '', '', 14, NULL, 1, NULL, 1, 1),
(2278, 'travel_attractions', 'thumbnail', '', 'varchar(300)', '', '', '', '', '', '', 2, NULL, NULL, NULL, 1, 1),
(2279, 'travel_attractions', 'image_description', '', 'varchar(2000)', '', '', '', '', '', '', 4, NULL, NULL, NULL, 1, 1),
(2280, 'travel_attractions', 'description', '', 'varchar(1000)', '', '', '', '', '', '', 6, NULL, NULL, NULL, 1, 1),
(2281, 'travel_attractions', 'content', '', 'text', '', '', '', '', '', '', 7, NULL, NULL, NULL, 1, 1),
(2282, 'travel_attractions', 'note', '', 'text', 'text', '', '', '', '', '', 8, NULL, NULL, NULL, 1, 1),
(2283, 'travel_attractions', 'website', '', 'varchar(255)', '', '', '', '', '', '', 11, NULL, NULL, NULL, 1, 1),
(2284, 'travel_attractions', 'map', '', 'varchar(1000)', '', '', '', '', '', '', 12, NULL, NULL, NULL, 1, 1),
(2285, 'travel_attractions', 'rate', '', 'int(10)', '', '', '', '', '', '', 13, NULL, NULL, 1, 1, 1),
(2286, 'travel_attractions', 'sort_order', '', 'int(11)', '', '', '', '', '', '', 17, NULL, NULL, NULL, 1, 1),
(2287, 'travel_attractions', 'lat', '', 'float', '', '', '', '', '', '', 18, NULL, NULL, NULL, 1, 1),
(2288, 'travel_attractions', 'long', '', 'float', '', '', '', '', '', '', 19, NULL, NULL, NULL, 1, 1),
(2289, 'travel_attractions', 'street', '', 'varchar(255)', '', '', '', '', '', '', 22, NULL, NULL, NULL, 1, 1),
(2290, 'travel_attractions', 'country', '', 'varchar(255)', '', '', '', '', '', '', 24, NULL, NULL, 1, 1, 1),
(2291, 'travel_attractions', 'category_id', '', 'varchar(100)', '', '', '', '', '', '', 25, NULL, NULL, NULL, 1, 1),
(2292, 'travel_attractions', 'status', '', 'varchar(100)', '', '', '', '', '', '', 27, NULL, NULL, NULL, 1, 1),
(2293, 'travel_attractions', 'is_new', '', 'tinyint(1)', '', '', '', '', '', '', 29, NULL, NULL, NULL, 1, 1),
(2294, 'travel_attractions', 'is_hot', '', 'tinyint(1)', '', '', '', '', '', '', 30, NULL, NULL, NULL, 1, 1),
(2295, 'travel_attractions', 'created_date', '', 'date', '', '', '', '', '', '', 31, NULL, NULL, 1, 1, 1),
(2296, 'travel_attractions', 'created_user', '', 'varchar(100)', '', '', '', '', '', '', 32, NULL, NULL, 1, 1, 1),
(2297, 'travel_attractions', 'modified_date', '', 'date', '', '', '', '', '', '', 33, NULL, NULL, 1, 1, 1),
(2298, 'travel_attractions', 'modified_user', '', 'varchar(100)', '', '', '', '', '', '', 34, NULL, NULL, 1, 1, 1),
(2299, 'travel_attractions', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 35, NULL, NULL, NULL, 1, 1),
(2300, 'travel_itinerary', 'id', '', 'bigint(20)', '', '', '', '', '', '', 2, NULL, 1, NULL, 1, 1),
(2301, 'travel_itinerary', 'image', '', 'varchar(300)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(2302, 'travel_itinerary', 'name', '', 'varchar(255)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(2303, 'travel_itinerary', 'user_id', '', 'varchar(100)', 'select', '@app_user', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(2304, 'travel_itinerary', 'days', '', 'int(10)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(2305, 'travel_itinerary', 'city', '', 'varchar(100)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(2306, 'travel_itinerary', 'status', '', 'varchar(100)', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(2307, 'travel_itinerary', 'is_system', '', 'tinyint(1)', '', '', '', '', '', '', 9, NULL, 1, NULL, 1, 1),
(2308, 'travel_itinerary', 'image_size', '', 'varchar(255)', '', '', '', '', '', '', 3, NULL, NULL, NULL, 1, 1),
(2309, 'travel_itinerary', 'start_date', '', 'date', '', '', '', '', '', '', 6, NULL, NULL, NULL, 1, 1),
(2310, 'travel_itinerary', 'end_date', '', 'date', '', '', '', '', '', '', 7, NULL, NULL, NULL, 1, 1),
(2311, 'travel_itinerary', 'content', '', 'text', '', '', '', '', '', '', 8, NULL, NULL, NULL, 1, 1),
(2312, 'travel_itinerary', 'sort_order', '', 'int(5)', '', '', '', '', '', '', 12, NULL, NULL, NULL, 1, 1),
(2313, 'travel_itinerary', 'is_top', '', 'tinyint(1)', '', '', '', '', '', '', 13, NULL, NULL, NULL, 1, 1),
(2314, 'travel_itinerary', 'created_user', '', 'varchar(100)', '', '', '', '', '', '', 15, NULL, NULL, 1, 1, 1),
(2315, 'travel_itinerary', 'created_date', '', 'datetime', '', '', '', '', '', '', 16, NULL, NULL, 1, 1, 1),
(2316, 'travel_itinerary', 'modified_user', '', 'varchar(100)', '', '', '', '', '', '', 17, NULL, NULL, 1, 1, 1),
(2317, 'travel_itinerary', 'modified_date', '', 'datetime', '', '', '', '', '', '', 18, NULL, NULL, 1, 1, 1),
(2318, 'travel_itinerary', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 19, NULL, NULL, NULL, 1, 1),
(2319, 'travel_sites', 'city', '', '', '', '', '', '', '', '', 2, NULL, 1, NULL, 1, 1),
(2320, 'travel_sites', 'keywords', '', '', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(2321, 'travel_sites', 'name', '', '', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(2322, 'travel_sites', 'url', '', '', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(2323, 'travel_sites', 'weight', '', '', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(2324, 'travel_sites', 'search_element', '', '', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(2325, 'travel_sites', 'is_active', '', '', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(2326, 'pm_project', 'id', '', 'bigint(20)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(2327, 'pm_project', 'image', '', 'varchar(300)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(2328, 'pm_project', 'code', '', 'varchar(255)', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(2329, 'pm_project', 'name', '', 'varchar(255)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(2330, 'pm_project', 'start_date', '', 'varchar(11)', 'date', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(2331, 'pm_project', 'end_date', '', 'varchar(11)', 'date', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(2332, 'pm_project', 'progress', '', 'int(10)', 'slide', '', '', '', '', '', 9, NULL, 1, NULL, 1, 1),
(2333, 'pm_project', 'product_id', '', 'varchar(100)', 'select', '@product', '', '', '', '', 10, NULL, 1, NULL, 1, 1),
(2334, 'pm_project', 'category_id', '', 'varchar(500)', '', '', '', '', '', '', 11, NULL, 1, NULL, 1, 1),
(2335, 'pm_project', 'type', '', 'varchar(100)', '', '', '', '', '', '', 12, NULL, 1, NULL, 1, 1);
INSERT INTO `settings_schema` (`id`, `object_type`, `name`, `description`, `dbType`, `editor`, `lookup`, `format`, `algorithm`, `group`, `roles`, `sort_order`, `is_group`, `is_column`, `is_readonly`, `is_active`, `is_system`) VALUES
(2336, 'pm_project', 'status', '', 'varchar(100)', '', '', '', '', '', '', 13, NULL, 1, NULL, 1, 1),
(2337, 'pm_project', 'user_id', '', 'varchar(100)', 'select', 'user,id,username', '', '', '', '', 14, NULL, 1, NULL, 1, 1),
(2338, 'pm_project', 'description', '', 'varchar(1000)', '', '', '', '', '', '', 5, NULL, NULL, NULL, 1, 1),
(2339, 'pm_project', 'content', '', 'text', '', 'select', '', '', '', '', 6, NULL, NULL, NULL, 1, 1),
(2340, 'pm_project', 'client_user_id', '', 'varchar(100)', '', '@app_user', '', '', '', '', 15, NULL, NULL, NULL, 1, 1),
(2341, 'pm_project', 'client_id', '', 'varchar(100)', '', '@crm_client', '', '', '', '', 16, NULL, NULL, NULL, 1, 1),
(2342, 'pm_project', 'contract_no', '', 'varchar(255)', '', '', '', '', '', '', 17, NULL, NULL, NULL, 1, 1),
(2343, 'pm_project', 'created_user', '', 'varchar(100)', '', '', '', '', '', '', 18, NULL, NULL, 1, 1, 1),
(2344, 'pm_project', 'created_date', '', 'date', '', '', '', '', '', '', 19, NULL, NULL, 1, 1, 1),
(2345, 'pm_project', 'modified_user', '', 'varchar(100)', '', '', '', '', '', '', 20, NULL, NULL, 1, 1, 1),
(2346, 'pm_project', 'modified_date', '', 'date', '', '', '', '', '', '', 21, NULL, NULL, 1, 1, 1),
(2347, 'pm_project', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 22, NULL, NULL, NULL, 1, 1),
(2348, 'pm_task', 'id', '', 'bigint(20)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(2349, 'pm_task', 'name', '', 'varchar(255)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(2350, 'pm_task', 'note', '', 'text', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(2351, 'pm_task', 'type', '', 'varchar(100)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(2352, 'pm_task', 'status', '', 'varchar(100)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(2353, 'pm_task', 'started_date', '', 'datetime', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(2354, 'pm_task', 'finished_date', '', 'datetime', '', '', '', '', '', '', 9, NULL, 1, NULL, 1, 1),
(2355, 'pm_task', 'user_id', '', 'varchar(100)', '', '', '', '', '', '', 10, NULL, 1, NULL, 1, 1),
(2356, 'pm_task', 'client_id', '', 'varchar(100)', '', '@crm_client', '', '', '', '', 11, NULL, 1, NULL, 1, 1),
(2357, 'pm_task', 'project_id', '', 'varchar(100)', '', '@pm_project', '', '', '', '', 12, NULL, 1, NULL, 1, 1),
(2358, 'pm_task', 'effort_spent', '', 'int(11)', '', '', '', '', '', '', 13, NULL, 1, NULL, 1, 1),
(2359, 'pm_task', 'effort_plan', '', 'int(11)', '', '', '', '', '', '', 14, NULL, 1, NULL, 1, 1),
(2360, 'pm_task', 'description', '', 'varchar(2000)', '', '', '', '', '', '', 3, NULL, NULL, NULL, 1, 1),
(2361, 'pm_task', 'created_date', '', 'date', '', '', '', '', '', '', 14, NULL, NULL, 1, 1, 1),
(2362, 'pm_task', 'created_user', '', 'varchar(100)', '', '', '', '', '', '', 15, NULL, NULL, 1, 1, 1),
(2363, 'pm_task', 'modified_date', '', 'date', '', '', '', '', '', '', 16, NULL, NULL, 1, 1, 1),
(2364, 'pm_task', 'modified_user', '', 'varchar(100)', '', '', '', '', '', '', 17, NULL, NULL, 1, 1, 1),
(2365, 'pm_task', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 18, NULL, NULL, NULL, 1, 1),
(2366, 'pm_issue', 'id', '', 'bigint(20)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(2367, 'pm_issue', 'name', '', 'varchar(255)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(2368, 'pm_issue', 'type', '', 'varchar(100)', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(2369, 'pm_issue', 'status', '', 'varchar(100)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(2370, 'pm_issue', 'priority', '', 'varchar(100)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(2371, 'pm_issue', 'user_id', '', 'varchar(100)', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(2372, 'pm_issue', 'client_id', '', 'varchar(100)', '', 'crm_client', '', '', '', '', 9, NULL, 1, NULL, 1, 1),
(2373, 'pm_issue', 'project_id', '', 'varchar(100)', '', '@pm_project', '', '', '', '', 10, NULL, 1, NULL, 1, 1),
(2374, 'pm_issue', 'description', '', 'varchar(2000)', '', '', '', '', '', '', 3, NULL, NULL, NULL, 1, 1),
(2375, 'pm_issue', 'content', '', 'text', '', '', '', '', '', '', 4, NULL, NULL, NULL, 1, 1),
(2376, 'pm_issue', 'created_date', '', 'date', '', '', '', '', '', '', 11, NULL, NULL, 1, 1, 1),
(2377, 'pm_issue', 'created_user', '', 'varchar(100)', '', '', '', '', '', '', 12, NULL, NULL, 1, 1, 1),
(2378, 'pm_issue', 'modified_date', '', 'date', '', '', '', '', '', '', 13, NULL, NULL, 1, 1, 1),
(2379, 'pm_issue', 'modified_user', '', 'varchar(100)', '', '', '', '', '', '', 14, NULL, NULL, 1, 1, 1),
(2380, 'pm_issue', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 15, NULL, NULL, NULL, 1, 1),
(2381, 'office_document', 'id', '', 'bigint(11)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(2382, 'office_document', 'code', '', 'varchar(255)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(2383, 'office_document', 'name', '', 'varchar(255)', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(2384, 'office_document', 'file', '', 'varchar(300)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(2385, 'office_document', 'origin', '', 'tinyint(1)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(2386, 'office_document', 'security', '', 'varchar(100)', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(2387, 'office_document', 'priority', '', 'varchar(100)', '', '', '', '', '', '', 9, NULL, 1, NULL, 1, 1),
(2388, 'office_document', 'category_id', '', 'varchar(500)', '', '', '', '', '', '', 10, NULL, 1, NULL, 1, 1),
(2389, 'office_document', 'type', '', 'varchar(100)', '', '', '', '', '', '', 11, NULL, 1, NULL, 1, 1),
(2390, 'office_document', 'status', '', 'varchar(100)', '', '', '', '', '', '', 12, NULL, 1, NULL, 1, 1),
(2391, 'office_document', 'action', '', 'varchar(100)', '', '', '', '', '', '', 13, NULL, 1, NULL, 1, 1),
(2392, 'office_document', 'receive_date', '', 'varchar(19)', 'datetime', '', '', '', '', '', 14, NULL, 1, NULL, 1, 1),
(2393, 'office_document', 'is_incoming', '', 'tinyint(1)', '', '', '', '', '', '', 15, NULL, 1, NULL, 1, 1),
(2394, 'office_document', 'description', '', 'varchar(2000)', '', '', '', '', '', '', 4, NULL, NULL, NULL, 1, 1),
(2395, 'office_document', 'content', '', 'text', '', '', '', '', '', '', 5, NULL, NULL, NULL, 1, 1),
(2396, 'office_document', 'receive_user', '', 'varchar(100)', '', '@user', '', '', '', '', 15, NULL, NULL, NULL, 1, 1),
(2397, 'office_document', 'receive_department', '', 'varchar(255)', '', '', '', '', '', '', 16, NULL, NULL, NULL, 1, 1),
(2398, 'office_document', 'receive_approval', '', 'varchar(255)', '', '@user', '', '', '', '', 17, NULL, NULL, NULL, 1, 1),
(2399, 'office_document', 'issue_date', '', 'varchar(19)', 'datetime', '', '', '', '', '', 18, NULL, NULL, NULL, 1, 1),
(2400, 'office_document', 'issue_department', '', 'varchar(255)', '', '', '', '', '', '', 19, NULL, NULL, NULL, 1, 1),
(2401, 'office_document', 'issue_user', '', 'varchar(255)', '', '', '', '', '', '', 20, NULL, NULL, NULL, 1, 1),
(2402, 'office_document', 'start_date', '', 'varchar(19)', '', '', '', '', '', '', 21, NULL, NULL, NULL, 1, 1),
(2403, 'office_document', 'end_date', '', 'varchar(19)', '', '', '', '', '', '', 22, NULL, NULL, NULL, 1, 1),
(2404, 'office_document', 'created_date', '', 'date', '', '', '', '', '', '', 24, NULL, NULL, 1, 1, 1),
(2405, 'office_document', 'created_user', '', 'varchar(100)', '', '', '', '', '', '', 25, NULL, NULL, 1, 1, 1),
(2406, 'office_document', 'modified_date', '', 'date', '', '', '', '', '', '', 26, NULL, NULL, 1, 1, 1),
(2407, 'office_document', 'modified_user', '', 'varchar(100)', '', '', '', '', '', '', 27, NULL, NULL, 1, 1, 1),
(2408, 'office_document', 'application_id', '', 'varchar(100)', '', '', '', '', '', '', 28, NULL, NULL, NULL, 1, 1),
(2409, 'app_user', 'id', '', 'int(11)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(2410, 'app_user', 'avatar', '', 'varchar(255)', '', '', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(2411, 'app_user', 'name', '', 'varchar(255)', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(2412, 'app_user', 'username', '', 'varchar(255)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(2413, 'app_user', 'email', '', 'varchar(255)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(2414, 'app_user', 'gender', '', 'varchar(100)', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1),
(2415, 'app_user', 'dob', '', 'varchar(255)', '', '', '', '', '', '', 9, NULL, 1, NULL, 1, 1),
(2416, 'app_user', 'phone', '', 'varchar(25)', '', '', '', '', '', '', 10, NULL, 1, NULL, 1, 1),
(2417, 'app_user', 'weight', '', 'varchar(255)', '', '', '', '', '', '', 11, NULL, 1, NULL, 1, 1),
(2418, 'app_user', 'height', '', 'varchar(255)', '', '', '', '', '', '', 12, NULL, 1, NULL, 1, 1),
(2419, 'app_user', 'address', '', 'varchar(255)', '', '', '', '', '', '', 13, NULL, 1, NULL, 1, 1),
(2420, 'app_user', 'country', '', 'varchar(100)', '', '', '', '', '', '', 14, NULL, 1, 1, 1, 1),
(2421, 'app_user', 'is_online', '', 'tinyint(1)', '', '', '', '', '', '', 15, NULL, 1, NULL, 1, 1),
(2422, 'app_user', 'is_active', '', 'tinyint(1)', '', '', '', '', '', '', 16, NULL, 1, NULL, 1, 1),
(2423, 'app_user', 'type', '', 'varchar(100)', '', '', '', '', '', '', 17, NULL, 1, NULL, 1, 1),
(2424, 'app_user', 'status', '', 'varchar(100)', '', '', '', '', '', '', 18, NULL, 1, NULL, 1, 1),
(2425, 'app_user', 'password', '', 'varchar(255)', '', '', '', '', '', '', 6, NULL, NULL, NULL, 1, 1),
(2426, 'app_user', 'auth_key', '', 'varchar(32)', '', '', '', '', '', '', 7, NULL, NULL, NULL, 1, 1),
(2427, 'app_user', 'password_hash', '', 'varchar(255)', '', '', '', '', '', '', 8, NULL, NULL, NULL, 1, 1),
(2428, 'app_user', 'password_reset_token', '', 'varchar(255)', '', '', '', '', '', '', 9, NULL, NULL, NULL, 1, 1),
(2429, 'app_user', 'description', '', 'varchar(2000)', '', '', '', '', '', '', 10, NULL, NULL, NULL, 1, 1),
(2430, 'app_user', 'content', '', 'text', '', '', '', '', '', '', 11, NULL, NULL, NULL, 1, 1),
(2431, 'app_user', 'state', '', 'varchar(100)', '', '', '', '', '', '', 19, NULL, NULL, NULL, 1, 1),
(2432, 'app_user', 'city', '', 'varchar(100)', '', '', '', '', '', '', 20, NULL, NULL, NULL, 1, 1),
(2433, 'app_user', 'balance', '', 'decimal(10,0)', '', '', '', '', '', '', 21, NULL, NULL, NULL, 1, 1),
(2434, 'app_user', 'point', '', 'int(11)', '', '', '', '', '', '', 22, NULL, NULL, NULL, 1, 1),
(2435, 'app_user', 'card_number', '', 'varchar(255)', '', '', '', '', '', '', 23, NULL, NULL, NULL, 1, 1),
(2436, 'app_user', 'card_cvv', '', 'varchar(255)', 'text', '', '', '', '', '', 24, NULL, NULL, NULL, 1, 1),
(2437, 'app_user', 'card_exp', '', 'varchar(255)', '', '', '', '', '', '', 25, NULL, NULL, NULL, 1, 1),
(2438, 'app_user', 'lat', '', 'varchar(255)', '', '', '', '', '', '', 26, NULL, NULL, NULL, 1, 1),
(2439, 'app_user', 'long', '', 'varchar(255)', '', '', '', '', '', '', 27, NULL, NULL, NULL, 1, 1),
(2440, 'app_user', 'rate', '', 'float', '', '', '', '', '', '', 28, NULL, NULL, 1, 1, 1),
(2441, 'app_user', 'rate_count', '', 'int(11)', '', '', '', '', '', '', 29, NULL, NULL, 1, 1, 1),
(2442, 'app_user', 'role', '', 'int(2)', 'select', '', '', '', '', '', 34, NULL, NULL, NULL, 1, 1),
(2443, 'app_user', 'provider_id', '', 'varchar(100)', '', '@provider', '', '', '', '', 35, NULL, NULL, NULL, 1, 1),
(2444, 'app_user', 'created_date', '', 'datetime', '', '', '', '', '', '', 36, NULL, NULL, 1, 1, 1),
(2445, 'app_user', 'modified_date', '', 'datetime', '', '', '', '', '', '', 37, NULL, NULL, 1, 1, 1),
(2446, 'app_user_device', 'id', '', 'int(11)', '', '', '', '', '', '', 3, NULL, 1, NULL, 1, 1),
(2447, 'app_user_device', 'user_id', '', 'int(11)', '', '@app_user', '', '', '', '', 4, NULL, 1, NULL, 1, 1),
(2448, 'app_user_device', 'ime', '', 'varchar(255)', '', '', '', '', '', '', 5, NULL, 1, NULL, 1, 1),
(2449, 'app_user_device', 'gcm_id', '', 'varchar(255)', '', '', '', '', '', '', 6, NULL, 1, NULL, 1, 1),
(2450, 'app_user_device', 'type', '', 'tinyint(1)', '', '', '', '', '', '', 7, NULL, 1, NULL, 1, 1),
(2451, 'app_user_device', 'status', '', 'tinyint(1)', '', '', '', '', '', '', 8, NULL, 1, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings_text`
--

CREATE TABLE IF NOT EXISTS `settings_text` (
  `id` bigint(10) NOT NULL,
  `group` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `description_en` varchar(255) DEFAULT NULL,
  `description_es` varchar(255) DEFAULT NULL COMMENT 'group:EUROPE',
  `description_pt` varchar(255) DEFAULT NULL COMMENT 'group:EUROPE',
  `description_de` varchar(255) DEFAULT NULL COMMENT 'group:EUROPE',
  `description_fr` varchar(255) DEFAULT NULL COMMENT 'group:EUROPE',
  `description_it` varchar(255) DEFAULT NULL COMMENT 'group:EUROPE',
  `description_ko` varchar(255) DEFAULT NULL COMMENT 'group:ASIA',
  `description_ja` varchar(255) DEFAULT NULL COMMENT 'group:ASIA',
  `description_vi` varchar(255) DEFAULT NULL COMMENT 'group:ASIA',
  `description_zh` varchar(255) DEFAULT NULL COMMENT 'group:ASIA'
) ENGINE=InnoDB AUTO_INCREMENT=1157 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings_text`
--

INSERT INTO `settings_text` (`id`, `group`, `name`, `description`, `description_en`, `description_es`, `description_pt`, `description_de`, `description_fr`, `description_it`, `description_ko`, `description_ja`, `description_vi`, `description_zh`) VALUES
(823, 'settings-text', 'menu.home', 'menu.home', 'menu.home', '', '', '', '', '', '', '', '', ''),
(824, 'settings-text', 'cms', 'CMS', 'CMS', '', '', '', '', '', '', '', '', ''),
(825, 'settings-text', 'blog', 'Blog', 'Blog', '', '', '', '', '', '', '', '', ''),
(826, 'settings-text', 'blogs', 'Blogs', 'Blogs', '', '', '', '', '', '', '', '', ''),
(827, 'settings-text', 'articles', 'Articles', 'Articles', '', '', '', '', '', '', '', '', ''),
(828, 'settings-text', 'home_slide', 'Home Slide', 'Home Slide', '', '', '', '', '', '', '', '', ''),
(829, 'settings-text', 'about', 'About', 'About', '', '', '', '', '', '', '', '', ''),
(830, 'settings-text', 'services', 'Services', 'Services', '', '', '', '', '', '', '', '', ''),
(831, 'settings-text', 'partners', 'Partners', 'Partners', '', '', '', '', '', '', '', '', ''),
(832, 'settings-text', 'portfolios', 'Portfolios', 'Portfolios', '', '', '', '', '', '', '', '', ''),
(833, 'settings-text', 'testimonials', 'Testimonials', 'Testimonials', '', '', '', '', '', '', '', '', ''),
(834, 'settings-text', 'employee', 'Employee', 'Employee', '', '', '', '', '', '', '', '', ''),
(835, 'settings-text', 'contacts', 'Contacts', 'Contacts', '', '', '', '', '', '', '', '', ''),
(836, 'settings-text', 'albums', 'Albums', 'Albums', '', '', '', '', '', '', '', '', ''),
(837, 'settings-text', 'faq', 'FAQ', 'FAQ', '', '', '', '', '', '', '', '', ''),
(838, 'settings-text', 'counters', 'Counters', 'Counters', '', '', '', '', '', '', '', '', ''),
(839, 'settings-text', 'crm', 'CRM', 'CRM', '', '', '', '', '', '', '', '', ''),
(840, 'settings-text', 'new_client', 'New Client', 'New Client', '', '', '', '', '', '', '', '', ''),
(841, 'settings-text', 'clients', 'Clients', 'Clients', '', '', '', '', '', '', '', '', ''),
(842, 'settings-text', 'deals', 'Deals', 'Deals', '', '', '', '', '', '', '', '', ''),
(843, 'settings-text', 'invoices', 'Invoices', 'Invoices', '', '', '', '', '', '', '', '', ''),
(844, 'settings-text', 'ecommerce', 'ECOMMERCE', 'ECOMMERCE', '', '', '', '', '', '', '', '', ''),
(845, 'settings-text', 'products', 'Products', 'Products', '', '', '', '', '', '', '', '', ''),
(846, 'settings-text', 'providers', 'Providers', 'Providers', '', '', '', '', '', '', '', '', ''),
(847, 'settings-text', 'promotions', 'Promotions', 'Promotions', '', '', '', '', '', '', '', '', ''),
(848, 'settings-text', 'music', 'MUSIC', 'MUSIC', '', '', '', '', '', '', '', '', ''),
(849, 'settings-text', 'artists', 'Artists', 'Artists', '', '', '', '', '', '', '', '', ''),
(850, 'settings-text', 'songs', 'Songs', 'Songs', '', '', '', '', '', '', '', '', ''),
(851, 'settings-text', 'playlist', 'Playlist', 'Playlist', '', '', '', '', '', '', '', '', ''),
(852, 'settings-text', 'travel', 'TRAVEL', 'TRAVEL', '', '', '', '', '', '', '', '', ''),
(853, 'settings-text', 'attractions_+_food', 'Attractions + Food', 'Attractions + Food', '', '', '', '', '', '', '', '', ''),
(854, 'settings-text', 'create_itineraries', 'Create Itineraries', 'Create Itineraries', '', '', '', '', '', '', '', '', ''),
(855, 'settings-text', 'update_content', 'Update Content', 'Update Content', '', '', '', '', '', '', '', '', ''),
(856, 'settings-text', '[search]_attractions', '[Search] Attractions', '[Search] Attractions', '', '', '', '', '', '', '', '', ''),
(857, 'settings-text', '[search]_sites', '[Search] Sites', '[Search] Sites', '', '', '', '', '', '', '', '', ''),
(858, 'settings-text', '[search]_scores', '[Search] Scores', '[Search] Scores', '', '', '', '', '', '', '', '', ''),
(859, 'settings-text', 'purchase', 'PURCHASE', 'PURCHASE', '', '', '', '', '', '', '', '', ''),
(860, 'settings-text', 'purchase_item', 'Purchase Item', 'Purchase Item', '', '', '', '', '', '', '', '', ''),
(861, 'settings-text', 'purchase_order', 'Purchase Order', 'Purchase Order', '', '', '', '', '', '', '', '', ''),
(862, 'settings-text', 'projects', 'Projects', 'Projects', '', '', '', '', '', '', '', '', ''),
(863, 'settings-text', 'tasks', 'Tasks', 'Tasks', '', '', '', '', '', '', '', '', ''),
(864, 'settings-text', 'issues', 'Issues', 'Issues', '', '', '', '', '', '', '', '', ''),
(865, 'settings-text', 'office', 'Office', 'Office', '', '', '', '', '', '', '', '', ''),
(866, 'settings-text', 'documents', 'Documents', 'Documents', '', '', '', '', '', '', '', '', ''),
(867, 'settings-text', 'users', 'Users', 'Users', '', '', '', '', '', '', '', '', ''),
(868, 'settings-text', 'backend_users', 'Backend Users', 'Backend Users', '', '', '', '', '', '', '', '', ''),
(869, 'settings-text', 'registered_users', 'Registered Users', 'Registered Users', '', '', '', '', '', '', '', '', ''),
(870, 'settings-text', 'users_devices', 'Users Devices', 'Users Devices', '', '', '', '', '', '', '', '', ''),
(871, 'settings-text', 'settings_text', 'Settings Text', 'Settings Text', '', '', '', '', '', '', '', '', ''),
(872, 'settings-text', 'button.create', 'Create', 'button.create', '', '', '', '', '', '', '', 'Tạo mới', ''),
(873, 'settings-text', 'title.create', 'title.create', 'title.create', '', '', '', '', '', '', '', '', ''),
(874, 'settings-text', 'id', 'ID', 'ID', '', '', '', '', '', '', '', '', ''),
(875, 'settings-text', 'group', 'Group', 'Group', '', '', '', '', '', '', '', '', ''),
(876, 'settings-text', 'name', 'Name', 'Name', '', '', '', '', '', '', '', '', ''),
(877, 'settings-text', 'description', 'Description', 'Description', '', '', '', '', '', '', '', '', ''),
(878, 'settings-text', 'description_en', 'Description En', 'Description En', '', '', '', '', '', '', '', '', ''),
(879, 'settings-text', 'description_es', 'Description Es', 'Description Es', '', '', '', '', '', '', '', '', ''),
(880, 'settings-text', 'description_pt', 'Description Pt', 'Description Pt', '', '', '', '', '', '', '', '', ''),
(881, 'settings-text', 'description_de', 'Description De', 'Description De', '', '', '', '', '', '', '', '', ''),
(882, 'settings-text', 'description_fr', 'Description Fr', 'Description Fr', '', '', '', '', '', '', '', '', ''),
(883, 'settings-text', 'description_it', 'Description It', 'Description It', '', '', '', '', '', '', '', '', ''),
(884, 'settings-text', 'description_ko', 'Description Ko', 'Description Ko', '', '', '', '', '', '', '', '', ''),
(885, 'settings-text', 'description_ja', 'Description Ja', 'Description Ja', '', '', '', '', '', '', '', '', ''),
(886, 'settings-text', 'description_vi', 'Description Vi', 'Description Vi', '', '', '', '', '', '', '', '', ''),
(887, 'settings-text', 'description_zh', 'Description Zh', 'Description Zh', '', '', '', '', '', '', '', '', ''),
(888, 'settings-text', 'message.confirmdelete', 'message.confirmdelete', 'message.confirmdelete', '', '', '', '', '', '', '', '', ''),
(889, 'settings-text', 'actions', 'Actions', 'Actions', '', '', '', '', '', '', '', '', ''),
(890, 'settings-text', 'delete', 'Delete', 'Delete', '', '', '', '', '', '', '', '', ''),
(891, 'settings-text', 'confirmation', 'Confirmation', 'Confirmation', '', '', '', '', '', '', '', '', ''),
(892, 'settings-text', 'message.confirm', 'message.confirm', 'message.confirm', '', '', '', '', '', '', '', '', ''),
(893, 'settings-text', 'title.view', 'title.view', 'title.view', '', '', '', '', '', '', '', '', ''),
(894, 'settings-text', 'title.update', 'title.update', 'title.update', '', '', '', '', '', '', '', '', ''),
(895, 'settings-text', 'title.delete', 'title.delete', 'title.delete', '', '', '', '', '', '', '', '', ''),
(896, 'settings-text', 'messege.confirmdelete', 'messege.confirmdelete', 'messege.confirmdelete', '', '', '', '', '', '', '', '', ''),
(897, 'settings-text', 'info', 'Info', 'Info', '', '', '', '', '', '', '', '', ''),
(898, 'settings-text', 'europe', 'EUROPE', 'EUROPE', '', '', '', '', '', '', '', '', ''),
(899, 'settings-text', 'asia', 'ASIA', 'ASIA', '', '', '', '', '', '', '', '', ''),
(900, 'settings-text', 'profile', 'Profile', 'Profile', '', '', '', '', '', '', '', '', ''),
(901, 'settings-text', 'log_out', 'Log Out', 'Log Out', '', '', '', '', '', '', '', '', ''),
(902, 'cms-blogs', 'cms_blogs', 'Cms Blogs', 'Cms Blogs', '', '', '', '', '', '', '', '', ''),
(903, 'cms-blogs', 'is_active', 'Is Active', 'Is Active', '', '', '', '', '', '', '', '', ''),
(904, 'cms-blogs', 'is_top', 'Is Top', 'Is Top', '', '', '', '', '', '', '', '', ''),
(905, 'cms-blogs', 'is_hot', 'Is Hot', 'Is Hot', '', '', '', '', '', '', '', '', ''),
(906, 'cms-blogs', 'set', 'Set', 'Set', '', '', '', '', '', '', '', '', ''),
(907, 'cms-blogs', 'type', 'Type', 'Type', '', '', '', '', '', '', '', '', ''),
(908, 'cms-blogs', 'empty', 'Empty', 'Empty', '', '', '', '', '', '', '', '', ''),
(909, 'cms-blogs', 'status', 'Status', 'Status', '', '', '', '', '', '', '', '', ''),
(910, 'cms-blogs', 'category_id', 'Category Id', 'Category Id', '', '', '', '', '', '', '', '', ''),
(911, 'cms-blogs', 'active', 'Active', 'Active', '', '', '', '', '', '', '', '', ''),
(912, 'cms-blogs', 'disabled', 'Disabled', 'Disabled', '', '', '', '', '', '', '', '', ''),
(913, 'cms-blogs', 'lang', 'Lang', 'Lang', '', '', '', '', '', '', '', '', ''),
(914, 'cms-blogs', 'is_new', 'Is New', 'Is New', '', '', '', '', '', '', '', '', ''),
(915, 'cms-blogs', 'thumbnail', 'Thumbnail', 'Thumbnail', '', '', '', '', '', '', '', '', ''),
(916, 'cms-blogs', 'image', 'Image', 'Image', '', '', '', '', '', '', '', '', ''),
(917, 'cms-blogs', 'banner', 'Banner', 'Banner', '', '', '', '', '', '', '', '', ''),
(918, 'cms-blogs', 'code', 'Code', 'Code', '', '', '', '', '', '', '', '', ''),
(919, 'cms-blogs', 'overview', 'Overview', 'Overview', '', '', '', '', '', '', '', '', ''),
(920, 'cms-blogs', 'content', 'Content', 'Content', '', '', '', '', '', '', '', '', ''),
(921, 'cms-blogs', 'tags', 'Tags', 'Tags', '', '', '', '', '', '', '', '', ''),
(922, 'cms-blogs', 'linkurl', 'Linkurl', 'Linkurl', '', '', '', '', '', '', '', '', ''),
(923, 'cms-blogs', 'author', 'Author', 'Author', '', '', '', '', '', '', '', '', ''),
(924, 'cms-blogs', 'count_views', 'Count Views', 'Count Views', '', '', '', '', '', '', '', '', ''),
(925, 'cms-blogs', 'count_comments', 'Count Comments', 'Count Comments', '', '', '', '', '', '', '', '', ''),
(926, 'cms-blogs', 'count_likes', 'Count Likes', 'Count Likes', '', '', '', '', '', '', '', '', ''),
(927, 'cms-blogs', 'count_rates', 'Count Rates', 'Count Rates', '', '', '', '', '', '', '', '', ''),
(928, 'cms-blogs', 'rates', 'Rates', 'Rates', '', '', '', '', '', '', '', '', ''),
(929, 'cms-blogs', 'created_date', 'Created Date', 'Created Date', '', '', '', '', '', '', '', '', ''),
(930, 'cms-blogs', 'created_user', 'Created User', 'Created User', '', '', '', '', '', '', '', '', ''),
(931, 'cms-blogs', 'modified_date', 'Modified Date', 'Modified Date', '', '', '', '', '', '', '', '', ''),
(932, 'cms-blogs', 'modified_user', 'Modified User', 'Modified User', '', '', '', '', '', '', '', '', ''),
(933, 'cms-blogs', 'application_id', 'Application ID', 'Application ID', '', '', '', '', '', '', '', '', ''),
(934, 'cms-blogs', 'uploads', 'Uploads', 'Uploads', '', '', '', '', '', '', '', '', ''),
(935, 'cms-blogs', 'is', 'Is', 'Is', '', '', '', '', '', '', '', '', ''),
(936, 'cms-blogs', 'count', 'Count', 'Count', '', '', '', '', '', '', '', '', ''),
(937, 'cms-blogs', 'application', 'Application', 'Application', '', '', '', '', '', '', '', '', ''),
(938, 'cms-blogs', 'top', 'top', 'top', '', '', '', '', '', '', '', '', ''),
(939, 'cms-blogs', 'new', 'new', 'new', '', '', '', '', '', '', '', '', ''),
(940, 'cms-blogs', 'hot', 'hot', 'hot', '', '', '', '', '', '', '', '', ''),
(941, 'cms-blogs', '...', '...', '...', '', '', '', '', '', '', '', '', ''),
(942, 'cms-blogs', 'android', 'Android', 'Android', '', '', '', '', '', '', '', '', ''),
(943, 'cms-blogs', 'ios', 'IOS', 'IOS', '', '', '', '', '', '', '', '', ''),
(944, 'cms-blogs', 'en', 'en', 'en', '', '', '', '', '', '', '', '', ''),
(945, 'cms-blogs', 'events', 'Events', 'Events', '', '', '', '', '', '', '', '', ''),
(946, 'cms-blogs', 'draft', 'Draft', 'Draft', '', '', '', '', '', '', '', '', ''),
(947, 'cms-blogs', 'list', 'List', 'List', '', '', '', '', '', '', '', '', ''),
(948, 'cms-blogs', 'features', 'Features', 'Features', '', '', '', '', '', '', '', '', ''),
(949, 'cms-article', 'cms_article', 'Cms Article', 'Cms Article', '', '', '', '', '', '', '', '', ''),
(950, 'cms-article', 'sort_order', 'Sort Order', 'Sort Order', '', '', '', '', '', '', '', '', ''),
(951, 'cms-article', 'testimonial', 'Testimonial', 'Testimonial', '', '', '', '', '', '', '', '', ''),
(952, 'cms-article', 'bunji', 'bunJi', 'bunJi', '', '', '', '', '', '', '', '', ''),
(953, 'settings', 'settings', 'Settings', 'Settings', '', '', '', '', '', '', '', '', ''),
(954, 'settings', 'is_system', 'Is System', 'Is System', '', '', '', '', '', '', '', '', ''),
(955, 'settings', 'meta_key', 'Meta Key', 'Meta Key', '', '', '', '', '', '', '', '', ''),
(956, 'settings', 'meta_value', 'Meta Value', 'Meta Value', '', '', '', '', '', '', '', '', ''),
(957, 'settings', 'editor', 'Editor', 'Editor', '', '', '', '', '', '', '', '', ''),
(958, 'settings', 'lookup', 'Lookup', 'Lookup', '', '', '', '', '', '', '', '', ''),
(959, 'settings', 'common', 'Common', 'Common', '', '', '', '', '', '', '', '', ''),
(960, 'settings', 'system', 'system', 'system', '', '', '', '', '', '', '', '', ''),
(961, 'settings', 'button.update', 'Update', 'button.update', '', '', '', '', '', '', '', '', ''),
(962, 'settings', 'button.cancel', 'Cancel', 'button.cancel', '', '', '', '', '', '', '', '', ''),
(963, 'settings-text', 'view', 'View', 'View', '', '', '', '', '', '', '', '', ''),
(964, 'settings-text', 'update', 'Update', 'Update', '', '', '', '', '', '', '', '', ''),
(965, 'settings-text', 'are_you_sure_to_delete_this_item?', 'Are you sure to delete this item?', 'Are you sure to delete this item?', '', '', '', '', '', '', '', '', ''),
(966, 'cms-slide', 'cms_slide', 'Cms Slide', 'Cms Slide', '', '', '', '', '', '', '', '', ''),
(967, 'cms-slide', 'transition_type', 'Transition Type', 'Transition Type', '', '', '', '', '', '', '', '', ''),
(968, 'cms-slide', 'transition_speed', 'Transition Speed', 'Transition Speed', '', '', '', '', '', '', '', '', ''),
(969, 'cms-slide', 'alignment', 'Alignment', 'Alignment', '', '', '', '', '', '', '', '', ''),
(970, 'cms-slide', 'url1_label', 'Url1 Label', 'Url1 Label', '', '', '', '', '', '', '', '', ''),
(971, 'cms-slide', 'url1_link', 'Url1 Link', 'Url1 Link', '', '', '', '', '', '', '', '', ''),
(972, 'cms-slide', 'url2_label', 'Url2 Label', 'Url2 Label', '', '', '', '', '', '', '', '', ''),
(973, 'cms-slide', 'url2_link', 'Url2 Link', 'Url2 Link', '', '', '', '', '', '', '', '', ''),
(974, 'cms-slide', 'url3_label', 'Url3 Label', 'Url3 Label', '', '', '', '', '', '', '', '', ''),
(975, 'cms-slide', 'url3_link', 'Url3 Link', 'Url3 Link', '', '', '', '', '', '', '', '', ''),
(976, 'cms-slide', 'url1', 'Url1', 'Url1', '', '', '', '', '', '', '', '', ''),
(977, 'cms-slide', 'url2', 'Url2', 'Url2', '', '', '', '', '', '', '', '', ''),
(978, 'cms-slide', 'url3', 'Url3', 'Url3', '', '', '', '', '', '', '', '', ''),
(979, 'cms-slide', 'sort', 'Sort', 'Sort', '', '', '', '', '', '', '', '', ''),
(980, 'cms-slide', '500', '500', '500', '', '', '', '', '', '', '', '', ''),
(981, 'cms-slide', 'center', 'center', 'center', '', '', '', '', '', '', '', '', ''),
(982, 'cms-slide', 'random', 'random', 'random', '', '', '', '', '', '', '', '', ''),
(983, 'cms-slide', '1000', '1000', '1000', '', '', '', '', '', '', '', '', ''),
(984, 'cms-slide', 'left', 'left', 'left', '', '', '', '', '', '', '', '', ''),
(985, 'cms-slide', 'fade', 'fade', 'fade', '', '', '', '', '', '', '', '', ''),
(986, 'cms-slide', '1500', '1500', '1500', '', '', '', '', '', '', '', '', ''),
(987, 'cms-slide', 'right', 'right', 'right', '', '', '', '', '', '', '', '', ''),
(988, 'cms-slide', 'zoomout', 'zoomout', 'zoomout', '', '', '', '', '', '', '', '', ''),
(989, 'cms-testimonial', 'cms_testimonial', 'Cms Testimonial', 'Cms Testimonial', '', '', '', '', '', '', '', '', ''),
(990, 'cms-testimonial', 'location', 'Location', 'Location', '', '', '', '', '', '', '', '', ''),
(991, 'cms-testimonial', 'rate', 'Rate', 'Rate', '', '', '', '', '', '', '', '', ''),
(992, 'cms-portfolio', 'cms_portfolio', 'Cms Portfolio', 'Cms Portfolio', '', '', '', '', '', '', '', '', ''),
(993, 'cms-portfolio', 'product_category_id', 'Product Category Id', 'Product Category Id', '', '', '', '', '', '', '', '', ''),
(994, 'cms-portfolio', 'testimonial_id', 'Testimonial ID', 'Testimonial ID', '', '', '', '', '', '', '', '', ''),
(995, 'cms-portfolio', 'product_id', 'Product ID', 'Product ID', '', '', '', '', '', '', '', '', ''),
(996, 'cms-portfolio', 'product', 'Product', 'Product', '', '', '', '', '', '', '', '', ''),
(997, 'site', 'dashboard', 'Dashboard', 'Dashboard', '', '', '', '', '', '', '', '', ''),
(998, 'site', 'reports_&_statistics', 'reports & statistics', 'reports & statistics', '', '', '', '', '', '', '', '', ''),
(999, 'cms-blogs', 'create', 'Create', 'Create', '', '', '', '', '', '', '', '', ''),
(1000, 'cms-blogs', 'views', 'Views', 'Views', '', '', '', '', '', '', '', '', ''),
(1001, 'cms-blogs', 'comments', 'Comments', 'Comments', '', '', '', '', '', '', '', '', ''),
(1002, 'cms-blogs', 'likes', 'Likes', 'Likes', '', '', '', '', '', '', '', '', ''),
(1003, 'cms-blogs', 'created', 'Created', 'Created', '', '', '', '', '', '', '', '', ''),
(1004, 'cms-blogs', '_', '', '', '', '', '', '', '', '', '', '', ''),
(1005, 'cms-blogs', 'modified', 'Modified', 'Modified', '', '', '', '', '', '', '', '', ''),
(1006, 'cms-blogs', 'attributes', 'Attributes', 'Attributes', '', '', '', '', '', '', '', '', ''),
(1007, 'cms-blogs', 'file/url', 'File/URL', 'File/URL', '', '', '', '', '', '', '', '', ''),
(1008, 'cms-blogs', 'title', 'Title', 'Title', '', '', '', '', '', '', '', '', ''),
(1009, 'cms-blogs', 'duration', 'Duration', 'Duration', '', '', '', '', '', '', '', '', ''),
(1010, 'cms-blogs', 'files_&_images', 'Files & Images', 'Files & Images', '', '', '', '', '', '', '', '', ''),
(1011, 'cms-blogs', 'custom_field', 'Custom Field', 'Custom Field', '', '', '', '', '', '', '', '', ''),
(1012, 'cms-blogs', 'value', 'Value', 'Value', '', '', '', '', '', '', '', '', ''),
(1013, 'cms-blogs', 'grouping', 'Grouping', 'Grouping', '', '', '', '', '', '', '', '', ''),
(1014, 'cms-blogs', 'pricing', 'Pricing', 'Pricing', '', '', '', '', '', '', '', '', ''),
(1015, 'cms-blogs', 'save', 'Save', 'Save', '', '', '', '', '', '', '', '', ''),
(1016, 'cms-blogs', 'clone', 'Clone', 'Clone', '', '', '', '', '', '', '', '', ''),
(1017, 'cms-blogs', 'cancel', 'Cancel', 'Cancel', '', '', '', '', '', '', '', '', ''),
(1018, 'crm-client', 'crm_client', 'Crm Client', 'Crm Client', '', '', '', '', '', '', '', '', ''),
(1019, 'crm-client', 'email', 'Email', 'Email', '', '', '', '', '', '', '', '', ''),
(1020, 'crm-client', 'mobile', 'Mobile', 'Mobile', '', '', '', '', '', '', '', '', ''),
(1021, 'crm-client', 'user_id', 'User ID', 'User ID', '', '', '', '', '', '', '', '', ''),
(1022, 'crm-client', 'company', 'Company', 'Company', '', '', '', '', '', '', '', '', ''),
(1023, 'crm-client', 'vat_number', 'Vat Number', 'Vat Number', '', '', '', '', '', '', '', '', ''),
(1024, 'crm-client', 'website', 'Website', 'Website', '', '', '', '', '', '', '', '', ''),
(1025, 'crm-client', 'phone', 'Phone', 'Phone', '', '', '', '', '', '', '', '', ''),
(1026, 'crm-client', 'fax', 'Fax', 'Fax', '', '', '', '', '', '', '', '', ''),
(1027, 'crm-client', 'address', 'Address', 'Address', '', '', '', '', '', '', '', '', ''),
(1028, 'crm-client', 'zip_code', 'Zip Code', 'Zip Code', '', '', '', '', '', '', '', '', ''),
(1029, 'crm-client', 'city', 'City', 'City', '', '', '', '', '', '', '', '', ''),
(1030, 'crm-client', 'country', 'Country', 'Country', '', '', '', '', '', '', '', '', ''),
(1031, 'crm-client', 'note', 'Note', 'Note', '', '', '', '', '', '', '', '', ''),
(1032, 'crm-client', 'touch_date', 'Touch Date', 'Touch Date', '', '', '', '', '', '', '', '', ''),
(1033, 'crm-client', 'region', 'Region', 'Region', '', '', '', '', '', '', '', '', ''),
(1034, 'crm-client', 'ip_address', 'Ip Address', 'Ip Address', '', '', '', '', '', '', '', '', ''),
(1035, 'crm-client', 'touch', 'Touch', 'Touch', '', '', '', '', '', '', '', '', ''),
(1036, 'crm-client', 'africa', 'AFRICA', 'AFRICA', '', '', '', '', '', '', '', '', ''),
(1037, 'site', '1_day_in_kl', '1 day in KL', '1 day in KL', '', '', '', '', '', '', '', '', ''),
(1038, 'site', '2_days_in_kl', '2 days in KL', '2 days in KL', '', '', '', '', '', '', '', '', ''),
(1039, 'site', '3_days_in_kl', '3 days in KL', '3 days in KL', '', '', '', '', '', '', '', '', ''),
(1040, 'site', '2_days_in_kl_:d_clone', '2 days in KL :D CLone', '2 days in KL :D CLone', '', '', '', '', '', '', '', '', ''),
(1041, 'site', '2_days_in_kl_:d_clone_2', '2 days in KL :D CLone 2', '2 days in KL :D CLone 2', '', '', '', '', '', '', '', '', ''),
(1042, 'travel', 'travels_plan', 'Travels Plan', 'Travels Plan', '', '', '', '', '', '', '', '', ''),
(1043, 'travel', 'my_travel_plans', 'My Travel Plans', 'My Travel Plans', '', '', '', '', '', '', '', '', ''),
(1044, 'travel', 'end_at', 'End at', 'End at', '', '', '', '', '', '', '', '', ''),
(1045, 'travel', 'plan', 'PLAN', 'PLAN', '', '', '', '', '', '', '', '', ''),
(1046, 'travel', 'my_trips', 'My Trips', 'My Trips', '', '', '', '', '', '', '', '', ''),
(1047, 'product', 'home', 'Home', 'Home', '', '', '', '', '', '', '', '', ''),
(1048, 'product', 'products_list', 'Products List', 'Products List', '', '', '', '', '', '', '', '', ''),
(1049, 'product', 'providers_list', 'Providers List', 'Providers List', '', '', '', '', '', '', '', '', ''),
(1050, 'product', 'purchase_request', 'Purchase Request', 'Purchase Request', '', '', '', '', '', '', '', '', ''),
(1051, 'product', 'purchase_items', 'Purchase Items', 'Purchase Items', '', '', '', '', '', '', '', '', ''),
(1052, 'product', 'purchase_orders', 'Purchase Orders', 'Purchase Orders', '', '', '', '', '', '', '', '', ''),
(1053, 'product', 'administration', 'Administration', 'Administration', '', '', '', '', '', '', '', '', ''),
(1054, 'product', 'cost', 'Cost', 'Cost', '', '', '', '', '', '', '', '', ''),
(1055, 'product', 'price', 'Price', 'Price', '', '', '', '', '', '', '', '', ''),
(1056, 'product', 'unit', 'Unit', 'Unit', '', '', '', '', '', '', '', '', ''),
(1057, 'product', 'currency', 'Currency', 'Currency', '', '', '', '', '', '', '', '', ''),
(1058, 'product', 'color', 'Color', 'Color', '', '', '', '', '', '', '', '', ''),
(1059, 'product', 'brand_id', 'Brand ID', 'Brand ID', '', '', '', '', '', '', '', '', ''),
(1060, 'product', 'promotion_id', 'Promotion ID', 'Promotion ID', '', '', '', '', '', '', '', '', ''),
(1061, 'product', 'quantity', 'Quantity', 'Quantity', '', '', '', '', '', '', '', '', ''),
(1062, 'product', 'discount', 'Discount', 'Discount', '', '', '', '', '', '', '', '', ''),
(1063, 'product', 'tax', 'Tax', 'Tax', '', '', '', '', '', '', '', '', ''),
(1064, 'product', 'count_purchase', 'Count Purchase', 'Count Purchase', '', '', '', '', '', '', '', '', ''),
(1065, 'product', 'qrcode_image', 'Qrcode Image', 'Qrcode Image', '', '', '', '', '', '', '', '', ''),
(1066, 'product', 'barcode_image', 'Barcode Image', 'Barcode Image', '', '', '', '', '', '', '', '', ''),
(1067, 'product', 'Ảnh_đại_diện', 'Ảnh đại diện', 'Ảnh đại diện', '', '', '', '', '', '', '', '', ''),
(1068, 'product', 'Ảnh', 'Ảnh', 'Ảnh', '', '', '', '', '', '', '', '', ''),
(1069, 'product', 'mã', 'Mã', 'Mã', '', '', '', '', '', '', '', '', ''),
(1070, 'product', 'tên', 'Tên', 'Tên', '', '', '', '', '', '', '', '', ''),
(1071, 'product', 'tổng_quan', 'Tổng quan', 'Tổng quan', '', '', '', '', '', '', '', '', ''),
(1072, 'product', 'nội_dung', 'Nội dung', 'Nội dung', '', '', '', '', '', '', '', '', ''),
(1073, 'product', 'giá_mua', 'Giá mua', 'Giá mua', '', '', '', '', '', '', '', '', ''),
(1074, 'product', 'giá_bán', 'Giá bán', 'Giá bán', '', '', '', '', '', '', '', '', ''),
(1075, 'product', 'Đơn_vị', 'Đơn vị', 'Đơn vị', '', '', '', '', '', '', '', '', ''),
(1076, 'product', 'loại_tiền', 'Loại tiền', 'Loại tiền', '', '', '', '', '', '', '', '', ''),
(1077, 'product', 'màu', 'Màu', 'Màu', '', '', '', '', '', '', '', '', ''),
(1078, 'product', 'kiểu', 'Kiểu', 'Kiểu', '', '', '', '', '', '', '', '', ''),
(1079, 'product', 'tình_trạng', 'Tình trạng', 'Tình trạng', '', '', '', '', '', '', '', '', ''),
(1080, 'product', 'số_lượng', 'Số lượng', 'Số lượng', '', '', '', '', '', '', '', '', ''),
(1081, 'product', 'chiết_khấu', 'Chiết khấu', 'Chiết khấu', '', '', '', '', '', '', '', '', ''),
(1082, 'product', 'thuế', 'Thuế', 'Thuế', '', '', '', '', '', '', '', '', ''),
(1083, 'product', 'Đánh_giá', 'Đánh giá', 'Đánh giá', '', '', '', '', '', '', '', '', ''),
(1084, 'product', 'hạng_mục', 'Hạng mục', 'Hạng mục', '', '', '', '', '', '', '', '', ''),
(1085, 'product', 'hoạt_động?', 'Hoạt động?', 'Hoạt động?', '', '', '', '', '', '', '', '', ''),
(1086, 'product', 'nổi_bật?', 'Nổi bật?', 'Nổi bật?', '', '', '', '', '', '', '', '', ''),
(1087, 'product', 'trang_chủ?', 'Trang chủ?', 'Trang chủ?', '', '', '', '', '', '', '', '', ''),
(1088, 'product', 'hàng_hóa', 'Hàng hóa', 'Hàng hóa', '', '', '', '', '', '', '', '', ''),
(1089, 'product', 'brand', 'Brand', 'Brand', '', '', '', '', '', '', '', '', ''),
(1090, 'product', 'category', 'Category', 'Category', '', '', '', '', '', '', '', '', ''),
(1091, 'product', 'promotion', 'Promotion', 'Promotion', '', '', '', '', '', '', '', '', ''),
(1092, 'product', 'khuyến_mại', 'Khuyến mại', 'Khuyến mại', '', '', '', '', '', '', '', '', ''),
(1093, 'product', 'nhãn_hàng', 'Nhãn hàng', 'Nhãn hàng', '', '', '', '', '', '', '', '', ''),
(1094, 'product', 'danh_mục', 'Danh mục', 'Danh mục', '', '', '', '', '', '', '', '', ''),
(1095, 'product', 'thương_hiệu', 'Thương hiệu', 'Thương hiệu', '', '', '', '', '', '', '', '', ''),
(1096, 'product', 'thương_hiệu/_nsx', 'Thương hiệu/ NSX', 'Thương hiệu/ NSX', '', '', '', '', '', '', '', '', ''),
(1097, 'product', 'xem', 'Xem', 'Xem', '', '', '', '', '', '', '', '', ''),
(1098, 'product', 'bình_luận', 'Bình luận', 'Bình luận', '', '', '', '', '', '', '', '', ''),
(1099, 'product', 'nhập_hàng', 'Nhập hàng', 'Nhập hàng', '', '', '', '', '', '', '', '', ''),
(1100, 'product', 'thích', 'Thích', 'Thích', '', '', '', '', '', '', '', '', ''),
(1101, 'product', 'mã_tl', 'Mã TL', 'Mã TL', '', '', '', '', '', '', '', '', ''),
(1102, 'provider', 'provider', 'Provider', 'Provider', '', '', '', '', '', '', '', '', ''),
(1103, 'provider', 'not_top', 'Not Top', 'Not Top', '', '', '', '', '', '', '', '', ''),
(1104, 'provider', 'not_active', 'Not Active', 'Not Active', '', '', '', '', '', '', '', '', ''),
(1105, 'provider', 'start_date', 'Start Date', 'Start Date', '', '', '', '', '', '', '', '', ''),
(1106, 'provider', 'contact_name', 'Contact Name', 'Contact Name', '', '', '', '', '', '', '', '', ''),
(1107, 'provider', 'lat', 'Lat', 'Lat', '', '', '', '', '', '', '', '', ''),
(1108, 'provider', 'long', 'Long', 'Long', '', '', '', '', '', '', '', '', ''),
(1109, 'provider', 'nhà_cung_cấp', 'Nhà cung cấp', 'Nhà cung cấp', '', '', '', '', '', '', '', '', ''),
(1110, 'product', 'not_hot', 'Not Hot', 'Not Hot', '', '', '', '', '', '', '', '', ''),
(1111, 'product', 'qrcode', 'Qrcode', 'Qrcode', '', '', '', '', '', '', '', '', ''),
(1112, 'product', 'barcode', 'Barcode', 'Barcode', '', '', '', '', '', '', '', '', ''),
(1113, 'product', 'tồn_tại', 'Tồn tại', 'Tồn tại', '', '', '', '', '', '', '', '', ''),
(1114, 'product', 'cáp_thép', 'Cáp thép', 'Cáp thép', '', '', '', '', '', '', '', '', ''),
(1115, 'product', 'clothes', 'Clothes', 'Clothes', '', '', '', '', '', '', '', '', ''),
(1116, 'product', 'in_stock', 'In Stock', 'In Stock', '', '', '', '', '', '', '', '', ''),
(1117, 'product', 'Đệm', 'Đệm', 'Đệm', '', '', '', '', '', '', '', '', ''),
(1118, 'product', 'course', 'Course', 'Course', '', '', '', '', '', '', '', '', ''),
(1119, 'product', 'out_of_stock', 'Out of Stock', 'Out of Stock', '', '', '', '', '', '', '', '', ''),
(1120, 'product', 'neo', 'NEO', 'NEO', '', '', '', '', '', '', '', '', ''),
(1121, 'purchase-request', 'purpose_type', 'Purpose Type', 'Purpose Type', '', '', '', '', '', '', '', '', ''),
(1122, 'purchase-request', 'request_code', 'Request Code', 'Request Code', '', '', '', '', '', '', '', '', ''),
(1123, 'purchase-request', 'request_date', 'Request Date', 'Request Date', '', '', '', '', '', '', '', '', ''),
(1124, 'purchase-request', 'request_user', 'Request User', 'Request User', '', '', '', '', '', '', '', '', ''),
(1125, 'purchase-request', 'department', 'Department', 'Department', '', '', '', '', '', '', '', '', ''),
(1126, 'purchase-request', 'request_location', 'Request Location', 'Request Location', '', '', '', '', '', '', '', '', ''),
(1127, 'purchase-request', 'purpose_note', 'Purpose Note', 'Purpose Note', '', '', '', '', '', '', '', '', ''),
(1128, 'purchase-request', 'client_name', 'Client Name', 'Client Name', '', '', '', '', '', '', '', '', ''),
(1129, 'purchase-request', 'client_address', 'Client Address', 'Client Address', '', '', '', '', '', '', '', '', ''),
(1130, 'purchase-request', 'client_delivery_address', 'Client Delivery Address', 'Client Delivery Address', '', '', '', '', '', '', '', '', ''),
(1131, 'purchase-request', 'client_delivery_date', 'Client Delivery Date', 'Client Delivery Date', '', '', '', '', '', '', '', '', ''),
(1132, 'purchase-request', 'client_contract_no', 'Client Contract No', 'Client Contract No', '', '', '', '', '', '', '', '', ''),
(1133, 'purchase-request', 'client_contract_code', 'Client Contract Code', 'Client Contract Code', '', '', '', '', '', '', '', '', ''),
(1134, 'purchase-request', 'request', 'Request', 'Request', '', '', '', '', '', '', '', '', ''),
(1135, 'purchase-request', 'purpose', 'Purpose', 'Purpose', '', '', '', '', '', '', '', '', ''),
(1136, 'purchase-request', 'client', 'Client', 'Client', '', '', '', '', '', '', '', '', ''),
(1137, 'purchase-request', 'ycmh', 'YCMH', 'YCMH', '', '', '', '', '', '', '', '', ''),
(1138, 'purchase-request', 'ngày_ycmh', 'Ngày YCMH', 'Ngày YCMH', '', '', '', '', '', '', '', '', ''),
(1139, 'purchase-request', 'người_ycmh', 'Người YCMH', 'Người YCMH', '', '', '', '', '', '', '', '', ''),
(1140, 'purchase-request', 'huypt', 'huypt', 'huypt', '', '', '', '', '', '', '', '', ''),
(1141, 'purchase-request', 'phòng_ban', 'Phòng ban', 'Phòng ban', '', '', '', '', '', '', '', '', ''),
(1142, 'purchase-request', 'khu_vực', 'Khu vực', 'Khu vực', '', '', '', '', '', '', '', '', ''),
(1143, 'purchase-request', 'hn', 'HN', 'HN', '', '', '', '', '', '', '', '', ''),
(1144, 'purchase-request', 'mục_đích', 'Mục đích', 'Mục đích', '', '', '', '', '', '', '', '', ''),
(1145, 'purchase-request', 'other', 'other', 'other', '', '', '', '', '', '', '', '', ''),
(1146, 'purchase-request', 'ghi_chú', 'Ghi chú', 'Ghi chú', '', '', '', '', '', '', '', '', ''),
(1147, 'purchase-request', 'khách_hàng', 'Khách hàng', 'Khách hàng', '', '', '', '', '', '', '', '', ''),
(1148, 'purchase-request', 'Địa_chỉ_kh', 'Địa chỉ KH', 'Địa chỉ KH', '', '', '', '', '', '', '', '', ''),
(1149, 'purchase-request', 'Đc_giao_hàng', 'ĐC giao hàng', 'ĐC giao hàng', '', '', '', '', '', '', '', '', ''),
(1150, 'purchase-request', 'ngày_giao', 'Ngày giao', 'Ngày giao', '', '', '', '', '', '', '', '', ''),
(1151, 'purchase-request', 'hợp_đồng_số', 'Hợp đồng số', 'Hợp đồng số', '', '', '', '', '', '', '', '', ''),
(1152, 'purchase-request', 'mã_hợp_đồng', 'Mã hợp đồng', 'Mã hợp đồng', '', '', '', '', '', '', '', '', ''),
(1153, 'purchase-request', 'fail', 'fail', 'fail', '', '', '', '', '', '', '', '', ''),
(1154, 'purchase-request', 'yêu_cầu_mua_hàng', 'Yêu cầu mua hàng', 'Yêu cầu mua hàng', '', '', '', '', '', '', '', '', ''),
(1155, 'purchase-request', 'file', 'File', 'File', '', '', '', '', '', '', '', '', ''),
(1156, 'purchase-request', '_client', 'Client', 'Client', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `settings_theme`
--

CREATE TABLE IF NOT EXISTS `settings_theme` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `background` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `font` varchar(255) NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `overview` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `birth_place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identity_card` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `department` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `lat` int(11) DEFAULT NULL,
  `long` int(11) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `rate_count` int(11) DEFAULT NULL,
  `card_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_exp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_cvv` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance` decimal(10,0) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `role` int(2) DEFAULT NULL COMMENT 'data:10:USER,20:MODERATOR,30:ADMIN',
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10' COMMENT 'data:DISABLED=0,ACTIVE=10',
  `is_online` tinyint(1) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_logout` datetime DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `application_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `code`, `name`, `username`, `image`, `overview`, `content`, `auth_key`, `password_hash`, `password_reset_token`, `birth_date`, `birth_place`, `gender`, `identity_card`, `email`, `phone`, `skype`, `address`, `country`, `state`, `city`, `post_code`, `organization`, `department`, `position`, `start_date`, `end_date`, `lat`, `long`, `rate`, `rate_count`, `card_number`, `card_name`, `card_exp`, `card_cvv`, `balance`, `point`, `role`, `type`, `status`, `is_online`, `last_login`, `last_logout`, `created_at`, `updated_at`, `application_id`) VALUES
(1, '', 'admin', 'admin', '', '', '', 'G3ur6T5jEB8KETrQT_IxU4zJrkHQmdIr', '$2y$13$EO42DU9iBZJsoXaD15YJb.mM1Xq20c3ZUg4DWYSZD4EusAjO23gci', 's-GPOPgaYTdnCi3zbfVBciNTdCrNHjCS_1510198713', NULL, '', '', '', 'admin_ebook@gmail.com', '', '', '', NULL, NULL, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, '', 10, 1, '2018-02-20 22:14:09', '2017-12-15 05:32:18', 2018, 2018, 'ebook');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_notification`
--
ALTER TABLE `app_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_user`
--
ALTER TABLE `app_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_user_bookmark`
--
ALTER TABLE `app_user_bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_user_device`
--
ALTER TABLE `app_user_device`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_user_feedback`
--
ALTER TABLE `app_user_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_user_logs`
--
ALTER TABLE `app_user_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_user_pro`
--
ALTER TABLE `app_user_pro`
  ADD UNIQUE KEY `user_id_unique` (`user_id`);

--
-- Indexes for table `app_user_token`
--
ALTER TABLE `app_user_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_user_transaction`
--
ALTER TABLE `app_user_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_role`
--
ALTER TABLE `auth_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_bookmark`
--
ALTER TABLE `book_bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_chapter`
--
ALTER TABLE `book_chapter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_comment`
--
ALTER TABLE `book_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `object_actions`
--
ALTER TABLE `object_actions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `object_attributes`
--
ALTER TABLE `object_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `object_category`
--
ALTER TABLE `object_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `object_comment`
--
ALTER TABLE `object_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `object_counter`
--
ALTER TABLE `object_counter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `object_counter_history`
--
ALTER TABLE `object_counter_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `object_file`
--
ALTER TABLE `object_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `object_message`
--
ALTER TABLE `object_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `object_people`
--
ALTER TABLE `object_people`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `object_relation`
--
ALTER TABLE `object_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `object_reviews`
--
ALTER TABLE `object_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `object_seo`
--
ALTER TABLE `object_seo`
  ADD PRIMARY KEY (`object_id`);

--
-- Indexes for table `object_setting`
--
ALTER TABLE `object_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `object_tag`
--
ALTER TABLE `object_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `object_translation`
--
ALTER TABLE `object_translation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `object_type`
--
ALTER TABLE `object_type`
  ADD PRIMARY KEY (`object_type`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_options`
--
ALTER TABLE `question_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_languages`
--
ALTER TABLE `settings_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_lookup`
--
ALTER TABLE `settings_lookup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_menu`
--
ALTER TABLE `settings_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_onepay_coin`
--
ALTER TABLE `settings_onepay_coin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_schema`
--
ALTER TABLE `settings_schema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_text`
--
ALTER TABLE `settings_text`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_theme`
--
ALTER TABLE `settings_theme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`), ADD UNIQUE KEY `email` (`email`), ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `application`
--
ALTER TABLE `application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `app_notification`
--
ALTER TABLE `app_notification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `app_user`
--
ALTER TABLE `app_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `app_user_bookmark`
--
ALTER TABLE `app_user_bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `app_user_device`
--
ALTER TABLE `app_user_device`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `app_user_feedback`
--
ALTER TABLE `app_user_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `app_user_logs`
--
ALTER TABLE `app_user_logs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `app_user_token`
--
ALTER TABLE `app_user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=138;
--
-- AUTO_INCREMENT for table `app_user_transaction`
--
ALTER TABLE `app_user_transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=133;
--
-- AUTO_INCREMENT for table `auth_role`
--
ALTER TABLE `auth_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=175;
--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `book_bookmark`
--
ALTER TABLE `book_bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `book_chapter`
--
ALTER TABLE `book_chapter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `book_comment`
--
ALTER TABLE `book_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `object_actions`
--
ALTER TABLE `object_actions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `object_attributes`
--
ALTER TABLE `object_attributes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `object_category`
--
ALTER TABLE `object_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `object_comment`
--
ALTER TABLE `object_comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `object_counter`
--
ALTER TABLE `object_counter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=223;
--
-- AUTO_INCREMENT for table `object_counter_history`
--
ALTER TABLE `object_counter_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=169;
--
-- AUTO_INCREMENT for table `object_file`
--
ALTER TABLE `object_file`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `object_message`
--
ALTER TABLE `object_message`
  MODIFY `id` bigint(1) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `object_people`
--
ALTER TABLE `object_people`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `object_relation`
--
ALTER TABLE `object_relation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=184;
--
-- AUTO_INCREMENT for table `object_reviews`
--
ALTER TABLE `object_reviews`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `object_setting`
--
ALTER TABLE `object_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=171;
--
-- AUTO_INCREMENT for table `object_tag`
--
ALTER TABLE `object_tag`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `object_translation`
--
ALTER TABLE `object_translation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `provider`
--
ALTER TABLE `provider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `question_options`
--
ALTER TABLE `question_options`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2455;
--
-- AUTO_INCREMENT for table `settings_lookup`
--
ALTER TABLE `settings_lookup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `settings_menu`
--
ALTER TABLE `settings_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `settings_onepay_coin`
--
ALTER TABLE `settings_onepay_coin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `settings_schema`
--
ALTER TABLE `settings_schema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2452;
--
-- AUTO_INCREMENT for table `settings_text`
--
ALTER TABLE `settings_text`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1157;
--
-- AUTO_INCREMENT for table `settings_theme`
--
ALTER TABLE `settings_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
