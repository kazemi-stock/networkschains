-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 10, 2019 at 08:41 PM
-- Server version: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `udemy`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `slug` char(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` char(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `image` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_index` tinyint(4) DEFAULT NULL,
  `show_index_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `text`, `slug`, `url`, `parent_id`, `image`, `show_index`, `show_index_order`, `created_at`, `updated_at`) VALUES
(6, 'دسته یک', 'توضیحات مربوط به این دسته در اینجا قرار میگیرد  !', 'a', 'a', NULL, '5db1bdcd4c1f8.png', 1, 0, '2019-10-18 13:16:25', '2019-11-06 00:10:08'),
(7, 'زیر دسته 1', NULL, 'b', 'a/b', 6, NULL, NULL, 0, '2019-10-18 13:16:37', '2019-10-18 13:16:37'),
(8, 'نوه 11', NULL, 'c', 'a/b/c', 7, NULL, NULL, 0, '2019-10-18 13:16:50', '2019-10-18 13:17:36'),
(9, 'دسته دیگر', 'توضیحات مربوط به این دسته در اینجا قرار میگیرد  توضیحات مربوط به این دسته در اینجا قرار میگیرد', 'dsth-digr', 'dsth-digr', NULL, '5db1bdda611e8.jpg', 1, 0, '2019-10-20 16:39:15', '2019-10-24 11:36:03'),
(10, 'دسته با تصویر', 'توضیحات توضیحات توضیحات   توضیحات توضیحات توضیحات  توضیحات توضیحات توضیحات\n  توضیحات توضیحات توضیحات  توضیحات توضیحات توضیحات  توضیحات توضیحات توضیحات\n  توضیحات توضیحات توضیحات  توضیحات توضیحات توضیحات  توضیحات توضیحات توضیحات  توضیحات توضیحات توضیحات', 'dsth-ba-tsoir', 'dsth-ba-tsoir', NULL, '5db1bd17a8688.jpg', 1, 0, '2019-10-24 11:33:03', '2019-10-24 11:33:03'),
(11, 'عنوان', 'توضیحاتتوضیحات', 'aanoan', 'aanoan', NULL, '5db5e3528d1d0.jpg', 1, 0, '2019-10-27 18:35:01', '2019-10-27 18:35:01');

-- --------------------------------------------------------

--
-- Table structure for table `channele_publish_confirms`
--

DROP TABLE IF EXISTS `channele_publish_confirms`;
CREATE TABLE IF NOT EXISTS `channele_publish_confirms` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `channel_id` bigint(20) UNSIGNED NOT NULL,
  `request_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channele_publish_confirms_channel_id_unique` (`channel_id`),
  UNIQUE KEY `channele_publish_confirms_request_id_unique` (`request_id`),
  KEY `channele_publish_confirms_admin_id_foreign` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channele_publish_confirms`
--

INSERT INTO `channele_publish_confirms` (`id`, `channel_id`, `request_id`, `admin_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 1, '2019-11-21 11:19:05', '2019-11-21 11:19:05'),
(2, 5, 3, 1, '2019-11-21 11:35:10', '2019-11-21 11:35:10'),
(3, 6, 4, 1, '2019-11-27 16:58:12', '2019-11-27 16:58:12');

-- --------------------------------------------------------

--
-- Table structure for table `channele_publish_requests`
--

DROP TABLE IF EXISTS `channele_publish_requests`;
CREATE TABLE IF NOT EXISTS `channele_publish_requests` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `channel_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `confirm` tinyint(1) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `answer_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channele_publish_requests_channel_id_foreign` (`channel_id`),
  KEY `channele_publish_requests_admin_id_foreign` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channele_publish_requests`
--

INSERT INTO `channele_publish_requests` (`id`, `channel_id`, `admin_id`, `confirm`, `text`, `answer_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 1, NULL, '2019-11-21 11:19:05', NULL, '2019-11-21 11:01:50', '2019-11-21 11:19:05'),
(3, 5, 1, 1, NULL, '2019-11-21 11:35:10', NULL, '2019-11-21 11:33:23', '2019-11-21 11:35:10'),
(4, 6, 1, 1, NULL, '2019-11-27 16:58:12', NULL, '2019-11-27 16:57:48', '2019-11-27 16:58:12'),
(5, 8, NULL, 0, NULL, NULL, NULL, '2019-12-08 12:07:26', '2019-12-08 12:07:26');

-- --------------------------------------------------------

--
-- Table structure for table `channele_sub_prices`
--

DROP TABLE IF EXISTS `channele_sub_prices`;
CREATE TABLE IF NOT EXISTS `channele_sub_prices` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `channel_id` bigint(20) UNSIGNED NOT NULL,
  `monthly` int(11) NOT NULL,
  `halfyear` int(11) NOT NULL,
  `yearly` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channele_sub_prices_channel_id_foreign` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channele_sub_prices`
--

INSERT INTO `channele_sub_prices` (`id`, `channel_id`, `monthly`, `halfyear`, `yearly`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 5, 1000, 5000, 10000, '2019-11-21 11:45:05', '2019-11-21 11:33:23', '2019-11-21 11:45:05'),
(3, 5, 1000, 5000, 10000, '2019-11-21 11:45:19', '2019-11-21 11:45:05', '2019-11-21 11:45:19'),
(4, 5, 1000, 5000, 10000, '2019-11-21 11:45:27', '2019-11-21 11:45:19', '2019-11-21 11:45:27'),
(5, 5, 2000, 6000, 11000, NULL, '2019-11-21 11:45:27', '2019-11-21 11:45:27'),
(6, 6, 1000, 2000, 3000, NULL, '2019-11-27 16:57:48', '2019-11-27 16:57:48'),
(7, 8, 444, 44, 44, NULL, '2019-12-08 12:07:26', '2019-12-08 12:07:26');

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
CREATE TABLE IF NOT EXISTS `channels` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('public','educational') COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_upload_id` int(11) NOT NULL,
  `video_upload_id` int(11) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stat_views` int(11) NOT NULL,
  `stat_posts` int(11) NOT NULL,
  `stat_followers` int(11) NOT NULL,
  `stat_sold` int(11) NOT NULL,
  `stat_likes` int(11) NOT NULL,
  `stat_rate_count` int(11) NOT NULL,
  `stat_rate_total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `last_post_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channels_user_id_unique` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channels`
--

INSERT INTO `channels` (`id`, `user_id`, `type`, `title`, `slug`, `url`, `image`, `video`, `image_upload_id`, `video_upload_id`, `text`, `stat_views`, `stat_posts`, `stat_followers`, `stat_sold`, `stat_likes`, `stat_rate_count`, `stat_rate_total`, `created_at`, `updated_at`, `deleted_at`, `last_post_at`) VALUES
(1, 1, 'educational', 'کانال آموزشی یک', 'kanal-aamozshi-ik', NULL, '5dd66c4ec8e10.png', '5dd66c56e9598.mp4', 411, 412, 'توضیحاتتوضیحات', 0, 0, 0, 0, 0, 0, 0, '2019-11-21 10:53:29', '2019-11-21 11:01:19', '2019-11-21 11:01:19', NULL),
(2, 1, 'educational', 'کانال 2 با اسلاگ', 'kanal-2-ba-aslag', 'دسته یک/زیر دسته 1/kanal-2-ba-aslag', '5dd66cdba76e8.png', '5dd66ceac2880.mp4', 413, 414, 'توضیحاتتوضیحات', 0, 0, 0, 0, 0, 0, 0, '2019-11-21 10:54:38', '2019-11-21 11:01:21', '2019-11-21 11:01:21', NULL),
(3, 1, 'educational', 'کانال با پابلیش', 'kanal-ba-pablish', 'دسته یک/زیر دسته 1/kanal-ba-pablish', '5dd66e9917250.png', '5dd66e9b40a60.mp4', 415, 416, 'توضیحاتتوضیحاتتوضیحات', 0, 0, 0, 0, 0, 0, 0, '2019-11-21 11:01:50', '2019-11-21 11:01:50', NULL, NULL),
(5, 1, 'educational', 'کانال با مبلغ', 'kanal-ba-mblgh', 'دسته یک/زیر دسته 1/kanal-ba-mblgh', '5dd675db44cc8.jpg', '5dd675e04fc90.mp4', 417, 418, 'توضیحات', 0, 2, 1, 6000, 0, 1, 4, '2019-11-21 11:33:23', '2019-11-21 11:33:23', NULL, '2019-11-21 13:05:27'),
(6, 1, 'educational', 'منیج جدید', 'mnij-jdid', 'دسته یک/زیر دسته 1/mnij-jdid', '5ddeaafd75d28.png', '5ddeab03d9eb8.mp4', 465, 466, 'توضیحات', 0, 7, 1, 2000, 0, 0, 0, '2019-11-27 16:57:48', '2019-11-27 16:57:48', NULL, '2019-11-27 17:35:30'),
(7, 1, 'public', 'عمومی', 'aamomi', NULL, '5ddeb46b1f658.jpg', NULL, 482, 0, 'توضیحات', 0, 1, 0, 0, 0, 0, 0, '2019-11-27 17:37:50', '2019-11-27 17:37:50', NULL, '2019-11-27 17:41:13'),
(8, 1, 'educational', 'gg', 'gg', 'دسته یک/زیر دسته 1/gg', '5dece7743c8c0.jpg', NULL, 484, 0, 'gg', 0, 0, 0, 0, 0, 0, 0, '2019-12-08 12:07:26', '2019-12-08 12:07:26', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `channel_categories`
--

DROP TABLE IF EXISTS `channel_categories`;
CREATE TABLE IF NOT EXISTS `channel_categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `channel_id` bigint(20) UNSIGNED NOT NULL,
  `master` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channel_categories_category_id_foreign` (`category_id`),
  KEY `channel_categories_channel_id_foreign` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channel_categories`
--

INSERT INTO `channel_categories` (`id`, `category_id`, `channel_id`, `master`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 1, '2019-11-21 10:53:29', '2019-11-21 10:53:29'),
(2, 7, 1, 0, '2019-11-21 10:53:29', '2019-11-21 10:53:29'),
(3, 6, 2, 1, '2019-11-21 10:54:38', '2019-11-21 10:54:38'),
(4, 7, 2, 0, '2019-11-21 10:54:38', '2019-11-21 10:54:38'),
(5, 6, 3, 1, '2019-11-21 11:01:50', '2019-11-21 11:01:50'),
(6, 7, 3, 0, '2019-11-21 11:01:50', '2019-11-21 11:01:50'),
(9, 6, 5, 1, '2019-11-21 11:33:23', '2019-11-21 11:33:23'),
(10, 7, 5, 0, '2019-11-21 11:33:23', '2019-11-21 11:33:23'),
(11, 6, 6, 1, '2019-11-27 16:57:48', '2019-11-27 16:57:48'),
(12, 7, 6, 0, '2019-11-27 16:57:48', '2019-11-27 16:57:48'),
(13, 6, 8, 1, '2019-12-08 12:07:26', '2019-12-08 12:07:26'),
(14, 7, 8, 0, '2019-12-08 12:07:26', '2019-12-08 12:07:26');

-- --------------------------------------------------------

--
-- Table structure for table `channel_educationals`
--

DROP TABLE IF EXISTS `channel_educationals`;
CREATE TABLE IF NOT EXISTS `channel_educationals` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `channel_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channel_educationals_user_id_foreign` (`user_id`),
  KEY `channel_educationals_channel_id_foreign` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channel_educationals`
--

INSERT INTO `channel_educationals` (`id`, `user_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2019-11-21 10:53:29', '2019-11-21 10:53:29'),
(2, 1, 2, '2019-11-21 10:54:38', '2019-11-21 10:54:38'),
(3, 1, 3, '2019-11-21 11:01:50', '2019-11-21 11:01:50'),
(4, 1, 5, '2019-11-21 11:33:23', '2019-11-21 11:33:23'),
(5, 1, 6, '2019-11-27 16:57:48', '2019-11-27 16:57:48'),
(6, 1, 8, '2019-12-08 12:07:26', '2019-12-08 12:07:26');

-- --------------------------------------------------------

--
-- Table structure for table `channel_followers`
--

DROP TABLE IF EXISTS `channel_followers`;
CREATE TABLE IF NOT EXISTS `channel_followers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `channel_id` bigint(20) UNSIGNED DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transaction_channel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_followers_channel_id_user_id_unique` (`channel_id`,`user_id`),
  KEY `channel_followers_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channel_followers`
--

INSERT INTO `channel_followers` (`id`, `user_id`, `channel_id`, `exp_date`, `created_at`, `updated_at`, `transaction_channel_id`) VALUES
(1, 1, 5, '2020-05-19', '2019-11-21 12:40:35', '2019-11-21 12:40:35', 3),
(2, 1, 6, '2020-06-06', '2019-12-09 16:59:27', '2019-12-09 16:59:27', 1);

--
-- Triggers `channel_followers`
--
DROP TRIGGER IF EXISTS `delete_channel_followers`;
DELIMITER $$
CREATE TRIGGER `delete_channel_followers` AFTER DELETE ON `channel_followers` FOR EACH ROW BEGIN
                UPDATE channels SET stat_followers = stat_followers - 1 WHERE id = OLD.channel_id ; 
            END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_channel_followers`;
DELIMITER $$
CREATE TRIGGER `insert_channel_followers` AFTER INSERT ON `channel_followers` FOR EACH ROW BEGIN
                UPDATE channels SET stat_followers = stat_followers + 1 WHERE id = NEW.channel_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `channel_posts`
--

DROP TABLE IF EXISTS `channel_posts`;
CREATE TABLE IF NOT EXISTS `channel_posts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `channel_id` int(11) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `type` enum('image','video','text') COLLATE utf8mb4_unicode_ci NOT NULL,
  `stat_views` int(11) NOT NULL,
  `stat_comments` int(11) NOT NULL,
  `stat_likes` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channel_posts_user_id_unique` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channel_posts`
--

INSERT INTO `channel_posts` (`id`, `user_id`, `channel_id`, `text`, `type`, `stat_views`, `stat_comments`, `stat_likes`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 'توضیحاتتوضیحات', 'image', 2, 0, 0, '2019-11-21 13:05:14', '2019-11-21 13:08:25'),
(2, 1, 5, 'توضیحاتتوضیحاتتوضیحات', 'image', 1, 0, 0, '2019-11-21 13:05:27', '2019-11-21 13:05:42'),
(3, 1, 6, 'ddd', 'image', 0, 0, 0, '2019-11-27 17:20:00', '2019-11-27 17:20:00'),
(4, 1, 6, 'fff', 'video', 0, 0, 0, '2019-11-27 17:22:39', '2019-11-27 17:22:39'),
(5, 1, 6, NULL, 'image', 0, 0, 0, '2019-11-27 17:25:25', '2019-11-27 17:25:25'),
(6, 1, 6, 'sdffd', 'text', 0, 0, 0, '2019-11-27 17:28:58', '2019-11-27 17:28:58'),
(7, 1, 6, NULL, 'image', 0, 0, 0, '2019-11-27 17:34:17', '2019-11-27 17:34:17'),
(8, 1, 6, NULL, 'image', 0, 0, 0, '2019-11-27 17:34:24', '2019-11-27 17:34:24'),
(9, 1, 6, 'سلام من به یه نتیجه ای رسیدم \nکه این نتیجه رو بعدا اعلام میکنم', 'text', 0, 0, 0, '2019-11-27 17:35:30', '2019-11-27 17:35:30'),
(10, 1, 7, 'کانال عمومی', 'image', 0, 0, 0, '2019-11-27 17:41:13', '2019-11-27 17:41:13');

--
-- Triggers `channel_posts`
--
DROP TRIGGER IF EXISTS `delete_channel_posts`;
DELIMITER $$
CREATE TRIGGER `delete_channel_posts` AFTER DELETE ON `channel_posts` FOR EACH ROW BEGIN
                UPDATE channels SET stat_posts = stat_posts - 1  WHERE id  = OLD.channel_id ; 
            END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_channel_posts`;
DELIMITER $$
CREATE TRIGGER `insert_channel_posts` AFTER INSERT ON `channel_posts` FOR EACH ROW BEGIN
                UPDATE channels SET stat_posts = stat_posts + 1 , last_post_at = NOW()  WHERE id  = NEW.channel_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `channel_post_comments`
--

DROP TABLE IF EXISTS `channel_post_comments`;
CREATE TABLE IF NOT EXISTS `channel_post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channel_post_comments_post_id_foreign` (`post_id`),
  KEY `channel_post_comments_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `channel_post_comments`
--
DROP TRIGGER IF EXISTS `delete_channel_post_comments`;
DELIMITER $$
CREATE TRIGGER `delete_channel_post_comments` AFTER DELETE ON `channel_post_comments` FOR EACH ROW BEGIN
                UPDATE channel_posts SET stat_comments = stat_comments - 1 WHERE id = OLD.post_id ; 
            END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_channel_post_comments`;
DELIMITER $$
CREATE TRIGGER `insert_channel_post_comments` AFTER INSERT ON `channel_post_comments` FOR EACH ROW BEGIN
                UPDATE channel_posts SET stat_comments = stat_comments + 1 WHERE id = NEW.post_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `channel_post_images`
--

DROP TABLE IF EXISTS `channel_post_images`;
CREATE TABLE IF NOT EXISTS `channel_post_images` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `upload_id` bigint(20) UNSIGNED NOT NULL,
  `image` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_post_images_post_id_unique` (`post_id`),
  UNIQUE KEY `channel_post_images_upload_id_unique` (`upload_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channel_post_images`
--

INSERT INTO `channel_post_images` (`id`, `post_id`, `upload_id`, `image`, `original_name`, `created_at`, `updated_at`) VALUES
(1, 1, 419, '5dd68b894ecf0.jpg', 'attach-5ccca5941ae78.jpg', '2019-11-21 13:05:14', '2019-11-21 13:05:14'),
(2, 2, 420, '5dd68b94a0988.jpg', 'IMG_20170914_000727 - Copy (2) - Copy.jpg', '2019-11-21 13:05:27', '2019-11-21 13:05:27'),
(3, 3, 475, '5ddeb03fdb240.jpg', '5d513d0bbb86c---------------------PDO------PHP.jpg', '2019-11-27 17:20:00', '2019-11-27 17:20:00'),
(4, 5, 479, '5ddeb166359d0.jpg', '5c065ec36972e-amozesh-composer.jpg', '2019-11-27 17:25:25', '2019-11-27 17:25:25'),
(5, 7, 480, '5ddeb397c3758.jpg', 'heydari1.jpg', '2019-11-27 17:34:17', '2019-11-27 17:34:17'),
(6, 8, 481, '5ddeb39f45ba0.jpg', 'heydari3.jpg', '2019-11-27 17:34:24', '2019-11-27 17:34:24'),
(7, 10, 483, '5ddeb538afed8.jpg', '5c065ec36972e-amozesh-composer.jpg', '2019-11-27 17:41:13', '2019-11-27 17:41:13');

-- --------------------------------------------------------

--
-- Table structure for table `channel_post_likes`
--

DROP TABLE IF EXISTS `channel_post_likes`;
CREATE TABLE IF NOT EXISTS `channel_post_likes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_post_likes_user_id_post_id_unique` (`user_id`,`post_id`),
  KEY `channel_post_likes_post_id_foreign` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `channel_post_likes`
--
DROP TRIGGER IF EXISTS `delete_channel_post_likes`;
DELIMITER $$
CREATE TRIGGER `delete_channel_post_likes` AFTER DELETE ON `channel_post_likes` FOR EACH ROW BEGIN
                UPDATE channel_posts SET stat_likes = stat_likes - 1 WHERE id = OLD.post_id ; 
            END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_channel_post_likes`;
DELIMITER $$
CREATE TRIGGER `insert_channel_post_likes` AFTER INSERT ON `channel_post_likes` FOR EACH ROW BEGIN
                UPDATE channel_posts SET stat_likes = stat_likes + 1 WHERE id = NEW.post_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `channel_post_videos`
--

DROP TABLE IF EXISTS `channel_post_videos`;
CREATE TABLE IF NOT EXISTS `channel_post_videos` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `upload_id` bigint(20) UNSIGNED NOT NULL,
  `video` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_post_videos_post_id_unique` (`post_id`),
  UNIQUE KEY `channel_post_videos_upload_id_unique` (`upload_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channel_post_videos`
--

INSERT INTO `channel_post_videos` (`id`, `post_id`, `upload_id`, `video`, `original_name`, `created_at`, `updated_at`) VALUES
(1, 4, 478, '5ddeb0d92f440.mp4', 'htaccess.mp4', '2019-11-27 17:22:39', '2019-11-27 17:22:39');

-- --------------------------------------------------------

--
-- Table structure for table `channel_publics`
--

DROP TABLE IF EXISTS `channel_publics`;
CREATE TABLE IF NOT EXISTS `channel_publics` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `channel_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_publics_user_id_unique` (`user_id`),
  KEY `channel_publics_channel_id_foreign` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channel_publics`
--

INSERT INTO `channel_publics` (`id`, `user_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(1, 1, 7, '2019-11-27 17:37:50', '2019-11-27 17:37:50');

-- --------------------------------------------------------

--
-- Table structure for table `channel_ratings`
--

DROP TABLE IF EXISTS `channel_ratings`;
CREATE TABLE IF NOT EXISTS `channel_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `channel_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `follower_id` bigint(20) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_ratings_channel_id_user_id_unique` (`channel_id`,`user_id`),
  KEY `channel_ratings_user_id_foreign` (`user_id`),
  KEY `channel_ratings_follower_id_foreign` (`follower_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channel_ratings`
--

INSERT INTO `channel_ratings` (`id`, `channel_id`, `user_id`, `follower_id`, `text`, `rate`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 1, 'خیلی خوب بود', 4, '2019-11-21 12:51:26', '2019-11-21 12:51:26');

--
-- Triggers `channel_ratings`
--
DROP TRIGGER IF EXISTS `delete_channel_ratings`;
DELIMITER $$
CREATE TRIGGER `delete_channel_ratings` BEFORE DELETE ON `channel_ratings` FOR EACH ROW BEGIN
                
                UPDATE channels SET stat_rate_count = stat_rate_count - 1 , stat_rate_total = stat_rate_total - OLD.rate  WHERE id = OLD.channel_id ; 

            END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_channel_ratings`;
DELIMITER $$
CREATE TRIGGER `insert_channel_ratings` AFTER INSERT ON `channel_ratings` FOR EACH ROW BEGIN
                
                UPDATE channels SET stat_rate_count = stat_rate_count + 1 , stat_rate_total = stat_rate_total + NEW.rate  WHERE id = NEW.channel_id ; 

            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `consultants`
--

DROP TABLE IF EXISTS `consultants`;
CREATE TABLE IF NOT EXISTS `consultants` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_upload_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `jest` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `stat_students` int(11) NOT NULL,
  `stat_views` int(11) NOT NULL,
  `stat_sold` int(11) NOT NULL,
  `stat_rate_count` int(11) NOT NULL,
  `stat_rate_total` int(11) NOT NULL,
  `stat_likes` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `consultants_image_upload_id_unique` (`image_upload_id`),
  KEY `consultants_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consultants`
--

INSERT INTO `consultants` (`id`, `user_id`, `title`, `slug`, `url`, `image_upload_id`, `image`, `price`, `jest`, `text`, `stat_students`, `stat_views`, `stat_sold`, `stat_rate_count`, `stat_rate_total`, `stat_likes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'تست اررور', 'tst-arror', 'دسته یک/زیر دسته 1/tst-arror', 441, '5dd8e85636718.jpg', 1000, 'توضیحات کوتاه', 'توضیحات کامل', 3, 12, 12000, 0, 0, 0, '2019-11-23 08:06:23', '2019-11-23 08:06:23', NULL),
(3, 1, 'تست بخش دار', 'tst-bkhsh-dar', 'دسته یک/زیر دسته 1/tst-bkhsh-dar', 447, '5ddaa94110fe0.jpg', 1000, 'توضیحات کوتاه', 'توضیحات کامل', 0, 0, 0, 0, 0, 0, '2019-11-24 15:20:05', '2019-11-24 16:08:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `consultant_categories`
--

DROP TABLE IF EXISTS `consultant_categories`;
CREATE TABLE IF NOT EXISTS `consultant_categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `consultant_id` bigint(20) UNSIGNED NOT NULL,
  `master` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consultant_categories_category_id_foreign` (`category_id`),
  KEY `consultant_categories_consultant_id_foreign` (`consultant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consultant_categories`
--

INSERT INTO `consultant_categories` (`id`, `category_id`, `consultant_id`, `master`, `created_at`, `updated_at`) VALUES
(3, 6, 2, 1, '2019-11-05 23:10:33', '2019-11-05 23:10:33'),
(4, 7, 2, 0, '2019-11-05 23:10:33', '2019-11-05 23:10:33'),
(7, 6, 4, 1, '2019-11-11 01:28:14', '2019-11-11 01:28:14'),
(8, 7, 4, 0, '2019-11-11 01:28:14', '2019-11-11 01:28:14'),
(9, 6, 5, 1, '2019-11-11 23:00:30', '2019-11-11 23:00:30'),
(10, 7, 5, 0, '2019-11-11 23:00:30', '2019-11-11 23:00:30'),
(11, 6, 6, 1, '2019-11-13 02:06:52', '2019-11-13 02:06:52'),
(12, 7, 6, 0, '2019-11-13 02:06:52', '2019-11-13 02:06:52'),
(13, 6, 7, 1, '2019-11-13 02:16:27', '2019-11-13 02:16:27'),
(14, 7, 7, 0, '2019-11-13 02:16:27', '2019-11-13 02:16:27'),
(15, 6, 8, 1, '2019-11-13 03:12:28', '2019-11-13 03:12:28'),
(16, 7, 8, 0, '2019-11-13 03:12:28', '2019-11-13 03:12:28'),
(17, 6, 9, 1, '2019-11-13 04:18:10', '2019-11-13 04:18:10'),
(18, 7, 9, 0, '2019-11-13 04:18:10', '2019-11-13 04:18:10'),
(19, 6, 10, 1, '2019-11-14 00:47:53', '2019-11-14 00:47:53'),
(20, 7, 10, 0, '2019-11-14 00:47:53', '2019-11-14 00:47:53'),
(21, 6, 1, 1, '2019-11-23 08:06:23', '2019-11-23 08:06:23'),
(22, 7, 1, 0, '2019-11-23 08:06:23', '2019-11-23 08:06:23'),
(31, 6, 3, 1, '2019-11-24 16:08:32', '2019-11-24 16:08:32'),
(32, 7, 3, 0, '2019-11-24 16:08:32', '2019-11-24 16:08:32');

-- --------------------------------------------------------

--
-- Table structure for table `consultant_contacts`
--

DROP TABLE IF EXISTS `consultant_contacts`;
CREATE TABLE IF NOT EXISTS `consultant_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `consultant_id` bigint(20) UNSIGNED NOT NULL,
  `method` enum('online','inperson','phone') COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `consultant_contacts_consultant_id_method_unique` (`consultant_id`,`method`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consultant_contacts`
--

INSERT INTO `consultant_contacts` (`id`, `consultant_id`, `method`, `contact`, `created_at`, `updated_at`) VALUES
(13, 10, 'inperson', 'آدرس منزل ما', '2019-11-14 01:08:42', '2019-11-14 01:08:42'),
(14, 10, 'online', '@max', '2019-11-14 01:08:42', '2019-11-14 01:08:42'),
(15, 1, 'inperson', 'آدرس من', '2019-11-23 08:06:23', '2019-11-23 08:06:23'),
(16, 1, 'online', 'm@m.com', '2019-11-23 08:06:23', '2019-11-23 08:06:23'),
(18, 3, 'inperson', 'آدرس مراجعه', '2019-11-24 15:38:47', '2019-11-24 15:38:47'),
(19, 3, 'phone', '06132219899', '2019-11-24 15:38:47', '2019-11-24 15:38:47');

-- --------------------------------------------------------

--
-- Table structure for table `consultant_dates`
--

DROP TABLE IF EXISTS `consultant_dates`;
CREATE TABLE IF NOT EXISTS `consultant_dates` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `consultant_id` bigint(20) UNSIGNED NOT NULL,
  `day` tinyint(4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `type` enum('date','day') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consultant_dates_consultant_id_day_unique` (`consultant_id`,`day`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consultant_dates`
--

INSERT INTO `consultant_dates` (`id`, `consultant_id`, `day`, `date`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, NULL, 'date', '2019-11-05 23:10:33', '2019-11-05 23:10:33', NULL),
(10, 3, 1, NULL, 'date', '2019-11-05 23:35:19', '2019-11-24 15:47:27', '2019-11-24 15:47:27'),
(11, 3, 2, NULL, 'date', '2019-11-05 23:35:19', '2019-11-24 15:47:27', '2019-11-24 15:47:27'),
(14, 4, 2, NULL, 'date', '2019-11-11 01:53:29', '2019-11-11 01:53:29', NULL),
(15, 5, 1, NULL, 'date', '2019-11-11 23:00:30', '2019-11-11 23:00:30', NULL),
(21, 6, 1, NULL, 'day', '2019-11-13 02:13:25', '2019-11-13 02:13:25', NULL),
(22, 6, 2, NULL, 'day', '2019-11-13 02:13:25', '2019-11-13 02:13:25', NULL),
(23, 6, NULL, '2019-11-21', 'date', '2019-11-13 02:13:25', '2019-11-13 02:13:25', NULL),
(25, 7, NULL, '2019-11-20', 'date', '2019-11-13 02:17:17', '2019-11-13 02:17:17', NULL),
(26, 8, 0, NULL, 'day', '2019-11-13 03:12:28', '2019-11-13 03:12:28', NULL),
(27, 8, 1, NULL, 'day', '2019-11-13 03:12:28', '2019-11-13 03:12:28', NULL),
(28, 8, 6, NULL, 'day', '2019-11-13 03:12:28', '2019-11-13 03:12:28', NULL),
(29, 9, 0, NULL, 'day', '2019-11-13 04:18:10', '2019-11-13 04:18:10', NULL),
(30, 9, 1, NULL, 'day', '2019-11-13 04:18:10', '2019-11-13 04:18:10', NULL),
(31, 9, 6, NULL, 'day', '2019-11-13 04:18:10', '2019-11-13 04:18:10', NULL),
(32, 9, NULL, '2019-11-21', 'date', '2019-11-13 04:18:10', '2019-11-13 04:18:10', NULL),
(33, 10, 6, NULL, 'day', '2019-11-14 00:47:53', '2019-11-14 01:08:20', '2019-11-14 01:08:20'),
(34, 10, NULL, '2019-11-21', 'date', '2019-11-14 00:47:53', '2019-11-14 01:08:20', '2019-11-14 01:08:20'),
(37, 10, 6, NULL, 'day', '2019-11-14 01:08:20', '2019-11-14 01:08:42', '2019-11-14 01:08:42'),
(38, 10, NULL, '2019-11-21', 'date', '2019-11-14 01:08:20', '2019-11-14 01:08:42', '2019-11-14 01:08:42'),
(39, 10, 6, NULL, 'day', '2019-11-14 01:08:42', '2019-11-14 01:08:42', NULL),
(40, 10, NULL, '2019-11-21', 'date', '2019-11-14 01:08:42', '2019-11-14 01:08:42', NULL),
(41, 1, 6, NULL, 'day', '2019-11-23 08:06:23', '2019-11-23 08:06:23', NULL),
(42, 3, 6, NULL, 'day', '2019-11-24 15:47:27', '2019-11-24 15:47:47', '2019-11-24 15:47:47'),
(43, 3, 6, NULL, 'day', '2019-11-24 15:47:47', '2019-11-24 15:47:47', NULL),
(44, 3, NULL, '2019-12-21', 'date', '2019-11-24 15:47:47', '2019-11-24 15:47:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `consultant_plans`
--

DROP TABLE IF EXISTS `consultant_plans`;
CREATE TABLE IF NOT EXISTS `consultant_plans` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `consultant_id` bigint(20) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `original_price` int(11) DEFAULT NULL,
  `type` enum('normal','off') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consultant_plans_consultant_id_foreign` (`consultant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consultant_plans`
--

INSERT INTO `consultant_plans` (`id`, `consultant_id`, `price`, `original_price`, `type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 2000, NULL, 'normal', '2019-12-08 12:58:28', '2019-12-08 12:58:22', '2019-12-08 12:58:28'),
(2, 1, 2000, 5000, 'off', '2019-12-09 16:55:33', '2019-12-08 12:58:28', '2019-12-09 16:55:33'),
(3, 1, 10000, NULL, 'normal', NULL, '2019-12-09 16:55:33', '2019-12-09 16:55:33');

-- --------------------------------------------------------

--
-- Table structure for table `consultant_plan_organs`
--

DROP TABLE IF EXISTS `consultant_plan_organs`;
CREATE TABLE IF NOT EXISTS `consultant_plan_organs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `consultant_id` bigint(20) UNSIGNED NOT NULL,
  `r10` int(11) NOT NULL,
  `r30` int(11) NOT NULL,
  `r50` int(11) NOT NULL,
  `r100` int(11) NOT NULL,
  `r200` int(11) NOT NULL,
  `r300` int(11) NOT NULL,
  `r400` int(11) NOT NULL,
  `r500` int(11) NOT NULL,
  `r700` int(11) NOT NULL,
  `r1000` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `consultant_plan_organs_consultant_id_unique` (`consultant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consultant_plan_organs`
--

INSERT INTO `consultant_plan_organs` (`id`, `consultant_id`, `r10`, `r30`, `r50`, `r100`, `r200`, `r300`, `r400`, `r500`, `r700`, `r1000`, `created_at`, `updated_at`) VALUES
(1, 1, 800000, 800000, 800000, 800000, 800000, 800000, 800000, 800000, 800000, 800000, '2019-12-08 13:00:27', '2019-12-08 13:00:27');

-- --------------------------------------------------------

--
-- Table structure for table `consultant_publish_confirms`
--

DROP TABLE IF EXISTS `consultant_publish_confirms`;
CREATE TABLE IF NOT EXISTS `consultant_publish_confirms` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `consultant_id` bigint(20) UNSIGNED NOT NULL,
  `request_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `consultant_publish_confirms_consultant_id_unique` (`consultant_id`),
  UNIQUE KEY `consultant_publish_confirms_request_id_unique` (`request_id`),
  KEY `consultant_publish_confirms_admin_id_foreign` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consultant_publish_confirms`
--

INSERT INTO `consultant_publish_confirms` (`id`, `consultant_id`, `request_id`, `admin_id`, `created_at`, `updated_at`) VALUES
(2, 4, 3, 1, '2019-11-11 01:53:37', '2019-11-11 01:53:37'),
(3, 5, 4, 1, '2019-11-11 23:04:14', '2019-11-11 23:04:14'),
(4, 7, 9, 1, '2019-11-13 02:18:36', '2019-11-13 02:18:36'),
(5, 6, 7, 1, '2019-11-13 02:34:03', '2019-11-13 02:34:03'),
(6, 8, 10, 1, '2019-11-13 03:14:16', '2019-11-13 03:14:16'),
(7, 9, 11, 1, '2019-11-13 04:18:38', '2019-11-13 04:18:38'),
(8, 10, 14, 1, '2019-11-14 01:12:46', '2019-11-14 01:12:46'),
(9, 1, 15, 1, '2019-11-23 08:06:49', '2019-11-23 08:06:49');

-- --------------------------------------------------------

--
-- Table structure for table `consultant_publish_requests`
--

DROP TABLE IF EXISTS `consultant_publish_requests`;
CREATE TABLE IF NOT EXISTS `consultant_publish_requests` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `consultant_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `confirm` tinyint(1) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `answer_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consultant_publish_requests_consultant_id_foreign` (`consultant_id`),
  KEY `consultant_publish_requests_admin_id_foreign` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consultant_publish_requests`
--

INSERT INTO `consultant_publish_requests` (`id`, `consultant_id`, `admin_id`, `confirm`, `text`, `answer_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 2, NULL, '2019-11-11 01:49:54', NULL, '2019-11-11 01:28:14', '2019-11-11 01:49:54'),
(2, 4, 1, 1, 'توضیحاتتوضیحاتتوضیحات', '2019-11-11 01:53:15', NULL, '2019-11-11 01:53:05', '2019-11-11 01:53:15'),
(3, 4, 1, 1, NULL, '2019-11-11 01:53:37', NULL, '2019-11-11 01:53:29', '2019-11-11 01:53:37'),
(4, 5, 1, 1, NULL, '2019-11-11 23:04:14', NULL, '2019-11-11 23:00:30', '2019-11-11 23:04:14'),
(5, 6, NULL, 0, NULL, NULL, '2019-11-13 02:12:03', '2019-11-13 02:06:52', '2019-11-13 02:12:03'),
(6, 6, NULL, 0, NULL, NULL, '2019-11-13 02:13:25', '2019-11-13 02:12:03', '2019-11-13 02:13:25'),
(7, 6, 1, 1, NULL, '2019-11-13 02:34:03', NULL, '2019-11-13 02:13:25', '2019-11-13 02:34:03'),
(8, 7, NULL, 0, NULL, NULL, '2019-11-13 02:17:17', '2019-11-13 02:16:27', '2019-11-13 02:17:17'),
(9, 7, 1, 1, NULL, '2019-11-13 02:18:36', NULL, '2019-11-13 02:17:17', '2019-11-13 02:18:36'),
(10, 8, 1, 1, NULL, '2019-11-13 03:14:16', NULL, '2019-11-13 03:12:28', '2019-11-13 03:14:16'),
(11, 9, 1, 1, NULL, '2019-11-13 04:18:38', NULL, '2019-11-13 04:18:10', '2019-11-13 04:18:38'),
(12, 10, NULL, 0, NULL, NULL, '2019-11-14 01:08:20', '2019-11-14 00:47:53', '2019-11-14 01:08:20'),
(13, 10, NULL, 0, NULL, NULL, '2019-11-14 01:08:42', '2019-11-14 01:08:20', '2019-11-14 01:08:42'),
(14, 10, 1, 1, NULL, '2019-11-14 01:12:46', NULL, '2019-11-14 01:08:42', '2019-11-14 01:12:46'),
(15, 1, 1, 1, NULL, '2019-11-23 08:06:49', NULL, '2019-11-23 08:06:23', '2019-11-23 08:06:49'),
(16, 3, NULL, 0, NULL, NULL, '2019-11-24 16:02:02', '2019-11-24 16:01:06', '2019-11-24 16:02:02'),
(17, 3, 1, 2, NULL, '2019-11-24 16:03:42', NULL, '2019-11-24 16:02:02', '2019-11-24 16:03:42'),
(18, 3, 1, 2, NULL, '2019-11-24 16:06:39', NULL, '2019-11-24 16:06:27', '2019-11-24 16:06:39'),
(19, 3, NULL, 0, NULL, NULL, NULL, '2019-11-24 16:08:32', '2019-11-24 16:08:32');

-- --------------------------------------------------------

--
-- Table structure for table `consultant_ratings`
--

DROP TABLE IF EXISTS `consultant_ratings`;
CREATE TABLE IF NOT EXISTS `consultant_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `consultant_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_consultant_id` bigint(20) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `consultant_ratings_consultant_id_user_id_unique` (`consultant_id`,`user_id`),
  KEY `consultant_ratings_user_id_foreign` (`user_id`),
  KEY `consultant_ratings_user_consultant_id_foreign` (`user_consultant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consultant_ratings`
--

INSERT INTO `consultant_ratings` (`id`, `consultant_id`, `user_id`, `user_consultant_id`, `text`, `rate`, `created_at`, `updated_at`) VALUES
(2, 5, 1, 4, 'سلام به نظر من که دوره خیلی خوبی بود', 4, '2019-11-12 01:22:57', '2019-11-12 01:22:57'),
(3, 10, 1, 19, 'بازخورد شما', 3, '2019-11-21 09:02:22', '2019-11-21 09:02:22');

--
-- Triggers `consultant_ratings`
--
DROP TRIGGER IF EXISTS `delete_consultant_ratings`;
DELIMITER $$
CREATE TRIGGER `delete_consultant_ratings` BEFORE DELETE ON `consultant_ratings` FOR EACH ROW BEGIN
                
                UPDATE consultants SET stat_rate_count = stat_rate_count - 1 , stat_rate_total = stat_rate_total - OLD.rate  WHERE id = OLD.consultant_id ; 

            END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_consultants_ratings`;
DELIMITER $$
CREATE TRIGGER `insert_consultants_ratings` AFTER INSERT ON `consultant_ratings` FOR EACH ROW BEGIN
                
                UPDATE consultants SET stat_rate_count = stat_rate_count + 1 , stat_rate_total = stat_rate_total + NEW.rate  WHERE id = NEW.consultant_id ; 

            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `consultant_times`
--

DROP TABLE IF EXISTS `consultant_times`;
CREATE TABLE IF NOT EXISTS `consultant_times` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `consultant_date_id` bigint(20) UNSIGNED NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consultant_times_consultant_date_id_foreign` (`consultant_date_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consultant_times`
--

INSERT INTO `consultant_times` (`id`, `consultant_date_id`, `from`, `to`, `created_at`, `updated_at`, `deleted_at`) VALUES
(9, 10, 1, 2, '2019-11-05 23:35:19', '2019-11-05 23:35:19', NULL),
(10, 10, 3, 4, '2019-11-05 23:35:19', '2019-11-05 23:35:19', NULL),
(11, 11, 3, 4, '2019-11-05 23:35:19', '2019-11-05 23:35:19', NULL),
(12, 11, 4, 8, '2019-11-05 23:35:19', '2019-11-05 23:35:19', NULL),
(15, 14, 1, 2, '2019-11-11 01:53:29', '2019-11-11 01:53:29', NULL),
(16, 15, 1, 5, '2019-11-11 23:00:30', '2019-11-11 23:00:30', NULL),
(17, 15, 5, 8, '2019-11-11 23:00:30', '2019-11-11 23:00:30', NULL),
(23, 21, 1, 2, '2019-11-13 02:13:25', '2019-11-13 02:13:25', NULL),
(24, 22, 8, 9, '2019-11-13 02:13:25', '2019-11-13 02:13:25', NULL),
(25, 23, 1, 2, '2019-11-13 02:13:25', '2019-11-13 02:13:25', NULL),
(27, 25, 1, 2, '2019-11-13 02:17:17', '2019-11-13 02:17:17', NULL),
(28, 26, 1, 2, '2019-11-13 03:12:28', '2019-11-13 03:12:28', NULL),
(29, 27, 3, 7, '2019-11-13 03:12:28', '2019-11-13 03:12:28', NULL),
(30, 28, 1, 2, '2019-11-13 03:12:28', '2019-11-13 03:12:28', NULL),
(31, 28, 2, 3, '2019-11-13 03:12:28', '2019-11-13 03:12:28', NULL),
(32, 28, 4, 6, '2019-11-13 03:12:28', '2019-11-13 03:12:28', NULL),
(33, 29, 3, 7, '2019-11-13 04:18:10', '2019-11-13 04:18:10', NULL),
(34, 30, 8, 9, '2019-11-13 04:18:10', '2019-11-13 04:18:10', NULL),
(35, 31, 1, 2, '2019-11-13 04:18:10', '2019-11-13 04:18:10', NULL),
(36, 32, 8, 9, '2019-11-13 04:18:10', '2019-11-13 04:18:10', NULL),
(37, 32, 10, 11, '2019-11-13 04:18:10', '2019-11-13 04:18:10', NULL),
(38, 33, 1, 5, '2019-11-14 00:47:53', '2019-11-14 00:47:53', NULL),
(39, 33, 2, 3, '2019-11-14 00:47:53', '2019-11-14 00:47:53', NULL),
(40, 33, 4, 5, '2019-11-14 00:47:53', '2019-11-14 00:47:53', NULL),
(41, 34, 1, 2, '2019-11-14 00:47:53', '2019-11-14 00:47:53', NULL),
(42, 34, 3, 4, '2019-11-14 00:47:53', '2019-11-14 00:47:53', NULL),
(43, 37, 1, 5, '2019-11-14 01:08:20', '2019-11-14 01:08:20', NULL),
(44, 37, 2, 3, '2019-11-14 01:08:20', '2019-11-14 01:08:20', NULL),
(45, 37, 4, 5, '2019-11-14 01:08:20', '2019-11-14 01:08:20', NULL),
(46, 38, 1, 2, '2019-11-14 01:08:20', '2019-11-14 01:08:20', NULL),
(47, 38, 3, 4, '2019-11-14 01:08:20', '2019-11-14 01:08:20', NULL),
(48, 39, 1, 5, '2019-11-14 01:08:42', '2019-11-14 01:08:42', NULL),
(49, 39, 2, 3, '2019-11-14 01:08:42', '2019-11-14 01:08:42', NULL),
(50, 39, 4, 5, '2019-11-14 01:08:42', '2019-11-14 01:08:42', NULL),
(51, 40, 1, 2, '2019-11-14 01:08:42', '2019-11-14 01:08:42', NULL),
(52, 40, 3, 4, '2019-11-14 01:08:42', '2019-11-14 01:08:42', NULL),
(53, 41, 10, 12, '2019-11-23 08:06:23', '2019-11-23 08:06:23', NULL),
(54, 41, 12, 14, '2019-11-23 08:06:23', '2019-11-23 08:06:23', NULL),
(55, 42, 1, 5, '2019-11-24 15:47:27', '2019-11-24 15:47:27', NULL),
(56, 42, 5, 6, '2019-11-24 15:47:27', '2019-11-24 15:47:27', NULL),
(57, 43, 1, 5, '2019-11-24 15:47:47', '2019-11-24 15:47:47', NULL),
(58, 43, 5, 6, '2019-11-24 15:47:47', '2019-11-24 15:47:47', NULL),
(59, 44, 1, 3, '2019-11-24 15:47:47', '2019-11-24 15:47:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `consultant_views`
--

DROP TABLE IF EXISTS `consultant_views`;
CREATE TABLE IF NOT EXISTS `consultant_views` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `consultant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consultant_views_user_id_foreign` (`user_id`),
  KEY `consultant_views_consultant_id_foreign` (`consultant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consultant_views`
--

INSERT INTO `consultant_views` (`id`, `user_id`, `consultant_id`, `created_at`, `updated_at`) VALUES
(1, 1, 10, '2019-11-14 01:54:31', '2019-11-14 01:54:31'),
(2, 1, 10, '2019-11-14 01:54:40', '2019-11-14 01:54:40'),
(3, 1, 10, '2019-11-14 01:54:42', '2019-11-14 01:54:42'),
(4, 1, 10, '2019-11-14 01:54:43', '2019-11-14 01:54:43'),
(5, 1, 10, '2019-11-14 01:54:44', '2019-11-14 01:54:44'),
(6, 1, 10, '2019-11-14 01:54:46', '2019-11-14 01:54:46'),
(7, 1, 10, '2019-11-21 09:00:03', '2019-11-21 09:00:03'),
(8, 1, 10, '2019-11-21 09:00:35', '2019-11-21 09:00:35'),
(9, 1, 10, '2019-11-21 09:01:40', '2019-11-21 09:01:40'),
(10, 1, 10, '2019-11-21 09:01:53', '2019-11-21 09:01:53'),
(11, 1, 10, '2019-11-21 09:02:23', '2019-11-21 09:02:23'),
(12, 1, 1, '2019-11-23 08:07:00', '2019-11-23 08:07:00'),
(13, 1, 1, '2019-11-23 08:07:11', '2019-11-23 08:07:11'),
(14, 1, 1, '2019-11-23 08:07:13', '2019-11-23 08:07:13'),
(15, 2, 1, '2019-11-23 08:09:54', '2019-11-23 08:09:54'),
(16, 2, 1, '2019-11-23 08:10:05', '2019-11-23 08:10:05'),
(17, 2, 1, '2019-11-23 08:10:08', '2019-11-23 08:10:08'),
(18, 1, 1, '2019-11-25 11:21:05', '2019-11-25 11:21:05'),
(19, 1, 1, '2019-11-26 16:28:48', '2019-11-26 16:28:48'),
(20, 1, 1, '2019-11-27 16:07:28', '2019-11-27 16:07:28'),
(21, 1, 1, '2019-11-27 16:11:46', '2019-11-27 16:11:46'),
(22, 1, 1, '2019-12-09 16:55:37', '2019-12-09 16:55:37'),
(23, 1, 1, '2019-12-09 16:57:30', '2019-12-09 16:57:30');

--
-- Triggers `consultant_views`
--
DROP TRIGGER IF EXISTS `insert_consultant_views`;
DELIMITER $$
CREATE TRIGGER `insert_consultant_views` AFTER INSERT ON `consultant_views` FOR EACH ROW BEGIN
                UPDATE consultants SET stat_views = stat_views + 1 WHERE id = NEW.consultant_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stat_students` int(11) NOT NULL,
  `stat_views` int(11) NOT NULL,
  `stat_sold` int(11) NOT NULL,
  `stat_likes` int(11) NOT NULL,
  `stat_rate_count` int(11) NOT NULL,
  `stat_rate_total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `user_id`, `category_id`, `title`, `slug`, `url`, `subtitle`, `text`, `image`, `video`, `stat_students`, `stat_views`, `stat_sold`, `stat_likes`, `stat_rate_count`, `stat_rate_total`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, NULL, 'تست دوره', '0', '', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, '2019-10-10 13:54:07', '2019-10-26 19:56:57', '2019-10-26 19:56:57'),
(2, 1, NULL, 'دوره من', '0', '', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, '2019-10-14 11:36:22', '2019-10-26 19:57:35', '2019-10-26 19:57:35'),
(3, 1, 6, 'آموزش فوتوشاپ', '0', '', 'زیر تیتر دوره', 'توضیحات دوره', '5dc1a7ed8ade0.jpg', '5dadb7c1b9ca8.mp4', 1, 84, 0, 1, 0, 0, '2019-10-16 10:53:48', '2019-11-20 11:09:51', '2019-11-20 11:09:51'),
(4, 1, NULL, 'درس با دسته بندی', '0', '', NULL, NULL, '5db4c1fbd7168.jpg', '5db4c25cc15c0.jpg', 0, 0, 0, 0, 0, 0, '2019-10-19 09:48:44', '2019-10-26 19:58:29', '2019-10-26 19:58:29'),
(5, 1, 6, 'تست کنترل کیفیت', '0', '', 'زیر تیتر دوره', 'توضیحات دوره', '5dc1a80c56dd8.jpg', '5db4de7aef420.jpg', 1, 31, 0, 0, 0, 0, '2019-10-26 20:06:43', '2019-11-20 11:09:53', '2019-11-20 11:09:53'),
(6, 1, 6, 'تست پروگرس', '0', '', 'زیر تیتر دوره', 'توضیحات دوره', '5db5d4d2c0a08.jpg', '5db5d4d7c5440.jpg', 1, 2, 1000, 0, 0, 0, '2019-10-27 13:57:00', '2019-11-20 11:09:55', '2019-11-20 11:09:55'),
(7, 1, 6, 'دوره خاص', '0', '', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, '2019-11-07 01:06:13', '2019-11-07 01:06:13', NULL),
(8, 1, 6, 'تست با آزمون', '0', '', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, '2019-11-15 07:15:23', '2019-11-15 07:15:23', NULL),
(9, 1, 6, 'تست با آزمون نهایی و سرتیفیکت', '0', '', NULL, NULL, NULL, NULL, 2, 0, 2000, 0, 0, 0, '2019-11-15 11:30:57', '2019-11-15 11:30:57', NULL),
(10, 1, 6, 'تست با کویئز و سرتفیکت پایانی', '0', '', 'زیر تیتر دوره', 'توضیحات دوره توضیحات دوره\n\nتوضیحات دوره توضیحات دورتوضیحات دوره توضیحات دوره\n\nتوضیحات دوره توضیحات دوره\n\n توضیحات دوره توضیحات دوره توضیحات دوره توضیحات دوره', '5dcec75d9ca40.jpg', '5dcec7696efc8.mp4', 2, 134, 2000, 1, 1, 4, '2019-11-15 11:38:29', '2019-11-15 15:42:35', NULL),
(11, 1, 6, 'تست همگون سازی کوئیز', 'tst-hmgon-sazi-koeiz', 'دسته یک/زیر دسته 1/tst-hmgon-sazi-koeiz', 'زیر تیتر دوره', 'توضیحات دوره', '5dd5466518830.jpg', '5dd5466c30700.mp4', 4, 86, 102000, 0, 1, 4, '2019-11-19 09:07:26', '2019-11-21 07:51:41', NULL),
(12, 1, 6, 'تست استند الون', '', '', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, '2019-11-21 16:46:15', '2019-11-21 16:46:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course_categories`
--

DROP TABLE IF EXISTS `course_categories`;
CREATE TABLE IF NOT EXISTS `course_categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `master` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_categories_category_id_foreign` (`category_id`),
  KEY `course_categories_course_id_foreign` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_categories`
--

INSERT INTO `course_categories` (`id`, `category_id`, `course_id`, `master`, `created_at`, `updated_at`) VALUES
(1, 6, 4, 1, '2019-10-19 09:48:44', '2019-10-19 09:48:44'),
(2, 7, 4, 0, '2019-10-19 09:48:44', '2019-10-19 09:48:44'),
(27, 6, 6, 1, '2019-10-27 14:03:13', '2019-10-27 14:03:13'),
(28, 7, 6, 0, '2019-10-27 14:03:13', '2019-10-27 14:03:13'),
(29, 6, 3, 1, '2019-11-05 16:48:57', '2019-11-05 16:48:57'),
(30, 7, 3, 0, '2019-11-05 16:48:57', '2019-11-05 16:48:57'),
(31, 6, 5, 1, '2019-11-05 16:49:18', '2019-11-05 16:49:18'),
(32, 7, 5, 0, '2019-11-05 16:49:18', '2019-11-05 16:49:18'),
(33, 6, 7, 1, '2019-11-07 01:06:13', '2019-11-07 01:06:13'),
(34, 7, 7, 0, '2019-11-07 01:06:13', '2019-11-07 01:06:13'),
(35, 6, 8, 1, '2019-11-15 07:15:23', '2019-11-15 07:15:23'),
(36, 7, 8, 0, '2019-11-15 07:15:23', '2019-11-15 07:15:23'),
(37, 6, 9, 1, '2019-11-15 11:30:57', '2019-11-15 11:30:57'),
(38, 7, 9, 0, '2019-11-15 11:30:57', '2019-11-15 11:30:57'),
(41, 6, 10, 1, '2019-11-15 15:42:35', '2019-11-15 15:42:35'),
(42, 7, 10, 0, '2019-11-15 15:42:35', '2019-11-15 15:42:35'),
(49, 6, 11, 1, '2019-11-21 07:51:41', '2019-11-21 07:51:41'),
(50, 7, 11, 0, '2019-11-21 07:51:41', '2019-11-21 07:51:41'),
(51, 6, 12, 1, '2019-11-21 16:46:15', '2019-11-21 16:46:15'),
(52, 7, 12, 0, '2019-11-21 16:46:15', '2019-11-21 16:46:15');

-- --------------------------------------------------------

--
-- Table structure for table `course_cupons`
--

DROP TABLE IF EXISTS `course_cupons`;
CREATE TABLE IF NOT EXISTS `course_cupons` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `title` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `off` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_cupons_course_id_token_unique` (`course_id`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_discussions`
--

DROP TABLE IF EXISTS `course_discussions`;
CREATE TABLE IF NOT EXISTS `course_discussions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_discussions_course_id_foreign` (`course_id`),
  KEY `course_discussions_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_discussions`
--

INSERT INTO `course_discussions` (`id`, `course_id`, `user_id`, `text`, `created_at`, `updated_at`) VALUES
(8, 3, 1, 'zzz', '2019-10-21 14:33:32', '2019-10-21 14:33:32'),
(9, 3, 1, 'یک سوال دیگر دارم', '2019-10-21 14:34:03', '2019-10-21 14:34:03'),
(10, 3, 1, 'سلام منم یه سوال دارم', '2019-10-23 10:42:18', '2019-10-23 10:42:18'),
(11, 3, 1, 'سلام یه سوال داشتم', '2019-10-23 11:55:48', '2019-10-23 11:55:48'),
(12, 3, 1, 'سلام یه سوال دیگه داشتم', '2019-10-23 11:55:57', '2019-10-23 11:55:57'),
(13, 3, 1, 'سوال سوم رو هم لطفا پاسخ بدین', '2019-10-23 11:56:27', '2019-10-23 11:56:27'),
(14, 3, 1, 'سوال چهارم', '2019-10-23 12:01:13', '2019-10-23 12:01:13'),
(15, 3, 1, 'سوال پنجم', '2019-10-23 12:01:20', '2019-10-23 12:01:20'),
(16, 3, 1, 'سوال ششم', '2019-10-23 12:02:13', '2019-10-23 12:02:13'),
(17, 3, 1, 'سوال هفتم', '2019-10-23 12:02:19', '2019-10-23 12:02:19'),
(18, 3, 1, 'asd asdsa', '2019-10-23 12:12:05', '2019-10-23 12:12:05'),
(19, 3, 1, 'ads adsad', '2019-10-23 12:12:08', '2019-10-23 12:12:08'),
(20, 3, 1, 'sfsdfdsf', '2019-10-26 18:50:34', '2019-10-26 18:50:34'),
(21, 3, 1, 'dd', '2019-10-26 18:50:52', '2019-10-26 18:50:52'),
(22, 3, 1, 'sss', '2019-10-26 18:51:54', '2019-10-26 18:51:54'),
(23, 3, 1, 'ggg', '2019-10-26 20:50:57', '2019-10-26 20:50:57');

-- --------------------------------------------------------

--
-- Table structure for table `course_discussion_responses`
--

DROP TABLE IF EXISTS `course_discussion_responses`;
CREATE TABLE IF NOT EXISTS `course_discussion_responses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `discussion_id` bigint(20) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_discussion_responses_user_id_foreign` (`user_id`),
  KEY `course_discussion_responses_discussion_id_foreign` (`discussion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_discussion_responses`
--

INSERT INTO `course_discussion_responses` (`id`, `user_id`, `discussion_id`, `text`, `created_at`, `updated_at`) VALUES
(1, 1, 8, 'پاسخ شما', '2019-10-21 15:02:11', '2019-10-21 15:02:11'),
(2, 1, 8, 'پاسخ دیگر', '2019-10-21 15:07:17', '2019-10-21 15:07:17'),
(3, 1, 9, 'پاسخ شما', '2019-10-21 15:08:01', '2019-10-21 15:08:01'),
(4, 1, 9, 'پاسخ دوم', '2019-10-21 15:08:09', '2019-10-21 15:08:09'),
(5, 1, 9, 'سسس', '2019-10-21 15:09:09', '2019-10-21 15:09:09'),
(6, 1, 10, 'پاسخ شما', '2019-10-23 11:38:28', '2019-10-23 11:38:28'),
(7, 1, 19, 'پاسخ شما در اینجا', '2019-10-23 12:37:59', '2019-10-23 12:37:59'),
(8, 1, 19, 'پاسخ نهایی شما', '2019-10-23 12:42:20', '2019-10-23 12:42:20'),
(9, 1, 10, 'ss', '2019-10-26 18:34:29', '2019-10-26 18:34:29');

-- --------------------------------------------------------

--
-- Table structure for table `course_final_quizzes`
--

DROP TABLE IF EXISTS `course_final_quizzes`;
CREATE TABLE IF NOT EXISTS `course_final_quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_final_quizzes_course_id_unique` (`course_id`),
  UNIQUE KEY `course_final_quizzes_quiz_id_unique` (`quiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_final_quizzes`
--

INSERT INTO `course_final_quizzes` (`id`, `course_id`, `quiz_id`, `created_at`, `updated_at`) VALUES
(1, 11, 3, '2019-11-20 13:52:28', '2019-11-20 13:52:28');

-- --------------------------------------------------------

--
-- Table structure for table `course_lectures`
--

DROP TABLE IF EXISTS `course_lectures`;
CREATE TABLE IF NOT EXISTS `course_lectures` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `title` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('video','quiz') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_lectures_section_id_unique` (`section_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_lectures`
--

INSERT INTO `course_lectures` (`id`, `section_id`, `title`, `type`, `sort`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 8, 'تست سیستم', 'quiz', 0, '2019-10-16 14:27:12', '2019-10-16 13:43:38', '2019-10-16 14:27:12'),
(2, 8, 'ویدئو', 'video', 0, '2019-10-16 14:27:23', '2019-10-16 14:23:39', '2019-10-16 14:27:23'),
(3, 8, 'آزمون یک', 'quiz', 0, NULL, '2019-10-16 14:27:30', '2019-10-16 14:27:30'),
(4, 9, 'لکچر ویدئویی 1', 'video', 2, NULL, '2019-10-16 14:34:07', '2019-10-26 19:34:33'),
(5, 9, 'ویدئوی 2', 'video', 1, NULL, '2019-10-19 10:52:53', '2019-10-26 19:34:33'),
(6, 9, 'ویدئوی 3', 'video', 0, NULL, '2019-10-21 13:55:22', '2019-10-26 19:34:33'),
(7, 11, '11111', 'video', 0, '2019-10-25 20:31:19', '2019-10-25 20:29:53', '2019-10-25 20:31:19'),
(8, 11, '2222222222', 'video', 0, '2019-10-25 20:31:17', '2019-10-25 20:30:19', '2019-10-25 20:31:17'),
(9, 11, '1111', 'video', 1, NULL, '2019-10-25 20:31:28', '2019-10-27 14:16:06'),
(10, 11, '22222', 'video', 0, NULL, '2019-10-25 20:31:47', '2019-10-27 14:16:06'),
(11, 11, '33333', 'video', 0, '2019-10-25 20:32:44', '2019-10-25 20:31:53', '2019-10-25 20:32:44'),
(12, 11, '444444', 'quiz', 0, '2019-10-25 21:05:43', '2019-10-25 20:32:00', '2019-10-25 21:05:43'),
(13, 12, 'تست لکچر', 'video', 0, '2019-10-26 11:34:37', '2019-10-26 10:57:03', '2019-10-26 11:34:37'),
(14, 12, 'aa', 'video', 0, '2019-10-26 11:34:36', '2019-10-26 11:30:26', '2019-10-26 11:34:36'),
(15, 13, 'ویدئو', 'video', 0, '2019-10-26 11:36:30', '2019-10-26 11:35:08', '2019-10-26 11:36:30'),
(16, 13, 'سس', 'video', 0, NULL, '2019-10-26 11:36:41', '2019-10-26 11:36:41'),
(17, 14, 'سس', 'video', 0, '2019-10-26 11:41:29', '2019-10-26 11:37:18', '2019-10-26 11:41:29'),
(18, 14, 'dd', 'video', 0, '2019-10-26 11:44:54', '2019-10-26 11:41:34', '2019-10-26 11:44:54'),
(19, 14, 'xx', 'video', 0, '2019-10-26 11:44:52', '2019-10-26 11:42:49', '2019-10-26 11:44:52'),
(20, 14, 'ss', 'video', 0, '2019-10-26 12:16:59', '2019-10-26 11:44:58', '2019-10-26 12:16:59'),
(21, 15, 'آزمون یک', 'quiz', 0, '2019-10-26 12:25:41', '2019-10-26 12:18:45', '2019-10-26 12:25:41'),
(22, 16, 'یی', 'video', 0, NULL, '2019-10-26 12:26:27', '2019-10-26 12:26:27'),
(23, 16, 'شش', 'video', 0, NULL, '2019-10-26 12:26:30', '2019-10-26 12:26:30'),
(24, 19, '11', 'video', 0, '2019-10-26 14:07:04', '2019-10-26 12:42:58', '2019-10-26 14:07:04'),
(25, 19, '22', 'video', 2, NULL, '2019-10-26 12:43:03', '2019-10-26 13:41:45'),
(26, 19, '333', 'video', 1, NULL, '2019-10-26 12:43:07', '2019-10-26 13:41:45'),
(27, 19, '444', 'video', 3, NULL, '2019-10-26 12:43:11', '2019-10-26 13:41:45'),
(28, 22, 'عنوان لکچر ویدئو', 'video', 0, NULL, '2019-10-26 20:27:23', '2019-10-26 20:27:23'),
(29, 24, 'عنوان لکچر ویدئو', 'video', 0, NULL, '2019-10-27 14:00:18', '2019-10-27 14:00:18'),
(30, 25, 'عنوان لکچر آزمون', 'quiz', 0, NULL, '2019-10-27 14:01:15', '2019-10-27 14:01:15'),
(31, 26, 'عنوان لکچر آزمون', 'quiz', 0, NULL, '2019-10-27 14:06:49', '2019-10-27 14:06:49'),
(32, 27, 'عنوان لکچر آزمون', 'quiz', 0, NULL, '2019-10-28 18:06:12', '2019-10-28 18:06:12'),
(33, 28, 'ییی', 'video', 0, NULL, '2019-11-07 01:06:58', '2019-11-07 01:06:58'),
(34, 29, 'dd', 'video', 0, NULL, '2019-11-07 01:39:07', '2019-11-07 01:39:07'),
(35, 31, 'ggg', 'quiz', 0, NULL, '2019-11-15 07:43:28', '2019-11-15 07:43:28'),
(36, 32, 'درس یک', 'video', 0, NULL, '2019-11-15 15:39:46', '2019-11-15 15:39:46'),
(37, 32, 'درس دو', 'video', 0, NULL, '2019-11-15 15:40:16', '2019-11-15 15:40:16'),
(38, 33, 'لکچر یک', 'video', 0, NULL, '2019-11-15 15:40:45', '2019-11-15 15:40:45'),
(39, 33, 'اکچر دو', 'video', 0, NULL, '2019-11-15 15:41:09', '2019-11-15 15:41:09'),
(40, 34, 'سس', 'quiz', 0, NULL, '2019-11-19 08:51:06', '2019-11-19 08:51:06'),
(41, 35, 'آزمون یک', 'quiz', 0, '2019-11-20 11:41:06', '2019-11-19 09:12:18', '2019-11-20 11:41:06'),
(42, 35, 'تست لکچر', 'quiz', 0, NULL, '2019-11-20 11:41:14', '2019-11-20 11:41:14'),
(43, 36, 'عنوان درس آزمون', 'quiz', 0, NULL, '2019-11-20 13:28:09', '2019-11-20 13:28:09'),
(44, 37, 'عنوان درس آزمون', 'quiz', 0, NULL, '2019-11-20 13:39:51', '2019-11-20 13:39:51'),
(45, 38, 'فایل ها', 'video', 0, NULL, '2019-11-21 07:56:19', '2019-11-21 07:56:59'),
(46, 38, 'ویدئو ها', 'video', 0, NULL, '2019-11-21 07:56:51', '2019-11-21 08:01:02');

-- --------------------------------------------------------

--
-- Table structure for table `course_lecture_quizzes`
--

DROP TABLE IF EXISTS `course_lecture_quizzes`;
CREATE TABLE IF NOT EXISTS `course_lecture_quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lecture_id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `title` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_lecture_quizzes_lecture_id_foreign` (`lecture_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_lecture_quizzes`
--

INSERT INTO `course_lecture_quizzes` (`id`, `lecture_id`, `quiz_id`, `title`, `text`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 43, 1, '', '', NULL, '2019-11-20 13:35:55', '2019-11-20 13:35:55'),
(2, 44, 2, '', '', NULL, '2019-11-20 13:40:02', '2019-11-20 13:40:02');

-- --------------------------------------------------------

--
-- Table structure for table `course_lecture_resources`
--

DROP TABLE IF EXISTS `course_lecture_resources`;
CREATE TABLE IF NOT EXISTS `course_lecture_resources` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lecture_id` bigint(20) UNSIGNED NOT NULL,
  `upload_id` bigint(20) UNSIGNED NOT NULL,
  `file_name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_lecture_resources_upload_id_unique` (`upload_id`),
  KEY `course_lecture_resources_lecture_id_unique` (`lecture_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_lecture_resources`
--

INSERT INTO `course_lecture_resources` (`id`, `lecture_id`, `upload_id`, `file_name`, `original_name`, `created_at`, `updated_at`) VALUES
(8, 22, 244, '5db46cb93c7f8.jpg', 'a4.jpg', '2019-10-26 12:26:41', '2019-10-26 12:26:41'),
(9, 22, 245, '5db46cbb82cf8.jpg', 'photo_2017-12-24_16-54-51-1030x713.jpg', '2019-10-26 12:26:43', '2019-10-26 12:26:43'),
(10, 22, 246, '5db46cbe6d920.jpg', 'material.jpg', '2019-10-26 12:26:46', '2019-10-26 12:26:46'),
(11, 23, 247, '5db46ccc012c0.jpg', 'photo_2017-12-24_16-54-51-1030x713.jpg', '2019-10-26 12:27:00', '2019-10-26 12:27:00'),
(12, 26, 249, '5db47e49dde00.png', 'dars.png', '2019-10-26 13:41:37', '2019-10-26 13:41:37'),
(13, 26, 250, '5db47e4c9f218.jpg', 'material.jpg', '2019-10-26 13:41:40', '2019-10-26 13:41:40'),
(14, 4, 253, '5db4c9b5d13a8.jpg', 'a4.jpg', '2019-10-26 19:03:25', '2019-10-26 19:03:25'),
(15, 4, 254, '5db4c9bb789b0.jpg', 'a4.jpg', '2019-10-26 19:03:32', '2019-10-26 19:03:32'),
(16, 5, 255, '5db4c9bf6ddd0.jpg', 'building.jpg', '2019-10-26 19:03:35', '2019-10-26 19:03:35'),
(17, 6, 256, '5db4c9c4059d8.jpg', 'photo_2017-12-24_16-54-51-1030x713.jpg', '2019-10-26 19:03:40', '2019-10-26 19:03:40'),
(18, 5, 257, '5db4c9c6631f0.jpg', 'material.jpg', '2019-10-26 19:03:42', '2019-10-26 19:03:42'),
(19, 28, 259, '5db4dd6d02710.jpg', 'a4.jpg', '2019-10-26 20:27:33', '2019-10-26 20:27:33'),
(20, 28, 260, '5db4dd70eadd0.png', 'bet.png', '2019-10-26 20:27:37', '2019-10-26 20:27:37'),
(22, 33, 351, '5dc36e6151bd0.jpg', 'acc-21-22.jpg', '2019-11-07 01:07:45', '2019-11-07 01:07:45'),
(23, 36, 395, '5dcec6d556d10.png', 'mockup-adjust-video.png', '2019-11-15 15:40:05', '2019-11-15 15:40:05'),
(24, 38, 398, '5dcec70560d38.png', 'DAFT.png', '2019-11-15 15:40:53', '2019-11-15 15:40:53'),
(25, 38, 399, '5dcec709549e8.jpg', 'heydari3.jpg', '2019-11-15 15:40:57', '2019-11-15 15:40:57'),
(26, 45, 407, '5dd6432b56608.jpg', '5d513d0bbb86c---------------------PDO------PHP.jpg', '2019-11-21 07:56:27', '2019-11-21 07:56:27'),
(27, 45, 408, '5dd6433146ff0.png', 'course-bg.png', '2019-11-21 07:56:33', '2019-11-21 07:56:33');

-- --------------------------------------------------------

--
-- Table structure for table `course_lecture_videos`
--

DROP TABLE IF EXISTS `course_lecture_videos`;
CREATE TABLE IF NOT EXISTS `course_lecture_videos` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lecture_id` bigint(20) UNSIGNED NOT NULL,
  `upload_id` int(11) NOT NULL,
  `file_name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `free` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_lecture_videos_lecture_id_foreign` (`lecture_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_lecture_videos`
--

INSERT INTO `course_lecture_videos` (`id`, `lecture_id`, `upload_id`, `file_name`, `original_name`, `free`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 0, '5dab1c1d9fab0.mp4', 'voo.mp4', 0, NULL, '2019-10-16 14:23:43', '2019-10-16 14:23:43'),
(2, 4, 0, '5da75b9b79d38.mp4', 'voo.mp4', 0, '2019-10-19 10:52:21', '2019-10-16 14:34:11', '2019-10-19 10:52:21'),
(3, 4, 0, '5dab1c1d9fab0.mp4', 'voo.mp4', 0, NULL, '2019-10-19 10:52:21', '2019-10-19 10:52:21'),
(4, 5, 0, '5dab1c40d5610.mp4', 'voo.mp4', 0, NULL, '2019-10-19 10:52:56', '2019-10-19 10:52:56'),
(5, 6, 0, '5dadea05eb5a0.mp4', 'tele.mp4', 0, NULL, '2019-10-21 13:55:25', '2019-10-21 13:55:25'),
(6, 7, 0, '5db38c7cad250.jpg', 'a4.jpg', 0, NULL, '2019-10-25 20:29:56', '2019-10-25 20:29:56'),
(7, 8, 0, '5db38c965b5b8.jpg', 'a4.jpg', 0, NULL, '2019-10-25 20:30:22', '2019-10-25 20:30:22'),
(8, 9, 0, '5db38cdbdef30.jpg', 'a4.jpg', 0, NULL, '2019-10-25 20:31:31', '2019-10-25 20:31:31'),
(9, 10, 0, '5db394e2e1e10.jpg', 'a4.jpg', 0, NULL, '2019-10-25 21:05:46', '2019-10-25 21:05:46'),
(10, 13, 224, '5db45a213fea8.jpg', 'a4.jpg', 0, '2019-10-26 11:08:37', '2019-10-26 11:07:21', '2019-10-26 11:08:37'),
(11, 13, 225, '5db45a6d06c98.jpg', 'photo_2017-12-24_16-54-51-1030x713.jpg', 0, NULL, '2019-10-26 11:08:37', '2019-10-26 11:08:37'),
(12, 14, 227, '5db45f8e108d8.jpg', 'building.jpg', 0, NULL, '2019-10-26 11:30:30', '2019-10-26 11:30:30'),
(13, 15, 228, '5db460b7e4778.jpg', 'a4.jpg', 0, NULL, '2019-10-26 11:35:27', '2019-10-26 11:35:27'),
(14, 16, 229, '5db46106bb738.JPG', 'IMG_0875.JPG', 0, NULL, '2019-10-26 11:36:46', '2019-10-26 11:36:46'),
(15, 17, 230, '5db4612a3bc40.jpg', 'a4.jpg', 0, NULL, '2019-10-26 11:37:22', '2019-10-26 11:37:22'),
(16, 18, 231, '5db4623003200.jpg', 'a4.jpg', 0, NULL, '2019-10-26 11:41:44', '2019-10-26 11:41:44'),
(17, 19, 232, '5db462cc24540.jpg', 'a4.jpg', 0, NULL, '2019-10-26 11:44:20', '2019-10-26 11:44:20'),
(18, 20, 233, '5db462f56e0f0.jpg', 'a4.jpg', 0, '2019-10-26 11:45:27', '2019-10-26 11:45:01', '2019-10-26 11:45:27'),
(19, 20, 234, '5db4630fe7e28.jpg', 'IMG_2665-e1519935599522-400x400.jpg', 0, NULL, '2019-10-26 11:45:27', '2019-10-26 11:45:27'),
(20, 22, 242, '5db46cb1d5548.jpg', 'a4.jpg', 0, NULL, '2019-10-26 12:26:33', '2019-10-26 12:26:33'),
(21, 23, 243, '5db46cb4ca580.jpg', 'a4.jpg', 0, NULL, '2019-10-26 12:26:36', '2019-10-26 12:26:36'),
(22, 26, 248, '5db47e4699458.jpg', 'a4.jpg', 0, NULL, '2019-10-26 13:41:34', '2019-10-26 13:41:34'),
(23, 28, 258, '5db4dd67468e8.jpg', 'a4.jpg', 0, NULL, '2019-10-26 20:27:27', '2019-10-26 20:27:27'),
(24, 29, 263, '5db5d433b0c20.jpg', 'a4.jpg', 0, NULL, '2019-10-27 14:00:27', '2019-10-27 14:00:27'),
(25, 33, 352, '5dc36e6774680.jpg', '5d513d0bbb86c---------------------PDO------PHP.jpg', 0, NULL, '2019-11-07 01:07:51', '2019-11-07 01:07:51'),
(26, 36, 394, '5dcec6d0741d0.png', 'vps.png', 0, NULL, '2019-11-15 15:40:00', '2019-11-15 15:40:00'),
(27, 37, 396, '5dcec6e4ae768.png', 'mockup-adjust-video.png', 0, NULL, '2019-11-15 15:40:20', '2019-11-15 15:40:20'),
(28, 38, 397, '5dcec700d0278.png', 'vps.png', 0, NULL, '2019-11-15 15:40:48', '2019-11-15 15:40:48'),
(29, 39, 400, '5dcec71be13e8.jpg', 'heydari1.jpg', 0, NULL, '2019-11-15 15:41:15', '2019-11-15 15:41:15'),
(30, 46, 409, '5dd6435474680.mp4', 'htaccess.mp4', 0, NULL, '2019-11-21 07:57:08', '2019-11-21 07:57:08');

-- --------------------------------------------------------

--
-- Table structure for table `course_likes`
--

DROP TABLE IF EXISTS `course_likes`;
CREATE TABLE IF NOT EXISTS `course_likes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_likes_course_id_user_id_unique` (`course_id`,`user_id`),
  KEY `course_likes_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_likes`
--

INSERT INTO `course_likes` (`id`, `course_id`, `user_id`, `created_at`, `updated_at`) VALUES
(9, 3, 1, '2019-11-05 15:52:57', '2019-11-05 15:52:57');

--
-- Triggers `course_likes`
--
DROP TRIGGER IF EXISTS `delete_course_likes`;
DELIMITER $$
CREATE TRIGGER `delete_course_likes` AFTER DELETE ON `course_likes` FOR EACH ROW BEGIN
                UPDATE courses SET stat_likes = stat_likes - 1 WHERE id = OLD.course_id ; 
            END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_course_likes`;
DELIMITER $$
CREATE TRIGGER `insert_course_likes` AFTER INSERT ON `course_likes` FOR EACH ROW BEGIN
                UPDATE courses SET stat_likes = stat_likes + 1 WHERE id = NEW.course_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `course_messages`
--

DROP TABLE IF EXISTS `course_messages`;
CREATE TABLE IF NOT EXISTS `course_messages` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `buy` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `finish` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `quiz` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_messages_course_id_unique` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_messages`
--

INSERT INTO `course_messages` (`id`, `course_id`, `buy`, `finish`, `quiz`, `created_at`, `updated_at`) VALUES
(1, 5, 'زمانی که کاربر دوره ایی را خرید', 'زمانی که کاربر دوره ایی را به پایان رسوند', 'زمانی که کاربر آزمونی رو قبول یا رد شد', '2019-10-27 12:42:39', '2019-10-27 12:42:39'),
(2, 6, 'زمانی که کاربر دوره ایی را خرید', 'زمانی که کاربر دوره ایی را به پایان رسوند', 'آزمونی', '2019-10-27 14:03:13', '2019-10-27 14:03:13'),
(3, 3, 'زمانی که کاربر دوره ایی را خرید', 'زمانی که کاربر دوره ایی را به پایان رسوند', 'زمانی که کاربر آزمونی رو قبول یا رد شد', '2019-11-05 16:48:57', '2019-11-05 16:48:57'),
(4, 10, 'زمانی که کاربر دوره ایی را خرید', 'زمانی که کاربر دوره ایی را به پایان رسوند', 'زمانی که کاربر آزمونی رو قبول یا رد شد', '2019-11-15 15:42:35', '2019-11-15 15:42:35'),
(5, 11, 'زمانی که کاربر دوره ایی را خرید', 'زمانی که کاربر دوره ایی را به پایان رسوند', 'زمانی که کاربر آزمونی رو قبول یا رد شد', '2019-11-20 13:58:06', '2019-11-20 13:58:06');

-- --------------------------------------------------------

--
-- Table structure for table `course_plans`
--

DROP TABLE IF EXISTS `course_plans`;
CREATE TABLE IF NOT EXISTS `course_plans` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `original_price` int(11) DEFAULT NULL,
  `type` enum('normal','off') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_plans_course_id_foreign` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_plans`
--

INSERT INTO `course_plans` (`id`, `course_id`, `price`, `original_price`, `type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 7, 1000, NULL, 'normal', '2019-12-08 12:27:40', '2019-12-08 12:27:33', '2019-12-08 12:27:40'),
(2, 7, 1000, 2000, 'off', NULL, '2019-12-08 12:27:40', '2019-12-08 12:27:40'),
(3, 11, 50000, NULL, 'normal', NULL, '2019-12-09 16:44:34', '2019-12-09 16:44:34');

-- --------------------------------------------------------

--
-- Table structure for table `course_plan_organs`
--

DROP TABLE IF EXISTS `course_plan_organs`;
CREATE TABLE IF NOT EXISTS `course_plan_organs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `r10` int(11) NOT NULL,
  `r30` int(11) NOT NULL,
  `r50` int(11) NOT NULL,
  `r100` int(11) NOT NULL,
  `r200` int(11) NOT NULL,
  `r300` int(11) NOT NULL,
  `r400` int(11) NOT NULL,
  `r500` int(11) NOT NULL,
  `r700` int(11) NOT NULL,
  `r1000` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_plan_organs_course_id_foreign` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_plan_organs`
--

INSERT INTO `course_plan_organs` (`id`, `course_id`, `r10`, `r30`, `r50`, `r100`, `r200`, `r300`, `r400`, `r500`, `r700`, `r1000`, `created_at`, `updated_at`) VALUES
(1, 7, 1000, 1000, 50000, 100000, 200000, 30000, 40000, 5000000, 7000000, 100000000, '2019-12-08 12:29:31', '2019-12-08 12:29:31');

-- --------------------------------------------------------

--
-- Table structure for table `course_pres`
--

DROP TABLE IF EXISTS `course_pres`;
CREATE TABLE IF NOT EXISTS `course_pres` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `title` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_pres_course_id_foreign` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_pres`
--

INSERT INTO `course_pres` (`id`, `course_id`, `title`, `created_at`, `updated_at`) VALUES
(17, 5, 'مورد آموزشی یک', '2019-10-26 20:11:23', '2019-10-26 20:11:23'),
(18, 5, 'مورد آموزشی دو', '2019-10-26 20:11:23', '2019-10-26 20:11:23'),
(19, 5, 'مورد آموزشی 3', '2019-10-26 20:11:23', '2019-10-26 20:11:23'),
(24, 6, 'ششش', '2019-10-27 13:59:36', '2019-10-27 13:59:36'),
(25, 6, 'ذذ', '2019-10-27 13:59:36', '2019-10-27 13:59:36'),
(26, 7, 'دانشجویان در دوره آموزشی شما چه مواردی را یاد خواهند گرفت ؟', '2019-11-07 01:06:35', '2019-11-07 01:06:35'),
(30, 3, 'عکاسی در نور کم', '2019-11-07 01:29:50', '2019-11-07 01:29:50'),
(31, 3, 'عکاسی در نور کم 2', '2019-11-07 01:29:50', '2019-11-07 01:29:50'),
(32, 3, 'عکاسی در نور کم 3', '2019-11-07 01:29:50', '2019-11-07 01:29:50'),
(33, 10, 'مورد یک را یاد میگیرند', '2019-11-15 15:39:03', '2019-11-15 15:39:03'),
(34, 10, 'مورد 2 را یاد میگیرند', '2019-11-15 15:39:03', '2019-11-15 15:39:03');

-- --------------------------------------------------------

--
-- Table structure for table `course_publihs`
--

DROP TABLE IF EXISTS `course_publihs`;
CREATE TABLE IF NOT EXISTS `course_publihs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `confirm` tinyint(1) NOT NULL,
  `confirm_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_publihs_course_id_foreign` (`course_id`),
  KEY `course_publihs_admin_id_foreign` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_publihs`
--

INSERT INTO `course_publihs` (`id`, `course_id`, `admin_id`, `confirm`, `confirm_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, NULL, 0, NULL, '2019-10-17 12:35:45', '2019-10-17 12:36:01', '2019-10-17 12:36:01'),
(2, 3, NULL, 0, NULL, '2019-10-17 12:36:01', '2019-10-17 12:36:31', '2019-10-17 12:36:31'),
(3, 3, NULL, 0, NULL, '2019-10-17 12:36:31', '2019-10-17 12:36:38', '2019-10-17 12:36:38'),
(4, 3, NULL, 0, NULL, '2019-10-17 12:36:38', '2019-10-19 10:04:07', '2019-10-17 20:30:00'),
(5, 3, NULL, 0, NULL, '2019-10-19 10:04:07', '2019-10-19 10:04:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course_publish_confirms`
--

DROP TABLE IF EXISTS `course_publish_confirms`;
CREATE TABLE IF NOT EXISTS `course_publish_confirms` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `request_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_publish_confirms_course_id_unique` (`course_id`),
  UNIQUE KEY `course_publish_confirms_request_id_unique` (`request_id`),
  KEY `course_publish_confirms_admin_id_foreign` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_publish_confirms`
--

INSERT INTO `course_publish_confirms` (`id`, `course_id`, `request_id`, `admin_id`, `created_at`, `updated_at`) VALUES
(6, 6, 10, 1, '2019-11-05 16:49:34', '2019-11-05 16:49:34'),
(7, 5, 12, 1, '2019-11-05 16:49:43', '2019-11-05 16:49:43'),
(8, 3, 11, 1, '2019-11-05 16:49:53', '2019-11-05 16:49:53'),
(9, 10, 13, 1, '2019-11-15 15:43:41', '2019-11-15 15:43:41'),
(11, 11, 16, 1, '2019-11-21 07:52:10', '2019-11-21 07:52:10');

-- --------------------------------------------------------

--
-- Table structure for table `course_publish_requests`
--

DROP TABLE IF EXISTS `course_publish_requests`;
CREATE TABLE IF NOT EXISTS `course_publish_requests` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `confirm` tinyint(1) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `answer_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_publish_requests_course_id_foreign` (`course_id`),
  KEY `course_publish_requests_admin_id_foreign` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_publish_requests`
--

INSERT INTO `course_publish_requests` (`id`, `course_id`, `admin_id`, `confirm`, `text`, `answer_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 2, 'توضیحاتتوضیحات', NULL, '2019-10-19 12:00:08', '2019-10-19 11:45:31', '2019-10-19 12:00:08'),
(2, 3, 1, 2, 'توضیحاتتوضیحات توضیحات  توضیحات', '2019-10-19 12:01:01', '2019-10-19 12:04:49', '2019-10-19 12:00:08', '2019-10-19 12:04:49'),
(3, 3, 1, 1, NULL, '2019-10-19 12:04:57', '2019-10-19 12:07:43', '2019-10-19 12:04:49', '2019-10-19 12:07:43'),
(4, 3, NULL, 0, NULL, NULL, '2019-10-19 12:08:19', '2019-10-19 12:07:43', '2019-10-19 12:08:19'),
(5, 3, 1, 1, 'توضیحاتتوضیحاتتوضیحات', '2019-10-19 12:08:35', '2019-10-20 16:57:09', '2019-10-19 12:08:19', '2019-10-20 16:57:09'),
(6, 3, 1, 1, NULL, '2019-10-20 17:02:22', '2019-10-21 10:21:02', '2019-10-20 16:57:09', '2019-10-21 10:21:02'),
(7, 3, 1, 1, NULL, '2019-10-21 10:23:09', '2019-11-05 16:48:57', '2019-10-21 10:21:02', '2019-11-05 16:48:57'),
(8, 5, NULL, 0, NULL, NULL, '2019-10-27 12:44:42', '2019-10-27 12:42:39', '2019-10-27 12:44:42'),
(9, 5, 1, 1, 'توضیحات', '2019-10-27 18:22:25', '2019-11-05 16:49:18', '2019-10-27 12:44:42', '2019-11-05 16:49:18'),
(10, 6, 1, 1, NULL, '2019-11-05 16:49:34', NULL, '2019-10-27 14:03:13', '2019-11-05 16:49:34'),
(11, 3, 1, 1, NULL, '2019-11-05 16:49:53', NULL, '2019-11-05 16:48:57', '2019-11-05 16:49:53'),
(12, 5, 1, 1, NULL, '2019-11-05 16:49:43', NULL, '2019-11-05 16:49:18', '2019-11-05 16:49:43'),
(13, 10, 1, 1, NULL, '2019-11-15 15:43:41', NULL, '2019-11-15 15:42:35', '2019-11-15 15:43:41'),
(14, 11, 1, 1, NULL, '2019-11-20 14:54:58', '2019-11-21 07:50:28', '2019-11-20 13:58:06', '2019-11-21 07:50:28'),
(15, 11, NULL, 0, NULL, NULL, '2019-11-21 07:51:41', '2019-11-21 07:50:28', '2019-11-21 07:51:41'),
(16, 11, 1, 1, NULL, '2019-11-21 07:52:10', NULL, '2019-11-21 07:51:41', '2019-11-21 07:52:10');

-- --------------------------------------------------------

--
-- Table structure for table `course_ratings`
--

DROP TABLE IF EXISTS `course_ratings`;
CREATE TABLE IF NOT EXISTS `course_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_course_id` bigint(20) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_ratings_course_id_user_id_unique` (`course_id`,`user_id`),
  KEY `course_ratings_user_id_foreign` (`user_id`),
  KEY `course_ratings_user_course_id_foreign` (`user_course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_ratings`
--

INSERT INTO `course_ratings` (`id`, `course_id`, `user_id`, `user_course_id`, `text`, `rate`, `created_at`, `updated_at`) VALUES
(1, 10, 2, 6, 'بازخورد من مثبت هستش', 4, '2019-11-15 17:20:39', '2019-11-15 17:20:39'),
(2, 11, 1, 9, 'بازخورد من', 4, '2019-11-21 08:45:44', '2019-11-21 08:45:44');

--
-- Triggers `course_ratings`
--
DROP TRIGGER IF EXISTS `delete_course_ratings`;
DELIMITER $$
CREATE TRIGGER `delete_course_ratings` BEFORE DELETE ON `course_ratings` FOR EACH ROW BEGIN
                
                UPDATE courses SET stat_rate_count = stat_rate_count - 1 , stat_rate_total = stat_rate_total - OLD.rate  WHERE id = OLD.course_id ; 

            END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_course_ratings`;
DELIMITER $$
CREATE TRIGGER `insert_course_ratings` AFTER INSERT ON `course_ratings` FOR EACH ROW BEGIN
                
                UPDATE courses SET stat_rate_count = stat_rate_count + 1 , stat_rate_total = stat_rate_total + NEW.rate  WHERE id = NEW.course_id ; 

            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `course_reqs`
--

DROP TABLE IF EXISTS `course_reqs`;
CREATE TABLE IF NOT EXISTS `course_reqs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `title` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_reqs_course_id_foreign` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_reqs`
--

INSERT INTO `course_reqs` (`id`, `course_id`, `title`, `created_at`, `updated_at`) VALUES
(12, 5, 'کار 1', '2019-10-26 20:11:23', '2019-10-26 20:11:23'),
(13, 5, 'کار دو', '2019-10-26 20:11:23', '2019-10-26 20:11:23'),
(14, 5, 'کار 3', '2019-10-26 20:11:23', '2019-10-26 20:11:23'),
(16, 6, 'آیا دوره آموزشی شما پیش نیاز به تجربه یا دوره دیگری دارد ؟', '2019-10-27 13:59:36', '2019-10-27 13:59:36'),
(17, 7, 'آیا دوره آموزشی شما پیش نیاز به تجربه یا دوره دیگری دارد ؟', '2019-11-07 01:06:35', '2019-11-07 01:06:35'),
(20, 3, 'آیا دوره آموزشی شما پیش نیاز به تجربه یا دوره دیگری دارد ؟', '2019-11-07 01:29:50', '2019-11-07 01:29:50'),
(21, 3, 'آیا دوره آموزشی شما پیش نیاز به تجربه یا دوره دیگری دارد ؟ 2', '2019-11-07 01:29:50', '2019-11-07 01:29:50'),
(22, 10, 'کار با فوتوشاپ', '2019-11-15 15:39:03', '2019-11-15 15:39:03');

-- --------------------------------------------------------

--
-- Table structure for table `course_sections`
--

DROP TABLE IF EXISTS `course_sections`;
CREATE TABLE IF NOT EXISTS `course_sections` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `title` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `goal` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_sections_course_id_foreign` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_sections`
--

INSERT INTO `course_sections` (`id`, `course_id`, `title`, `goal`, `sort`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'sec1', 'aa', 0, '2019-10-10 13:56:42', '2019-10-10 13:55:00', '2019-10-10 13:56:42'),
(2, 1, 's2', 'ss', 0, '2019-10-10 13:55:54', '2019-10-10 13:55:51', '2019-10-10 13:55:54'),
(3, 1, 'سکشن 1', 'شش', 0, '2019-10-10 14:00:37', '2019-10-10 13:56:55', '2019-10-10 14:00:37'),
(4, 1, 'سکشن 22', 'سیب', 0, NULL, '2019-10-10 14:02:22', '2019-10-10 14:07:29'),
(5, 3, 'عنوان بخش11', 'دانشجو ها چه مواردی را در پایان این بخش یاد میگیرند ؟12', 0, '2019-10-16 11:18:44', '2019-10-16 11:09:42', '2019-10-16 11:18:44'),
(6, 3, 'سکشن یک', 'هدف این سکشن', 0, '2019-10-16 11:43:23', '2019-10-16 11:18:58', '2019-10-16 11:43:23'),
(7, 3, 'سکشن 1', 'هدف سکشن', 0, '2019-10-16 12:10:50', '2019-10-16 11:43:39', '2019-10-16 12:10:50'),
(8, 3, 'سکشن کویئز', 'کوئیز', 2, NULL, '2019-10-16 12:11:12', '2019-10-27 14:16:06'),
(9, 3, 'بخش ویدئو 11', 'دانشجو ها چه مواردی را در پایان این بخش یاد میگیرند ؟', 0, NULL, '2019-10-16 14:33:41', '2019-10-27 14:16:06'),
(10, 3, 'سکشن سوم', 'ها', 0, '2019-10-17 09:46:16', '2019-10-16 14:40:52', '2019-10-17 09:46:16'),
(11, 3, 'تست سورت', 'تست سورت', 1, NULL, '2019-10-25 20:29:42', '2019-10-27 14:16:06'),
(12, 4, 'بخش یک', 'هدف این بخش در اینجا', 0, '2019-10-26 11:34:38', '2019-10-26 10:56:53', '2019-10-26 11:34:38'),
(13, 4, 'تست یک سکشن', 'سس', 0, '2019-10-26 11:37:11', '2019-10-26 11:35:01', '2019-10-26 11:37:11'),
(14, 4, 'یی', 'یی', 0, '2019-10-26 12:17:46', '2019-10-26 11:37:15', '2019-10-26 12:17:46'),
(15, 4, 'عنوان بخش', 'دانشجو ها چه مواردی را در پایان این بخش یاد میگیرند ؟', 0, '2019-10-26 12:26:16', '2019-10-26 12:18:24', '2019-10-26 12:26:16'),
(16, 4, 'عنوان بخش', 'دانشجو ها چه مواردی را در پایان این بخش یاد میگیرند ؟', 0, '2019-10-26 12:38:55', '2019-10-26 12:26:22', '2019-10-26 12:38:55'),
(17, 4, 'یک بخش دیگر', 'دانشجو ها چه مواردی را در پایان این بخش یاد میگیرند ؟', 0, '2019-10-26 12:31:32', '2019-10-26 12:31:25', '2019-10-26 12:31:32'),
(18, 4, 'بخش جدید', 'دانشجو ها چه مواردی را در پایان این بخش یاد میگیرند ؟', 2, NULL, '2019-10-26 12:32:09', '2019-10-26 14:07:00'),
(19, 4, 'یی', 'یی', 1, NULL, '2019-10-26 12:38:59', '2019-10-26 14:07:00'),
(20, 4, '111', '111', 3, NULL, '2019-10-26 12:39:03', '2019-10-26 14:07:00'),
(21, 4, '22', '22', 0, NULL, '2019-10-26 12:40:24', '2019-10-26 14:07:00'),
(22, 5, 'سکشن یک', 'دانشجو ها چه مواردی را در پایان این بخش یاد میگیرند ؟', 0, NULL, '2019-10-26 20:21:41', '2019-10-26 20:21:51'),
(23, 5, 'سکشن دو', 'دانشجو ها چه مواردی را در پایان این بخش یاد میگیرند ؟', 1, NULL, '2019-10-26 20:21:48', '2019-10-26 20:21:51'),
(24, 6, 'عنوان بخش', 'دانشجو ها چه مواردی را در پایان این بخش یاد میگیرند ؟', 0, '2019-10-27 14:06:31', '2019-10-27 13:59:56', '2019-10-27 14:06:31'),
(25, 6, 'عنوان بخش', 'دانشجو ها چه مواردی را در پایان این بخش یاد میگیرند ؟', 0, '2019-10-27 14:06:27', '2019-10-27 14:00:09', '2019-10-27 14:06:27'),
(26, 6, 'تست کوئیز', 'دانشجو ها چه مواردی را در پایان این بخش یاد میگیرند ؟', 0, '2019-10-28 18:06:01', '2019-10-27 14:06:40', '2019-10-28 18:06:01'),
(27, 6, 'عنوان بخش', 'دانشجو ها چه مواردی را در پایان این بخش یاد میگیرند ؟', 0, NULL, '2019-10-28 18:06:06', '2019-10-28 18:06:06'),
(28, 7, 'لکچر یک', 'شسی', 0, NULL, '2019-11-07 01:06:50', '2019-11-07 01:06:50'),
(29, 3, 'بخش', 'دانشجو ها چه مواردی را در پایان این بخش یاد میگیرند ؟', 0, NULL, '2019-11-07 01:38:16', '2019-11-07 01:38:16'),
(30, 3, 'sss', 'ss', 0, NULL, '2019-11-07 01:38:55', '2019-11-07 01:38:55'),
(31, 8, 'ghg', 'gg', 0, NULL, '2019-11-15 07:43:21', '2019-11-15 07:43:21'),
(32, 10, 'بخش یک', 'هدف ما', 0, '2019-11-19 08:57:09', '2019-11-15 15:39:39', '2019-11-19 08:57:09'),
(33, 10, 'بخش دوم', 'دانشجو ها چه مواردی را در پایان این بخش یاد میگیرند ؟', 0, '2019-11-19 08:57:12', '2019-11-15 15:40:37', '2019-11-19 08:57:12'),
(34, 10, 'کوئیز', 'یی', 0, NULL, '2019-11-19 08:51:02', '2019-11-19 08:51:02'),
(35, 11, 'تست کوئیز', 'سی', 0, '2019-11-20 13:27:46', '2019-11-19 09:12:08', '2019-11-20 13:27:46'),
(36, 11, 'عنوان بخش', 'دانشجو ها چه مواردی را در پایان این بخش یاد میگیرند ؟', 0, '2019-11-20 13:39:25', '2019-11-20 13:27:55', '2019-11-20 13:39:25'),
(37, 11, 'عنوان بخش', 'دانشجو ها چه مواردی را در پایان این بخش یاد میگیرند ؟', 1, NULL, '2019-11-20 13:39:32', '2019-11-21 08:00:49'),
(38, 11, 'بخش ویدئو', 'دانشجو ها چه مواردی را در پایان این بخش یاد میگیرند ؟', 0, NULL, '2019-11-21 07:56:11', '2019-11-21 08:00:49');

-- --------------------------------------------------------

--
-- Table structure for table `course_targets`
--

DROP TABLE IF EXISTS `course_targets`;
CREATE TABLE IF NOT EXISTS `course_targets` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `title` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_targets_course_id_foreign` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_targets`
--

INSERT INTO `course_targets` (`id`, `course_id`, `title`, `created_at`, `updated_at`) VALUES
(9, 5, 'هدف یک', '2019-10-26 20:11:23', '2019-10-26 20:11:23'),
(10, 5, 'هدف دو', '2019-10-26 20:11:23', '2019-10-26 20:11:23'),
(11, 6, 'دانشجو های هدف شما چه کسانی هستند ؟', '2019-10-27 13:59:36', '2019-10-27 13:59:36'),
(12, 7, 'دانشجو های هدف شما چه کسانی هستند ؟', '2019-11-07 01:06:35', '2019-11-07 01:06:35'),
(14, 3, 'دانشجو های هدف شما چه کسانی هستند ؟', '2019-11-07 01:29:50', '2019-11-07 01:29:50'),
(15, 10, 'کسانی که میخواهند یاد بگیرند', '2019-11-15 15:39:03', '2019-11-15 15:39:03'),
(16, 10, 'کسانی که وقت آزاد زیاد دارن', '2019-11-15 15:39:03', '2019-11-15 15:39:03');

-- --------------------------------------------------------

--
-- Table structure for table `course_technologies`
--

DROP TABLE IF EXISTS `course_technologies`;
CREATE TABLE IF NOT EXISTS `course_technologies` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `technology_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_technologies_course_id_foreign` (`course_id`),
  KEY `course_technologies_technology_id_foreign` (`technology_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_technologies`
--

INSERT INTO `course_technologies` (`id`, `course_id`, `technology_id`, `created_at`, `updated_at`) VALUES
(30, 6, 1, '2019-10-27 14:03:13', '2019-10-27 14:03:13'),
(31, 6, 2, '2019-10-27 14:03:13', '2019-10-27 14:03:13'),
(32, 3, 1, '2019-11-05 16:48:57', '2019-11-05 16:48:57'),
(33, 3, 2, '2019-11-05 16:48:57', '2019-11-05 16:48:57'),
(34, 5, 1, '2019-11-05 16:49:18', '2019-11-05 16:49:18'),
(35, 10, 1, '2019-11-15 15:42:35', '2019-11-15 15:42:35'),
(36, 10, 2, '2019-11-15 15:42:35', '2019-11-15 15:42:35'),
(39, 11, 1, '2019-11-21 07:51:41', '2019-11-21 07:51:41');

-- --------------------------------------------------------

--
-- Table structure for table `course_views`
--

DROP TABLE IF EXISTS `course_views`;
CREATE TABLE IF NOT EXISTS `course_views` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_views_user_id_foreign` (`user_id`),
  KEY `course_views_course_id_foreign` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_views`
--

INSERT INTO `course_views` (`id`, `user_id`, `course_id`, `created_at`, `updated_at`) VALUES
(1, 1, 5, '2019-11-04 20:53:50', '2019-11-04 20:53:50'),
(2, 1, 5, '2019-11-04 20:54:38', '2019-11-04 20:54:38'),
(3, 1, 5, '2019-11-04 21:09:22', '2019-11-04 21:09:22'),
(4, 1, 5, '2019-11-05 14:52:08', '2019-11-05 14:52:08'),
(5, 1, 5, '2019-11-05 14:59:33', '2019-11-05 14:59:33'),
(6, 1, 5, '2019-11-05 14:59:48', '2019-11-05 14:59:48'),
(7, 1, 5, '2019-11-05 15:00:02', '2019-11-05 15:00:02'),
(8, 1, 5, '2019-11-05 15:00:07', '2019-11-05 15:00:07'),
(9, 1, 3, '2019-11-05 15:01:18', '2019-11-05 15:01:18'),
(10, 1, 3, '2019-11-05 15:05:09', '2019-11-05 15:05:09'),
(11, 1, 3, '2019-11-05 15:05:36', '2019-11-05 15:05:36'),
(12, 1, 3, '2019-11-05 15:05:39', '2019-11-05 15:05:39'),
(13, 1, 3, '2019-11-05 15:05:51', '2019-11-05 15:05:51'),
(14, 1, 3, '2019-11-05 15:08:14', '2019-11-05 15:08:14'),
(15, NULL, 3, '2019-11-05 15:08:22', '2019-11-05 15:08:22'),
(16, 1, 3, '2019-11-05 15:09:36', '2019-11-05 15:09:36'),
(17, NULL, 3, '2019-11-05 15:09:39', '2019-11-05 15:09:39'),
(18, 1, 3, '2019-11-05 15:31:49', '2019-11-05 15:31:49'),
(19, 1, 5, '2019-11-05 15:31:55', '2019-11-05 15:31:55'),
(20, 1, 5, '2019-11-05 15:31:59', '2019-11-05 15:31:59'),
(21, 1, 5, '2019-11-05 15:32:02', '2019-11-05 15:32:02'),
(22, 1, 5, '2019-11-05 15:32:36', '2019-11-05 15:32:36'),
(23, 1, 5, '2019-11-05 15:34:48', '2019-11-05 15:34:48'),
(24, 1, 5, '2019-11-05 15:34:55', '2019-11-05 15:34:55'),
(25, 1, 5, '2019-11-05 15:35:08', '2019-11-05 15:35:08'),
(26, 1, 5, '2019-11-05 15:35:12', '2019-11-05 15:35:12'),
(27, 1, 5, '2019-11-05 15:38:29', '2019-11-05 15:38:29'),
(28, 1, 5, '2019-11-05 15:46:11', '2019-11-05 15:46:11'),
(29, 1, 3, '2019-11-05 15:46:16', '2019-11-05 15:46:16'),
(30, 1, 5, '2019-11-05 15:46:22', '2019-11-05 15:46:22'),
(31, 1, 5, '2019-11-05 15:46:27', '2019-11-05 15:46:27'),
(32, 1, 3, '2019-11-05 15:46:57', '2019-11-05 15:46:57'),
(33, 1, 3, '2019-11-05 15:48:27', '2019-11-05 15:48:27'),
(34, 1, 3, '2019-11-05 15:52:06', '2019-11-05 15:52:06'),
(35, 1, 3, '2019-11-05 15:52:49', '2019-11-05 15:52:49'),
(36, 1, 5, '2019-11-05 15:53:10', '2019-11-05 15:53:10'),
(37, 1, 6, '2019-11-06 00:04:59', '2019-11-06 00:04:59'),
(38, 1, 6, '2019-11-06 00:05:14', '2019-11-06 00:05:14'),
(39, 1, 5, '2019-11-06 23:17:53', '2019-11-06 23:17:53'),
(40, 1, 5, '2019-11-06 23:20:44', '2019-11-06 23:20:44'),
(41, 1, 5, '2019-11-06 23:21:08', '2019-11-06 23:21:08'),
(42, 1, 5, '2019-11-06 23:30:07', '2019-11-06 23:30:07'),
(43, 1, 5, '2019-11-06 23:30:20', '2019-11-06 23:30:20'),
(44, 1, 5, '2019-11-06 23:30:41', '2019-11-06 23:30:41'),
(45, 1, 5, '2019-11-06 23:31:37', '2019-11-06 23:31:37'),
(46, 1, 5, '2019-11-07 00:09:26', '2019-11-07 00:09:26'),
(47, 1, 5, '2019-11-07 00:28:37', '2019-11-07 00:28:37'),
(48, 1, 3, '2019-11-07 01:08:47', '2019-11-07 01:08:47'),
(49, 1, 3, '2019-11-07 01:10:09', '2019-11-07 01:10:09'),
(50, 1, 3, '2019-11-07 01:10:44', '2019-11-07 01:10:44'),
(51, 1, 10, '2019-11-15 15:44:09', '2019-11-15 15:44:09'),
(52, 1, 10, '2019-11-15 15:44:11', '2019-11-15 15:44:11'),
(53, 1, 10, '2019-11-15 15:47:04', '2019-11-15 15:47:04'),
(54, 1, 10, '2019-11-15 15:49:42', '2019-11-15 15:49:42'),
(55, 1, 10, '2019-11-15 15:49:54', '2019-11-15 15:49:54'),
(56, 1, 10, '2019-11-15 15:51:12', '2019-11-15 15:51:12'),
(57, 1, 10, '2019-11-15 15:51:49', '2019-11-15 15:51:49'),
(58, 1, 10, '2019-11-15 15:52:15', '2019-11-15 15:52:15'),
(59, 1, 10, '2019-11-15 15:54:02', '2019-11-15 15:54:02'),
(60, 1, 10, '2019-11-15 15:54:08', '2019-11-15 15:54:08'),
(61, 1, 10, '2019-11-15 15:54:18', '2019-11-15 15:54:18'),
(62, 1, 10, '2019-11-15 15:55:12', '2019-11-15 15:55:12'),
(63, 1, 10, '2019-11-15 15:57:36', '2019-11-15 15:57:36'),
(64, 1, 10, '2019-11-15 15:58:57', '2019-11-15 15:58:57'),
(65, 1, 10, '2019-11-15 15:59:09', '2019-11-15 15:59:09'),
(66, 1, 10, '2019-11-15 15:59:16', '2019-11-15 15:59:16'),
(67, 1, 10, '2019-11-15 16:01:50', '2019-11-15 16:01:50'),
(68, 1, 10, '2019-11-15 16:03:48', '2019-11-15 16:03:48'),
(69, 1, 10, '2019-11-15 16:06:46', '2019-11-15 16:06:46'),
(70, 1, 10, '2019-11-15 16:11:43', '2019-11-15 16:11:43'),
(71, 1, 10, '2019-11-15 16:15:46', '2019-11-15 16:15:46'),
(72, 1, 10, '2019-11-15 16:15:56', '2019-11-15 16:15:56'),
(73, 1, 10, '2019-11-15 16:16:22', '2019-11-15 16:16:22'),
(74, 1, 10, '2019-11-15 16:17:19', '2019-11-15 16:17:19'),
(75, 1, 10, '2019-11-15 16:18:47', '2019-11-15 16:18:47'),
(76, 1, 10, '2019-11-15 16:19:20', '2019-11-15 16:19:20'),
(77, 1, 10, '2019-11-15 16:19:38', '2019-11-15 16:19:38'),
(78, 1, 10, '2019-11-15 16:19:48', '2019-11-15 16:19:48'),
(79, 1, 10, '2019-11-15 16:20:01', '2019-11-15 16:20:01'),
(80, 1, 10, '2019-11-15 16:20:15', '2019-11-15 16:20:15'),
(81, 1, 10, '2019-11-15 16:22:09', '2019-11-15 16:22:09'),
(82, 1, 10, '2019-11-15 16:22:27', '2019-11-15 16:22:27'),
(83, 1, 10, '2019-11-15 16:24:46', '2019-11-15 16:24:46'),
(84, 1, 10, '2019-11-15 16:25:01', '2019-11-15 16:25:01'),
(85, 1, 10, '2019-11-15 16:26:59', '2019-11-15 16:26:59'),
(86, 1, 10, '2019-11-15 16:27:11', '2019-11-15 16:27:11'),
(87, 1, 10, '2019-11-15 16:27:43', '2019-11-15 16:27:43'),
(88, 1, 10, '2019-11-15 16:29:09', '2019-11-15 16:29:09'),
(89, 1, 10, '2019-11-15 16:29:33', '2019-11-15 16:29:33'),
(90, 1, 10, '2019-11-15 16:29:53', '2019-11-15 16:29:53'),
(91, 1, 10, '2019-11-15 16:30:02', '2019-11-15 16:30:02'),
(92, 1, 10, '2019-11-15 16:30:23', '2019-11-15 16:30:23'),
(93, 1, 10, '2019-11-15 16:30:37', '2019-11-15 16:30:37'),
(94, 1, 10, '2019-11-15 16:31:19', '2019-11-15 16:31:19'),
(95, 1, 10, '2019-11-15 16:31:43', '2019-11-15 16:31:43'),
(96, 1, 10, '2019-11-15 16:34:05', '2019-11-15 16:34:05'),
(97, 1, 10, '2019-11-15 16:34:54', '2019-11-15 16:34:54'),
(98, 1, 10, '2019-11-15 16:35:21', '2019-11-15 16:35:21'),
(99, 1, 10, '2019-11-15 16:35:44', '2019-11-15 16:35:44'),
(100, 1, 10, '2019-11-15 16:36:18', '2019-11-15 16:36:18'),
(101, 1, 10, '2019-11-15 16:37:45', '2019-11-15 16:37:45'),
(102, 1, 10, '2019-11-15 16:38:31', '2019-11-15 16:38:31'),
(103, 1, 10, '2019-11-15 16:39:19', '2019-11-15 16:39:19'),
(104, 1, 10, '2019-11-15 16:39:38', '2019-11-15 16:39:38'),
(105, 1, 10, '2019-11-15 16:39:54', '2019-11-15 16:39:54'),
(106, 1, 10, '2019-11-15 16:40:10', '2019-11-15 16:40:10'),
(107, 1, 10, '2019-11-15 16:42:03', '2019-11-15 16:42:03'),
(108, 1, 10, '2019-11-15 16:42:28', '2019-11-15 16:42:28'),
(109, 1, 10, '2019-11-15 16:43:20', '2019-11-15 16:43:20'),
(110, 1, 10, '2019-11-15 16:43:48', '2019-11-15 16:43:48'),
(111, 1, 10, '2019-11-15 16:44:01', '2019-11-15 16:44:01'),
(112, 1, 10, '2019-11-15 16:44:20', '2019-11-15 16:44:20'),
(113, 1, 10, '2019-11-15 16:44:32', '2019-11-15 16:44:32'),
(114, 1, 10, '2019-11-15 16:44:47', '2019-11-15 16:44:47'),
(115, 1, 10, '2019-11-15 16:45:00', '2019-11-15 16:45:00'),
(116, 1, 10, '2019-11-15 16:45:06', '2019-11-15 16:45:06'),
(117, 1, 10, '2019-11-15 16:45:34', '2019-11-15 16:45:34'),
(118, 1, 10, '2019-11-15 16:45:51', '2019-11-15 16:45:51'),
(119, 1, 10, '2019-11-15 16:46:02', '2019-11-15 16:46:02'),
(120, 1, 10, '2019-11-15 16:47:58', '2019-11-15 16:47:58'),
(121, 1, 10, '2019-11-15 16:48:14', '2019-11-15 16:48:14'),
(122, 1, 10, '2019-11-15 16:49:21', '2019-11-15 16:49:21'),
(123, 1, 10, '2019-11-15 16:49:34', '2019-11-15 16:49:34'),
(124, 1, 10, '2019-11-15 16:50:18', '2019-11-15 16:50:18'),
(125, 1, 10, '2019-11-15 16:50:32', '2019-11-15 16:50:32'),
(126, 1, 10, '2019-11-15 16:51:25', '2019-11-15 16:51:25'),
(127, 1, 10, '2019-11-15 16:52:20', '2019-11-15 16:52:20'),
(128, 1, 10, '2019-11-15 16:55:09', '2019-11-15 16:55:09'),
(129, 1, 10, '2019-11-15 16:55:24', '2019-11-15 16:55:24'),
(130, 1, 10, '2019-11-15 16:56:37', '2019-11-15 16:56:37'),
(131, 1, 10, '2019-11-15 16:57:20', '2019-11-15 16:57:20'),
(132, 1, 10, '2019-11-15 16:57:40', '2019-11-15 16:57:40'),
(133, 1, 10, '2019-11-15 16:57:50', '2019-11-15 16:57:50'),
(134, 1, 10, '2019-11-15 16:59:44', '2019-11-15 16:59:44'),
(135, 1, 10, '2019-11-15 16:59:50', '2019-11-15 16:59:50'),
(136, 1, 10, '2019-11-15 17:04:14', '2019-11-15 17:04:14'),
(137, 1, 10, '2019-11-15 17:04:29', '2019-11-15 17:04:29'),
(138, 1, 10, '2019-11-15 17:04:56', '2019-11-15 17:04:56'),
(139, 1, 10, '2019-11-15 17:05:11', '2019-11-15 17:05:11'),
(140, 1, 10, '2019-11-15 17:07:13', '2019-11-15 17:07:13'),
(141, 1, 10, '2019-11-15 17:07:25', '2019-11-15 17:07:25'),
(142, 1, 10, '2019-11-15 17:07:40', '2019-11-15 17:07:40'),
(143, 1, 10, '2019-11-15 17:07:58', '2019-11-15 17:07:58'),
(144, 1, 10, '2019-11-15 17:08:15', '2019-11-15 17:08:15'),
(145, 1, 10, '2019-11-15 17:08:56', '2019-11-15 17:08:56'),
(146, 1, 10, '2019-11-15 17:09:20', '2019-11-15 17:09:20'),
(147, 1, 10, '2019-11-15 17:09:36', '2019-11-15 17:09:36'),
(148, 1, 10, '2019-11-15 17:09:42', '2019-11-15 17:09:42'),
(149, 1, 10, '2019-11-15 17:10:28', '2019-11-15 17:10:28'),
(150, 1, 10, '2019-11-15 17:11:16', '2019-11-15 17:11:16'),
(151, 1, 10, '2019-11-15 17:11:57', '2019-11-15 17:11:57'),
(152, 1, 10, '2019-11-15 17:13:29', '2019-11-15 17:13:29'),
(153, 1, 10, '2019-11-15 17:13:55', '2019-11-15 17:13:55'),
(154, 1, 10, '2019-11-15 17:14:41', '2019-11-15 17:14:41'),
(155, 1, 10, '2019-11-15 17:15:06', '2019-11-15 17:15:06'),
(156, 1, 10, '2019-11-15 17:15:25', '2019-11-15 17:15:25'),
(157, 1, 10, '2019-11-15 17:15:47', '2019-11-15 17:15:47'),
(158, 1, 10, '2019-11-15 17:16:10', '2019-11-15 17:16:10'),
(159, 1, 10, '2019-11-15 17:20:20', '2019-11-15 17:20:20'),
(160, 1, 10, '2019-11-15 17:20:40', '2019-11-15 17:20:40'),
(161, 1, 10, '2019-11-15 17:20:40', '2019-11-15 17:20:40'),
(162, 1, 10, '2019-11-15 17:21:21', '2019-11-15 17:21:21'),
(163, 1, 10, '2019-11-15 17:22:51', '2019-11-15 17:22:51'),
(164, 1, 10, '2019-11-15 17:23:35', '2019-11-15 17:23:35'),
(165, 1, 10, '2019-11-15 17:28:57', '2019-11-15 17:28:57'),
(166, 1, 10, '2019-11-15 17:31:03', '2019-11-15 17:31:03'),
(167, 1, 10, '2019-11-15 17:32:17', '2019-11-15 17:32:17'),
(168, 1, 10, '2019-11-15 17:32:35', '2019-11-15 17:32:35'),
(169, 1, 10, '2019-11-15 17:35:37', '2019-11-15 17:35:37'),
(170, 1, 10, '2019-11-15 17:36:20', '2019-11-15 17:36:20'),
(171, 1, 10, '2019-11-15 17:43:17', '2019-11-15 17:43:17'),
(172, 1, 10, '2019-11-15 17:43:24', '2019-11-15 17:43:24'),
(173, 1, 10, '2019-11-15 17:44:00', '2019-11-15 17:44:00'),
(174, 1, 10, '2019-11-15 17:44:37', '2019-11-15 17:44:37'),
(175, 1, 10, '2019-11-15 17:45:18', '2019-11-15 17:45:18'),
(176, 1, 10, '2019-11-15 17:45:23', '2019-11-15 17:45:23'),
(177, 1, 10, '2019-11-15 17:46:38', '2019-11-15 17:46:38'),
(178, 1, 10, '2019-11-15 17:47:27', '2019-11-15 17:47:27'),
(179, 1, 10, '2019-11-15 17:51:03', '2019-11-15 17:51:03'),
(180, 1, 10, '2019-11-15 17:51:12', '2019-11-15 17:51:12'),
(181, 1, 10, '2019-11-18 08:57:08', '2019-11-18 08:57:08'),
(182, NULL, 10, '2019-11-19 08:32:37', '2019-11-19 08:32:37'),
(183, NULL, 10, '2019-11-19 08:32:38', '2019-11-19 08:32:38'),
(184, NULL, 10, '2019-11-19 08:33:00', '2019-11-19 08:33:00'),
(185, 1, 11, '2019-11-20 15:05:30', '2019-11-20 15:05:30'),
(186, 1, 11, '2019-11-20 15:05:42', '2019-11-20 15:05:42'),
(187, 1, 11, '2019-11-20 15:05:58', '2019-11-20 15:05:58'),
(188, 1, 11, '2019-11-20 15:07:39', '2019-11-20 15:07:39'),
(189, 1, 11, '2019-11-20 15:08:09', '2019-11-20 15:08:09'),
(190, 1, 11, '2019-11-20 15:08:32', '2019-11-20 15:08:32'),
(191, 1, 11, '2019-11-20 15:08:40', '2019-11-20 15:08:40'),
(192, 1, 11, '2019-11-20 15:08:56', '2019-11-20 15:08:56'),
(193, 1, 11, '2019-11-20 15:36:43', '2019-11-20 15:36:43'),
(194, 1, 11, '2019-11-20 15:43:44', '2019-11-20 15:43:44'),
(195, 1, 11, '2019-11-20 15:44:04', '2019-11-20 15:44:04'),
(196, 1, 11, '2019-11-20 15:44:45', '2019-11-20 15:44:45'),
(197, 1, 11, '2019-11-20 15:47:50', '2019-11-20 15:47:50'),
(198, 1, 11, '2019-11-20 16:28:20', '2019-11-20 16:28:20'),
(199, 1, 11, '2019-11-20 17:12:55', '2019-11-20 17:12:55'),
(200, 1, 11, '2019-11-20 17:16:28', '2019-11-20 17:16:28'),
(201, 1, 11, '2019-11-20 17:26:03', '2019-11-20 17:26:03'),
(202, 1, 11, '2019-11-20 17:26:05', '2019-11-20 17:26:05'),
(203, 1, 11, '2019-11-20 17:31:04', '2019-11-20 17:31:04'),
(204, 1, 11, '2019-11-20 17:34:38', '2019-11-20 17:34:38'),
(205, 1, 11, '2019-11-21 07:45:01', '2019-11-21 07:45:01'),
(206, 1, 11, '2019-11-21 07:55:48', '2019-11-21 07:55:48'),
(207, 1, 11, '2019-11-21 07:57:15', '2019-11-21 07:57:15'),
(208, 1, 11, '2019-11-21 08:01:08', '2019-11-21 08:01:08'),
(209, 1, 11, '2019-11-21 08:02:54', '2019-11-21 08:02:54'),
(210, 1, 11, '2019-11-21 08:04:25', '2019-11-21 08:04:25'),
(211, 1, 11, '2019-11-21 08:06:07', '2019-11-21 08:06:07'),
(212, 1, 11, '2019-11-21 08:07:11', '2019-11-21 08:07:11'),
(213, 1, 11, '2019-11-21 08:07:46', '2019-11-21 08:07:46'),
(214, 1, 11, '2019-11-21 08:08:03', '2019-11-21 08:08:03'),
(215, 1, 11, '2019-11-21 08:08:28', '2019-11-21 08:08:28'),
(216, 1, 11, '2019-11-21 08:09:46', '2019-11-21 08:09:46'),
(217, 1, 11, '2019-11-21 08:15:09', '2019-11-21 08:15:09'),
(218, 1, 11, '2019-11-21 08:15:25', '2019-11-21 08:15:25'),
(219, 1, 11, '2019-11-21 08:15:56', '2019-11-21 08:15:56'),
(220, 1, 11, '2019-11-21 08:16:11', '2019-11-21 08:16:11'),
(221, 1, 11, '2019-11-21 08:16:47', '2019-11-21 08:16:47'),
(222, 1, 11, '2019-11-21 08:17:08', '2019-11-21 08:17:08'),
(223, 1, 11, '2019-11-21 08:22:03', '2019-11-21 08:22:03'),
(224, 1, 11, '2019-11-21 08:37:42', '2019-11-21 08:37:42'),
(225, 1, 11, '2019-11-21 08:38:15', '2019-11-21 08:38:15'),
(226, 1, 11, '2019-11-21 08:40:36', '2019-11-21 08:40:36'),
(227, 1, 11, '2019-11-21 08:40:54', '2019-11-21 08:40:54'),
(228, 1, 11, '2019-11-21 08:41:09', '2019-11-21 08:41:09'),
(229, 1, 11, '2019-11-21 08:41:39', '2019-11-21 08:41:39'),
(230, 1, 11, '2019-11-21 08:44:40', '2019-11-21 08:44:40'),
(231, 1, 11, '2019-11-21 08:45:44', '2019-11-21 08:45:44'),
(232, 1, 11, '2019-11-21 08:46:53', '2019-11-21 08:46:53'),
(233, 1, 11, '2019-11-21 08:47:22', '2019-11-21 08:47:22'),
(234, 1, 11, '2019-11-21 08:47:35', '2019-11-21 08:47:35'),
(235, 1, 11, '2019-11-21 08:48:04', '2019-11-21 08:48:04'),
(236, 1, 11, '2019-11-21 08:49:11', '2019-11-21 08:49:11'),
(237, 1, 11, '2019-11-21 08:49:34', '2019-11-21 08:49:34'),
(238, 1, 11, '2019-11-21 08:49:45', '2019-11-21 08:49:45'),
(239, 1, 11, '2019-11-21 08:50:19', '2019-11-21 08:50:19'),
(240, 1, 11, '2019-11-21 08:50:35', '2019-11-21 08:50:35'),
(241, 1, 11, '2019-11-21 08:53:47', '2019-11-21 08:53:47'),
(242, 1, 11, '2019-11-21 08:55:25', '2019-11-21 08:55:25'),
(243, 1, 11, '2019-11-21 08:55:38', '2019-11-21 08:55:38'),
(244, 1, 11, '2019-11-21 08:55:52', '2019-11-21 08:55:52'),
(245, 1, 11, '2019-11-21 08:56:09', '2019-11-21 08:56:09'),
(246, 1, 11, '2019-11-21 08:56:41', '2019-11-21 08:56:41'),
(247, 1, 11, '2019-11-21 08:57:08', '2019-11-21 08:57:08'),
(248, 1, 11, '2019-11-21 08:57:22', '2019-11-21 08:57:22'),
(249, 1, 11, '2019-11-21 08:58:50', '2019-11-21 08:58:50'),
(250, 1, 11, '2019-11-21 08:59:21', '2019-11-21 08:59:21'),
(251, 1, 11, '2019-11-21 09:03:25', '2019-11-21 09:03:25'),
(252, 1, 11, '2019-11-21 09:04:05', '2019-11-21 09:04:05'),
(253, 1, 11, '2019-11-21 09:04:38', '2019-11-21 09:04:38'),
(254, 1, 11, '2019-11-21 09:04:51', '2019-11-21 09:04:51'),
(255, 1, 11, '2019-11-21 09:04:59', '2019-11-21 09:04:59'),
(256, 1, 11, '2019-11-21 09:05:33', '2019-11-21 09:05:33'),
(257, 1, 11, '2019-11-21 09:05:52', '2019-11-21 09:05:52'),
(258, 1, 11, '2019-11-21 09:06:37', '2019-11-21 09:06:37'),
(259, 1, 11, '2019-11-21 09:07:22', '2019-11-21 09:07:22'),
(260, 1, 11, '2019-11-21 09:08:33', '2019-11-21 09:08:33'),
(261, 1, 11, '2019-11-21 09:08:57', '2019-11-21 09:08:57'),
(262, 1, 11, '2019-11-21 09:10:49', '2019-11-21 09:10:49'),
(263, 1, 11, '2019-11-22 14:22:00', '2019-11-22 14:22:00'),
(264, 1, 11, '2019-12-09 16:44:12', '2019-12-09 16:44:12'),
(265, 1, 11, '2019-12-09 16:45:03', '2019-12-09 16:45:03'),
(266, 1, 11, '2019-12-09 16:45:05', '2019-12-09 16:45:05'),
(267, 1, 11, '2019-12-09 16:45:54', '2019-12-09 16:45:54'),
(268, 1, 11, '2019-12-09 16:46:25', '2019-12-09 16:46:25'),
(269, 1, 11, '2019-12-09 16:48:08', '2019-12-09 16:48:08'),
(270, 1, 11, '2019-12-09 16:48:25', '2019-12-09 16:48:25');

--
-- Triggers `course_views`
--
DROP TRIGGER IF EXISTS `insert_course_views`;
DELIMITER $$
CREATE TRIGGER `insert_course_views` AFTER INSERT ON `course_views` FOR EACH ROW BEGIN
                UPDATE courses SET stat_views = stat_views + 1 WHERE id = NEW.course_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cours_cupons`
--

DROP TABLE IF EXISTS `cours_cupons`;
CREATE TABLE IF NOT EXISTS `cours_cupons` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `title` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `off` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cours_cupons_course_id_token_unique` (`course_id`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cupons`
--

DROP TABLE IF EXISTS `cupons`;
CREATE TABLE IF NOT EXISTS `cupons` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `off` tinyint(4) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `type` enum('course','seminar','channel','consultant','quiz','all') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cupons_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cupons`
--

INSERT INTO `cupons` (`id`, `user_id`, `title`, `token`, `off`, `start_date`, `end_date`, `type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 1, 'کوپن گلوبال همه', 'xxx', 10, '2019-11-22', '2019-12-21', 'all', NULL, '2019-12-01 17:47:15', '2019-12-01 17:47:15'),
(3, 1, 'کوپن گلوبال سمینار', 'zzz', 15, '2019-11-22', '2019-12-21', 'seminar', NULL, '2019-12-01 17:47:41', '2019-12-01 17:47:41'),
(4, 1, ':وپن از سمت کاربری', 'ttt', 20, '2019-11-24', '2019-12-16', 'seminar', NULL, '2019-12-01 17:48:22', '2019-12-01 17:48:22'),
(5, 1, 'کوپن دوم کاربری', 'ggg', 11, '2019-11-24', '2019-12-16', 'seminar', '2019-12-01 17:49:12', '2019-12-01 17:48:41', '2019-12-01 17:49:12'),
(6, 1, 'تست کورس', '111', 10, '2019-11-22', '2019-12-13', 'seminar', NULL, '2019-12-08 12:41:20', '2019-12-08 12:41:20'),
(7, 1, 'یی', 'یی', 10, '2019-11-22', '2019-12-21', 'seminar', NULL, '2019-12-08 12:42:36', '2019-12-08 12:42:36'),
(8, 1, 'test', 'test', 15, '2019-11-22', '2019-12-13', 'course', '2019-12-08 12:49:47', '2019-12-08 12:46:30', '2019-12-08 12:49:47'),
(9, 1, 'dd', 'dd', 11, '2019-11-22', '2019-12-21', 'course', '2019-12-08 12:50:07', '2019-12-08 12:50:03', '2019-12-08 12:50:07'),
(10, 1, 'con', 'con', 15, '2019-11-22', '2019-12-21', 'consultant', '2019-12-08 13:15:23', '2019-12-08 13:15:07', '2019-12-08 13:15:23'),
(11, 1, 'qq', 'qq', 11, '2019-11-22', '2019-12-21', 'seminar', NULL, '2019-12-08 13:27:40', '2019-12-08 13:27:40'),
(12, 1, '1qq', 'q1', 33, '2019-11-22', '2019-12-16', 'quiz', NULL, '2019-12-08 13:28:11', '2019-12-08 13:28:11');

-- --------------------------------------------------------

--
-- Table structure for table `cupon_consultants`
--

DROP TABLE IF EXISTS `cupon_consultants`;
CREATE TABLE IF NOT EXISTS `cupon_consultants` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `consultant_id` bigint(20) UNSIGNED NOT NULL,
  `cupon_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cupon_consultants_consultant_id_cupon_id_unique` (`consultant_id`,`cupon_id`),
  KEY `cupon_consultants_cupon_id_foreign` (`cupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cupon_consultants`
--

INSERT INTO `cupon_consultants` (`id`, `consultant_id`, `cupon_id`, `created_at`, `updated_at`) VALUES
(2, 1, 2, '2019-12-08 13:15:11', '2019-12-08 13:15:11');

-- --------------------------------------------------------

--
-- Table structure for table `cupon_courses`
--

DROP TABLE IF EXISTS `cupon_courses`;
CREATE TABLE IF NOT EXISTS `cupon_courses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cupon_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cupon_courses_course_id_cupon_id_unique` (`course_id`,`cupon_id`),
  KEY `cupon_courses_cupon_id_foreign` (`cupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cupon_courses`
--

INSERT INTO `cupon_courses` (`id`, `cupon_id`, `course_id`, `created_at`, `updated_at`) VALUES
(1, 6, 7, '2019-12-08 12:41:20', '2019-12-08 12:41:20'),
(2, 7, 7, '2019-12-08 12:42:36', '2019-12-08 12:42:36'),
(4, 2, 7, '2019-12-08 12:46:46', '2019-12-08 12:46:46'),
(6, 2, 11, '2019-12-09 18:29:49', '2019-12-09 18:29:49');

-- --------------------------------------------------------

--
-- Table structure for table `cupon_globals`
--

DROP TABLE IF EXISTS `cupon_globals`;
CREATE TABLE IF NOT EXISTS `cupon_globals` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cupon_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cupon_globals_cupon_id_unique` (`cupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cupon_globals`
--

INSERT INTO `cupon_globals` (`id`, `cupon_id`, `created_at`, `updated_at`) VALUES
(1, 2, '2019-12-01 17:47:15', '2019-12-01 17:47:15'),
(2, 3, '2019-12-01 17:47:41', '2019-12-01 17:47:41');

-- --------------------------------------------------------

--
-- Table structure for table `cupon_quizzes`
--

DROP TABLE IF EXISTS `cupon_quizzes`;
CREATE TABLE IF NOT EXISTS `cupon_quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `cupon_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cupon_quizzes_quiz_id_cupon_id_unique` (`quiz_id`,`cupon_id`),
  KEY `cupon_quizzes_cupon_id_foreign` (`cupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cupon_quizzes`
--

INSERT INTO `cupon_quizzes` (`id`, `quiz_id`, `cupon_id`, `created_at`, `updated_at`) VALUES
(1, 10, 11, '2019-12-08 13:27:40', '2019-12-08 13:27:40'),
(2, 10, 12, '2019-12-08 13:28:11', '2019-12-08 13:28:11'),
(3, 10, 2, '2019-12-08 13:28:15', '2019-12-08 13:28:15');

-- --------------------------------------------------------

--
-- Table structure for table `cupon_seminars`
--

DROP TABLE IF EXISTS `cupon_seminars`;
CREATE TABLE IF NOT EXISTS `cupon_seminars` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cupon_id` bigint(20) UNSIGNED NOT NULL,
  `seminar_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cupon_seminars_seminar_id_cupon_id_unique` (`seminar_id`,`cupon_id`),
  KEY `cupon_seminars_cupon_id_foreign` (`cupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cupon_seminars`
--

INSERT INTO `cupon_seminars` (`id`, `cupon_id`, `seminar_id`, `created_at`, `updated_at`) VALUES
(1, 4, 5, '2019-12-01 17:48:22', '2019-12-01 17:48:22'),
(4, 3, 5, '2019-12-01 17:49:04', '2019-12-01 17:49:04');

-- --------------------------------------------------------

--
-- Table structure for table `discoussions`
--

DROP TABLE IF EXISTS `discoussions`;
CREATE TABLE IF NOT EXISTS `discoussions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('course','seminar','quiz','consultant','product') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discoussions_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discoussions`
--

INSERT INTO `discoussions` (`id`, `user_id`, `teacher_id`, `text`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'یک سوال دارم', 'course', '2019-11-06 23:30:17', '2019-11-06 23:30:17'),
(2, 1, 1, 'سیبسیبس', 'course', '2019-11-06 23:30:45', '2019-11-06 23:30:45'),
(3, 1, 1, 'سسسس', 'seminar', '2019-11-06 23:46:22', '2019-11-06 23:46:22'),
(4, 1, 1, 'متن سوال', 'quiz', '2019-11-06 23:53:45', '2019-11-06 23:53:45'),
(5, 1, 1, 'سیبسیب سبسی', 'consultant', '2019-11-06 23:59:35', '2019-11-06 23:59:35'),
(6, 1, 1, 'ببب', 'consultant', '2019-11-07 00:05:51', '2019-11-07 00:05:51'),
(7, 1, 1, 'ظظظ', 'consultant', '2019-11-07 00:08:11', '2019-11-07 00:08:11'),
(8, 1, 1, 'ظظظ', 'course', '2019-11-07 00:09:33', '2019-11-07 00:09:33'),
(9, 1, 1, 'ظظ', 'seminar', '2019-11-07 00:09:53', '2019-11-07 00:09:53'),
(10, 1, 1, 'ظظظ', 'quiz', '2019-11-07 00:10:13', '2019-11-07 00:10:13'),
(11, 1, 1, 'سیبسیب', 'consultant', '2019-11-12 01:24:00', '2019-11-12 01:24:00'),
(12, 1, 1, 'شش', 'consultant', '2019-11-12 01:24:04', '2019-11-12 01:24:04'),
(13, 1, 1, 'یک سوال دارم من', 'course', '2019-11-15 17:23:44', '2019-11-15 17:23:44'),
(14, 1, 1, 'ییی', 'quiz', '2019-11-22 12:53:08', '2019-11-22 12:53:08'),
(15, 1, 1, 'qwewq', 'seminar', '2019-11-27 16:01:06', '2019-11-27 16:01:06'),
(16, 1, 1, 'شش', 'product', '2019-12-08 17:42:57', '2019-12-08 17:42:57');

-- --------------------------------------------------------

--
-- Table structure for table `discoussion_responses`
--

DROP TABLE IF EXISTS `discoussion_responses`;
CREATE TABLE IF NOT EXISTS `discoussion_responses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `discussion_id` bigint(20) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discoussion_responses_user_id_foreign` (`user_id`),
  KEY `discoussion_responses_discussion_id_foreign` (`discussion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discoussion_responses`
--

INSERT INTO `discoussion_responses` (`id`, `user_id`, `discussion_id`, `text`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 'یی', '2019-11-06 23:45:16', '2019-11-06 23:45:16'),
(3, 1, 2, 'ططط', '2019-11-06 23:45:31', '2019-11-06 23:45:31'),
(4, 1, 3, 'شیسشس یشی', '2019-11-06 23:53:12', '2019-11-06 23:53:12'),
(5, 1, 4, 'سس', '2019-11-06 23:56:56', '2019-11-06 23:56:56'),
(6, 1, 5, 'شسششش', '2019-11-06 23:59:47', '2019-11-06 23:59:47'),
(7, 1, 10, 'پاسخ شما', '2019-11-07 00:13:23', '2019-11-07 00:13:23'),
(8, 1, 9, 'پاسخ شما', '2019-11-07 00:13:35', '2019-11-07 00:13:35'),
(9, 1, 8, 'پاسخ شما', '2019-11-07 00:13:49', '2019-11-07 00:13:49'),
(10, 1, 7, 'پاسخ شما', '2019-11-07 00:14:02', '2019-11-07 00:14:02'),
(11, 1, 6, 'باشه بهش میگم', '2019-11-07 00:33:21', '2019-11-07 00:33:21');

-- --------------------------------------------------------

--
-- Table structure for table `discoussion_seminars`
--

DROP TABLE IF EXISTS `discoussion_seminars`;
CREATE TABLE IF NOT EXISTS `discoussion_seminars` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `discussion_id` bigint(20) UNSIGNED NOT NULL,
  `seminar_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discoussion_seminars_discussion_id_foreign` (`discussion_id`),
  KEY `discoussion_seminars_seminar_id_foreign` (`seminar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discoussion_seminars`
--

INSERT INTO `discoussion_seminars` (`id`, `discussion_id`, `seminar_id`, `created_at`, `updated_at`) VALUES
(1, 3, 5, '2019-11-06 23:46:22', '2019-11-06 23:46:22'),
(2, 9, 5, '2019-11-07 00:09:53', '2019-11-07 00:09:53'),
(3, 15, 9, '2019-11-27 16:01:06', '2019-11-27 16:01:06');

-- --------------------------------------------------------

--
-- Table structure for table `discussion_consultants`
--

DROP TABLE IF EXISTS `discussion_consultants`;
CREATE TABLE IF NOT EXISTS `discussion_consultants` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `discussion_id` bigint(20) UNSIGNED NOT NULL,
  `consultant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discussion_consultants_discussion_id_foreign` (`discussion_id`),
  KEY `discussion_consultants_consultant_id_foreign` (`consultant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discussion_consultants`
--

INSERT INTO `discussion_consultants` (`id`, `discussion_id`, `consultant_id`, `created_at`, `updated_at`) VALUES
(1, 5, 3, '2019-11-06 23:59:35', '2019-11-06 23:59:35'),
(2, 6, 3, '2019-11-07 00:05:51', '2019-11-07 00:05:51'),
(3, 7, 3, '2019-11-07 00:08:11', '2019-11-07 00:08:11'),
(4, 11, 5, '2019-11-12 01:24:00', '2019-11-12 01:24:00'),
(5, 12, 5, '2019-11-12 01:24:04', '2019-11-12 01:24:04');

-- --------------------------------------------------------

--
-- Table structure for table `discussion_courses`
--

DROP TABLE IF EXISTS `discussion_courses`;
CREATE TABLE IF NOT EXISTS `discussion_courses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `discussion_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discussion_courses_discussion_id_foreign` (`discussion_id`),
  KEY `discussion_courses_course_id_foreign` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discussion_courses`
--

INSERT INTO `discussion_courses` (`id`, `discussion_id`, `course_id`, `created_at`, `updated_at`) VALUES
(1, 1, 5, '2019-11-06 23:30:17', '2019-11-06 23:30:17'),
(2, 2, 5, '2019-11-06 23:30:45', '2019-11-06 23:30:45'),
(3, 8, 5, '2019-11-07 00:09:33', '2019-11-07 00:09:33'),
(4, 13, 10, '2019-11-15 17:23:44', '2019-11-15 17:23:44');

-- --------------------------------------------------------

--
-- Table structure for table `discussion_products`
--

DROP TABLE IF EXISTS `discussion_products`;
CREATE TABLE IF NOT EXISTS `discussion_products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `discussion_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discussion_products_discussion_id_foreign` (`discussion_id`),
  KEY `discussion_products_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discussion_products`
--

INSERT INTO `discussion_products` (`id`, `discussion_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 16, 3, '2019-12-08 17:42:57', '2019-12-08 17:42:57');

-- --------------------------------------------------------

--
-- Table structure for table `discussion_quizzes`
--

DROP TABLE IF EXISTS `discussion_quizzes`;
CREATE TABLE IF NOT EXISTS `discussion_quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `discussion_id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discussion_quizzes_discussion_id_foreign` (`discussion_id`),
  KEY `discussion_quizzes_quiz_id_foreign` (`quiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discussion_quizzes`
--

INSERT INTO `discussion_quizzes` (`id`, `discussion_id`, `quiz_id`, `created_at`, `updated_at`) VALUES
(1, 14, 11, '2019-11-22 12:53:08', '2019-11-22 12:53:08');

-- --------------------------------------------------------

--
-- Table structure for table `instrocture_blogs`
--

DROP TABLE IF EXISTS `instrocture_blogs`;
CREATE TABLE IF NOT EXISTS `instrocture_blogs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instrocture_blogs`
--

INSERT INTO `instrocture_blogs` (`id`, `title`, `text`, `created_at`, `updated_at`) VALUES
(1, 'مورد یک', 'شی سشی شسیشس شسی شسسش شسزشس شسشس\r\nشسزشسزشس زشسزشسزسشز سشزشسز شسزشسزشسز سشزشسز سشز\r\nشس زشسز شسزشسزشسزشسز شسزشس زشس شسز', NULL, NULL),
(2, 'مورد دو', 'شی سشی شسیشس شسی شسسش شسزشس شسشس\r\nشسزشسزشس زشسزشسزسشز سشزشسز شسزشسزشسز سشزشسز سشز\r\nشس زشسز شسزشسزشسزشسز شسزشس زشس شسز', NULL, NULL),
(3, 'مورد سه', 'شی سشی شسیشس شسی شسسش شسزشس شسشس\r\nشسزشسزشس زشسزشسزسشز سشزشسز شسزشسزشسز سشزشسز سشز\r\nشس زشسز شسزشسزشسزشسز شسزشس زشس شسز', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `instrocture_video_tests`
--

DROP TABLE IF EXISTS `instrocture_video_tests`;
CREATE TABLE IF NOT EXISTS `instrocture_video_tests` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `upload_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instrocture_video_tests_upload_id_unique` (`upload_id`),
  KEY `instrocture_video_tests_user_id_unique` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instrocture_video_tests`
--

INSERT INTO `instrocture_video_tests` (`id`, `user_id`, `upload_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 325, 0, '2019-11-04 19:17:45', '2019-11-04 19:17:45'),
(3, 1, 327, 0, '2019-11-04 19:22:42', '2019-11-04 19:22:42'),
(4, 1, 328, 0, '2019-11-04 19:24:09', '2019-11-04 19:24:09');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_10_03_180514_create_courses_table', 1),
(5, '2019_10_05_172457_create_course_targets_table', 1),
(6, '2019_10_05_172513_create_course_reqs_table', 1),
(7, '2019_10_05_172524_create_course_pres_table', 1),
(8, '2019_10_06_150903_create_course_sections_table', 1),
(9, '2019_10_06_160508_create_course_lectures_table', 1),
(10, '2019_10_06_172034_create_uploads_table', 1),
(11, '2019_10_07_142327_create_course_lecture_videos_table', 1),
(12, '2019_10_07_165725_create_course_lecture_quizzes_table', 1),
(13, '2019_10_07_185412_create_course_lecture_quiz_questions_table', 1),
(14, '2019_10_07_185422_create_course_lecture_quiz_answers_table', 1),
(16, '2019_10_12_181844_create_profiles_table', 3),
(23, '2019_10_10_175659_create_channels_table', 4),
(24, '2019_10_12_200951_create_channel_posts_table', 4),
(30, '2019_10_12_201024_create_channel_post_images_table', 5),
(31, '2019_10_12_201848_create_channel_post_videos_table', 5),
(38, '2019_10_14_165928_create_seminars_table', 6),
(39, '2019_10_14_170400_create_seminar_dates_table', 6),
(40, '2019_10_14_170458_create_seminar_times_table', 6),
(41, '2019_10_15_153359_create_seminr_galleries_table', 7),
(42, '2019_10_15_153417_create_seminr_gallery_images_table', 7),
(43, '2019_10_15_153428_create_seminr_gallery_videos_table', 7),
(47, '2019_10_15_155547_create_seminar_galleries_table', 8),
(48, '2019_10_15_155557_create_seminar_gallery_images_table', 8),
(49, '2019_10_15_155605_create_seminar_gallery_videos_table', 8),
(58, '2019_10_07_165722_create_quizzes_table', 9),
(59, '2019_10_07_165723_create_quiz_questions_table', 9),
(60, '2019_10_15_161949_create_quiz_answers_table', 9),
(61, '2019_10_15_162148_create_seminar_quizzes_table', 9),
(63, '2019_10_16_202845_create_teacher_profiles_table', 10),
(64, '2019_10_17_130802_create_technologies_table', 11),
(65, '2019_10_17_130803_create_course_technologies_table', 11),
(66, '2019_10_17_160126_create_course_publihs_table', 12),
(67, '2019_09_29_173236_create_settings_table', 13),
(69, '2019_09_05_164315_create_wallets_table', 14),
(70, '2019_09_08_000953_create_transactions_table', 14),
(71, '2019_09_08_002946_create_transaction_withdraws_table', 14),
(72, '2019_09_26_133533_create_transaction_withdraw_results_table', 14),
(73, '2019_09_29_180246_create_pages_table', 15),
(74, '2019_09_07_231607_create_tickets_table', 16),
(75, '2019_09_07_231801_create_ticket_dialogs_table', 16),
(76, '2019_09_29_165432_create_user_roles_table', 17),
(77, '2019_09_29_165627_create_user_permissions_table', 17),
(78, '2017_01_01_014757_create_categories_tabl', 18),
(79, '2019_10_18_163902_create_course_categories_table', 19),
(80, '2019_10_19_151128_create_course_publish_requests_table', 20),
(81, '2019_10_19_151159_create_course_publish_confirms_table', 20),
(82, '2019_10_21_173820_create_course_discussions_table', 21),
(83, '2019_10_21_173916_create_course_discussion_responses_table', 21),
(85, '2019_10_22_135425_create_user_courses_table', 22),
(86, '2019_10_22_150920_create_ticket_supports_table', 23),
(87, '2019_10_22_150936_create_ticket_teachers_table', 23),
(88, '2019_10_22_182059_create_notifications_table', 24),
(90, '2019_10_23_223924_create_channel_post_comments_table', 25),
(91, '2019_10_23_230507_create_channel_post_likes_table', 26),
(92, '2019_10_24_002441_create_user_quizzes_table', 27),
(93, '2019_10_24_002606_create_user_quiz_answers_table', 27),
(94, '2019_10_24_135257_create_user_quiz_courses_table', 28),
(95, '2019_10_26_151624_create_course_lecture_resources_table', 29),
(97, '2019_10_27_155656_create_course_messages_table', 30),
(98, '2019_10_27_162229_create_cours_cupons_table', 31),
(99, '2019_10_27_164344_create_course_cupons_table', 32),
(100, '2019_10_28_211111_create_user_shops_table', 33),
(101, '2019_10_28_211158_create_user_products_table', 33),
(102, '2019_10_28_224459_create_user_product_stocks_table', 34),
(103, '2019_10_28_224515_create_user_product_plans_table', 34),
(104, '2019_10_28_225328_create_user_product_galleries_table', 34),
(105, '2019_10_31_173312_create_seminar_categories_table', 35),
(106, '2019_10_31_201325_create_standalone_quizzes_table', 36),
(107, '2019_10_31_210112_create_channel_publics_table', 37),
(108, '2019_10_31_210157_create_channel_educationals_table', 37),
(109, '2019_11_04_221710_create_instrocture_blogs_table', 38),
(110, '2019_11_04_223416_create_instrocture_video_tests_table', 39),
(111, '2019_10_22_135322_create_transaction_courses_table', 40),
(112, '2019_11_05_001053_create_course_views_table', 41),
(113, '2019_11_05_011840_create_channel_followers_table', 42),
(114, '2019_11_05_182402_create_course_likes_table', 43),
(115, '2019_11_05_203702_create_quiz_categories_table', 44),
(116, '2019_11_05_211400_create_transaction_seminars_table', 45),
(117, '2019_11_05_211624_create_user_seminars_table', 45),
(118, '2019_11_05_213254_create_discoussions_table', 46),
(119, '2019_11_05_213306_create_discoussion_responses_table', 46),
(120, '2019_11_05_213447_create_discoussion_seminars_table', 46),
(121, '2019_11_05_220251_create_transaction_quizzes_table', 47),
(122, '2019_11_05_220350_create_user_quiz_boughts_table', 47),
(123, '2019_11_05_220828_create_discussion_quizzes_table', 48),
(124, '2019_11_06_004611_create_consultants_table', 49),
(125, '2019_11_06_022533_create_consultant_categories_table', 50),
(126, '2019_11_06_022722_create_consultant_dates_table', 51),
(128, '2019_11_06_022731_create_consultant_times_table', 52),
(129, '2019_11_06_031354_create_transaction_consultants_table', 53),
(130, '2019_11_06_031410_create_user_consultants_table', 53),
(131, '2019_11_06_031807_create_discussion_consultants_table', 54),
(132, '2019_11_06_033028_create_discussion_courses_table', 55),
(133, '2019_11_06_034854_create_channel_categories_table', 56),
(134, '2019_11_06_040537_create_transaction_channels_table', 57),
(135, '2019_11_11_043116_create_seminar_publish_requests_table', 58),
(136, '2019_11_11_043131_create_seminar_publish_confirms_table', 58),
(137, '2019_11_11_045125_create_consultant_publish_requests_table', 59),
(138, '2019_11_11_045136_create_consultant_publish_confirms_table', 59),
(139, '2019_11_12_030737_create_consultant_ratings_table', 60),
(140, '2019_11_12_053002_create_wish_lists_table', 61),
(141, '2019_11_12_053200_create_wish_list_consultants_table', 61),
(142, '2019_11_14_035329_create_consultant_contacts_table', 62),
(143, '2019_11_14_052041_create_consultant_views_table', 63),
(144, '2019_11_15_111124_create_course_final_quizzes_table', 64),
(145, '2019_11_15_130415_create_quiz_point_groups_table', 65),
(146, '2019_11_15_141439_create_quiz_certificates_table', 66),
(147, '2019_11_15_193712_create_course_ratings_table', 67),
(148, '2019_11_15_210943_create_wish_list_courses_table', 68),
(149, '2019_11_20_184634_create_user_quiz_inits_table', 69),
(150, '2019_11_20_185046_create_user_quiz_init_questions_table', 69),
(151, '2019_11_20_185208_create_user_quiz_init_answers_table', 69),
(152, '2019_11_20_185702_create_user_quiz_init_groups_table', 69),
(153, '2019_11_20_185809_create_user_quiz_init_results_table', 69),
(154, '2019_11_20_190805_create_user_quiz_init_selections_table', 69),
(155, '2019_11_20_191933_create_user_quiz_init_course_lectures_table', 70),
(156, '2019_11_20_205844_create_user_quiz_init_course_finals_table', 71),
(157, '2019_11_21_142638_create_channele_publish_requests_table', 72),
(158, '2019_11_21_142731_create_channele_publish_confirms_table', 72),
(159, '2019_11_21_145318_create_channele_sub_prices_table', 73),
(160, '2019_11_21_152022_create_wishlist_channels_table', 74),
(161, '2019_11_21_152313_create_channel_ratings_table', 75),
(162, '2019_11_22_144544_create_quiz_publish_requests_table', 76),
(163, '2019_11_22_144600_create_quiz_publish_confirms_table', 76),
(164, '2019_11_22_154004_create_user_quizzes_table', 77),
(165, '2019_11_22_154812_create_quiz_ratings_table', 77),
(166, '2019_11_22_155253_create_wishlist_quizzes_table', 78),
(167, '2019_11_22_171007_create_quiz_views_table', 79),
(168, '2019_11_25_175347_create_seminar_shedules_table', 80),
(169, '2019_11_25_175410_create_seminar_shedule_dates_table', 80),
(170, '2019_11_25_175418_create_seminar_shedule_times_table', 80),
(171, '2019_11_26_195228_create_wish_list_seminars_table', 81),
(172, '2019_11_26_195534_create_seminar_ratings_table', 82),
(173, '2019_11_26_200103_create_seminar_views_table', 83),
(174, '2019_11_26_202824_create_user_seminar_shedules_table', 84),
(175, '2019_11_27_160413_create_user_quiz_init_seminars_table', 85),
(178, '2019_12_01_161505_create_cupons_table', 86),
(179, '2019_12_01_164646_create_cupon_globals_table', 86),
(182, '2019_12_01_190858_create_cupon_seminars_table', 87),
(183, '2019_12_01_201729_create_seminar_plans_table', 88),
(184, '2019_12_01_210204_create_seminar_plan_organs_table', 89),
(185, '2019_12_08_152742_create_course_plans_table', 90),
(186, '2019_12_08_152758_create_course_plan_organs_table', 90),
(187, '2019_12_08_152820_create_cupon_courses_table', 90),
(188, '2019_12_08_153151_create_consultant_plans_table', 91),
(189, '2019_12_08_153159_create_consultant_plan_organs_table', 91),
(190, '2019_12_08_153216_create_cupon_consultants_table', 91),
(191, '2019_12_08_153637_create_quiz_plans_table', 92),
(192, '2019_12_08_153645_create_quiz_plan_organs_table', 92),
(193, '2019_12_08_153658_create_cupon_quizzes_table', 92),
(194, '2019_12_08_201706_create_transaction_products_table', 93),
(195, '2019_12_08_201707_create_user_product_buys_table', 93),
(196, '2019_12_08_201708_create_product_ratings_table', 94),
(197, '2019_12_08_202947_create_product_views_table', 95),
(198, '2019_12_08_203434_create_discussion_products_table', 96),
(199, '2019_12_08_204012_create_wish_list_products_table', 97),
(200, '2019_12_08_211834_create_user_product_buy_orders_table', 98),
(201, '2019_12_08_211845_create_user_product_buy_downloads_table', 98),
(202, '2019_09_08_000954_create_transaction_incomes_table', 99),
(203, '2019_12_10_192817_create_website_templates_table', 100),
(204, '2019_12_10_192937_create_website_template_headers_table', 100),
(205, '2019_12_10_192947_create_website_template_footers_table', 100),
(206, '2019_12_10_193000_create_website_template_themes_table', 100),
(207, '2019_12_10_193001_create_websites_table', 100),
(208, '2019_12_10_193410_create_website_script_headers_table', 100),
(209, '2019_12_10_193503_create_website_script_footers_table', 100),
(210, '2019_12_10_193551_create_website_footer_links_table', 100),
(211, '2019_12_10_195744_create_website_sliders_table', 100),
(212, '2019_12_10_224126_create_website_links_table', 101),
(213, '2019_12_10_230243_create_website_banners_table', 102),
(214, '2019_12_10_231116_create_website_socials_table', 103),
(215, '2019_12_10_232117_create_website_pages_table', 104);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reciver_id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL,
  `obj_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `acc` enum('student','teacher') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'student',
  PRIMARY KEY (`id`),
  KEY `notifications_reciver_id_foreign` (`reciver_id`),
  KEY `notifications_sender_id_foreign` (`sender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `reciver_id`, `sender_id`, `type`, `seen`, `obj_id`, `reference_id`, `text`, `created_at`, `updated_at`, `acc`) VALUES
(1, 1, 1, 'quiz_discussion_init', 0, 14, 11, ' پیام جدید در آزمون تست با قیمت', '2019-11-22 12:53:08', '2019-11-22 12:53:08', 'teacher'),
(2, 1, 1, 'seminar_discussion_init', 0, 15, 9, ' پیام جدید در کلاس کلاس با ویزارد جدید', '2019-11-27 16:01:06', '2019-11-27 16:01:06', 'teacher');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_ratings`
--

DROP TABLE IF EXISTS `product_ratings`;
CREATE TABLE IF NOT EXISTS `product_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_product_buy_id` bigint(20) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_ratings_product_id_user_id_unique` (`product_id`,`user_id`),
  KEY `product_ratings_user_id_foreign` (`user_id`),
  KEY `product_ratings_user_product_buy_id_foreign` (`user_product_buy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_ratings`
--

INSERT INTO `product_ratings` (`id`, `product_id`, `user_id`, `user_product_buy_id`, `text`, `rate`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 1, 'ااا', 4, '2019-12-08 17:43:08', '2019-12-08 17:43:08');

--
-- Triggers `product_ratings`
--
DROP TRIGGER IF EXISTS `delete_product_ratings`;
DELIMITER $$
CREATE TRIGGER `delete_product_ratings` BEFORE DELETE ON `product_ratings` FOR EACH ROW BEGIN
                
                UPDATE user_products SET stat_rate_count = stat_rate_count - 1 , stat_rate_total = stat_rate_total - OLD.rate  WHERE id = OLD.product_id ; 

            END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_product_ratings`;
DELIMITER $$
CREATE TRIGGER `insert_product_ratings` AFTER INSERT ON `product_ratings` FOR EACH ROW BEGIN
                
                UPDATE user_products SET stat_rate_count = stat_rate_count + 1 , stat_rate_total = stat_rate_total + NEW.rate  WHERE id = NEW.product_id ; 

            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product_views`
--

DROP TABLE IF EXISTS `product_views`;
CREATE TABLE IF NOT EXISTS `product_views` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_views_user_id_foreign` (`user_id`),
  KEY `product_views_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_views`
--

INSERT INTO `product_views` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2019-12-08 17:07:29', '2019-12-08 17:07:29'),
(2, 1, 3, '2019-12-08 17:09:16', '2019-12-08 17:09:16'),
(3, 1, 3, '2019-12-08 17:09:44', '2019-12-08 17:09:44'),
(4, 1, 3, '2019-12-08 17:13:15', '2019-12-08 17:13:15'),
(5, 1, 3, '2019-12-08 17:13:29', '2019-12-08 17:13:29'),
(6, 1, 3, '2019-12-08 17:14:02', '2019-12-08 17:14:02'),
(7, 1, 3, '2019-12-08 17:36:20', '2019-12-08 17:36:20'),
(8, 1, 3, '2019-12-08 17:36:49', '2019-12-08 17:36:49'),
(9, 1, 3, '2019-12-08 17:37:36', '2019-12-08 17:37:36'),
(10, 1, 3, '2019-12-08 17:39:07', '2019-12-08 17:39:07'),
(11, 1, 3, '2019-12-08 17:39:37', '2019-12-08 17:39:37'),
(12, 1, 3, '2019-12-08 17:39:55', '2019-12-08 17:39:55'),
(13, 1, 3, '2019-12-08 17:40:02', '2019-12-08 17:40:02'),
(14, 1, 3, '2019-12-08 17:40:02', '2019-12-08 17:40:02'),
(15, 1, 3, '2019-12-08 17:41:13', '2019-12-08 17:41:13'),
(16, 1, 3, '2019-12-08 17:41:23', '2019-12-08 17:41:23'),
(17, 1, 3, '2019-12-08 17:41:38', '2019-12-08 17:41:38'),
(18, 1, 3, '2019-12-08 17:42:53', '2019-12-08 17:42:53'),
(19, 1, 3, '2019-12-08 17:43:08', '2019-12-08 17:43:08'),
(20, 1, 3, '2019-12-08 17:43:09', '2019-12-08 17:43:09'),
(21, 1, 3, '2019-12-08 17:43:59', '2019-12-08 17:43:59'),
(22, 1, 3, '2019-12-08 17:44:07', '2019-12-08 17:44:07'),
(23, 1, 3, '2019-12-08 17:44:42', '2019-12-08 17:44:42'),
(24, 1, 3, '2019-12-08 17:45:42', '2019-12-08 17:45:42'),
(25, 1, 3, '2019-12-08 17:46:49', '2019-12-08 17:46:49'),
(26, 1, 3, '2019-12-08 17:46:55', '2019-12-08 17:46:55'),
(27, 1, 3, '2019-12-08 17:47:13', '2019-12-08 17:47:13'),
(28, 1, 3, '2019-12-08 17:57:58', '2019-12-08 17:57:58'),
(29, 1, 3, '2019-12-08 17:58:14', '2019-12-08 17:58:14'),
(30, 1, 3, '2019-12-08 18:00:46', '2019-12-08 18:00:46'),
(31, 1, 3, '2019-12-08 18:01:28', '2019-12-08 18:01:28'),
(32, 1, 3, '2019-12-08 18:02:36', '2019-12-08 18:02:36'),
(33, 1, 3, '2019-12-08 18:02:38', '2019-12-08 18:02:38'),
(34, 1, 2, '2019-12-08 18:02:47', '2019-12-08 18:02:47'),
(35, 1, 2, '2019-12-08 18:03:34', '2019-12-08 18:03:34'),
(36, 1, 2, '2019-12-08 18:04:05', '2019-12-08 18:04:05'),
(37, 1, 2, '2019-12-08 18:04:19', '2019-12-08 18:04:19'),
(38, 1, 2, '2019-12-08 18:04:25', '2019-12-08 18:04:25'),
(39, 1, 2, '2019-12-08 18:06:34', '2019-12-08 18:06:34'),
(40, 1, 2, '2019-12-08 18:07:13', '2019-12-08 18:07:13'),
(41, 1, 2, '2019-12-08 18:07:38', '2019-12-08 18:07:38'),
(42, 1, 2, '2019-12-08 18:08:46', '2019-12-08 18:08:46'),
(43, 1, 2, '2019-12-08 18:09:09', '2019-12-08 18:09:09'),
(44, 1, 2, '2019-12-08 18:12:37', '2019-12-08 18:12:37'),
(45, 1, 2, '2019-12-08 18:12:49', '2019-12-08 18:12:49');

--
-- Triggers `product_views`
--
DROP TRIGGER IF EXISTS `insert_product_views`;
DELIMITER $$
CREATE TRIGGER `insert_product_views` AFTER INSERT ON `product_views` FOR EACH ROW BEGIN
                UPDATE user_products SET stat_views = stat_views + 1 WHERE id = NEW.product_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE IF NOT EXISTS `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `mobile` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profiles_mobile_unique` (`mobile`),
  KEY `profiles_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `mobile`, `created_at`, `updated_at`) VALUES
(1, 1, '09163105802', '2019-10-12 15:16:31', '2019-10-12 15:16:31'),
(2, 2, '09173105802', '2019-10-23 13:13:06', '2019-10-23 13:13:06');

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

DROP TABLE IF EXISTS `quizzes`;
CREATE TABLE IF NOT EXISTS `quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `try_limit` int(11) DEFAULT NULL,
  `question_count` int(11) DEFAULT NULL,
  `title` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `image_upload_id` int(11) DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `point_type` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_point` int(11) DEFAULT NULL,
  `question_point` int(11) NOT NULL,
  `answer_point` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stat_views` int(11) NOT NULL,
  `stat_students` int(11) NOT NULL,
  `stat_sold` int(11) NOT NULL,
  `stat_wished` int(11) NOT NULL,
  `stat_rate_count` int(11) NOT NULL,
  `stat_rate_total` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `user_id`, `try_limit`, `question_count`, `title`, `slug`, `url`, `text`, `time`, `price`, `image_upload_id`, `image`, `point_type`, `total_point`, `question_point`, `answer_point`, `deleted_at`, `created_at`, `updated_at`, `stat_views`, `stat_students`, `stat_sold`, `stat_wished`, `stat_rate_count`, `stat_rate_total`) VALUES
(1, 1, 0, NULL, 'تست درسی', '', '', 'توضیحات', 15, NULL, NULL, NULL, '2', NULL, 10, 0, NULL, '2019-11-20 13:35:55', '2019-11-20 13:35:55', 0, 0, 0, 0, 0, 0),
(2, 1, 0, NULL, 'عنوان کویز', '', '', 'توضیحات', 10, NULL, NULL, NULL, '3', NULL, 0, 48, NULL, '2019-11-20 13:40:02', '2019-11-20 13:40:02', 0, 0, 0, 0, 0, 0),
(3, 1, 0, NULL, 'عنوان آزمون', '', '', 'توضیحاتتوضیحات', 15, NULL, NULL, NULL, '2', NULL, 35, 0, NULL, '2019-11-20 13:52:28', '2019-11-20 13:52:28', 0, 0, 0, 0, 0, 0),
(10, 1, 2, 3, 'تست نهایی آزمون', 'aaa', 'bbb/ccc/aaa', 'توضیحاتتوضیحات', 10, NULL, 435, '5dd7c65b37528.jpg', '1', 20, 0, 0, NULL, '2019-11-22 11:37:58', '2019-11-22 11:37:58', 0, 0, 0, 0, 0, 0),
(11, 1, 2, 3, 'تست با قیمت', 'tst-ba-kimt', 'دسته یک/زیر دسته 1/tst-ba-kimt', 'توضیحات', 10, 2000, 438, '5dd7ce8be1000.jpg', '1', 20, 0, 0, NULL, '2019-11-22 12:05:40', '2019-11-22 12:05:40', 4, 4, 8000, 1, 1, 4),
(12, 1, 3, 10, 'تست جداشونده', 'tst-jdashondh', 'دسته یک/زیر دسته 1/tst-jdashondh', '', 10, 2000, NULL, NULL, '1', NULL, 0, 0, NULL, '2019-11-24 11:11:02', '2019-11-24 11:11:02', 0, 0, 0, 0, 0, 0),
(13, 1, 3, 2, 'تست بخش دار', 'tst-bkhsh-dar', 'دسته یک/زیر دسته 1/tst-bkhsh-dar', '', 10, 1000, NULL, NULL, '1', NULL, 0, 0, NULL, '2019-11-24 11:15:19', '2019-11-24 11:15:19', 0, 0, 0, 0, 0, 0),
(14, 1, 2, 2, 'تست بخش 2', 'tst-bkhsh-2', 'دسته یک/زیر دسته 1/tst-bkhsh-2', 'توضیحات آزمون', 10, 1000, 445, '5dda78103fde0.jpg', '1', 10, 0, 0, NULL, '2019-11-24 11:40:40', '2019-11-24 12:33:54', 10, 1, 1000, 0, 0, 0),
(15, 1, 0, NULL, 'عنوان آزمون', 'aanoan-aazmon', '', 'توضیحات', 10, NULL, NULL, NULL, '1', 6, 0, 0, NULL, '2019-11-24 17:02:13', '2019-11-24 17:02:13', 0, 0, 0, 0, 0, 0),
(16, 1, 0, NULL, 'آزمون پاس کردن سمینار', 'aazmon-pas-krdn-sminar', '', 'توضیحاتتوضیحات', 10, NULL, NULL, NULL, '2', NULL, 20, 0, NULL, '2019-11-25 12:01:07', '2019-11-25 12:01:07', 0, 0, 0, 0, 0, 0),
(17, 1, 0, NULL, 'تست پاس کردن کلاس', 'tst-pas-krdn-klas', '', 'توضیحات', 10, NULL, NULL, NULL, '1', 20, 0, 0, NULL, '2019-11-25 17:07:00', '2019-11-25 17:07:00', 0, 0, 0, 0, 0, 0),
(18, 1, 0, NULL, 'عنوان آزمون', 'aanoan-aazmon1', '', 'توضیحات', 10, NULL, NULL, NULL, '1', 10, 0, 0, NULL, '2019-11-27 16:54:30', '2019-11-27 16:54:30', 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_answers`
--

DROP TABLE IF EXISTS `quiz_answers`;
CREATE TABLE IF NOT EXISTS `quiz_answers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quiz_id` int(11) DEFAULT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `title` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `point` int(11) DEFAULT NULL,
  `ra` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_answers_question_id_foreign` (`question_id`),
  KEY `quiz_id` (`quiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_answers`
--

INSERT INTO `quiz_answers` (`id`, `quiz_id`, `question_id`, `title`, `point`, `ra`, `deleted_at`, `created_at`, `updated_at`) VALUES
(3, 1, 2, 'پاسخ1', NULL, 1, NULL, '2019-11-20 13:38:33', '2019-11-20 13:38:33'),
(4, 1, 2, 'پاسخ2', NULL, 0, NULL, '2019-11-20 13:38:33', '2019-11-20 13:38:33'),
(13, 2, 4, 'پاسخ2', 10, 1, NULL, '2019-11-20 13:40:58', '2019-11-20 13:40:58'),
(14, 2, 4, 'پاسخ3', 20, 0, NULL, '2019-11-20 13:40:58', '2019-11-20 13:40:58'),
(17, 2, 5, 'پاسخ1', 6, 1, NULL, '2019-11-20 13:47:00', '2019-11-20 13:47:00'),
(18, 2, 5, 'پاسخ 2', 12, 0, NULL, '2019-11-20 13:47:00', '2019-11-20 13:47:00'),
(26, 3, 9, 'پاسخ1', NULL, 1, NULL, '2019-11-20 13:52:45', '2019-11-20 13:52:45'),
(27, 3, 9, 'پاسخ2', NULL, 0, NULL, '2019-11-20 13:52:45', '2019-11-20 13:52:45'),
(28, 3, 10, 'پاسخ1', NULL, 1, NULL, '2019-11-20 13:52:45', '2019-11-20 13:52:45'),
(29, 3, 10, 'پاسخ2', NULL, 0, NULL, '2019-11-20 13:52:45', '2019-11-20 13:52:45'),
(30, 3, 10, 'پاسخ3', NULL, 0, NULL, '2019-11-20 13:52:45', '2019-11-20 13:52:45'),
(31, 3, 11, 'پاسخ1', NULL, 1, NULL, '2019-11-20 13:52:45', '2019-11-20 13:52:45'),
(32, 3, 11, 'پاسخ2', NULL, 0, NULL, '2019-11-20 13:52:45', '2019-11-20 13:52:45'),
(44, 10, 19, 'پاسخ یک', NULL, 1, NULL, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(45, 10, 19, 'پاسخ دو', NULL, 0, NULL, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(46, 10, 20, '1', NULL, 1, NULL, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(47, 10, 20, '2', NULL, 0, NULL, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(48, 10, 21, 'شس', NULL, 1, NULL, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(49, 10, 21, 'شسی', NULL, 0, NULL, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(50, 10, 22, 'شسی', NULL, 1, NULL, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(51, 10, 22, 'شسی', NULL, 0, NULL, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(52, 10, 23, 'شسی', NULL, 1, NULL, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(53, 10, 23, 'شش', NULL, 0, NULL, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(54, 10, 24, 'ششش', NULL, 1, NULL, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(55, 10, 24, 'سسس', NULL, 0, NULL, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(56, 11, 25, 'پاسخ', NULL, 1, NULL, '2019-11-22 12:05:40', '2019-11-22 12:05:40'),
(57, 11, 25, 'پاسخ', NULL, 0, NULL, '2019-11-22 12:05:40', '2019-11-22 12:05:40'),
(58, 11, 26, 'پاسخ', NULL, 1, NULL, '2019-11-22 12:05:40', '2019-11-22 12:05:40'),
(59, 11, 26, 'پاسخ', NULL, 0, NULL, '2019-11-22 12:05:40', '2019-11-22 12:05:40'),
(60, 11, 27, 'پاسخ', NULL, 1, NULL, '2019-11-22 12:05:40', '2019-11-22 12:05:40'),
(61, 11, 27, 'پاسخ', NULL, 0, NULL, '2019-11-22 12:05:40', '2019-11-22 12:05:40'),
(62, 11, 28, 'پاسخ', NULL, 1, NULL, '2019-11-22 12:05:40', '2019-11-22 12:05:40'),
(63, 11, 28, 'پاسخ', NULL, 0, NULL, '2019-11-22 12:05:40', '2019-11-22 12:05:40'),
(64, 11, 29, 'پاسخ', NULL, 1, NULL, '2019-11-22 12:05:40', '2019-11-22 12:05:40'),
(65, 11, 29, 'پاسخ', NULL, 0, NULL, '2019-11-22 12:05:40', '2019-11-22 12:05:40'),
(66, 11, 30, 'پاسخ', NULL, 1, NULL, '2019-11-22 12:05:40', '2019-11-22 12:05:40'),
(67, 11, 30, 'پاسخ', NULL, 0, NULL, '2019-11-22 12:05:40', '2019-11-22 12:05:40'),
(68, 11, 31, 'پاسخ', NULL, 1, NULL, '2019-11-22 14:55:53', '2019-11-22 14:55:53'),
(69, 11, 31, 'پاسخ', NULL, 0, NULL, '2019-11-22 14:55:53', '2019-11-22 14:55:53'),
(70, 11, 32, 'پاسخ', NULL, 1, NULL, '2019-11-22 14:55:53', '2019-11-22 14:55:53'),
(71, 11, 32, 'پاسخ', NULL, 0, NULL, '2019-11-22 14:55:53', '2019-11-22 14:55:53'),
(72, 11, 33, 'پاسخ', NULL, 1, NULL, '2019-11-22 14:55:53', '2019-11-22 14:55:53'),
(73, 11, 33, 'پاسخ', NULL, 0, NULL, '2019-11-22 14:55:53', '2019-11-22 14:55:53'),
(74, 11, 34, 'پاسخ', NULL, 1, NULL, '2019-11-22 14:55:53', '2019-11-22 14:55:53'),
(75, 11, 34, 'پاسخ', NULL, 0, NULL, '2019-11-22 14:55:53', '2019-11-22 14:55:53'),
(76, 11, 35, 'پاسخ', NULL, 1, NULL, '2019-11-22 14:55:53', '2019-11-22 14:55:53'),
(77, 11, 35, 'پاسخ', NULL, 0, NULL, '2019-11-22 14:55:53', '2019-11-22 14:55:53'),
(78, 11, 36, 'پاسخ', NULL, 1, NULL, '2019-11-22 14:55:53', '2019-11-22 14:55:53'),
(79, 11, 36, 'پاسخ', NULL, 0, NULL, '2019-11-22 14:55:53', '2019-11-22 14:55:53'),
(80, 14, 37, 'شسی', NULL, 1, NULL, '2019-11-24 11:44:20', '2019-11-24 11:44:20'),
(81, 14, 37, 'شسی', NULL, 0, NULL, '2019-11-24 11:44:20', '2019-11-24 11:44:20'),
(82, 14, 38, 'شش', NULL, 1, NULL, '2019-11-24 11:44:20', '2019-11-24 11:44:20'),
(83, 14, 38, 'شش', NULL, 0, NULL, '2019-11-24 11:44:20', '2019-11-24 11:44:20'),
(84, 14, 39, 'بب', NULL, 1, NULL, '2019-11-24 11:44:20', '2019-11-24 11:44:20'),
(85, 14, 39, 'بب', NULL, 0, NULL, '2019-11-24 11:44:20', '2019-11-24 11:44:20'),
(86, 14, 40, 'بب', NULL, 1, NULL, '2019-11-24 11:44:20', '2019-11-24 11:44:20'),
(87, 14, 40, 'بب', NULL, 0, NULL, '2019-11-24 11:44:20', '2019-11-24 11:44:20'),
(88, 14, 41, 'شسی', NULL, 1, NULL, '2019-11-24 12:33:54', '2019-11-24 12:33:54'),
(89, 14, 41, 'شسی', NULL, 0, NULL, '2019-11-24 12:33:54', '2019-11-24 12:33:54'),
(90, 14, 42, 'شش', NULL, 1, NULL, '2019-11-24 12:33:54', '2019-11-24 12:33:54'),
(91, 14, 42, 'شش', NULL, 0, NULL, '2019-11-24 12:33:54', '2019-11-24 12:33:54'),
(92, 14, 43, 'بب', NULL, 1, NULL, '2019-11-24 12:33:54', '2019-11-24 12:33:54'),
(93, 14, 43, 'بب', NULL, 0, NULL, '2019-11-24 12:33:54', '2019-11-24 12:33:54'),
(94, 14, 44, 'بب', NULL, 1, NULL, '2019-11-24 12:33:54', '2019-11-24 12:33:54'),
(95, 14, 44, 'بب', NULL, 0, NULL, '2019-11-24 12:33:54', '2019-11-24 12:33:54'),
(96, 15, 45, 'یی', NULL, 1, NULL, '2019-11-24 17:02:13', '2019-11-24 17:02:13'),
(97, 15, 45, 'ی', NULL, 0, NULL, '2019-11-24 17:02:13', '2019-11-24 17:02:13'),
(98, 15, 46, 'ی', NULL, 1, NULL, '2019-11-24 17:02:13', '2019-11-24 17:02:13'),
(99, 16, 47, 'پاسخ1', NULL, 1, NULL, '2019-11-25 12:01:07', '2019-11-25 12:01:07'),
(100, 16, 47, 'پاسخ2', NULL, 0, NULL, '2019-11-25 12:01:07', '2019-11-25 12:01:07'),
(101, 16, 48, 'پاسخ1', NULL, 1, NULL, '2019-11-25 12:01:07', '2019-11-25 12:01:07'),
(102, 16, 48, 'پاسخ2', NULL, 0, NULL, '2019-11-25 12:01:07', '2019-11-25 12:01:07'),
(103, 17, 49, 'یی', NULL, 1, NULL, '2019-11-25 17:07:00', '2019-11-25 17:07:00'),
(104, 17, 49, 'ی', NULL, 0, NULL, '2019-11-25 17:07:00', '2019-11-25 17:07:00'),
(105, 17, 49, 'ی', NULL, 0, NULL, '2019-11-25 17:07:00', '2019-11-25 17:07:00'),
(106, 17, 50, 'یی', NULL, 1, NULL, '2019-11-25 17:07:00', '2019-11-25 17:07:00'),
(107, 17, 50, 'یی', NULL, 0, NULL, '2019-11-25 17:07:00', '2019-11-25 17:07:00'),
(108, 18, 51, 'ش', NULL, 1, NULL, '2019-11-27 16:54:30', '2019-11-27 16:54:30'),
(109, 18, 51, 'ش', NULL, 0, NULL, '2019-11-27 16:54:30', '2019-11-27 16:54:30');

--
-- Triggers `quiz_answers`
--
DROP TRIGGER IF EXISTS `delete_quiz_answers`;
DELIMITER $$
CREATE TRIGGER `delete_quiz_answers` AFTER DELETE ON `quiz_answers` FOR EACH ROW IF OLD.point IS NOT NULL AND  OLD.point > 0 THEN 
                    UPDATE quizzes SET answer_point = answer_point - OLD.point WHERE id  = OLD.quiz_id ;
                END IF
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_quiz_answers`;
DELIMITER $$
CREATE TRIGGER `insert_quiz_answers` AFTER INSERT ON `quiz_answers` FOR EACH ROW IF NEW.point IS NOT NULL AND  NEW.point > 0 THEN 
                    UPDATE quizzes SET answer_point = answer_point + NEW.point WHERE id  = NEW.quiz_id ;
                END IF
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `update_quiz_answers`;
DELIMITER $$
CREATE TRIGGER `update_quiz_answers` AFTER UPDATE ON `quiz_answers` FOR EACH ROW IF OLD.deleted_at IS NULL AND NEW.deleted_at IS NOT NULL AND NEW.point IS NOT NULL AND  NEW.point > 0 THEN 
                    UPDATE quizzes SET answer_point = answer_point - NEW.point WHERE id  = NEW.quiz_id ;
                END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_categories`
--

DROP TABLE IF EXISTS `quiz_categories`;
CREATE TABLE IF NOT EXISTS `quiz_categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `master` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_categories_category_id_foreign` (`category_id`),
  KEY `quiz_categories_quiz_id_foreign` (`quiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_categories`
--

INSERT INTO `quiz_categories` (`id`, `category_id`, `quiz_id`, `master`, `created_at`, `updated_at`) VALUES
(1, 6, 16, 1, '2019-11-05 17:22:11', '2019-11-05 17:22:11'),
(2, 7, 16, 0, '2019-11-05 17:22:11', '2019-11-05 17:22:11'),
(15, 6, 10, 1, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(16, 7, 10, 0, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(17, 6, 11, 1, '2019-11-22 12:05:40', '2019-11-22 12:05:40'),
(18, 7, 11, 0, '2019-11-22 12:05:40', '2019-11-22 12:05:40'),
(21, 6, 14, 1, '2019-11-24 12:32:56', '2019-11-24 12:32:56'),
(22, 7, 14, 0, '2019-11-24 12:32:56', '2019-11-24 12:32:56');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_certificates`
--

DROP TABLE IF EXISTS `quiz_certificates`;
CREATE TABLE IF NOT EXISTS `quiz_certificates` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `titr` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitr` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bottom_right` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bottom_center` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature_image` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature_image_upload_id` bigint(20) UNSIGNED DEFAULT NULL,
  `logo_image` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo_image_upload_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_certificates_quiz_id_foreign` (`quiz_id`),
  KEY `quiz_certificates_signature_image_upload_id_foreign` (`signature_image_upload_id`),
  KEY `quiz_certificates_logo_image_upload_id_foreign` (`logo_image_upload_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_certificates`
--

INSERT INTO `quiz_certificates` (`id`, `quiz_id`, `titr`, `subtitr`, `bottom_right`, `bottom_center`, `text`, `signature_image`, `signature_image_upload_id`, `logo_image`, `logo_image_upload_id`, `created_at`, `updated_at`) VALUES
(1, 3, 'سرتیفیکت', 'متن زیر تیتر در اینجا', 'متن ست راست', 'متن وسط', 'توضیحات چند خطی در باره این ستیفیکیت و مزایا و موارد دیگر در اینجا قرار میگیرد', '5dd545d1558c0.jpg', 404, '5dd545cc23be0.jpg', 403, '2019-11-20 13:55:33', '2019-11-20 13:55:33'),
(5, 10, 'سرتیفیکت', 'متن زیر تیتر در اینجا', 'متن ست راست', 'متن وسط', 'توضیحات چند خطی در باره این ستیفیکیت و مزایا و موارد دیگر در اینجا قرار میگیرد\n    توضیحات چند خطی در باره این ستیفیکیت و مزایا و موارد دیگر در اینجا قرار میگیردتوضیحات چند خطی در باره این ستیفیکیت و مزایا و موارد دیگر در اینجا قرار میگیرد', '5dd7c800dd950.jpg', 437, '5dd7c7f4c3370.jpg', 436, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(6, 11, 'سرتیفیکت', 'متن زیر تیتر در اینجا', 'متن ست راست', 'متن وسط', 'توضیحات چند خطی در باره این ستیفیکیت و مزایا و موارد دیگر در اینجا قرار میگیرد\n    توضیحات چند خطی در باره این ستیفیکیت و مزایا و موارد دیگر در اینجا قرار میگیردتوضیحات چند خطی در باره این ستیفیکیت و مزایا و موارد دیگر در اینجا قرار میگیرد', '5dd7cee8ad3e0.png', 440, '5dd7cee290308.png', 439, '2019-11-22 12:05:40', '2019-11-22 12:05:40'),
(7, 14, 'متن سرتیتر در اینجا', 'متن زیر تیتر در اینجا', 'متن ست راست', 'متن وسط', 'توضیحات چند خطی در باره این ستیفیکیت و مزایا و موارد دیگر در اینجا قرار میگیرد', '5dda71726f798.jpg', 443, '5dda71643dab8.png', 442, '2019-11-24 12:03:00', '2019-11-24 12:03:00'),
(8, 15, 'ططط', 'متن زیر تیتر در اینجا', 'متن ست راست', 'متن وسط', 'توضیحات چند خطی در باره این ستیفیکیت و مزایا و موارد دیگر در اینجا قرار میگیرد', '5ddab7d6a5eb0.jpg', 450, '5ddab7ceda688.jpg', 449, '2019-11-24 17:03:22', '2019-11-24 17:03:22');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_plans`
--

DROP TABLE IF EXISTS `quiz_plans`;
CREATE TABLE IF NOT EXISTS `quiz_plans` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `original_price` int(11) DEFAULT NULL,
  `type` enum('normal','off') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_plans_quiz_id_foreign` (`quiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_plans`
--

INSERT INTO `quiz_plans` (`id`, `quiz_id`, `price`, `original_price`, `type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 10, 1000, NULL, 'normal', '2019-12-08 13:23:00', '2019-12-08 13:22:53', '2019-12-08 13:23:00'),
(2, 10, 1000, 5000, 'off', NULL, '2019-12-08 13:23:00', '2019-12-08 13:23:00'),
(3, 14, 6000, NULL, 'normal', NULL, '2019-12-09 16:51:56', '2019-12-09 16:51:56');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_plan_organs`
--

DROP TABLE IF EXISTS `quiz_plan_organs`;
CREATE TABLE IF NOT EXISTS `quiz_plan_organs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `r10` int(11) NOT NULL,
  `r30` int(11) NOT NULL,
  `r50` int(11) NOT NULL,
  `r100` int(11) NOT NULL,
  `r200` int(11) NOT NULL,
  `r300` int(11) NOT NULL,
  `r400` int(11) NOT NULL,
  `r500` int(11) NOT NULL,
  `r700` int(11) NOT NULL,
  `r1000` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quiz_plan_organs_quiz_id_unique` (`quiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_plan_organs`
--

INSERT INTO `quiz_plan_organs` (`id`, `quiz_id`, `r10`, `r30`, `r50`, `r100`, `r200`, `r300`, `r400`, `r500`, `r700`, `r1000`, `created_at`, `updated_at`) VALUES
(1, 10, 900000, 900000, 900000, 900000, 900000, 900000, 900000, 900000, 900000, 900000, '2019-12-08 13:23:35', '2019-12-08 13:23:35');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_point_groups`
--

DROP TABLE IF EXISTS `quiz_point_groups`;
CREATE TABLE IF NOT EXISTS `quiz_point_groups` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `certificate` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_point_groups_quiz_id_unique` (`quiz_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_point_groups`
--

INSERT INTO `quiz_point_groups` (`id`, `quiz_id`, `from`, `to`, `text`, `certificate`, `created_at`, `updated_at`) VALUES
(3, 2, 0, 10, 'شما رد شدین', 0, '2019-11-20 14:19:58', '2019-11-20 14:19:58'),
(4, 2, 10, 48, 'شما قبول شدین', 0, '2019-11-20 14:19:58', '2019-11-20 14:19:58'),
(9, 3, 0, 10, 'شما مردود شدین', 0, '2019-11-21 16:42:45', '2019-11-21 16:42:45'),
(10, 3, 10, 35, 'شما قبول شدین', 1, '2019-11-21 16:42:45', '2019-11-21 16:42:45'),
(17, 10, 1, 10, 'شما رد شدید', 0, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(18, 10, 10, 30, 'شما موفق شدید', 1, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(19, 11, 0, 10, 'شما رد شدین', 0, '2019-11-22 12:05:40', '2019-11-22 12:05:40'),
(20, 11, 10, 20, 'شما رد شدین', 0, '2019-11-22 12:05:40', '2019-11-22 12:05:40'),
(21, 14, 0, 10, 'مردود شدین', 0, '2019-11-24 11:58:01', '2019-11-24 11:58:01'),
(22, 14, 10, 20, 'قبول شدید', 1, '2019-11-24 11:58:01', '2019-11-24 11:58:01'),
(25, 15, 1, 2, 'طط', 0, '2019-11-24 17:02:47', '2019-11-24 17:02:47'),
(26, 15, 3, 4, 'طط', 0, '2019-11-24 17:02:47', '2019-11-24 17:02:47'),
(27, 16, 0, 10, 'شما مردود شدید', 0, '2019-11-25 12:01:36', '2019-11-25 12:01:36'),
(28, 16, 10, 20, 'شما قبول شدید', 1, '2019-11-25 12:01:36', '2019-11-25 12:01:36'),
(29, 17, 1, 10, 'اا', 0, '2019-11-25 17:07:24', '2019-11-25 17:07:24'),
(30, 17, 20, 30, 'طرزطرطز', 1, '2019-11-25 17:07:24', '2019-11-25 17:07:24');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_publish_confirms`
--

DROP TABLE IF EXISTS `quiz_publish_confirms`;
CREATE TABLE IF NOT EXISTS `quiz_publish_confirms` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `request_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quiz_publish_confirms_quiz_id_unique` (`quiz_id`),
  UNIQUE KEY `quiz_publish_confirms_request_id_unique` (`request_id`),
  KEY `quiz_publish_confirms_admin_id_foreign` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_publish_confirms`
--

INSERT INTO `quiz_publish_confirms` (`id`, `quiz_id`, `request_id`, `admin_id`, `created_at`, `updated_at`) VALUES
(1, 14, 5, 1, '2019-11-26 16:15:11', '2019-11-26 16:15:11');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_publish_requests`
--

DROP TABLE IF EXISTS `quiz_publish_requests`;
CREATE TABLE IF NOT EXISTS `quiz_publish_requests` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `confirm` tinyint(1) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `answer_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_publish_requests_quiz_id_foreign` (`quiz_id`),
  KEY `quiz_publish_requests_admin_id_foreign` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_publish_requests`
--

INSERT INTO `quiz_publish_requests` (`id`, `quiz_id`, `admin_id`, `confirm`, `text`, `answer_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 10, NULL, 0, NULL, NULL, NULL, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(2, 11, 1, 1, NULL, '2019-11-22 12:08:14', '2019-11-22 14:55:53', '2019-11-22 12:05:40', '2019-11-22 14:55:53'),
(3, 11, NULL, 0, NULL, NULL, NULL, '2019-11-22 14:55:53', '2019-11-22 14:55:53'),
(4, 14, NULL, 0, NULL, NULL, '2019-11-24 12:32:56', '2019-11-24 12:31:14', '2019-11-24 12:32:56'),
(5, 14, 1, 1, NULL, '2019-11-26 16:15:11', NULL, '2019-11-24 12:32:56', '2019-11-26 16:15:11');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

DROP TABLE IF EXISTS `quiz_questions`;
CREATE TABLE IF NOT EXISTS `quiz_questions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `title` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `point` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_questions_quiz_id_foreign` (`quiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_questions`
--

INSERT INTO `quiz_questions` (`id`, `quiz_id`, `title`, `point`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 1, 'عنوان سوال', 10, NULL, '2019-11-20 13:38:33', '2019-11-20 13:38:33'),
(4, 2, 'عنوان سوال', NULL, NULL, '2019-11-20 13:40:22', '2019-11-20 13:40:22'),
(5, 2, 'عنوان سوال2', NULL, NULL, '2019-11-20 13:46:48', '2019-11-20 13:46:48'),
(9, 3, 'عنوان سوال1', 5, NULL, '2019-11-20 13:52:45', '2019-11-20 13:52:45'),
(10, 3, 'عنوان سوال2', 10, NULL, '2019-11-20 13:52:45', '2019-11-20 13:52:45'),
(11, 3, 'عنوان سوال3', 20, NULL, '2019-11-20 13:52:45', '2019-11-20 13:52:45'),
(19, 10, 'سوال یک', NULL, NULL, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(20, 10, 'سوال دو', NULL, NULL, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(21, 10, 'سوال 3', NULL, NULL, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(22, 10, 'سوال 4', NULL, NULL, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(23, 10, 'سوال 5', NULL, NULL, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(24, 10, 'سوال 6', NULL, NULL, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(25, 11, 'عنوان سوال1', NULL, '2019-11-22 14:55:53', '2019-11-22 12:05:40', '2019-11-22 14:55:53'),
(26, 11, 'عنوان سوال2', NULL, '2019-11-22 14:55:53', '2019-11-22 12:05:40', '2019-11-22 14:55:53'),
(27, 11, 'عنوان سوال3', NULL, '2019-11-22 14:55:53', '2019-11-22 12:05:40', '2019-11-22 14:55:53'),
(28, 11, 'عنوان سوال4', NULL, '2019-11-22 14:55:53', '2019-11-22 12:05:40', '2019-11-22 14:55:53'),
(29, 11, 'عنوان سوال5', NULL, '2019-11-22 14:55:53', '2019-11-22 12:05:40', '2019-11-22 14:55:53'),
(30, 11, 'عنوان سوال6', NULL, '2019-11-22 14:55:53', '2019-11-22 12:05:40', '2019-11-22 14:55:53'),
(31, 11, 'عنوان سوال1', NULL, NULL, '2019-11-22 14:55:53', '2019-11-22 14:55:53'),
(32, 11, 'عنوان سوال2', NULL, NULL, '2019-11-22 14:55:53', '2019-11-22 14:55:53'),
(33, 11, 'عنوان سوال3', NULL, NULL, '2019-11-22 14:55:53', '2019-11-22 14:55:53'),
(34, 11, 'عنوان سوال4', NULL, NULL, '2019-11-22 14:55:53', '2019-11-22 14:55:53'),
(35, 11, 'عنوان سوال5', NULL, NULL, '2019-11-22 14:55:53', '2019-11-22 14:55:53'),
(36, 11, 'عنوان سوال6', NULL, NULL, '2019-11-22 14:55:53', '2019-11-22 14:55:53'),
(37, 14, 'عنوان سوال1', 1, '2019-11-24 12:33:54', '2019-11-24 11:44:20', '2019-11-24 12:33:54'),
(38, 14, 'عنوان سوال2', 2, '2019-11-24 12:33:54', '2019-11-24 11:44:20', '2019-11-24 12:33:54'),
(39, 14, 'عنوان سوال3', 3, '2019-11-24 12:33:54', '2019-11-24 11:44:20', '2019-11-24 12:33:54'),
(40, 14, 'عنوان سوال4', 4, '2019-11-24 12:33:54', '2019-11-24 11:44:20', '2019-11-24 12:33:54'),
(41, 14, 'عنوان سوال1', NULL, NULL, '2019-11-24 12:33:54', '2019-11-24 12:33:54'),
(42, 14, 'عنوان سوال2', NULL, NULL, '2019-11-24 12:33:54', '2019-11-24 12:33:54'),
(43, 14, 'عنوان سوال3', NULL, NULL, '2019-11-24 12:33:54', '2019-11-24 12:33:54'),
(44, 14, 'عنوان سوال4', NULL, NULL, '2019-11-24 12:33:54', '2019-11-24 12:33:54'),
(45, 15, 'یی', NULL, NULL, '2019-11-24 17:02:13', '2019-11-24 17:02:13'),
(46, 15, 'ی', NULL, NULL, '2019-11-24 17:02:13', '2019-11-24 17:02:13'),
(47, 16, 'عنوان سوال', 10, NULL, '2019-11-25 12:01:07', '2019-11-25 12:01:07'),
(48, 16, 'عنوان سوال', 10, NULL, '2019-11-25 12:01:07', '2019-11-25 12:01:07'),
(49, 17, 'عنوان سوال', NULL, NULL, '2019-11-25 17:07:00', '2019-11-25 17:07:00'),
(50, 17, 'یی', NULL, NULL, '2019-11-25 17:07:00', '2019-11-25 17:07:00'),
(51, 18, 'شش', NULL, NULL, '2019-11-27 16:54:30', '2019-11-27 16:54:30');

--
-- Triggers `quiz_questions`
--
DROP TRIGGER IF EXISTS `delete_quiz_questions`;
DELIMITER $$
CREATE TRIGGER `delete_quiz_questions` AFTER DELETE ON `quiz_questions` FOR EACH ROW BEGIN
            
                IF OLD.point IS NOT NULL AND  OLD.point > 0 THEN 
                    UPDATE quizzes SET question_point = question_point - OLD.point WHERE id  = OLD.quiz_id ;
                END IF ;
             
            END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_quiz_questions`;
DELIMITER $$
CREATE TRIGGER `insert_quiz_questions` AFTER INSERT ON `quiz_questions` FOR EACH ROW BEGIN
            
                IF NEW.point IS NOT NULL AND  NEW.point > 0 THEN 
                    UPDATE quizzes SET question_point = question_point + NEW.point WHERE id  = NEW.quiz_id ;
                END IF ;
             
            END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `update_quiz_questions`;
DELIMITER $$
CREATE TRIGGER `update_quiz_questions` AFTER UPDATE ON `quiz_questions` FOR EACH ROW BEGIN
            
                IF OLD.deleted_at IS NULL AND NEW.deleted_at IS NOT NULL AND NEW.point IS NOT NULL AND  NEW.point > 0 THEN 
                    UPDATE quizzes SET question_point = question_point - NEW.point WHERE id  = NEW.quiz_id ;
                END IF ;
             
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_ratings`
--

DROP TABLE IF EXISTS `quiz_ratings`;
CREATE TABLE IF NOT EXISTS `quiz_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_quiz_id` bigint(20) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quiz_ratings_quiz_id_user_id_unique` (`quiz_id`,`user_id`),
  KEY `quiz_ratings_user_id_foreign` (`user_id`),
  KEY `quiz_ratings_user_quiz_id_foreign` (`user_quiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_ratings`
--

INSERT INTO `quiz_ratings` (`id`, `quiz_id`, `user_id`, `user_quiz_id`, `text`, `rate`, `created_at`, `updated_at`) VALUES
(1, 11, 1, 4, 'خیلی خوب بود ... خیلی بد نبود', 4, '2019-11-22 12:52:01', '2019-11-22 12:52:01');

--
-- Triggers `quiz_ratings`
--
DROP TRIGGER IF EXISTS `delete_quiz_ratings`;
DELIMITER $$
CREATE TRIGGER `delete_quiz_ratings` BEFORE DELETE ON `quiz_ratings` FOR EACH ROW BEGIN
                
                UPDATE quizzes SET stat_rate_count = stat_rate_count - 1 , stat_rate_total = stat_rate_total - OLD.rate  WHERE id = OLD.quiz_id ; 

            END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_quiz_ratings`;
DELIMITER $$
CREATE TRIGGER `insert_quiz_ratings` AFTER INSERT ON `quiz_ratings` FOR EACH ROW BEGIN
                
                UPDATE quizzes SET stat_rate_count = stat_rate_count + 1 , stat_rate_total = stat_rate_total + NEW.rate  WHERE id = NEW.quiz_id ; 

            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_views`
--

DROP TABLE IF EXISTS `quiz_views`;
CREATE TABLE IF NOT EXISTS `quiz_views` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_views_user_id_foreign` (`user_id`),
  KEY `quiz_views_quiz_id_foreign` (`quiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_views`
--

INSERT INTO `quiz_views` (`id`, `user_id`, `quiz_id`, `created_at`, `updated_at`) VALUES
(1, 1, 11, '2019-11-22 13:42:37', '2019-11-22 13:42:37'),
(2, 1, 11, '2019-11-22 13:42:41', '2019-11-22 13:42:41'),
(3, 1, 11, '2019-11-22 13:42:43', '2019-11-22 13:42:43'),
(4, 1, 11, '2019-11-22 14:22:56', '2019-11-22 14:22:56'),
(5, 1, 14, '2019-11-26 16:28:39', '2019-11-26 16:28:39'),
(6, 1, 14, '2019-11-26 16:28:55', '2019-11-26 16:28:55'),
(7, 1, 14, '2019-12-08 16:44:12', '2019-12-08 16:44:12'),
(8, 1, 14, '2019-12-08 17:07:17', '2019-12-08 17:07:17'),
(9, 1, 14, '2019-12-08 17:35:13', '2019-12-08 17:35:13'),
(10, 1, 14, '2019-12-08 17:36:10', '2019-12-08 17:36:10'),
(11, 1, 14, '2019-12-08 17:36:18', '2019-12-08 17:36:18'),
(12, 1, 14, '2019-12-09 16:51:33', '2019-12-09 16:51:33'),
(13, 1, 14, '2019-12-09 16:53:37', '2019-12-09 16:53:37'),
(14, 1, 14, '2019-12-09 16:53:41', '2019-12-09 16:53:41');

--
-- Triggers `quiz_views`
--
DROP TRIGGER IF EXISTS `insert_quiz_views`;
DELIMITER $$
CREATE TRIGGER `insert_quiz_views` AFTER INSERT ON `quiz_views` FOR EACH ROW BEGIN
                UPDATE quizzes SET stat_views = stat_views + 1 WHERE id = NEW.quiz_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `seminars`
--

DROP TABLE IF EXISTS `seminars`;
CREATE TABLE IF NOT EXISTS `seminars` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('seminar','class','conference') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_id` bigint(20) UNSIGNED DEFAULT NULL,
  `video` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_upload_id` int(11) DEFAULT NULL,
  `title` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `jest` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  `durration` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stat_students` int(11) NOT NULL,
  `stat_views` int(11) NOT NULL,
  `stat_sold` int(11) NOT NULL,
  `stat_wished` int(11) NOT NULL,
  `stat_rate_count` int(11) NOT NULL,
  `stat_rate_total` int(11) NOT NULL,
  `has_quiz` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seminars_upload_id_unique` (`upload_id`),
  KEY `seminars_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seminars`
--

INSERT INTO `seminars` (`id`, `type`, `user_id`, `slug`, `url`, `image`, `upload_id`, `video`, `video_upload_id`, `title`, `address`, `jest`, `text`, `capacity`, `durration`, `deleted_at`, `created_at`, `updated_at`, `stat_students`, `stat_views`, `stat_sold`, `stat_wished`, `stat_rate_count`, `stat_rate_total`, `has_quiz`) VALUES
(1, 'seminar', 1, '', '', '5da5e57a97db0.png', 82, '', 0, 'عنوان همایش', 'آدرس', 'توضیحات', 'توضیحات کامل', 1, '10', '2019-10-15 11:58:07', '2019-10-15 11:56:24', '2019-10-15 11:58:07', 0, 0, 0, 0, 0, 0, 0),
(2, 'seminar', 1, '', '', '5da5e59852850.png', 83, '', 0, 'عنوان همایش', 'آدرس', 'توضیحات کوتاه', 'توضیحات کامل', 10, '2', '2019-10-24 13:17:41', '2019-10-15 11:58:32', '2019-10-24 13:17:41', 0, 0, 0, 0, 0, 0, 0),
(3, 'seminar', 1, '', '', '5db1d3cb932b0.jpg', 211, '', 0, 'کلاس تست کنترل کیفیت', 'آدرس کلاس ما در اینجا', 'یک سری توضیحات کوتاه در اینجا قرار میگیرند', 'توضیحات کامل در اینجا قرار میگیرند', 10, '11', '2019-10-24 13:19:58', '2019-10-24 13:12:44', '2019-10-24 13:19:58', 0, 0, 0, 0, 0, 0, 0),
(4, 'seminar', 1, '', '', '5db1d66b8c550.jpg', 212, '', 0, 'تست کیفیت', 'آدرس', 'توضیحات کوتاه', 'توضیحات کامل', 10, '12', '2019-10-31 18:46:14', '2019-10-24 13:21:29', '2019-10-31 18:46:14', 0, 0, 0, 0, 0, 0, 0),
(5, 'seminar', 1, '', '', '5dbaf6f2ef4e8.jpg', 294, '', 0, 'تست پروگ122', 'آدرس محل برگزاری22', 'توضیحات کوتاه', 'توضیحات کامل', 10, '20', NULL, '2019-10-31 15:00:25', '2019-10-31 15:11:27', 1, 0, 1000, 0, 0, 0, 0),
(6, 'seminar', 1, 'tst-ba-kanfirm', 'دسته یک/زیر دسته 1/tst-ba-kanfirm', '5dc8b5f509c40.jpg', 354, '5dc8b5fcefbf0.jpg', 355, 'تست با کانفیرم', 'آدرس محل برگزاری', 'توضیحات کوتاه', 'توضیحات کامل', 10, '5', NULL, '2019-11-11 01:14:59', '2019-11-11 01:14:59', 0, 0, 0, 0, 0, 0, 0),
(7, 'seminar', 1, 'tst-bkhsh-dar', 'دسته یک/زیر دسته 1/tst-bkhsh-dar', '5ddabbdbd77a8.jpg', 451, '5ddabbe6282f8.zip', 452, 'تست بخش دار', 'آدرس محل برگزاری', 'توضیحات کوتاه', 'توضیحات کامل', 10, '2', NULL, '2019-11-24 16:33:16', '2019-11-24 17:20:48', 0, 0, 0, 0, 0, 0, 0),
(8, 'seminar', 1, 'tst-ba-klas1', 'دسته یک/زیر دسته 1/tst-ba-klas1', '5ddbc2da6c1b0.jpg', 453, '5ddbc2df94250.mp4', 454, 'تست با کلاس', 'خیابان یک کوچه دو', 'توضیحات کوتاه', 'توضیحات کامل', NULL, '10', NULL, '2019-11-25 11:19:37', '2019-11-25 12:02:41', 0, 0, 0, 0, 0, 0, 0),
(9, 'seminar', 1, 'klas-ba-oizard-jdid1', 'دسته یک/زیر دسته 1/klas-ba-oizard-jdid1', '5ddd4cac6ca48.png', 455, '5ddd4cb3bdf10.mp4', 456, 'کلاس با ویزارد جدید', 'آدرس محل برگزاری', 'توضیحات کوتاه', 'توضیحات کامل', NULL, '10', NULL, '2019-11-25 17:02:58', '2019-11-26 16:03:49', 3, 74, 10000, 1, 1, 4, 0),
(10, 'class', 1, 'ba-taip', 'دسته یک/زیر دسته 1/ba-taip', '5ddea568e6dc0.png', 461, '5ddea581d9ad0.mp4', 462, 'با تایپ', '', 'توضیحات کوتاه', 'توضیحات کامل', NULL, '', NULL, '2019-11-27 16:34:20', '2019-11-27 16:34:20', 0, 0, 0, 0, 0, 0, 0),
(11, 'seminar', 1, 'tst-ba-aazmon', 'دسته یک/زیر دسته 1/tst-ba-aazmon', '5ddea74c866c8.jpg', 463, '5ddea75366ee0.mp4', 464, 'تست با آزمون', '', 'توضیحات کوتاه', 'توضیحات کامل', NULL, '', NULL, '2019-11-27 16:42:06', '2019-11-27 16:55:56', 0, 0, 0, 0, 0, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `seminar_categories`
--

DROP TABLE IF EXISTS `seminar_categories`;
CREATE TABLE IF NOT EXISTS `seminar_categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `seminar_id` bigint(20) UNSIGNED NOT NULL,
  `master` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seminar_categories_category_id_foreign` (`category_id`),
  KEY `seminar_categories_seminar_id_foreign` (`seminar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seminar_categories`
--

INSERT INTO `seminar_categories` (`id`, `category_id`, `seminar_id`, `master`, `created_at`, `updated_at`) VALUES
(1, 6, 5, 1, '2019-10-31 15:00:25', '2019-10-31 15:00:25'),
(2, 7, 5, 0, '2019-10-31 15:00:25', '2019-10-31 15:00:25'),
(3, 6, 6, 1, '2019-11-11 01:14:59', '2019-11-11 01:14:59'),
(4, 7, 6, 0, '2019-11-11 01:14:59', '2019-11-11 01:14:59'),
(9, 6, 7, 1, '2019-11-24 17:20:48', '2019-11-24 17:20:48'),
(10, 7, 7, 0, '2019-11-24 17:20:48', '2019-11-24 17:20:48'),
(13, 6, 8, 1, '2019-11-25 12:02:41', '2019-11-25 12:02:41'),
(14, 7, 8, 0, '2019-11-25 12:02:42', '2019-11-25 12:02:42'),
(17, 6, 9, 1, '2019-11-26 16:03:49', '2019-11-26 16:03:49'),
(18, 7, 9, 0, '2019-11-26 16:03:49', '2019-11-26 16:03:49'),
(19, 6, 10, 1, '2019-11-27 16:34:20', '2019-11-27 16:34:20'),
(20, 7, 10, 0, '2019-11-27 16:34:20', '2019-11-27 16:34:20'),
(21, 6, 11, 1, '2019-11-27 16:42:06', '2019-11-27 16:42:06'),
(22, 7, 11, 0, '2019-11-27 16:42:06', '2019-11-27 16:42:06');

-- --------------------------------------------------------

--
-- Table structure for table `seminar_dates`
--

DROP TABLE IF EXISTS `seminar_dates`;
CREATE TABLE IF NOT EXISTS `seminar_dates` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seminar_id` bigint(20) UNSIGNED NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `capacity` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seminar_dates_seminar_id_foreign` (`seminar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seminar_dates`
--

INSERT INTO `seminar_dates` (`id`, `seminar_id`, `date_from`, `date_to`, `capacity`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, '0000-00-00', '0000-00-00', 0, '2019-10-15 11:57:56', '2019-10-15 11:56:24', '2019-10-15 11:57:56'),
(2, 1, '0000-00-00', '0000-00-00', 0, '2019-10-15 11:57:56', '2019-10-15 11:56:24', '2019-10-15 11:57:56'),
(3, 1, '0000-00-00', '0000-00-00', 0, '2019-10-15 11:58:04', '2019-10-15 11:57:56', '2019-10-15 11:58:04'),
(4, 1, '0000-00-00', '0000-00-00', 0, '2019-10-15 11:58:04', '2019-10-15 11:57:56', '2019-10-15 11:58:04'),
(5, 1, '0000-00-00', '0000-00-00', 0, '2019-10-15 11:58:07', '2019-10-15 11:58:04', '2019-10-15 11:58:07'),
(6, 1, '0000-00-00', '0000-00-00', 0, '2019-10-15 11:58:07', '2019-10-15 11:58:04', '2019-10-15 11:58:07'),
(7, 2, '0000-00-00', '0000-00-00', 0, '2019-10-24 13:17:41', '2019-10-15 11:58:32', '2019-10-24 13:17:41'),
(8, 3, '0000-00-00', '0000-00-00', 0, '2019-10-24 13:19:58', '2019-10-24 13:12:44', '2019-10-24 13:19:58'),
(9, 3, '0000-00-00', '0000-00-00', 0, '2019-10-24 13:19:58', '2019-10-24 13:12:44', '2019-10-24 13:19:58'),
(10, 4, '0000-00-00', '0000-00-00', 0, '2019-10-24 13:25:16', '2019-10-24 13:21:29', '2019-10-24 13:25:16'),
(11, 4, '0000-00-00', '0000-00-00', 0, '2019-10-24 13:25:16', '2019-10-24 13:21:29', '2019-10-24 13:25:16'),
(12, 4, '0000-00-00', '0000-00-00', 0, '2019-10-31 15:07:54', '2019-10-24 13:25:16', '2019-10-31 15:07:54'),
(13, 4, '0000-00-00', '0000-00-00', 0, '2019-10-31 15:07:54', '2019-10-24 13:25:17', '2019-10-31 15:07:54'),
(14, 4, '0000-00-00', '0000-00-00', 0, '2019-10-31 15:07:54', '2019-10-24 13:25:17', '2019-10-31 15:07:54'),
(15, 5, '0000-00-00', '0000-00-00', 0, '2019-10-31 15:07:38', '2019-10-31 15:00:25', '2019-10-31 15:07:38'),
(16, 5, '0000-00-00', '0000-00-00', 0, '2019-10-31 15:08:11', '2019-10-31 15:07:38', '2019-10-31 15:08:11'),
(17, 4, '0000-00-00', '0000-00-00', 0, '2019-10-31 18:46:14', '2019-10-31 15:07:54', '2019-10-31 18:46:14'),
(18, 4, '0000-00-00', '0000-00-00', 0, '2019-10-31 18:46:14', '2019-10-31 15:07:54', '2019-10-31 18:46:14'),
(19, 4, '0000-00-00', '0000-00-00', 0, '2019-10-31 18:46:14', '2019-10-31 15:07:54', '2019-10-31 18:46:14'),
(20, 5, '0000-00-00', '0000-00-00', 0, '2019-10-31 15:10:22', '2019-10-31 15:08:11', '2019-10-31 15:10:22'),
(21, 5, '0000-00-00', '0000-00-00', 0, '2019-10-31 15:11:16', '2019-10-31 15:10:22', '2019-10-31 15:11:16'),
(22, 5, '0000-00-00', '0000-00-00', 0, '2019-10-31 15:11:27', '2019-10-31 15:11:16', '2019-10-31 15:11:27'),
(23, 5, '0000-00-00', '0000-00-00', 0, NULL, '2019-10-31 15:11:27', '2019-10-31 15:11:27'),
(24, 6, '0000-00-00', '0000-00-00', 0, NULL, '2019-11-11 01:14:59', '2019-11-11 01:14:59'),
(25, 7, '0000-00-00', '0000-00-00', 0, NULL, '2019-11-24 16:49:03', '2019-11-24 16:49:03'),
(26, 7, '0000-00-00', '0000-00-00', 0, NULL, '2019-11-24 16:49:03', '2019-11-24 16:49:03'),
(27, 8, '2019-11-27', '2019-11-29', 2, '2019-11-25 11:56:38', '2019-11-25 11:56:38', '2019-11-25 11:56:38'),
(28, 8, '2019-11-27', '2019-11-29', 2, '2019-11-25 11:59:00', '2019-11-25 11:56:38', '2019-11-25 11:59:00'),
(29, 8, '2019-11-27', '2019-11-29', 2, '2019-11-25 11:59:00', '2019-11-25 11:59:00', '2019-11-25 11:59:00'),
(30, 8, '2019-12-08', '2019-12-14', 5, '2019-11-25 11:59:00', '2019-11-25 11:59:00', '2019-11-25 11:59:00'),
(31, 8, '2019-11-27', '2019-11-29', 2, '2019-11-25 12:00:07', '2019-11-25 11:59:00', '2019-11-25 12:00:07'),
(32, 8, '2019-12-08', '2019-12-14', 5, '2019-11-25 12:00:07', '2019-11-25 11:59:00', '2019-11-25 12:00:07'),
(33, 8, '2019-11-27', '2019-11-29', 2, '2019-11-25 12:00:07', '2019-11-25 12:00:07', '2019-11-25 12:00:07'),
(34, 8, '2019-12-08', '2019-12-14', 5, '2019-11-25 12:00:07', '2019-11-25 12:00:07', '2019-11-25 12:00:07'),
(35, 8, '2019-11-27', '2019-11-29', 2, NULL, '2019-11-25 12:00:07', '2019-11-25 12:00:07'),
(36, 8, '2019-12-08', '2019-12-14', 5, NULL, '2019-11-25 12:00:07', '2019-11-25 12:00:07');

-- --------------------------------------------------------

--
-- Table structure for table `seminar_galleries`
--

DROP TABLE IF EXISTS `seminar_galleries`;
CREATE TABLE IF NOT EXISTS `seminar_galleries` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seminar_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('image','video') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seminar_galleries_seminar_id_foreign` (`seminar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seminar_galleries`
--

INSERT INTO `seminar_galleries` (`id`, `seminar_id`, `type`, `created_at`, `updated_at`) VALUES
(11, 2, 'image', '2019-10-15 12:44:22', '2019-10-15 12:44:22'),
(12, 2, 'video', '2019-10-15 12:44:22', '2019-10-15 12:44:22'),
(13, 2, 'image', '2019-10-15 12:44:22', '2019-10-15 12:44:22'),
(14, 2, 'image', '2019-10-15 12:44:22', '2019-10-15 12:44:22'),
(15, 2, 'image', '2019-10-15 12:44:22', '2019-10-15 12:44:22'),
(16, 2, 'image', '2019-10-15 12:44:22', '2019-10-15 12:44:22'),
(23, 4, 'image', '2019-10-24 13:44:59', '2019-10-24 13:44:59'),
(24, 4, 'image', '2019-10-24 13:44:59', '2019-10-24 13:44:59'),
(25, 4, 'video', '2019-10-24 13:44:59', '2019-10-24 13:44:59'),
(28, 9, 'image', '2019-11-27 16:11:12', '2019-11-27 16:11:12'),
(29, 9, 'video', '2019-11-27 16:11:12', '2019-11-27 16:11:12'),
(30, 9, 'image', '2019-11-27 16:11:12', '2019-11-27 16:11:12');

-- --------------------------------------------------------

--
-- Table structure for table `seminar_gallery_images`
--

DROP TABLE IF EXISTS `seminar_gallery_images`;
CREATE TABLE IF NOT EXISTS `seminar_gallery_images` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gallery_id` bigint(20) UNSIGNED NOT NULL,
  `upload_id` bigint(20) UNSIGNED NOT NULL,
  `image` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seminar_gallery_images_gallery_id_unique` (`gallery_id`),
  UNIQUE KEY `seminar_gallery_images_upload_id_unique` (`upload_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seminar_gallery_images`
--

INSERT INTO `seminar_gallery_images` (`id`, `gallery_id`, `upload_id`, `image`, `created_at`, `updated_at`) VALUES
(9, 11, 94, '5da5ef08b8d08.png', '2019-10-15 12:44:22', '2019-10-15 12:44:22'),
(10, 13, 96, '5da5efbe81650.jpg', '2019-10-15 12:44:22', '2019-10-15 12:44:22'),
(11, 14, 97, '5da5efc6ac5d0.png', '2019-10-15 12:44:22', '2019-10-15 12:44:22'),
(12, 15, 98, '5da5efcb591c8.png', '2019-10-15 12:44:22', '2019-10-15 12:44:22'),
(13, 16, 99, '5da5f05cdfa20.jpg', '2019-10-15 12:44:22', '2019-10-15 12:44:22'),
(20, 23, 215, '5db1d9dd63510.jpg', '2019-10-24 13:44:59', '2019-10-24 13:44:59'),
(21, 24, 216, '5db1d9e793a80.jpg', '2019-10-24 13:44:59', '2019-10-24 13:44:59'),
(23, 28, 457, '5dde9fe375d28.jpg', '2019-11-27 16:11:12', '2019-11-27 16:11:12'),
(24, 30, 459, '5ddea00f87e38.jpg', '2019-11-27 16:11:12', '2019-11-27 16:11:12');

-- --------------------------------------------------------

--
-- Table structure for table `seminar_gallery_videos`
--

DROP TABLE IF EXISTS `seminar_gallery_videos`;
CREATE TABLE IF NOT EXISTS `seminar_gallery_videos` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gallery_id` bigint(20) UNSIGNED NOT NULL,
  `upload_id` bigint(20) UNSIGNED NOT NULL,
  `video` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seminar_gallery_videos_gallery_id_unique` (`gallery_id`),
  UNIQUE KEY `seminar_gallery_videos_upload_id_unique` (`upload_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seminar_gallery_videos`
--

INSERT INTO `seminar_gallery_videos` (`id`, `gallery_id`, `upload_id`, `video`, `created_at`, `updated_at`) VALUES
(3, 12, 95, '5da5efb701b58.mp4', '2019-10-15 12:44:22', '2019-10-15 12:44:22'),
(4, 25, 217, '5db1dc10e2c20.mp4', '2019-10-24 13:44:59', '2019-10-24 13:44:59'),
(6, 29, 458, '5dde9ff083018.mp4', '2019-11-27 16:11:12', '2019-11-27 16:11:12');

-- --------------------------------------------------------

--
-- Table structure for table `seminar_plans`
--

DROP TABLE IF EXISTS `seminar_plans`;
CREATE TABLE IF NOT EXISTS `seminar_plans` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seminar_id` bigint(20) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `original_price` int(11) DEFAULT NULL,
  `type` enum('normal','off') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seminar_plans_seminar_id_foreign` (`seminar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seminar_plans`
--

INSERT INTO `seminar_plans` (`id`, `seminar_id`, `price`, `original_price`, `type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 5, 1000, NULL, 'normal', '2019-12-01 17:49:38', '2019-12-01 17:49:29', '2019-12-01 17:49:38'),
(2, 5, 5000, NULL, 'normal', '2019-12-01 17:49:54', '2019-12-01 17:49:38', '2019-12-01 17:49:54'),
(3, 5, 8000, 15000, 'off', NULL, '2019-12-01 17:49:54', '2019-12-01 17:49:54'),
(4, 9, 8000, NULL, 'normal', NULL, '2019-12-09 16:50:36', '2019-12-09 16:50:36');

-- --------------------------------------------------------

--
-- Table structure for table `seminar_plan_organs`
--

DROP TABLE IF EXISTS `seminar_plan_organs`;
CREATE TABLE IF NOT EXISTS `seminar_plan_organs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seminar_id` bigint(20) UNSIGNED NOT NULL,
  `r10` int(11) NOT NULL,
  `r30` int(11) NOT NULL,
  `r50` int(11) NOT NULL,
  `r100` int(11) NOT NULL,
  `r200` int(11) NOT NULL,
  `r300` int(11) NOT NULL,
  `r400` int(11) NOT NULL,
  `r500` int(11) NOT NULL,
  `r700` int(11) NOT NULL,
  `r1000` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seminar_plan_organs_seminar_id_unique` (`seminar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seminar_plan_organs`
--

INSERT INTO `seminar_plan_organs` (`id`, `seminar_id`, `r10`, `r30`, `r50`, `r100`, `r200`, `r300`, `r400`, `r500`, `r700`, `r1000`, `created_at`, `updated_at`) VALUES
(1, 5, 1000, 1000, 50000, 100000, 200000, 300000, 400000, 500000, 700000, 10000000, '2019-12-01 17:50:26', '2019-12-01 17:50:26');

-- --------------------------------------------------------

--
-- Table structure for table `seminar_publish_confirms`
--

DROP TABLE IF EXISTS `seminar_publish_confirms`;
CREATE TABLE IF NOT EXISTS `seminar_publish_confirms` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seminar_id` bigint(20) UNSIGNED NOT NULL,
  `request_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seminar_publish_confirms_seminar_id_unique` (`seminar_id`),
  UNIQUE KEY `seminar_publish_confirms_request_id_unique` (`request_id`),
  KEY `seminar_publish_confirms_admin_id_foreign` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seminar_publish_confirms`
--

INSERT INTO `seminar_publish_confirms` (`id`, `seminar_id`, `request_id`, `admin_id`, `created_at`, `updated_at`) VALUES
(1, 9, 5, 1, '2019-11-26 16:18:06', '2019-11-26 16:18:06');

-- --------------------------------------------------------

--
-- Table structure for table `seminar_publish_requests`
--

DROP TABLE IF EXISTS `seminar_publish_requests`;
CREATE TABLE IF NOT EXISTS `seminar_publish_requests` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seminar_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `confirm` tinyint(1) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `answer_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seminar_publish_requests_seminar_id_foreign` (`seminar_id`),
  KEY `seminar_publish_requests_admin_id_foreign` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seminar_publish_requests`
--

INSERT INTO `seminar_publish_requests` (`id`, `seminar_id`, `admin_id`, `confirm`, `text`, `answer_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 6, NULL, 0, NULL, NULL, NULL, '2019-11-11 01:14:59', '2019-11-11 01:14:59'),
(3, 7, NULL, 0, NULL, NULL, NULL, '2019-11-24 17:20:48', '2019-11-24 17:20:48'),
(4, 8, NULL, 0, NULL, NULL, NULL, '2019-11-25 12:02:42', '2019-11-25 12:02:42'),
(5, 9, 1, 1, NULL, '2019-11-26 16:18:06', NULL, '2019-11-26 16:03:49', '2019-11-26 16:18:06');

-- --------------------------------------------------------

--
-- Table structure for table `seminar_quizzes`
--

DROP TABLE IF EXISTS `seminar_quizzes`;
CREATE TABLE IF NOT EXISTS `seminar_quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `seminar_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seminar_quizzes_quiz_id_unique` (`quiz_id`),
  UNIQUE KEY `seminar_quizzes_seminar_id_unique` (`seminar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seminar_quizzes`
--

INSERT INTO `seminar_quizzes` (`id`, `quiz_id`, `seminar_id`, `created_at`, `updated_at`) VALUES
(1, 15, 7, '2019-11-24 17:02:13', '2019-11-24 17:02:13'),
(2, 16, 8, '2019-11-25 12:01:07', '2019-11-25 12:01:07'),
(3, 17, 9, '2019-11-25 17:07:00', '2019-11-25 17:07:00');

-- --------------------------------------------------------

--
-- Table structure for table `seminar_ratings`
--

DROP TABLE IF EXISTS `seminar_ratings`;
CREATE TABLE IF NOT EXISTS `seminar_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seminar_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_seminars_id` bigint(20) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seminar_ratings_seminar_id_user_id_unique` (`seminar_id`,`user_id`),
  KEY `seminar_ratings_user_id_foreign` (`user_id`),
  KEY `seminar_ratings_user_seminars_id_foreign` (`user_seminars_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seminar_ratings`
--

INSERT INTO `seminar_ratings` (`id`, `seminar_id`, `user_id`, `user_seminars_id`, `text`, `rate`, `created_at`, `updated_at`) VALUES
(1, 9, 1, 3, 'ssss', 4, '2019-11-27 15:54:57', '2019-11-27 15:54:57');

--
-- Triggers `seminar_ratings`
--
DROP TRIGGER IF EXISTS `delete_seminar_ratings`;
DELIMITER $$
CREATE TRIGGER `delete_seminar_ratings` BEFORE DELETE ON `seminar_ratings` FOR EACH ROW BEGIN
                
                UPDATE seminars SET stat_rate_count = stat_rate_count - 1 , stat_rate_total = stat_rate_total - OLD.rate  WHERE id = OLD.seminar_id ; 

            END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_seminar_ratings`;
DELIMITER $$
CREATE TRIGGER `insert_seminar_ratings` AFTER INSERT ON `seminar_ratings` FOR EACH ROW BEGIN
                
                UPDATE seminars SET stat_rate_count = stat_rate_count + 1 , stat_rate_total = stat_rate_total + NEW.rate  WHERE id = NEW.seminar_id ; 

            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `seminar_shedules`
--

DROP TABLE IF EXISTS `seminar_shedules`;
CREATE TABLE IF NOT EXISTS `seminar_shedules` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seminar_id` bigint(20) UNSIGNED NOT NULL,
  `capacity` int(11) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seminar_shedules_seminar_id_foreign` (`seminar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seminar_shedules`
--

INSERT INTO `seminar_shedules` (`id`, `seminar_id`, `capacity`, `date_from`, `date_to`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 8, 9, '2019-11-26', '2019-12-21', '2019-11-25 16:53:17', '2019-11-25 14:31:36', '2019-11-25 16:53:17'),
(2, 8, 8, '2019-11-27', '2019-12-21', '2019-11-25 17:01:41', '2019-11-25 16:56:29', '2019-11-25 17:01:41'),
(3, 9, 1000, '2019-11-27', '2019-12-21', NULL, '2019-11-25 17:03:15', '2019-11-25 17:06:14'),
(4, 9, 5, '2019-11-27', '2019-12-21', '2019-11-26 16:02:22', '2019-11-26 16:02:06', '2019-11-26 16:02:22');

-- --------------------------------------------------------

--
-- Table structure for table `seminar_shedule_dates`
--

DROP TABLE IF EXISTS `seminar_shedule_dates`;
CREATE TABLE IF NOT EXISTS `seminar_shedule_dates` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seminar_shedule_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seminar_shedule_dates_seminar_shedule_id_foreign` (`seminar_shedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seminar_shedule_dates`
--

INSERT INTO `seminar_shedule_dates` (`id`, `seminar_shedule_id`, `date`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-11-26', '2019-11-25 16:47:04', '2019-11-25 16:00:13', '2019-11-25 16:47:04'),
(2, 1, '2019-12-17', NULL, '2019-11-25 16:03:27', '2019-11-25 16:49:48'),
(3, 2, '2019-11-26', NULL, '2019-11-25 16:57:07', '2019-11-25 16:57:07'),
(4, 2, '2019-11-27', NULL, '2019-11-25 16:57:07', '2019-11-25 16:57:07'),
(5, 2, '2019-11-28', '2019-11-25 16:57:51', '2019-11-25 16:57:23', '2019-11-25 16:57:51'),
(6, 2, '2019-11-29', '2019-11-25 16:59:02', '2019-11-25 16:58:29', '2019-11-25 16:59:02'),
(7, 2, '2019-12-09', NULL, '2019-11-25 16:59:23', '2019-11-25 16:59:23'),
(8, 2, '2019-12-21', '2019-11-25 17:01:12', '2019-11-25 17:01:08', '2019-11-25 17:01:12'),
(9, 3, '2019-11-27', NULL, '2019-11-25 17:03:56', '2019-11-25 17:03:56'),
(10, 3, '2019-11-28', NULL, '2019-11-25 17:03:56', '2019-11-25 17:03:56'),
(11, 3, '2019-11-30', '2019-11-25 17:05:05', '2019-11-25 17:04:15', '2019-11-25 17:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `seminar_shedule_times`
--

DROP TABLE IF EXISTS `seminar_shedule_times`;
CREATE TABLE IF NOT EXISTS `seminar_shedule_times` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seminar_shedule_date_id` bigint(20) UNSIGNED NOT NULL,
  `from` tinyint(4) NOT NULL,
  `to` tinyint(4) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seminar_shedule_times_seminar_shedule_date_id_foreign` (`seminar_shedule_date_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seminar_shedule_times`
--

INSERT INTO `seminar_shedule_times` (`id`, `seminar_shedule_date_id`, `from`, `to`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, NULL, '2019-11-25 16:00:13', '2019-11-25 16:00:13'),
(3, 2, 1, 2, '2019-11-25 16:49:48', '2019-11-25 16:23:56', '2019-11-25 16:49:48'),
(4, 2, 2, 3, '2019-11-25 16:49:48', '2019-11-25 16:23:56', '2019-11-25 16:49:48'),
(5, 2, 3, 4, '2019-11-25 16:49:48', '2019-11-25 16:23:56', '2019-11-25 16:49:48'),
(6, 2, 1, 2, NULL, '2019-11-25 16:49:48', '2019-11-25 16:49:48'),
(7, 2, 2, 3, NULL, '2019-11-25 16:49:48', '2019-11-25 16:49:48'),
(8, 2, 3, 4, NULL, '2019-11-25 16:49:48', '2019-11-25 16:49:48'),
(9, 3, 1, 2, '2019-11-25 16:58:11', '2019-11-25 16:57:07', '2019-11-25 16:58:11'),
(10, 3, 2, 3, '2019-11-25 16:58:11', '2019-11-25 16:57:07', '2019-11-25 16:58:11'),
(11, 4, 1, 2, NULL, '2019-11-25 16:57:07', '2019-11-25 16:57:07'),
(12, 5, 5, 8, NULL, '2019-11-25 16:57:23', '2019-11-25 16:57:23'),
(13, 3, 1, 2, NULL, '2019-11-25 16:58:11', '2019-11-25 16:58:11'),
(14, 3, 2, 3, NULL, '2019-11-25 16:58:11', '2019-11-25 16:58:11'),
(15, 3, 4, 5, NULL, '2019-11-25 16:58:11', '2019-11-25 16:58:11'),
(16, 6, 5, 6, NULL, '2019-11-25 16:58:29', '2019-11-25 16:58:29'),
(17, 7, 1, 2, NULL, '2019-11-25 16:59:23', '2019-11-25 16:59:23'),
(18, 8, 1, 2, NULL, '2019-11-25 17:01:08', '2019-11-25 17:01:08'),
(19, 9, 1, 2, NULL, '2019-11-25 17:03:56', '2019-11-25 17:03:56'),
(20, 9, 2, 3, NULL, '2019-11-25 17:03:56', '2019-11-25 17:03:56'),
(21, 10, 1, 2, NULL, '2019-11-25 17:03:56', '2019-11-25 17:03:56'),
(22, 10, 2, 3, NULL, '2019-11-25 17:03:56', '2019-11-25 17:03:56'),
(23, 10, 4, 5, NULL, '2019-11-25 17:03:56', '2019-11-25 17:03:56'),
(24, 11, 1, 2, '2019-11-25 17:04:42', '2019-11-25 17:04:15', '2019-11-25 17:04:42'),
(25, 11, 1, 2, '2019-11-25 17:04:55', '2019-11-25 17:04:42', '2019-11-25 17:04:55'),
(26, 11, 6, 7, '2019-11-25 17:04:55', '2019-11-25 17:04:42', '2019-11-25 17:04:55'),
(27, 11, 7, 8, '2019-11-25 17:04:55', '2019-11-25 17:04:42', '2019-11-25 17:04:55'),
(28, 11, 1, 2, NULL, '2019-11-25 17:04:55', '2019-11-25 17:04:55'),
(29, 11, 6, 7, NULL, '2019-11-25 17:04:55', '2019-11-25 17:04:55'),
(30, 11, 7, 8, NULL, '2019-11-25 17:04:55', '2019-11-25 17:04:55');

-- --------------------------------------------------------

--
-- Table structure for table `seminar_times`
--

DROP TABLE IF EXISTS `seminar_times`;
CREATE TABLE IF NOT EXISTS `seminar_times` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_id` bigint(20) UNSIGNED NOT NULL,
  `from` tinyint(4) NOT NULL,
  `to` tinyint(4) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seminar_times_date_id_foreign` (`date_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seminar_times`
--

INSERT INTO `seminar_times` (`id`, `date_id`, `from`, `to`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, NULL, '2019-10-15 11:56:24', '2019-10-15 11:56:24'),
(2, 1, 3, 4, NULL, '2019-10-15 11:56:24', '2019-10-15 11:56:24'),
(3, 2, 1, 5, NULL, '2019-10-15 11:56:24', '2019-10-15 11:56:24'),
(4, 3, 1, 2, NULL, '2019-10-15 11:57:56', '2019-10-15 11:57:56'),
(5, 3, 3, 4, NULL, '2019-10-15 11:57:56', '2019-10-15 11:57:56'),
(6, 4, 1, 5, NULL, '2019-10-15 11:57:56', '2019-10-15 11:57:56'),
(7, 5, 1, 2, NULL, '2019-10-15 11:58:04', '2019-10-15 11:58:04'),
(8, 5, 3, 4, NULL, '2019-10-15 11:58:04', '2019-10-15 11:58:04'),
(9, 6, 1, 5, NULL, '2019-10-15 11:58:04', '2019-10-15 11:58:04'),
(10, 7, 1, 2, NULL, '2019-10-15 11:58:32', '2019-10-15 11:58:32'),
(11, 8, 1, 2, NULL, '2019-10-24 13:12:44', '2019-10-24 13:12:44'),
(12, 8, 3, 7, NULL, '2019-10-24 13:12:44', '2019-10-24 13:12:44'),
(13, 9, 8, 9, NULL, '2019-10-24 13:12:44', '2019-10-24 13:12:44'),
(14, 10, 2, 5, NULL, '2019-10-24 13:21:29', '2019-10-24 13:21:29'),
(15, 10, 5, 8, NULL, '2019-10-24 13:21:29', '2019-10-24 13:21:29'),
(16, 11, 1, 7, NULL, '2019-10-24 13:21:29', '2019-10-24 13:21:29'),
(17, 11, 7, 8, NULL, '2019-10-24 13:21:29', '2019-10-24 13:21:29'),
(18, 12, 2, 5, NULL, '2019-10-24 13:25:16', '2019-10-24 13:25:16'),
(19, 12, 5, 8, NULL, '2019-10-24 13:25:16', '2019-10-24 13:25:16'),
(20, 13, 1, 7, NULL, '2019-10-24 13:25:17', '2019-10-24 13:25:17'),
(21, 13, 7, 8, NULL, '2019-10-24 13:25:17', '2019-10-24 13:25:17'),
(22, 14, 1, 2, NULL, '2019-10-24 13:25:17', '2019-10-24 13:25:17'),
(23, 14, 3, 4, NULL, '2019-10-24 13:25:17', '2019-10-24 13:25:17'),
(24, 15, 1, 3, NULL, '2019-10-31 15:00:25', '2019-10-31 15:00:25'),
(25, 15, 5, 8, NULL, '2019-10-31 15:00:25', '2019-10-31 15:00:25'),
(26, 16, 1, 3, NULL, '2019-10-31 15:07:38', '2019-10-31 15:07:38'),
(27, 16, 5, 8, NULL, '2019-10-31 15:07:38', '2019-10-31 15:07:38'),
(28, 17, 2, 5, NULL, '2019-10-31 15:07:54', '2019-10-31 15:07:54'),
(29, 17, 5, 8, NULL, '2019-10-31 15:07:54', '2019-10-31 15:07:54'),
(30, 18, 1, 7, NULL, '2019-10-31 15:07:54', '2019-10-31 15:07:54'),
(31, 18, 7, 8, NULL, '2019-10-31 15:07:54', '2019-10-31 15:07:54'),
(32, 19, 1, 2, NULL, '2019-10-31 15:07:54', '2019-10-31 15:07:54'),
(33, 19, 3, 4, NULL, '2019-10-31 15:07:54', '2019-10-31 15:07:54'),
(34, 20, 1, 3, NULL, '2019-10-31 15:08:11', '2019-10-31 15:08:11'),
(35, 20, 5, 8, NULL, '2019-10-31 15:08:11', '2019-10-31 15:08:11'),
(36, 21, 1, 3, NULL, '2019-10-31 15:10:22', '2019-10-31 15:10:22'),
(37, 21, 5, 8, NULL, '2019-10-31 15:10:22', '2019-10-31 15:10:22'),
(38, 22, 1, 3, NULL, '2019-10-31 15:11:16', '2019-10-31 15:11:16'),
(39, 22, 5, 8, NULL, '2019-10-31 15:11:16', '2019-10-31 15:11:16'),
(40, 23, 1, 3, NULL, '2019-10-31 15:11:27', '2019-10-31 15:11:27'),
(41, 23, 5, 8, NULL, '2019-10-31 15:11:27', '2019-10-31 15:11:27'),
(42, 24, 1, 2, NULL, '2019-11-11 01:14:59', '2019-11-11 01:14:59'),
(43, 24, 10, 12, NULL, '2019-11-11 01:14:59', '2019-11-11 01:14:59'),
(44, 25, 1, 2, NULL, '2019-11-24 16:49:03', '2019-11-24 16:49:03'),
(45, 25, 3, 4, NULL, '2019-11-24 16:49:03', '2019-11-24 16:49:03'),
(46, 26, 1, 8, NULL, '2019-11-24 16:49:03', '2019-11-24 16:49:03'),
(47, 27, 2, 3, NULL, '2019-11-25 11:56:38', '2019-11-25 11:56:38'),
(48, 28, 2, 3, NULL, '2019-11-25 11:56:38', '2019-11-25 11:56:38'),
(49, 29, 2, 3, NULL, '2019-11-25 11:59:00', '2019-11-25 11:59:00'),
(50, 30, 1, 3, NULL, '2019-11-25 11:59:00', '2019-11-25 11:59:00'),
(51, 31, 2, 3, NULL, '2019-11-25 11:59:00', '2019-11-25 11:59:00'),
(52, 32, 1, 3, NULL, '2019-11-25 11:59:00', '2019-11-25 11:59:00'),
(53, 33, 2, 3, NULL, '2019-11-25 12:00:07', '2019-11-25 12:00:07'),
(54, 34, 1, 3, NULL, '2019-11-25 12:00:07', '2019-11-25 12:00:07'),
(55, 35, 2, 3, NULL, '2019-11-25 12:00:07', '2019-11-25 12:00:07'),
(56, 36, 1, 3, NULL, '2019-11-25 12:00:07', '2019-11-25 12:00:07');

-- --------------------------------------------------------

--
-- Table structure for table `seminar_views`
--

DROP TABLE IF EXISTS `seminar_views`;
CREATE TABLE IF NOT EXISTS `seminar_views` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seminar_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seminar_views_user_id_foreign` (`user_id`),
  KEY `seminar_views_seminar_id_foreign` (`seminar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seminar_views`
--

INSERT INTO `seminar_views` (`id`, `user_id`, `seminar_id`, `created_at`, `updated_at`) VALUES
(1, 1, 9, '2019-11-26 16:35:50', '2019-11-26 16:35:50'),
(2, 1, 9, '2019-11-26 16:36:48', '2019-11-26 16:36:48'),
(3, 1, 9, '2019-11-26 16:37:00', '2019-11-26 16:37:00'),
(4, 1, 9, '2019-11-26 16:39:50', '2019-11-26 16:39:50'),
(5, 1, 9, '2019-11-26 16:40:44', '2019-11-26 16:40:44'),
(6, 1, 9, '2019-11-26 16:40:48', '2019-11-26 16:40:48'),
(7, 1, 9, '2019-11-26 16:41:04', '2019-11-26 16:41:04'),
(8, 1, 9, '2019-11-26 16:43:32', '2019-11-26 16:43:32'),
(9, 1, 9, '2019-11-26 16:44:18', '2019-11-26 16:44:18'),
(10, 1, 9, '2019-11-26 16:45:01', '2019-11-26 16:45:01'),
(11, 1, 9, '2019-11-26 16:45:40', '2019-11-26 16:45:40'),
(12, 1, 9, '2019-11-26 16:46:15', '2019-11-26 16:46:15'),
(13, 1, 9, '2019-11-26 16:47:05', '2019-11-26 16:47:05'),
(14, 1, 9, '2019-11-26 16:47:17', '2019-11-26 16:47:17'),
(15, 1, 9, '2019-11-26 16:47:42', '2019-11-26 16:47:42'),
(16, 1, 9, '2019-11-26 16:48:20', '2019-11-26 16:48:20'),
(17, 1, 9, '2019-11-26 16:48:38', '2019-11-26 16:48:38'),
(18, 1, 9, '2019-11-26 16:48:56', '2019-11-26 16:48:56'),
(19, 1, 9, '2019-11-26 16:49:53', '2019-11-26 16:49:53'),
(20, 1, 9, '2019-11-26 16:50:15', '2019-11-26 16:50:15'),
(21, 1, 9, '2019-11-26 17:00:42', '2019-11-26 17:00:42'),
(22, 1, 9, '2019-11-26 17:01:09', '2019-11-26 17:01:09'),
(23, 1, 9, '2019-11-26 17:01:31', '2019-11-26 17:01:31'),
(24, 1, 9, '2019-11-26 17:02:17', '2019-11-26 17:02:17'),
(25, 1, 9, '2019-11-26 17:02:26', '2019-11-26 17:02:26'),
(26, 1, 9, '2019-11-26 17:02:56', '2019-11-26 17:02:56'),
(27, 1, 9, '2019-11-26 17:03:01', '2019-11-26 17:03:01'),
(28, 1, 9, '2019-11-26 17:03:02', '2019-11-26 17:03:02'),
(29, 1, 9, '2019-11-26 17:03:18', '2019-11-26 17:03:18'),
(30, 1, 9, '2019-11-26 17:03:31', '2019-11-26 17:03:31'),
(31, 1, 9, '2019-11-26 17:03:37', '2019-11-26 17:03:37'),
(32, 1, 9, '2019-11-26 17:03:38', '2019-11-26 17:03:38'),
(33, 1, 9, '2019-11-27 12:19:45', '2019-11-27 12:19:45'),
(34, 1, 9, '2019-11-27 12:20:33', '2019-11-27 12:20:33'),
(35, 1, 9, '2019-11-27 12:20:38', '2019-11-27 12:20:38'),
(36, 1, 9, '2019-11-27 12:23:09', '2019-11-27 12:23:09'),
(37, 1, 9, '2019-11-27 12:26:08', '2019-11-27 12:26:08'),
(38, 1, 9, '2019-11-27 12:26:19', '2019-11-27 12:26:19'),
(39, 1, 9, '2019-11-27 12:26:29', '2019-11-27 12:26:29'),
(40, 1, 9, '2019-11-27 12:26:34', '2019-11-27 12:26:34'),
(41, 1, 9, '2019-11-27 12:26:50', '2019-11-27 12:26:50'),
(42, 1, 9, '2019-11-27 12:28:33', '2019-11-27 12:28:33'),
(43, 1, 9, '2019-11-27 12:28:44', '2019-11-27 12:28:44'),
(44, NULL, 9, '2019-11-27 15:53:49', '2019-11-27 15:53:49'),
(45, 1, 9, '2019-11-27 15:54:09', '2019-11-27 15:54:09'),
(46, 1, 9, '2019-11-27 15:54:17', '2019-11-27 15:54:17'),
(47, 1, 9, '2019-11-27 15:54:50', '2019-11-27 15:54:50'),
(48, 1, 9, '2019-11-27 15:54:57', '2019-11-27 15:54:57'),
(49, 1, 9, '2019-11-27 15:54:57', '2019-11-27 15:54:57'),
(50, 1, 9, '2019-11-27 15:55:28', '2019-11-27 15:55:28'),
(51, 1, 9, '2019-11-27 15:56:40', '2019-11-27 15:56:40'),
(52, 1, 9, '2019-11-27 15:57:14', '2019-11-27 15:57:14'),
(53, 1, 9, '2019-11-27 15:57:17', '2019-11-27 15:57:17'),
(54, 1, 9, '2019-11-27 15:57:39', '2019-11-27 15:57:39'),
(55, 1, 9, '2019-11-27 15:58:21', '2019-11-27 15:58:21'),
(56, 1, 9, '2019-11-27 15:59:07', '2019-11-27 15:59:07'),
(57, 1, 9, '2019-11-27 15:59:39', '2019-11-27 15:59:39'),
(58, 1, 9, '2019-11-27 16:00:07', '2019-11-27 16:00:07'),
(59, 1, 9, '2019-11-27 16:01:02', '2019-11-27 16:01:02'),
(60, 1, 9, '2019-11-27 16:01:27', '2019-11-27 16:01:27'),
(61, 1, 9, '2019-11-27 16:02:33', '2019-11-27 16:02:33'),
(62, 1, 9, '2019-11-27 16:03:32', '2019-11-27 16:03:32'),
(63, 1, 9, '2019-11-27 16:08:02', '2019-11-27 16:08:02'),
(64, 1, 9, '2019-11-27 16:11:04', '2019-11-27 16:11:04'),
(65, 1, 9, '2019-11-27 16:11:49', '2019-11-27 16:11:49'),
(66, 1, 9, '2019-11-27 16:12:15', '2019-11-27 16:12:15'),
(67, 1, 9, '2019-11-27 16:12:57', '2019-11-27 16:12:57'),
(68, 1, 9, '2019-11-27 16:16:14', '2019-11-27 16:16:14'),
(69, 1, 9, '2019-11-27 16:16:41', '2019-11-27 16:16:41'),
(70, 1, 9, '2019-11-27 16:17:23', '2019-11-27 16:17:23'),
(71, 1, 9, '2019-11-27 16:18:07', '2019-11-27 16:18:07'),
(72, 1, 9, '2019-11-27 17:47:24', '2019-11-27 17:47:24'),
(73, 1, 9, '2019-12-09 16:49:58', '2019-12-09 16:49:58'),
(74, 1, 9, '2019-12-09 16:50:48', '2019-12-09 16:50:48');

--
-- Triggers `seminar_views`
--
DROP TRIGGER IF EXISTS `insert_seminar_views`;
DELIMITER $$
CREATE TRIGGER `insert_seminar_views` AFTER INSERT ON `seminar_views` FOR EACH ROW BEGIN
                UPDATE seminars SET stat_views = stat_views + 1 WHERE id = NEW.seminar_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `val` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `standalone_quizzes`
--

DROP TABLE IF EXISTS `standalone_quizzes`;
CREATE TABLE IF NOT EXISTS `standalone_quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `standalone_quizzes_quiz_id_unique` (`quiz_id`),
  KEY `standalone_quizzes_user_id_unique` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `standalone_quizzes`
--

INSERT INTO `standalone_quizzes` (`id`, `user_id`, `quiz_id`, `created_at`, `updated_at`) VALUES
(2, 1, 10, '2019-11-22 11:37:58', '2019-11-22 11:37:58'),
(3, 1, 11, '2019-11-22 12:05:40', '2019-11-22 12:05:40'),
(4, 1, 12, '2019-11-24 11:11:02', '2019-11-24 11:11:02'),
(5, 1, 13, '2019-11-24 11:15:19', '2019-11-24 11:15:19'),
(6, 1, 14, '2019-11-24 11:40:40', '2019-11-24 11:40:40');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_profiles`
--

DROP TABLE IF EXISTS `teacher_profiles`;
CREATE TABLE IF NOT EXISTS `teacher_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `upload_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teacher_profiles_user_id_unique` (`user_id`),
  UNIQUE KEY `teacher_profiles_upload_id_unique` (`upload_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teacher_profiles`
--

INSERT INTO `teacher_profiles` (`id`, `user_id`, `name`, `avatar`, `text`, `upload_id`, `created_at`, `updated_at`) VALUES
(3, 1, 'مجتبی زوار', '5ddaaa7ca00f0.jpg', 'شیشسی', 448, '2019-11-24 16:06:21', '2019-11-24 16:06:21');

-- --------------------------------------------------------

--
-- Table structure for table `technologies`
--

DROP TABLE IF EXISTS `technologies`;
CREATE TABLE IF NOT EXISTS `technologies` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `technologies`
--

INSERT INTO `technologies` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'php', NULL, NULL),
(2, 'laravel', NULL, NULL),
(3, 'سرور', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_alert` tinyint(1) NOT NULL,
  `admin_alert` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `user_id`, `title`, `user_alert`, `admin_alert`, `created_at`, `updated_at`) VALUES
(1, 1, 'سلام', 1, 0, '2019-10-18 12:16:37', '2019-10-18 12:16:37'),
(2, 1, 'عنوان پیام', 0, 1, '2019-10-20 13:03:40', '2019-10-20 13:03:40'),
(3, 1, 'پیام نهایی', 0, 1, '2019-10-20 13:04:44', '2019-10-20 13:04:44'),
(4, 1, 'ییی', 0, 1, '2019-10-20 13:31:49', '2019-10-20 13:31:49'),
(5, 1, 'سلام مدرس', 0, 1, '2019-10-22 11:56:34', '2019-10-22 11:56:34'),
(6, 1, 'عنوان پیام', 0, 0, '2019-10-27 18:26:13', '2019-12-09 18:06:32'),
(7, 1, 'ss', 0, 1, '2019-11-12 00:45:15', '2019-11-12 00:45:15');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_dialogs`
--

DROP TABLE IF EXISTS `ticket_dialogs`;
CREATE TABLE IF NOT EXISTS `ticket_dialogs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_dialogs_ticket_id_foreign` (`ticket_id`),
  KEY `ticket_dialogs_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_dialogs`
--

INSERT INTO `ticket_dialogs` (`id`, `ticket_id`, `user_id`, `text`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'متن پیام', '2019-10-18 12:16:37', '2019-10-18 12:16:37'),
(2, 2, 1, 'توضیحات\nتوضیحات\nv', '2019-10-20 13:03:40', '2019-10-20 13:03:40'),
(3, 3, 1, 'توضیحات پیام نهایی', '2019-10-20 13:04:45', '2019-10-20 13:04:45'),
(4, 3, 1, 'ششش', '2019-10-20 13:30:19', '2019-10-20 13:30:19'),
(5, 3, 1, 'یک پیام دیگر', '2019-10-20 13:30:26', '2019-10-20 13:30:26'),
(6, 4, 1, 'سیبسبسی سیب س', '2019-10-20 13:31:49', '2019-10-20 13:31:49'),
(7, 5, 1, 'متن پیام به مدرس', '2019-10-22 11:56:34', '2019-10-22 11:56:34'),
(8, 5, 1, 'باشه اکیع', '2019-10-22 13:08:00', '2019-10-22 13:08:00'),
(9, 5, 1, 'xxx', '2019-10-22 13:11:44', '2019-10-22 13:11:44'),
(10, 5, 1, 'الییی', '2019-10-23 12:50:26', '2019-10-23 12:50:26'),
(11, 6, 1, 'توضیحات', '2019-10-27 18:26:13', '2019-10-27 18:26:13'),
(12, 7, 1, 's', '2019-11-12 00:45:15', '2019-11-12 00:45:15');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_supports`
--

DROP TABLE IF EXISTS `ticket_supports`;
CREATE TABLE IF NOT EXISTS `ticket_supports` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_supports_ticket_id_foreign` (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_supports`
--

INSERT INTO `ticket_supports` (`id`, `ticket_id`, `created_at`, `updated_at`) VALUES
(1, 6, '2019-10-27 18:26:13', '2019-10-27 18:26:13');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_teachers`
--

DROP TABLE IF EXISTS `ticket_teachers`;
CREATE TABLE IF NOT EXISTS `ticket_teachers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_teachers_ticket_id_foreign` (`ticket_id`),
  KEY `ticket_teachers_teacher_id_foreign` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `type` enum('withdraw','withdraw_cancel','buy_course','buy_quiz','buy_channel','buy_consultant','buy_seminar','buy_product') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `amount`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 50000, 'buy_course', '2019-12-09 16:48:24', '2019-12-09 16:48:24'),
(2, 1, 8000, 'buy_seminar', '2019-12-09 16:50:48', '2019-12-09 16:50:48'),
(3, 1, 6000, 'buy_quiz', '2019-12-09 16:53:41', '2019-12-09 16:53:41'),
(4, 1, 10000, 'buy_consultant', '2019-12-09 16:57:30', '2019-12-09 16:57:30'),
(5, 1, 2000, 'buy_channel', '2019-12-09 16:59:27', '2019-12-09 16:59:27');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_channels`
--

DROP TABLE IF EXISTS `transaction_channels`;
CREATE TABLE IF NOT EXISTS `transaction_channels` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_income_id` int(11) NOT NULL,
  `channel_price_id` int(11) NOT NULL,
  `sub_plan` enum('monthly','yearly','halfyear') COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_channels_user_id_foreign` (`user_id`),
  KEY `transaction_channels_transaction_id_foreign` (`transaction_id`),
  KEY `transaction_channels_channel_id_foreign` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_channels`
--

INSERT INTO `transaction_channels` (`id`, `user_id`, `transaction_id`, `transaction_income_id`, `channel_price_id`, `sub_plan`, `channel_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 5, 6, 'halfyear', 6, 2000, '2019-12-09 16:59:27', '2019-12-09 16:59:27');

--
-- Triggers `transaction_channels`
--
DROP TRIGGER IF EXISTS `insert_transaction_channels`;
DELIMITER $$
CREATE TRIGGER `insert_transaction_channels` AFTER INSERT ON `transaction_channels` FOR EACH ROW BEGIN
                UPDATE channels SET stat_sold = stat_sold + NEW.amount WHERE id = NEW.channel_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_consultants`
--

DROP TABLE IF EXISTS `transaction_consultants`;
CREATE TABLE IF NOT EXISTS `transaction_consultants` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_income_id` int(11) NOT NULL,
  `consultant_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_consultants_user_id_foreign` (`user_id`),
  KEY `transaction_consultants_transaction_id_foreign` (`transaction_id`),
  KEY `transaction_consultants_consultant_id_foreign` (`consultant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_consultants`
--

INSERT INTO `transaction_consultants` (`id`, `user_id`, `transaction_id`, `transaction_income_id`, `consultant_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 4, 1, 10000, '2019-12-09 16:57:30', '2019-12-09 16:57:30');

--
-- Triggers `transaction_consultants`
--
DROP TRIGGER IF EXISTS `insert_transaction_consultants`;
DELIMITER $$
CREATE TRIGGER `insert_transaction_consultants` AFTER INSERT ON `transaction_consultants` FOR EACH ROW BEGIN
                UPDATE consultants SET stat_sold = stat_sold + NEW.amount WHERE id = NEW.consultant_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_courses`
--

DROP TABLE IF EXISTS `transaction_courses`;
CREATE TABLE IF NOT EXISTS `transaction_courses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_income_id` int(11) NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_courses_user_id_foreign` (`user_id`),
  KEY `transaction_courses_transaction_id_foreign` (`transaction_id`),
  KEY `transaction_courses_course_id_foreign` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_courses`
--

INSERT INTO `transaction_courses` (`id`, `user_id`, `transaction_id`, `transaction_income_id`, `course_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 11, 50000, '2019-12-09 16:48:24', '2019-12-09 16:48:24');

--
-- Triggers `transaction_courses`
--
DROP TRIGGER IF EXISTS `insert_transaction_courses`;
DELIMITER $$
CREATE TRIGGER `insert_transaction_courses` AFTER INSERT ON `transaction_courses` FOR EACH ROW BEGIN
                UPDATE courses SET stat_sold = stat_sold + NEW.amount WHERE id = NEW.course_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_incomes`
--

DROP TABLE IF EXISTS `transaction_incomes`;
CREATE TABLE IF NOT EXISTS `transaction_incomes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `type` enum('withdraw','withdraw_cancel','buy_course','buy_quiz','buy_channel','buy_consultant','buy_seminar','buy_product') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_incomes_user_id_foreign` (`user_id`),
  KEY `transaction_incomes_transaction_id_foreign` (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_incomes`
--

INSERT INTO `transaction_incomes` (`id`, `user_id`, `transaction_id`, `amount`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 50000, 'buy_course', '2019-12-09 16:48:24', '2019-12-09 16:48:24'),
(2, 1, 2, 8000, 'buy_seminar', '2019-12-09 16:50:48', '2019-12-09 16:50:48'),
(3, 1, 3, 6000, 'buy_quiz', '2019-12-09 16:53:41', '2019-12-09 16:53:41'),
(4, 1, 4, 10000, 'buy_consultant', '2019-12-09 16:57:30', '2019-12-09 16:57:30'),
(5, 1, 5, 2000, 'buy_channel', '2019-12-09 16:59:27', '2019-12-09 16:59:27');

--
-- Triggers `transaction_incomes`
--
DROP TRIGGER IF EXISTS `insert_transaction_incomes`;
DELIMITER $$
CREATE TRIGGER `insert_transaction_incomes` AFTER INSERT ON `transaction_incomes` FOR EACH ROW BEGIN
                UPDATE users SET income = income + NEW.amount WHERE id = NEW.user_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_products`
--

DROP TABLE IF EXISTS `transaction_products`;
CREATE TABLE IF NOT EXISTS `transaction_products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_income_id` int(11) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_products_user_id_foreign` (`user_id`),
  KEY `transaction_products_transaction_id_foreign` (`transaction_id`),
  KEY `transaction_products_product_id_foreign` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `transaction_products`
--
DROP TRIGGER IF EXISTS `insert_transaction_products`;
DELIMITER $$
CREATE TRIGGER `insert_transaction_products` AFTER INSERT ON `transaction_products` FOR EACH ROW BEGIN
                UPDATE user_products SET stat_sold = stat_sold + NEW.amount WHERE id = NEW.product_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_quizzes`
--

DROP TABLE IF EXISTS `transaction_quizzes`;
CREATE TABLE IF NOT EXISTS `transaction_quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_income_id` int(11) NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_quizzes_user_id_foreign` (`user_id`),
  KEY `transaction_quizzes_transaction_id_foreign` (`transaction_id`),
  KEY `transaction_quizzes_quiz_id_foreign` (`quiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_quizzes`
--

INSERT INTO `transaction_quizzes` (`id`, `user_id`, `transaction_id`, `transaction_income_id`, `quiz_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 3, 14, 1000, '2019-12-09 16:53:41', '2019-12-09 16:53:41');

--
-- Triggers `transaction_quizzes`
--
DROP TRIGGER IF EXISTS `insert_transaction_quizzes`;
DELIMITER $$
CREATE TRIGGER `insert_transaction_quizzes` AFTER INSERT ON `transaction_quizzes` FOR EACH ROW BEGIN
                UPDATE quizzes SET stat_sold = stat_sold + NEW.amount WHERE id = NEW.quiz_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_seminars`
--

DROP TABLE IF EXISTS `transaction_seminars`;
CREATE TABLE IF NOT EXISTS `transaction_seminars` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_income_id` int(11) NOT NULL,
  `seminar_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_seminars_user_id_foreign` (`user_id`),
  KEY `transaction_seminars_transaction_id_foreign` (`transaction_id`),
  KEY `transaction_seminars_seminar_id_foreign` (`seminar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_seminars`
--

INSERT INTO `transaction_seminars` (`id`, `user_id`, `transaction_id`, `transaction_income_id`, `seminar_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 2, 9, 8000, '2019-12-09 16:50:48', '2019-12-09 16:50:48');

--
-- Triggers `transaction_seminars`
--
DROP TRIGGER IF EXISTS `insert_transaction_seminars`;
DELIMITER $$
CREATE TRIGGER `insert_transaction_seminars` AFTER INSERT ON `transaction_seminars` FOR EACH ROW BEGIN
                UPDATE seminars SET stat_sold = stat_sold + NEW.amount WHERE id = NEW.seminar_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_withdraws`
--

DROP TABLE IF EXISTS `transaction_withdraws`;
CREATE TABLE IF NOT EXISTS `transaction_withdraws` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `wallet_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `confirm` tinyint(1) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_withdraws_user_id_foreign` (`user_id`),
  KEY `transaction_withdraws_wallet_id_foreign` (`wallet_id`),
  KEY `transaction_withdraws_admin_id_foreign` (`admin_id`),
  KEY `transaction_withdraws_transaction_id_foreign` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `transaction_withdraws`
--
DROP TRIGGER IF EXISTS `insert_transaction_withdraws`;
DELIMITER $$
CREATE TRIGGER `insert_transaction_withdraws` BEFORE INSERT ON `transaction_withdraws` FOR EACH ROW BEGIN
                UPDATE profiles SET credit = credit - NEW.amount WHERE user_id = NEW.user_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_withdraw_results`
--

DROP TABLE IF EXISTS `transaction_withdraw_results`;
CREATE TABLE IF NOT EXISTS `transaction_withdraw_results` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_withdraw_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `result` enum('accept','deny') COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_withdraw_results_transaction_withdraw_id_unique` (`transaction_withdraw_id`),
  KEY `transaction_withdraw_results_transaction_id_foreign` (`transaction_id`),
  KEY `transaction_withdraw_results_user_id_foreign` (`user_id`),
  KEY `transaction_withdraw_results_admin_id_foreign` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `transaction_withdraw_results`
--
DROP TRIGGER IF EXISTS `insert_transaction_withdraw_results`;
DELIMITER $$
CREATE TRIGGER `insert_transaction_withdraw_results` BEFORE INSERT ON `transaction_withdraw_results` FOR EACH ROW BEGIN
                IF NEW.result = "deny" THEN 
                    UPDATE profiles SET credit = credit + NEW.amount WHERE user_id = NEW.user_id ;
                END IF ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
CREATE TABLE IF NOT EXISTS `uploads` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uploads_token_unique` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=514 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `user_id`, `type`, `original_name`, `file_name`, `token`, `created_at`, `updated_at`) VALUES
(1, 0, '', '', '5d9f69fbbf298.jpg', '5d9f69fbbfa68', '2019-10-10 13:57:23', '2019-10-10 13:57:23'),
(2, 0, '', '', '5d9f6a6584918.jpg', '5d9f6a6584918', '2019-10-10 13:59:09', '2019-10-10 13:59:09'),
(3, 0, '', '', '5d9f6ab53b538.jpg', '5d9f6ab53b920', '2019-10-10 14:00:29', '2019-10-10 14:00:29'),
(4, 0, '', '', '5d9f6b319d3a0.jpg', '5d9f6b319d788', '2019-10-10 14:02:33', '2019-10-10 14:02:33'),
(5, 0, '', '', '5d9f6d6459d80.jpg', '5d9f6d6459d80', '2019-10-10 14:11:56', '2019-10-10 14:11:56'),
(6, 0, '', '', '5d9f7710975e0.jpg', '5d9f771097db0', '2019-10-10 14:53:12', '2019-10-10 14:53:12'),
(7, 0, '', '', '5d9f77531ec30.png', '5d9f77531f018', '2019-10-10 14:54:19', '2019-10-10 14:54:19'),
(8, 0, '', '', '5d9f77f274360.png', '5d9f77f274360', '2019-10-10 14:56:58', '2019-10-10 14:56:58'),
(9, 0, '', '', '5d9f780101f40.png', '5d9f780102710', '2019-10-10 14:57:13', '2019-10-10 14:57:13'),
(10, 0, '', '', '5d9f7827278d0.png', '5d9f782727cb8', '2019-10-10 14:57:51', '2019-10-10 14:57:51'),
(11, 0, '', '', '5d9f783670cb0.png', '5d9f783670cb0', '2019-10-10 14:58:06', '2019-10-10 14:58:06'),
(12, 0, '', '', '5d9f792ea19f0.png', '5d9f792ea21c0', '2019-10-10 15:02:14', '2019-10-10 15:02:14'),
(13, 0, '', '', '5d9f798a927c0.png', '5d9f798a92f90', '2019-10-10 15:03:46', '2019-10-10 15:03:46'),
(14, 0, '', '', '5d9f7994b13f0.png', '5d9f7994b2390', '2019-10-10 15:03:56', '2019-10-10 15:03:56'),
(15, 0, '', '', '5d9f799c412f8.png', '5d9f799c416e0', '2019-10-10 15:04:04', '2019-10-10 15:04:04'),
(16, 0, '', '', '5d9f7a74a5488.jpg', '5d9f7a74a5870', '2019-10-10 15:07:40', '2019-10-10 15:07:40'),
(17, 0, '', '', '5d9f7abb53bd8.jpg', '5d9f7abb53bd8', '2019-10-10 15:08:51', '2019-10-10 15:08:51'),
(18, 0, '', '', '5d9f7ae71b198.png', '5d9f7ae71b580', '2019-10-10 15:09:35', '2019-10-10 15:09:35'),
(19, 0, '', '', '5d9f7b21a1220.png', '5d9f7b21a1608', '2019-10-10 15:10:33', '2019-10-10 15:10:33'),
(20, 0, '', '', '5d9f7b33ef808.png', '5d9f7b33efbf0', '2019-10-10 15:10:51', '2019-10-10 15:10:51'),
(21, 0, '', '', '5d9f7b391ec30.png', '5d9f7b391f018', '2019-10-10 15:10:57', '2019-10-10 15:10:57'),
(22, 0, '', '', '5da22244d6998.png', '5da22244d7938', '2019-10-12 15:28:12', '2019-10-12 15:28:12'),
(23, 0, '', '', '5da222965cc60.png', '5da222965e3d0', '2019-10-12 15:29:34', '2019-10-12 15:29:34'),
(24, 0, '', '', '5da224f9a6428.jpg', '5da224f9a6810', '2019-10-12 15:39:45', '2019-10-12 15:39:45'),
(25, 0, '', '', '5da2255e52c38.jpg', '5da2255e543a8', '2019-10-12 15:41:26', '2019-10-12 15:41:26'),
(26, 1, '', '', '5da225bf36330.png', '5da225bf43238', '2019-10-12 15:43:03', '2019-10-12 15:43:03'),
(27, 1, '', '', '5da22b5f347d8.png', '5da22b5f416e0', '2019-10-12 16:07:03', '2019-10-12 16:07:03'),
(28, 1, '', '', '5da230adba478.png', '5da230adcaa30', '2019-10-12 16:29:41', '2019-10-12 16:29:41'),
(29, 1, '', '', '5da2310f98968.png', '5da2310fa8f20', '2019-10-12 16:31:19', '2019-10-12 16:31:19'),
(30, 1, '', '', '5da23145cd140.png', '5da23145de2b0', '2019-10-12 16:32:13', '2019-10-12 16:32:13'),
(31, 1, '', '', '5da231bcab630.png', '5da231bcba478', '2019-10-12 16:34:12', '2019-10-12 16:34:12'),
(32, 1, '', '', '5da231c2cd910.png', '5da231c2dafe8', '2019-10-12 16:34:18', '2019-10-12 16:34:18'),
(33, 1, '', '', '5da231c7d4288.png', '5da231c7dee68', '2019-10-12 16:34:23', '2019-10-12 16:34:23'),
(34, 1, '', '', '5da2343aaece0.png', '5da2343ac2d30', '2019-10-12 16:44:50', '2019-10-12 16:44:50'),
(35, 1, '', '', '5da2344de7b08.jpg', '5da2344e036b0', '2019-10-12 16:45:10', '2019-10-12 16:45:10'),
(36, 1, '', '', '5da2347a12cc8.jpg', '5da2347a21340', '2019-10-12 16:45:54', '2019-10-12 16:45:54'),
(37, 1, '', '', '5da235c8606f8.jpg', '5da235c86e5a0', '2019-10-12 16:51:28', '2019-10-12 16:51:28'),
(38, 1, '', '', '5da2363204a38.png', '5da236320cf08', '2019-10-12 16:53:14', '2019-10-12 16:53:14'),
(39, 1, '', 'button-group.png', '5da23d48b2778.png', '5da23d48b94d8', '2019-10-12 17:23:28', '2019-10-12 17:23:28'),
(40, 1, '', 'button-group.png', '5da23d533d478.png', '5da23d53445c0', '2019-10-12 17:23:39', '2019-10-12 17:23:39'),
(41, 1, '', 'Mixed-Martial-Arts-Background-Wallpaper-04397.jpg', '5da23ea399520.jpg', '5da23ea3a0a50', '2019-10-12 17:29:15', '2019-10-12 17:29:15'),
(42, 1, '', '2days.png', '5da23ec55ef88.png', '5da23ec567458', '2019-10-12 17:29:49', '2019-10-12 17:29:49'),
(43, 1, '', 'photo_2019-10-10_20-30-50.jpg', '5da23f3c956a0.jpg', '5da23f3c9bc30', '2019-10-12 17:31:48', '2019-10-12 17:31:48'),
(44, 1, '', 'photo_2019-10-10_20-30-50.jpg', '5da23f7952850.jpg', '5da23f7957a58', '2019-10-12 17:32:49', '2019-10-12 17:32:49'),
(45, 1, '', 'photo_2019-10-10_20-30-50.jpg', '5da2401ced4e0.jpg', '5da2401cf2eb8', '2019-10-12 17:35:32', '2019-10-12 17:35:32'),
(46, 1, '', 'photo_2019-10-10_20-30-50.jpg', '5da2409069f50.jpg', '5da2409071098', '2019-10-12 17:37:28', '2019-10-12 17:37:28'),
(47, 1, '', 'button-group.png', '5da2410b7c060.png', '5da2410b82dc0', '2019-10-12 17:39:31', '2019-10-12 17:39:31'),
(48, 1, '', 'photo_2019-10-10_20-30-50.jpg', '5da4a1f95dfe8.jpg', '5da4a1f95e7b8', '2019-10-14 12:57:37', '2019-10-14 12:57:37'),
(49, 1, '', 'photo_2019-10-10_20-30-50.jpg', '5da4a2388f4f8.jpg', '5da4a2388f8e0', '2019-10-14 12:58:40', '2019-10-14 12:58:40'),
(50, 1, '', 'photo_2019-10-10_20-30-50.jpg', '5da4a2935ad20.jpg', '5da4a2935b4f0', '2019-10-14 13:00:11', '2019-10-14 13:00:11'),
(51, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da4a4cc77df8.jpg', '5da4a4cc785c8', '2019-10-14 13:09:40', '2019-10-14 13:09:40'),
(52, 1, 'video', 'voo.mp4', '5da4a4db88f68.mp4', '5da4a4db89350', '2019-10-14 13:09:55', '2019-10-14 13:09:55'),
(53, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da4a50486858.jpg', '5da4a50486c40', '2019-10-14 13:10:36', '2019-10-14 13:10:36'),
(54, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da4a55b02ee0.jpg', '5da4a55b032c8', '2019-10-14 13:12:03', '2019-10-14 13:12:03'),
(55, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da4a68b46118.jpg', '5da4a68b46500', '2019-10-14 13:17:07', '2019-10-14 13:17:07'),
(56, 1, 'video', 'voo.mp4', '5da4a68fb9ca8.mp4', '5da4a68fba090', '2019-10-14 13:17:11', '2019-10-14 13:17:11'),
(57, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da4a72fa3160.jpg', '5da4a72fa3548', '2019-10-14 13:19:51', '2019-10-14 13:19:51'),
(58, 1, 'video', 'voo.mp4', '5da4a756d9490.mp4', '5da4a756d9878', '2019-10-14 13:20:30', '2019-10-14 13:20:30'),
(59, 1, 'image', 'ram.png', '5da4a77b1e078.png', '5da4a77b1f018', '2019-10-14 13:21:07', '2019-10-14 13:21:07'),
(60, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da4a7a7beeb0.jpg', '5da4a7a7c0238', '2019-10-14 13:21:51', '2019-10-14 13:21:51'),
(61, 1, 'video', 'voo.mp4', '5da4a7b7e7338.mp4', '5da4a7b7e7b08', '2019-10-14 13:22:07', '2019-10-14 13:22:07'),
(62, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da4a7c65dc00.jpg', '5da4a7c65dfe8', '2019-10-14 13:22:22', '2019-10-14 13:22:22'),
(63, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da4bc4014438.jpg', '5da4bc4014820', '2019-10-14 14:49:44', '2019-10-14 14:49:44'),
(64, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da4bc54e01f0.jpg', '5da4bc54e05d8', '2019-10-14 14:50:04', '2019-10-14 14:50:04'),
(65, 1, 'image', 'button-group.png', '5da4bc72e4840.png', '5da4bc72e4c28', '2019-10-14 14:50:34', '2019-10-14 14:50:34'),
(66, 1, 'image', 'wallex.png', '5da4bc7783590.png', '5da4bc7783978', '2019-10-14 14:50:39', '2019-10-14 14:50:39'),
(67, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da4bc97e7338.jpg', '5da4bc97e7720', '2019-10-14 14:51:11', '2019-10-14 14:51:11'),
(68, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da4c00635f48.jpg', '5da4c00636330', '2019-10-14 15:05:50', '2019-10-14 15:05:50'),
(69, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da4c05586858.jpg', '5da4c05586c40', '2019-10-14 15:07:09', '2019-10-14 15:07:09'),
(70, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da4c06c62250.jpg', '5da4c06c62a20', '2019-10-14 15:07:32', '2019-10-14 15:07:32'),
(71, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da4c07bf3e58.jpg', '5da4c07c00000', '2019-10-14 15:07:48', '2019-10-14 15:07:48'),
(72, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da4c0e06aef0.jpg', '5da4c0e06b6c0', '2019-10-14 15:09:28', '2019-10-14 15:09:28'),
(73, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da4c17714ff0.jpg', '5da4c177153d8', '2019-10-14 15:11:59', '2019-10-14 15:11:59'),
(74, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da4c17b72fd8.jpg', '5da4c17b733c0', '2019-10-14 15:12:03', '2019-10-14 15:12:03'),
(75, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da4c19a7c830.jpg', '5da4c19a7d000', '2019-10-14 15:12:34', '2019-10-14 15:12:34'),
(76, 1, 'image', 'ram.png', '5da4c4d5e86c0.png', '5da4c4d5e8aa8', '2019-10-14 15:26:21', '2019-10-14 15:26:21'),
(77, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da4c5e92cad8.jpg', '5da4c5e92cec0', '2019-10-14 15:30:57', '2019-10-14 15:30:57'),
(78, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da4c8bae7338.jpg', '5da4c8bae82d8', '2019-10-14 15:42:58', '2019-10-14 15:42:58'),
(79, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da5e467d90a8.png', '5da5e467d9878', '2019-10-15 11:53:19', '2019-10-15 11:53:19'),
(80, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da5e4de9bc30.jpg', '5da5e4de9c018', '2019-10-15 11:55:18', '2019-10-15 11:55:18'),
(81, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da5e4ed48058.png', '5da5e4ed48058', '2019-10-15 11:55:33', '2019-10-15 11:55:33'),
(82, 1, 'image', 'button-group.png', '5da5e57a97db0.png', '5da5e57a98198', '2019-10-15 11:57:54', '2019-10-15 11:57:54'),
(83, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da5e59852850.png', '5da5e59852c38', '2019-10-15 11:58:24', '2019-10-15 11:58:24'),
(84, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da5e98748058.jpg', '5da5e98748440', '2019-10-15 12:15:11', '2019-10-15 12:15:11'),
(85, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da5ea2d47c70.jpg', '5da5ea2d48058', '2019-10-15 12:17:57', '2019-10-15 12:17:57'),
(86, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da5ea33226c8.png', '5da5ea3322ab0', '2019-10-15 12:18:03', '2019-10-15 12:18:03'),
(87, 1, 'video', 'sample.mp4', '5da5ea4ec0620.mp4', '5da5ea4ec0620', '2019-10-15 12:18:30', '2019-10-15 12:18:30'),
(88, 1, 'video', 'voo.mp4', '5da5ea7e37aa0.mp4', '5da5ea7e37e88', '2019-10-15 12:19:18', '2019-10-15 12:19:18'),
(89, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da5edb099908.png', '5da5edb099cf0', '2019-10-15 12:32:56', '2019-10-15 12:32:56'),
(90, 1, 'image', 'button-group.png', '5da5edb616b48.png', '5da5edb616f30', '2019-10-15 12:33:02', '2019-10-15 12:33:02'),
(91, 1, 'video', 'sample.mp4', '5da5edbfe1d48.mp4', '5da5edbfe1d48', '2019-10-15 12:33:11', '2019-10-15 12:33:11'),
(92, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da5eef090498.png', '5da5eef090880', '2019-10-15 12:38:16', '2019-10-15 12:38:16'),
(93, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da5eef2a9ad8.jpg', '5da5eef2a9ad8', '2019-10-15 12:38:18', '2019-10-15 12:38:18'),
(94, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da5ef08b8d08.png', '5da5ef08b90f0', '2019-10-15 12:38:40', '2019-10-15 12:38:40'),
(95, 1, 'video', 'sample.mp4', '5da5efb701b58.mp4', '5da5efb701f40', '2019-10-15 12:41:35', '2019-10-15 12:41:35'),
(96, 1, 'image', 'photo_2019-10-10_20-30-50.jpg', '5da5efbe81650.jpg', '5da5efbe81a38', '2019-10-15 12:41:42', '2019-10-15 12:41:42'),
(97, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da5efc6ac5d0.png', '5da5efc6ac9b8', '2019-10-15 12:41:50', '2019-10-15 12:41:50'),
(98, 1, 'image', 'button-group.png', '5da5efcb591c8.png', '5da5efcb59d80', '2019-10-15 12:41:55', '2019-10-15 12:41:55'),
(99, 1, 'image', 'thumb-product-5d4afdac575ed.jpg', '5da5f05cdfa20.jpg', '5da5f05ce01f0', '2019-10-15 12:44:20', '2019-10-15 12:44:20'),
(100, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da71aa174748.png', '5da71aa174f18', '2019-10-16 09:56:57', '2019-10-16 09:56:57'),
(101, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da71ab70f618.png', '5da71ab70fa00', '2019-10-16 09:57:19', '2019-10-16 09:57:19'),
(102, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da71ad7ee868.png', '5da71ad7eec50', '2019-10-16 09:57:51', '2019-10-16 09:57:51'),
(103, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da71b0864960.png', '5da71b0864d48', '2019-10-16 09:58:40', '2019-10-16 09:58:40'),
(104, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da71b3e14c08.png', '5da71b3e14c08', '2019-10-16 09:59:34', '2019-10-16 09:59:34'),
(105, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da71b4ab2778.png', '5da71b4ab2b60', '2019-10-16 09:59:46', '2019-10-16 09:59:46'),
(106, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da71b6950528.png', '5da71b69510e0', '2019-10-16 10:00:17', '2019-10-16 10:00:17'),
(107, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da71b6dbeeb0.png', '5da71b6dbeeb0', '2019-10-16 10:00:21', '2019-10-16 10:00:21'),
(108, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da71b7365130.png', '5da71b7365900', '2019-10-16 10:00:27', '2019-10-16 10:00:27'),
(109, 1, 'video', 'voo.mp4', '5da71b7dae128.mp4', '5da71b7dae128', '2019-10-16 10:00:37', '2019-10-16 10:00:37'),
(110, 1, 'video', 'voo.mp4', '5da71b8715f90.mp4', '5da71b8716378', '2019-10-16 10:00:47', '2019-10-16 10:00:47'),
(111, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da71c9542e50.png', '5da71c9543238', '2019-10-16 10:05:17', '2019-10-16 10:05:17'),
(112, 1, 'video', 'voo.mp4', '5da71c9a9cfb8.mp4', '5da71c9a9d3a0', '2019-10-16 10:05:22', '2019-10-16 10:05:22'),
(113, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da71ca953020.png', '5da71ca953408', '2019-10-16 10:05:37', '2019-10-16 10:05:37'),
(114, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da71d20036b0.png', '5da71d2003a98', '2019-10-16 10:07:36', '2019-10-16 10:07:36'),
(115, 1, 'video', 'voo.mp4', '5da71d680ee48.mp4', '5da71d680fa00', '2019-10-16 10:08:48', '2019-10-16 10:08:48'),
(116, 1, 'video', 'voo.mp4', '5da71d70e7720.mp4', '5da71d70e8e90', '2019-10-16 10:08:56', '2019-10-16 10:08:56'),
(117, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da71e2574748.png', '5da71e2574b30', '2019-10-16 10:11:57', '2019-10-16 10:11:57'),
(118, 1, 'video', 'voo.mp4', '5da71e45f2300.mp4', '5da71e45f26e8', '2019-10-16 10:12:29', '2019-10-16 10:12:29'),
(119, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da7212b8e940.png', '5da7212b8ed28', '2019-10-16 10:24:51', '2019-10-16 10:24:51'),
(120, 1, 'video', 'voo.mp4', '5da7216342680.mp4', '5da7216343238', '2019-10-16 10:25:47', '2019-10-16 10:25:47'),
(121, 0, '', '', '5da7368c3d860.mp4', '5da7368c3e030', '2019-10-16 11:56:04', '2019-10-16 11:56:04'),
(122, 0, '', '', '5da736f1343f0.png', '5da736f134bc0', '2019-10-16 11:57:45', '2019-10-16 11:57:45'),
(123, 0, '', '', '5da7388de2518.png', '5da7388de4840', '2019-10-16 12:04:37', '2019-10-16 12:04:37'),
(124, 0, '', '', '5da738be8c618.mp4', '5da738be8d9a0', '2019-10-16 12:05:26', '2019-10-16 12:05:26'),
(125, 0, '', '', '5da738e7bc3b8.png', '5da738e7bdf10', '2019-10-16 12:06:07', '2019-10-16 12:06:07'),
(126, 0, '', '', '5da738f1ca648.png', '5da738f1cb9d0', '2019-10-16 12:06:17', '2019-10-16 12:06:17'),
(127, 1, 'video', '', '5da739f11e078.png', '5da739f11ffb8', '2019-10-16 12:10:33', '2019-10-16 12:10:33'),
(128, 1, 'video', '', '5da7592777a10.png', '5da7592779568', '2019-10-16 14:23:43', '2019-10-16 14:23:43'),
(129, 1, 'video', '', '5da75b9b79d38.mp4', '5da75b9b7c830', '2019-10-16 14:34:11', '2019-10-16 14:34:11'),
(130, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da781a47b0c0.png', '5da781a47b4a8', '2019-10-16 17:16:28', '2019-10-16 17:16:28'),
(131, 1, 'image', 'button-group.png', '5da781aaedcb0.png', '5da781aaee480', '2019-10-16 17:16:34', '2019-10-16 17:16:34'),
(132, 1, 'image', 'attach-5ccca5941ae78.jpg', '5da781c6e1960.jpg', '5da781c6e1d48', '2019-10-16 17:17:02', '2019-10-16 17:17:02'),
(133, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da7839b3c8c0.png', '5da7839b3dc48', '2019-10-16 17:24:51', '2019-10-16 17:24:51'),
(134, 1, 'image', 'attach-5ccca5941ae78.jpg', '5da783a5518b0.jpg', '5da783a5518b0', '2019-10-16 17:25:01', '2019-10-16 17:25:01'),
(135, 1, 'image', 'attach-5ccca5941ae78.jpg', '5da7841cda430.jpg', '5da7841cdb3d0', '2019-10-16 17:27:00', '2019-10-16 17:27:00'),
(136, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da7847398968.png', '5da7847399908', '2019-10-16 17:28:27', '2019-10-16 17:28:27'),
(137, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5da7849074360.png', '5da7849075300', '2019-10-16 17:28:56', '2019-10-16 17:28:56'),
(138, 1, 'image', '', '5da86ef17f328.png', '5da86ef17faf8', '2019-10-17 10:08:57', '2019-10-17 10:08:57'),
(139, 1, 'image', '', '5da86f08d13a8.png', '5da86f08d1790', '2019-10-17 10:09:20', '2019-10-17 10:09:20'),
(140, 1, 'image', '', '5da8703990498.png', '5da8703990c68', '2019-10-17 10:14:25', '2019-10-17 10:14:25'),
(141, 1, 'image', '', '5da87077101d0.png', '5da8707710d88', '2019-10-17 10:15:27', '2019-10-17 10:15:27'),
(142, 1, 'image', '', '5da8709ca1dd8.png', '5da8709ca25a8', '2019-10-17 10:16:04', '2019-10-17 10:16:04'),
(143, 1, 'image', '', '5da870c95f370.png', '5da870c95f758', '2019-10-17 10:16:49', '2019-10-17 10:16:49'),
(144, 1, 'image', '', '5da870cd02af8.jpg', '5da870cd02ee0', '2019-10-17 10:16:53', '2019-10-17 10:16:53'),
(145, 1, 'image', '', '5da870cf7a508.png', '5da870cf7a8f0', '2019-10-17 10:16:55', '2019-10-17 10:16:55'),
(146, 1, 'image', '', '5da8715ac8ed8.jpg', '5da8715ac92c0', '2019-10-17 10:19:14', '2019-10-17 10:19:14'),
(147, 1, 'image', '', '5da8747dcd208.png', '5da8747dce978', '2019-10-17 10:32:37', '2019-10-17 10:32:37'),
(148, 1, 'image', '', '5da874807a9b8.jpg', '5da874807ada0', '2019-10-17 10:32:40', '2019-10-17 10:32:40'),
(149, 1, 'image', '', '5da8749dced60.png', '5da8749dd00e8', '2019-10-17 10:33:09', '2019-10-17 10:33:09'),
(150, 1, 'image', '', '5da874ea3bdd0.png', '5da874ea3e0f8', '2019-10-17 10:34:26', '2019-10-17 10:34:26'),
(151, 1, 'image', '', '5da87525c2628.jpg', '5da87525c31e0', '2019-10-17 10:35:25', '2019-10-17 10:35:25'),
(152, 1, 'image', '', '5da8752a01838.png', '5da8752a01c20', '2019-10-17 10:35:30', '2019-10-17 10:35:30'),
(153, 1, 'image', '', '5da8752b918e8.jpg', '5da8752b91cd0', '2019-10-17 10:35:31', '2019-10-17 10:35:31'),
(154, 1, 'image', '', '5da87532b1c88.png', '5da87532b2070', '2019-10-17 10:35:38', '2019-10-17 10:35:38'),
(155, 1, 'image', '', '5da8753980b60.jpg', '5da8753981330', '2019-10-17 10:35:45', '2019-10-17 10:35:45'),
(156, 1, 'image', '', '5da8753d38ef0.png', '5da8753d392d8', '2019-10-17 10:35:49', '2019-10-17 10:35:49'),
(157, 1, 'image', '', '5da87a79c3d98.png', '5da87a79c4568', '2019-10-17 10:58:09', '2019-10-17 10:58:09'),
(158, 1, 'image', '', '5da87a7d09150.png', '5da87a7d09538', '2019-10-17 10:58:13', '2019-10-17 10:58:13'),
(159, 1, 'image', '', '5da87a8893828.png', '5da87a8893c10', '2019-10-17 10:58:24', '2019-10-17 10:58:24'),
(160, 1, 'video', '', '5da87aa3f23c8.png', '5da87aa3f3368', '2019-10-17 10:58:51', '2019-10-17 10:58:51'),
(161, 1, 'image', '', '5da891837f3f0.jpg', '5da891837fbc0', '2019-10-17 12:36:27', '2019-10-17 12:36:27'),
(162, 1, 'video', '', '5dab1c1d9fab0.mp4', '5dab1c1da19f0', '2019-10-19 10:52:21', '2019-10-19 10:52:21'),
(163, 1, 'video', '', '5dab1c40d5610.mp4', '5dab1c40d7550', '2019-10-19 10:52:56', '2019-10-19 10:52:56'),
(164, 1, 'image', 'heydari2.jpg', '5dac7c1a3ad68.jpg', '5dac7c1a3b920', '2019-10-20 11:54:10', '2019-10-20 11:54:10'),
(165, 1, 'image', 'heydari2.jpg', '5dac7ce1a44e8.jpg', '5dac7ce1a48d0', '2019-10-20 11:57:29', '2019-10-20 11:57:29'),
(166, 1, 'image', 'heydari2.jpg', '5dac7d1bc1d90.jpg', '5dac7d1bc2178', '2019-10-20 11:58:27', '2019-10-20 11:58:27'),
(167, 1, 'image', 'editor-5d686dd1a05af.jpg', '5dac7d44923d8.jpg', '5dac7d44927c0', '2019-10-20 11:59:08', '2019-10-20 11:59:08'),
(168, 1, 'image', 'heydari2.jpg', '5dac7d59b3b00.jpg', '5dac7d59b3ee8', '2019-10-20 11:59:29', '2019-10-20 11:59:29'),
(169, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5dac7d5d5a550.png', '5dac7d5d5a938', '2019-10-20 11:59:33', '2019-10-20 11:59:33'),
(170, 1, 'image', '1103967-gorgerous-karate-wallpaper-1920x1080-photos.jpg', '5dac7d645f758.jpg', '5dac7d645fb40', '2019-10-20 11:59:40', '2019-10-20 11:59:40'),
(171, 1, 'image', 'attach-5ccca5941ae78.jpg', '5dac7d94e8e90.jpg', '5dac7d94e9278', '2019-10-20 12:00:28', '2019-10-20 12:00:28'),
(172, 1, 'video', '', '5dadb7c1b9ca8.mp4', '5dadb7c1bb418', '2019-10-21 10:20:57', '2019-10-21 10:20:57'),
(173, 1, 'video', '', '5dadea05eb5a0.mp4', '5dadea05ed8c8', '2019-10-21 13:55:25', '2019-10-21 13:55:25'),
(174, 1, 'image', 'bingo.png', '5daf54e48f110.png', '5daf54e48f4f8', '2019-10-22 15:43:40', '2019-10-22 15:43:40'),
(175, 1, 'image', 'bingo.png', '5daf55244a380.png', '5daf55244a768', '2019-10-22 15:44:44', '2019-10-22 15:44:44'),
(176, 1, 'image', 'bingo.png', '5daf565ab6210.png', '5daf565ab65f8', '2019-10-22 15:49:54', '2019-10-22 15:49:54'),
(177, 1, 'image', 'IMG_20170914_000727 - Copy (2) - Copy.jpg', '5daf56c399520.jpg', '5daf56c399908', '2019-10-22 15:51:39', '2019-10-22 15:51:39'),
(178, 1, 'image', 'bingo.png', '5daf573087410.png', '5daf5730877f8', '2019-10-22 15:53:28', '2019-10-22 15:53:28'),
(179, 1, 'image', 'bingo.png', '5daf57637e388.png', '5daf57637e770', '2019-10-22 15:54:19', '2019-10-22 15:54:19'),
(180, 1, 'video', 'tele.mp4', '5daf6d250dac0.mp4', '5daf6d250e678', '2019-10-22 17:27:09', '2019-10-22 17:27:09'),
(181, 2, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5db084264d260.png', '5db084264d648', '2019-10-23 13:17:34', '2019-10-23 13:17:34'),
(182, 2, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5db084fd7cc18.png', '5db084fd7d000', '2019-10-23 13:21:09', '2019-10-23 13:21:09'),
(183, 2, 'image', 'heydari2.jpg', '5db0850353bd8.jpg', '5db0850353bd8', '2019-10-23 13:21:15', '2019-10-23 13:21:15'),
(184, 2, 'video', 'sample.mp4', '5db08701a6bf8.mp4', '5db08701a6fe0', '2019-10-23 13:29:45', '2019-10-23 13:29:45'),
(185, 1, 'image', 'bingo.png', '5db1b97512c00.png', '5db1b97512fe8', '2019-10-24 11:17:17', '2019-10-24 11:17:17'),
(186, 1, 'image', 'mockup-adjust-video.png', '5db1b982cd078.png', '5db1b982cd460', '2019-10-24 11:17:30', '2019-10-24 11:17:30'),
(187, 1, 'image', 'bingo.png', '5db1b9c258160.png', '5db1b9c258548', '2019-10-24 11:18:34', '2019-10-24 11:18:34'),
(188, 1, 'image', 'bingo.png', '5db1ba3d3c410.png', '5db1ba3d3c7f8', '2019-10-24 11:20:37', '2019-10-24 11:20:37'),
(189, 1, 'image', 'bingo.png', '5db1ba693eb20.png', '5db1ba693eb20', '2019-10-24 11:21:21', '2019-10-24 11:21:21'),
(190, 1, 'image', 'bingo.png', '5db1bb7b0bea0.png', '5db1bb7b0c288', '2019-10-24 11:25:55', '2019-10-24 11:25:55'),
(191, 1, 'image', 'bingo.png', '5db1bbbff3d90.png', '5db1bbbff4178', '2019-10-24 11:27:03', '2019-10-24 11:27:03'),
(192, 1, 'image', 'bingo.png', '5db1bbc8b8088.png', '5db1bbc8b8470', '2019-10-24 11:27:12', '2019-10-24 11:27:12'),
(193, 1, 'image', 'test-27.jpg', '5db1bbe8035e8.jpg', '5db1bbe8039d0', '2019-10-24 11:27:44', '2019-10-24 11:27:44'),
(194, 1, 'image', 'bingo.png', '5db1bbec5b428.png', '5db1bbec5b810', '2019-10-24 11:27:48', '2019-10-24 11:27:48'),
(195, 1, 'image', 'attach-5ccca5941ae78.jpg', '5db1bd17a8688.jpg', '5db1bd17a8a70', '2019-10-24 11:32:47', '2019-10-24 11:32:47'),
(196, 1, 'image', 'bingo.png', '5db1bdcd4c1f8.png', '5db1bdcd4c9c8', '2019-10-24 11:35:49', '2019-10-24 11:35:49'),
(197, 1, 'image', '9520.jpg', '5db1bdda611e8.jpg', '5db1bdda615d0', '2019-10-24 11:36:02', '2019-10-24 11:36:02'),
(198, 1, 'image', 'bingo.png', '5db1cb32638f8.png', '5db1cb3263ce0', '2019-10-24 12:32:58', '2019-10-24 12:32:58'),
(199, 1, 'image', 'test-27.jpg', '5db1cba5b22c8.jpg', '5db1cba5b26b0', '2019-10-24 12:34:53', '2019-10-24 12:34:53'),
(200, 1, 'image', 'bingo.png', '5db1ccd622600.png', '5db1ccd6229e8', '2019-10-24 12:39:58', '2019-10-24 12:39:58'),
(201, 1, 'image', 'bingo.png', '5db1cced041a0.png', '5db1cced04970', '2019-10-24 12:40:21', '2019-10-24 12:40:21'),
(202, 1, 'video', 'tele.mp4', '5db1ccff84850.mp4', '5db1ccff85020', '2019-10-24 12:40:39', '2019-10-24 12:40:39'),
(203, 1, 'image', 'bingo.png', '5db1cefb794a0.png', '5db1cefb79888', '2019-10-24 12:49:07', '2019-10-24 12:49:07'),
(204, 1, 'image', 'bingo.png', '5db1cf1c34ee0.png', '5db1cf1c34ee0', '2019-10-24 12:49:40', '2019-10-24 12:49:40'),
(205, 1, 'image', 'bingo.png', '5db1cf53d0340.png', '5db1cf53d0728', '2019-10-24 12:50:35', '2019-10-24 12:50:35'),
(206, 1, 'video', 'tele.mp4', '5db1d006137b8.mp4', '5db1d00613ba0', '2019-10-24 12:53:34', '2019-10-24 12:53:34'),
(207, 1, 'image', 'test-27.jpg', '5db1d029d5160.jpg', '5db1d029d5548', '2019-10-24 12:54:09', '2019-10-24 12:54:09'),
(208, 1, 'video', 'tele.mp4', '5db1d03367778.mp4', '5db1d03367b60', '2019-10-24 12:54:19', '2019-10-24 12:54:19'),
(209, 1, 'image', 'attach-5ccca5941ae78.jpg', '5db1d13382528.jpg', '5db1d13382910', '2019-10-24 12:58:35', '2019-10-24 12:58:35'),
(210, 1, 'image', 'bingo.png', '5db1d3b4d97b0.png', '5db1d3b4d97b0', '2019-10-24 13:09:16', '2019-10-24 13:09:16'),
(211, 1, 'image', 'attach-5ccca5941ae78.jpg', '5db1d3cb932b0.jpg', '5db1d3cb93698', '2019-10-24 13:09:39', '2019-10-24 13:09:39'),
(212, 1, 'image', 'attach-5ccca5941ae78.jpg', '5db1d66b8c550.jpg', '5db1d66b8c938', '2019-10-24 13:20:51', '2019-10-24 13:20:51'),
(213, 1, 'image', 'test-27.jpg', '5db1d6f165068.jpg', '5db1d6f165450', '2019-10-24 13:23:05', '2019-10-24 13:23:05'),
(214, 1, 'image', 'test-27.jpg', '5db1d9c132000.jpg', '5db1d9c132000', '2019-10-24 13:35:05', '2019-10-24 13:35:05'),
(215, 1, 'image', 'attach-5ccca5941ae78.jpg', '5db1d9dd63510.jpg', '5db1d9dd638f8', '2019-10-24 13:35:33', '2019-10-24 13:35:33'),
(216, 1, 'image', 'Mixed-Martial-Arts-Background-Wallpaper-04397.jpg', '5db1d9e793a80.jpg', '5db1d9e793e68', '2019-10-24 13:35:43', '2019-10-24 13:35:43'),
(217, 1, 'video', 'tele.mp4', '5db1dc10e2c20.mp4', '5db1dc10e3008', '2019-10-24 13:44:56', '2019-10-24 13:44:56'),
(218, 1, 'image', 'heydari1.jpg', '5db1df5d74e50.jpg', '5db1df5d75238', '2019-10-24 13:59:01', '2019-10-24 13:59:01'),
(219, 1, 'image', 'کاغذ-دیواری-متری-طرح-دانه-های بلور-برف-kids177064_13388_800x800.jpg', '5db1df7956608.jpg', '5db1df79569f0', '2019-10-24 13:59:29', '2019-10-24 13:59:29'),
(220, 1, 'video', '', '5db38c7cad250.jpg', '5db38c7caf960', '2019-10-25 20:29:56', '2019-10-25 20:29:56'),
(221, 1, 'video', '', '5db38c965b5b8.jpg', '5db38c965cd28', '2019-10-25 20:30:22', '2019-10-25 20:30:22'),
(222, 1, 'video', '', '5db38cdbdef30.jpg', '5db38cdbe0e70', '2019-10-25 20:31:31', '2019-10-25 20:31:31'),
(223, 1, 'video', '', '5db394e2e1e10.jpg', '5db394e2e3580', '2019-10-25 21:05:46', '2019-10-25 21:05:46'),
(224, 1, 'video', 'a4.jpg', '5db45a213fea8.jpg', '5db45a2140290', '2019-10-26 11:07:21', '2019-10-26 11:07:21'),
(225, 1, 'video', 'photo_2017-12-24_16-54-51-1030x713.jpg', '5db45a6d06c98.jpg', '5db45a6d07080', '2019-10-26 11:08:37', '2019-10-26 11:08:37'),
(226, 1, 'video', 'IMG_0876.JPG', '5db45b62692d0.JPG', '5db45b62696b8', '2019-10-26 11:12:42', '2019-10-26 11:12:42'),
(227, 1, 'video', 'building.jpg', '5db45f8e108d8.jpg', '5db45f8e10cc0', '2019-10-26 11:30:30', '2019-10-26 11:30:30'),
(228, 1, 'video', 'a4.jpg', '5db460b7e4778.jpg', '5db460b7e4b60', '2019-10-26 11:35:27', '2019-10-26 11:35:27'),
(229, 1, 'video', 'IMG_0875.JPG', '5db46106bb738.JPG', '5db46106bbb20', '2019-10-26 11:36:46', '2019-10-26 11:36:46'),
(230, 1, 'video', 'a4.jpg', '5db4612a3bc40.jpg', '5db4612a3c028', '2019-10-26 11:37:22', '2019-10-26 11:37:22'),
(231, 1, 'video', 'a4.jpg', '5db4623003200.jpg', '5db46230035e8', '2019-10-26 11:41:44', '2019-10-26 11:41:44'),
(232, 1, 'video', 'a4.jpg', '5db462cc24540.jpg', '5db462cc24928', '2019-10-26 11:44:20', '2019-10-26 11:44:20'),
(233, 1, 'video', 'a4.jpg', '5db462f56e0f0.jpg', '5db462f56e4d8', '2019-10-26 11:45:01', '2019-10-26 11:45:01'),
(234, 1, 'video', 'IMG_2665-e1519935599522-400x400.jpg', '5db4630fe7e28.jpg', '5db4630fe8210', '2019-10-26 11:45:27', '2019-10-26 11:45:27'),
(235, 1, 'resource', 'a4.jpg', '5db464525d750.jpg', '5db464525db38', '2019-10-26 11:50:50', '2019-10-26 11:50:50'),
(236, 1, 'resource', 'dars.png', '5db4653bd3608.png', '5db4653bd39f0', '2019-10-26 11:54:43', '2019-10-26 11:54:43'),
(237, 1, 'resource', 'IMG_0875.JPG', '5db466280b6d0.JPG', '5db466280b6d0', '2019-10-26 11:58:40', '2019-10-26 11:58:40'),
(238, 1, 'resource', 'IMG_0876.JPG', '5db4670236650.JPG', '5db4670236650', '2019-10-26 12:02:18', '2019-10-26 12:02:18'),
(239, 1, 'resource', 'a4.jpg', '5db46a2f60e00.jpg', '5db46a2f611e8', '2019-10-26 12:15:51', '2019-10-26 12:15:51'),
(240, 1, 'resource', 'material.jpg', '5db46a32736e0.jpg', '5db46a3273ac8', '2019-10-26 12:15:54', '2019-10-26 12:15:54'),
(241, 1, 'resource', 'banner1.jpg', '5db46a36cf3a0.jpg', '5db46a36cf788', '2019-10-26 12:15:58', '2019-10-26 12:15:58'),
(242, 1, 'video', 'a4.jpg', '5db46cb1d5548.jpg', '5db46cb1d5930', '2019-10-26 12:26:33', '2019-10-26 12:26:33'),
(243, 1, 'video', 'a4.jpg', '5db46cb4ca580.jpg', '5db46cb4ca968', '2019-10-26 12:26:36', '2019-10-26 12:26:36'),
(244, 1, 'resource', 'a4.jpg', '5db46cb93c7f8.jpg', '5db46cb93cbe0', '2019-10-26 12:26:41', '2019-10-26 12:26:41'),
(245, 1, 'resource', 'photo_2017-12-24_16-54-51-1030x713.jpg', '5db46cbb82cf8.jpg', '5db46cbb830e0', '2019-10-26 12:26:43', '2019-10-26 12:26:43'),
(246, 1, 'resource', 'material.jpg', '5db46cbe6d920.jpg', '5db46cbe6dd08', '2019-10-26 12:26:46', '2019-10-26 12:26:46'),
(247, 1, 'resource', 'photo_2017-12-24_16-54-51-1030x713.jpg', '5db46ccc012c0.jpg', '5db46ccc016a8', '2019-10-26 12:27:00', '2019-10-26 12:27:00'),
(248, 1, 'video', 'a4.jpg', '5db47e4699458.jpg', '5db47e4699c28', '2019-10-26 13:41:34', '2019-10-26 13:41:34'),
(249, 1, 'resource', 'dars.png', '5db47e49dde00.png', '5db47e49de1e8', '2019-10-26 13:41:37', '2019-10-26 13:41:37'),
(250, 1, 'resource', 'material.jpg', '5db47e4c9f218.jpg', '5db47e4c9f600', '2019-10-26 13:41:40', '2019-10-26 13:41:40'),
(251, 1, 'image', 'a4.jpg', '5db4c1fbd7168.jpg', '5db4c1fbd7550', '2019-10-26 18:30:27', '2019-10-26 18:30:27'),
(252, 1, 'video', 'a4.jpg', '5db4c25cc15c0.jpg', '5db4c25cc1d90', '2019-10-26 18:32:04', '2019-10-26 18:32:04'),
(253, 1, 'resource', 'a4.jpg', '5db4c9b5d13a8.jpg', '5db4c9b5d13a8', '2019-10-26 19:03:25', '2019-10-26 19:03:25'),
(254, 1, 'resource', 'a4.jpg', '5db4c9bb789b0.jpg', '5db4c9bb78d98', '2019-10-26 19:03:31', '2019-10-26 19:03:31'),
(255, 1, 'resource', 'building.jpg', '5db4c9bf6ddd0.jpg', '5db4c9bf6e1b8', '2019-10-26 19:03:35', '2019-10-26 19:03:35'),
(256, 1, 'resource', 'photo_2017-12-24_16-54-51-1030x713.jpg', '5db4c9c4059d8.jpg', '5db4c9c405dc0', '2019-10-26 19:03:40', '2019-10-26 19:03:40'),
(257, 1, 'resource', 'material.jpg', '5db4c9c6631f0.jpg', '5db4c9c6635d8', '2019-10-26 19:03:42', '2019-10-26 19:03:42'),
(258, 1, 'video', 'a4.jpg', '5db4dd67468e8.jpg', '5db4dd6747888', '2019-10-26 20:27:27', '2019-10-26 20:27:27'),
(259, 1, 'resource', 'a4.jpg', '5db4dd6d02710.jpg', '5db4dd6d032c8', '2019-10-26 20:27:33', '2019-10-26 20:27:33'),
(260, 1, 'resource', 'bet.png', '5db4dd70eadd0.png', '5db4dd70ec158', '2019-10-26 20:27:36', '2019-10-26 20:27:36'),
(261, 1, 'video', 'a4.jpg', '5db4de7aef420.jpg', '5db4de7af1360', '2019-10-26 20:32:02', '2019-10-26 20:32:02'),
(262, 1, 'image', 'a4.jpg', '5db4de7f4b320.jpg', '5db4de7f4c6a8', '2019-10-26 20:32:07', '2019-10-26 20:32:07'),
(263, 1, 'video', 'a4.jpg', '5db5d433b0c20.jpg', '5db5d433b13f0', '2019-10-27 14:00:27', '2019-10-27 14:00:27'),
(264, 1, 'image', 'IMG_2665-e1519935599522-400x400.jpg', '5db5d4d2c0a08.jpg', '5db5d4d2c0df0', '2019-10-27 14:03:06', '2019-10-27 14:03:06'),
(265, 1, 'video', 'photo_2017-12-24_16-54-51-1030x713.jpg', '5db5d4d7c5440.jpg', '5db5d4d7c5440', '2019-10-27 14:03:11', '2019-10-27 14:03:11'),
(266, 1, 'image', 'a4.jpg', '5db5e2fa6b6c0.jpg', '5db5e2fa6baa8', '2019-10-27 18:33:30', '2019-10-27 18:33:30'),
(267, 1, 'image', 'a4.jpg', '5db5e30c7cc18.jpg', '5db5e30c7d000', '2019-10-27 18:33:48', '2019-10-27 18:33:48'),
(268, 1, 'image', 'a4.jpg', '5db5e33dda430.jpg', '5db5e33dda818', '2019-10-27 18:34:37', '2019-10-27 18:34:37'),
(269, 1, 'image', 'a4.jpg', '5db5e3528d1d0.jpg', '5db5e3528d5b8', '2019-10-27 18:34:58', '2019-10-27 18:34:58'),
(270, 1, 'image', 'a4.jpg', '5db72d7a36718.jpg', '5db72d7a36b00', '2019-10-28 18:03:38', '2019-10-28 18:03:38'),
(271, 1, 'image', 'a4.jpg', '5db72fcd76688.jpg', '5db72fcd76688', '2019-10-28 18:13:33', '2019-10-28 18:13:33'),
(272, 1, 'image', 'photo_2017-12-24_16-54-51-1030x713.jpg', '5db73382be2f8.jpg', '5db73382be6e0', '2019-10-28 18:29:22', '2019-10-28 18:29:22'),
(273, 1, 'image', 'photo_2017-12-24_16-54-51-1030x713.jpg', '5db733aab71b0.jpg', '5db733aab71b0', '2019-10-28 18:30:02', '2019-10-28 18:30:02'),
(274, 1, 'image', 'a4.jpg', '5db73cf64f588.jpg', '5db73cf64f970', '2019-10-28 19:09:42', '2019-10-28 19:09:42'),
(275, 1, 'image', 'a4.jpg', '5db73d8b3f3b8.jpg', '5db73d8b3f7a0', '2019-10-28 19:12:11', '2019-10-28 19:12:11'),
(276, 1, 'image', 'a4.jpg', '5db73d90a3548.jpg', '5db73d90a3548', '2019-10-28 19:12:16', '2019-10-28 19:12:16'),
(277, 1, 'video', 'htaccess.mp4', '5db73da59b078.mp4', '5db73da59b078', '2019-10-28 19:12:37', '2019-10-28 19:12:37'),
(278, 1, 'image', '58908644ef646-sakhte-porte-honari-ba-photoshop.jpg', '5db74437f2300.jpg', '5db74437f26e8', '2019-10-28 19:40:39', '2019-10-28 19:40:39'),
(279, 1, 'image', '5c065ec36972e-amozesh-composer.jpg', '5db744463ff70.jpg', '5db7444640358', '2019-10-28 19:40:54', '2019-10-28 19:40:54'),
(280, 1, 'image', 'download.jpg', '5db7444a56ab8.jpg', '5db7444a56ea0', '2019-10-28 19:40:58', '2019-10-28 19:40:58'),
(281, 1, 'image', 'acc-21-22.jpg', '5db7444f4ab50.jpg', '5db7444f4af38', '2019-10-28 19:41:03', '2019-10-28 19:41:03'),
(282, 1, 'image', '58908644ef646-sakhte-porte-honari-ba-photoshop.jpg', '5db74453a8b38.jpg', '5db74453a8f20', '2019-10-28 19:41:07', '2019-10-28 19:41:07'),
(283, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5db7485252c38.jpg', '5db7485253020', '2019-10-28 19:58:10', '2019-10-28 19:58:10'),
(284, 1, 'image', '58908644ef646-sakhte-porte-honari-ba-photoshop.jpg', '5db7485739210.jpg', '5db74857395f8', '2019-10-28 19:58:15', '2019-10-28 19:58:15'),
(285, 1, 'image', '5c7a8ae21e062------------------------------------php.jpg', '5db7485d9a8a8.jpg', '5db7485d9ac90', '2019-10-28 19:58:21', '2019-10-28 19:58:21'),
(286, 1, 'video', 'htaccess.mp4', '5db7486664190.mp4', '5db7486664578', '2019-10-28 19:58:30', '2019-10-28 19:58:30'),
(287, 1, 'video', 'htaccess.mp4', '5db74e10b71b0.mp4', '5db74e10b7598', '2019-10-28 20:22:40', '2019-10-28 20:22:40'),
(288, 1, 'video', 'htaccess.mp4', '5db74e426d9e8.mp4', '5db74e426ddd0', '2019-10-28 20:23:30', '2019-10-28 20:23:30'),
(289, 1, 'image', 'order.png', '5dbaef94442a0.png', '5dbaef9444688', '2019-10-31 14:28:36', '2019-10-31 14:28:36'),
(290, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5dbaefdbd27f8.jpg', '5dbaefdbd2be0', '2019-10-31 14:29:47', '2019-10-31 14:29:47'),
(291, 1, 'image', 'download.jpg', '5dbaefe2c4180.jpg', '5dbaefe2c4568', '2019-10-31 14:29:54', '2019-10-31 14:29:54'),
(292, 1, 'image', '58908644ef646-sakhte-porte-honari-ba-photoshop.jpg', '5dbaefe6d56d8.jpg', '5dbaefe6d56d8', '2019-10-31 14:29:58', '2019-10-31 14:29:58'),
(293, 1, 'image', '58908644ef646-sakhte-porte-honari-ba-photoshop.jpg', '5dbaf66b48120.jpg', '5dbaf66b48508', '2019-10-31 14:57:47', '2019-10-31 14:57:47'),
(294, 1, 'image', '58908644ef646-sakhte-porte-honari-ba-photoshop.jpg', '5dbaf6f2ef4e8.jpg', '5dbaf6f2ef4e8', '2019-10-31 15:00:02', '2019-10-31 15:00:02'),
(295, 1, 'image', 'download.jpg', '5dbb20df7bae8.jpg', '5dbb20df7c2b8', '2019-10-31 17:58:55', '2019-10-31 17:58:55'),
(296, 1, 'image', '58908644ef646-sakhte-porte-honari-ba-photoshop.jpg', '5dbb2e8637910.jpg', '5dbb2e86380e0', '2019-10-31 18:57:10', '2019-10-31 18:57:10'),
(297, 1, 'image', '_Vector_Elements-512.png', '5dbb2edd4ada8.png', '5dbb2edd4b190', '2019-10-31 18:58:37', '2019-10-31 18:58:37'),
(298, 1, 'image', '_Vector_Elements-512.png', '5dbb2f4bef678.png', '5dbb2f4befa60', '2019-10-31 19:00:27', '2019-10-31 19:00:27'),
(299, 1, 'image', '5c7a8ae21e062------------------------------------php.jpg', '5dbb2faee17d0.jpg', '5dbb2faee1bb8', '2019-10-31 19:02:06', '2019-10-31 19:02:06'),
(300, 1, 'image', '5c065ec36972e-amozesh-composer.jpg', '5dbb356de71a8.jpg', '5dbb356de7590', '2019-10-31 19:26:37', '2019-10-31 19:26:37'),
(301, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5dbb3ab888220.jpg', '5dbb3ab888220', '2019-10-31 19:49:12', '2019-10-31 19:49:12'),
(302, 1, 'image', '5c7a8ae21e062------------------------------------php.jpg', '5dbb3aca70738.jpg', '5dbb3aca70b20', '2019-10-31 19:49:30', '2019-10-31 19:49:30'),
(303, 1, 'image', '5c065ec36972e-amozesh-composer.jpg', '5dbb3e5d1e6b8.jpg', '5dbb3e5d1eaa0', '2019-10-31 20:04:45', '2019-10-31 20:04:45'),
(304, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5dbda3393a340.jpg', '5dbda3393ab10', '2019-11-02 15:39:37', '2019-11-02 15:39:37'),
(305, 1, 'image', 'download.jpg', '5dbda906c59b8.jpg', '5dbda906c6188', '2019-11-02 16:04:22', '2019-11-02 16:04:22'),
(306, 1, 'image', '5c065ec36972e-amozesh-composer.jpg', '5dbdc44d529e0.jpg', '5dbdc44d52dc8', '2019-11-02 18:00:45', '2019-11-02 18:00:45'),
(307, 1, 'image', '5c065ec36972e-amozesh-composer.jpg', '5dbdc4ba652c0.jpg', '5dbdc4ba656a8', '2019-11-02 18:02:34', '2019-11-02 18:02:34'),
(308, 1, 'image', '58908644ef646-sakhte-porte-honari-ba-photoshop.jpg', '5dbdc6dfb7ef8.jpg', '5dbdc6dfb82e0', '2019-11-02 18:11:43', '2019-11-02 18:11:43'),
(309, 1, 'image', 'download.jpg', '5dbdc6e6da9a8.jpg', '5dbdc6e6dad90', '2019-11-02 18:11:50', '2019-11-02 18:11:50'),
(310, 1, 'image', '5c065ec36972e-amozesh-composer.jpg', '5dbdc6ea437b0.jpg', '5dbdc6ea43b98', '2019-11-02 18:11:54', '2019-11-02 18:11:54'),
(311, 1, 'image', 'download.jpg', '5dbdc6eca4a60.jpg', '5dbdc6eca4a60', '2019-11-02 18:11:56', '2019-11-02 18:11:56'),
(312, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5dbdc6f33e5a8.png', '5dbdc6f33e990', '2019-11-02 18:12:03', '2019-11-02 18:12:03'),
(313, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5dbdc7418b038.jpg', '5dbdc7418b420', '2019-11-02 18:13:21', '2019-11-02 18:13:21'),
(314, 1, 'image', 'development_it_technology_developer-05-512.png', '5dbdc74609600.png', '5dbdc746099e8', '2019-11-02 18:13:26', '2019-11-02 18:13:26'),
(315, 1, 'image', '5c065ec36972e-amozesh-composer.jpg', '5dbdc749bec58.jpg', '5dbdc749bec58', '2019-11-02 18:13:29', '2019-11-02 18:13:29'),
(316, 1, 'image', 'download.jpg', '5dbf2032226c8.jpg', '5dbf203222e98', '2019-11-03 18:45:06', '2019-11-03 18:45:06'),
(317, 1, 'image', 'download.jpg', '5dbf220ed8cc0.jpg', '5dbf220ed9c60', '2019-11-03 18:53:02', '2019-11-03 18:53:02'),
(318, 1, 'image', 'download.jpg', '5dbf22237eb58.jpg', '5dbf22237eb58', '2019-11-03 18:53:23', '2019-11-03 18:53:23'),
(319, 1, 'image', 'download.jpg', '5dbf22306d218.jpg', '5dbf22306d600', '2019-11-03 18:53:36', '2019-11-03 18:53:36'),
(320, 1, 'image', '5c7a8ae21e062------------------------------------php.jpg', '5dbf22d738e28.jpg', '5dbf22d739210', '2019-11-03 18:56:23', '2019-11-03 18:56:23'),
(321, 1, 'image', '5c065ec36972e-amozesh-composer.jpg', '5dbf237c850e8.jpg', '5dbf237c854d0', '2019-11-03 18:59:08', '2019-11-03 18:59:08'),
(322, 1, 'image', '58908644ef646-sakhte-porte-honari-ba-photoshop.jpg', '5dbf24a85fb40.jpg', '5dbf24a85ff28', '2019-11-03 19:04:08', '2019-11-03 19:04:08'),
(323, 1, 'image', '_Vector_Elements-512.png', '5dbf24ba6ca48.png', '5dbf24ba6ce30', '2019-11-03 19:04:26', '2019-11-03 19:04:26'),
(324, 1, 'image', 'download.jpg', '5dbf29d309088.jpg', '5dbf29d309858', '2019-11-03 19:26:11', '2019-11-03 19:26:11'),
(325, 1, 'video', 'download.png', '5dc07958f1b30.png', '5dc07958f1f18', '2019-11-04 19:17:44', '2019-11-04 19:17:44'),
(326, 1, 'video', '58908644ef646-sakhte-porte-honari-ba-photoshop.jpg', '5dc07a5423e38.jpg', '5dc07a5424220', '2019-11-04 19:21:56', '2019-11-04 19:21:56'),
(327, 1, 'video', '5c7a8ae21e062------------------------------------php.jpg', '5dc07a827a508.jpg', '5dc07a827a8f0', '2019-11-04 19:22:42', '2019-11-04 19:22:42'),
(328, 1, 'video', 'development_it_technology_developer-05-512.png', '5dc07ad9ad188.png', '5dc07ad9ad570', '2019-11-04 19:24:09', '2019-11-04 19:24:09'),
(329, 1, 'image', '58908644ef646-sakhte-porte-honari-ba-photoshop.jpg', '5dc09a949d788.jpg', '5dc09a949eef8', '2019-11-04 21:39:32', '2019-11-04 21:39:32'),
(330, 1, 'image', 'development_it_technology_developer-05-512.png', '5dc09a9f04e20.png', '5dc09a9f055f0', '2019-11-04 21:39:43', '2019-11-04 21:39:43'),
(331, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5dc1a7ed8ade0.jpg', '5dc1a7ed8b5b0', '2019-11-05 16:48:45', '2019-11-05 16:48:45'),
(332, 1, 'image', '58908644ef646-sakhte-porte-honari-ba-photoshop.jpg', '5dc1a80c56dd8.jpg', '5dc1a80c571c0', '2019-11-05 16:49:16', '2019-11-05 16:49:16'),
(333, 1, 'image', '58908644ef646-sakhte-porte-honari-ba-photoshop.jpg', '5dc1ab9a717a0.jpg', '5dc1ab9a71b88', '2019-11-05 17:04:26', '2019-11-05 17:04:26'),
(334, 1, 'image', 'download.jpg', '5dc1ab9da1158.jpg', '5dc1ab9da1540', '2019-11-05 17:04:29', '2019-11-05 17:04:29'),
(335, 1, 'image', '5c7a8ae21e062------------------------------------php.jpg', '5dc1aea17e2c0.jpg', '5dc1aea17e6a8', '2019-11-05 17:17:21', '2019-11-05 17:17:21'),
(336, 1, 'image', '5c7a8ae21e062------------------------------------php.jpg', '5dc1aef43bc40.jpg', '5dc1aef43c028', '2019-11-05 17:18:44', '2019-11-05 17:18:44'),
(337, 1, 'image', '5c7a8ae21e062------------------------------------php.jpg', '5dc1afba594e8.jpg', '5dc1afba598d0', '2019-11-05 17:22:02', '2019-11-05 17:22:02'),
(338, 1, 'image', 'acc-24-25.jpg', '5dc1b055a1158.jpg', '5dc1b055a1540', '2019-11-05 17:24:37', '2019-11-05 17:24:37'),
(339, 1, 'image', '_Vector_Elements-512.png', '5dc1b05a22218.png', '5dc1b05a22600', '2019-11-05 17:24:42', '2019-11-05 17:24:42'),
(340, 1, 'image', '_Vector_Elements-512.png', '5dc1b0adbcac0.png', '5dc1b0adbcea8', '2019-11-05 17:26:05', '2019-11-05 17:26:05'),
(341, 1, 'image', '58908644ef646-sakhte-porte-honari-ba-photoshop.jpg', '5dc1ffefabd38.jpg', '5dc1ffefac120', '2019-11-05 23:04:15', '2019-11-05 23:04:15'),
(342, 1, 'image', '58908644ef646-sakhte-porte-honari-ba-photoshop.jpg', '5dc2007ae8dc8.jpg', '5dc2007ae91b0', '2019-11-05 23:06:34', '2019-11-05 23:06:34'),
(343, 1, 'image', 'download.jpg', '5dc202e984c38.jpg', '5dc202e984c38', '2019-11-05 23:16:57', '2019-11-05 23:16:57'),
(344, 1, 'image', 'development_it_technology_developer-05-512.png', '5dc212ef8e878.png', '5dc212ef8f048', '2019-11-06 00:25:19', '2019-11-06 00:25:19'),
(345, 1, 'image', '_Vector_Elements-512.png', '5dc2136581970.png', '5dc2136581d58', '2019-11-06 00:27:17', '2019-11-06 00:27:17'),
(346, 1, 'image', '5c065ec36972e-amozesh-composer.jpg', '5dc367ba90f88.jpg', '5dc367ba91370', '2019-11-07 00:39:22', '2019-11-07 00:39:22'),
(347, 1, 'image', '_Vector_Elements-512.png', '5dc367de3a8b8.png', '5dc367de3b088', '2019-11-07 00:39:58', '2019-11-07 00:39:58'),
(348, 1, 'image', '_Vector_Elements-512.png', '5dc367ea7fe18.png', '5dc367ea80200', '2019-11-07 00:40:10', '2019-11-07 00:40:10'),
(349, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5dc36ca003db8.jpg', '5dc36ca0041a0', '2019-11-07 01:00:16', '2019-11-07 01:00:16'),
(350, 1, 'resource', '58908644ef646-sakhte-porte-honari-ba-photoshop.jpg', '5dc36e5ab8858.jpg', '5dc36e5ab8c40', '2019-11-07 01:07:38', '2019-11-07 01:07:38'),
(351, 1, 'resource', 'acc-21-22.jpg', '5dc36e6151bd0.jpg', '5dc36e6151bd0', '2019-11-07 01:07:45', '2019-11-07 01:07:45'),
(352, 1, 'video', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5dc36e6774680.jpg', '5dc36e6774a68', '2019-11-07 01:07:51', '2019-11-07 01:07:51'),
(353, 1, 'image', 'download.jpg', '5dc3767a74e50.jpg', '5dc3767a75238', '2019-11-07 01:42:18', '2019-11-07 01:42:18'),
(354, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5dc8b5f509c40.jpg', '5dc8b5f509c40', '2019-11-11 01:14:29', '2019-11-11 01:14:29'),
(355, 1, 'video', '58908644ef646-sakhte-porte-honari-ba-photoshop.jpg', '5dc8b5fcefbf0.jpg', '5dc8b5fceffd8', '2019-11-11 01:14:36', '2019-11-11 01:14:36'),
(356, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5dc8b91b4b320.jpg', '5dc8b91b4b708', '2019-11-11 01:27:55', '2019-11-11 01:27:55'),
(357, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5dc9e7ac2d690.jpg', '5dc9e7ac2da78', '2019-11-11 22:58:52', '2019-11-11 22:58:52'),
(358, 1, 'image', '58908644ef646-sakhte-porte-honari-ba-photoshop.jpg', '5dc9e7df9cbd0.jpg', '5dc9e7df9cfb8', '2019-11-11 22:59:43', '2019-11-11 22:59:43'),
(359, 1, 'image', 'attach-5ccca5941ae78.jpg', '5dcb641bd0ca0.jpg', '5dcb641bd1470', '2019-11-13 02:02:03', '2019-11-13 02:02:03'),
(360, 1, 'image', '9520.jpg', '5dcb6436a8048.jpg', '5dcb6436a8430', '2019-11-13 02:02:30', '2019-11-13 02:02:30'),
(361, 1, 'image', '9520.jpg', '5dcb64cc17f98.jpg', '5dcb64cc18380', '2019-11-13 02:05:00', '2019-11-13 02:05:00'),
(362, 1, 'image', 'download.jpg', '5dcb67128ea08.jpg', '5dcb67128edf0', '2019-11-13 02:14:42', '2019-11-13 02:14:42'),
(363, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5dcb676ec7c18.jpg', '5dcb676ec8000', '2019-11-13 02:16:14', '2019-11-13 02:16:14'),
(364, 1, 'image', '58908644ef646-sakhte-porte-honari-ba-photoshop.jpg', '5dcb742d6cb10.jpg', '5dcb742d6cef8', '2019-11-13 03:10:37', '2019-11-13 03:10:37'),
(365, 1, 'image', '5c7a8ae21e062------------------------------------php.jpg', '5dcb746c65db0.jpg', '5dcb746c66198', '2019-11-13 03:11:40', '2019-11-13 03:11:40'),
(366, 1, 'image', 'editor-5d686dd1a05af.jpg', '5dcb83c8e0e70.jpg', '5dcb83c8e1258', '2019-11-13 04:17:12', '2019-11-13 04:17:12'),
(367, 1, 'image', 'screencapture-localhost-wallex-2019-10-15-17_49_48.png', '5dcca3d57a378.png', '5dcca3d57a760', '2019-11-14 00:46:13', '2019-11-14 00:46:13'),
(368, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5dce77c85ab90.jpg', '5dce77c85af78', '2019-11-15 10:02:48', '2019-11-15 10:02:48'),
(369, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5dce7819db240.jpg', '5dce7819db628', '2019-11-15 10:04:09', '2019-11-15 10:04:09'),
(370, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5dce78226c4d0.jpg', '5dce78226c8b8', '2019-11-15 10:04:18', '2019-11-15 10:04:18'),
(371, 1, 'image', 'vps.png', '5dce7848428d8.png', '5dce784842cc0', '2019-11-15 10:04:56', '2019-11-15 10:04:56'),
(372, 1, 'image', 'vps.png', '5dce78686c8b8.png', '5dce78686c8b8', '2019-11-15 10:05:28', '2019-11-15 10:05:28'),
(373, 1, 'image', 'vps.png', '5dce793b75558.png', '5dce793b75940', '2019-11-15 10:08:59', '2019-11-15 10:08:59'),
(374, 1, 'image', 'vps.png', '5dce796cd2d70.png', '5dce796cd3158', '2019-11-15 10:09:48', '2019-11-15 10:09:48'),
(375, 1, 'image', 'vps.png', '5dce7a184ec28.png', '5dce7a184f010', '2019-11-15 10:12:40', '2019-11-15 10:12:40'),
(376, 1, 'image', 'vps.png', '5dce7a2439850.png', '5dce7a2439c38', '2019-11-15 10:12:52', '2019-11-15 10:12:52'),
(377, 1, 'image', 'vps.png', '5dce7a9e13308.png', '5dce7a9e136f0', '2019-11-15 10:14:54', '2019-11-15 10:14:54'),
(378, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5dce7bc6de8f0.jpg', '5dce7bc6decd8', '2019-11-15 10:19:50', '2019-11-15 10:19:50'),
(379, 1, 'image', 'vps.png', '5dce7c34e1000.png', '5dce7c34e13e8', '2019-11-15 10:21:40', '2019-11-15 10:21:40'),
(380, 1, 'image', '9520.jpg', '5dce817216da0.jpg', '5dce817217570', '2019-11-15 10:44:02', '2019-11-15 10:44:02'),
(381, 1, 'image', 'vps.png', '5dce830d37cf8.png', '5dce830d380e0', '2019-11-15 10:50:53', '2019-11-15 10:50:53'),
(382, 1, 'image', 'development_it_technology_developer-05-512.png', '5dce8723c9518.png', '5dce8723c9900', '2019-11-15 11:08:19', '2019-11-15 11:08:19'),
(383, 1, 'image', 'button-group.png', '5dce87301e2d0.png', '5dce87301e6b8', '2019-11-15 11:08:32', '2019-11-15 11:08:32'),
(384, 1, 'image', 'vps.png', '5dce87515b748.png', '5dce87515bb30', '2019-11-15 11:09:05', '2019-11-15 11:09:05'),
(385, 1, 'image', 'development_it_technology_developer-05-512.png', '5dce8757ce720.png', '5dce8757ceb08', '2019-11-15 11:09:11', '2019-11-15 11:09:11'),
(386, 1, 'image', 'vps.png', '5dce87810a668.png', '5dce87810aa50', '2019-11-15 11:09:53', '2019-11-15 11:09:53'),
(387, 1, 'image', 'download.png', '5dce8786ec3b0.png', '5dce8786ec798', '2019-11-15 11:09:58', '2019-11-15 11:09:58'),
(388, 1, 'image', 'development_it_technology_developer-05-512.png', '5dce87e65edf8.png', '5dce87e65f1e0', '2019-11-15 11:11:34', '2019-11-15 11:11:34'),
(389, 1, 'image', 'vps.png', '5dce87ea92630.png', '5dce87ea92a18', '2019-11-15 11:11:38', '2019-11-15 11:11:38'),
(390, 1, 'image', 'development_it_technology_developer-05-512.png', '5dce8b1464bb8.png', '5dce8b1464fa0', '2019-11-15 11:25:08', '2019-11-15 11:25:08'),
(391, 1, 'image', 'mockup-adjust-video.png', '5dce8b21b31a0.png', '5dce8b21b3588', '2019-11-15 11:25:21', '2019-11-15 11:25:21'),
(392, 1, 'image', 'development_it_technology_developer-05-512.png', '5dce8f88db240.png', '5dce8f88db628', '2019-11-15 11:44:08', '2019-11-15 11:44:08'),
(393, 1, 'image', 'download.jpg', '5dce8f91741d0.jpg', '5dce8f91749a0', '2019-11-15 11:44:17', '2019-11-15 11:44:17'),
(394, 1, 'video', 'vps.png', '5dcec6d0741d0.png', '5dcec6d0745b8', '2019-11-15 15:40:00', '2019-11-15 15:40:00'),
(395, 1, 'resource', 'mockup-adjust-video.png', '5dcec6d556d10.png', '5dcec6d5570f8', '2019-11-15 15:40:05', '2019-11-15 15:40:05'),
(396, 1, 'video', 'mockup-adjust-video.png', '5dcec6e4ae768.png', '5dcec6e4aef38', '2019-11-15 15:40:20', '2019-11-15 15:40:20'),
(397, 1, 'video', 'vps.png', '5dcec700d0278.png', '5dcec700d0660', '2019-11-15 15:40:48', '2019-11-15 15:40:48'),
(398, 1, 'resource', 'DAFT.png', '5dcec70560d38.png', '5dcec70561508', '2019-11-15 15:40:53', '2019-11-15 15:40:53'),
(399, 1, 'resource', 'heydari3.jpg', '5dcec709549e8.jpg', '5dcec709551b8', '2019-11-15 15:40:57', '2019-11-15 15:40:57');
INSERT INTO `uploads` (`id`, `user_id`, `type`, `original_name`, `file_name`, `token`, `created_at`, `updated_at`) VALUES
(400, 1, 'video', 'heydari1.jpg', '5dcec71be13e8.jpg', '5dcec71be17d0', '2019-11-15 15:41:15', '2019-11-15 15:41:15'),
(401, 1, 'image', 'phinxx.jpg', '5dcec75d9ca40.jpg', '5dcec75d9ce28', '2019-11-15 15:42:21', '2019-11-15 15:42:21'),
(402, 1, 'video', 'htaccess.mp4', '5dcec7696efc8.mp4', '5dcec7696f3b0', '2019-11-15 15:42:33', '2019-11-15 15:42:33'),
(403, 1, 'image', '9520.jpg', '5dd545cc23be0.jpg', '5dd545cc243b0', '2019-11-20 13:55:24', '2019-11-20 13:55:24'),
(404, 1, 'image', '5c065ec36972e-amozesh-composer.jpg', '5dd545d1558c0.jpg', '5dd545d155ca8', '2019-11-20 13:55:29', '2019-11-20 13:55:29'),
(405, 1, 'image', '9520.jpg', '5dd5466518830.jpg', '5dd5466519000', '2019-11-20 13:57:57', '2019-11-20 13:57:57'),
(406, 1, 'video', 'htaccess.mp4', '5dd5466c30700.mp4', '5dd5466c30ae8', '2019-11-20 13:58:04', '2019-11-20 13:58:04'),
(407, 1, 'resource', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5dd6432b56608.jpg', '5dd6432b56dd8', '2019-11-21 07:56:27', '2019-11-21 07:56:27'),
(408, 1, 'resource', 'course-bg.png', '5dd6433146ff0.png', '5dd64331473d8', '2019-11-21 07:56:33', '2019-11-21 07:56:33'),
(409, 1, 'video', 'htaccess.mp4', '5dd6435474680.mp4', '5dd6435474a68', '2019-11-21 07:57:08', '2019-11-21 07:57:08'),
(410, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5dd66bf197518.jpg', '5dd66bf197900', '2019-11-21 10:50:25', '2019-11-21 10:50:25'),
(411, 1, 'image', '_Vector_Elements-512.png', '5dd66c4ec8e10.png', '5dd66c4ec91f8', '2019-11-21 10:51:58', '2019-11-21 10:51:58'),
(412, 1, 'video', 'htaccess.mp4', '5dd66c56e9598.mp4', '5dd66c56e9980', '2019-11-21 10:52:06', '2019-11-21 10:52:06'),
(413, 1, 'image', '_Vector_Elements-512.png', '5dd66cdba76e8.png', '5dd66cdba7ad0', '2019-11-21 10:54:19', '2019-11-21 10:54:19'),
(414, 1, 'video', 'htaccess.mp4', '5dd66ceac2880.mp4', '5dd66ceac2c68', '2019-11-21 10:54:34', '2019-11-21 10:54:34'),
(415, 1, 'image', '_Vector_Elements-512.png', '5dd66e9917250.png', '5dd66e9917250', '2019-11-21 11:01:45', '2019-11-21 11:01:45'),
(416, 1, 'video', 'htaccess.mp4', '5dd66e9b40a60.mp4', '5dd66e9b41230', '2019-11-21 11:01:47', '2019-11-21 11:01:47'),
(417, 1, 'image', '2705222.jpg', '5dd675db44cc8.jpg', '5dd675db450b0', '2019-11-21 11:32:43', '2019-11-21 11:32:43'),
(418, 1, 'video', 'htaccess.mp4', '5dd675e04fc90.mp4', '5dd675e050078', '2019-11-21 11:32:48', '2019-11-21 11:32:48'),
(419, 1, 'image', 'attach-5ccca5941ae78.jpg', '5dd68b894ecf0.jpg', '5dd68b894f0d8', '2019-11-21 13:05:13', '2019-11-21 13:05:13'),
(420, 1, 'image', 'IMG_20170914_000727 - Copy (2) - Copy.jpg', '5dd68b94a0988.jpg', '5dd68b94a0d70', '2019-11-21 13:05:24', '2019-11-21 13:05:24'),
(421, 1, 'image', 'acrobolix_background_martial_arts_background_for_tricking-1024x487.jpg', '5dd6b5103b088.jpg', '5dd6b5103b470', '2019-11-21 16:02:24', '2019-11-21 16:02:24'),
(422, 1, 'image', '_Vector_Elements-512.png', '5dd6b790cb520.png', '5dd6b790cb908', '2019-11-21 16:13:04', '2019-11-21 16:13:04'),
(423, 1, 'image', 'download.jpg', '5dd6b7cadde00.jpg', '5dd6b7cade1e8', '2019-11-21 16:14:02', '2019-11-21 16:14:02'),
(424, 1, 'image', 'download.jpg', '5dd6b7d0717a0.jpg', '5dd6b7d071b88', '2019-11-21 16:14:08', '2019-11-21 16:14:08'),
(425, 1, 'image', '_Vector_Elements-512.png', '5dd6b8a2e2c20.png', '5dd6b8a2e3008', '2019-11-21 16:17:38', '2019-11-21 16:17:38'),
(426, 1, 'image', '_Vector_Elements-512.png', '5dd6bc3f1d010.png', '5dd6bc3f1d3f8', '2019-11-21 16:33:03', '2019-11-21 16:33:03'),
(427, 1, 'image', '_Vector_Elements-512.png', '5dd6bd2629b30.png', '5dd6bd2629f18', '2019-11-21 16:36:54', '2019-11-21 16:36:54'),
(428, 1, 'image', 'development_it_technology_developer-05-512.png', '5dd6bd2c00ed8.png', '5dd6bd2c00ed8', '2019-11-21 16:37:00', '2019-11-21 16:37:00'),
(429, 1, 'image', '_Vector_Elements-512.png', '5dd6be6d25cb0.png', '5dd6be6d26098', '2019-11-21 16:42:21', '2019-11-21 16:42:21'),
(430, 1, 'image', 'development_it_technology_developer-05-512.png', '5dd6be6d5fa78.png', '5dd6be6d5fe60', '2019-11-21 16:42:21', '2019-11-21 16:42:21'),
(431, 1, 'image', '_Vector_Elements-512.png', '5dd6be6d74680.png', '5dd6be6d75238', '2019-11-21 16:42:21', '2019-11-21 16:42:21'),
(432, 1, 'image', 'development_it_technology_developer-05-512.png', '5dd6bf844cdb0.png', '5dd6bf844d580', '2019-11-21 16:47:00', '2019-11-21 16:47:00'),
(433, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5dd6bfad3b470.jpg', '5dd6bfad3b858', '2019-11-21 16:47:41', '2019-11-21 16:47:41'),
(434, 1, 'image', '5c7a8ae21e062------------------------------------php.jpg', '5dd6bfb3229e8.jpg', '5dd6bfb3229e8', '2019-11-21 16:47:47', '2019-11-21 16:47:47'),
(435, 1, 'image', '5c7a8ae21e062------------------------------------php.jpg', '5dd7c65b37528.jpg', '5dd7c65b37910', '2019-11-22 11:28:27', '2019-11-22 11:28:27'),
(436, 1, 'image', '5c7a8ae21e062------------------------------------php.jpg', '5dd7c7f4c3370.jpg', '5dd7c7f4c4310', '2019-11-22 11:35:16', '2019-11-22 11:35:16'),
(437, 1, 'image', 'download.jpg', '5dd7c800dd950.jpg', '5dd7c800ddd38', '2019-11-22 11:35:28', '2019-11-22 11:35:28'),
(438, 1, 'image', '5c065ec36972e-amozesh-composer.jpg', '5dd7ce8be1000.jpg', '5dd7ce8be1000', '2019-11-22 12:03:23', '2019-11-22 12:03:23'),
(439, 1, 'image', '_Vector_Elements-512.png', '5dd7cee290308.png', '5dd7cee290308', '2019-11-22 12:04:50', '2019-11-22 12:04:50'),
(440, 1, 'image', '_Vector_Elements-512.png', '5dd7cee8ad3e0.png', '5dd7cee8ad7c8', '2019-11-22 12:04:56', '2019-11-22 12:04:56'),
(441, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5dd8e85636718.jpg', '5dd8e85636ee8', '2019-11-23 08:05:42', '2019-11-23 08:05:42'),
(442, 1, 'image', '_Vector_Elements-512.png', '5dda71643dab8.png', '5dda71643e288', '2019-11-24 12:02:44', '2019-11-24 12:02:44'),
(443, 1, 'image', 'attach-5ccca5941ae78.jpg', '5dda71726f798.jpg', '5dda71726f798', '2019-11-24 12:02:58', '2019-11-24 12:02:58'),
(444, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5dda77c7e3328.jpg', '5dda77c7e3710', '2019-11-24 12:29:59', '2019-11-24 12:29:59'),
(445, 1, 'image', 'Mixed-Martial-Arts-Background-Wallpaper-04397.jpg', '5dda78103fde0.jpg', '5dda7810405b0', '2019-11-24 12:31:12', '2019-11-24 12:31:12'),
(446, 1, 'image', 'download.jpg', '5ddaa912c6250.jpg', '5ddaa912c6a20', '2019-11-24 16:00:18', '2019-11-24 16:00:18'),
(447, 1, 'image', 'download.jpg', '5ddaa94110fe0.jpg', '5ddaa941113c8', '2019-11-24 16:01:05', '2019-11-24 16:01:05'),
(448, 1, 'image', 'download.jpg', '5ddaaa7ca00f0.jpg', '5ddaaa7ca04d8', '2019-11-24 16:06:20', '2019-11-24 16:06:20'),
(449, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5ddab7ceda688.jpg', '5ddab7cedae58', '2019-11-24 17:03:10', '2019-11-24 17:03:10'),
(450, 1, 'image', '5c065ec36972e-amozesh-composer.jpg', '5ddab7d6a5eb0.jpg', '5ddab7d6a6298', '2019-11-24 17:03:18', '2019-11-24 17:03:18'),
(451, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5ddabbdbd77a8.jpg', '5ddabbdbd7b90', '2019-11-24 17:20:27', '2019-11-24 17:20:27'),
(452, 1, 'video', 'materialize-src-v1.0.0.zip', '5ddabbe6282f8.zip', '5ddabbe628ac8', '2019-11-24 17:20:38', '2019-11-24 17:20:38'),
(453, 1, 'image', '58908644ef646-sakhte-porte-honari-ba-photoshop.jpg', '5ddbc2da6c1b0.jpg', '5ddbc2da6c598', '2019-11-25 12:02:34', '2019-11-25 12:02:34'),
(454, 1, 'video', 'htaccess.mp4', '5ddbc2df94250.mp4', '5ddbc2df94250', '2019-11-25 12:02:39', '2019-11-25 12:02:39'),
(455, 1, 'image', 'development_it_technology_developer-05-512.png', '5ddd4cac6ca48.png', '5ddd4cac6ce30', '2019-11-26 16:02:52', '2019-11-26 16:02:52'),
(456, 1, 'video', 'htaccess.mp4', '5ddd4cb3bdf10.mp4', '5ddd4cb3be2f8', '2019-11-26 16:02:59', '2019-11-26 16:02:59'),
(457, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5dde9fe375d28.jpg', '5dde9fe376110', '2019-11-27 16:10:11', '2019-11-27 16:10:11'),
(458, 1, 'video', 'htaccess.mp4', '5dde9ff083018.mp4', '5dde9ff083400', '2019-11-27 16:10:24', '2019-11-27 16:10:24'),
(459, 1, 'image', '5c065ec36972e-amozesh-composer.jpg', '5ddea00f87e38.jpg', '5ddea00f88220', '2019-11-27 16:10:55', '2019-11-27 16:10:55'),
(460, 1, 'image', '_Vector_Elements-512.png', '5ddea54c8ff20.png', '5ddea54c906f0', '2019-11-27 16:33:16', '2019-11-27 16:33:16'),
(461, 1, 'image', '_Vector_Elements-512.png', '5ddea568e6dc0.png', '5ddea568e71a8', '2019-11-27 16:33:44', '2019-11-27 16:33:44'),
(462, 1, 'video', 'htaccess.mp4', '5ddea581d9ad0.mp4', '5ddea581d9eb8', '2019-11-27 16:34:09', '2019-11-27 16:34:09'),
(463, 1, 'image', 'attach-5ccca5941ae78.jpg', '5ddea74c866c8.jpg', '5ddea74c86ab0', '2019-11-27 16:41:48', '2019-11-27 16:41:48'),
(464, 1, 'video', 'htaccess.mp4', '5ddea75366ee0.mp4', '5ddea753672c8', '2019-11-27 16:41:55', '2019-11-27 16:41:55'),
(465, 1, 'image', '_Vector_Elements-512.png', '5ddeaafd75d28.png', '5ddeaafd76110', '2019-11-27 16:57:33', '2019-11-27 16:57:33'),
(466, 1, 'video', 'htaccess.mp4', '5ddeab03d9eb8.mp4', '5ddeab03da688', '2019-11-27 16:57:39', '2019-11-27 16:57:39'),
(467, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5ddeacaea37a0.jpg', '5ddeacaea37a0', '2019-11-27 17:04:46', '2019-11-27 17:04:46'),
(468, 1, 'image', '5c7a8ae21e062------------------------------------php.jpg', '5ddeace30ecb8.jpg', '5ddeace30f0a0', '2019-11-27 17:05:39', '2019-11-27 17:05:39'),
(469, 1, 'image', 'download.jpg', '5ddeae4777c68.jpg', '5ddeae4778438', '2019-11-27 17:11:35', '2019-11-27 17:11:35'),
(470, 1, 'image', '_Vector_Elements-512.png', '5ddeae4e04c90.png', '5ddeae4e05078', '2019-11-27 17:11:42', '2019-11-27 17:11:42'),
(471, 1, 'video', 'htaccess.mp4', '5ddeae6751b08.mp4', '5ddeae6751ef0', '2019-11-27 17:12:07', '2019-11-27 17:12:07'),
(472, 1, 'image', 'development_it_technology_developer-05-512.png', '5ddeaf464e840.png', '5ddeaf464ec28', '2019-11-27 17:15:50', '2019-11-27 17:15:50'),
(473, 1, 'image', '5c065ec36972e-amozesh-composer.jpg', '5ddeaf58522d8.jpg', '5ddeaf58526c0', '2019-11-27 17:16:08', '2019-11-27 17:16:08'),
(474, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5ddeafeb165d0.jpg', '5ddeafeb17188', '2019-11-27 17:18:35', '2019-11-27 17:18:35'),
(475, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5ddeb03fdb240.jpg', '5ddeb03fdb628', '2019-11-27 17:19:59', '2019-11-27 17:19:59'),
(476, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5ddeb064699d8.jpg', '5ddeb064699d8', '2019-11-27 17:20:36', '2019-11-27 17:20:36'),
(477, 1, 'image', 'download.jpg', '5ddeb0cb59808.jpg', '5ddeb0cb59bf0', '2019-11-27 17:22:19', '2019-11-27 17:22:19'),
(478, 1, 'video', 'htaccess.mp4', '5ddeb0d92f440.mp4', '5ddeb0d92f828', '2019-11-27 17:22:33', '2019-11-27 17:22:33'),
(479, 1, 'image', '5c065ec36972e-amozesh-composer.jpg', '5ddeb166359d0.jpg', '5ddeb16635db8', '2019-11-27 17:24:54', '2019-11-27 17:24:54'),
(480, 1, 'image', 'heydari1.jpg', '5ddeb397c3758.jpg', '5ddeb397c3b40', '2019-11-27 17:34:15', '2019-11-27 17:34:15'),
(481, 1, 'image', 'heydari3.jpg', '5ddeb39f45ba0.jpg', '5ddeb39f45f88', '2019-11-27 17:34:23', '2019-11-27 17:34:23'),
(482, 1, 'image', 'test-27.jpg', '5ddeb46b1f658.jpg', '5ddeb46b1fa40', '2019-11-27 17:37:47', '2019-11-27 17:37:47'),
(483, 1, 'image', '5c065ec36972e-amozesh-composer.jpg', '5ddeb538afed8.jpg', '5ddeb538b02c0', '2019-11-27 17:41:12', '2019-11-27 17:41:12'),
(484, 1, 'image', 'photo_2019-12-02_13-40-52.jpg', '5dece7743c8c0.jpg', '5dece7743cca8', '2019-12-08 12:07:16', '2019-12-08 12:07:16'),
(485, 1, 'zip', 'parallax-template.zip', '5ded211f7bc78.zip', '5ded211f7c060', '2019-12-08 16:13:19', '2019-12-08 16:13:19'),
(486, 1, 'zip', 'starter-template.zip', '5ded212fda818.zip', '5ded212fdac00', '2019-12-08 16:13:35', '2019-12-08 16:13:35'),
(487, 1, 'zip', 'starter-template.zip', '5ded216fcf080.zip', '5ded216fcf468', '2019-12-08 16:14:39', '2019-12-08 16:14:39'),
(488, 1, 'zip', 'starter-template.zip', '5ded219318e70.zip', '5ded219319258', '2019-12-08 16:15:15', '2019-12-08 16:15:15'),
(489, 1, 'image', 'photo_2018-09-06_21-53-30.jpg', '5ded237913c68.jpg', '5ded237914050', '2019-12-08 16:23:21', '2019-12-08 16:23:21'),
(490, 1, 'zip', 'Desktop.zip', '5ded2390aa690.zip', '5ded2390aaa78', '2019-12-08 16:23:44', '2019-12-08 16:23:44'),
(491, 1, 'zip', 'materialize-v1.0.0.zip', '5ded2455c11d8.zip', '5ded2455c15c0', '2019-12-08 16:27:01', '2019-12-08 16:27:01'),
(492, 1, 'zip', 'materialize-v1.0.0.zip', '5ded25c31bd50.zip', '5ded25c31c138', '2019-12-08 16:33:07', '2019-12-08 16:33:07'),
(493, 1, 'image', '58908644ef646-sakhte-porte-honari-ba-photoshop.jpg', '5ded2602dc758.jpg', '5ded2602dcb40', '2019-12-08 16:34:10', '2019-12-08 16:34:10'),
(494, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5ded260a57e40.jpg', '5ded260a58228', '2019-12-08 16:34:18', '2019-12-08 16:34:18'),
(495, 1, 'image', '5c7a8ae21e062------------------------------------php.jpg', '5ded260e0bf68.jpg', '5ded260e0c350', '2019-12-08 16:34:22', '2019-12-08 16:34:22'),
(496, 1, 'image', 'download.jpg', '5defe3e90dc50.jpg', '5defe3e90e038', '2019-12-10 18:28:57', '2019-12-10 18:28:57'),
(497, 1, 'image', 'download.jpg', '5defe615e22c0.jpg', '5defe615e26a8', '2019-12-10 18:38:13', '2019-12-10 18:38:13'),
(498, 1, 'image', '_Vector_Elements-512.png', '5defe618ca7d8.png', '5defe618cabc0', '2019-12-10 18:38:16', '2019-12-10 18:38:16'),
(499, 1, 'image', 'download.jpg', '5defe63657fd0.jpg', '5defe636583b8', '2019-12-10 18:38:46', '2019-12-10 18:38:46'),
(500, 1, 'image', 'download.jpg', '5defe681d4be8.jpg', '5defe681d4fd0', '2019-12-10 18:40:01', '2019-12-10 18:40:01'),
(501, 1, 'image', 'download.jpg', '5defe6ad600b8.jpg', '5defe6ad604a0', '2019-12-10 18:40:45', '2019-12-10 18:40:45'),
(502, 1, 'image', 'download.jpg', '5defe71ab4c30.jpg', '5defe71ab5018', '2019-12-10 18:42:34', '2019-12-10 18:42:34'),
(503, 1, 'image', '5c7a8ae21e062------------------------------------php.jpg', '5defe9bb23410.jpg', '5defe9bb23be0', '2019-12-10 18:53:47', '2019-12-10 18:53:47'),
(504, 1, 'image', '_Vector_Elements-512.png', '5defe9d8a5618.png', '5defe9d8a5a00', '2019-12-10 18:54:16', '2019-12-10 18:54:16'),
(505, 1, 'image', 'download.jpg', '5defea3262f98.jpg', '5defea3263380', '2019-12-10 18:55:46', '2019-12-10 18:55:46'),
(506, 1, 'image', '5c7a8ae21e062------------------------------------php.jpg', '5defea352ef90.jpg', '5defea352ef90', '2019-12-10 18:55:49', '2019-12-10 18:55:49'),
(507, 1, 'image', 'ok.png', '5deff3afba9f0.png', '5deff3afbb1c0', '2019-12-10 19:36:15', '2019-12-10 19:36:15'),
(508, 1, 'image', 'www.png', '5deff43409218.png', '5deff43409600', '2019-12-10 19:38:28', '2019-12-10 19:38:28'),
(509, 1, 'image', '5c7a8ae21e062------------------------------------php.jpg', '5deff481437b0.jpg', '5deff48143b98', '2019-12-10 19:39:45', '2019-12-10 19:39:45'),
(510, 1, 'image', 'download.jpg', '5deff659944a8.jpg', '5deff65994890', '2019-12-10 19:47:37', '2019-12-10 19:47:37'),
(511, 1, 'image', '5c065ec36972e-amozesh-composer.jpg', '5deff66b3c668.jpg', '5deff66b3c668', '2019-12-10 19:47:55', '2019-12-10 19:47:55'),
(512, 1, 'image', '5d513d0bbb86c---------------------PDO------PHP.jpg', '5df000fdb7340.jpg', '5df000fdb7728', '2019-12-10 20:33:01', '2019-12-10 20:33:01'),
(513, 1, 'image', '5c065ec36972e-amozesh-composer.jpg', '5df0015e1ce80.jpg', '5df0015e1d268', '2019-12-10 20:34:38', '2019-12-10 20:34:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creadit` int(11) NOT NULL,
  `income` int(11) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `avatar`, `name`, `email`, `mobile`, `creadit`, `income`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '5dc1ab9da1158.jpg', 'مجتبی زوارd', 'tester@gmail.com', '09163105802', 0, 76000, NULL, '$2y$10$tUL3Jk5IucdJMxYRXgnuseUTYFQHaclilwYJ4eFkDoi1FjFIGAcee', NULL, '2019-10-12 15:16:31', '2019-12-09 16:14:48'),
(2, NULL, '', 'tester1@Gmail.com', '09123105802', 0, 0, NULL, '$2y$10$07C007Z1UmUKqLuBUgHIUO.gg896WinuUH4PoP2y3pFR4HdKzNKVG', NULL, '2019-10-23 13:13:06', '2019-10-23 13:13:06');

-- --------------------------------------------------------

--
-- Table structure for table `user_consultants`
--

DROP TABLE IF EXISTS `user_consultants`;
CREATE TABLE IF NOT EXISTS `user_consultants` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `date_id` int(11) NOT NULL,
  `time_id` int(11) NOT NULL,
  `transaction_consultants_id` bigint(20) UNSIGNED NOT NULL,
  `consultant_id` bigint(20) UNSIGNED NOT NULL,
  `date_time` timestamp NOT NULL,
  `contact_method` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `consultant_id` (`consultant_id`,`date_time`),
  KEY `user_consultants_user_id_foreign` (`user_id`),
  KEY `user_consultants_transaction_consultants_id_foreign` (`transaction_consultants_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_consultants`
--

INSERT INTO `user_consultants` (`id`, `user_id`, `date_id`, `time_id`, `transaction_consultants_id`, `consultant_id`, `date_time`, `contact_method`, `contact`, `created_at`, `updated_at`) VALUES
(1, 1, 41, 53, 1, 1, '2019-12-14 06:30:00', 'online', 'm@m.com', '2019-12-09 16:57:30', '2019-12-09 16:57:30');

--
-- Triggers `user_consultants`
--
DROP TRIGGER IF EXISTS `insert_user_consultants`;
DELIMITER $$
CREATE TRIGGER `insert_user_consultants` AFTER INSERT ON `user_consultants` FOR EACH ROW BEGIN
                UPDATE consultants SET stat_students = stat_students + 1 WHERE id  = NEW.consultant_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_courses`
--

DROP TABLE IF EXISTS `user_courses`;
CREATE TABLE IF NOT EXISTS `user_courses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_course_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_courses_user_id_foreign` (`user_id`),
  KEY `user_courses_transaction_course_id_foreign` (`transaction_course_id`),
  KEY `user_courses_course_id_foreign` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_courses`
--

INSERT INTO `user_courses` (`id`, `user_id`, `transaction_course_id`, `course_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 11, '2019-12-09 16:48:24', '2019-12-09 16:48:24');

--
-- Triggers `user_courses`
--
DROP TRIGGER IF EXISTS `insert_user_courses`;
DELIMITER $$
CREATE TRIGGER `insert_user_courses` AFTER INSERT ON `user_courses` FOR EACH ROW BEGIN
                UPDATE courses SET stat_students = stat_students + 1 WHERE id  = NEW.course_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

DROP TABLE IF EXISTS `user_permissions`;
CREATE TABLE IF NOT EXISTS `user_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_products`
--

DROP TABLE IF EXISTS `user_products`;
CREATE TABLE IF NOT EXISTS `user_products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jest` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_upload_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `type` enum('digital','physical') COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_upload_id` int(11) DEFAULT NULL,
  `fil_link_exp` int(11) DEFAULT NULL,
  `stat_students` int(11) NOT NULL,
  `stat_views` int(11) NOT NULL,
  `stat_sold` int(11) NOT NULL,
  `stat_wished` int(11) NOT NULL,
  `stat_rate_count` int(11) NOT NULL,
  `stat_rate_total` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_products_shop_id_unique` (`shop_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_products`
--

INSERT INTO `user_products` (`id`, `shop_id`, `title`, `jest`, `text`, `stock`, `image`, `image_upload_id`, `created_at`, `updated_at`, `deleted_at`, `type`, `file_upload_id`, `fil_link_exp`, `stat_students`, `stat_views`, `stat_sold`, `stat_wished`, `stat_rate_count`, `stat_rate_total`) VALUES
(1, 1, 'نام کالا', 'توضیحات کوتاه', 'توضیحات', 5, '5dbdc7418b038.jpg', 313, '2019-11-02 18:15:55', '2019-12-08 16:33:51', '2019-12-08 16:33:51', 'digital', NULL, NULL, 0, 0, 0, 0, 0, 0),
(2, 1, 'تست دیجیتال', 'توضیحات کوتاه', 'توضیحات کامل', 10, '5ded237913c68.jpg', 489, '2019-12-08 16:24:12', '2019-12-08 16:33:20', NULL, 'digital', 492, 5, 1, 12, 1000, 0, 0, 0),
(3, 1, 'تست فیزیکی', 'توضیحات کوتاه', 'توضیحات کامل', 5, '5ded2602dc758.jpg', 493, '2019-12-08 16:34:23', '2019-12-08 16:34:23', NULL, 'physical', NULL, NULL, 2, 33, 10000, 1, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user_product_buys`
--

DROP TABLE IF EXISTS `user_product_buys`;
CREATE TABLE IF NOT EXISTS `user_product_buys` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_product_buys_product_id_foreign` (`product_id`),
  KEY `user_product_buys_user_id_foreign` (`user_id`),
  KEY `user_product_buys_transaction_product_id_foreign` (`transaction_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `user_product_buys`
--
DROP TRIGGER IF EXISTS `insert_user_product_buys`;
DELIMITER $$
CREATE TRIGGER `insert_user_product_buys` AFTER INSERT ON `user_product_buys` FOR EACH ROW BEGIN
                UPDATE user_products SET stat_students = stat_students + 1 WHERE id  = NEW.product_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_product_buy_downloads`
--

DROP TABLE IF EXISTS `user_product_buy_downloads`;
CREATE TABLE IF NOT EXISTS `user_product_buy_downloads` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_product_buy_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `token` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exp_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_product_buy_downloads_token_unique` (`token`),
  KEY `user_product_buy_downloads_user_product_buy_id_foreign` (`user_product_buy_id`),
  KEY `user_product_buy_downloads_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_product_buy_downloads`
--

INSERT INTO `user_product_buy_downloads` (`id`, `user_product_buy_id`, `product_id`, `token`, `exp_date`, `created_at`, `updated_at`) VALUES
(1, 4, 2, '93347b736845e7cef8914b85e49fe53a', '1970-01-01', '2019-12-08 18:07:13', '2019-12-08 18:07:13');

-- --------------------------------------------------------

--
-- Table structure for table `user_product_buy_orders`
--

DROP TABLE IF EXISTS `user_product_buy_orders`;
CREATE TABLE IF NOT EXISTS `user_product_buy_orders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_product_buy_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_product_buy_orders_user_product_buy_id_foreign` (`user_product_buy_id`),
  KEY `user_product_buy_orders_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_product_buy_orders`
--

INSERT INTO `user_product_buy_orders` (`id`, `user_product_buy_id`, `product_id`, `address`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 'کوچخ یک پلاک دو خیابان 3', '2019-12-08 17:58:14', '2019-12-08 17:58:14');

-- --------------------------------------------------------

--
-- Table structure for table `user_product_galleries`
--

DROP TABLE IF EXISTS `user_product_galleries`;
CREATE TABLE IF NOT EXISTS `user_product_galleries` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `upload_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_product_galleries_upload_id_unique` (`upload_id`),
  KEY `user_product_galleries_product_id_unique` (`product_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_product_galleries`
--

INSERT INTO `user_product_galleries` (`id`, `product_id`, `upload_id`, `created_at`, `updated_at`) VALUES
(1, 1, 314, '2019-11-02 18:15:55', '2019-11-02 18:15:55'),
(2, 1, 315, '2019-11-02 18:15:55', '2019-11-02 18:15:55'),
(5, 3, 494, '2019-12-08 16:34:32', '2019-12-08 16:34:32'),
(6, 3, 495, '2019-12-08 16:34:32', '2019-12-08 16:34:32');

-- --------------------------------------------------------

--
-- Table structure for table `user_product_plans`
--

DROP TABLE IF EXISTS `user_product_plans`;
CREATE TABLE IF NOT EXISTS `user_product_plans` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `original_price` int(11) DEFAULT NULL,
  `type` enum('normal','off') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_product_plans_product_id_unique` (`product_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_product_plans`
--

INSERT INTO `user_product_plans` (`id`, `product_id`, `price`, `original_price`, `type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1000, NULL, 'normal', '2019-11-02 19:18:31', '2019-11-02 18:15:55', '2019-11-02 19:18:31'),
(2, 1, 2000, NULL, 'normal', '2019-11-02 19:18:31', '2019-11-02 19:15:14', '2019-11-02 19:18:31'),
(3, 1, 5000, 10000, 'off', '2019-11-02 19:18:31', '2019-11-02 19:15:31', '2019-11-02 19:18:31'),
(4, 1, 7000, NULL, 'normal', '2019-11-02 19:22:33', '2019-11-02 19:18:31', '2019-11-02 19:22:33'),
(5, 1, 6000, 8000, 'off', NULL, '2019-11-02 19:22:33', '2019-11-02 19:22:33'),
(6, 2, 1000, NULL, 'normal', NULL, '2019-12-08 16:24:12', '2019-12-08 16:24:12'),
(7, 3, 2000, NULL, 'normal', '2019-12-08 16:34:45', '2019-12-08 16:34:23', '2019-12-08 16:34:45'),
(8, 3, 5000, 10000, 'off', NULL, '2019-12-08 16:34:45', '2019-12-08 16:34:45');

-- --------------------------------------------------------

--
-- Table structure for table `user_product_stocks`
--

DROP TABLE IF EXISTS `user_product_stocks`;
CREATE TABLE IF NOT EXISTS `user_product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `type` enum('in','out') COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` char(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_product_stocks_product_id_unique` (`product_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_product_stocks`
--

INSERT INTO `user_product_stocks` (`id`, `product_id`, `amount`, `type`, `text`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 10, 'in', 'ثبت اولیه محصول', '2019-11-02 18:53:53', '2019-11-02 18:15:55', '2019-11-02 18:53:53'),
(3, 1, 0, 'in', 'توضیحات', '2019-11-02 18:53:47', '2019-11-02 18:49:43', '2019-11-02 18:53:47'),
(4, 1, 5, 'in', 'تست سیستم', NULL, '2019-11-02 18:54:41', '2019-11-02 18:54:41'),
(5, 2, 10, 'in', 'ثبت اولیه محصول', NULL, '2019-12-08 16:24:12', '2019-12-08 16:24:12'),
(6, 3, 5, 'in', 'ثبت اولیه محصول', NULL, '2019-12-08 16:34:23', '2019-12-08 16:34:23');

--
-- Triggers `user_product_stocks`
--
DROP TRIGGER IF EXISTS `insert_user_product_stocks`;
DELIMITER $$
CREATE TRIGGER `insert_user_product_stocks` AFTER INSERT ON `user_product_stocks` FOR EACH ROW BEGIN
              IF NEW.type = "in"  THEN 
                 UPDATE user_products SET stock  = stock + NEW.amount  WHERE id = NEW.product_id ;
              END IF;
              IF NEW.type = "out"  THEN 
                 UPDATE user_products SET stock  = stock - NEW.amount  WHERE id = NEW.product_id ;
              END IF;

            END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `update_stock`;
DELIMITER $$
CREATE TRIGGER `update_stock` AFTER UPDATE ON `user_product_stocks` FOR EACH ROW BEGIN
              IF NEW.type = "in" AND  NEW.amount != OLD.amount THEN 
                 UPDATE user_products SET  stock  = stock - OLD.amount ,  stock  = stock + NEW.amount  WHERE id = NEW.product_id ;
                 
              END IF;
              IF NEW.type = "out" AND  NEW.amount != OLD.amount THEN 
                 UPDATE user_products SET stock  = stock + OLD .amount  , stock  = stock - NEW.amount  WHERE id = NEW.product_id ;

              END IF;
              
              IF OLD.deleted_at  is  null AND  NEW.deleted_at  is not null THEN 
                 UPDATE user_products SET stock  = stock - OLD .amount  WHERE id = OLD.product_id ;

              END IF;
              


            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_quizzes`
--

DROP TABLE IF EXISTS `user_quizzes`;
CREATE TABLE IF NOT EXISTS `user_quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_quiz_id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_quizzes_user_id_foreign` (`user_id`),
  KEY `user_quizzes_transaction_quiz_id_foreign` (`transaction_quiz_id`),
  KEY `user_quizzes_quiz_id_foreign` (`quiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_quizzes`
--

INSERT INTO `user_quizzes` (`id`, `user_id`, `transaction_quiz_id`, `quiz_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 14, '2019-12-09 16:53:41', '2019-12-09 16:53:41');

--
-- Triggers `user_quizzes`
--
DROP TRIGGER IF EXISTS `insert_user_quizzes`;
DELIMITER $$
CREATE TRIGGER `insert_user_quizzes` AFTER INSERT ON `user_quizzes` FOR EACH ROW BEGIN
                UPDATE quizzes SET stat_students = stat_students + 1 WHERE id  = NEW.quiz_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_quiz_boughts`
--

DROP TABLE IF EXISTS `user_quiz_boughts`;
CREATE TABLE IF NOT EXISTS `user_quiz_boughts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_quiz_id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_quiz_boughts_user_id_foreign` (`user_id`),
  KEY `user_quiz_boughts_transaction_quiz_id_foreign` (`transaction_quiz_id`),
  KEY `user_quiz_boughts_quiz_id_foreign` (`quiz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `user_quiz_boughts`
--
DROP TRIGGER IF EXISTS `insert_user_quiz_boughts`;
DELIMITER $$
CREATE TRIGGER `insert_user_quiz_boughts` AFTER INSERT ON `user_quiz_boughts` FOR EACH ROW BEGIN
                UPDATE quizzes SET stat_students = stat_students + 1 WHERE id  = NEW.quiz_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_quiz_courses`
--

DROP TABLE IF EXISTS `user_quiz_courses`;
CREATE TABLE IF NOT EXISTS `user_quiz_courses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_quiz_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_quiz_courses_user_quiz_id_unique` (`user_quiz_id`),
  KEY `user_quiz_courses_user_id_foreign` (`user_id`),
  KEY `user_quiz_courses_course_id_foreign` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_quiz_inits`
--

DROP TABLE IF EXISTS `user_quiz_inits`;
CREATE TABLE IF NOT EXISTS `user_quiz_inits` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('course_lecture','course_final','seminar','stand_alone') COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `total_point` int(11) DEFAULT NULL,
  `question_point` int(11) NOT NULL,
  `answer_point` int(11) NOT NULL,
  `point_type` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_at` datetime DEFAULT NULL,
  `finish_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_quiz_inits_user_id_foreign` (`user_id`),
  KEY `user_quiz_inits_quiz_id_foreign` (`quiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_quiz_inits`
--

INSERT INTO `user_quiz_inits` (`id`, `user_id`, `quiz_id`, `type`, `title`, `text`, `image`, `time`, `end_time`, `total_point`, `question_point`, `answer_point`, `point_type`, `start_at`, `finish_at`, `created_at`, `updated_at`) VALUES
(18, 1, 11, 'stand_alone', 'تست با قیمت', 'توضیحات', '5dd7ce8be1000.jpg', 10, '2019-11-22 16:58:51', 20, 0, 0, '1', '2019-11-22 16:48:51', NULL, '2019-11-22 13:18:51', '2019-11-22 13:18:51'),
(19, 1, 11, 'stand_alone', 'تست با قیمت', 'توضیحات', '5dd7ce8be1000.jpg', 10, '2019-11-22 16:59:04', 20, 0, 0, '1', '2019-11-22 16:49:04', NULL, '2019-11-22 13:19:04', '2019-11-22 13:19:04'),
(21, 1, 3, 'seminar', 'عنوان آزمون', 'توضیحاتتوضیحات', '5ddd4cac6ca48.png', 15, '2019-11-27 19:41:58', NULL, 35, 0, '2', '2019-11-27 19:26:58', NULL, '2019-11-27 15:56:58', '2019-11-27 15:56:58'),
(22, 1, 17, 'seminar', 'تست پاس کردن کلاس', 'توضیحات', '5ddd4cac6ca48.png', 10, '2019-11-27 19:39:30', 20, 0, 0, '1', '2019-11-27 19:29:30', NULL, '2019-11-27 15:59:30', '2019-11-27 15:59:30');

-- --------------------------------------------------------

--
-- Table structure for table `user_quiz_init_answers`
--

DROP TABLE IF EXISTS `user_quiz_init_answers`;
CREATE TABLE IF NOT EXISTS `user_quiz_init_answers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `init_question_id` bigint(20) UNSIGNED NOT NULL,
  `answer_id` bigint(20) UNSIGNED NOT NULL,
  `title` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `point` int(11) DEFAULT NULL,
  `ra` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_quiz_init_answers_quiz_init_question_id_foreign` (`init_question_id`),
  KEY `user_quiz_init_answers_answer_id_foreign` (`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_quiz_init_answers`
--

INSERT INTO `user_quiz_init_answers` (`id`, `init_question_id`, `answer_id`, `title`, `point`, `ra`, `created_at`, `updated_at`) VALUES
(9, 5, 13, 'پاسخ2', 10, 1, '2019-11-20 16:20:39', '2019-11-20 16:20:39'),
(10, 5, 14, 'پاسخ3', 20, 0, '2019-11-20 16:20:39', '2019-11-20 16:20:39'),
(11, 6, 17, 'پاسخ1', 6, 1, '2019-11-20 16:20:39', '2019-11-20 16:20:39'),
(12, 6, 18, 'پاسخ 2', 12, 0, '2019-11-20 16:20:39', '2019-11-20 16:20:39'),
(25, 13, 13, 'پاسخ2', 10, 1, '2019-11-20 16:31:09', '2019-11-20 16:31:09'),
(26, 13, 14, 'پاسخ3', 20, 0, '2019-11-20 16:31:09', '2019-11-20 16:31:09'),
(27, 14, 17, 'پاسخ1', 6, 1, '2019-11-20 16:31:09', '2019-11-20 16:31:09'),
(28, 14, 18, 'پاسخ 2', 12, 0, '2019-11-20 16:31:09', '2019-11-20 16:31:09'),
(29, 15, 13, 'پاسخ2', 10, 1, '2019-11-20 17:12:58', '2019-11-20 17:12:58'),
(30, 15, 14, 'پاسخ3', 20, 0, '2019-11-20 17:12:58', '2019-11-20 17:12:58'),
(31, 16, 17, 'پاسخ1', 6, 1, '2019-11-20 17:12:58', '2019-11-20 17:12:58'),
(32, 16, 18, 'پاسخ 2', 12, 0, '2019-11-20 17:12:58', '2019-11-20 17:12:58'),
(33, 17, 13, 'پاسخ2', 10, 1, '2019-11-20 17:14:31', '2019-11-20 17:14:31'),
(34, 17, 14, 'پاسخ3', 20, 0, '2019-11-20 17:14:31', '2019-11-20 17:14:31'),
(35, 18, 17, 'پاسخ1', 6, 1, '2019-11-20 17:14:31', '2019-11-20 17:14:31'),
(36, 18, 18, 'پاسخ 2', 12, 0, '2019-11-20 17:14:31', '2019-11-20 17:14:31'),
(37, 19, 13, 'پاسخ2', 10, 1, '2019-11-20 17:16:33', '2019-11-20 17:16:33'),
(38, 19, 14, 'پاسخ3', 20, 0, '2019-11-20 17:16:33', '2019-11-20 17:16:33'),
(39, 20, 17, 'پاسخ1', 6, 1, '2019-11-20 17:16:33', '2019-11-20 17:16:33'),
(40, 20, 18, 'پاسخ 2', 12, 0, '2019-11-20 17:16:33', '2019-11-20 17:16:33'),
(48, 24, 26, 'پاسخ1', NULL, 1, '2019-11-20 17:31:22', '2019-11-20 17:31:22'),
(49, 24, 27, 'پاسخ2', NULL, 0, '2019-11-20 17:31:22', '2019-11-20 17:31:22'),
(50, 25, 28, 'پاسخ1', NULL, 1, '2019-11-20 17:31:22', '2019-11-20 17:31:22'),
(51, 25, 29, 'پاسخ2', NULL, 0, '2019-11-20 17:31:22', '2019-11-20 17:31:22'),
(52, 25, 30, 'پاسخ3', NULL, 0, '2019-11-20 17:31:22', '2019-11-20 17:31:22'),
(53, 26, 31, 'پاسخ1', NULL, 1, '2019-11-20 17:31:22', '2019-11-20 17:31:22'),
(54, 26, 32, 'پاسخ2', NULL, 0, '2019-11-20 17:31:22', '2019-11-20 17:31:22'),
(55, 27, 26, 'پاسخ1', NULL, 1, '2019-11-20 17:34:40', '2019-11-20 17:34:40'),
(56, 27, 27, 'پاسخ2', NULL, 0, '2019-11-20 17:34:40', '2019-11-20 17:34:40'),
(57, 28, 28, 'پاسخ1', NULL, 1, '2019-11-20 17:34:40', '2019-11-20 17:34:40'),
(58, 28, 29, 'پاسخ2', NULL, 0, '2019-11-20 17:34:40', '2019-11-20 17:34:40'),
(59, 28, 30, 'پاسخ3', NULL, 0, '2019-11-20 17:34:40', '2019-11-20 17:34:40'),
(60, 29, 31, 'پاسخ1', NULL, 1, '2019-11-20 17:34:40', '2019-11-20 17:34:40'),
(61, 29, 32, 'پاسخ2', NULL, 0, '2019-11-20 17:34:40', '2019-11-20 17:34:40'),
(62, 30, 26, 'پاسخ1', NULL, 1, '2019-11-20 17:35:25', '2019-11-20 17:35:25'),
(63, 30, 27, 'پاسخ2', NULL, 0, '2019-11-20 17:35:25', '2019-11-20 17:35:25'),
(64, 31, 28, 'پاسخ1', NULL, 1, '2019-11-20 17:35:25', '2019-11-20 17:35:25'),
(65, 31, 29, 'پاسخ2', NULL, 0, '2019-11-20 17:35:26', '2019-11-20 17:35:26'),
(66, 31, 30, 'پاسخ3', NULL, 0, '2019-11-20 17:35:26', '2019-11-20 17:35:26'),
(67, 32, 31, 'پاسخ1', NULL, 1, '2019-11-20 17:35:26', '2019-11-20 17:35:26'),
(68, 32, 32, 'پاسخ2', NULL, 0, '2019-11-20 17:35:26', '2019-11-20 17:35:26'),
(69, 33, 26, 'پاسخ1', NULL, 1, '2019-11-21 08:09:52', '2019-11-21 08:09:52'),
(70, 33, 27, 'پاسخ2', NULL, 0, '2019-11-21 08:09:52', '2019-11-21 08:09:52'),
(71, 34, 28, 'پاسخ1', NULL, 1, '2019-11-21 08:09:52', '2019-11-21 08:09:52'),
(72, 34, 29, 'پاسخ2', NULL, 0, '2019-11-21 08:09:52', '2019-11-21 08:09:52'),
(73, 34, 30, 'پاسخ3', NULL, 0, '2019-11-21 08:09:52', '2019-11-21 08:09:52'),
(74, 35, 31, 'پاسخ1', NULL, 1, '2019-11-21 08:09:52', '2019-11-21 08:09:52'),
(75, 35, 32, 'پاسخ2', NULL, 0, '2019-11-21 08:09:52', '2019-11-21 08:09:52'),
(76, 36, 56, 'پاسخ', NULL, 1, '2019-11-22 13:05:45', '2019-11-22 13:05:45'),
(77, 36, 57, 'پاسخ', NULL, 0, '2019-11-22 13:05:45', '2019-11-22 13:05:45'),
(78, 37, 58, 'پاسخ', NULL, 1, '2019-11-22 13:05:45', '2019-11-22 13:05:45'),
(79, 37, 59, 'پاسخ', NULL, 0, '2019-11-22 13:05:45', '2019-11-22 13:05:45'),
(80, 38, 60, 'پاسخ', NULL, 1, '2019-11-22 13:05:45', '2019-11-22 13:05:45'),
(81, 38, 61, 'پاسخ', NULL, 0, '2019-11-22 13:05:45', '2019-11-22 13:05:45'),
(82, 39, 62, 'پاسخ', NULL, 1, '2019-11-22 13:17:30', '2019-11-22 13:17:30'),
(83, 39, 63, 'پاسخ', NULL, 0, '2019-11-22 13:17:30', '2019-11-22 13:17:30'),
(84, 40, 64, 'پاسخ', NULL, 1, '2019-11-22 13:17:30', '2019-11-22 13:17:30'),
(85, 40, 65, 'پاسخ', NULL, 0, '2019-11-22 13:17:30', '2019-11-22 13:17:30'),
(86, 41, 66, 'پاسخ', NULL, 1, '2019-11-22 13:17:30', '2019-11-22 13:17:30'),
(87, 41, 67, 'پاسخ', NULL, 0, '2019-11-22 13:17:30', '2019-11-22 13:17:30'),
(88, 42, 56, 'پاسخ', NULL, 1, '2019-11-22 13:18:51', '2019-11-22 13:18:51'),
(89, 42, 57, 'پاسخ', NULL, 0, '2019-11-22 13:18:51', '2019-11-22 13:18:51'),
(90, 43, 58, 'پاسخ', NULL, 1, '2019-11-22 13:18:51', '2019-11-22 13:18:51'),
(91, 43, 59, 'پاسخ', NULL, 0, '2019-11-22 13:18:51', '2019-11-22 13:18:51'),
(92, 44, 60, 'پاسخ', NULL, 1, '2019-11-22 13:18:51', '2019-11-22 13:18:51'),
(93, 44, 61, 'پاسخ', NULL, 0, '2019-11-22 13:18:51', '2019-11-22 13:18:51'),
(94, 45, 62, 'پاسخ', NULL, 1, '2019-11-22 13:19:04', '2019-11-22 13:19:04'),
(95, 45, 63, 'پاسخ', NULL, 0, '2019-11-22 13:19:04', '2019-11-22 13:19:04'),
(96, 46, 64, 'پاسخ', NULL, 1, '2019-11-22 13:19:04', '2019-11-22 13:19:04'),
(97, 46, 65, 'پاسخ', NULL, 0, '2019-11-22 13:19:04', '2019-11-22 13:19:04'),
(98, 47, 66, 'پاسخ', NULL, 1, '2019-11-22 13:19:04', '2019-11-22 13:19:04'),
(99, 47, 67, 'پاسخ', NULL, 0, '2019-11-22 13:19:04', '2019-11-22 13:19:04'),
(107, 51, 26, 'پاسخ1', NULL, 1, '2019-11-27 15:56:58', '2019-11-27 15:56:58'),
(108, 51, 27, 'پاسخ2', NULL, 0, '2019-11-27 15:56:58', '2019-11-27 15:56:58'),
(109, 52, 28, 'پاسخ1', NULL, 1, '2019-11-27 15:56:58', '2019-11-27 15:56:58'),
(110, 52, 29, 'پاسخ2', NULL, 0, '2019-11-27 15:56:58', '2019-11-27 15:56:58'),
(111, 52, 30, 'پاسخ3', NULL, 0, '2019-11-27 15:56:58', '2019-11-27 15:56:58'),
(112, 53, 31, 'پاسخ1', NULL, 1, '2019-11-27 15:56:58', '2019-11-27 15:56:58'),
(113, 53, 32, 'پاسخ2', NULL, 0, '2019-11-27 15:56:58', '2019-11-27 15:56:58'),
(114, 54, 103, 'یی', NULL, 1, '2019-11-27 15:59:30', '2019-11-27 15:59:30'),
(115, 54, 104, 'ی', NULL, 0, '2019-11-27 15:59:30', '2019-11-27 15:59:30'),
(116, 54, 105, 'ی', NULL, 0, '2019-11-27 15:59:30', '2019-11-27 15:59:30'),
(117, 55, 106, 'یی', NULL, 1, '2019-11-27 15:59:30', '2019-11-27 15:59:30'),
(118, 55, 107, 'یی', NULL, 0, '2019-11-27 15:59:30', '2019-11-27 15:59:30');

-- --------------------------------------------------------

--
-- Table structure for table `user_quiz_init_course_finals`
--

DROP TABLE IF EXISTS `user_quiz_init_course_finals`;
CREATE TABLE IF NOT EXISTS `user_quiz_init_course_finals` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quiz_init_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `course_final_quiz_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_quiz_init_course_finals_quiz_init_id_unique` (`quiz_init_id`),
  KEY `user_quiz_init_course_finals_user_id_foreign` (`user_id`),
  KEY `user_quiz_init_course_finals_course_id_foreign` (`course_id`),
  KEY `user_quiz_init_course_finals_course_final_quiz_id_foreign` (`course_final_quiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_quiz_init_course_finals`
--

INSERT INTO `user_quiz_init_course_finals` (`id`, `quiz_init_id`, `user_id`, `course_id`, `course_final_quiz_id`, `created_at`, `updated_at`) VALUES
(1, 12, 1, 11, 1, '2019-11-20 17:31:22', '2019-11-20 17:31:22'),
(2, 13, 1, 11, 1, '2019-11-20 17:34:40', '2019-11-20 17:34:40'),
(3, 14, 1, 11, 1, '2019-11-20 17:35:26', '2019-11-20 17:35:26'),
(4, 15, 1, 11, 1, '2019-11-21 08:09:52', '2019-11-21 08:09:52');

-- --------------------------------------------------------

--
-- Table structure for table `user_quiz_init_course_lectures`
--

DROP TABLE IF EXISTS `user_quiz_init_course_lectures`;
CREATE TABLE IF NOT EXISTS `user_quiz_init_course_lectures` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quiz_init_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `lecture_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_quiz_init_course_lectures_quiz_init_id_unique` (`quiz_init_id`),
  KEY `user_quiz_init_course_lectures_user_id_foreign` (`user_id`),
  KEY `user_quiz_init_course_lectures_course_id_foreign` (`course_id`),
  KEY `user_quiz_init_course_lectures_lecture_id_unique` (`lecture_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_quiz_init_course_lectures`
--

INSERT INTO `user_quiz_init_course_lectures` (`id`, `quiz_init_id`, `user_id`, `course_id`, `lecture_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 11, 44, '2019-11-20 16:20:39', '2019-11-20 16:20:39'),
(5, 7, 1, 11, 44, '2019-11-20 16:31:09', '2019-11-20 16:31:09'),
(6, 8, 1, 11, 44, '2019-11-20 17:12:58', '2019-11-20 17:12:58'),
(7, 9, 1, 11, 44, '2019-11-20 17:14:31', '2019-11-20 17:14:31'),
(8, 10, 1, 11, 44, '2019-11-20 17:16:33', '2019-11-20 17:16:33');

-- --------------------------------------------------------

--
-- Table structure for table `user_quiz_init_groups`
--

DROP TABLE IF EXISTS `user_quiz_init_groups`;
CREATE TABLE IF NOT EXISTS `user_quiz_init_groups` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quiz_init_id` bigint(20) UNSIGNED NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `certificate` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_quiz_init_groups_quiz_init_id_foreign` (`quiz_init_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_quiz_init_groups`
--

INSERT INTO `user_quiz_init_groups` (`id`, `quiz_init_id`, `from`, `to`, `text`, `certificate`, `created_at`, `updated_at`) VALUES
(5, 3, 0, 10, 'شما رد شدین', 0, '2019-11-20 16:20:39', '2019-11-20 16:20:39'),
(6, 3, 10, 48, 'شما قبول شدین', 0, '2019-11-20 16:20:39', '2019-11-20 16:20:39'),
(13, 7, 0, 10, 'شما رد شدین', 0, '2019-11-20 16:31:09', '2019-11-20 16:31:09'),
(14, 7, 10, 48, 'شما قبول شدین', 0, '2019-11-20 16:31:09', '2019-11-20 16:31:09'),
(15, 8, 0, 10, 'شما رد شدین', 0, '2019-11-20 17:12:58', '2019-11-20 17:12:58'),
(16, 8, 10, 48, 'شما قبول شدین', 0, '2019-11-20 17:12:58', '2019-11-20 17:12:58'),
(17, 9, 0, 10, 'شما رد شدین', 0, '2019-11-20 17:14:31', '2019-11-20 17:14:31'),
(18, 9, 10, 48, 'شما قبول شدین', 0, '2019-11-20 17:14:31', '2019-11-20 17:14:31'),
(19, 10, 0, 10, 'شما رد شدین', 0, '2019-11-20 17:16:33', '2019-11-20 17:16:33'),
(20, 10, 10, 48, 'شما قبول شدین', 0, '2019-11-20 17:16:33', '2019-11-20 17:16:33'),
(23, 12, 0, 10, 'شما مردود شدین', 0, '2019-11-20 17:31:22', '2019-11-20 17:31:22'),
(24, 12, 10, 35, 'شما قبول شدین', 1, '2019-11-20 17:31:22', '2019-11-20 17:31:22'),
(25, 13, 0, 10, 'شما مردود شدین', 0, '2019-11-20 17:34:40', '2019-11-20 17:34:40'),
(26, 13, 10, 35, 'شما قبول شدین', 1, '2019-11-20 17:34:40', '2019-11-20 17:34:40'),
(27, 14, 0, 10, 'شما مردود شدین', 0, '2019-11-20 17:35:26', '2019-11-20 17:35:26'),
(28, 14, 10, 35, 'شما قبول شدین', 1, '2019-11-20 17:35:26', '2019-11-20 17:35:26'),
(29, 15, 0, 10, 'شما مردود شدین', 0, '2019-11-21 08:09:52', '2019-11-21 08:09:52'),
(30, 15, 10, 35, 'شما قبول شدین', 1, '2019-11-21 08:09:52', '2019-11-21 08:09:52'),
(31, 16, 0, 10, 'شما رد شدین', 0, '2019-11-22 13:05:45', '2019-11-22 13:05:45'),
(32, 16, 10, 20, 'شما رد شدین', 0, '2019-11-22 13:05:46', '2019-11-22 13:05:46'),
(33, 17, 0, 10, 'شما رد شدین', 0, '2019-11-22 13:17:30', '2019-11-22 13:17:30'),
(34, 17, 10, 20, 'شما رد شدین', 0, '2019-11-22 13:17:30', '2019-11-22 13:17:30'),
(35, 18, 0, 10, 'شما رد شدین', 0, '2019-11-22 13:18:51', '2019-11-22 13:18:51'),
(36, 18, 10, 20, 'شما رد شدین', 0, '2019-11-22 13:18:51', '2019-11-22 13:18:51'),
(37, 19, 0, 10, 'شما رد شدین', 0, '2019-11-22 13:19:04', '2019-11-22 13:19:04'),
(38, 19, 10, 20, 'شما رد شدین', 0, '2019-11-22 13:19:04', '2019-11-22 13:19:04'),
(41, 21, 0, 10, 'شما مردود شدین', 0, '2019-11-27 15:56:58', '2019-11-27 15:56:58'),
(42, 21, 10, 35, 'شما قبول شدین', 1, '2019-11-27 15:56:58', '2019-11-27 15:56:58'),
(43, 22, 1, 10, 'اا', 0, '2019-11-27 15:59:30', '2019-11-27 15:59:30'),
(44, 22, 20, 30, 'طرزطرطز', 1, '2019-11-27 15:59:30', '2019-11-27 15:59:30');

-- --------------------------------------------------------

--
-- Table structure for table `user_quiz_init_questions`
--

DROP TABLE IF EXISTS `user_quiz_init_questions`;
CREATE TABLE IF NOT EXISTS `user_quiz_init_questions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quiz_init_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `title` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `point` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_quiz_init_questions_quiz_init_id_foreign` (`quiz_init_id`),
  KEY `user_quiz_init_questions_question_id_foreign` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_quiz_init_questions`
--

INSERT INTO `user_quiz_init_questions` (`id`, `quiz_init_id`, `question_id`, `title`, `point`, `created_at`, `updated_at`) VALUES
(5, 3, 4, 'عنوان سوال', NULL, '2019-11-20 16:20:39', '2019-11-20 16:20:39'),
(6, 3, 5, 'عنوان سوال2', NULL, '2019-11-20 16:20:39', '2019-11-20 16:20:39'),
(13, 7, 4, 'عنوان سوال', NULL, '2019-11-20 16:31:09', '2019-11-20 16:31:09'),
(14, 7, 5, 'عنوان سوال2', NULL, '2019-11-20 16:31:09', '2019-11-20 16:31:09'),
(15, 8, 4, 'عنوان سوال', NULL, '2019-11-20 17:12:58', '2019-11-20 17:12:58'),
(16, 8, 5, 'عنوان سوال2', NULL, '2019-11-20 17:12:58', '2019-11-20 17:12:58'),
(17, 9, 4, 'عنوان سوال', NULL, '2019-11-20 17:14:31', '2019-11-20 17:14:31'),
(18, 9, 5, 'عنوان سوال2', NULL, '2019-11-20 17:14:31', '2019-11-20 17:14:31'),
(19, 10, 4, 'عنوان سوال', NULL, '2019-11-20 17:16:33', '2019-11-20 17:16:33'),
(20, 10, 5, 'عنوان سوال2', NULL, '2019-11-20 17:16:33', '2019-11-20 17:16:33'),
(24, 12, 9, 'عنوان سوال1', 5, '2019-11-20 17:31:22', '2019-11-20 17:31:22'),
(25, 12, 10, 'عنوان سوال2', 10, '2019-11-20 17:31:22', '2019-11-20 17:31:22'),
(26, 12, 11, 'عنوان سوال3', 20, '2019-11-20 17:31:22', '2019-11-20 17:31:22'),
(27, 13, 9, 'عنوان سوال1', 5, '2019-11-20 17:34:40', '2019-11-20 17:34:40'),
(28, 13, 10, 'عنوان سوال2', 10, '2019-11-20 17:34:40', '2019-11-20 17:34:40'),
(29, 13, 11, 'عنوان سوال3', 20, '2019-11-20 17:34:40', '2019-11-20 17:34:40'),
(30, 14, 9, 'عنوان سوال1', 5, '2019-11-20 17:35:25', '2019-11-20 17:35:25'),
(31, 14, 10, 'عنوان سوال2', 10, '2019-11-20 17:35:25', '2019-11-20 17:35:25'),
(32, 14, 11, 'عنوان سوال3', 20, '2019-11-20 17:35:26', '2019-11-20 17:35:26'),
(33, 15, 9, 'عنوان سوال1', 5, '2019-11-21 08:09:52', '2019-11-21 08:09:52'),
(34, 15, 10, 'عنوان سوال2', 10, '2019-11-21 08:09:52', '2019-11-21 08:09:52'),
(35, 15, 11, 'عنوان سوال3', 20, '2019-11-21 08:09:52', '2019-11-21 08:09:52'),
(36, 16, 25, 'عنوان سوال1', NULL, '2019-11-22 13:05:45', '2019-11-22 13:05:45'),
(37, 16, 26, 'عنوان سوال2', NULL, '2019-11-22 13:05:45', '2019-11-22 13:05:45'),
(38, 16, 27, 'عنوان سوال3', NULL, '2019-11-22 13:05:45', '2019-11-22 13:05:45'),
(39, 17, 28, 'عنوان سوال4', NULL, '2019-11-22 13:17:30', '2019-11-22 13:17:30'),
(40, 17, 29, 'عنوان سوال5', NULL, '2019-11-22 13:17:30', '2019-11-22 13:17:30'),
(41, 17, 30, 'عنوان سوال6', NULL, '2019-11-22 13:17:30', '2019-11-22 13:17:30'),
(42, 18, 25, 'عنوان سوال1', NULL, '2019-11-22 13:18:51', '2019-11-22 13:18:51'),
(43, 18, 26, 'عنوان سوال2', NULL, '2019-11-22 13:18:51', '2019-11-22 13:18:51'),
(44, 18, 27, 'عنوان سوال3', NULL, '2019-11-22 13:18:51', '2019-11-22 13:18:51'),
(45, 19, 28, 'عنوان سوال4', NULL, '2019-11-22 13:19:04', '2019-11-22 13:19:04'),
(46, 19, 29, 'عنوان سوال5', NULL, '2019-11-22 13:19:04', '2019-11-22 13:19:04'),
(47, 19, 30, 'عنوان سوال6', NULL, '2019-11-22 13:19:04', '2019-11-22 13:19:04'),
(51, 21, 9, 'عنوان سوال1', 5, '2019-11-27 15:56:58', '2019-11-27 15:56:58'),
(52, 21, 10, 'عنوان سوال2', 10, '2019-11-27 15:56:58', '2019-11-27 15:56:58'),
(53, 21, 11, 'عنوان سوال3', 20, '2019-11-27 15:56:58', '2019-11-27 15:56:58'),
(54, 22, 49, 'عنوان سوال', NULL, '2019-11-27 15:59:30', '2019-11-27 15:59:30'),
(55, 22, 50, 'یی', NULL, '2019-11-27 15:59:30', '2019-11-27 15:59:30');

-- --------------------------------------------------------

--
-- Table structure for table `user_quiz_init_results`
--

DROP TABLE IF EXISTS `user_quiz_init_results`;
CREATE TABLE IF NOT EXISTS `user_quiz_init_results` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `quiz_init_id` bigint(20) UNSIGNED NOT NULL,
  `certificate_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quiz_point` int(11) NOT NULL,
  `user_point` int(11) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_quiz_init_results_quiz_init_id_unique` (`quiz_init_id`),
  KEY `user_quiz_init_results_quiz_id_foreign` (`quiz_id`),
  KEY `user_quiz_init_results_certificate_id_foreign` (`certificate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_quiz_init_results`
--

INSERT INTO `user_quiz_init_results` (`id`, `user_id`, `quiz_id`, `quiz_init_id`, `certificate_id`, `quiz_point`, `user_point`, `text`, `created_at`, `updated_at`) VALUES
(1, 0, 2, 8, NULL, 48, 6, '', '2019-11-20 17:13:04', '2019-11-20 17:13:04'),
(2, 1, 2, 9, NULL, 48, 16, '', '2019-11-20 17:14:36', '2019-11-20 17:14:36'),
(3, 1, 2, 10, NULL, 48, 10, 'شما رد شدین', '2019-11-20 17:16:39', '2019-11-20 17:16:39'),
(4, 1, 3, 12, NULL, 35, 25, 'شما قبول شدین', '2019-11-20 17:31:32', '2019-11-20 17:31:32'),
(5, 1, 3, 13, NULL, 35, 15, 'شما قبول شدین', '2019-11-20 17:34:50', '2019-11-20 17:34:50'),
(6, 1, 3, 14, 1, 35, 25, 'شما قبول شدین', '2019-11-20 17:36:34', '2019-11-20 17:36:34'),
(7, 1, 3, 15, 1, 35, 35, 'شما قبول شدین', '2019-11-21 08:09:59', '2019-11-21 08:09:59'),
(8, 1, 11, 16, NULL, 20, 6, 'شما رد شدین', '2019-11-22 13:06:10', '2019-11-22 13:06:10'),
(9, 1, 11, 17, NULL, 20, 18, 'شما رد شدین', '2019-11-22 13:17:44', '2019-11-22 13:17:44'),
(10, 1, 11, 18, NULL, 20, 20, 'شما رد شدین', '2019-11-22 13:18:59', '2019-11-22 13:18:59'),
(11, 1, 11, 19, NULL, 20, 13, 'شما رد شدین', '2019-11-22 13:19:10', '2019-11-22 13:19:10'),
(12, 1, 3, 21, 1, 35, 15, 'شما قبول شدین', '2019-11-27 15:57:04', '2019-11-27 15:57:04'),
(13, 1, 17, 22, NULL, 20, 20, 'طرزطرطز', '2019-11-27 15:59:34', '2019-11-27 15:59:34');

-- --------------------------------------------------------

--
-- Table structure for table `user_quiz_init_selections`
--

DROP TABLE IF EXISTS `user_quiz_init_selections`;
CREATE TABLE IF NOT EXISTS `user_quiz_init_selections` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quiz_init_id` bigint(20) UNSIGNED NOT NULL,
  `init_question_id` int(11) NOT NULL,
  `init_answer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_quiz_init_selections_quiz_init_id_foreign` (`quiz_init_id`),
  KEY `user_quiz_init_selections_init_answer_id_foreign` (`init_answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_quiz_init_selections`
--

INSERT INTO `user_quiz_init_selections` (`id`, `quiz_init_id`, `init_question_id`, `init_answer_id`, `created_at`, `updated_at`) VALUES
(3, 7, 13, 26, '2019-11-20 16:48:47', '2019-11-20 16:48:47'),
(4, 7, 14, 27, '2019-11-20 16:48:47', '2019-11-20 16:48:47'),
(5, 8, 15, 30, '2019-11-20 17:13:04', '2019-11-20 17:13:04'),
(6, 8, 16, 31, '2019-11-20 17:13:04', '2019-11-20 17:13:04'),
(7, 9, 17, 33, '2019-11-20 17:14:36', '2019-11-20 17:14:36'),
(8, 9, 18, 35, '2019-11-20 17:14:36', '2019-11-20 17:14:36'),
(9, 10, 19, 37, '2019-11-20 17:16:39', '2019-11-20 17:16:39'),
(10, 10, 20, 40, '2019-11-20 17:16:39', '2019-11-20 17:16:39'),
(11, 12, 24, 48, '2019-11-20 17:31:32', '2019-11-20 17:31:32'),
(12, 12, 25, 51, '2019-11-20 17:31:32', '2019-11-20 17:31:32'),
(13, 12, 26, 53, '2019-11-20 17:31:32', '2019-11-20 17:31:32'),
(14, 13, 27, 55, '2019-11-20 17:34:50', '2019-11-20 17:34:50'),
(15, 13, 28, 57, '2019-11-20 17:34:50', '2019-11-20 17:34:50'),
(20, 14, 30, 62, '2019-11-20 17:36:34', '2019-11-20 17:36:34'),
(21, 14, 32, 67, '2019-11-20 17:36:34', '2019-11-20 17:36:34'),
(22, 15, 33, 69, '2019-11-21 08:09:59', '2019-11-21 08:09:59'),
(23, 15, 34, 71, '2019-11-21 08:09:59', '2019-11-21 08:09:59'),
(24, 15, 35, 74, '2019-11-21 08:09:59', '2019-11-21 08:09:59'),
(25, 16, 36, 76, '2019-11-22 13:06:10', '2019-11-22 13:06:10'),
(26, 16, 37, 79, '2019-11-22 13:06:10', '2019-11-22 13:06:10'),
(27, 16, 38, 81, '2019-11-22 13:06:10', '2019-11-22 13:06:10'),
(28, 17, 39, 82, '2019-11-22 13:17:44', '2019-11-22 13:17:44'),
(29, 17, 40, 84, '2019-11-22 13:17:44', '2019-11-22 13:17:44'),
(30, 17, 41, 86, '2019-11-22 13:17:44', '2019-11-22 13:17:44'),
(31, 18, 42, 88, '2019-11-22 13:18:59', '2019-11-22 13:18:59'),
(32, 18, 43, 90, '2019-11-22 13:18:59', '2019-11-22 13:18:59'),
(33, 18, 44, 92, '2019-11-22 13:18:59', '2019-11-22 13:18:59'),
(34, 19, 45, 94, '2019-11-22 13:19:10', '2019-11-22 13:19:10'),
(35, 19, 46, 96, '2019-11-22 13:19:10', '2019-11-22 13:19:10'),
(36, 21, 51, 107, '2019-11-27 15:57:04', '2019-11-27 15:57:04'),
(37, 21, 52, 109, '2019-11-27 15:57:04', '2019-11-27 15:57:04'),
(38, 22, 54, 114, '2019-11-27 15:59:34', '2019-11-27 15:59:34'),
(39, 22, 55, 117, '2019-11-27 15:59:34', '2019-11-27 15:59:34');

-- --------------------------------------------------------

--
-- Table structure for table `user_quiz_init_seminars`
--

DROP TABLE IF EXISTS `user_quiz_init_seminars`;
CREATE TABLE IF NOT EXISTS `user_quiz_init_seminars` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quiz_init_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `seminar_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_quiz_init_seminars_quiz_init_id_unique` (`quiz_init_id`),
  KEY `user_quiz_init_seminars_user_id_foreign` (`user_id`),
  KEY `user_quiz_init_seminars_seminar_id_foreign` (`seminar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_quiz_init_seminars`
--

INSERT INTO `user_quiz_init_seminars` (`id`, `quiz_init_id`, `user_id`, `seminar_id`, `created_at`, `updated_at`) VALUES
(1, 21, 1, 9, '2019-11-27 15:56:58', '2019-11-27 15:56:58'),
(2, 22, 1, 9, '2019-11-27 15:59:30', '2019-11-27 15:59:30');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` enum('admin','superadmin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_roles_user_id_unique` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `user_id`, `role`, `created_at`, `updated_at`) VALUES
(1, 2, 'superadmin', '2019-12-09 16:08:17', '2019-12-09 16:08:17');

-- --------------------------------------------------------

--
-- Table structure for table `user_seminars`
--

DROP TABLE IF EXISTS `user_seminars`;
CREATE TABLE IF NOT EXISTS `user_seminars` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_seminar_id` bigint(20) UNSIGNED NOT NULL,
  `seminar_id` bigint(20) UNSIGNED NOT NULL,
  `seminar_shedule_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_seminars_user_id_foreign` (`user_id`),
  KEY `user_seminars_transaction_seminar_id_foreign` (`transaction_seminar_id`),
  KEY `user_seminars_seminar_id_foreign` (`seminar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_seminars`
--

INSERT INTO `user_seminars` (`id`, `user_id`, `transaction_seminar_id`, `seminar_id`, `seminar_shedule_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 9, 9, '2019-12-09 16:50:48', '2019-12-09 16:50:48');

--
-- Triggers `user_seminars`
--
DROP TRIGGER IF EXISTS `insert_user_seminars`;
DELIMITER $$
CREATE TRIGGER `insert_user_seminars` AFTER INSERT ON `user_seminars` FOR EACH ROW BEGIN
                UPDATE seminars SET stat_students = stat_students + 1 WHERE id  = NEW.seminar_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_seminar_shedules`
--

DROP TABLE IF EXISTS `user_seminar_shedules`;
CREATE TABLE IF NOT EXISTS `user_seminar_shedules` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_seminar_id` bigint(20) UNSIGNED NOT NULL,
  `shedule` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_seminar_shedules_user_seminar_id_foreign` (`user_seminar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_seminar_shedules`
--

INSERT INTO `user_seminar_shedules` (`id`, `user_seminar_id`, `shedule`, `created_at`, `updated_at`) VALUES
(1, 3, '{\"id\":3,\"seminar_id\":9,\"capacity\":1000,\"date_from\":\"2019-11-27\",\"date_to\":\"2019-12-21\",\"deleted_at\":null,\"created_at\":\"2019-11-25 20:33:15\",\"updated_at\":\"2019-11-25 20:36:14\",\"date\":[{\"id\":9,\"seminar_shedule_id\":3,\"date\":\"2019-11-27\",\"deleted_at\":null,\"created_at\":\"2019-11-25 20:33:56\",\"updated_at\":\"2019-11-25 20:33:56\",\"time\":[{\"id\":19,\"seminar_shedule_date_id\":9,\"from\":1,\"to\":2,\"deleted_at\":null,\"created_at\":\"2019-11-25 20:33:56\",\"updated_at\":\"2019-11-25 20:33:56\"},{\"id\":20,\"seminar_shedule_date_id\":9,\"from\":2,\"to\":3,\"deleted_at\":null,\"created_at\":\"2019-11-25 20:33:56\",\"updated_at\":\"2019-11-25 20:33:56\"}]},{\"id\":10,\"seminar_shedule_id\":3,\"date\":\"2019-11-28\",\"deleted_at\":null,\"created_at\":\"2019-11-25 20:33:56\",\"updated_at\":\"2019-11-25 20:33:56\",\"time\":[{\"id\":21,\"seminar_shedule_date_id\":10,\"from\":1,\"to\":2,\"deleted_at\":null,\"created_at\":\"2019-11-25 20:33:56\",\"updated_at\":\"2019-11-25 20:33:56\"},{\"id\":22,\"seminar_shedule_date_id\":10,\"from\":2,\"to\":3,\"deleted_at\":null,\"created_at\":\"2019-11-25 20:33:56\",\"updated_at\":\"2019-11-25 20:33:56\"},{\"id\":23,\"seminar_shedule_date_id\":10,\"from\":4,\"to\":5,\"deleted_at\":null,\"created_at\":\"2019-11-25 20:33:56\",\"updated_at\":\"2019-11-25 20:33:56\"}]}]}', '2019-11-26 17:03:37', '2019-11-26 17:03:37'),
(2, 1, '{\"id\":3,\"seminar_id\":9,\"capacity\":1000,\"date_from\":\"2019-11-27\",\"date_to\":\"2019-12-21\",\"deleted_at\":null,\"created_at\":\"2019-11-25 20:33:15\",\"updated_at\":\"2019-11-25 20:36:14\",\"date\":[{\"id\":9,\"seminar_shedule_id\":3,\"date\":\"2019-11-27\",\"deleted_at\":null,\"created_at\":\"2019-11-25 20:33:56\",\"updated_at\":\"2019-11-25 20:33:56\",\"time\":[{\"id\":19,\"seminar_shedule_date_id\":9,\"from\":1,\"to\":2,\"deleted_at\":null,\"created_at\":\"2019-11-25 20:33:56\",\"updated_at\":\"2019-11-25 20:33:56\"},{\"id\":20,\"seminar_shedule_date_id\":9,\"from\":2,\"to\":3,\"deleted_at\":null,\"created_at\":\"2019-11-25 20:33:56\",\"updated_at\":\"2019-11-25 20:33:56\"}]},{\"id\":10,\"seminar_shedule_id\":3,\"date\":\"2019-11-28\",\"deleted_at\":null,\"created_at\":\"2019-11-25 20:33:56\",\"updated_at\":\"2019-11-25 20:33:56\",\"time\":[{\"id\":21,\"seminar_shedule_date_id\":10,\"from\":1,\"to\":2,\"deleted_at\":null,\"created_at\":\"2019-11-25 20:33:56\",\"updated_at\":\"2019-11-25 20:33:56\"},{\"id\":22,\"seminar_shedule_date_id\":10,\"from\":2,\"to\":3,\"deleted_at\":null,\"created_at\":\"2019-11-25 20:33:56\",\"updated_at\":\"2019-11-25 20:33:56\"},{\"id\":23,\"seminar_shedule_date_id\":10,\"from\":4,\"to\":5,\"deleted_at\":null,\"created_at\":\"2019-11-25 20:33:56\",\"updated_at\":\"2019-11-25 20:33:56\"}]}]}', '2019-12-09 16:50:48', '2019-12-09 16:50:48');

-- --------------------------------------------------------

--
-- Table structure for table `user_shops`
--

DROP TABLE IF EXISTS `user_shops`;
CREATE TABLE IF NOT EXISTS `user_shops` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_upload_id` bigint(20) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_shops_user_id_unique` (`user_id`),
  KEY `user_shops_image_upload_id_foreign` (`image_upload_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_shops`
--

INSERT INTO `user_shops` (`id`, `user_id`, `title`, `image`, `image_upload_id`, `text`, `created_at`, `updated_at`) VALUES
(1, 1, 'فروشگاه من11', '5dbdc4ba652c0.jpg', 307, '11توضیحاتتوضیحاتتوضیحات', '2019-11-02 18:02:35', '2019-11-02 18:04:50');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
CREATE TABLE IF NOT EXISTS `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `card_num` char(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shaba` char(26) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallets_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `websites`
--

DROP TABLE IF EXISTS `websites`;
CREATE TABLE IF NOT EXISTS `websites` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `template_id` bigint(20) UNSIGNED NOT NULL,
  `header_id` bigint(20) UNSIGNED NOT NULL,
  `footer_id` bigint(20) UNSIGNED NOT NULL,
  `theme_id` bigint(20) UNSIGNED NOT NULL,
  `title` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_tag` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namad_link` text COLLATE utf8mb4_unicode_ci,
  `saman_link` text COLLATE utf8mb4_unicode_ci,
  `top_image` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `top_image_upload_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `websites_top_image_upload_id_foreign` (`top_image_upload_id`),
  KEY `websites_template_id_unique` (`template_id`) USING BTREE,
  KEY `websites_header_id_unique` (`header_id`) USING BTREE,
  KEY `websites_footer_id_unique` (`footer_id`) USING BTREE,
  KEY `websites_theme_id_unique` (`theme_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `websites`
--

INSERT INTO `websites` (`id`, `user_id`, `template_id`, `header_id`, `footer_id`, `theme_id`, `title`, `description`, `meta_tag`, `namad_link`, `saman_link`, `top_image`, `top_image_upload_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 1, 2, 'عنوان وبسایت', 'دسکریپشن', 'متا تگ', 'لینک نماد اعتماد', '', '5df0015e1ce80.jpg', 513, '2019-12-10 16:55:57', '2019-12-10 20:35:19');

-- --------------------------------------------------------

--
-- Table structure for table `website_banners`
--

DROP TABLE IF EXISTS `website_banners`;
CREATE TABLE IF NOT EXISTS `website_banners` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `website_id` bigint(20) UNSIGNED NOT NULL,
  `upload_id` bigint(20) UNSIGNED NOT NULL,
  `image` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_banners_website_id_foreign` (`website_id`),
  KEY `website_banners_upload_id_foreign` (`upload_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `website_banners`
--

INSERT INTO `website_banners` (`id`, `website_id`, `upload_id`, `image`, `link`, `created_at`, `updated_at`) VALUES
(2, 1, 509, '5deff481437b0.jpg', 'dd', '2019-12-10 19:39:46', '2019-12-10 19:39:46');

-- --------------------------------------------------------

--
-- Table structure for table `website_footer_links`
--

DROP TABLE IF EXISTS `website_footer_links`;
CREATE TABLE IF NOT EXISTS `website_footer_links` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `website_id` bigint(20) UNSIGNED NOT NULL,
  `title` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_footer_links_website_id_unique` (`website_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `website_links`
--

DROP TABLE IF EXISTS `website_links`;
CREATE TABLE IF NOT EXISTS `website_links` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `website_id` bigint(20) UNSIGNED NOT NULL,
  `title` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_links_website_id_foreign` (`website_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `website_links`
--

INSERT INTO `website_links` (`id`, `website_id`, `title`, `link`, `created_at`, `updated_at`) VALUES
(2, 1, 'aa', 'aaaa', '2019-12-10 19:31:04', '2019-12-10 19:31:04'),
(3, 1, 'bb', 'bbbb', '2019-12-10 19:31:04', '2019-12-10 19:31:04');

-- --------------------------------------------------------

--
-- Table structure for table `website_pages`
--

DROP TABLE IF EXISTS `website_pages`;
CREATE TABLE IF NOT EXISTS `website_pages` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `website_id` bigint(20) UNSIGNED NOT NULL,
  `slug` enum('about','contact') COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_pages_website_id_slug_unique` (`website_id`,`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `website_pages`
--

INSERT INTO `website_pages` (`id`, `website_id`, `slug`, `text`, `created_at`, `updated_at`) VALUES
(1, 1, 'about', 'صفحه درباره ما', '2019-12-10 20:06:22', '2019-12-10 20:08:33'),
(2, 1, 'contact', 'صفحه تماس با ما', '2019-12-10 20:08:24', '2019-12-10 20:08:24');

-- --------------------------------------------------------

--
-- Table structure for table `website_script_footers`
--

DROP TABLE IF EXISTS `website_script_footers`;
CREATE TABLE IF NOT EXISTS `website_script_footers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `website_id` bigint(20) UNSIGNED NOT NULL,
  `title` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `script` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_script_footers_website_id_unique` (`website_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `website_script_footers`
--

INSERT INTO `website_script_footers` (`id`, `website_id`, `title`, `script`, `created_at`, `updated_at`) VALUES
(1, 1, 'xx', 'xxx', '2019-12-10 18:09:41', '2019-12-10 18:09:41');

-- --------------------------------------------------------

--
-- Table structure for table `website_script_headers`
--

DROP TABLE IF EXISTS `website_script_headers`;
CREATE TABLE IF NOT EXISTS `website_script_headers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `website_id` bigint(20) UNSIGNED NOT NULL,
  `title` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `script` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_script_headers_website_id_unique` (`website_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `website_script_headers`
--

INSERT INTO `website_script_headers` (`id`, `website_id`, `title`, `script`, `created_at`, `updated_at`) VALUES
(4, 1, 'aa', 'aaa', '2019-12-10 17:53:32', '2019-12-10 17:53:32'),
(5, 1, 'bb', 'bbb', '2019-12-10 17:53:32', '2019-12-10 17:53:32');

-- --------------------------------------------------------

--
-- Table structure for table `website_sliders`
--

DROP TABLE IF EXISTS `website_sliders`;
CREATE TABLE IF NOT EXISTS `website_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `website_id` bigint(20) UNSIGNED NOT NULL,
  `upload_id` bigint(20) UNSIGNED NOT NULL,
  `image` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_sliders_website_id_unique` (`website_id`) USING BTREE,
  KEY `website_sliders_upload_id_unique` (`upload_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `website_sliders`
--

INSERT INTO `website_sliders` (`id`, `website_id`, `upload_id`, `image`, `link`, `created_at`, `updated_at`) VALUES
(2, 1, 505, '5defea3262f98.jpg', NULL, '2019-12-10 18:55:50', '2019-12-10 18:55:50'),
(3, 1, 506, '5defea352ef90.jpg', NULL, '2019-12-10 18:55:50', '2019-12-10 18:55:50');

-- --------------------------------------------------------

--
-- Table structure for table `website_socials`
--

DROP TABLE IF EXISTS `website_socials`;
CREATE TABLE IF NOT EXISTS `website_socials` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `website_id` bigint(20) UNSIGNED NOT NULL,
  `upload_id` bigint(20) UNSIGNED NOT NULL,
  `image` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_socials_website_id_foreign` (`website_id`),
  KEY `website_socials_upload_id_foreign` (`upload_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `website_socials`
--

INSERT INTO `website_socials` (`id`, `website_id`, `upload_id`, `image`, `link`, `created_at`, `updated_at`) VALUES
(2, 1, 511, '5deff66b3c668.jpg', 'fb.com', '2019-12-10 19:47:59', '2019-12-10 19:47:59');

-- --------------------------------------------------------

--
-- Table structure for table `website_templates`
--

DROP TABLE IF EXISTS `website_templates`;
CREATE TABLE IF NOT EXISTS `website_templates` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `website_templates`
--

INSERT INTO `website_templates` (`id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(1, 'مورد یک', '', NULL, NULL),
(2, 'مورد دو', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `website_template_footers`
--

DROP TABLE IF EXISTS `website_template_footers`;
CREATE TABLE IF NOT EXISTS `website_template_footers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `website_template_footers`
--

INSERT INTO `website_template_footers` (`id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(1, 'مورد یک', '', NULL, NULL),
(2, 'مورد دو', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `website_template_headers`
--

DROP TABLE IF EXISTS `website_template_headers`;
CREATE TABLE IF NOT EXISTS `website_template_headers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `website_template_headers`
--

INSERT INTO `website_template_headers` (`id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(1, 'مورد یک', '', NULL, NULL),
(2, 'مورد 2', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `website_template_themes`
--

DROP TABLE IF EXISTS `website_template_themes`;
CREATE TABLE IF NOT EXISTS `website_template_themes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `website_template_themes`
--

INSERT INTO `website_template_themes` (`id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(1, 'مورد یک', '', NULL, NULL),
(2, 'مورد دو', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_channels`
--

DROP TABLE IF EXISTS `wishlist_channels`;
CREATE TABLE IF NOT EXISTS `wishlist_channels` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `wishlist_id` bigint(20) UNSIGNED NOT NULL,
  `channel_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wishlist_channels_user_id_channel_id_unique` (`user_id`,`channel_id`),
  KEY `wishlist_channels_wishlist_id_foreign` (`wishlist_id`),
  KEY `wishlist_channels_channel_id_foreign` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `wishlist_channels`
--
DROP TRIGGER IF EXISTS `delete_wish_list_channels`;
DELIMITER $$
CREATE TRIGGER `delete_wish_list_channels` AFTER DELETE ON `wishlist_channels` FOR EACH ROW BEGIN
                UPDATE channels SET stat_likes = stat_likes - 1 WHERE id = OLD.channel_id ; 
            END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_wish_list_channels`;
DELIMITER $$
CREATE TRIGGER `insert_wish_list_channels` AFTER INSERT ON `wishlist_channels` FOR EACH ROW BEGIN
                UPDATE channels SET stat_likes = stat_likes + 1 WHERE id = NEW.channel_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_quizzes`
--

DROP TABLE IF EXISTS `wishlist_quizzes`;
CREATE TABLE IF NOT EXISTS `wishlist_quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `wishlist_id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wishlist_quizzes_user_id_quiz_id_unique` (`user_id`,`quiz_id`),
  KEY `wishlist_quizzes_wishlist_id_foreign` (`wishlist_id`),
  KEY `wishlist_quizzes_quiz_id_foreign` (`quiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlist_quizzes`
--

INSERT INTO `wishlist_quizzes` (`id`, `user_id`, `wishlist_id`, `quiz_id`, `created_at`, `updated_at`) VALUES
(2, 1, 15, 11, '2019-11-22 12:41:00', '2019-11-22 12:41:00');

--
-- Triggers `wishlist_quizzes`
--
DROP TRIGGER IF EXISTS `delete_wishlist_quizzes`;
DELIMITER $$
CREATE TRIGGER `delete_wishlist_quizzes` AFTER DELETE ON `wishlist_quizzes` FOR EACH ROW BEGIN
                UPDATE quizzes SET stat_wished = stat_wished - 1 WHERE id = OLD.quiz_id ; 
            END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_wishlist_quizzes`;
DELIMITER $$
CREATE TRIGGER `insert_wishlist_quizzes` AFTER INSERT ON `wishlist_quizzes` FOR EACH ROW BEGIN
                UPDATE quizzes SET stat_wished = stat_wished + 1 WHERE id = NEW.quiz_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `wish_lists`
--

DROP TABLE IF EXISTS `wish_lists`;
CREATE TABLE IF NOT EXISTS `wish_lists` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('consultant','course','seminar','quiz','channel','product') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wish_lists_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wish_lists`
--

INSERT INTO `wish_lists` (`id`, `user_id`, `type`, `created_at`, `updated_at`) VALUES
(7, 1, 'consultant', '2019-11-12 02:41:03', '2019-11-12 02:41:03'),
(9, 1, 'course', '2019-11-15 17:45:26', '2019-11-15 17:45:26'),
(15, 1, 'quiz', '2019-11-22 12:41:00', '2019-11-22 12:41:00'),
(18, 1, 'quiz', '2019-11-26 16:41:08', '2019-11-26 16:41:08'),
(21, 1, 'product', '2019-12-08 17:46:55', '2019-12-08 17:46:55');

-- --------------------------------------------------------

--
-- Table structure for table `wish_list_consultants`
--

DROP TABLE IF EXISTS `wish_list_consultants`;
CREATE TABLE IF NOT EXISTS `wish_list_consultants` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `wishlist_id` bigint(20) UNSIGNED NOT NULL,
  `consultant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wish_list_consultants_user_id_consultant_id_unique` (`user_id`,`consultant_id`),
  KEY `wish_list_consultants_wishlist_id_foreign` (`wishlist_id`),
  KEY `wish_list_consultants_consultant_id_foreign` (`consultant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wish_list_consultants`
--

INSERT INTO `wish_list_consultants` (`id`, `user_id`, `wishlist_id`, `consultant_id`, `created_at`, `updated_at`) VALUES
(7, 1, 7, 5, '2019-11-12 02:41:03', '2019-11-12 02:41:03');

--
-- Triggers `wish_list_consultants`
--
DROP TRIGGER IF EXISTS `delete_wish_list_consultants`;
DELIMITER $$
CREATE TRIGGER `delete_wish_list_consultants` AFTER DELETE ON `wish_list_consultants` FOR EACH ROW BEGIN
                UPDATE consultants SET stat_likes = stat_likes - 1 WHERE id = OLD.consultant_id ; 
            END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_wish_list_consultants`;
DELIMITER $$
CREATE TRIGGER `insert_wish_list_consultants` AFTER INSERT ON `wish_list_consultants` FOR EACH ROW BEGIN
                UPDATE consultants SET stat_likes = stat_likes + 1 WHERE id = NEW.consultant_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `wish_list_courses`
--

DROP TABLE IF EXISTS `wish_list_courses`;
CREATE TABLE IF NOT EXISTS `wish_list_courses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `wishlist_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wish_list_courses_user_id_course_id_unique` (`user_id`,`course_id`),
  KEY `wish_list_courses_wishlist_id_foreign` (`wishlist_id`),
  KEY `wish_list_courses_course_id_foreign` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wish_list_courses`
--

INSERT INTO `wish_list_courses` (`id`, `user_id`, `wishlist_id`, `course_id`, `created_at`, `updated_at`) VALUES
(2, 1, 9, 10, '2019-11-15 17:45:26', '2019-11-15 17:45:26');

--
-- Triggers `wish_list_courses`
--
DROP TRIGGER IF EXISTS `delete_wish_list_courses`;
DELIMITER $$
CREATE TRIGGER `delete_wish_list_courses` AFTER DELETE ON `wish_list_courses` FOR EACH ROW BEGIN
                UPDATE courses SET stat_likes = stat_likes - 1 WHERE id = OLD.course_id ; 
            END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_wish_list_courses`;
DELIMITER $$
CREATE TRIGGER `insert_wish_list_courses` AFTER INSERT ON `wish_list_courses` FOR EACH ROW BEGIN
                UPDATE courses SET stat_likes = stat_likes + 1 WHERE id = NEW.course_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `wish_list_products`
--

DROP TABLE IF EXISTS `wish_list_products`;
CREATE TABLE IF NOT EXISTS `wish_list_products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `wishlist_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wish_list_products_user_id_product_id_unique` (`user_id`,`product_id`),
  KEY `wish_list_products_wishlist_id_foreign` (`wishlist_id`),
  KEY `wish_list_products_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wish_list_products`
--

INSERT INTO `wish_list_products` (`id`, `user_id`, `wishlist_id`, `product_id`, `created_at`, `updated_at`) VALUES
(3, 1, 21, 3, '2019-12-08 17:46:55', '2019-12-08 17:46:55');

--
-- Triggers `wish_list_products`
--
DROP TRIGGER IF EXISTS `delete_wish_list_products`;
DELIMITER $$
CREATE TRIGGER `delete_wish_list_products` AFTER DELETE ON `wish_list_products` FOR EACH ROW BEGIN
                UPDATE user_products SET stat_wished = stat_wished - 1 WHERE id = OLD.product_id ; 
            END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_wish_list_products`;
DELIMITER $$
CREATE TRIGGER `insert_wish_list_products` AFTER INSERT ON `wish_list_products` FOR EACH ROW BEGIN
                UPDATE user_products SET stat_wished = stat_wished + 1 WHERE id = NEW.product_id ; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `wish_list_seminars`
--

DROP TABLE IF EXISTS `wish_list_seminars`;
CREATE TABLE IF NOT EXISTS `wish_list_seminars` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seminar_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `wishlist_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wish_list_seminars_user_id_seminar_id_unique` (`user_id`,`seminar_id`),
  KEY `wish_list_seminars_seminar_id_foreign` (`seminar_id`),
  KEY `wish_list_seminars_wishlist_id_foreign` (`wishlist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wish_list_seminars`
--

INSERT INTO `wish_list_seminars` (`id`, `seminar_id`, `user_id`, `wishlist_id`, `created_at`, `updated_at`) VALUES
(3, 9, 1, 18, '2019-11-26 16:41:08', '2019-11-26 16:41:08');

--
-- Triggers `wish_list_seminars`
--
DROP TRIGGER IF EXISTS `delete_wish_list_seminars`;
DELIMITER $$
CREATE TRIGGER `delete_wish_list_seminars` AFTER DELETE ON `wish_list_seminars` FOR EACH ROW BEGIN
                UPDATE seminars SET stat_wished = stat_wished - 1 WHERE id = OLD.seminar_id ; 
            END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_wish_list_seminars`;
DELIMITER $$
CREATE TRIGGER `insert_wish_list_seminars` AFTER INSERT ON `wish_list_seminars` FOR EACH ROW BEGIN
                UPDATE seminars SET stat_wished = stat_wished + 1 WHERE id = NEW.seminar_id ; 
            END
$$
DELIMITER ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `channele_publish_confirms`
--
ALTER TABLE `channele_publish_confirms`
  ADD CONSTRAINT `channele_publish_confirms_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `channele_publish_confirms_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  ADD CONSTRAINT `channele_publish_confirms_request_id_foreign` FOREIGN KEY (`request_id`) REFERENCES `channele_publish_requests` (`id`);

--
-- Constraints for table `channele_publish_requests`
--
ALTER TABLE `channele_publish_requests`
  ADD CONSTRAINT `channele_publish_requests_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `channele_publish_requests_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`);

--
-- Constraints for table `channele_sub_prices`
--
ALTER TABLE `channele_sub_prices`
  ADD CONSTRAINT `channele_sub_prices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`);

--
-- Constraints for table `channels`
--
ALTER TABLE `channels`
  ADD CONSTRAINT `channels_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `channel_categories`
--
ALTER TABLE `channel_categories`
  ADD CONSTRAINT `channel_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `channel_categories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `channel_educationals`
--
ALTER TABLE `channel_educationals`
  ADD CONSTRAINT `channel_educationals_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  ADD CONSTRAINT `channel_educationals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `channel_followers`
--
ALTER TABLE `channel_followers`
  ADD CONSTRAINT `channel_followers_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  ADD CONSTRAINT `channel_followers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `channel_posts`
--
ALTER TABLE `channel_posts`
  ADD CONSTRAINT `channel_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `channel_post_comments`
--
ALTER TABLE `channel_post_comments`
  ADD CONSTRAINT `channel_post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `channel_posts` (`id`),
  ADD CONSTRAINT `channel_post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `channel_post_images`
--
ALTER TABLE `channel_post_images`
  ADD CONSTRAINT `channel_post_images_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `channel_posts` (`id`),
  ADD CONSTRAINT `channel_post_images_upload_id_foreign` FOREIGN KEY (`upload_id`) REFERENCES `uploads` (`id`);

--
-- Constraints for table `channel_post_likes`
--
ALTER TABLE `channel_post_likes`
  ADD CONSTRAINT `channel_post_likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `channel_posts` (`id`),
  ADD CONSTRAINT `channel_post_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `channel_post_videos`
--
ALTER TABLE `channel_post_videos`
  ADD CONSTRAINT `channel_post_videos_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `channel_posts` (`id`),
  ADD CONSTRAINT `channel_post_videos_upload_id_foreign` FOREIGN KEY (`upload_id`) REFERENCES `uploads` (`id`);

--
-- Constraints for table `channel_publics`
--
ALTER TABLE `channel_publics`
  ADD CONSTRAINT `channel_publics_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  ADD CONSTRAINT `channel_publics_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `channel_ratings`
--
ALTER TABLE `channel_ratings`
  ADD CONSTRAINT `channel_ratings_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  ADD CONSTRAINT `channel_ratings_follower_id_foreign` FOREIGN KEY (`follower_id`) REFERENCES `channel_followers` (`id`),
  ADD CONSTRAINT `channel_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `consultants`
--
ALTER TABLE `consultants`
  ADD CONSTRAINT `consultants_image_upload_id_foreign` FOREIGN KEY (`image_upload_id`) REFERENCES `uploads` (`id`),
  ADD CONSTRAINT `consultants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `consultant_categories`
--
ALTER TABLE `consultant_categories`
  ADD CONSTRAINT `consultant_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `consultant_categories_consultant_id_foreign` FOREIGN KEY (`consultant_id`) REFERENCES `consultants` (`id`);

--
-- Constraints for table `consultant_contacts`
--
ALTER TABLE `consultant_contacts`
  ADD CONSTRAINT `consultant_contacts_consultant_id_foreign` FOREIGN KEY (`consultant_id`) REFERENCES `consultants` (`id`);

--
-- Constraints for table `consultant_dates`
--
ALTER TABLE `consultant_dates`
  ADD CONSTRAINT `consultant_dates_consultant_id_foreign` FOREIGN KEY (`consultant_id`) REFERENCES `consultants` (`id`);

--
-- Constraints for table `consultant_plans`
--
ALTER TABLE `consultant_plans`
  ADD CONSTRAINT `consultant_plans_consultant_id_foreign` FOREIGN KEY (`consultant_id`) REFERENCES `consultants` (`id`);

--
-- Constraints for table `consultant_plan_organs`
--
ALTER TABLE `consultant_plan_organs`
  ADD CONSTRAINT `consultant_plan_organs_consultant_id_foreign` FOREIGN KEY (`consultant_id`) REFERENCES `consultants` (`id`);

--
-- Constraints for table `consultant_publish_confirms`
--
ALTER TABLE `consultant_publish_confirms`
  ADD CONSTRAINT `consultant_publish_confirms_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `consultant_publish_confirms_consultant_id_foreign` FOREIGN KEY (`consultant_id`) REFERENCES `consultants` (`id`),
  ADD CONSTRAINT `consultant_publish_confirms_request_id_foreign` FOREIGN KEY (`request_id`) REFERENCES `consultant_publish_requests` (`id`);

--
-- Constraints for table `consultant_publish_requests`
--
ALTER TABLE `consultant_publish_requests`
  ADD CONSTRAINT `consultant_publish_requests_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `consultant_publish_requests_consultant_id_foreign` FOREIGN KEY (`consultant_id`) REFERENCES `consultants` (`id`);

--
-- Constraints for table `consultant_ratings`
--
ALTER TABLE `consultant_ratings`
  ADD CONSTRAINT `consultant_ratings_consultant_id_foreign` FOREIGN KEY (`consultant_id`) REFERENCES `consultants` (`id`),
  ADD CONSTRAINT `consultant_ratings_user_consultant_id_foreign` FOREIGN KEY (`user_consultant_id`) REFERENCES `user_consultants` (`id`),
  ADD CONSTRAINT `consultant_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `consultant_times`
--
ALTER TABLE `consultant_times`
  ADD CONSTRAINT `consultant_times_consultant_date_id_foreign` FOREIGN KEY (`consultant_date_id`) REFERENCES `consultant_dates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `consultant_views`
--
ALTER TABLE `consultant_views`
  ADD CONSTRAINT `consultant_views_consultant_id_foreign` FOREIGN KEY (`consultant_id`) REFERENCES `consultants` (`id`),
  ADD CONSTRAINT `consultant_views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `course_categories`
--
ALTER TABLE `course_categories`
  ADD CONSTRAINT `course_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `course_categories_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `course_cupons`
--
ALTER TABLE `course_cupons`
  ADD CONSTRAINT `course_cupons_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `course_discussions`
--
ALTER TABLE `course_discussions`
  ADD CONSTRAINT `course_discussions_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `course_discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `course_discussion_responses`
--
ALTER TABLE `course_discussion_responses`
  ADD CONSTRAINT `course_discussion_responses_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `course_discussions` (`id`),
  ADD CONSTRAINT `course_discussion_responses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `course_final_quizzes`
--
ALTER TABLE `course_final_quizzes`
  ADD CONSTRAINT `course_final_quizzes_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_final_quizzes_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_lectures`
--
ALTER TABLE `course_lectures`
  ADD CONSTRAINT `course_lectures_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `course_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_lecture_quizzes`
--
ALTER TABLE `course_lecture_quizzes`
  ADD CONSTRAINT `course_lecture_quizzes_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `course_lectures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_lecture_resources`
--
ALTER TABLE `course_lecture_resources`
  ADD CONSTRAINT `course_lecture_resources_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `course_lectures` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_lecture_resources_upload_id_foreign` FOREIGN KEY (`upload_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_lecture_videos`
--
ALTER TABLE `course_lecture_videos`
  ADD CONSTRAINT `course_lecture_videos_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `course_lectures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_likes`
--
ALTER TABLE `course_likes`
  ADD CONSTRAINT `course_likes_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `course_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `course_messages`
--
ALTER TABLE `course_messages`
  ADD CONSTRAINT `course_messages_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `course_plans`
--
ALTER TABLE `course_plans`
  ADD CONSTRAINT `course_plans_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `course_plan_organs`
--
ALTER TABLE `course_plan_organs`
  ADD CONSTRAINT `course_plan_organs_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `course_pres`
--
ALTER TABLE `course_pres`
  ADD CONSTRAINT `course_pres_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `course_publihs`
--
ALTER TABLE `course_publihs`
  ADD CONSTRAINT `course_publihs_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `course_publihs_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `course_publish_confirms`
--
ALTER TABLE `course_publish_confirms`
  ADD CONSTRAINT `course_publish_confirms_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `course_publish_confirms_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `course_publish_confirms_request_id_foreign` FOREIGN KEY (`request_id`) REFERENCES `course_publish_requests` (`id`);

--
-- Constraints for table `course_publish_requests`
--
ALTER TABLE `course_publish_requests`
  ADD CONSTRAINT `course_publish_requests_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `course_publish_requests_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `course_ratings`
--
ALTER TABLE `course_ratings`
  ADD CONSTRAINT `course_ratings_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `course_ratings_user_course_id_foreign` FOREIGN KEY (`user_course_id`) REFERENCES `user_courses` (`id`),
  ADD CONSTRAINT `course_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `course_reqs`
--
ALTER TABLE `course_reqs`
  ADD CONSTRAINT `course_reqs_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `course_sections`
--
ALTER TABLE `course_sections`
  ADD CONSTRAINT `course_sections_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `course_targets`
--
ALTER TABLE `course_targets`
  ADD CONSTRAINT `course_targets_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `course_technologies`
--
ALTER TABLE `course_technologies`
  ADD CONSTRAINT `course_technologies_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `course_technologies_technology_id_foreign` FOREIGN KEY (`technology_id`) REFERENCES `technologies` (`id`);

--
-- Constraints for table `course_views`
--
ALTER TABLE `course_views`
  ADD CONSTRAINT `course_views_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `course_views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cours_cupons`
--
ALTER TABLE `cours_cupons`
  ADD CONSTRAINT `cours_cupons_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `cupons`
--
ALTER TABLE `cupons`
  ADD CONSTRAINT `cupons_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cupon_consultants`
--
ALTER TABLE `cupon_consultants`
  ADD CONSTRAINT `cupon_consultants_consultant_id_foreign` FOREIGN KEY (`consultant_id`) REFERENCES `consultants` (`id`),
  ADD CONSTRAINT `cupon_consultants_cupon_id_foreign` FOREIGN KEY (`cupon_id`) REFERENCES `cupons` (`id`);

--
-- Constraints for table `cupon_courses`
--
ALTER TABLE `cupon_courses`
  ADD CONSTRAINT `cupon_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `cupon_courses_cupon_id_foreign` FOREIGN KEY (`cupon_id`) REFERENCES `cupons` (`id`);

--
-- Constraints for table `cupon_globals`
--
ALTER TABLE `cupon_globals`
  ADD CONSTRAINT `cupon_globals_cupon_id_foreign` FOREIGN KEY (`cupon_id`) REFERENCES `cupons` (`id`);

--
-- Constraints for table `cupon_quizzes`
--
ALTER TABLE `cupon_quizzes`
  ADD CONSTRAINT `cupon_quizzes_cupon_id_foreign` FOREIGN KEY (`cupon_id`) REFERENCES `cupons` (`id`),
  ADD CONSTRAINT `cupon_quizzes_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`);

--
-- Constraints for table `cupon_seminars`
--
ALTER TABLE `cupon_seminars`
  ADD CONSTRAINT `cupon_seminars_cupon_id_foreign` FOREIGN KEY (`cupon_id`) REFERENCES `cupons` (`id`),
  ADD CONSTRAINT `cupon_seminars_seminar_id_foreign` FOREIGN KEY (`seminar_id`) REFERENCES `seminars` (`id`);

--
-- Constraints for table `discoussions`
--
ALTER TABLE `discoussions`
  ADD CONSTRAINT `discoussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `discoussion_responses`
--
ALTER TABLE `discoussion_responses`
  ADD CONSTRAINT `discoussion_responses_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discoussions` (`id`),
  ADD CONSTRAINT `discoussion_responses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `discoussion_seminars`
--
ALTER TABLE `discoussion_seminars`
  ADD CONSTRAINT `discoussion_seminars_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discoussions` (`id`),
  ADD CONSTRAINT `discoussion_seminars_seminar_id_foreign` FOREIGN KEY (`seminar_id`) REFERENCES `seminars` (`id`);

--
-- Constraints for table `discussion_consultants`
--
ALTER TABLE `discussion_consultants`
  ADD CONSTRAINT `discussion_consultants_consultant_id_foreign` FOREIGN KEY (`consultant_id`) REFERENCES `consultants` (`id`),
  ADD CONSTRAINT `discussion_consultants_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discoussions` (`id`);

--
-- Constraints for table `discussion_courses`
--
ALTER TABLE `discussion_courses`
  ADD CONSTRAINT `discussion_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `discussion_courses_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discoussions` (`id`);

--
-- Constraints for table `discussion_products`
--
ALTER TABLE `discussion_products`
  ADD CONSTRAINT `discussion_products_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discoussions` (`id`),
  ADD CONSTRAINT `discussion_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `user_products` (`id`);

--
-- Constraints for table `discussion_quizzes`
--
ALTER TABLE `discussion_quizzes`
  ADD CONSTRAINT `discussion_quizzes_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discoussions` (`id`),
  ADD CONSTRAINT `discussion_quizzes_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`);

--
-- Constraints for table `instrocture_video_tests`
--
ALTER TABLE `instrocture_video_tests`
  ADD CONSTRAINT `instrocture_video_tests_upload_id_foreign` FOREIGN KEY (`upload_id`) REFERENCES `uploads` (`id`),
  ADD CONSTRAINT `instrocture_video_tests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_reciver_id_foreign` FOREIGN KEY (`reciver_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notifications_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `product_ratings`
--
ALTER TABLE `product_ratings`
  ADD CONSTRAINT `product_ratings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `user_products` (`id`),
  ADD CONSTRAINT `product_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `product_ratings_user_product_buy_id_foreign` FOREIGN KEY (`user_product_buy_id`) REFERENCES `user_product_buys` (`id`);

--
-- Constraints for table `product_views`
--
ALTER TABLE `product_views`
  ADD CONSTRAINT `product_views_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `user_products` (`id`),
  ADD CONSTRAINT `product_views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD CONSTRAINT `quiz_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_categories`
--
ALTER TABLE `quiz_categories`
  ADD CONSTRAINT `quiz_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `quiz_categories_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_certificates`
--
ALTER TABLE `quiz_certificates`
  ADD CONSTRAINT `quiz_certificates_logo_image_upload_id_foreign` FOREIGN KEY (`logo_image_upload_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_certificates_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_certificates_signature_image_upload_id_foreign` FOREIGN KEY (`signature_image_upload_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_plans`
--
ALTER TABLE `quiz_plans`
  ADD CONSTRAINT `quiz_plans_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`);

--
-- Constraints for table `quiz_plan_organs`
--
ALTER TABLE `quiz_plan_organs`
  ADD CONSTRAINT `quiz_plan_organs_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`);

--
-- Constraints for table `quiz_point_groups`
--
ALTER TABLE `quiz_point_groups`
  ADD CONSTRAINT `quiz_point_groups_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_publish_confirms`
--
ALTER TABLE `quiz_publish_confirms`
  ADD CONSTRAINT `quiz_publish_confirms_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `quiz_publish_confirms_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `quiz_publish_confirms_request_id_foreign` FOREIGN KEY (`request_id`) REFERENCES `quiz_publish_requests` (`id`);

--
-- Constraints for table `quiz_publish_requests`
--
ALTER TABLE `quiz_publish_requests`
  ADD CONSTRAINT `quiz_publish_requests_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `quiz_publish_requests_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`);

--
-- Constraints for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD CONSTRAINT `quiz_questions_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_ratings`
--
ALTER TABLE `quiz_ratings`
  ADD CONSTRAINT `quiz_ratings_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `quiz_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `quiz_ratings_user_quiz_id_foreign` FOREIGN KEY (`user_quiz_id`) REFERENCES `user_quizzes` (`id`);

--
-- Constraints for table `quiz_views`
--
ALTER TABLE `quiz_views`
  ADD CONSTRAINT `quiz_views_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `quiz_views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `seminars`
--
ALTER TABLE `seminars`
  ADD CONSTRAINT `seminars_upload_id_foreign` FOREIGN KEY (`upload_id`) REFERENCES `uploads` (`id`),
  ADD CONSTRAINT `seminars_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `seminar_categories`
--
ALTER TABLE `seminar_categories`
  ADD CONSTRAINT `seminar_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `seminar_categories_seminar_id_foreign` FOREIGN KEY (`seminar_id`) REFERENCES `seminars` (`id`);

--
-- Constraints for table `seminar_dates`
--
ALTER TABLE `seminar_dates`
  ADD CONSTRAINT `seminar_dates_seminar_id_foreign` FOREIGN KEY (`seminar_id`) REFERENCES `seminars` (`id`);

--
-- Constraints for table `seminar_galleries`
--
ALTER TABLE `seminar_galleries`
  ADD CONSTRAINT `seminar_galleries_seminar_id_foreign` FOREIGN KEY (`seminar_id`) REFERENCES `seminars` (`id`);

--
-- Constraints for table `seminar_gallery_images`
--
ALTER TABLE `seminar_gallery_images`
  ADD CONSTRAINT `seminar_gallery_images_gallery_id_foreign` FOREIGN KEY (`gallery_id`) REFERENCES `seminar_galleries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `seminar_gallery_images_upload_id_foreign` FOREIGN KEY (`upload_id`) REFERENCES `uploads` (`id`);

--
-- Constraints for table `seminar_gallery_videos`
--
ALTER TABLE `seminar_gallery_videos`
  ADD CONSTRAINT `seminar_gallery_videos_gallery_id_foreign` FOREIGN KEY (`gallery_id`) REFERENCES `seminar_galleries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `seminar_gallery_videos_upload_id_foreign` FOREIGN KEY (`upload_id`) REFERENCES `uploads` (`id`);

--
-- Constraints for table `seminar_plans`
--
ALTER TABLE `seminar_plans`
  ADD CONSTRAINT `seminar_plans_seminar_id_foreign` FOREIGN KEY (`seminar_id`) REFERENCES `seminars` (`id`);

--
-- Constraints for table `seminar_plan_organs`
--
ALTER TABLE `seminar_plan_organs`
  ADD CONSTRAINT `seminar_plan_organs_seminar_id_foreign` FOREIGN KEY (`seminar_id`) REFERENCES `seminars` (`id`);

--
-- Constraints for table `seminar_publish_confirms`
--
ALTER TABLE `seminar_publish_confirms`
  ADD CONSTRAINT `seminar_publish_confirms_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `seminar_publish_confirms_request_id_foreign` FOREIGN KEY (`request_id`) REFERENCES `seminar_publish_requests` (`id`),
  ADD CONSTRAINT `seminar_publish_confirms_seminar_id_foreign` FOREIGN KEY (`seminar_id`) REFERENCES `seminars` (`id`);

--
-- Constraints for table `seminar_publish_requests`
--
ALTER TABLE `seminar_publish_requests`
  ADD CONSTRAINT `seminar_publish_requests_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `seminar_publish_requests_seminar_id_foreign` FOREIGN KEY (`seminar_id`) REFERENCES `seminars` (`id`);

--
-- Constraints for table `seminar_quizzes`
--
ALTER TABLE `seminar_quizzes`
  ADD CONSTRAINT `seminar_quizzes_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `seminar_quizzes_seminar_id_foreign` FOREIGN KEY (`seminar_id`) REFERENCES `seminars` (`id`);

--
-- Constraints for table `seminar_ratings`
--
ALTER TABLE `seminar_ratings`
  ADD CONSTRAINT `seminar_ratings_seminar_id_foreign` FOREIGN KEY (`seminar_id`) REFERENCES `seminars` (`id`),
  ADD CONSTRAINT `seminar_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `seminar_ratings_user_seminars_id_foreign` FOREIGN KEY (`user_seminars_id`) REFERENCES `user_seminars` (`id`);

--
-- Constraints for table `seminar_shedules`
--
ALTER TABLE `seminar_shedules`
  ADD CONSTRAINT `seminar_shedules_seminar_id_foreign` FOREIGN KEY (`seminar_id`) REFERENCES `seminars` (`id`);

--
-- Constraints for table `seminar_shedule_dates`
--
ALTER TABLE `seminar_shedule_dates`
  ADD CONSTRAINT `seminar_shedule_dates_seminar_shedule_id_foreign` FOREIGN KEY (`seminar_shedule_id`) REFERENCES `seminar_shedules` (`id`);

--
-- Constraints for table `seminar_shedule_times`
--
ALTER TABLE `seminar_shedule_times`
  ADD CONSTRAINT `seminar_shedule_times_seminar_shedule_date_id_foreign` FOREIGN KEY (`seminar_shedule_date_id`) REFERENCES `seminar_shedule_dates` (`id`);

--
-- Constraints for table `seminar_times`
--
ALTER TABLE `seminar_times`
  ADD CONSTRAINT `seminar_times_date_id_foreign` FOREIGN KEY (`date_id`) REFERENCES `seminar_times` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seminar_views`
--
ALTER TABLE `seminar_views`
  ADD CONSTRAINT `seminar_views_seminar_id_foreign` FOREIGN KEY (`seminar_id`) REFERENCES `seminars` (`id`),
  ADD CONSTRAINT `seminar_views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `standalone_quizzes`
--
ALTER TABLE `standalone_quizzes`
  ADD CONSTRAINT `standalone_quizzes_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `standalone_quizzes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `teacher_profiles`
--
ALTER TABLE `teacher_profiles`
  ADD CONSTRAINT `teacher_profiles_upload_id_foreign` FOREIGN KEY (`upload_id`) REFERENCES `uploads` (`id`),
  ADD CONSTRAINT `teacher_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ticket_dialogs`
--
ALTER TABLE `ticket_dialogs`
  ADD CONSTRAINT `ticket_dialogs_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ticket_dialogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ticket_supports`
--
ALTER TABLE `ticket_supports`
  ADD CONSTRAINT `ticket_supports_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ticket_teachers`
--
ALTER TABLE `ticket_teachers`
  ADD CONSTRAINT `ticket_teachers_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_profiles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ticket_teachers_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_channels`
--
ALTER TABLE `transaction_channels`
  ADD CONSTRAINT `transaction_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  ADD CONSTRAINT `transaction_channels_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  ADD CONSTRAINT `transaction_channels_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `transaction_consultants`
--
ALTER TABLE `transaction_consultants`
  ADD CONSTRAINT `transaction_consultants_consultant_id_foreign` FOREIGN KEY (`consultant_id`) REFERENCES `consultants` (`id`),
  ADD CONSTRAINT `transaction_consultants_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  ADD CONSTRAINT `transaction_consultants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `transaction_courses`
--
ALTER TABLE `transaction_courses`
  ADD CONSTRAINT `transaction_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `transaction_courses_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  ADD CONSTRAINT `transaction_courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `transaction_incomes`
--
ALTER TABLE `transaction_incomes`
  ADD CONSTRAINT `transaction_incomes_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  ADD CONSTRAINT `transaction_incomes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_products`
--
ALTER TABLE `transaction_products`
  ADD CONSTRAINT `transaction_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `user_products` (`id`),
  ADD CONSTRAINT `transaction_products_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  ADD CONSTRAINT `transaction_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `transaction_quizzes`
--
ALTER TABLE `transaction_quizzes`
  ADD CONSTRAINT `transaction_quizzes_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `transaction_quizzes_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  ADD CONSTRAINT `transaction_quizzes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `transaction_seminars`
--
ALTER TABLE `transaction_seminars`
  ADD CONSTRAINT `transaction_seminars_seminar_id_foreign` FOREIGN KEY (`seminar_id`) REFERENCES `seminars` (`id`),
  ADD CONSTRAINT `transaction_seminars_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  ADD CONSTRAINT `transaction_seminars_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `transaction_withdraws`
--
ALTER TABLE `transaction_withdraws`
  ADD CONSTRAINT `transaction_withdraws_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_withdraws_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_withdraws_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_withdraws_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`);

--
-- Constraints for table `transaction_withdraw_results`
--
ALTER TABLE `transaction_withdraw_results`
  ADD CONSTRAINT `transaction_withdraw_results_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `transaction_withdraw_results_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_withdraw_results_transaction_withdraw_id_foreign` FOREIGN KEY (`transaction_withdraw_id`) REFERENCES `transaction_withdraws` (`id`),
  ADD CONSTRAINT `transaction_withdraw_results_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_consultants`
--
ALTER TABLE `user_consultants`
  ADD CONSTRAINT `user_consultants_consultant_id_foreign` FOREIGN KEY (`consultant_id`) REFERENCES `consultants` (`id`),
  ADD CONSTRAINT `user_consultants_transaction_consultants_id_foreign` FOREIGN KEY (`transaction_consultants_id`) REFERENCES `transaction_consultants` (`id`),
  ADD CONSTRAINT `user_consultants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_courses`
--
ALTER TABLE `user_courses`
  ADD CONSTRAINT `user_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `user_courses_transaction_course_id_foreign` FOREIGN KEY (`transaction_course_id`) REFERENCES `transaction_courses` (`id`),
  ADD CONSTRAINT `user_courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD CONSTRAINT `user_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_products`
--
ALTER TABLE `user_products`
  ADD CONSTRAINT `user_products_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `user_shops` (`id`);

--
-- Constraints for table `user_product_buys`
--
ALTER TABLE `user_product_buys`
  ADD CONSTRAINT `user_product_buys_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `user_products` (`id`),
  ADD CONSTRAINT `user_product_buys_transaction_product_id_foreign` FOREIGN KEY (`transaction_product_id`) REFERENCES `transaction_products` (`id`),
  ADD CONSTRAINT `user_product_buys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_product_buy_downloads`
--
ALTER TABLE `user_product_buy_downloads`
  ADD CONSTRAINT `user_product_buy_downloads_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `user_products` (`id`),
  ADD CONSTRAINT `user_product_buy_downloads_user_product_buy_id_foreign` FOREIGN KEY (`user_product_buy_id`) REFERENCES `user_product_buys` (`id`);

--
-- Constraints for table `user_product_buy_orders`
--
ALTER TABLE `user_product_buy_orders`
  ADD CONSTRAINT `user_product_buy_orders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `user_products` (`id`),
  ADD CONSTRAINT `user_product_buy_orders_user_product_buy_id_foreign` FOREIGN KEY (`user_product_buy_id`) REFERENCES `user_product_buys` (`id`);

--
-- Constraints for table `user_product_galleries`
--
ALTER TABLE `user_product_galleries`
  ADD CONSTRAINT `user_product_galleries_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `user_products` (`id`),
  ADD CONSTRAINT `user_product_galleries_upload_id_foreign` FOREIGN KEY (`upload_id`) REFERENCES `uploads` (`id`);

--
-- Constraints for table `user_product_plans`
--
ALTER TABLE `user_product_plans`
  ADD CONSTRAINT `user_product_plans_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `user_products` (`id`);

--
-- Constraints for table `user_product_stocks`
--
ALTER TABLE `user_product_stocks`
  ADD CONSTRAINT `user_product_stocks_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `user_products` (`id`);

--
-- Constraints for table `user_quizzes`
--
ALTER TABLE `user_quizzes`
  ADD CONSTRAINT `user_quizzes_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `user_quizzes_transaction_quiz_id_foreign` FOREIGN KEY (`transaction_quiz_id`) REFERENCES `transaction_quizzes` (`id`),
  ADD CONSTRAINT `user_quizzes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_quiz_boughts`
--
ALTER TABLE `user_quiz_boughts`
  ADD CONSTRAINT `user_quiz_boughts_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `user_quiz_boughts_transaction_quiz_id_foreign` FOREIGN KEY (`transaction_quiz_id`) REFERENCES `transaction_quizzes` (`id`),
  ADD CONSTRAINT `user_quiz_boughts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_quiz_courses`
--
ALTER TABLE `user_quiz_courses`
  ADD CONSTRAINT `user_quiz_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `user_quiz_courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_quiz_courses_user_quiz_id_foreign` FOREIGN KEY (`user_quiz_id`) REFERENCES `user_quizzes` (`id`);

--
-- Constraints for table `user_quiz_inits`
--
ALTER TABLE `user_quiz_inits`
  ADD CONSTRAINT `user_quiz_inits_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_quiz_inits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_quiz_init_answers`
--
ALTER TABLE `user_quiz_init_answers`
  ADD CONSTRAINT `user_quiz_init_answers_answer_id_foreign` FOREIGN KEY (`answer_id`) REFERENCES `quiz_answers` (`id`),
  ADD CONSTRAINT `user_quiz_init_answers_quiz_init_question_id_foreign` FOREIGN KEY (`init_question_id`) REFERENCES `user_quiz_init_questions` (`id`);

--
-- Constraints for table `user_quiz_init_course_finals`
--
ALTER TABLE `user_quiz_init_course_finals`
  ADD CONSTRAINT `user_quiz_init_course_finals_course_final_quiz_id_foreign` FOREIGN KEY (`course_final_quiz_id`) REFERENCES `course_final_quizzes` (`id`),
  ADD CONSTRAINT `user_quiz_init_course_finals_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `user_quiz_init_course_finals_quiz_init_id_foreign` FOREIGN KEY (`quiz_init_id`) REFERENCES `user_quiz_inits` (`id`),
  ADD CONSTRAINT `user_quiz_init_course_finals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_quiz_init_course_lectures`
--
ALTER TABLE `user_quiz_init_course_lectures`
  ADD CONSTRAINT `user_quiz_init_course_lectures_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `user_quiz_init_course_lectures_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `course_lectures` (`id`),
  ADD CONSTRAINT `user_quiz_init_course_lectures_quiz_init_id_foreign` FOREIGN KEY (`quiz_init_id`) REFERENCES `user_quiz_inits` (`id`),
  ADD CONSTRAINT `user_quiz_init_course_lectures_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_quiz_init_groups`
--
ALTER TABLE `user_quiz_init_groups`
  ADD CONSTRAINT `user_quiz_init_groups_quiz_init_id_foreign` FOREIGN KEY (`quiz_init_id`) REFERENCES `user_quiz_inits` (`id`);

--
-- Constraints for table `user_quiz_init_questions`
--
ALTER TABLE `user_quiz_init_questions`
  ADD CONSTRAINT `user_quiz_init_questions_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`id`),
  ADD CONSTRAINT `user_quiz_init_questions_quiz_init_id_foreign` FOREIGN KEY (`quiz_init_id`) REFERENCES `user_quiz_inits` (`id`);

--
-- Constraints for table `user_quiz_init_results`
--
ALTER TABLE `user_quiz_init_results`
  ADD CONSTRAINT `user_quiz_init_results_certificate_id_foreign` FOREIGN KEY (`certificate_id`) REFERENCES `quiz_certificates` (`id`),
  ADD CONSTRAINT `user_quiz_init_results_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_quiz_init_results_quiz_init_id_foreign` FOREIGN KEY (`quiz_init_id`) REFERENCES `user_quiz_inits` (`id`);

--
-- Constraints for table `user_quiz_init_selections`
--
ALTER TABLE `user_quiz_init_selections`
  ADD CONSTRAINT `user_quiz_init_selections_init_answer_id_foreign` FOREIGN KEY (`init_answer_id`) REFERENCES `user_quiz_init_answers` (`id`),
  ADD CONSTRAINT `user_quiz_init_selections_quiz_init_id_foreign` FOREIGN KEY (`quiz_init_id`) REFERENCES `user_quiz_inits` (`id`);

--
-- Constraints for table `user_quiz_init_seminars`
--
ALTER TABLE `user_quiz_init_seminars`
  ADD CONSTRAINT `user_quiz_init_seminars_quiz_init_id_foreign` FOREIGN KEY (`quiz_init_id`) REFERENCES `user_quiz_inits` (`id`),
  ADD CONSTRAINT `user_quiz_init_seminars_seminar_id_foreign` FOREIGN KEY (`seminar_id`) REFERENCES `seminars` (`id`),
  ADD CONSTRAINT `user_quiz_init_seminars_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_seminars`
--
ALTER TABLE `user_seminars`
  ADD CONSTRAINT `user_seminars_seminar_id_foreign` FOREIGN KEY (`seminar_id`) REFERENCES `seminars` (`id`),
  ADD CONSTRAINT `user_seminars_transaction_seminar_id_foreign` FOREIGN KEY (`transaction_seminar_id`) REFERENCES `transaction_seminars` (`id`),
  ADD CONSTRAINT `user_seminars_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_seminar_shedules`
--
ALTER TABLE `user_seminar_shedules`
  ADD CONSTRAINT `user_seminar_shedules_user_seminar_id_foreign` FOREIGN KEY (`user_seminar_id`) REFERENCES `user_seminars` (`id`);

--
-- Constraints for table `user_shops`
--
ALTER TABLE `user_shops`
  ADD CONSTRAINT `user_shops_image_upload_id_foreign` FOREIGN KEY (`image_upload_id`) REFERENCES `uploads` (`id`),
  ADD CONSTRAINT `user_shops_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `websites`
--
ALTER TABLE `websites`
  ADD CONSTRAINT `websites_footer_id_foreign` FOREIGN KEY (`footer_id`) REFERENCES `website_template_footers` (`id`),
  ADD CONSTRAINT `websites_header_id_foreign` FOREIGN KEY (`header_id`) REFERENCES `website_template_headers` (`id`),
  ADD CONSTRAINT `websites_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `website_templates` (`id`),
  ADD CONSTRAINT `websites_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `website_template_themes` (`id`),
  ADD CONSTRAINT `websites_top_image_upload_id_foreign` FOREIGN KEY (`top_image_upload_id`) REFERENCES `uploads` (`id`);

--
-- Constraints for table `website_banners`
--
ALTER TABLE `website_banners`
  ADD CONSTRAINT `website_banners_upload_id_foreign` FOREIGN KEY (`upload_id`) REFERENCES `uploads` (`id`),
  ADD CONSTRAINT `website_banners_website_id_foreign` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`);

--
-- Constraints for table `website_footer_links`
--
ALTER TABLE `website_footer_links`
  ADD CONSTRAINT `website_footer_links_website_id_foreign` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`);

--
-- Constraints for table `website_links`
--
ALTER TABLE `website_links`
  ADD CONSTRAINT `website_links_website_id_foreign` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`);

--
-- Constraints for table `website_pages`
--
ALTER TABLE `website_pages`
  ADD CONSTRAINT `website_pages_website_id_foreign` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`);

--
-- Constraints for table `website_script_footers`
--
ALTER TABLE `website_script_footers`
  ADD CONSTRAINT `website_script_footers_website_id_foreign` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`);

--
-- Constraints for table `website_script_headers`
--
ALTER TABLE `website_script_headers`
  ADD CONSTRAINT `website_script_headers_website_id_foreign` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`);

--
-- Constraints for table `website_sliders`
--
ALTER TABLE `website_sliders`
  ADD CONSTRAINT `website_sliders_upload_id_foreign` FOREIGN KEY (`upload_id`) REFERENCES `uploads` (`id`),
  ADD CONSTRAINT `website_sliders_website_id_foreign` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`);

--
-- Constraints for table `website_socials`
--
ALTER TABLE `website_socials`
  ADD CONSTRAINT `website_socials_upload_id_foreign` FOREIGN KEY (`upload_id`) REFERENCES `uploads` (`id`),
  ADD CONSTRAINT `website_socials_website_id_foreign` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`);

--
-- Constraints for table `wishlist_channels`
--
ALTER TABLE `wishlist_channels`
  ADD CONSTRAINT `wishlist_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  ADD CONSTRAINT `wishlist_channels_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `wishlist_channels_wishlist_id_foreign` FOREIGN KEY (`wishlist_id`) REFERENCES `wish_lists` (`id`);

--
-- Constraints for table `wishlist_quizzes`
--
ALTER TABLE `wishlist_quizzes`
  ADD CONSTRAINT `wishlist_quizzes_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `wishlist_quizzes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `wishlist_quizzes_wishlist_id_foreign` FOREIGN KEY (`wishlist_id`) REFERENCES `wish_lists` (`id`);

--
-- Constraints for table `wish_lists`
--
ALTER TABLE `wish_lists`
  ADD CONSTRAINT `wish_lists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `wish_list_consultants`
--
ALTER TABLE `wish_list_consultants`
  ADD CONSTRAINT `wish_list_consultants_consultant_id_foreign` FOREIGN KEY (`consultant_id`) REFERENCES `consultants` (`id`),
  ADD CONSTRAINT `wish_list_consultants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `wish_list_consultants_wishlist_id_foreign` FOREIGN KEY (`wishlist_id`) REFERENCES `wish_lists` (`id`);

--
-- Constraints for table `wish_list_courses`
--
ALTER TABLE `wish_list_courses`
  ADD CONSTRAINT `wish_list_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `wish_list_courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `wish_list_courses_wishlist_id_foreign` FOREIGN KEY (`wishlist_id`) REFERENCES `wish_lists` (`id`);

--
-- Constraints for table `wish_list_products`
--
ALTER TABLE `wish_list_products`
  ADD CONSTRAINT `wish_list_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `user_products` (`id`),
  ADD CONSTRAINT `wish_list_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `wish_list_products_wishlist_id_foreign` FOREIGN KEY (`wishlist_id`) REFERENCES `wish_lists` (`id`);

--
-- Constraints for table `wish_list_seminars`
--
ALTER TABLE `wish_list_seminars`
  ADD CONSTRAINT `wish_list_seminars_seminar_id_foreign` FOREIGN KEY (`seminar_id`) REFERENCES `seminars` (`id`),
  ADD CONSTRAINT `wish_list_seminars_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `wish_list_seminars_wishlist_id_foreign` FOREIGN KEY (`wishlist_id`) REFERENCES `wish_lists` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
