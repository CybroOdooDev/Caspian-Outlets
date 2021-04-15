-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 15, 2021 at 06:04 AM
-- Server version: 5.7.33
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prof7590_coutlet`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Administrator',
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_name` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `role`, `photo`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `shop_name`) VALUES
(1, 'Admin', 'admin@coutlet.com', '01629552892', 'Administrator', '1556780563user.png', '$2y$10$M6UcSXXiVlVSHURvMi5yyu7N9aLtzNSNOoJqaYiNSQLbcJ.awFzGu', 1, 'wIzNv74xPPCzWNVzBl2TaKnRBMsDLQyb5naf01AMpI0PmePJcBtSsnoYvHpg', '2018-02-28 23:27:08', '2019-07-26 21:21:32', 'Genius Store'),
(4, 'Staff', 'staff@coutlet.com', '34534534534', 'Staff', '1558707029staff.jpg', '$2y$10$I/2L8FXvxOQV7irwh2PH2upufB0DBMponc99HDo8U4cWx2B/6ASwa', 1, 'EteXf3soRBh36HEtMwgDVSqPeMt40MM8ubnlOAMsDXlobvZX540qncstFLlC', '2019-05-24 08:10:30', '2019-05-24 08:10:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_languages`
--

CREATE TABLE `admin_languages` (
  `id` int(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rtl` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_languages`
--

INSERT INTO `admin_languages` (`id`, `is_default`, `language`, `file`, `name`, `rtl`) VALUES
(1, 1, 'English', '1567232745AoOcvCtY.json', '1567232745AoOcvCtY', 0),
(2, 0, 'Arabic', '1568626756LZOYXhqM.json', '1568626756LZOYXhqM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_conversations`
--

CREATE TABLE `admin_user_conversations` (
  `id` int(11) NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` enum('Ticket','Dispute') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_messages`
--

CREATE TABLE `admin_user_messages` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Large','TopSmall','BottomSmall') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `link`, `type`) VALUES
(1, '1568457175top2.jpg', 'https://www.google.com/', 'TopSmall'),
(2, '1568457164top1.jpg', NULL, 'TopSmall'),
(3, '1568457272bottom1.jpg', 'https://www.google.com/', 'Large'),
(4, '1564398600side-triple3.jpg', 'https://www.google.com/', 'BottomSmall'),
(5, '1564398579side-triple2.jpg', 'https://www.google.com/', 'BottomSmall'),
(6, '1564398571side-triple1.jpg', 'https://www.google.com/', 'BottomSmall');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `meta_tag` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `tags` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`) VALUES
(3, 'Manufacturing', 'manufacturing'),
(5, 'Agriculture', 'agriculture'),
(8, 'Technology', 'technology');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `status`, `photo`) VALUES
(4, 'Electronics', 'electronics', 1, '1557807287light.png'),
(11, 'Books & Stationary', 'books-and-stationary', 1, '1557377917bags.png'),
(14, 'Building Materials', 'building-material', 1, '1611656899Untitled.jpg'),
(15, 'Hardware', 'hardware', 1, '1611657005download (4).jpg'),
(17, 'Electricals', 'electricals', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `childcategories`
--

CREATE TABLE `childcategories` (
  `id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `childcategories`
--

INSERT INTO `childcategories` (`id`, `subcategory_id`, `name`, `slug`, `status`) VALUES
(17, 18, 'Ghacem', 'ghacem', 1),
(18, 18, 'Diamond', 'diamond', 1),
(19, 18, 'Dangote', 'dangote', 1),
(20, 18, 'Sol', 'sol', 1),
(21, 18, 'CIMAF', 'cimaf', 1),
(22, 27, 'LED TV', 'led-tv', 1),
(23, 45, 'Split AC', 'split-ac', 1),
(24, 19, 'Iron Rod', 'iron-rod', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `product_id`, `text`, `created_at`, `updated_at`) VALUES
(1, 22, 92, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(2, 22, 93, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(4, 22, 95, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(5, 22, 96, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(6, 22, 97, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(7, 22, 98, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(8, 22, 99, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(9, 22, 100, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(10, 22, 101, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(11, 22, 102, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(12, 22, 103, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(13, 22, 104, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(14, 22, 105, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(15, 22, 106, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(16, 22, 107, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(17, 22, 108, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(18, 22, 109, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(20, 22, 111, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(21, 22, 112, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(22, 22, 113, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(23, 22, 114, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(24, 22, 115, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(25, 22, 116, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(26, 22, 117, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(27, 22, 118, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(28, 22, 119, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(29, 22, 120, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(30, 22, 121, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(31, 22, 122, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(32, 22, 123, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(33, 22, 124, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(34, 22, 125, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(35, 22, 126, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(36, 22, 127, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(37, 22, 128, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(38, 22, 129, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(39, 22, 130, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59'),
(40, 22, 131, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-09-03 04:00:00', '2019-09-09 08:41:59');

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `id` int(11) NOT NULL,
  `type` enum('referral','browser') NOT NULL DEFAULT 'referral',
  `referral` varchar(255) DEFAULT NULL,
  `total_count` int(11) NOT NULL DEFAULT '0',
  `todays_count` int(11) NOT NULL DEFAULT '0',
  `today` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`id`, `type`, `referral`, `total_count`, `todays_count`, `today`) VALUES
(34, 'browser', 'Windows 10', 240, 0, NULL),
(35, 'browser', 'iPhone', 64, 0, NULL),
(36, 'browser', 'Linux', 65, 0, NULL),
(37, 'browser', 'Unknown OS Platform', 42, 0, NULL),
(38, 'browser', 'Windows 8.1', 9, 0, NULL),
(39, 'browser', 'Android', 36, 0, NULL),
(40, 'browser', 'Windows 7', 3, 0, NULL),
(41, 'browser', 'Ubuntu', 8, 0, NULL),
(42, 'referral', 'www.google.com', 2, 0, NULL),
(43, 'referral', 'www.google.com.hk', 1, 0, NULL),
(44, 'browser', 'Mac OS X', 10, 0, NULL),
(45, 'referral', 'dashboard.tawk.to', 1, 0, NULL),
(46, 'referral', '162.144.61.34', 2, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'DS', 'American Samoa'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua and Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia and Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei Darussalam'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CD', 'Democratic Republic of the Congo'),
(50, 'CG', 'Republic of Congo'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'HR', 'Croatia (Hrvatska)'),
(54, 'CU', 'Cuba'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecuador'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France, Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GK', 'Guernsey'),
(85, 'GR', 'Greece'),
(86, 'GL', 'Greenland'),
(87, 'GD', 'Grenada'),
(88, 'GP', 'Guadeloupe'),
(89, 'GU', 'Guam'),
(90, 'GT', 'Guatemala'),
(91, 'GN', 'Guinea'),
(92, 'GW', 'Guinea-Bissau'),
(93, 'GY', 'Guyana'),
(94, 'HT', 'Haiti'),
(95, 'HM', 'Heard and Mc Donald Islands'),
(96, 'HN', 'Honduras'),
(97, 'HK', 'Hong Kong'),
(98, 'HU', 'Hungary'),
(99, 'IS', 'Iceland'),
(100, 'IN', 'India'),
(101, 'IM', 'Isle of Man'),
(102, 'ID', 'Indonesia'),
(103, 'IR', 'Iran (Islamic Republic of)'),
(104, 'IQ', 'Iraq'),
(105, 'IE', 'Ireland'),
(106, 'IL', 'Israel'),
(107, 'IT', 'Italy'),
(108, 'CI', 'Ivory Coast'),
(109, 'JE', 'Jersey'),
(110, 'JM', 'Jamaica'),
(111, 'JP', 'Japan'),
(112, 'JO', 'Jordan'),
(113, 'KZ', 'Kazakhstan'),
(114, 'KE', 'Kenya'),
(115, 'KI', 'Kiribati'),
(116, 'KP', 'Korea, Democratic People\'s Republic of'),
(117, 'KR', 'Korea, Republic of'),
(118, 'XK', 'Kosovo'),
(119, 'KW', 'Kuwait'),
(120, 'KG', 'Kyrgyzstan'),
(121, 'LA', 'Lao People\'s Democratic Republic'),
(122, 'LV', 'Latvia'),
(123, 'LB', 'Lebanon'),
(124, 'LS', 'Lesotho'),
(125, 'LR', 'Liberia'),
(126, 'LY', 'Libyan Arab Jamahiriya'),
(127, 'LI', 'Liechtenstein'),
(128, 'LT', 'Lithuania'),
(129, 'LU', 'Luxembourg'),
(130, 'MO', 'Macau'),
(131, 'MK', 'North Macedonia'),
(132, 'MG', 'Madagascar'),
(133, 'MW', 'Malawi'),
(134, 'MY', 'Malaysia'),
(135, 'MV', 'Maldives'),
(136, 'ML', 'Mali'),
(137, 'MT', 'Malta'),
(138, 'MH', 'Marshall Islands'),
(139, 'MQ', 'Martinique'),
(140, 'MR', 'Mauritania'),
(141, 'MU', 'Mauritius'),
(142, 'TY', 'Mayotte'),
(143, 'MX', 'Mexico'),
(144, 'FM', 'Micronesia, Federated States of'),
(145, 'MD', 'Moldova, Republic of'),
(146, 'MC', 'Monaco'),
(147, 'MN', 'Mongolia'),
(148, 'ME', 'Montenegro'),
(149, 'MS', 'Montserrat'),
(150, 'MA', 'Morocco'),
(151, 'MZ', 'Mozambique'),
(152, 'MM', 'Myanmar'),
(153, 'NA', 'Namibia'),
(154, 'NR', 'Nauru'),
(155, 'NP', 'Nepal'),
(156, 'NL', 'Netherlands'),
(157, 'AN', 'Netherlands Antilles'),
(158, 'NC', 'New Caledonia'),
(159, 'NZ', 'New Zealand'),
(160, 'NI', 'Nicaragua'),
(161, 'NE', 'Niger'),
(162, 'NG', 'Nigeria'),
(163, 'NU', 'Niue'),
(164, 'NF', 'Norfolk Island'),
(165, 'MP', 'Northern Mariana Islands'),
(166, 'NO', 'Norway'),
(167, 'OM', 'Oman'),
(168, 'PK', 'Pakistan'),
(169, 'PW', 'Palau'),
(170, 'PS', 'Palestine'),
(171, 'PA', 'Panama'),
(172, 'PG', 'Papua New Guinea'),
(173, 'PY', 'Paraguay'),
(174, 'PE', 'Peru'),
(175, 'PH', 'Philippines'),
(176, 'PN', 'Pitcairn'),
(177, 'PL', 'Poland'),
(178, 'PT', 'Portugal'),
(179, 'PR', 'Puerto Rico'),
(180, 'QA', 'Qatar'),
(181, 'RE', 'Reunion'),
(182, 'RO', 'Romania'),
(183, 'RU', 'Russian Federation'),
(184, 'RW', 'Rwanda'),
(185, 'KN', 'Saint Kitts and Nevis'),
(186, 'LC', 'Saint Lucia'),
(187, 'VC', 'Saint Vincent and the Grenadines'),
(188, 'WS', 'Samoa'),
(189, 'SM', 'San Marino'),
(190, 'ST', 'Sao Tome and Principe'),
(191, 'SA', 'Saudi Arabia'),
(192, 'SN', 'Senegal'),
(193, 'RS', 'Serbia'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapore'),
(197, 'SK', 'Slovakia'),
(198, 'SI', 'Slovenia'),
(199, 'SB', 'Solomon Islands'),
(200, 'SO', 'Somalia'),
(201, 'ZA', 'South Africa'),
(202, 'GS', 'South Georgia South Sandwich Islands'),
(203, 'SS', 'South Sudan'),
(204, 'ES', 'Spain'),
(205, 'LK', 'Sri Lanka'),
(206, 'SH', 'St. Helena'),
(207, 'PM', 'St. Pierre and Miquelon'),
(208, 'SD', 'Sudan'),
(209, 'SR', 'Suriname'),
(210, 'SJ', 'Svalbard and Jan Mayen Islands'),
(211, 'SZ', 'Swaziland'),
(212, 'SE', 'Sweden'),
(213, 'CH', 'Switzerland'),
(214, 'SY', 'Syrian Arab Republic'),
(215, 'TW', 'Taiwan'),
(216, 'TJ', 'Tajikistan'),
(217, 'TZ', 'Tanzania, United Republic of'),
(218, 'TH', 'Thailand'),
(219, 'TG', 'Togo'),
(220, 'TK', 'Tokelau'),
(221, 'TO', 'Tonga'),
(222, 'TT', 'Trinidad and Tobago'),
(223, 'TN', 'Tunisia'),
(224, 'TR', 'Turkey'),
(225, 'TM', 'Turkmenistan'),
(226, 'TC', 'Turks and Caicos Islands'),
(227, 'TV', 'Tuvalu'),
(228, 'UG', 'Uganda'),
(229, 'UA', 'Ukraine'),
(230, 'AE', 'United Arab Emirates'),
(231, 'GB', 'United Kingdom'),
(232, 'US', 'United States'),
(233, 'UM', 'United States minor outlying islands'),
(234, 'UY', 'Uruguay'),
(235, 'UZ', 'Uzbekistan'),
(236, 'VU', 'Vanuatu'),
(237, 'VA', 'Vatican City State'),
(238, 'VE', 'Venezuela'),
(239, 'VN', 'Vietnam'),
(240, 'VG', 'Virgin Islands (British)'),
(241, 'VI', 'Virgin Islands (U.S.)'),
(242, 'WF', 'Wallis and Futuna Islands'),
(243, 'EH', 'Western Sahara'),
(244, 'YE', 'Yemen'),
(245, 'ZM', 'Zambia'),
(246, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `price` double NOT NULL,
  `times` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `sign`, `value`, `is_default`) VALUES
(1, 'Ghanaian cedi', 'gh₵', 1, 1),
(8, 'INR', '₹', 12.521, 0);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `email_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_subject` mediumtext COLLATE utf8_unicode_ci,
  `email_body` longtext COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `email_type`, `email_subject`, `email_body`, `status`) VALUES
(1, 'new_order', 'Your Order Placed Successfully', '<p>Hello {customer_name},<br>Your Order Number is {order_number}<br>Your order has been placed successfully</p>', 1),
(2, 'new_registration', 'Welcome To CaspianOutlet', '<p>Hello {customer_name},<br>You have successfully registered to {website_title}, We wish you will have a wonderful experience using our service.</p><p>Thank You<br></p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `title`, `details`, `status`) VALUES
(1, 'Right my front it wound cause fully', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 1),
(3, 'Man particular insensible celebrated', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 1),
(4, 'Civilly why how end viewing related', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 0),
(5, 'Six started far placing saw respect', '<span style=\"color: rgb(70, 85, 65); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 0),
(6, 'She jointure goodness interest debat', '<div style=\"text-align: center;\"><div style=\"text-align: center;\"><img src=\"https://i.imgur.com/MGucWKc.jpg\" width=\"350\"></div></div><div style=\"text-align: center;\"><br></div><div style=\"text-align: center;\"><span style=\"color: rgb(70, 85, 65); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.<br></span></div>', 0);

-- --------------------------------------------------------

--
-- Table structure for table `featured_banners`
--

CREATE TABLE `featured_banners` (
  `id` int(11) NOT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `featured_banners`
--

INSERT INTO `featured_banners` (`id`, `link`, `photo`) VALUES
(2, 'https://www.google.com/', '1569129907bbb.jpg'),
(3, 'https://www.google.com/', '1569129916bbb.jpg'),
(4, 'https://www.google.com/', '1569129923bbb.jpg'),
(5, 'https://www.google.com/', '1569129957bbb.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `featured_links`
--

CREATE TABLE `featured_links` (
  `id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `featured_links`
--

INSERT INTO `featured_links` (`id`, `name`, `link`, `photo`) VALUES
(1, 'ALUMINIUM', '#', '1569127405link.png'),
(2, 'HARDWARE', '#', '1569128910link.png'),
(3, 'GLASS WARE', '#', '1569128940link.png'),
(4, 'ELECTRONICS', '#', '1569128952link.png'),
(5, 'GADGETS', '#', '1569128967link.png'),
(6, 'APPLIANCES', '#', '1569128980link.png'),
(7, 'TOOLS', '#', '1569128990link.png'),
(8, 'MATERIALS', '#', '1569129002link.png'),
(12, 'HEALTH & BEAUTY', '#', '1569129002link.png'),
(13, 'FASHION & BEAUTY', '#', '1569129002link.png');

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `product_id`, `photo`) VALUES
(6, 93, '156801646314-min.jpg'),
(7, 93, '156801646315-min.jpg'),
(8, 93, '156801646316-min.jpg'),
(22, 129, '15680254328Ei8T0MB.jpg'),
(23, 129, '1568025432wRmpve8d.jpg'),
(24, 129, '1568025432kkRYzLsF.jpg'),
(25, 129, '1568025432zxQBe6Gk.jpg'),
(26, 128, '1568025537sJbDPnFk.jpg'),
(27, 128, '1568025537NBmHxJOz.jpg'),
(28, 128, '1568025537hxqeFbS8.jpg'),
(29, 128, '1568025538zK3tJpmL.jpg'),
(30, 127, '1568025624CohLm1Kc.jpg'),
(31, 127, '1568025624SwbXmlIZ.jpg'),
(32, 127, '1568025624y3Jgpmt3.jpg'),
(33, 127, '1568025624tQ0DW7g2.jpg'),
(34, 126, '1568025693kKLReNYO.jpg'),
(35, 126, '1568025694Iv3pkz1q.jpg'),
(36, 126, '1568025694T8HhdLVS.jpg'),
(37, 126, '1568025695vTdg7ndt.jpg'),
(38, 125, '15680257894Waz2tuN.jpg'),
(39, 125, '1568025789vd0P4TBv.jpg'),
(40, 125, '15680257899bih5sGh.jpg'),
(41, 125, '156802578924sLIgzl.jpg'),
(42, 124, '1568025825cC2Pmuit.jpg'),
(43, 124, '1568025825EACzLFld.jpg'),
(44, 124, '1568025825MfCyCqtD.jpg'),
(45, 124, '15680258252yabMeAz.jpg'),
(46, 123, '15680258512fKQla5g.jpg'),
(47, 123, '1568025851pIjl0mWp.jpg'),
(48, 123, '1568025851tQw7JXXG.jpg'),
(49, 123, '1568025851ewjtSDkZ.jpg'),
(50, 96, '1568025891wWAAbOjc.jpg'),
(51, 96, '1568025891fyMNeXRy.jpg'),
(52, 96, '1568025891OdV64Tw1.jpg'),
(53, 96, '1568025891xQF7Zufe.jpg'),
(58, 102, '1568026307THs0VQQU.jpg'),
(59, 102, '1568026307jvCscHth.jpg'),
(60, 102, '1568026307g5xMFdx3.jpg'),
(61, 102, '1568026307Z3at0HEM.jpg'),
(62, 101, '1568026331Y6UMgMcI.jpg'),
(63, 101, '1568026331xZbT4OWG.jpg'),
(64, 101, '1568026331y7eIFJXZ.jpg'),
(65, 101, '1568026331i2wH8RI0.jpg'),
(66, 100, '1568026374xCTjQYZ8.jpg'),
(67, 100, '1568026374DzmvqA9d.jpg'),
(68, 100, '1568026374OEH73u5X.jpg'),
(69, 100, '1568026374vZhqRv8c.jpg'),
(70, 99, '15680264120LdBSU1v.jpg'),
(71, 99, '1568026412eMjsI940.jpg'),
(72, 99, '1568026412GFjvHiZv.jpg'),
(73, 99, '15680264122fwGi20d.jpg'),
(74, 98, '1568026438HjWCiQDP.jpg'),
(75, 98, '1568026438xCBvADqD.jpg'),
(76, 98, '1568026438sFOoAc0z.jpg'),
(77, 98, '1568026439RcE6KoyI.jpg'),
(78, 97, '1568026469hSlmBpzE.jpg'),
(79, 97, '15680264697AI8LicQ.jpg'),
(80, 97, '15680264691xyFt5Y6.jpg'),
(81, 97, '1568026469dC3hrMz0.jpg'),
(82, 92, '1568026516QR4aUGfF.jpg'),
(83, 92, '1568026517QAUXFUrJ.jpg'),
(84, 92, '15680265170gg0pKsv.jpg'),
(85, 92, '1568026517LXlW3IPi.jpg'),
(86, 109, '1568026737EBGSE78G.jpg'),
(87, 109, '1568026737B8hO1RRr.jpg'),
(88, 109, '1568026737tf0rwVoz.jpg'),
(89, 109, '1568026737GGIPSqYo.jpg'),
(90, 108, '1568026759zCuGFHrV.jpg'),
(91, 108, '1568026759Fh8ql3QT.jpg'),
(92, 108, '1568026759F5895kT1.jpg'),
(93, 108, '1568026759LkQFba7p.jpg'),
(94, 108, '1568026759uV3vaZ06.jpg'),
(95, 107, '1568026797FFNrNPxK.jpg'),
(96, 107, '1568026797UwY9ZLfQ.jpg'),
(97, 107, '1568026797Kl6eZLx5.jpg'),
(98, 107, '1568026797h3R48VaO.jpg'),
(99, 107, '15680267989kXwH40I.jpg'),
(100, 106, '1568026836ErM5FJxg.jpg'),
(101, 106, '1568026836VLrxIk0u.jpg'),
(102, 106, '1568026836lgLuMV6p.jpg'),
(103, 106, '1568026836JBUTQX8v.jpg'),
(104, 105, '1568026861YorsLvUa.jpg'),
(105, 105, '1568026861PikoX1Qb.jpg'),
(106, 105, '1568026861SBJqjw66.jpg'),
(107, 105, '1568026861WYh54Arp.jpg'),
(108, 104, '1568026885rmo0LDoo.jpg'),
(109, 104, '15680268851m939o7O.jpg'),
(110, 104, '1568026885fVXYCGKu.jpg'),
(111, 104, '1568026885GDRL3thY.jpg'),
(112, 103, '1568026903LbVQUxIr.jpg'),
(113, 103, '1568026914IpRVYDV4.jpg'),
(114, 103, '15680269141gKO8x5X.jpg'),
(115, 103, '1568026914Q938xXM2.jpg'),
(116, 93, '1568026950y7ihS4wE.jpg'),
(125, 122, '1568027503rFK94cnU.jpg'),
(126, 122, '1568027503i1X2FtIi.jpg'),
(127, 122, '156802750316jxawoZ.jpg'),
(128, 122, '1568027503QRBf290F.jpg'),
(129, 121, '1568027539SQqUc8Bu.jpg'),
(130, 121, '1568027539Zs5OTzjq.jpg'),
(131, 121, '1568027539C45VRZq1.jpg'),
(132, 121, '15680275398ovCzFnJ.jpg'),
(133, 120, '1568027565bJgX744G.jpg'),
(134, 120, '1568027565j0RPFUgX.jpg'),
(135, 120, '1568027565QGi6Lhyo.jpg'),
(136, 120, '15680275658MAY3VKp.jpg'),
(137, 119, '1568027610p9R6ivC6.jpg'),
(138, 119, '1568027610t2Aq7E5D.jpg'),
(139, 119, '1568027611ikz4n0fx.jpg'),
(140, 119, '15680276117BLgrCub.jpg'),
(141, 118, '156802763634t0c8tG.jpg'),
(142, 118, '1568027636fuJplSf3.jpg'),
(143, 118, '1568027636MXcgCQHU.jpg'),
(144, 118, '1568027636lfexGTpt.jpg'),
(145, 117, '1568027665rFHWlsAJ.jpg'),
(146, 117, '15680276655LPktA9k.jpg'),
(147, 117, '1568027665vcNWWq3u.jpg'),
(148, 117, '1568027665gQnqKhCw.jpg'),
(149, 116, '1568027692FPQpwtWN.jpg'),
(150, 116, '1568027692zBaGjOIC.jpg'),
(151, 116, '1568027692UXpDx63F.jpg'),
(152, 116, '1568027692KdIWbIGK.jpg'),
(153, 95, '1568027743xS8gHocM.jpg'),
(154, 95, '1568027743aVUOljdD.jpg'),
(155, 95, '156802774327OOA1Zj.jpg'),
(156, 95, '1568027743kGBx6mxa.jpg'),
(172, 130, '1568029084hQT5ZO0j.jpg'),
(173, 130, '1568029084ncGXxQzN.jpg'),
(174, 130, '1568029084b0OonKFy.jpg'),
(175, 130, '15680290857TD4iOWP.jpg'),
(176, 115, '1568029137ZFnzwVuu.jpg'),
(177, 115, '15680291378hCAku58.jpg'),
(178, 115, '1568029137vbdOm0Ke.jpg'),
(179, 115, '1568029137qn6Xme8W.jpg'),
(180, 114, '1568029158brS7xQCe.jpg'),
(181, 114, '1568029158QlC0tg5a.jpg'),
(182, 114, '1568029158RrN4AEtQ.jpg'),
(183, 113, '1568029192bYeyGvr9.jpg'),
(184, 113, '15680291923Q3cL2yo.jpg'),
(185, 113, '1568029193ENM7ZsJE.jpg'),
(186, 113, '15680291933gECjWfW.jpg'),
(187, 112, '1568029210JSAwjRPr.jpg'),
(188, 112, '1568029210EiVUkcK6.jpg'),
(189, 112, '1568029210fJSo5hya.jpg'),
(190, 112, '15680292101vCcGfq8.jpg'),
(191, 111, '1568029272lB0JETcn.jpg'),
(192, 111, '1568029272wF3ldKgv.jpg'),
(193, 111, '1568029272NI33ExCu.jpg'),
(194, 111, '15680292724TXrpokz.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `generalsettings`
--

CREATE TABLE `generalsettings` (
  `id` int(11) NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_email` text COLLATE utf8mb4_unicode_ci,
  `header_phone` text COLLATE utf8mb4_unicode_ci,
  `footer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `copyright` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `colors` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loader` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_loader` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_talkto` tinyint(1) NOT NULL DEFAULT '1',
  `talkto` text COLLATE utf8mb4_unicode_ci,
  `is_language` tinyint(1) NOT NULL DEFAULT '1',
  `is_loader` tinyint(1) NOT NULL DEFAULT '1',
  `map_key` text COLLATE utf8mb4_unicode_ci,
  `is_disqus` tinyint(1) NOT NULL DEFAULT '0',
  `disqus` longtext COLLATE utf8mb4_unicode_ci,
  `is_contact` tinyint(1) NOT NULL DEFAULT '0',
  `is_faq` tinyint(1) NOT NULL DEFAULT '0',
  `guest_checkout` tinyint(1) NOT NULL DEFAULT '0',
  `stripe_check` tinyint(1) NOT NULL DEFAULT '0',
  `cod_check` tinyint(1) NOT NULL DEFAULT '0',
  `stripe_key` text COLLATE utf8mb4_unicode_ci,
  `stripe_secret` text COLLATE utf8mb4_unicode_ci,
  `currency_format` tinyint(1) NOT NULL DEFAULT '0',
  `withdraw_fee` double NOT NULL DEFAULT '0',
  `withdraw_charge` double NOT NULL DEFAULT '0',
  `tax` double NOT NULL DEFAULT '0',
  `shipping_cost` double NOT NULL DEFAULT '0',
  `smtp_host` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_port` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_user` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_pass` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_smtp` tinyint(1) NOT NULL DEFAULT '0',
  `is_comment` tinyint(1) NOT NULL DEFAULT '1',
  `is_currency` tinyint(1) NOT NULL DEFAULT '1',
  `add_cart` text COLLATE utf8mb4_unicode_ci,
  `out_stock` text COLLATE utf8mb4_unicode_ci,
  `add_wish` text COLLATE utf8mb4_unicode_ci,
  `already_wish` text COLLATE utf8mb4_unicode_ci,
  `wish_remove` text COLLATE utf8mb4_unicode_ci,
  `add_compare` text COLLATE utf8mb4_unicode_ci,
  `already_compare` text COLLATE utf8mb4_unicode_ci,
  `compare_remove` text COLLATE utf8mb4_unicode_ci,
  `color_change` text COLLATE utf8mb4_unicode_ci,
  `coupon_found` text COLLATE utf8mb4_unicode_ci,
  `no_coupon` text COLLATE utf8mb4_unicode_ci,
  `already_coupon` text COLLATE utf8mb4_unicode_ci,
  `order_title` text COLLATE utf8mb4_unicode_ci,
  `order_text` text COLLATE utf8mb4_unicode_ci,
  `is_affilate` tinyint(1) NOT NULL DEFAULT '1',
  `affilate_charge` int(11) NOT NULL DEFAULT '0',
  `affilate_banner` text COLLATE utf8mb4_unicode_ci,
  `already_cart` text COLLATE utf8mb4_unicode_ci,
  `fixed_commission` double NOT NULL DEFAULT '0',
  `percentage_commission` double NOT NULL DEFAULT '0',
  `vendor_ship_info` tinyint(1) NOT NULL DEFAULT '0',
  `reg_vendor` tinyint(1) NOT NULL DEFAULT '0',
  `cod_text` text COLLATE utf8mb4_unicode_ci,
  `paypal_text` text COLLATE utf8mb4_unicode_ci,
  `stripe_text` text COLLATE utf8mb4_unicode_ci,
  `header_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin_loader` tinyint(1) NOT NULL DEFAULT '0',
  `menu_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_hover_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_home` tinyint(1) NOT NULL DEFAULT '0',
  `is_verification_email` tinyint(1) NOT NULL DEFAULT '0',
  `instamojo_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instamojo_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instamojo_text` text COLLATE utf8mb4_unicode_ci,
  `is_instamojo` tinyint(1) NOT NULL DEFAULT '0',
  `instamojo_sandbox` tinyint(1) NOT NULL DEFAULT '0',
  `is_paystack` tinyint(1) NOT NULL DEFAULT '0',
  `paystack_key` text COLLATE utf8mb4_unicode_ci,
  `paystack_email` text COLLATE utf8mb4_unicode_ci,
  `paystack_text` text COLLATE utf8mb4_unicode_ci,
  `wholesell` int(11) NOT NULL DEFAULT '0',
  `is_capcha` tinyint(1) NOT NULL DEFAULT '0',
  `error_banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_popup` tinyint(1) NOT NULL DEFAULT '0',
  `popup_title` text COLLATE utf8mb4_unicode_ci,
  `popup_text` text COLLATE utf8mb4_unicode_ci,
  `popup_background` text COLLATE utf8mb4_unicode_ci,
  `invoice_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_secure` tinyint(1) NOT NULL DEFAULT '0',
  `is_report` tinyint(1) NOT NULL,
  `paypal_check` tinyint(1) DEFAULT '0',
  `paypal_username` text COLLATE utf8mb4_unicode_ci,
  `paypal_mode` enum('sandbox','live') COLLATE utf8mb4_unicode_ci NOT NULL,
  `paypal_password` text COLLATE utf8mb4_unicode_ci,
  `paypal_secret` text COLLATE utf8mb4_unicode_ci,
  `footer_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `generalsettings`
--

INSERT INTO `generalsettings` (`id`, `logo`, `favicon`, `title`, `header_email`, `header_phone`, `footer`, `copyright`, `colors`, `loader`, `admin_loader`, `is_talkto`, `talkto`, `is_language`, `is_loader`, `map_key`, `is_disqus`, `disqus`, `is_contact`, `is_faq`, `guest_checkout`, `stripe_check`, `cod_check`, `stripe_key`, `stripe_secret`, `currency_format`, `withdraw_fee`, `withdraw_charge`, `tax`, `shipping_cost`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `from_email`, `from_name`, `is_smtp`, `is_comment`, `is_currency`, `add_cart`, `out_stock`, `add_wish`, `already_wish`, `wish_remove`, `add_compare`, `already_compare`, `compare_remove`, `color_change`, `coupon_found`, `no_coupon`, `already_coupon`, `order_title`, `order_text`, `is_affilate`, `affilate_charge`, `affilate_banner`, `already_cart`, `fixed_commission`, `percentage_commission`, `vendor_ship_info`, `reg_vendor`, `cod_text`, `paypal_text`, `stripe_text`, `header_color`, `footer_color`, `copyright_color`, `is_admin_loader`, `menu_color`, `menu_hover_color`, `is_home`, `is_verification_email`, `instamojo_key`, `instamojo_token`, `instamojo_text`, `is_instamojo`, `instamojo_sandbox`, `is_paystack`, `paystack_key`, `paystack_email`, `paystack_text`, `wholesell`, `is_capcha`, `error_banner`, `is_popup`, `popup_title`, `popup_text`, `popup_background`, `invoice_logo`, `user_image`, `is_secure`, `is_report`, `paypal_check`, `paypal_username`, `paypal_mode`, `paypal_password`, `paypal_secret`, `footer_logo`) VALUES
(1, '1617262718logo.png', '16184830121617262718logo.png', 'Caspian Outlet', 'Info@example.com', '0123 456789', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae', 'COPYRIGHT © 2021. All Rights Reserved By Caspian Outlets.', '#4f6f91', '1564224328loading3.gif', '1564224329loading3.gif', 1, '<!--Start of Tawk.to Script-->\r\n	<script type=\"text/javascript\">\r\n	var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n	(function(){\r\n	var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n	s1.async=true;\r\n	s1.src=\'https://embed.tawk.to/605a1e4a067c2605c0bb799d/1f1g0clnj\';\r\n	s1.charset=\'UTF-8\';\r\n	s1.setAttribute(\'crossorigin\',\'*\');\r\n	s0.parentNode.insertBefore(s1,s0);\r\n	})();\r\n	</script>\r\n	<!--End of Tawk.to Script-->', 1, 0, 'AIzaSyB1GpE4qeoJ__70UZxvX9CTMUTZRZNHcu8', 0, '<div id=\"disqus_thread\">         \r\n  </div>', 1, 1, 1, 0, 1, 'pk_test_UnxcxcU1Coi1p5qFGwtpjZMRMgJM', 'sk_test_QQccxcxcg3vGsKRPlW6T3dXcNJsor', 1, 5, 5, 10, 5, 'mail.coutlet.com', '465', 'no-reply@coutlet.com', 'pJqc94kxpnoO', 'no-reply@coutlet.com', 'Caspian Outlets', 1, 1, 1, 'Successfully Added To Cart', 'Out Of Stock', 'Add To Wishlist', 'Already Added To Wishlist', 'Successfully Removed From The Wishlist', 'Successfully Added To Compare', 'Already Added To Compare', 'Successfully Removed From The Compare', 'Successfully Changed The Color', 'Coupon Found', 'No Coupon Found', 'Coupon Already Applied', 'THANK YOU FOR YOUR PURCHASE.', 'We\'ll email you an order confirmation with details and tracking info.', 1, 8, '15587771131554048228onepiece.jpeg', 'Already Added To Cart', 0, 0, 0, 1, 'Pay with cash upon delivery.', 'Pay via your PayPal account.', 'Pay via your Credit Card.', '#143250', '#4f6f91', '#2b4764', 0, '#2b4764', '#02020c', 0, 1, 'test_17237cccc1aa837ae5cad6047dc3052', 'test_4ac5acccccc785e25fc596b67dbc5c267', 'Pay via your Instamojo account.', 0, 1, 0, 'pk_test_162nnnnnnnnnnnnna56d42131cbb01932ed0d2c48f9cb99d8e8e2', 'aa@aa.com', 'Pay via your Paystack account.', 6, 0, '1566878455404.png', 1, 'NEWSLETTER', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Expedita porro ipsa nulla, alias, ab minus.', '1567488562subscribe.jpg', '16116564322021-01-26 (2).png', '1567655174profile.jpg', 1, 1, 0, 'sb-9ugv4714xcxcxc9798_api1.business.example.com', 'sandbox', 'YPCYYBTVxcxcPP3R5JW3', 'ALsnxGmxcxcxcxcQ5aZHv492vEpsozWAcSL6AdJICktUCp9tzkc4e6F7MrH6.B8f', '1617262764nnn-removebg-preview.png');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `is_default`, `language`, `file`) VALUES
(1, 1, 'English', '1569138043BZYHP7xU.json'),
(6, 0, 'RTL - English', '1569138220kArI3iac.json');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_user` int(11) DEFAULT NULL,
  `recieved_user` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `order_id`, `user_id`, `vendor_id`, `product_id`, `conversation_id`, `is_read`, `created_at`, `updated_at`) VALUES
(76, 182, NULL, NULL, NULL, NULL, 0, '2021-04-11 00:06:27', '2021-04-11 00:06:27'),
(77, 183, NULL, NULL, NULL, NULL, 0, '2021-04-11 00:15:10', '2021-04-11 00:15:10'),
(78, 184, NULL, NULL, NULL, NULL, 0, '2021-04-15 15:37:16', '2021-04-15 15:37:16'),
(79, 185, NULL, NULL, NULL, NULL, 0, '2021-04-15 15:45:08', '2021-04-15 15:45:08'),
(80, 186, NULL, NULL, NULL, NULL, 0, '2021-04-15 15:54:02', '2021-04-15 15:54:02'),
(81, NULL, 77, NULL, NULL, NULL, 0, '2021-04-15 17:37:40', '2021-04-15 17:37:40'),
(82, NULL, 77, NULL, NULL, NULL, 0, '2021-04-15 17:38:50', '2021-04-15 17:38:50'),
(83, NULL, 78, NULL, NULL, NULL, 0, '2021-04-15 17:42:40', '2021-04-15 17:42:40'),
(84, 187, NULL, NULL, NULL, NULL, 0, '2021-04-15 17:43:11', '2021-04-15 17:43:11');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cart` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalQty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_amount` float NOT NULL,
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `customer_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `customer_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_zip` varchar(255) DEFAULT NULL,
  `delivery_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_discount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','processing','completed','declined','on delivery') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `affilate_user` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affilate_charge` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_value` double NOT NULL,
  `delivery_cost` double NOT NULL,
  `packing_cost` double NOT NULL DEFAULT '0',
  `tax` int(11) NOT NULL,
  `dp` tinyint(1) NOT NULL DEFAULT '0',
  `pay_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `vendor_delivery_id` int(11) NOT NULL DEFAULT '0',
  `vendor_packing_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `cart`, `method`, `delivery`, `pickup_location`, `totalQty`, `pay_amount`, `txnid`, `charge_id`, `order_number`, `payment_status`, `customer_email`, `customer_name`, `customer_country`, `customer_phone`, `customer_address`, `customer_city`, `customer_zip`, `delivery_name`, `delivery_country`, `delivery_email`, `delivery_phone`, `delivery_address`, `delivery_city`, `delivery_zip`, `order_note`, `coupon_code`, `coupon_discount`, `status`, `created_at`, `updated_at`, `affilate_user`, `affilate_charge`, `currency_sign`, `currency_value`, `delivery_cost`, `packing_cost`, `tax`, `dp`, `pay_id`, `vendor_delivery_id`, `vendor_packing_id`) VALUES
(182, 47, 'BZh91AY&SYj~ÞÃ\0¶_@\0Xsø?+ô¿ÿÿúP¼1f1ª\0¡cÓ\0\0Á0\0\0S	¨S$fÐÁÀ&lhj\"HÒb\0É¦FÈ¨@9M0	À\0L\0\0\"!4	 &§¨È\04i£\'¡16pñ~áîHHuøXð¼ù¹gA-þôÑFÁ,,ìRôbµZìã­¦ÆD¯-(Ãñ<Õf6*ÕÎ2U\n6»^­Ë4ê9qÖ¹Ì$âI¬ø*ÃÀó9	fÒhKµ§ågÊjØ!#%\0Þ¡4Xó&OA¡\\\Zc*ÖYÂD¤@8¤ÒÀ¢*[w£ª:ÅC#A@Pft»À3¶ÂÈUTcRæAf3Uk1	Hgy`TÒ$¦3¼ëÒ%Ê\rYµ&|ÕÊ å2äTÀ±!ã2:±¯JÔÏ!jrQ±OW	RE^;¸EêdWÀ,äP1&5LÙ·11Éù©ÒKÕH,¿Z+*YTJb(3uPdwØfÈJH\"À CÓ-zÒÒI/hÊ4ÊÉZ#nìJªÉ6_nWu7IE­ÆLÆ×Izç*«Â´5/*Æ]ÂÇt0ZhQÜÅÍ^2ãÐÕÎr\Z	ô ¹Ô­Êk\Zç-íÂ?Üiá/5Ö¨Õ\r ­£P¡ë5Ï¼fcc\'Lh7Î¿þÄæqA)ÍÈ6È\Z!¯ÐÉ3¾Í(#BÆFòú§b<ÌX46°½ÃeNE´Ò.OQ0Yj21·Í°çÂ8r¦*\nL©FÂ£m`*Ù`|CQ¼È¨Ó2#ó	b3¸vÐfÁãC-Ì&¼wßÈ;áÖeÀ»·i´&Å |:>+ÀúãbçÀc;ËÌìébxtÂä3	%Q¬±ÃÜZè¨Ïi\'\0[ÎgfþEwÑÀÏ¯Ó¬cG¨RE³°¨QGÞÄd±R@Ç@Fé\',#QD(bÑcy+ar¡T®Ñq8F³ä5Ü-:Ñ&hÀ $òOB|VV\ZeÏXÖ>Íñ·YÐªPk9À¬îl*AÜgQF.t[Gl¦êlø°2X^e(|tÔ2y)dq(¡Þ£lðëäñjàåðD\"ú A%0¡$¡\"	)f\r&Ü¹B+µ.bªúËXï À%\"=pd¼[¹ØjÆp0WHÈÕd§ª*Pº¸~!u ù*µè{ób¾ÑCõË¬ñ%*ª¨ºæDgÌ¯>¢pÅ>#0ù´ Ôb@Ö_A²ýÈ^ÕêòBl0l¿âîH§\n\rOÛØ`', 'Cash on Delivery', 'shipto', NULL, '1', 9779, NULL, NULL, 'aoOk1618085187', 'Pending', 'koteidjanerapheal@gmail.com', 'Rapheal Djane Kotei', 'Ghana', '0555442117', 'Stadium Junction, Abor', 'Accra', '0232', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Carry with care', NULL, NULL, 'pending', '2021-04-11 00:06:27', '2021-04-11 00:06:27', NULL, NULL, 'gh₵', 1, 0, 0, 10, 0, NULL, 0, 0),
(183, 47, 'BZh91AY&SYj~ÞÃ\0¶_@\0Xsø?+ô¿ÿÿúP¼1f1ª\0¡cÓ\0\0Á0\0\0S	¨S$fÐÁÀ&lhj\"HÒb\0É¦FÈ¨@9M0	À\0L\0\0\"!4	 &§¨È\04i£\'¡16pñ~áîHHuøXð¼ù¹gA-þôÑFÁ,,ìRôbµZìã­¦ÆD¯-(Ãñ<Õf6*ÕÎ2U\n6»^­Ë4ê9qÖ¹Ì$âI¬ø*ÃÀó9	fÒhKµ§ågÊjØ!#%\0Þ¡4Xó&OA¡\\\Zc*ÖYÂD¤@8¤ÒÀ¢*[w£ª:ÅC#A@Pft»À3¶ÂÈUTcRæAf3Uk1	Hgy`TÒ$¦3¼ëÒ%Ê\rYµ&|ÕÊ å2äTÀ±!ã2:±¯JÔÏ!jrQ±OW	RE^;¸EêdWÀ,äP1&5LÙ·11Éù©ÒKÕH,¿Z+*YTJb(3uPdwØfÈJH\"À CÓ-zÒÒI/hÊ4ÊÉZ#nìJªÉ6_nWu7IE­ÆLÆ×Izç*«Â´5/*Æ]ÂÇt0ZhQÜÅÍ^2ãÐÕÎr\Z	ô ¹Ô­Êk\Zç-íÂ?Üiá/5Ö¨Õ\r ­£P¡ë5Ï¼fcc\'Lh7Î¿þÄæqA)ÍÈ6È\Z!¯ÐÉ3¾Í(#BÆFòú§b<ÌX46°½ÃeNE´Ò.OQ0Yj21·Í°çÂ8r¦*\nL©FÂ£m`*Ù`|CQ¼È¨Ó2#ó	b3¸vÐfÁãC-Ì&¼wßÈ;áÖeÀ»·i´&Å |:>+ÀúãbçÀc;ËÌìébxtÂä3	%Q¬±ÃÜZè¨Ïi\'\0[ÎgfþEwÑÀÏ¯Ó¬cG¨RE³°¨QGÞÄd±R@Ç@Fé\',#QD(bÑcy+ar¡T®Ñq8F³ä5Ü-:Ñ&hÀ $òOB|VV\ZeÏXÖ>Íñ·YÐªPk9À¬îl*AÜgQF.t[Gl¦êlø°2X^e(|tÔ2y)dq(¡Þ£lðëäñjàåðD\"ú A%0¡$¡\"	)f\r&Ü¹B+µ.bªúËXï À%\"=pd¼[¹ØjÆp0WHÈÕd§ª*Pº¸~!u ù*µè{ób¾ÑCõË¬ñ%*ª¨ºæDgÌ¯>¢pÅ>#0ù´ Ôb@Ö_A²ýÈ^ÕêòBl0l¿âîH§\n\rOÛØ`', 'Cash on Delivery', 'shipto', NULL, '1', 9779, NULL, NULL, 'Nr6K1618085710', 'Pending', 'koteidjanerapheal@gmail.com', 'Rapheal Djane Kotei', 'Ghana', '0555442117', 'Stadium Junction, Abor', 'Accra', '0232', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Please handle with care', NULL, NULL, 'pending', '2021-04-11 00:15:10', '2021-04-11 00:15:10', NULL, NULL, 'gh₵', 1, 0, 0, 10, 0, NULL, 0, 0),
(184, NULL, 'BZh91AY&SY¼?é\0¸ß@\0Xsø+«ü¿ÿÿúP~Ér\neiÀÀ\0&\0`&£ÔM4ÐÐÄ0Ñ£M¡\0BE4mM\0\Z2\r\0\0\0Í10\0\0\0À\0L\n¢!14b¤É<§¨ýSÐG©B!mäCöGîÔgÙù#Í/¬hù\\IÚXÉkØ1÷Ø`É	8ûjNËÜÍÍÁqF±ÙT·wïà¾×U)i¾.igU°ÖÁÉlì±Ò6Æ×5fÃ4B#Tp28\n³UØö¯k¨tq÷%ÄL!SOÉUÃúÃjÜ%½ª#Gq\"óÂ&#zz	ªèb`Y®êp025iËM6èhM)@PN3lAµ01Ä2®jj\"«E!C¨É¡hL»»,ò¬Yªdâ¦|ËE F\n f ³&		\"U:e<¨*û,k2dÊª39Åä-ZYÅ&¢fB±±c@Â¤¬S²VVÍ\rçW_ÑGêî«ª&Hk¥)@W»*sC0qÃcDhQ<PV$°àmÁ)Bq¿ÃO¢BÒI%ëM2äºGw®Uu¶IÜ×w;:É´b¸\\3xÐâM_)V·â.qq/Þ÷ÌÊçÌ¦r{¬,ñ¨0QÄ$^ßAö^/£ÁkCßzOKÊÙÒÁê`¯¹>Nzbè×LXfn¦H,}Z«òKµÕF57<÷ÃÜó`×nu¶-¶¬e´dØÝ¦?51,ùeb¤d¹%ø¬átEì$LÃêÀÖaÛs½s±v­T)z´±©ñ¼ë=c÷3{ÿ-mAf,¦ÂÆÚÈ¯\'ö|Ã©ÁcLàRL\rO\"ØÏ&QÉ~IkN1×f¶ú¶¾=R£Æíìw/½j(^²·*¸ÍNîhÓtXôsL¡Â­ÉJôàïãs%£mö\n8äUX²cN\Z?×ÂÔ½dW\\#ðqo%·¹nÃÒ[Fîþä¤º(ª\nÌi¹,Ñ{¢+¾Pp¶¬¢Ð\n*v b<¦\nU¦u%t2AilGHU*#(Úíjy¦9#NøU4V*®fª½#½ìLaíÙN}+b(ìo>iú;9L¨äÓ°²aÂ¸ÇjnÅÚÙfº<©)[Hê²ÇZÜµ%Hæ¬F,ÔQ;hÁÃ¥áís»¼Ï°\"\"¼±$ÉäBá\r\0Á#N§	¼nßëâlíàcªïcCÁP¢+¤q×FtÐ[z>¦ç&V8:@ÙðEih?0Òæ?	Ã\'&¼èÿ³ÜøxqØ}+ÂBT©FWr¿Õö¨?å\nÇ¾b(ÉìD¹^â<GèääåF ±ÿ¹\"(H^t', 'Cash on Delivery', 'shipto', NULL, '1', 11330, NULL, NULL, 'j1a91618479436', 'Pending', 'koteidjanerapheal@gmail.com', 'Rapheal Djane Kotei', 'Ghana', '0555442117', 'Stadium Junction, Abor', 'Accra', '0232332', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Carry with care', NULL, NULL, 'pending', '2021-04-15 15:37:16', '2021-04-15 15:37:16', NULL, NULL, 'gh₵', 1, 0, 0, 10, 0, NULL, 0, 0),
(185, NULL, 'BZh91AY&SYtÿw\0Û_@\0Xø+kô¿ïÿúP»ÝÙÕ8±ÝvJ)ÈBQ4$jbi Ð\0¦	@\"TÿTL\0\0\0\0\0\0!J%4zF Ó@Ú@\0h@s\0\0\0\0\0\0\0\0$D&)é&\"SOI 4ýS#LÒ`)¨)°úÒÚ}ÃØ=$|>:Xü*2Zè1ûGÄu$$ÊöiV8,IÊÃcÕK3*ZPµób)ñ>ÊÆÒHbº¢0`Æ!Â±\\Åö^p¤Ü(ÄLyÉà$%­rXÚ-e3i¨â3¼Ø\\LúÐ±Aæhy<#1.¦\0!ÈÕ5r¼¼¿&¢¬C$:æ\ZaÈBo!6Ù\rc/¸ A`©qiµJ«jÃ2kÂj&JP¦ºMv4è ¤C+h¶\r©¤E)RP`K\nÖ& M¡3JºR)XP8Z)lTUJR¦\"¥I°ÂÆrHR3ÇAL¨aÉ-tÎÉµ^AorÅ E,ö©°JJ2EªQÜ\"­2%d\n(êJÁVLU<~Iæ¿ÑJÚ\r3\0¤\"z\'C+L1S01ÃcDhQ<v$Duqa6`B(R7·2¸zª«ÐF¤ËnlK £guu-xÈ$báfê)9\\»ÁIL	TÉYé°½°RÁ\nb(ù%P©ÄGb#P¦×fÂã`ðOSÐ TÀý»èÌÐñ³À¸ÿûÎêî¬½P`ª4Ø9?(§qÒsaÑC í<;Ï©±IÖz/JRm\ZnÁj7Öc^GÄä|\ZNºÞÀÖXÌÖ_ húq,qFCºÄÉChêàhw\Z\ZËjÒ.J!ZºÃÕ;{#0ÝÆbX¤6kVËêÆ£¨È¨Ó2#ó	b3Ú\\(T²x,+±ø¡ónG\Z2`Râ¥ÄMñ@÷w=ë¸ð>çxØ¹\\ëÄBó9¼ìOmiÚ\\a$ª4©9n&JhDSøc(2 M%ùÈVÈ¥àgËÛØ1£ÄRE³°¨Qo ÌUÕ\nI>DÞF%LPÍ­	\n¥±2Ø0ø\Z.\"Ër1C÷c%&p~\r©)QJéµÚ$oDqÌÖp 96 ÷\ZeèYh¡¯Ô\'%´xfm7SdÍÊÂ#Bí%,\rä>¨097ü}íï3í¯4bA,ÌJD\nÐÁ#NjyN#iÝßãÄ·R]ª¹kÄ\0A£Bá®Vîq5c8+¤dj²ÆFS×(]\\0YyRc&¼êÅ±òÐæ·ÉJªª.¸Íç©N,½í33F­E÷Ìv9õ íÛ ¡È,âîH§\n®îà', 'Cash on Delivery', 'shipto', NULL, '1', 3737.8, NULL, NULL, 'pmti1618479908', 'Pending', 'empireuniquetrade@gmail.com', 'Emmanuel Ayertey', 'Ghana', '0554443860', '1st street ave', 'Accra', '00233', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-04-15 15:45:08', '2021-04-15 15:45:08', NULL, NULL, 'gh₵', 1, 0, 0, 10, 0, NULL, 0, 0),
(186, 74, 'BZh91AY&SYKi\0¸_@\0Xsø+«ü¿ÿÿúPw«¶A@¡iÀÀ\0&\0`(£Òm#@4\0@4\Z\nTÔLe4ÓÑ \r\Z\04ÄÀ``\0\00HFDbbhÈ§¨ýSõÓF\'¨àÄ`$|Eò7\Z@íHÇÌräÏ¥>eI¯ÄkuýÈ¤|H$^ùÎ:vqúhµgW-é\ZÍÓ+eWçi_s¼`Æ*fQ\ZK¨Î½<V¥%MKv		h]¡¸`¦£ÔoÆ¶ñ=ÇÈBö%w&åsÇ©É¶ð!­b_e(Ì?AZCLeË8&DÊyªøTrd1Èi´Àl\Zå*18ÂwbiÔ2wÑ(NÁRñX8Ò0è3!1U³vY Z¢ÆRÄ\\Äs-hqÁÍHã\Z r,Ú@î¨P¨àÄØÝ@Ù9¦DÆF]`R¤êrå2x	¼ªè&	Àrj!b¨6)tñô¨ý]Àè\Zf)JPðÇ\nÃ$Ôf8m4F¢ß±%%Ós©- RÃo^a[Ê:I$¹Æ%J8wâ¢MôÄmpíÓQ¾\r¬Ð®ËWÄi¸U¤TÁæ­9,ó&Ì µ§Uñ¤ËÈ©!~Ó¨ò>\'àPÀ÷¤¯¡Ò\"Çab^áô9`IÝUiSjcÐR±æhò3¬æAy(6¼øûBÆ#aÍsE#P\\°35Æ¾I)Ó9ØÀÌ©s3GÒÔXx,K0hmeHZÁ×S¸©ÔWFÄ2AcXXç\Z8¸ßÎ¿fv\'(Òbf\n`ªÖ\'ÔÐj.PiHpc,JÃ90GÆi¦_Lò	S³Yòæ2-lÜ_a¯yÞ©\"¡´RÎBËjñ&zÄ%Û#`Æ\"r13´îáS2{E®f£¸±ÂDÚÊØEqEz3	iBüàf½å5«5oqÝ¼c\nÇ¤E@YTS&ÍÇ¥º\n]YQ#ð$Øa¥¥Æ7¸()/Hd5¬a÷A®\"Ër$]R%´,xyñW¨Ó1=Vöê]GAÔn þ¦òaB&W¢&Ñv£ënu§¦ã)9è$®m ëÇoWáÃ=pD0EsF$$Ca4\0R.K:\ZÎ¹³okbñ2¾ÃÀI&D.\Z`È8ïpo¼ê´°0X¤\\ê²¥ËËlPÄ>Ì{Êö#ìÅè8­ä%55-äm>Ä÷k øò,÷4 Ì±XÍzèyw¡ß?@\'\'*49ü]ÉáB@y-¦\0', 'Cash on Delivery', 'shipto', NULL, '1', 11330, NULL, NULL, 'ZcMU1618480442', 'Pending', 'koteidjanerapheal@gmail.com', 'Rapheal Djane Kotei', 'Ghana', '0555442117', 'Stadium', 'Accra', '0232', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Carry with care', NULL, NULL, 'pending', '2021-04-15 15:54:02', '2021-04-15 15:54:02', NULL, NULL, 'gh₵', 1, 0, 0, 10, 0, NULL, 0, 0),
(187, 78, 'BZh91AY&SYÄ\0ª_@\0Xø+/õ¿ïÿúPm·¸.a;¨è PDd1\'¨iL4h\'©åLF& \0\0\0\0\0\0j\"$Ò6\r\0@4\Z\09\0\0\0\0\0\0\0$M5Sð§=4¡£5\Z	3q*I.!´]F\r,ye9	lÚ$×ÌqEQ,,ÞÚ]=y Æ2b©,-²\nÎ1g\"k1Ýßã ëïe&BQpÄ¾s%a%úÏemL¢i	zr/	+ËÈsèP¹êxjÐfñ K&BPÓ8Ï6uu\réP\0Ö!PIÎ!Iç4TÕvPNX@Í%B­/LH\\KR[Ç1ÎgÃ¿*È(¨ÊÝÞË78 b©1)Ø`3¥VÜbÎ*ó©F%%°»Æà¨p¡Ñ¬í9Ü¡b(P,HJ\rDX¸* ÍÎeòîSRYA+0ò6-0Å\rTw.\0Ê\Z@°)ÖfÍé~¹	Ù? \\ °.¨¤¦zì¥º*0ÁTJf(\"\' ¤HfJH\nA` #nä¥à$N¡-3Y&h³vÍ©h¨¹\"\"Á/cÅ²|)st :K¸d+UXqÈ1Bè°g*°Ã%³Ï!I!¤,0­ ÿgñIàQ#{GÔ?S­É<UrS6\"g¡¶Þi\ZFäÒciAY=\'b3q1B¡ä	ÄpyvP26#_ôÊb702 \nÄ }hfÊæ\ZF µºg##I\\²Qd`\\bØñ¶nAm»æÉX(9MPÐVl&ÍIü83i´]D%ÎÄ#©|k1×=*oï?¯ôgÁHêÖîÆ½ d*ÅÝØZ3^±î1Ü\\`Î\'>U%¼[$l9g¨y\Z\nu+5§,idLg±#xKb#îL}ü	íî\ZÀÇ#+BMeQL\Z\rÄwé(AÁPEàa2JP!ÉÄEH\nêbµ>Æ±ÚÓ+´.sûâ°¨Ó.z\raï×4J\rFðÿõ3 8¶ üË¢Í\Z&r[G\\§|ö@üØ¤)H1¡$¬o ñÑ©É¿ÇÉ¯t$A¡*21Â\"IBE\0\0¦DEq¼rmîÒ)­,ÅEàV§B\0 2!gªCnÜàiÂV,®Lh14ÀÙ#n.®Z¼¡0©^Gàf+÷÷ð0Ñ¤æ³!)©¨²ÌÏb÷	T÷4 Ä±Výx¸P¾·nÈMbþ.äp¡!>=.', 'Cash on Delivery', 'shipto', NULL, '1', 3718, NULL, NULL, 'yaIu1618486991', 'Pending', 'rkotei@gctu.edu.gh', 'Rapheal Djane Kotei', 'Ghana', '0555442117', 'Stadium Junction', 'Accra', '0232', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Carry with care', NULL, NULL, 'pending', '2021-04-15 17:43:11', '2021-04-15 17:43:11', NULL, NULL, 'gh₵', 1, 0, 0, 10, 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_tracks`
--

CREATE TABLE `order_tracks` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_tracks`
--

INSERT INTO `order_tracks` (`id`, `order_id`, `title`, `text`, `created_at`, `updated_at`) VALUES
(185, 182, 'Pending', 'You have successfully placed your order.', '2021-04-11 00:06:27', '2021-04-11 00:06:27'),
(186, 183, 'Pending', 'You have successfully placed your order.', '2021-04-11 00:15:10', '2021-04-11 00:15:10'),
(187, 184, 'Pending', 'You have successfully placed your order.', '2021-04-15 15:37:16', '2021-04-15 15:37:16'),
(188, 185, 'Pending', 'You have successfully placed your order.', '2021-04-15 15:45:08', '2021-04-15 15:45:08'),
(189, 186, 'Pending', 'You have successfully placed your order.', '2021-04-15 15:54:02', '2021-04-15 15:54:02'),
(190, 187, 'Pending', 'You have successfully placed your order.', '2021-04-15 17:43:11', '2021-04-15 17:43:11');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `subtitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `header` tinyint(1) NOT NULL DEFAULT '0',
  `footer` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `details`, `meta_tag`, `meta_description`, `header`, `footer`) VALUES
(1, 'About Us', 'about', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><p class=\"MsoNormal\" style=\"margin-top:22.5pt;margin-right:0in;margin-bottom:\r\n0in;margin-left:0in;margin-bottom:.0001pt;line-height:normal;mso-outline-level:\r\n1\"></p><div><p class=\"MsoNormal\" style=\"margin-top:22.5pt;margin-right:0in;margin-bottom:\r\n0in;margin-left:0in;margin-bottom:.0001pt;text-align:justify;line-height:300%;\r\nmso-outline-level:1\"><span style=\"font-size: 12pt; line-height: 300%; font-family: Arial, sans-serif; color: black; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Caspian Outlet is the largest independently-owned, retailer of electronics,\r\nappliances, computer accessories and general hardware goods in Ghana. Anchored\r\nby five (5) branches across the country. Delivering superior wholesale and\r\nretail services and reaching an enthusiastically loyal customer base spread\r\nover the country. A visit to Caspian Outlets goes beyond just shopping—it\'s an\r\nexperience unlike any other store. &nbsp;Caspian\r\nOutlets offers competitive pricing on its unparalleled product selection, with\r\na firm commitment to on-time order fulfillment. We empower customers to make\r\nthe best purchasing decisions by offering detailed product information, peer\r\nreviews, expert opinions, product tutorials and the opportunity to network with\r\nother members of the Caspian community. Customer satisfaction is Caspian’s top\r\npriority, achieved by delivering superior service with our ever-present\r\nphilosophy of putting the customer first.<o:p></o:p></span></p></div></h2><p class=\"MsoNormal\" style=\"margin-top:22.5pt;margin-right:0in;margin-bottom:\r\n0in;margin-left:0in;margin-bottom:.0001pt;line-height:normal;mso-outline-level:\r\n1\"><span style=\"font-size:12.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif;mso-fareast-font-family:\"times=\"\" roman\";=\"\" color:black;mso-themecolor:text1;mso-font-kerning:18.0pt\"=\"\"><font face=\"times new roman\"><o:p></o:p></font></span></p></div><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><p class=\"MsoNormal\" style=\"text-align: justify; line-height: 300%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; vertical-align: top;\"><b><span style=\"font-size:18.0pt;line-height:\r\n300%;font-family:\" arial\",sans-serif;mso-fareast-font-family:\"times=\"\" new=\"\" roman\";=\"\" color:black\"=\"\">Customer Service&nbsp;&nbsp;&nbsp;&nbsp; </span></b><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif;=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\"><br>\r\nThe key to our years of growth has always been a tireless dedication to\r\ncustomer service. Simply put, we\'ll accommodate nearly any reasonable request\r\nin order to provide the best customer experience in the industry. It\'s the main\r\nreason we\'re consistently rated as one of the best places to shop for\r\nappliances, electronics, and home goods in the entire country.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align: justify; line-height: 300%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; vertical-align: top;\"><b><span style=\"font-size:18.0pt;line-height:\r\n300%;font-family:\" arial\",sans-serif;mso-fareast-font-family:\"times=\"\" new=\"\" roman\";=\"\" color:black\"=\"\">Free Technical Support</span></b><span style=\"font-size:12.0pt;\r\nline-height:300%;font-family:\" arial\",sans-serif;mso-fareast-font-family:\"times=\"\" new=\"\" roman\";=\"\" color:black\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp; <br>\r\nOur service doesn\'t stop once your products are delivered. We know that it can\r\nbe difficult trying to learn the ins and outs of your new gadget—and we\'re here\r\nto help. Free technical support from our in-store experts is just a phone call\r\naway.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin: 7.5pt 0in; line-height: 18pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; vertical-align: top;\">\r\n\r\n\r\n\r\n</p><p class=\"MsoNormal\" style=\"text-align: justify; line-height: 300%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; vertical-align: top;\"><b><span style=\"font-size:18.0pt;line-height:\r\n300%;font-family:\" arial\",sans-serif;mso-fareast-font-family:\"times=\"\" new=\"\" roman\";=\"\" color:black\"=\"\">Low Price Guarantee </span></b><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif;=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";color:black\"=\"\"><br>\r\nIf you find a better price on any product at another authorized retailer, we\'ll\r\nmeet or beat that price.<o:p></o:p></span></p></h2></div>', NULL, NULL, 1, 1),
(2, 'Privacy & Policy', 'privacy', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">At\r\nCaspian Outlets, accessible from caspianoutlets.com, one of our main priorities\r\nis the privacy of our visitors. This Privacy Policy document contains types of\r\ninformation that is collected and recorded by Caspian Outlets and how we use\r\nit. If you have additional questions or require more information about our\r\nPrivacy Policy, do not hesitate to contact us. This Privacy Policy applies only\r\nto our online activities and is valid for visitors to our website with regards\r\nto the information that they shared and/or collect in Caspian Outlets. This\r\npolicy is not applicable to any information collected offline or via channels\r\nother than this website. Our Privacy Policy was created with the help of the\r\n<a href=\"https://www.privacypolicyonline.com/privacy-policy-generator/\">Free\r\nPrivacy Policy Generator</a>.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:200%\"><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">Consent<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">By\r\nusing our website, you hereby consent to our Privacy Policy and agree to its\r\nterms.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:200%\"><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">Information we collect<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">&nbsp;</span><span style=\"font-size: 12pt;\">The\r\npersonal information that you are asked to provide, and the reasons why you are\r\nasked to provide it, will be made clear to you at the point we ask you to\r\nprovide your personal information. If you contact us directly, we may receive\r\nadditional information about you such as your name, email address, phone\r\nnumber, and the contents of the message and/or attachments you may send us, and\r\nany other information you may choose to provide. When you register for an\r\nAccount, we may ask for your contact information, including items such as name,\r\ncompany name, address, email address, and telephone number.</span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:200%\"><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">How we use your information<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l2 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">We use the information we collect in various\r\nways, including to:<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l2 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">Provide, operate, and maintain our website<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l2 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">Improve, personalize, and expand our website<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l2 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">Understand and analyze how you use our website<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l2 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">Develop new products, services, features, and\r\nfunctionality<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l2 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">Communicate with you, either directly or\r\nthrough one of our partners, including for customer service, to provide you\r\nwith updates and other information relating to the website, and for marketing\r\nand promotional purposes<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l2 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">Send you emails<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpLast\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l2 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">Find and prevent fraud<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:200%\"><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">Log Files<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">Caspian\r\nOutlets follows a standard procedure of using log files. These files log\r\nvisitors when they visit websites. All hosting companies do this and a part of hosting\r\nservices\' analytics. The information collected by log files include internet\r\nprotocol (IP) addresses, browser type, Internet Service Provider (ISP), date\r\nand time stamp, referring/exit pages, and possibly the number of clicks. These\r\nare not linked to any information that is personally identifiable. The purpose\r\nof the information is for analyzing trends, administering the site, tracking\r\nusers\' movement on the website, and gathering demographic information.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:200%\"><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">Cookies and Web Beacons<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">Like\r\nany other website, Caspian Outlets uses \'cookies\'. These cookies are used to\r\nstore information including visitors\' preferences, and the pages on the website\r\nthat the visitor accessed or visited. The information is used to optimize the\r\nusers\' experience by customizing our web page content based on visitors\'\r\nbrowser type and/or other information.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">For\r\nmore general information on cookies, please read <a href=\"https://www.cookieconsent.com/what-are-cookies/\">\"What\r\nAre Cookies\" from Cookie Consent</a>.</span></p><o:p></o:p><p></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:200%\"><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">Google DoubleClick DART Cookie<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">Google\r\nis one of a third-party vendor on our site. It also uses cookies, known as DART\r\ncookies, to serve ads to our site visitors based upon their visit to\r\nwww.website.com and other sites on the internet. However, visitors may choose\r\nto decline the use of DART cookies by visiting the Google ad and content\r\nnetwork Privacy Policy at the following URL <a href=\"https://policies.google.com/technologies/ads\">https://policies.google.com/technologies/ads</a></span></p><o:p></o:p><p></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:200%\"><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">Our Advertising Partners<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\"></span></p><p>Some\r\nof advertisers on our site may use cookies and web beacons. Our advertising\r\npartners are listed below. Each of our advertising partners has their own\r\nPrivacy Policy for their policies on user data. For easier access, we\r\nhyperlinked to their Privacy Policies below.</p><ul><li><p>Google</p><o:p></o:p><p></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\"></span></p><p><ahref=\"https: policies.google.com=\"\" technologies=\"\" ads\"=\"\">https://policies.google.com/technologies/ads</ahref=\"https:></p></li></ul><o:p></o:p><p></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:200%\"><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">Advertising Partners Privacy Policies<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">You\r\nmay consult this list to find the Privacy Policy for each of the advertising partners\r\nof Caspian Outlets. Third-party ad servers or ad networks uses technologies\r\nlike cookies, JavaScript, or Web Beacons that are used in their respective\r\nadvertisements and links that appear on Caspian Outlets, which are sent\r\ndirectly to users\' browser. They automatically receive your IP address when\r\nthis occurs. These technologies are used to measure the effectiveness of their\r\nadvertising campaigns and/or to personalize the advertising content that you\r\nsee on websites that you visit. Note that Caspian Outlets has no access to or\r\ncontrol over these cookies that are used by third-party advertisers.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:200%\"><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">Third Party Privacy Policies<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">Caspian\r\nOutlets Privacy Policy does not apply to other advertisers or websites. Thus,\r\nwe are advising you to consult the respective Privacy Policies of these\r\nthird-party ad servers for more detailed information. It may include their\r\npractices and instructions about how to opt-out of certain options. You can\r\nchoose to disable cookies through your individual browser options. To know more\r\ndetailed information about cookie management with specific web browsers, it can\r\nbe found at the browsers\' respective websites.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:200%\"><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">CCPA Privacy Rights (Do Not Sell My Personal\r\nInformation)<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">Under\r\nthe CCPA, among other rights, California consumers have the right to:<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l0 level1 lfo2\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">Request that a business that collects a\r\nconsumer\'s personal data disclose the categories and specific pieces of\r\npersonal data that a business has collected about consumers.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l0 level1 lfo2\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">Request that a business delete any personal\r\ndata about the consumer that a business has collected.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l0 level1 lfo2\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">Request that a business that sells a consumer\'s\r\npersonal data, not sell the consumer\'s personal data.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpLast\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l0 level1 lfo2\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">If you make a request, we have one month to\r\nrespond to you. If you would like to exercise any of these rights, please\r\ncontact us.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:200%\"><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">GDPR Data Protection Rights<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">We\r\nwould like to make sure you are fully aware of all of your data protection\r\nrights. Every user is entitled to the following:<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l1 level1 lfo3\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">The right to access – You have the right to\r\nrequest copies of your personal data. We may charge you a small fee for this\r\nservice.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l1 level1 lfo3\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">The right to rectification – You have the right\r\nto request that we correct any information you believe is inaccurate. You also\r\nhave the right to request that we complete the information you believe is\r\nincomplete.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l1 level1 lfo3\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">The right to erasure – You have the right to\r\nrequest that we erase your personal data, under certain conditions.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l1 level1 lfo3\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">The right to restrict processing – You have the\r\nright to request that we restrict the processing of your personal data, under\r\ncertain conditions.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l1 level1 lfo3\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">The right to object to processing – You have\r\nthe right to object to our processing of your personal data, under certain\r\nconditions.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l1 level1 lfo3\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">The right to data portability – You have the\r\nright to request that we transfer the data that we have collected to another\r\norganization, or directly to you, under certain conditions.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpLast\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l1 level1 lfo3\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">If you make a request, we have one month to\r\nrespond to you. If you would like to exercise any of these rights, please\r\ncontact us.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">&nbsp;</span><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">Children\'s Information</span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">Another\r\npart of our priority is adding protection for children while using the\r\ninternet. We encourage parents and guardians to observe, participate in, and/or\r\nmonitor and guide their online activity. Caspian Outlets does not knowingly\r\ncollect any Personal Identifiable Information from children under the age of\r\n13. If you think that your child provided this kind of information on our\r\nwebsite, we strongly encourage you to contact us immediately and we will do our\r\nbest efforts to promptly remove such information from our records.<o:p></o:p></span></p></h2></div>', NULL, NULL, 0, 1);
INSERT INTO `pages` (`id`, `title`, `slug`, `details`, `meta_tag`, `meta_description`, `header`, `footer`) VALUES
(3, 'Terms & Condition', 'terms', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size: 12pt;\">These\r\nterms and conditions outline the rules and regulations for the use of Caspian Outlet’s\r\nWebsite, located at caspianoutlets.com. By accessing this website, we assume\r\nyou accept these terms and conditions. Do not continue to use Caspian Outlets\r\nif you do not agree to take all of the terms and conditions stated on this\r\npage. The following terminology applies to these Terms and Conditions, Privacy\r\nStatement and Disclaimer Notice and all Agreements: \"Client\",\r\n\"You\" and \"Your\" refers to you, the person log on this\r\nwebsite and compliant to the Company’s terms and conditions. \"The\r\nCompany\", \"Ourselves\", \"We\", \"Our\" and\r\n\"Us\", refers to our Company. \"Party\", \"Parties\",\r\nor \"Us\", refers to both the Client and ourselves. All terms refer to\r\nthe offer, acceptance and consideration of payment necessary to undertake the\r\nprocess of our assistance to the Client in the most appropriate manner for the\r\nexpress purpose of meeting the Client’s needs in respect of provision of the\r\nCompany’s stated services, in accordance with and subject to, prevailing law of\r\nNetherlands. Any use of the above terminology or other words in the singular,\r\nplural, capitalization and/or he/she or they, are taken as interchangeable and\r\ntherefore as referring to same.</span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:200%\"><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">Cookies<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">We\r\nemploy the use of cookies. By accessing Caspian Outlets, you agreed to use\r\ncookies in agreement with the Caspian Outlet’s Privacy Policy. Most interactive\r\nwebsites use cookies to let us retrieve the user’s details for each visit.\r\nCookies are used by our website to enable the functionality of certain areas to\r\nmake it easier for people visiting our website. Some of our\r\naffiliate/advertising partners may also use cookies.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:200%\"><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">License<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">Unless\r\notherwise stated, Caspian Outlets and/or its licensors own the intellectual\r\nproperty rights for all material on Caspian Outlets. All intellectual property\r\nrights are reserved. You may access this from Caspian Outlets for your own\r\npersonal use subjected to restrictions set in these terms and conditions.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:200%\"><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">You must not:<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l5 level1 lfo4\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">Republish material from Caspian Outlets<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l5 level1 lfo4\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">Sell, rent or sub-license material from Caspian\r\nOutlets<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l5 level1 lfo4\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">Reproduce, duplicate or copy material from\r\nCaspian Outlets<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpLast\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l5 level1 lfo4\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">Redistribute content from Caspian Outlets<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">&nbsp;</span><span style=\"font-size: 12pt;\">This\r\nAgreement shall begin on the date hereof. Our Terms and Conditions were created\r\nwith the help of the </span><a href=\"https://www.termsandconditionsgenerator.com\" style=\"font-size: 12pt; background-color: rgb(255, 255, 255);\">Terms And Conditions\r\nGenerator</a><span style=\"font-size: 12pt;\"> and the </span><a href=\"https://www.generateprivacypolicy.com\" style=\"font-size: 12pt; background-color: rgb(255, 255, 255);\">Privacy\r\nPolicy Generator</a><span style=\"font-size: 12pt;\">. Parts of this website offer an opportunity for\r\nusers to post and exchange opinions and information in certain areas of the\r\nwebsite. Caspian Outlets does not filter, edit, publish or review Comments\r\nprior to their presence on the website. Comments do not reflect the views and\r\nopinions of Caspian Outlets,its agents and/or affiliates. Comments reflect the\r\nviews and opinions of the person who post their views and opinions. To the\r\nextent permitted by applicable laws, Caspian Outlets shall not be liable for\r\nthe Comments or for any liability, damages or expenses caused and/or suffered\r\nas a result of any use of and/or posting of and/or appearance of the Comments\r\non this website. Caspian Outlets reserves the right to monitor all Comments and\r\nto remove any Comments which can be considered inappropriate, offensive or\r\ncauses breach of these Terms and Conditions.</span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:200%\"><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">You warrant and represent that:<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l0 level1 lfo3\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">You are entitled to post the Comments on our\r\nwebsite and have all necessary licenses and consents to do so;<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l0 level1 lfo3\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">The Comments do not invade any intellectual\r\nproperty right, including without limitation copyright, patent or trademark of\r\nany third party;<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l0 level1 lfo3\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">The Comments do not contain any defamatory,\r\nlibelous, offensive, indecent or otherwise unlawful material which is an\r\ninvasion of privacy.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpLast\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l0 level1 lfo3\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">The Comments will not be used to solicit or\r\npromote business or custom or present commercial activities or unlawful\r\nactivity.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">You\r\nhereby grant Caspian Outlets a non-exclusive license to use, reproduce, edit\r\nand authorize others to use, reproduce and edit any of your Comments in any and\r\nall forms, formats or media.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:200%\"><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">Hyperlinking to our Content<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">The\r\nfollowing organizations may link to our Website without prior written approval:<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l2 level1 lfo2\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">Government agencies;<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l2 level1 lfo2\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">Search engines;<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpLast\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l2 level1 lfo2\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">News organizations<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">Online\r\ndirectory distributors may link to our Website in the same manner as they\r\nhyperlink to the Websites of other listed businesses; and System wide\r\nAccredited Businesses except soliciting non-profit organizations, charity\r\nshopping malls, and charity fundraising groups which may not hyperlink to our\r\nWeb site. These organizations may link to our home page, to publications or to\r\nother Website information so long as the link: (a) is not in any way deceptive;\r\n(b) does not falsely imply sponsorship, endorsement or approval of the linking\r\nparty and its products and/or services; and (c) fits within the context of the\r\nlinking party’s site.&nbsp;</span><span style=\"font-size: 12pt;\">We may\r\nconsider and approve other link requests from the following types of\r\norganizations:</span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l4 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">commonly-known consumer and/or business information\r\nsources;<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l4 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">dot.com community sites;<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l4 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">associations or other groups representing\r\ncharities;<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l4 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">online directory distributors;<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l4 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">internet portals;<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l4 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">accounting, law and consulting firms; and<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpLast\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l4 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">Educational institutions and trade\r\nassociations.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">We\r\nwill approve link requests from these organizations if we decide that: (a) the\r\nlink would not make us look unfavorably to ourselves or to our accredited\r\nbusinesses; (b) the organization does not have any negative records with us;\r\n(c) the benefit to us from the visibility of the hyperlink compensates the\r\nabsence of Caspian Outlets; and (d) the link is in the context of general\r\nresource information.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">&nbsp;</span><span style=\"font-size: 12pt;\">These\r\norganizations may link to our home page so long as the link: (a) is not in any\r\nway deceptive; (b) does not falsely imply sponsorship, endorsement or approval\r\nof the linking party and its products or services; and (c) fits within the\r\ncontext of the linking party’s site.</span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">If you\r\nare one of the organizations listed in paragraph 2 above and are interested in\r\nlinking to our website, you must inform us by sending an e-mail to Caspian\r\nOutlets. Please include your name, your organization name, contact information\r\nas well as the URL of your site, a list of any URLs from which you intend to\r\nlink to our Website, and a list of the URLs on our site to which you would like\r\nto link. Wait 2-3 weeks for a response.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:200%\"><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">Approved organizations may hyperlink to\r\nour Website as follows:<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l1 level1 lfo5\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">By use of our corporate name; or<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l1 level1 lfo5\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">By use of the uniform resource locator being\r\nlinked to; or<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpLast\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l1 level1 lfo5\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">By use of any other description of our Website\r\nbeing linked to that makes sense within the context and format of content on\r\nthe linking party’s site.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">&nbsp;</span><span style=\"font-size: 12pt;\">No use\r\nof Caspian Outlets\'s logo or other artwork will be allowed for linking absent a\r\ntrademark license agreement.</span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:200%\"><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">iFrames<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">Without\r\nprior approval and written permission, you may not create frames around our\r\nWebpages that alter in any way the visual presentation or appearance of our\r\nWebsite.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:200%\"><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">Content Liability<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">We\r\nshall not be hold responsible for any content that appears on your Website. You\r\nagree to protect and defend us against all claims that is rising on your\r\nWebsite. No link(s) should appear on any Website that may be interpreted as\r\nlibelous, obscene or criminal, or which infringes, otherwise violates, or\r\nadvocates the infringement or other violation of, any third party rights.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:200%\"><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">Your Privacy<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">Please\r\nread Privacy Policy<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:200%\"><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">Reservation of Rights<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">&nbsp;</span><span style=\"font-size: 12pt;\">We\r\nreserve the right to request that you remove all links or any particular link\r\nto our Website. You approve to immediately remove all links to our Website upon\r\nrequest. We also reserve the right to amen these terms and conditions and it’s\r\nlinking policy at any time. By continuously linking to our Website, you agree\r\nto be bound to and follow these linking terms and conditions.</span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:200%\"><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">Removal of links from our website<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">If you\r\nfind any link on our Website that is offensive for any reason, you are free to\r\ncontact and inform us any moment. We will consider requests to remove links but\r\nwe are not obligated to or so or to respond to you directly. We do not ensure\r\nthat the information on this website is correct, we do not warrant its\r\ncompleteness or accuracy; nor do we promise to ensure that the website remains\r\navailable or that the material on the website is kept up to date.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:200%\"><b><span style=\"font-size:18.0pt;line-height:\r\n200%;font-family:\" arial\",sans-serif\"=\"\">Disclaimer<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size: 12pt;\">To the\r\nmaximum extent permitted by applicable law, we exclude all representations,\r\nwarranties and conditions relating to our website and the use of this website.\r\nNothing in this disclaimer will</span><br></p>\r\n\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l3 level1 lfo6\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">limit or exclude our or your liability for\r\ndeath or personal injury;<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l3 level1 lfo6\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">limit or exclude our or your liability for\r\nfraud or fraudulent misrepresentation;<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l3 level1 lfo6\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">limit any of our or your liabilities in any way\r\nthat is not permitted under applicable law; or<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpLast\" style=\"text-align:justify;text-indent:-.25in;\r\nline-height:300%;mso-list:l3 level1 lfo6\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;line-height:300%;font-family:Symbol;mso-fareast-font-family:\r\nSymbol;mso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:300%;\r\nfont-family:\" arial\",sans-serif\"=\"\">exclude any of our or your liabilities that may\r\nnot be excluded under applicable law.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:justify;line-height:300%\"><span style=\"font-size:12.0pt;line-height:300%;font-family:\" arial\",sans-serif\"=\"\">The\r\nlimitations and prohibitions of liability set in this Section and elsewhere in\r\nthis disclaimer: (a) are subject to the preceding paragraph; and (b) govern all\r\nliabilities arising under the disclaimer, including liabilities arising in\r\ncontract, in tort and for breach of statutory duty. As long as the website and\r\nthe information and services on the website are provided free of charge, we\r\nwill not be liable for any loss or damage of any nature.<o:p></o:p></span></p></h2></div>', 't1,t2,t3,t4', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 0, 1),
(4, 'Return Policy', 'return', '<p class=\"content\" style=\"margin: 0in 0in 16.5pt; text-align: justify; line-height: 36pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><font face=\"arial\" size=\"3\">This Return Policy only\r\napplies to products that are listed on the CaspianOutlets.com website\r\n(collectively, referred to as the “Site”), as “Sold and Shipped by Caspian\r\nOutlet”.<u1:p></u1:p><o:p></o:p><u2:p></u2:p></font></p><p class=\"MsoNormal\" style=\"margin-bottom: 16.5pt; text-align: justify; line-height: 24pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><font face=\"arial\" size=\"3\"><b style=\"\">Overall\r\nReturn Guidelines<u1:p></u1:p></b><u2:p></u2:p><o:p></o:p></font></p><p class=\"MsoNormal\" style=\"margin-bottom: 16.5pt; text-align: justify; line-height: 36pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><font face=\"arial\" size=\"3\">These are Caspian’s Overall Return\r\nGuidelines. All returns must meet the overall guidelines in order for the\r\nindividual return policy to apply.&nbsp;Most products that are new and\r\nunopened can be returned to Caspian Outlets within 30 days.&nbsp;Products that\r\nare received by Caspian Outlets in any of the following conditions are not\r\neligible for return and may be rejected: 1. Any product not purchased from\r\nCaspian Outlets. 2. Any product that does not exhibit the described reason for\r\nthe return. 3. Any product with a missing, damaged, altered, or otherwise\r\nunreadable serial number label, manufacturer model or part number label, and/or\r\nwarranty label. 4. Any product that is returned without all original packaging\r\nand accessories, including the retail box, manuals, cables, and all other items\r\noriginally included with the product. 5. Any product from which the\r\nmanufacturer code has been removed from its packaging. 6. Any product that\r\nexhibits physical damage. If you received your product damaged. 7. Any product\r\nfor which you have submitted a mail-in rebate. 8. Any product which appears\r\ntampered, customized or altered in any way. 9. Any product that is returned\r\nwith markings or writing made by the customer on the original box.<o:p></o:p><u2:p></u2:p></font></p><p style=\"margin: 0in 0in 16.5pt; text-align: justify; line-height: 24pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><font face=\"arial\" size=\"3\"><b style=\"\">Replacements</b><u1:p></u1:p><u2:p></u2:p><o:p></o:p></font></p><p class=\"content\" style=\"margin: 0in 0in 16.5pt; text-align: justify; line-height: 36pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><font face=\"arial\" size=\"3\">For products that are eligible for return for replacement, the\r\nproduct may only be returned for a replacement of the same item. We do not\r\nallow exchanges or returns for replacements for different items. If you would\r\nlike to receive a different item, you would need to return the original item\r\nfor a refund, in accordance with the Return Policy and then purchase the item\r\nyou would like to receive instead of the original item.&nbsp;If Caspian no longer carries an item that is\r\nsent in for replacement, or if that item is simply out of stock, Caspian will\r\nissue you a refund.&nbsp;Once your\r\nreturn has been processed, a replacement will be processed and shipped within\r\nspecified business days.<o:p></o:p></font></p><p class=\"content\" style=\"margin: 0in 0in 16.5pt; text-align: justify; line-height: 36pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><font face=\"arial\" size=\"3\"><u2:p></u2:p><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Customer is solely\r\nresponsible for shipping any returned product to Caspian Outlets Stores.\r\nCustomer agrees to use only reputable carriers capable of providing proof of\r\ndelivery and insurance for the entire value of the shipment. Customer agrees to\r\nbear all shipping and insurance charges and all risk of loss for the return\r\nproduct during shipment. Customer agrees that all returned products will be\r\n100% complete, in re-sealable condition, and will include the original\r\npackaging material, manuals, blank warranty cards, and other accessories\r\nprovided by the manufacturer. If any component of the returned product is\r\nmissing, Caspian’s Return Procedure will be breached and we may in its sole and\r\nabsolute discretion reject the entire return or choose to impose additional\r\ncharges against the customer for replacement of the missing component(s).\r\nCaspian Outlets will not refund the original shipping charges to the Customer.\r\nIn addition, Caspian Outlets reserves the right to adjust the value of any item\r\nreturned for refund to reflect its current market price, in which case the\r\nspecified % of restocking fee will be applied after this adjustment.<u1:p></u1:p></span><o:p></o:p><u2:p></u2:p></font></p><p style=\"margin: 0in 0in 16.5pt; text-align: justify; line-height: 24pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><font face=\"arial\" size=\"3\"><b style=\"\">Packaging\r\nReturns</b><u1:p></u1:p><u2:p></u2:p><o:p></o:p></font></p><p class=\"content\" style=\"margin: 0in 0in 16.5pt; text-align: justify; line-height: 36pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><font face=\"arial\" size=\"3\">The return must be properly packaged to protect against damage\r\nin transit. Please note that any damage caused by mishandling, improper\r\ninstallation or product defacement will result in your return being denied and\r\nthe product being returned to you.<u1:p></u1:p><o:p></o:p><u2:p></u2:p></font></p><h4 style=\"margin: 0in 0in 16.5pt; text-align: justify; line-height: 33pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><font face=\"arial\" size=\"3\"><b style=\"\">Additional\r\nTerms<u1:p></u1:p></b><u2:p></u2:p><o:p></o:p></font></h4><p style=\"margin: 0in 0in 16.5pt; text-align: justify; line-height: 24pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><font face=\"arial\" size=\"3\">Title<o:p></o:p><u1:p></u1:p><u2:p></u2:p></font></p><p class=\"content\" style=\"margin: 0in 0in 16.5pt; text-align: justify; line-height: 36pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><font face=\"arial\" size=\"3\">Caspian Outlets does not take title to returned items until the\r\nitem arrives at the returns address destination. At our discretion, a refund\r\nmay be issued without requiring a return. In this situation, Caspian Outlets\r\ndoes not take title to the refunded item.<u1:p></u1:p><o:p></o:p><u2:p></u2:p></font></p><p style=\"margin: 0in 0in 16.5pt; text-align: justify; line-height: 24pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><font face=\"arial\" size=\"3\">Cross-Shipping<o:p></o:p><u1:p></u1:p><u2:p></u2:p></font></p><p class=\"content\" style=\"margin: 0in 0in 16.5pt; text-align: justify; line-height: 36pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><font face=\"arial\" size=\"3\">We do not cross-ship. Returns must be received, inspected and\r\napproved before we ship a replacement.<u1:p></u1:p><o:p></o:p><u2:p></u2:p></font></p><p style=\"margin: 0in 0in 16.5pt; text-align: justify; line-height: 24pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><font face=\"arial\" size=\"3\">Refusing Delivery<o:p></o:p><u1:p></u1:p><u2:p></u2:p></font></p><p class=\"content\" style=\"margin: 0in 0in 16.5pt; text-align: justify; line-height: 36pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><font face=\"arial\" size=\"3\">Refused shipments are treated like regular returns and may be\r\ncharged a non-refundable a % of restocking fee.<u1:p></u1:p><o:p></o:p><u2:p></u2:p></font></p><p style=\"margin: 0in 0in 16.5pt; text-align: justify; line-height: 24pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><font face=\"arial\" size=\"3\"><b>Disclaimer</b><u1:p></u1:p><u2:p></u2:p><o:p></o:p></font></p><p class=\"content\" style=\"margin: 0in 0in 16.5pt; text-align: justify; line-height: 36pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><font face=\"arial\" size=\"3\">Nothing in this Return Policy limits your rights and remedies\r\nunder any law.</font></p>', NULL, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pagesettings`
--

CREATE TABLE `pagesettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_success` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_title` text COLLATE utf8mb4_unicode_ci,
  `contact_text` text COLLATE utf8mb4_unicode_ci,
  `side_title` text COLLATE utf8mb4_unicode_ci,
  `side_text` text COLLATE utf8mb4_unicode_ci,
  `street` text COLLATE utf8mb4_unicode_ci,
  `phone` text COLLATE utf8mb4_unicode_ci,
  `fax` text COLLATE utf8mb4_unicode_ci,
  `email` text COLLATE utf8mb4_unicode_ci,
  `site` text COLLATE utf8mb4_unicode_ci,
  `slider` tinyint(1) NOT NULL DEFAULT '1',
  `service` tinyint(1) NOT NULL DEFAULT '1',
  `featured` tinyint(1) NOT NULL DEFAULT '1',
  `small_banner` tinyint(1) NOT NULL DEFAULT '1',
  `best` tinyint(1) NOT NULL DEFAULT '1',
  `top_rated` tinyint(1) NOT NULL DEFAULT '1',
  `large_banner` tinyint(1) NOT NULL DEFAULT '1',
  `big` tinyint(1) NOT NULL DEFAULT '1',
  `hot_sale` tinyint(1) NOT NULL DEFAULT '1',
  `partners` tinyint(1) NOT NULL DEFAULT '0',
  `review_blog` tinyint(1) NOT NULL DEFAULT '1',
  `best_seller_banner` text COLLATE utf8mb4_unicode_ci,
  `best_seller_banner_link` text COLLATE utf8mb4_unicode_ci,
  `big_save_banner` text COLLATE utf8mb4_unicode_ci,
  `big_save_banner_link` text COLLATE utf8mb4_unicode_ci,
  `bottom_small` tinyint(1) NOT NULL DEFAULT '0',
  `flash_deal` tinyint(1) NOT NULL DEFAULT '0',
  `best_seller_banner1` text COLLATE utf8mb4_unicode_ci,
  `best_seller_banner_link1` text COLLATE utf8mb4_unicode_ci,
  `big_save_banner1` text COLLATE utf8mb4_unicode_ci,
  `big_save_banner_link1` text COLLATE utf8mb4_unicode_ci,
  `featured_banner` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pagesettings`
--

INSERT INTO `pagesettings` (`id`, `contact_success`, `contact_email`, `contact_title`, `contact_text`, `side_title`, `side_text`, `street`, `phone`, `fax`, `email`, `site`, `slider`, `service`, `featured`, `small_banner`, `best`, `top_rated`, `large_banner`, `big`, `hot_sale`, `partners`, `review_blog`, `best_seller_banner`, `best_seller_banner_link`, `big_save_banner`, `big_save_banner_link`, `bottom_small`, `flash_deal`, `best_seller_banner1`, `best_seller_banner_link1`, `big_save_banner1`, `big_save_banner_link1`, `featured_banner`) VALUES
(1, 'Success! Thanks for contacting us, we will get back to you shortly.', 'admin@caspianoutlets.com', '<h4 class=\"subtitle\" style=\"margin-bottom: 6px; font-weight: 600; line-height: 28px; font-size: 28px; text-transform: uppercase;\">WE\'D LOVE TO</h4><h2 class=\"title\" style=\"margin-bottom: 13px;font-weight: 600;line-height: 50px;font-size: 40px;color: #0f78f2;text-transform: uppercase;\">HEAR FROM YOU</h2>', '<span style=\"color: rgb(119, 119, 119);\">Send us a message and we\' ll respond as soon as possible</span><br>', '<h4 class=\"title\" style=\"margin-bottom: 10px; font-weight: 600; line-height: 28px; font-size: 28px;\">Let\'s Connect</h4>', '<span style=\"color: rgb(51, 51, 51);\">Get in touch with us</span>', '3xzxzxz584 Hickory Heixxxghts Drive ,xzxHanover MD 21076, USA', '00 000 000 000', '00 000 000 000', 'admin@caspianoutlets.com', 'https://caspianoutlets.com/', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '1565150257banner1.jpg', 'http://google.com', '1565150264banner3.jpg', 'http://google.com', 1, 1, '1565150257banner2.jpg', 'http://google.com', '1565150264banner4.jpg', 'http://google.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int(11) NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `photo`, `link`) VALUES
(1, '1563165366brand-1.png', 'https://www.google.com/'),
(2, '1563165383brand-2.png', 'https://www.google.com/'),
(3, '1563165393brand-3.png', 'https://www.google.com/'),
(4, '1563165400brand-1.png', NULL),
(5, '1563165411brand-2.png', NULL),
(6, '1563165444brand-3.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(11) NOT NULL,
  `subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pickups`
--

CREATE TABLE `pickups` (
  `id` int(10) UNSIGNED NOT NULL,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `product_type` enum('normal','affiliate') NOT NULL DEFAULT 'normal',
  `affiliate_link` text,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `subcategory_id` int(10) UNSIGNED DEFAULT NULL,
  `childcategory_id` int(10) UNSIGNED DEFAULT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_qty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` double NOT NULL,
  `previous_price` double DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `stock` int(11) DEFAULT NULL,
  `policy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` text,
  `colors` text,
  `product_condition` tinyint(1) NOT NULL DEFAULT '0',
  `ship` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_meta` tinyint(1) NOT NULL DEFAULT '0',
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `youtube` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Physical','Digital','License') NOT NULL,
  `license` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `license_qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `platform` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `licence_type` varchar(255) DEFAULT NULL,
  `measure` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `best` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `top` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `hot` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `latest` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `big` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `trending` tinyint(1) NOT NULL DEFAULT '0',
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_date` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `whole_sell_qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `whole_sell_discount` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `product_type`, `affiliate_link`, `user_id`, `category_id`, `subcategory_id`, `childcategory_id`, `name`, `slug`, `photo`, `thumbnail`, `file`, `size`, `size_qty`, `size_price`, `color`, `price`, `previous_price`, `details`, `stock`, `policy`, `status`, `views`, `tags`, `features`, `colors`, `product_condition`, `ship`, `is_meta`, `meta_tag`, `meta_description`, `youtube`, `type`, `license`, `license_qty`, `link`, `platform`, `region`, `licence_type`, `measure`, `featured`, `best`, `top`, `hot`, `latest`, `big`, `trending`, `sale`, `created_at`, `updated_at`, `is_discount`, `discount_date`, `whole_sell_qty`, `whole_sell_discount`) VALUES
(181, '123343561', 'normal', '', 0, 14, 18, 17, 'Ghacem 42.5r', 'ghacem-425r-6dk1818gp', '1618076011yUnH2PkH.png', '1618076011zsy6XVJu.jpg', NULL, '42.5r', '1', '48', '#000000', 48, 47, 'The cement 42.5R are mostly used in the event that requred comressive strength of concrete at 28 days and also for block making', 3000, '<br>', 1, 2, 'Cement', NULL, NULL, 0, NULL, 0, 'Hardware', 'Cement', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, '2021-04-10 19:57:27', '2021-04-15 17:22:52', 0, NULL, NULL, NULL),
(182, '123343562', 'normal', '', 0, 14, 18, 19, 'Dangote 42.5r', 'dangote-425r-qhp182zey', '16180758310M4ZkIxP.png', '1618075831VjJJ0603.jpg', NULL, '42.5r', '1', '50', '#000000', 50, 47, 'The cement 42.5R are mostly used in the event that requred comressive strength of concrete at 28 days and also for block making', 4000, '<br>', 1, 7, 'Cement', NULL, NULL, 0, NULL, 0, 'Hardware', 'Cement', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, '2021-04-10 19:57:27', '2021-04-15 16:43:23', 0, NULL, NULL, NULL),
(183, '123343563', 'normal', '', 0, 14, 18, 17, 'Ghacem 32.5r', 'ghacem-325r-h4k183tml', '16180752318ggSSIfO.png', '1618075231b4gyRnzP.jpg', NULL, '32.5r', '1', '47', '#000000', 47, 46, 'The cement 32.5R is indicated for application where a high strength is not required at ambient tempreture of (10-15*C) and standard thickness, Plastering work', 2000, '<br>', 1, 3, 'Cement', NULL, NULL, 0, NULL, 0, 'Hardware', 'Cement', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, '2021-04-10 19:57:27', '2021-04-15 13:42:33', 0, NULL, NULL, NULL),
(184, '123343564', 'normal', '', 0, 14, 19, 24, '8mm Iron Rod', '8mm-iron-rod-lrb184iij', '1618074417gpisSObr.png', '1618074417Px8uhOxD.jpg', NULL, '8mm (1 ton)', '1', '2700', '#9c1515', 2700, 3200, 'The materials used for this iron rods is very strong and durable', 100000, '<br>', 1, 11, 'Iron Rod', NULL, NULL, 0, NULL, 0, 'Hardware', 'Iron Rod', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2021-04-10 19:57:27', '2021-04-15 15:39:53', 0, NULL, NULL, NULL),
(185, '123343565', 'normal', '', 0, 14, 19, 24, '10mm Iron Rod', '10mm-iron-rod-umx185wdo', '1618074317PjBnWDtv.png', '1618074317PwYZOrFo.jpg', NULL, '10mm (1 ton)', '0', '4445', '#9c1515', 4445, 4850, 'The materials used for this iron rods is very strong and durable', 19999, '<br>', 1, 10, 'Iron Rod', NULL, NULL, 0, NULL, 0, 'Hardware', 'Iron Rod', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2021-04-10 19:57:27', '2021-04-14 19:59:47', 0, NULL, NULL, NULL),
(186, '123343566', 'normal', '', 0, 14, 19, 24, '11.5mm Iron Rod', '115mm-iron-rod-5pi186fg9', '161807414888ylkdJX.png', '1618074148MJQxScUJ.jpg', NULL, '11.5mm (1 ton)', '1', '5150', '#9c1515', 5150, 5300, 'The materials used for this iron rods is very strong and durable', 30000, '<br>', 1, 2, 'Iron Rod', NULL, NULL, 0, NULL, 0, 'Hardware', 'Iron Rod', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2021-04-10 19:57:27', '2021-04-11 00:16:17', 0, NULL, NULL, NULL),
(187, '123343567', 'normal', '', 0, 14, 19, 24, '12mm Iron Rod', '12mm-iron-rod-qs6187lbs', '1618074001acmWome5.png', '1618074001HrZ7ZZMt.jpg', NULL, '12mm (1 ton)', '1', '5150', '#9c1515', 5150, 5300, 'The materials used for this iron rods is very strong and durable', 30000, '<br>', 1, 4, 'Iron Rod', NULL, NULL, 0, NULL, 0, 'Hardware', 'Iron Rod', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2021-04-10 19:57:27', '2021-04-11 12:01:30', 0, NULL, NULL, NULL),
(188, '123343568', 'normal', '', 0, 14, 19, 24, '14mm Iron Rod', '14mm-iron-rod-xsi1887jd', '1618073848SwigznKG.png', '16180738490F1vKMDb.jpg', NULL, '14mm (1 ton)', '0', '5150', '#9c1515', 5150, 5300, 'The materials used for this iron rods is very strong and durable', 29998, '<br>', 1, 5, 'Iron Rod', NULL, NULL, 0, NULL, 0, 'Hardware', 'Iron Rod', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2021-04-10 19:57:27', '2021-04-15 15:54:02', 0, NULL, NULL, NULL),
(189, '123343569', 'normal', '', 0, 14, 19, 24, '16mm Iron Rod', '16mm-iron-rod-leb189hmg', '1618073745LEwwsvD9.png', '1618073746yx8K29HE.jpg', NULL, '16mm (1 ton)', '1', '4150', '#9c1515', 4150, 4500, 'The materials used for this iron rods is very strong and durable', 30000, '<br>', 1, 3, 'Iron Rod', NULL, NULL, 0, NULL, 0, 'Hardware', 'Iron Rod', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2021-04-10 19:57:27', '2021-04-15 14:01:49', 0, NULL, NULL, NULL),
(190, '123343570', 'normal', '', 0, 14, 19, 24, '18mm Iron Rod', '18mm-iron-rod-99r190yqn', '1618073646tDidr4JG.png', '1618073646hgGuxthU.jpg', NULL, '18mm (1 ton)', '1', '5250', '#9c1515', 5250, 5400, 'The materials used for this iron rods is very strong and durable', 30000, '<br>', 1, 1, 'Iron Rod', NULL, NULL, 0, NULL, 0, 'Hardware', 'Iron Rod', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2021-04-10 19:57:27', '2021-04-10 22:44:07', 0, NULL, NULL, NULL),
(191, '123343571', 'normal', '', 0, 14, 19, 24, '20mm Iron Rod (Local)', '20mm-iron-rod-wx5191iv2', '1618073459xGHfr2zI.png', '1618073459IRHPDXE7.jpg', NULL, '20mm - 1ton,20mm - 0.5ton,20mm - 1pc', '1,1,1', '5150,2575,100', '#9c1515', 5150, 5300, 'The materials used for this iron rods is very strong and durable', 30000, '<br>', 1, 62, 'Iron Rod', NULL, NULL, 0, NULL, 0, 'Hardware', 'Iron Rod', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2021-04-10 19:57:27', '2021-04-15 15:54:13', 0, NULL, NULL, NULL),
(192, '123343572', 'normal', '', 0, 4, 27, 22, 'TCL 32 inch TV', 'tcl-32-inch-tv-hdb192swd', '', NULL, NULL, '32 inch', '1pcs', '4.5kg', '#24f015', 900, 999, 'This television comes with an HD, HDR, inbuilt satellite decoder, USB Playback, slim design, nature light engine', 100, '', 0, 0, 'TV', NULL, NULL, 0, NULL, 0, 'Electronics', 'TV', '', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-04-10 19:57:27', '2021-04-10 20:43:56', 0, NULL, NULL, NULL),
(193, '123343573', 'normal', '', 0, 4, 27, 22, 'TCL 32 inch TV', 'tcl-32-inch-tv-7hj193fim', '1618073349fJbrNu7R.png', '1618073349GNYhIyxi.jpg', NULL, '32\" (720),32 \" (1080),32 \" (4K)', '1,1,1', '1200,1250,1300', '#24f015', 1200, 1300, 'This is a smart android TV Full HD, Netflix Certified,You TUB,Google play store Chromecast built-in Bluetooth', 100, '<br>', 1, 5, 'TV', NULL, NULL, 0, NULL, 0, 'Electronics', 'TV', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 1, 0, 0, 0, '2021-04-10 19:57:27', '2021-04-15 15:55:49', 1, '04/30/2021', NULL, NULL),
(194, '123343574', 'normal', '', 0, 4, 27, 22, 'TCL 40 inch TV', 'tcl-40-inch-tv-wgg194hbx', '', NULL, NULL, '40 inch', '1pcs', '5.0kg', '#24f015', 1550, 1700, 'This television comes with an HD,HDR, inbuilt satellite decoder, USB Playback, slim design, nature light engine', 100, '', 0, 0, 'TV', NULL, NULL, 0, NULL, 0, 'Electronics', 'TV', '', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-04-10 19:57:27', '2021-04-11 11:11:45', 0, NULL, NULL, NULL),
(195, '123343575', 'normal', '', 0, 4, 27, 22, 'TCL 40 inch TV', 'tcl-40-inch-tv-aqm195c5q', '1618072897eEwpzPCI.png', '16180728972N8O5Qew.jpg', NULL, '40inch', '0', '1690', '#24f015', 1690, 1800, 'This is a Smart android TV Full HD, Netflix Certified,You TUB,Google play store Chromecast built-in Bluetooth', 99, '<br>', 1, 6, 'TV', NULL, NULL, 0, NULL, 0, 'Electronics', 'TV', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 1, 0, 0, 0, '2021-04-10 19:57:27', '2021-04-15 17:43:11', 1, '04/30/2021', NULL, NULL),
(196, '123343576', 'normal', '', 0, 4, 27, 22, 'TCL 43 inch TV', 'tcl-43-inch-tv-q1k196rte', '1618072573F4d01jsz.png', '161807257392lU3qZ1.jpg', NULL, '43inch', '1', '2640', '#24f015', 2640, 2844, 'This is a Smart android TV Full HD, Netflix Certified,You TUB,Google play store Chromecast built-in Bluetooth', 100, '<br>', 1, 1, 'TV', NULL, NULL, 0, NULL, 0, 'Electronics', 'TV', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 1, 0, 0, 0, '2021-04-10 19:57:27', '2021-04-14 18:45:09', 1, '04/30/2021', NULL, NULL),
(197, '123343577', 'normal', '', 0, 4, 27, 22, 'TCL 55 inch TV', 'tcl-55-inch-tv-jn81972tx', '1618072298pezRTL3b.png', '1618072298vJGBkWAn.jpg', NULL, '55inch', '1', '3750', '#24f015', 3750, 4020, 'This is a 4K Smart Android TV Full HD, Netflix Certified,You TUB,Google play store Chromecast built-in Bluetooth', 50, '<br>', 1, 0, 'TV', NULL, NULL, 0, NULL, 0, 'Electronics', 'TV', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, '2021-04-10 19:57:27', '2021-04-14 18:44:35', 1, '04/30/2021', NULL, NULL),
(198, '123343578', 'normal', '', 0, 4, 27, 22, 'TCL 65 inch TV', 'tcl-65-inch-tv-yn0198gpt', '16180712788Set90Xk.png', '1618071278ajAnl4Xs.jpg', NULL, '65inch', '1', '5850', '#24f015', 5850, 6480, 'This is a 4K Smart Android TV Full HD, Netflix Certified,You TUB,Google play store Chromecast built-in Bluetooth', 30, '<br>', 1, 2, 'TV', NULL, NULL, 0, NULL, 0, 'Electronics', 'TV', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 1, 0, '2021-04-10 19:57:27', '2021-04-14 18:44:07', 1, '04/30/2021', NULL, NULL),
(199, '123343579', 'normal', '', 0, 17, 45, 23, '1.5 HP, Air Conditioner', '15-hp-air-conditioner-zql199muk', '1618070409bsMIIKbv.png', '16180704101eDJTRN4.jpg', NULL, '1.5 HP,2.0 HP,2.5 HP,3.0 HP', '0,1,1,1', '1699,1800,1900,2050', '#050bc2', 1699, 1899, 'Energy efficient,(3stare rating) Auto power protection Quite Opperation LED Display Fashinable Design, Golden Fin', 149, '<br>', 1, 9, 'AC', NULL, NULL, 0, NULL, 0, 'Electronics', 'AC', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 1, 0, '2021-04-10 19:57:27', '2021-04-15 15:45:08', 1, '04/30/2021', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_clicks`
--

CREATE TABLE `product_clicks` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_clicks`
--

INSERT INTO `product_clicks` (`id`, `product_id`, `date`) VALUES
(1009, 184, '2021-04-10'),
(1010, 184, '2021-04-10'),
(1011, 184, '2021-04-10'),
(1012, 185, '2021-04-10'),
(1013, 185, '2021-04-10'),
(1014, 185, '2021-04-10'),
(1015, 183, '2021-04-10'),
(1016, 198, '2021-04-10'),
(1017, 199, '2021-04-10'),
(1018, 185, '2021-04-10'),
(1019, 195, '2021-04-10'),
(1020, 195, '2021-04-10'),
(1021, 188, '2021-04-10'),
(1022, 188, '2021-04-10'),
(1023, 187, '2021-04-10'),
(1024, 184, '2021-04-10'),
(1025, 182, '2021-04-10'),
(1026, 193, '2021-04-10'),
(1027, 195, '2021-04-10'),
(1028, 195, '2021-04-10'),
(1029, 195, '2021-04-10'),
(1030, 187, '2021-04-10'),
(1031, 182, '2021-04-10'),
(1032, 182, '2021-04-10'),
(1033, 182, '2021-04-10'),
(1034, 184, '2021-04-10'),
(1035, 185, '2021-04-10'),
(1036, 185, '2021-04-10'),
(1037, 188, '2021-04-10'),
(1038, 187, '2021-04-10'),
(1039, 186, '2021-04-10'),
(1040, 191, '2021-04-10'),
(1041, 190, '2021-04-10'),
(1042, 184, '2021-04-10'),
(1043, 189, '2021-04-10'),
(1044, 184, '2021-04-10'),
(1045, 186, '2021-04-10'),
(1046, 183, '2021-04-10'),
(1047, 182, '2021-04-10'),
(1048, 185, '2021-04-11'),
(1049, 185, '2021-04-11'),
(1050, 187, '2021-04-11'),
(1051, 184, '2021-04-13'),
(1052, 184, '2021-04-13'),
(1053, 198, '2021-04-14'),
(1054, 196, '2021-04-14'),
(1055, 185, '2021-04-14'),
(1056, 185, '2021-04-14'),
(1057, 193, '2021-04-14'),
(1058, 193, '2021-04-14'),
(1059, 193, '2021-04-14'),
(1060, 191, '2021-04-14'),
(1061, 191, '2021-04-14'),
(1062, 191, '2021-04-14'),
(1063, 191, '2021-04-14'),
(1064, 191, '2021-04-14'),
(1065, 191, '2021-04-14'),
(1066, 191, '2021-04-14'),
(1067, 191, '2021-04-14'),
(1068, 191, '2021-04-14'),
(1069, 191, '2021-04-14'),
(1070, 191, '2021-04-14'),
(1071, 191, '2021-04-14'),
(1072, 191, '2021-04-14'),
(1073, 191, '2021-04-14'),
(1074, 191, '2021-04-14'),
(1075, 191, '2021-04-14'),
(1076, 191, '2021-04-14'),
(1077, 191, '2021-04-14'),
(1078, 191, '2021-04-14'),
(1079, 191, '2021-04-14'),
(1080, 191, '2021-04-14'),
(1081, 191, '2021-04-14'),
(1082, 191, '2021-04-14'),
(1083, 191, '2021-04-14'),
(1084, 191, '2021-04-14'),
(1085, 191, '2021-04-14'),
(1086, 191, '2021-04-14'),
(1087, 191, '2021-04-14'),
(1088, 191, '2021-04-14'),
(1089, 191, '2021-04-14'),
(1090, 191, '2021-04-14'),
(1091, 191, '2021-04-14'),
(1092, 191, '2021-04-14'),
(1093, 191, '2021-04-14'),
(1094, 191, '2021-04-14'),
(1095, 191, '2021-04-14'),
(1096, 191, '2021-04-14'),
(1097, 191, '2021-04-14'),
(1098, 191, '2021-04-14'),
(1099, 191, '2021-04-14'),
(1100, 191, '2021-04-14'),
(1101, 191, '2021-04-14'),
(1102, 191, '2021-04-14'),
(1103, 191, '2021-04-14'),
(1104, 191, '2021-04-14'),
(1105, 191, '2021-04-14'),
(1106, 191, '2021-04-14'),
(1107, 191, '2021-04-14'),
(1108, 191, '2021-04-14'),
(1109, 191, '2021-04-14'),
(1110, 191, '2021-04-14'),
(1111, 191, '2021-04-14'),
(1112, 191, '2021-04-14'),
(1113, 191, '2021-04-14'),
(1114, 191, '2021-04-14'),
(1115, 191, '2021-04-14'),
(1116, 191, '2021-04-14'),
(1117, 191, '2021-04-14'),
(1118, 199, '2021-04-14'),
(1119, 191, '2021-04-14'),
(1120, 199, '2021-04-14'),
(1121, 199, '2021-04-14'),
(1122, 199, '2021-04-14'),
(1123, 199, '2021-04-14'),
(1124, 199, '2021-04-14'),
(1125, 199, '2021-04-14'),
(1126, 182, '2021-04-14'),
(1127, 184, '2021-04-14'),
(1128, 189, '2021-04-15'),
(1129, 183, '2021-04-15'),
(1130, 189, '2021-04-15'),
(1131, 188, '2021-04-15'),
(1132, 191, '2021-04-15'),
(1133, 184, '2021-04-15'),
(1134, 199, '2021-04-15'),
(1135, 188, '2021-04-15'),
(1136, 191, '2021-04-15'),
(1137, 193, '2021-04-15'),
(1138, 195, '2021-04-15'),
(1139, 182, '2021-04-15'),
(1140, 181, '2021-04-15'),
(1141, 181, '2021-04-15');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rating` tinyint(4) NOT NULL,
  `review_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `user_id`, `product_id`, `review`, `rating`, `review_date`) VALUES
(1, 22, 92, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(3, 22, 93, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(5, 22, 95, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(6, 22, 96, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(7, 22, 97, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(8, 22, 98, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(9, 22, 99, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(10, 22, 100, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(11, 22, 101, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(12, 22, 102, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(13, 22, 103, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(14, 22, 104, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(15, 22, 105, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(16, 22, 106, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(17, 22, 107, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(18, 22, 108, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(19, 22, 109, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(21, 22, 111, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(22, 22, 112, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(49, 22, 113, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(50, 22, 114, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(51, 22, 115, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(52, 22, 116, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(53, 22, 117, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(54, 22, 118, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(55, 22, 119, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(56, 22, 120, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(57, 22, 121, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(58, 22, 122, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(59, 22, 123, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(60, 22, 124, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(61, 22, 125, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(62, 22, 126, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(63, 22, 127, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(64, 22, 128, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(65, 22, 129, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(66, 22, 130, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00'),
(67, 22, 131, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-09-05 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `comment_id` int(10) UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seotools`
--

CREATE TABLE `seotools` (
  `id` int(10) UNSIGNED NOT NULL,
  `google_analytics` text COLLATE utf8mb4_unicode_ci,
  `meta_keys` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seotools`
--

INSERT INTO `seotools` (`id`, `google_analytics`, `meta_keys`) VALUES
(1, '<!-- Global site tag (gtag.js) - Google Analytics -->\r\n<script async src=\"https://www.googletagmanager.com/gtag/js?id=G-JKCM1RH5BP\"></script>\r\n<script>\r\n window.dataLayer = window.dataLayer || [];\r\n function gtag(){dataLayer.push(arguments);}\r\n gtag(\'js\', new Date());\r\n\r\n gtag(\'config\', \'G-JKCM1RH5BP\');\r\n</script>', 'nndsfsdfdsfasxsd,dsefef');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `user_id`, `title`, `details`, `photo`) VALUES
(2, 0, 'FREE SHIPPING', 'Free Shipping All Order', '1561348133service1.png'),
(3, 0, 'PAYMENT METHOD', 'Secure Payment', '1561348138service2.png'),
(4, 0, '30 DAY RETURNS', '30-Day Return Policy', '1561348143service3.png'),
(5, 0, 'HELP CENTER', '24/7 Support System', '1561348147service4.png'),
(6, 13, 'FREE SHIPPING', 'Free Shipping All Order', '1563247602brand1.png'),
(7, 13, 'PAYMENT METHOD', 'Secure Payment', '1563247614brand2.png'),
(8, 13, '30 DAY RETURNS', '30-Day Return Policy', '1563247620brand3.png'),
(9, 13, 'HELP CENTER', '24/7 Support System', '1563247670brand4.png');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `title` text,
  `subtitle` text,
  `price` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `user_id`, `title`, `subtitle`, `price`) VALUES
(1, 0, 'Free Delivery', '(10 - 12 days)', 0),
(2, 0, 'Express Delivery', '(3 - 5 days)', 10);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `subtitle_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `subtitle_size` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_anime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `title_size` varchar(50) DEFAULT NULL,
  `title_color` varchar(50) DEFAULT NULL,
  `title_anime` varchar(50) DEFAULT NULL,
  `details_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details_size` varchar(50) DEFAULT NULL,
  `details_color` varchar(50) DEFAULT NULL,
  `details_anime` varchar(50) DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `subtitle_text`, `subtitle_size`, `subtitle_color`, `subtitle_anime`, `title_text`, `title_size`, `title_color`, `title_anime`, `details_text`, `details_size`, `details_color`, `details_anime`, `photo`, `position`, `link`) VALUES
(8, 'World Fashion', '20', '#ffffff', 'slideInUp', 'Get Up to 40% Off', '30', '#ffffff', 'slideInDown', 'Highlight your personality  and look with these exquisite fashion.', '16', '#ffffff', 'slideInRight', '1564224870012.jpg', 'slide-three', 'https://www.google.com/'),
(9, 'World Fashion', '20', '#ffffff', 'slideInUp', 'Get Up to 40% Off', '30', '#ffffff', 'slideInDown', 'Highlight your personality  and look with these fabulous fashion.', '16', '#ffffff', 'slideInDown', '156422490902.jpg', 'slide-one', 'https://www.google.com/');

-- --------------------------------------------------------

--
-- Table structure for table `socialsettings`
--

CREATE TABLE `socialsettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gplus` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dribble` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_status` tinyint(4) NOT NULL DEFAULT '1',
  `g_status` tinyint(4) NOT NULL DEFAULT '1',
  `t_status` tinyint(4) NOT NULL DEFAULT '1',
  `l_status` tinyint(4) NOT NULL DEFAULT '1',
  `d_status` tinyint(4) NOT NULL DEFAULT '1',
  `f_check` tinyint(4) DEFAULT NULL,
  `g_check` tinyint(4) DEFAULT NULL,
  `fclient_id` text COLLATE utf8mb4_unicode_ci,
  `fclient_secret` text COLLATE utf8mb4_unicode_ci,
  `fredirect` text COLLATE utf8mb4_unicode_ci,
  `gclient_id` text COLLATE utf8mb4_unicode_ci,
  `gclient_secret` text COLLATE utf8mb4_unicode_ci,
  `gredirect` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `socialsettings`
--

INSERT INTO `socialsettings` (`id`, `facebook`, `gplus`, `twitter`, `linkedin`, `dribble`, `f_status`, `g_status`, `t_status`, `l_status`, `d_status`, `f_check`, `g_check`, `fclient_id`, `fclient_secret`, `fredirect`, `gclient_id`, `gclient_secret`, `gredirect`) VALUES
(1, 'https://www.facebook.com/', 'https://plus.google.com/', 'https://twitter.com/', 'https://www.linkedin.com/', 'https://dribbble.com/', 1, 1, 1, 1, 1, 1, 1, '503140663460329', 'f66cd670ec43d14209a2728af26dcc43', 'https://localhost/upgraded/royalcommerce/auth/facebook/callback', '904681031719-sh1aolu42k7l93ik0bkiddcboghbpcfi.apps.googleusercontent.com', 'yGBWmUpPtn5yWhDAsXnswEX3', 'http://localhost/upgraded/royalcommerce/auth/google/callback');

-- --------------------------------------------------------

--
-- Table structure for table `social_providers`
--

CREATE TABLE `social_providers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `name`, `slug`, `status`) VALUES
(18, 14, 'Cement', 'cement', 1),
(19, 14, 'Iron Rods', 'iron-rods', 1),
(20, 14, 'Steel', 'steel', 1),
(21, 14, 'Wood', 'wood', 1),
(22, 14, 'Stone', 'stone', 1),
(23, 14, 'Glass', 'glass', 1),
(24, 14, 'Sand', 'sand', 1),
(25, 14, 'Textile', 'textile', 1),
(26, 14, 'Plastic', 'plastic', 1),
(27, 4, 'Television', 'tv', 1),
(28, 4, 'Camera', 'camera', 1),
(29, 4, 'Radio', 'radio', 1),
(30, 4, 'Smart Phone', 'smart-phone', 1),
(31, 4, 'Smart-TV', 'smart-tv', 1),
(32, 4, 'Laptop', 'laptop', 1),
(33, 4, 'Desktop', 'desktop', 1),
(34, 4, 'Ceiling Fan', 'ceiling-fan', 1),
(35, 11, 'Pencil', 'pencil', 1),
(36, 11, 'A4 Sheet', 'a4-sheet', 1),
(37, 11, 'Pen', 'pen', 1),
(38, 11, 'Stapler', 'stapler', 1),
(39, 11, 'Eraser', 'eraser', 1),
(40, 11, 'Push-pin', 'push-pin', 1),
(41, 11, 'Paper Clip', 'paper-clip', 1),
(42, 11, 'Rubber Stamp', 'rubber-stamp', 1),
(43, 11, 'Highlighter', 'highlighter', 1),
(44, 17, 'Copper wire', 'copper-wire', 1),
(45, 17, 'Air Conditioner', 'air-conditioner', 1),
(46, 17, 'Dishwashers', 'dishwashers', 1),
(47, 17, 'Refrigerators', 'refrigerators', 1),
(48, 17, 'Freezers', 'freezers', 1),
(49, 17, 'Kitchen Stove', 'kitchen-stove', 1),
(50, 17, 'Water Heater', 'water-heater', 1),
(51, 17, 'Microwave Oven', 'microwave-ovens', 1),
(52, 17, 'Induction Cooker', 'induction-cooker', 1),
(53, 17, 'Trash Compactor', 'trash-compactor', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `exttrid` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `service_id` varchar(45) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `currency_code` varchar(45) DEFAULT NULL,
  `currency_value` varchar(45) DEFAULT NULL,
  `mode_of_payment` varchar(45) DEFAULT NULL,
  `redirect_url` longtext,
  `callback_url` longtext,
  `landingPageURL` longtext,
  `status` varchar(45) DEFAULT NULL,
  `responseCode` varchar(45) DEFAULT NULL,
  `responseMessage` varchar(255) DEFAULT NULL,
  `ts` datetime(5) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `exttrid`, `reference`, `service_id`, `amount`, `currency_code`, `currency_value`, `mode_of_payment`, `redirect_url`, `callback_url`, `landingPageURL`, `status`, `responseCode`, `responseMessage`, `ts`, `user_id`, `transaction_id`) VALUES
(1, '74@161848154367313391219', 'caspianoutletsProduct', '1277', '3718', 'GHS', '3718GHS', 'CRM', 'https://payments.anmgw.com/payment?code=dG9rZW49Nzg5MjEwNDE1MTAxMjEwNyZ0cmFuc19pZD03NEAxNjE4NDgxNTQzNjczMTMzOTEyMTkmcGF5bWVudF9tb2RlPUNSTQ====', 'https://coutlet.com/api/callBackMoMoANDCard', 'https://coutlet.com/checkout/payment/return', '0', '000', 'Passed', '2021-04-15 10:12:23.00000', '74', NULL),
(2, '74@161848213571643926769', 'caspianoutletsProduct', '1277', '3718', 'GHS', '3718GHS', 'CRM', 'https://payments.anmgw.com/payment?code=dG9rZW49NDEzMjEwNDE1MTAyMjQ3OCZ0cmFuc19pZD03NEAxNjE4NDgyMTM1NzE2NDM5MjY3NjkmcGF5bWVudF9tb2RlPUNSTQ====', 'https://coutlet.com/api/callBackMoMoANDCard', 'https://coutlet.com/checkout/payment/return', '0', '000', 'Passed', '2021-04-15 10:22:15.00000', '74', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_provider` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `verification_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email_verified` enum('Yes','No') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `affilate_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `affilate_income` double NOT NULL DEFAULT '0',
  `current_balance` double NOT NULL DEFAULT '0',
  `ban` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `photo`, `zip`, `city`, `country`, `address`, `phone`, `fax`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `is_provider`, `status`, `verification_link`, `email_verified`, `affilate_code`, `affilate_income`, `current_balance`, `ban`) VALUES
(78, 'Rapheal Djane Kotei', NULL, NULL, NULL, NULL, 'Stadium Junction', '0555442117', NULL, 'rkotei@gctu.edu.gh', '$2y$10$y49/ZZXDvytjWDNhGOk7Q.S/kMSXgMJVaD3JPvxix1dxTy.q9r/Ry', NULL, '2021-04-15 17:42:15', '2021-04-15 17:42:40', 0, 0, '9738eb74ef2c116cecddfa5f5b461c87', 'Yes', '18b3ca181039ce10eeb526ebf2b5c632', 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_languages`
--
ALTER TABLE `admin_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_user_conversations`
--
ALTER TABLE `admin_user_conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_user_messages`
--
ALTER TABLE `admin_user_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `childcategories`
--
ALTER TABLE `childcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `featured_banners`
--
ALTER TABLE `featured_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `featured_links`
--
ALTER TABLE `featured_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `generalsettings`
--
ALTER TABLE `generalsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_tracks`
--
ALTER TABLE `order_tracks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagesettings`
--
ALTER TABLE `pagesettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickups`
--
ALTER TABLE `pickups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `products` ADD FULLTEXT KEY `name` (`name`);

--
-- Indexes for table `product_clicks`
--
ALTER TABLE `product_clicks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seotools`
--
ALTER TABLE `seotools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialsettings`
--
ALTER TABLE `socialsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_providers`
--
ALTER TABLE `social_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_languages`
--
ALTER TABLE `admin_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_user_conversations`
--
ALTER TABLE `admin_user_conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_user_messages`
--
ALTER TABLE `admin_user_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `childcategories`
--
ALTER TABLE `childcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `counters`
--
ALTER TABLE `counters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `featured_banners`
--
ALTER TABLE `featured_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `featured_links`
--
ALTER TABLE `featured_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `generalsettings`
--
ALTER TABLE `generalsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `order_tracks`
--
ALTER TABLE `order_tracks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pagesettings`
--
ALTER TABLE `pagesettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pickups`
--
ALTER TABLE `pickups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `product_clicks`
--
ALTER TABLE `product_clicks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1142;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seotools`
--
ALTER TABLE `seotools`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `socialsettings`
--
ALTER TABLE `socialsettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_providers`
--
ALTER TABLE `social_providers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
