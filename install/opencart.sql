-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2012 年 06 月 11 日 22:57
-- 服务器版本: 5.0.91
-- PHP 版本: 5.2.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `cn1531`
--

-- --------------------------------------------------------

--
-- 表的结构 `oc_address`
--

DROP TABLE IF EXISTS `oc_address`;
CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL auto_increment,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) collate utf8_bin NOT NULL default '',
  `lastname` varchar(32) collate utf8_bin NOT NULL default '',
  `company` varchar(32) collate utf8_bin NOT NULL,
  `company_id` varchar(32) collate utf8_bin NOT NULL,
  `tax_id` varchar(32) collate utf8_bin NOT NULL,
  `address_1` varchar(128) collate utf8_bin NOT NULL,
  `address_2` varchar(128) collate utf8_bin NOT NULL,
  `city` varchar(128) collate utf8_bin NOT NULL,
  `postcode` varchar(10) collate utf8_bin NOT NULL,
  `country_id` int(11) NOT NULL default '0',
  `zone_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_address`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_affiliate`
--

DROP TABLE IF EXISTS `oc_affiliate`;
CREATE TABLE `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL auto_increment,
  `firstname` varchar(32) collate utf8_bin NOT NULL default '',
  `lastname` varchar(32) collate utf8_bin NOT NULL default '',
  `email` varchar(96) collate utf8_bin NOT NULL default '',
  `telephone` varchar(32) collate utf8_bin NOT NULL default '',
  `fax` varchar(32) collate utf8_bin NOT NULL default '',
  `password` varchar(40) collate utf8_bin NOT NULL default '',
  `company` varchar(32) collate utf8_bin NOT NULL,
  `website` varchar(255) collate utf8_bin NOT NULL,
  `address_1` varchar(128) collate utf8_bin NOT NULL default '',
  `address_2` varchar(128) collate utf8_bin NOT NULL,
  `city` varchar(128) collate utf8_bin NOT NULL default '',
  `postcode` varchar(10) collate utf8_bin NOT NULL default '',
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) collate utf8_bin NOT NULL,
  `commission` decimal(4,2) NOT NULL default '0.00',
  `tax` varchar(64) collate utf8_bin NOT NULL,
  `payment` varchar(6) collate utf8_bin NOT NULL,
  `cheque` varchar(100) collate utf8_bin NOT NULL default '',
  `paypal` varchar(64) collate utf8_bin NOT NULL default '',
  `bank_name` varchar(64) collate utf8_bin NOT NULL default '',
  `bank_branch_number` varchar(64) collate utf8_bin NOT NULL default '',
  `bank_swift_code` varchar(64) collate utf8_bin NOT NULL default '',
  `bank_account_name` varchar(64) collate utf8_bin NOT NULL default '',
  `bank_account_number` varchar(64) collate utf8_bin NOT NULL default '',
  `ip` varchar(15) collate utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_affiliate`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_affiliate_transaction`
--

DROP TABLE IF EXISTS `oc_affiliate_transaction`;
CREATE TABLE `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL auto_increment,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text collate utf8_bin NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_affiliate_transaction`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_attribute`
--

DROP TABLE IF EXISTS `oc_attribute`;
CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL auto_increment,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`attribute_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- 表的结构 `oc_attribute_description`
--

DROP TABLE IF EXISTS `oc_attribute_description`;
CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8'),
(3, 1, 'Clockspeed');

-- --------------------------------------------------------

--
-- 表的结构 `oc_attribute_group`
--

DROP TABLE IF EXISTS `oc_attribute_group`;
CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL auto_increment,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`attribute_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- 表的结构 `oc_attribute_group_description`
--

DROP TABLE IF EXISTS `oc_attribute_group_description`;
CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor');

-- --------------------------------------------------------

--
-- 表的结构 `oc_banner`
--

DROP TABLE IF EXISTS `oc_banner`;
CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) collate utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY  (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'Samsung Tab', 1),
(8, 'Manufacturers', 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_banner_image`
--

DROP TABLE IF EXISTS `oc_banner_image`;
CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL auto_increment,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) collate utf8_bin NOT NULL,
  `image` varchar(255) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`banner_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`) VALUES
(78, 7, 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'data/samsung_banner.jpg'),
(79, 6, '/index.php?route=product/manufacturer/product&amp;manufacturer_id=7', 'data/hp_banner.jpg'),
(85, 8, '/index.php?route=product/manufacturer/product&amp;manufacturer_id=7', 'data/hp_logo.jpg'),
(84, 8, '/index.php?route=product/manufacturer/product&amp;manufacturer_id=6', 'data/palm_logo.jpg'),
(83, 8, '/index.php?route=product/manufacturer/product&amp;manufacturer_id=10', 'data/sony_logo.jpg'),
(82, 8, '/index.php?route=product/manufacturer/product&amp;manufacturer_id=9', 'data/canon_logo.jpg'),
(81, 8, '/index.php?route=product/manufacturer/product&amp;manufacturer_id=8', 'data/apple_logo.jpg'),
(80, 8, '/index.php?route=product/manufacturer/product&amp;manufacturer_id=5', 'data/htc_logo.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `oc_banner_image_description`
--

DROP TABLE IF EXISTS `oc_banner_image_description`;
CREATE TABLE `oc_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_banner_image_description`
--

INSERT INTO `oc_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(78, 1, 7, 'Samsung Tab'),
(79, 1, 6, 'HP Products'),
(85, 1, 8, 'HP'),
(84, 1, 8, 'PALM'),
(83, 1, 8, 'SONY'),
(82, 1, 8, 'CANON'),
(81, 1, 8, 'APPLE'),
(80, 1, 8, 'HTC');

-- --------------------------------------------------------

--
-- 表的结构 `oc_category`
--

DROP TABLE IF EXISTS `oc_category`;
CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL auto_increment,
  `image` varchar(255) collate utf8_bin default NULL,
  `parent_id` int(11) NOT NULL default '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL default '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(25, '', 0, 1, 1, 3, 1, '2009-01-31 01:04:25', '2011-09-21 17:15:10'),
(27, '', 20, 0, 0, 2, 1, '2009-01-31 01:55:34', '2011-09-21 17:12:16'),
(20, 'data/compaq_presario.jpg', 0, 1, 1, 1, 1, '2009-01-05 21:49:43', '2011-09-21 17:11:14'),
(24, '', 0, 1, 1, 5, 1, '2009-01-20 02:36:26', '2011-09-21 17:18:24'),
(18, 'data/hp_2.jpg', 0, 1, 0, 2, 1, '2009-01-05 21:49:15', '2011-09-21 17:13:22'),
(17, '', 0, 1, 1, 4, 1, '2009-01-03 21:08:57', '2011-09-21 17:19:27'),
(28, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:12', '2011-09-21 17:16:55'),
(26, '', 20, 0, 0, 1, 1, '2009-01-31 01:55:14', '2010-08-22 06:31:45'),
(29, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:37', '2011-09-21 17:15:28'),
(30, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:59', '2011-09-21 17:15:56'),
(31, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:24', '2011-09-21 17:16:29'),
(32, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:34', '2011-09-21 17:17:25'),
(33, '', 0, 1, 1, 6, 1, '2009-02-03 14:17:55', '2011-09-21 17:18:44'),
(34, 'data/ipod_touch_4.jpg', 0, 1, 4, 7, 1, '2009-02-03 14:18:11', '2011-09-21 17:18:58'),
(35, '', 28, 0, 0, 0, 1, '2010-09-17 10:06:48', '2010-09-18 14:02:42'),
(36, '', 28, 0, 0, 0, 1, '2010-09-17 10:07:13', '2010-09-18 14:02:55'),
(37, '', 34, 0, 0, 0, 1, '2010-09-18 14:03:39', '2011-04-22 01:55:08'),
(38, '', 34, 0, 0, 0, 1, '2010-09-18 14:03:51', '2010-09-18 14:03:51'),
(39, '', 34, 0, 0, 0, 1, '2010-09-18 14:04:17', '2011-04-22 01:55:20'),
(40, '', 34, 0, 0, 0, 1, '2010-09-18 14:05:36', '2010-09-18 14:05:36'),
(41, '', 34, 0, 0, 0, 1, '2010-09-18 14:05:49', '2011-04-22 01:55:30'),
(42, '', 34, 0, 0, 0, 1, '2010-09-18 14:06:34', '2010-11-07 20:31:04'),
(43, '', 34, 0, 0, 0, 1, '2010-09-18 14:06:49', '2011-04-22 01:55:40'),
(44, '', 34, 0, 0, 0, 1, '2010-09-21 15:39:21', '2010-11-07 20:30:55'),
(45, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:16', '2011-09-21 17:14:04'),
(46, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:31', '2011-09-21 17:13:54'),
(47, '', 34, 0, 0, 0, 1, '2010-11-07 11:13:16', '2010-11-07 11:13:16'),
(48, '', 34, 0, 0, 0, 1, '2010-11-07 11:13:33', '2010-11-07 11:13:33'),
(49, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:04', '2010-11-07 11:14:04'),
(50, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:23', '2011-04-22 01:16:01'),
(51, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:38', '2011-04-22 01:16:13'),
(52, '', 34, 0, 0, 0, 1, '2010-11-07 11:16:09', '2011-04-22 01:54:57'),
(53, '', 34, 0, 0, 0, 1, '2010-11-07 11:28:53', '2011-04-22 01:14:36'),
(54, '', 34, 0, 0, 0, 1, '2010-11-07 11:29:16', '2011-04-22 01:16:50'),
(55, '', 34, 0, 0, 0, 1, '2010-11-08 10:31:32', '2010-11-08 10:31:32'),
(56, '', 34, 0, 0, 0, 1, '2010-11-08 10:31:50', '2011-04-22 01:16:37'),
(57, '', 0, 1, 1, 3, 1, '2011-04-26 08:53:16', '2011-09-21 17:14:28'),
(58, '', 52, 0, 0, 0, 1, '2011-05-08 13:44:16', '2011-05-08 13:44:16');

-- --------------------------------------------------------

--
-- 表的结构 `oc_category_description`
--

DROP TABLE IF EXISTS `oc_category_description`;
CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) collate utf8_bin NOT NULL default '',
  `description` text collate utf8_bin NOT NULL,
  `meta_description` varchar(255) collate utf8_bin NOT NULL,
  `meta_keyword` varchar(255) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`) VALUES
(28, 1, '显示器', '', '', ''),
(33, 1, '相机', '', '', ''),
(32, 1, '网络摄像机', '', '', ''),
(31, 1, '扫描仪', '', '', ''),
(30, 1, '打印机', '', '', ''),
(29, 1, '外设', '', '', ''),
(27, 1, '苹果', '', '', ''),
(26, 1, '个人电脑', '', '', ''),
(17, 2, 'Software', '', '', ''),
(25, 1, '零部件', '', '', ''),
(24, 1, '电话及掌上电脑', '', '', ''),
(20, 1, '台式机', '&lt;p&gt;\r\n	举例文本描述&lt;/p&gt;\r\n', '举例描述', ''),
(35, 1, 'test 1', '', '', ''),
(36, 1, 'test 2', '', '', ''),
(37, 1, 'test 5', '', '', ''),
(38, 1, 'test 4', '', '', ''),
(39, 1, 'test 6', '', '', ''),
(40, 1, 'test 7', '', '', ''),
(41, 1, 'test 8', '', '', ''),
(42, 1, 'test 9', '', '', ''),
(43, 1, 'test 11', '', '', ''),
(34, 1, 'MP3播放器', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', '', ''),
(18, 1, '笔记本电脑', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', '', ''),
(44, 1, 'test 12', '', '', ''),
(45, 1, 'Windows', '', '', ''),
(46, 1, 'Macs', '', '', ''),
(47, 1, 'test 15', '', '', ''),
(48, 1, 'test 16', '', '', ''),
(49, 1, 'test 17', '', '', ''),
(50, 1, 'test 18', '', '', ''),
(51, 1, 'test 19', '', '', ''),
(52, 1, 'test 20', '', '', ''),
(53, 1, 'test 21', '', '', ''),
(54, 1, 'test 22', '', '', ''),
(55, 1, 'test 23', '', '', ''),
(56, 1, 'test 24', '', '', ''),
(57, 1, '游戏机', '', '', ''),
(58, 1, 'test 25', '', '', ''),
(20, 2, 'PC', '&lt;p&gt;\r\n	PC&lt;/p&gt;\r\n', 'PC', ''),
(27, 2, 'Apple', '&lt;p&gt;\r\n	Apple&lt;/p&gt;\r\n', 'Apple', ''),
(18, 2, 'Notebook', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'Notebook', ''),
(46, 2, 'Macs', '', '', ''),
(45, 2, 'Windows', '', '', ''),
(57, 2, 'Games', '', '', ''),
(25, 2, 'Parts', '', '', ''),
(29, 2, 'Peripherals', '', '', ''),
(30, 2, 'Printer', '', '', ''),
(31, 2, 'Scanners', '', '', ''),
(28, 2, 'Monitor', '', '', ''),
(32, 2, 'Network Camera', '', '', ''),
(17, 1, '软件', '', '', ''),
(24, 2, 'Phone &amp; PDA', '', '', ''),
(33, 2, 'Camera', '', '', ''),
(34, 2, 'MP3', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_category_to_layout`
--

DROP TABLE IF EXISTS `oc_category_to_layout`;
CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY  (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_category_to_layout`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_category_to_store`
--

DROP TABLE IF EXISTS `oc_category_to_store`;
CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY  (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(17, 0),
(18, 0),
(20, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_country`
--

DROP TABLE IF EXISTS `oc_country`;
CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL auto_increment,
  `name` varchar(128) collate utf8_bin NOT NULL,
  `iso_code_2` varchar(2) collate utf8_bin NOT NULL default '',
  `iso_code_3` varchar(3) collate utf8_bin NOT NULL default '',
  `address_format` text collate utf8_bin NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(44, '中国 ', 'CN', 'CHN', '', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_coupon`
--

DROP TABLE IF EXISTS `oc_coupon`;
CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL auto_increment,
  `name` varchar(128) collate utf8_bin NOT NULL,
  `code` varchar(10) collate utf8_bin NOT NULL,
  `type` char(1) collate utf8_bin NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL default '0000-00-00',
  `date_end` date NOT NULL default '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) collate utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', 10.0000, 0, 0, 0.0000, '2011-01-01', '2012-01-01', 10, '10', 1, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', 0.0000, 0, 1, 100.0000, '2009-03-01', '2009-08-31', 10, '10', 1, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', 10.0000, 0, 0, 10.0000, '1970-11-01', '2020-11-01', 100000, '10000', 1, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- 表的结构 `oc_coupon_history`
--

DROP TABLE IF EXISTS `oc_coupon_history`;
CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL auto_increment,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_coupon_history`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_coupon_product`
--

DROP TABLE IF EXISTS `oc_coupon_product`;
CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL auto_increment,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY  (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_coupon_product`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_currency`
--

DROP TABLE IF EXISTS `oc_currency`;
CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL auto_increment,
  `title` varchar(32) collate utf8_bin NOT NULL default '',
  `code` varchar(3) collate utf8_bin NOT NULL default '',
  `symbol_left` varchar(12) collate utf8_bin NOT NULL,
  `symbol_right` varchar(12) collate utf8_bin NOT NULL,
  `decimal_place` char(1) collate utf8_bin NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, '人民币', 'CNY', '￥', '', '2', 1.00000000, 1, '2010-04-06 22:00:54');

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer`
--

DROP TABLE IF EXISTS `oc_customer`;
CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL auto_increment,
  `store_id` int(11) NOT NULL default '0',
  `firstname` varchar(32) collate utf8_bin NOT NULL default '',
  `lastname` varchar(32) collate utf8_bin NOT NULL default '',
  `email` varchar(96) collate utf8_bin NOT NULL default '',
  `telephone` varchar(32) collate utf8_bin NOT NULL default '',
  `fax` varchar(32) collate utf8_bin NOT NULL default '',
  `password` varchar(40) collate utf8_bin NOT NULL default '',
  `cart` text collate utf8_bin,
  `wishlist` text collate utf8_bin,
  `newsletter` tinyint(1) NOT NULL default '0',
  `address_id` int(11) NOT NULL default '0',
  `customer_group_id` int(11) NOT NULL,
  `ip` varchar(15) collate utf8_bin NOT NULL default '0',
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `token` varchar(255) collate utf8_bin NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_customer`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_group`
--

DROP TABLE IF EXISTS `oc_customer_group`;
CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL auto_increment,
  `approval` int(1) NOT NULL,
  `company_id_display` int(1) NOT NULL,
  `company_id_required` int(1) NOT NULL,
  `tax_id_display` int(1) NOT NULL,
  `tax_id_required` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`customer_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `company_id_display`, `company_id_required`, `tax_id_display`, `tax_id_required`, `sort_order`) VALUES
(1, 0, 1, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_group_description`
--

DROP TABLE IF EXISTS `oc_customer_group_description`;
CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) collate utf8_bin NOT NULL,
  `description` text collate utf8_bin NOT NULL,
  PRIMARY KEY  (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test');

-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_ip`
--

DROP TABLE IF EXISTS `oc_customer_ip`;
CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL auto_increment,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(15) collate utf8_bin NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_customer_ip`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_ip_blacklist`
--

DROP TABLE IF EXISTS `oc_customer_ip_blacklist`;
CREATE TABLE `oc_customer_ip_blacklist` (
  `customer_ip_blacklist_id` int(11) NOT NULL auto_increment,
  `ip` varchar(15) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`customer_ip_blacklist_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_customer_ip_blacklist`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_reward`
--

DROP TABLE IF EXISTS `oc_customer_reward`;
CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL auto_increment,
  `customer_id` int(11) NOT NULL default '0',
  `order_id` int(11) NOT NULL default '0',
  `description` text collate utf8_bin NOT NULL,
  `points` int(8) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_customer_reward`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_customer_transaction`
--

DROP TABLE IF EXISTS `oc_customer_transaction`;
CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL auto_increment,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text collate utf8_bin NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_customer_transaction`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_download`
--

DROP TABLE IF EXISTS `oc_download`;
CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL auto_increment,
  `filename` varchar(128) collate utf8_bin NOT NULL default '',
  `mask` varchar(128) collate utf8_bin NOT NULL default '',
  `remaining` int(11) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_download`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_download_description`
--

DROP TABLE IF EXISTS `oc_download_description`;
CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_download_description`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_extension`
--

DROP TABLE IF EXISTS `oc_extension`;
CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL auto_increment,
  `type` varchar(32) collate utf8_bin NOT NULL,
  `code` varchar(32) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(23, 'payment', 'cod'),
(22, 'total', 'shipping'),
(57, 'total', 'sub_total'),
(58, 'total', 'tax'),
(59, 'total', 'total'),
(410, 'module', 'banner'),
(426, 'module', 'carousel'),
(390, 'total', 'credit'),
(387, 'shipping', 'flat'),
(349, 'total', 'handling'),
(350, 'total', 'low_order_fee'),
(389, 'total', 'coupon'),
(413, 'module', 'category'),
(411, 'module', 'affiliate'),
(408, 'module', 'account'),
(393, 'total', 'reward'),
(398, 'total', 'voucher'),
(407, 'payment', 'free_checkout'),
(427, 'module', 'featured'),
(419, 'module', 'slideshow');

-- --------------------------------------------------------

--
-- 表的结构 `oc_geo_zone`
--

DROP TABLE IF EXISTS `oc_geo_zone`;
CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) collate utf8_bin NOT NULL default '',
  `description` varchar(255) collate utf8_bin NOT NULL default '',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25'),
(4, 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');

-- --------------------------------------------------------

--
-- 表的结构 `oc_information`
--

DROP TABLE IF EXISTS `oc_information`;
CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL auto_increment,
  `bottom` int(1) NOT NULL default '0',
  `sort_order` int(3) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`information_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_information_description`
--

DROP TABLE IF EXISTS `oc_information_description`;
CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) collate utf8_bin NOT NULL default '',
  `description` text collate utf8_bin NOT NULL,
  PRIMARY KEY  (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`) VALUES
(5, 1, '政策&amp; 条款', '&lt;p&gt;\r\n	政策&amp;amp; 条款&lt;/p&gt;\r\n'),
(3, 1, '隐私权声明', '&lt;p&gt;\r\n	隐私权声明&lt;/p&gt;\r\n'),
(4, 1, '关于我们', '&lt;p&gt;\r\n	关于我们&lt;/p&gt;\r\n'),
(4, 2, 'About us', '&lt;p&gt;\r\n	About us&lt;/p&gt;\r\n'),
(5, 2, 'Policy &amp; Terms', '&lt;p&gt;\r\n	&lt;span a=&quot;undefined&quot; c=&quot;4&quot; class=&quot;short_text&quot; closure_uid_agj9tx=&quot;105&quot; id=&quot;result_box&quot; lang=&quot;en&quot;&gt;&lt;span class=&quot;hps&quot; closure_uid_agj9tx=&quot;94&quot;&gt;Policy&lt;/span&gt; &lt;span class=&quot;hps&quot; closure_uid_agj9tx=&quot;95&quot;&gt;&amp;amp;&lt;/span&gt; &lt;span class=&quot;hps&quot; closure_uid_agj9tx=&quot;96&quot;&gt;Terms&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n'),
(3, 2, 'Privacy Statement', '&lt;p&gt;\r\n	&lt;span a=&quot;undefined&quot; c=&quot;4&quot; class=&quot;short_text&quot; closure_uid_agj9tx=&quot;105&quot; id=&quot;result_box&quot; lang=&quot;en&quot;&gt;&lt;span class=&quot;hps&quot; closure_uid_agj9tx=&quot;116&quot;&gt;Privacy&lt;/span&gt; &lt;span class=&quot;hps&quot; closure_uid_agj9tx=&quot;117&quot;&gt;Statement&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n');

-- --------------------------------------------------------

--
-- 表的结构 `oc_information_to_layout`
--

DROP TABLE IF EXISTS `oc_information_to_layout`;
CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY  (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_information_to_layout`
--

INSERT INTO `oc_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(4, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_information_to_store`
--

DROP TABLE IF EXISTS `oc_information_to_store`;
CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY  (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_language`
--

DROP TABLE IF EXISTS `oc_language`;
CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) collate utf8_bin NOT NULL default '',
  `code` varchar(5) collate utf8_bin NOT NULL,
  `locale` varchar(255) collate utf8_bin NOT NULL,
  `image` varchar(64) collate utf8_bin NOT NULL,
  `directory` varchar(32) collate utf8_bin NOT NULL default '',
  `filename` varchar(64) collate utf8_bin NOT NULL default '',
  `sort_order` int(3) NOT NULL default '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY  (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `filename`, `sort_order`, `status`) VALUES
(1, '简体中文', 'zh-CN', 'zh_CN.utf-8,zh-cn,china', 'cn.png', 'zh-CN', 'zh-CN', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_layout`
--

DROP TABLE IF EXISTS `oc_layout`;
CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information');

-- --------------------------------------------------------

--
-- 表的结构 `oc_layout_route`
--

DROP TABLE IF EXISTS `oc_layout_route`;
CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL auto_increment,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(30, 6, 0, 'account'),
(17, 10, 0, 'affiliate/'),
(29, 3, 0, 'product/category'),
(26, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(22, 5, 0, 'product/manufacturer'),
(23, 7, 0, 'checkout/'),
(31, 8, 0, 'information/contact');

-- --------------------------------------------------------

--
-- 表的结构 `oc_length_class`
--

DROP TABLE IF EXISTS `oc_length_class`;
CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL auto_increment,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY  (`length_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, 1.00000000),
(2, 10.00000000),
(3, 0.39370000);

-- --------------------------------------------------------

--
-- 表的结构 `oc_length_class_description`
--

DROP TABLE IF EXISTS `oc_length_class_description`;
CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) collate utf8_bin NOT NULL,
  `unit` varchar(4) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`length_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, '公分', 'cm'),
(2, 1, '公尺', 'mm'),
(3, 1, '英吋', 'in');

-- --------------------------------------------------------

--
-- 表的结构 `oc_manufacturer`
--

DROP TABLE IF EXISTS `oc_manufacturer`;
CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) collate utf8_bin NOT NULL default '',
  `image` varchar(255) collate utf8_bin default NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'data/htc_logo.jpg', 0),
(6, 'Palm', 'data/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'data/hp_logo.jpg', 0),
(8, 'Apple', 'data/apple_logo.jpg', 0),
(9, 'Canon', 'data/canon_logo.jpg', 0),
(10, 'Sony', 'data/sony_logo.jpg', 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_manufacturer_to_store`
--

DROP TABLE IF EXISTS `oc_manufacturer_to_store`;
CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY  (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_option`
--

DROP TABLE IF EXISTS `oc_option`;
CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL auto_increment,
  `type` varchar(32) collate utf8_bin NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 2),
(2, 'checkbox', 3),
(4, 'text', 4),
(5, 'select', 1),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 1),
(12, 'date', 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_option_description`
--

DROP TABLE IF EXISTS `oc_option_description`;
CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, '单选框'),
(2, 1, '复选框'),
(4, 1, '文本'),
(6, 1, '多行文本'),
(8, 1, '日期'),
(7, 1, '文档'),
(5, 1, '选择'),
(9, 1, '时间'),
(10, 1, '日期 &amp; 时间'),
(12, 1, '交货日期'),
(11, 1, '尺寸');

-- --------------------------------------------------------

--
-- 表的结构 `oc_option_value`
--

DROP TABLE IF EXISTS `oc_option_value`;
CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL auto_increment,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) collate utf8_bin NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- 表的结构 `oc_option_value_description`
--

DROP TABLE IF EXISTS `oc_option_value_description`;
CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small');

-- --------------------------------------------------------

--
-- 表的结构 `oc_order`
--

DROP TABLE IF EXISTS `oc_order`;
CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL auto_increment,
  `invoice_no` int(11) NOT NULL default '0',
  `invoice_prefix` varchar(26) collate utf8_bin NOT NULL,
  `store_id` int(11) NOT NULL default '0',
  `store_name` varchar(64) collate utf8_bin NOT NULL,
  `store_url` varchar(255) collate utf8_bin NOT NULL,
  `customer_id` int(11) NOT NULL default '0',
  `customer_group_id` int(11) NOT NULL default '0',
  `firstname` varchar(32) collate utf8_bin NOT NULL default '',
  `lastname` varchar(32) collate utf8_bin NOT NULL,
  `email` varchar(96) collate utf8_bin NOT NULL,
  `telephone` varchar(32) collate utf8_bin NOT NULL default '',
  `fax` varchar(32) collate utf8_bin NOT NULL default '',
  `payment_firstname` varchar(32) collate utf8_bin NOT NULL default '',
  `payment_lastname` varchar(32) collate utf8_bin NOT NULL default '',
  `payment_company` varchar(32) collate utf8_bin NOT NULL,
  `payment_company_id` varchar(32) collate utf8_bin NOT NULL,
  `payment_tax_id` varchar(32) collate utf8_bin NOT NULL,
  `payment_address_1` varchar(128) collate utf8_bin NOT NULL,
  `payment_address_2` varchar(128) collate utf8_bin NOT NULL,
  `payment_city` varchar(128) collate utf8_bin NOT NULL,
  `payment_postcode` varchar(10) collate utf8_bin NOT NULL default '',
  `payment_country` varchar(128) collate utf8_bin NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) collate utf8_bin NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text collate utf8_bin NOT NULL,
  `payment_method` varchar(128) collate utf8_bin NOT NULL default '',
  `payment_code` varchar(128) collate utf8_bin NOT NULL,
  `shipping_firstname` varchar(32) collate utf8_bin NOT NULL,
  `shipping_lastname` varchar(32) collate utf8_bin NOT NULL default '',
  `shipping_company` varchar(32) collate utf8_bin NOT NULL,
  `shipping_address_1` varchar(128) collate utf8_bin NOT NULL,
  `shipping_address_2` varchar(128) collate utf8_bin NOT NULL,
  `shipping_city` varchar(128) collate utf8_bin NOT NULL,
  `shipping_postcode` varchar(10) collate utf8_bin NOT NULL default '',
  `shipping_country` varchar(128) collate utf8_bin NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) collate utf8_bin NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text collate utf8_bin NOT NULL,
  `shipping_method` varchar(128) collate utf8_bin NOT NULL default '',
  `shipping_code` varchar(128) collate utf8_bin NOT NULL,
  `comment` text collate utf8_bin NOT NULL,
  `total` decimal(15,4) NOT NULL default '0.0000',
  `order_status_id` int(11) NOT NULL default '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) collate utf8_bin NOT NULL,
  `currency_value` decimal(15,8) NOT NULL default '1.00000000',
  `ip` varchar(15) collate utf8_bin NOT NULL,
  `forwarded_ip` varchar(15) collate utf8_bin NOT NULL,
  `user_agent` varchar(255) collate utf8_bin NOT NULL,
  `accept_language` varchar(255) collate utf8_bin NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_order`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_order_download`
--

DROP TABLE IF EXISTS `oc_order_download`;
CREATE TABLE `oc_order_download` (
  `order_download_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `name` varchar(64) collate utf8_bin NOT NULL default '',
  `filename` varchar(128) collate utf8_bin NOT NULL default '',
  `mask` varchar(128) collate utf8_bin NOT NULL default '',
  `remaining` int(3) NOT NULL default '0',
  PRIMARY KEY  (`order_download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_order_download`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_order_history`
--

DROP TABLE IF EXISTS `oc_order_history`;
CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `notify` tinyint(1) NOT NULL default '0',
  `comment` text collate utf8_bin NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`order_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_order_history`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_order_misc`
--

DROP TABLE IF EXISTS `oc_order_misc`;
CREATE TABLE `oc_order_misc` (
  `order_id` int(11) NOT NULL,
  `key` varchar(64) collate utf8_bin NOT NULL,
  `value` text collate utf8_bin NOT NULL,
  PRIMARY KEY  (`order_id`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_order_misc`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_order_option`
--

DROP TABLE IF EXISTS `oc_order_option`;
CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL default '0',
  `name` varchar(255) collate utf8_bin NOT NULL,
  `value` text collate utf8_bin NOT NULL,
  `type` varchar(32) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`order_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_order_option`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_order_product`
--

DROP TABLE IF EXISTS `oc_order_product`;
CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) collate utf8_bin NOT NULL,
  `model` varchar(24) collate utf8_bin NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL default '0.0000',
  `total` decimal(15,4) NOT NULL default '0.0000',
  `tax` decimal(15,4) NOT NULL default '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY  (`order_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_order_product`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_order_status`
--

DROP TABLE IF EXISTS `oc_order_status`;
CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`order_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(1, 1, '待处理'),
(2, 1, '处理中'),
(3, 1, '已配送'),
(7, 1, '已取消'),
(5, 1, '已完成'),
(8, 1, '已拒绝'),
(9, 1, '取消恢复'),
(10, 1, '失败'),
(11, 1, '已退款'),
(12, 1, '已冲销'),
(13, 1, '已扣款'),
(16, 1, '无效'),
(15, 1, '加工'),
(14, 1, '过期');

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_total`
--

DROP TABLE IF EXISTS `oc_order_total`;
CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) collate utf8_bin NOT NULL,
  `title` varchar(255) collate utf8_bin NOT NULL default '',
  `text` varchar(255) collate utf8_bin NOT NULL default '',
  `value` decimal(15,4) NOT NULL default '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`order_total_id`),
  KEY `idx_orders_total_orders_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_order_total`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_product`
--

DROP TABLE IF EXISTS `oc_product`;
CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL auto_increment,
  `model` varchar(64) collate utf8_bin NOT NULL,
  `sku` varchar(64) collate utf8_bin NOT NULL,
  `upc` varchar(12) collate utf8_bin NOT NULL,
  `location` varchar(128) collate utf8_bin NOT NULL,
  `quantity` int(4) NOT NULL default '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) collate utf8_bin default NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL default '1',
  `price` decimal(15,4) NOT NULL default '0.0000',
  `points` int(8) NOT NULL default '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL,
  `weight` decimal(15,8) NOT NULL default '0.00000000',
  `weight_class_id` int(11) NOT NULL default '0',
  `length` decimal(15,8) NOT NULL default '0.00000000',
  `width` decimal(15,8) NOT NULL default '0.00000000',
  `height` decimal(15,8) NOT NULL default '0.00000000',
  `length_class_id` int(11) NOT NULL default '0',
  `subtract` tinyint(1) NOT NULL default '1',
  `minimum` int(11) NOT NULL default '1',
  `sort_order` int(11) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `viewed` int(5) NOT NULL default '0',
  PRIMARY KEY  (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `date_added`, `date_modified`, `viewed`) VALUES
(28, 'Product 1', '', '', '', 939, 7, 'data/htc_touch_hd_1.jpg', 5, 1, 100.0000, 200, 9, '2009-02-03', 146.40000000, 2, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, '2009-02-03 16:06:50', '2011-09-30 01:05:39', 0),
(29, 'Product 2', '', '', '', 999, 6, 'data/palm_treo_pro_1.jpg', 6, 1, 279.9900, 0, 9, '2009-02-03', 133.00000000, 2, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 0, 1, '2009-02-03 16:42:17', '2011-09-30 01:06:08', 0),
(30, 'Product 3', '', '', '', 7, 6, 'data/canon_eos_5d_1.jpg', 9, 1, 100.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, '2009-02-03 16:59:00', '2011-09-30 01:05:23', 0),
(31, 'Product 4', '', '', '', 1000, 6, 'data/nikon_d300_1.jpg', 0, 1, 80.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 0, 1, '2009-02-03 17:00:10', '2011-09-30 01:06:00', 0),
(32, 'Product 5', '', '', '', 999, 6, 'data/ipod_touch_1.jpg', 8, 1, 100.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, '2009-02-03 17:07:26', '2011-09-30 01:07:22', 0),
(33, 'Product 6', '', '', '', 1000, 6, 'data/samsung_syncmaster_941bw.jpg', 0, 1, 200.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-03 17:08:31', '2011-09-30 01:06:29', 0),
(34, 'Product 7', '', '', '', 1000, 6, 'data/ipod_shuffle_1.jpg', 8, 1, 100.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-03 18:07:54', '2011-09-30 01:07:17', 0),
(35, 'Product 8', '', '', '', 1000, 5, '', 0, 0, 100.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, '2009-02-03 18:08:31', '2011-09-30 01:06:17', 0),
(36, 'Product 9', '', '', '', 994, 6, 'data/ipod_nano_1.jpg', 8, 0, 100.0000, 100, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-03 18:09:19', '2011-09-30 01:07:12', 0),
(40, 'product 11', '', '', '', 970, 5, 'data/iphone_1.jpg', 8, 1, 101.0000, 0, 9, '2009-02-03', 10.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, '2009-02-03 21:07:12', '2011-09-30 01:06:53', 0),
(41, 'Product 14', '', '', '', 977, 5, 'data/imac_1.jpg', 8, 1, 100.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, '2009-02-03 21:07:26', '2011-09-30 01:06:44', 0),
(42, 'Product 15', '', '', '', 990, 5, 'data/apple_cinema_30.jpg', 8, 1, 100.0000, 400, 9, '2009-02-04', 12.50000000, 1, 1.00000000, 2.00000000, 3.00000000, 1, 1, 2, 0, 1, '2009-02-03 21:07:37', '2011-09-30 00:46:19', 0),
(43, 'Product 16', '', '', '', 929, 5, 'data/macbook_1.jpg', 8, 0, 500.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-03 21:07:49', '2011-09-30 01:05:46', 0),
(44, 'Product 17', '', '', '', 1000, 5, 'data/macbook_air_1.jpg', 8, 1, 1000.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-03 21:08:00', '2011-09-30 01:05:53', 0),
(45, 'Product 18', '', '', '', 998, 5, 'data/macbook_pro_1.jpg', 8, 1, 2000.0000, 0, 100, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-03 21:08:17', '2011-09-15 22:22:01', 0),
(46, 'Product 19', '', '', '', 1000, 5, 'data/sony_vaio_1.jpg', 10, 1, 1000.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-03 21:08:29', '2011-09-30 01:06:39', 0),
(47, 'Product 21', '', '', '', 1000, 5, 'data/hp_1.jpg', 7, 1, 100.0000, 400, 9, '2009-02-03', 1.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 0, 1, 0, 1, '2009-02-03 21:08:40', '2011-09-30 01:05:28', 0),
(48, 'product 20', 'test 1', '', 'test 2', 995, 5, 'data/ipod_classic_1.jpg', 8, 1, 100.0000, 0, 9, '2009-02-08', 1.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-08 17:21:51', '2011-09-30 01:07:06', 0),
(49, 'SAM1', '', '', '', 0, 8, 'data/samsung_tab_1.jpg', 0, 1, 199.9900, 0, 9, '2011-04-25', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2011-04-26 08:57:34', '2011-09-30 01:06:23', 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_attribute`
--

DROP TABLE IF EXISTS `oc_product_attribute`;
CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text collate utf8_bin NOT NULL,
  PRIMARY KEY  (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_product_attribute`
--

INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(43, 2, 2, '1'),
(47, 2, 1, '4'),
(43, 2, 1, '1'),
(42, 3, 1, '100mhz'),
(47, 2, 2, '4'),
(42, 3, 2, '100mhz'),
(47, 4, 1, '16GB'),
(47, 4, 2, '16GB'),
(43, 4, 1, '8gb'),
(43, 4, 2, '8gb');

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_description`
--

DROP TABLE IF EXISTS `oc_product_description`;
CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) collate utf8_bin NOT NULL,
  `description` text collate utf8_bin NOT NULL,
  `meta_description` varchar(255) collate utf8_bin NOT NULL,
  `meta_keyword` varchar(255) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`) VALUES
(35, 1, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', ''),
(48, 1, 'iPod Classic', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', ''),
(40, 1, 'iPhone', '&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', ''),
(28, 1, 'HTC Touch HD', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', ''),
(44, 1, 'MacBook Air', '&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', ''),
(45, 1, 'MacBook Pro', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', ''),
(29, 1, 'Palm Treo Pro', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', ''),
(36, 1, 'iPod Nano', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', ''),
(46, 1, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', ''),
(47, 1, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', ''),
(32, 1, 'iPod Touch', '&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', ''),
(41, 1, 'iMac', '&lt;div&gt;\r\n	Just when you thought iMac had everything, now there&acute;s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife &acute;08, and it&acute;s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', ''),
(33, 1, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', ''),
(34, 1, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', ''),
(43, 1, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', ''),
(31, 1, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', ''),
(49, 1, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', ''),
(42, 1, 'Apple Cinema 30&quot;', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there&amp;#39;s no limit to what you can achieve. &lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it&amp;#39;s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple&amp;#39;s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br /&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170&amp;deg; horizontal; 170&amp;deg; vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br /&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br /&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50&amp;deg; to 95&amp;deg; F (10&amp;deg; to 35&amp;deg; C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40&amp;deg; to 116&amp;deg; F (-40&amp;deg; to 47&amp;deg; C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO &amp;#39;03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br /&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', ''),
(30, 1, 'Canon EOS 5D', '&lt;p&gt;\r\n	Canon''s press material for the EOS 5D states that it ''defines (a) new D-SLR category'', while we''re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably ''chunkier''). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR''s, an important difference when compared to the latter is that the EOS 5D doesn''t have any environmental seals. While Canon don''t specifically refer to the EOS 5D as a ''professional'' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they''ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_discount`
--

DROP TABLE IF EXISTS `oc_product_discount`;
CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL default '0',
  `priority` int(5) NOT NULL default '1',
  `price` decimal(15,4) NOT NULL default '0.0000',
  `date_start` date NOT NULL default '0000-00-00',
  `date_end` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_product_discount`
--

INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(444, 32, 6, 10, 1, 10.0000, '2010-01-01', '2010-01-31'),
(443, 42, 8, 30, 1, 66.0000, '0000-00-00', '0000-00-00'),
(442, 42, 8, 20, 1, 77.0000, '0000-00-00', '0000-00-00'),
(441, 42, 8, 10, 1, 88.0000, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_image`
--

DROP TABLE IF EXISTS `oc_product_image`;
CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) collate utf8_bin default NULL,
  `sort_order` int(3) NOT NULL default '0',
  PRIMARY KEY  (`product_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_product_image`
--

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2358, 30, 'data/canon_eos_5d_3.jpg', 0),
(2360, 47, 'data/hp_2.jpg', 0),
(2362, 28, 'data/htc_touch_hd_3.jpg', 0),
(2390, 41, 'data/imac_2.jpg', 0),
(2395, 40, 'data/iphone_4.jpg', 0),
(2402, 36, 'data/ipod_nano_3.jpg', 0),
(2401, 36, 'data/ipod_nano_2.jpg', 0),
(2406, 34, 'data/ipod_shuffle_3.jpg', 0),
(2405, 34, 'data/ipod_shuffle_2.jpg', 0),
(2412, 32, 'data/ipod_touch_4.jpg', 0),
(2411, 32, 'data/ipod_touch_3.jpg', 0),
(2410, 32, 'data/ipod_touch_2.jpg', 0),
(2366, 43, 'data/macbook_3.jpg', 0),
(2365, 43, 'data/macbook_2.jpg', 0),
(2369, 44, 'data/macbook_air_3.jpg', 0),
(2368, 44, 'data/macbook_air_2.jpg', 0),
(2372, 45, 'data/macbook_pro_4.jpg', 0),
(2371, 45, 'data/macbook_pro_3.jpg', 0),
(2376, 31, 'data/nikon_d300_5.jpg', 0),
(2375, 31, 'data/nikon_d300_4.jpg', 0),
(2378, 29, 'data/palm_treo_pro_2.jpg', 0),
(2388, 46, 'data/sony_vaio_3.jpg', 0),
(2387, 46, 'data/sony_vaio_2.jpg', 0),
(2398, 48, 'data/ipod_classic_2.jpg', 0),
(2397, 48, 'data/ipod_classic_3.jpg', 0),
(2394, 40, 'data/iphone_3.jpg', 0),
(2393, 40, 'data/iphone_5.jpg', 0),
(2357, 30, 'data/canon_eos_5d_2.jpg', 0),
(2359, 47, 'data/hp_3.jpg', 0),
(2361, 28, 'data/htc_touch_hd_2.jpg', 0),
(2389, 41, 'data/imac_3.jpg', 0),
(2392, 40, 'data/iphone_2.jpg', 0),
(2391, 40, 'data/iphone_6.jpg', 0),
(2396, 48, 'data/ipod_classic_4.jpg', 0),
(2400, 36, 'data/ipod_nano_4.jpg', 0),
(2399, 36, 'data/ipod_nano_5.jpg', 0),
(2404, 34, 'data/ipod_shuffle_4.jpg', 0),
(2403, 34, 'data/ipod_shuffle_5.jpg', 0),
(2409, 32, 'data/ipod_touch_5.jpg', 0),
(2408, 32, 'data/ipod_touch_6.jpg', 0),
(2407, 32, 'data/ipod_touch_7.jpg', 0),
(2364, 43, 'data/macbook_4.jpg', 0),
(2363, 43, 'data/macbook_5.jpg', 0),
(2367, 44, 'data/macbook_air_4.jpg', 0),
(2370, 45, 'data/macbook_pro_2.jpg', 0),
(2374, 31, 'data/nikon_d300_2.jpg', 0),
(2373, 31, 'data/nikon_d300_3.jpg', 0),
(2377, 29, 'data/palm_treo_pro_3.jpg', 0),
(2386, 46, 'data/sony_vaio_4.jpg', 0),
(2385, 46, 'data/sony_vaio_5.jpg', 0),
(2384, 49, 'data/samsung_tab_2.jpg', 0),
(2383, 49, 'data/samsung_tab_3.jpg', 0),
(2382, 49, 'data/samsung_tab_4.jpg', 0),
(2381, 49, 'data/samsung_tab_5.jpg', 0),
(2380, 49, 'data/samsung_tab_6.jpg', 0),
(2379, 49, 'data/samsung_tab_7.jpg', 0),
(2355, 42, 'data/canon_eos_5d_1.jpg', 0),
(2354, 42, 'data/compaq_presario.jpg', 0),
(2353, 42, 'data/hp_1.jpg', 0),
(2352, 42, 'data/canon_logo.jpg', 0),
(2356, 42, 'data/canon_eos_5d_2.jpg', 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_option`
--

DROP TABLE IF EXISTS `oc_product_option`;
CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value` text collate utf8_bin NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY  (`product_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_product_option`
--

INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `option_value`, `required`) VALUES
(224, 35, 11, '', 1),
(225, 47, 12, '2011-04-22', 1),
(222, 42, 7, '', 1),
(219, 42, 8, '2011-02-20', 1),
(208, 42, 4, 'test', 1),
(218, 42, 1, '', 1),
(209, 42, 6, '', 1),
(217, 42, 5, '', 1),
(223, 42, 2, '', 1),
(226, 30, 5, '', 1),
(221, 42, 9, '22:25', 1),
(220, 42, 10, '2011-02-20 22:25', 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_option_value`
--

DROP TABLE IF EXISTS `oc_product_option_value`;
CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL auto_increment,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) collate utf8_bin NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) collate utf8_bin NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`product_option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_product_option_value`
--

INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(5, 218, 42, 1, 32, 96, 1, 10.0000, '+', 1, '+', 10.00000000, '+'),
(7, 218, 42, 1, 43, 300, 1, 30.0000, '+', 3, '+', 30.00000000, '+'),
(6, 218, 42, 1, 31, 146, 1, 20.0000, '+', 2, '-', 20.00000000, '+'),
(3, 217, 42, 5, 40, 300, 0, 3.0000, '+', 0, '+', 3.00000000, '+'),
(2, 217, 42, 5, 42, 200, 1, 2.0000, '+', 0, '+', 2.00000000, '+'),
(4, 217, 42, 5, 39, 92, 1, 4.0000, '+', 0, '+', 4.00000000, '+'),
(1, 217, 42, 5, 41, 100, 0, 1.0000, '+', 0, '+', 1.00000000, '+'),
(11, 223, 42, 2, 45, 3998, 1, 40.0000, '+', 0, '+', 40.00000000, '+'),
(9, 223, 42, 2, 24, 194, 1, 20.0000, '+', 0, '+', 20.00000000, '+'),
(10, 223, 42, 2, 44, 2696, 1, 30.0000, '+', 0, '+', 30.00000000, '+'),
(8, 223, 42, 2, 23, 48, 1, 10.0000, '+', 0, '+', 10.00000000, '+'),
(14, 224, 35, 11, 48, 15, 1, 15.0000, '+', 0, '+', 0.00000000, '+'),
(13, 224, 35, 11, 47, 10, 1, 10.0000, '+', 0, '+', 0.00000000, '+'),
(12, 224, 35, 11, 46, 0, 1, 5.0000, '+', 0, '+', 0.00000000, '+'),
(15, 226, 30, 5, 39, 2, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(16, 226, 30, 5, 40, 5, 1, 0.0000, '+', 0, '+', 0.00000000, '+');

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_related`
--

DROP TABLE IF EXISTS `oc_product_related`;
CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY  (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_product_related`
--

INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES
(40, 42),
(41, 42),
(42, 40),
(42, 41);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_reward`
--

DROP TABLE IF EXISTS `oc_product_reward`;
CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL default '0',
  `customer_group_id` int(11) NOT NULL default '0',
  `points` int(8) NOT NULL default '0',
  PRIMARY KEY  (`product_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_product_reward`
--

INSERT INTO `oc_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(548, 42, 6, 10),
(547, 42, 8, 100),
(552, 47, 6, 30),
(551, 47, 8, 300),
(554, 28, 6, 400),
(553, 28, 8, 400),
(556, 43, 6, 60),
(555, 43, 8, 600),
(564, 29, 6, 0),
(563, 29, 8, 0),
(578, 48, 6, 0),
(577, 48, 8, 0),
(576, 40, 6, 0),
(575, 40, 8, 0),
(550, 30, 6, 20),
(549, 30, 8, 200),
(558, 44, 6, 70),
(557, 44, 8, 700),
(560, 45, 6, 80),
(559, 45, 8, 800),
(562, 31, 6, 0),
(561, 31, 8, 0),
(566, 35, 6, 0),
(565, 35, 8, 0),
(570, 33, 6, 0),
(569, 33, 8, 0),
(572, 46, 6, 0),
(571, 46, 8, 0),
(574, 41, 6, 0),
(573, 41, 8, 0),
(580, 36, 6, 0),
(579, 36, 8, 0),
(582, 34, 6, 0),
(581, 34, 8, 0),
(584, 32, 6, 0),
(583, 32, 8, 0),
(568, 49, 6, 1000),
(567, 49, 8, 1000);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_special`
--

DROP TABLE IF EXISTS `oc_product_special`;
CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL default '1',
  `price` decimal(15,4) NOT NULL default '0.0000',
  `date_start` date NOT NULL default '0000-00-00',
  `date_end` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_product_special`
--

INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(440, 42, 8, 1, 90.0000, '0000-00-00', '0000-00-00'),
(442, 30, 8, 2, 90.0000, '0000-00-00', '0000-00-00'),
(441, 30, 8, 1, 80.0000, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_tag`
--

DROP TABLE IF EXISTS `oc_product_tag`;
CREATE TABLE `oc_product_tag` (
  `product_tag_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `tag` varchar(32) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`product_tag_id`),
  KEY `product_id` (`product_id`),
  KEY `language_id` (`language_id`),
  KEY `tag` (`tag`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_product_tag`
--

INSERT INTO `oc_product_tag` (`product_tag_id`, `product_id`, `language_id`, `tag`) VALUES
(344, 42, 1, 'test 2'),
(343, 42, 1, 'test 1'),
(345, 42, 2, 'test 1'),
(346, 42, 2, 'test 2');

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_to_category`
--

DROP TABLE IF EXISTS `oc_product_to_category`;
CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY  (`product_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES
(28, 20),
(28, 24),
(29, 20),
(29, 24),
(30, 20),
(30, 33),
(31, 33),
(32, 34),
(33, 20),
(33, 28),
(34, 34),
(35, 20),
(36, 34),
(40, 20),
(40, 24),
(41, 27),
(42, 20),
(42, 28),
(43, 18),
(43, 20),
(44, 18),
(44, 20),
(45, 18),
(46, 18),
(46, 20),
(47, 18),
(47, 20),
(48, 20),
(48, 34),
(49, 57);

-- --------------------------------------------------------

--
-- 表的结构 `oc_product_to_download`
--

DROP TABLE IF EXISTS `oc_product_to_download`;
CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY  (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_product_to_download`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_product_to_layout`
--

DROP TABLE IF EXISTS `oc_product_to_layout`;
CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY  (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_product_to_layout`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_product_to_store`
--

DROP TABLE IF EXISTS `oc_product_to_store`;
CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_return`
--

DROP TABLE IF EXISTS `oc_return`;
CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) collate utf8_bin NOT NULL,
  `lastname` varchar(32) collate utf8_bin NOT NULL,
  `email` varchar(96) collate utf8_bin NOT NULL,
  `telephone` varchar(32) collate utf8_bin NOT NULL,
  `product` varchar(255) collate utf8_bin NOT NULL,
  `model` varchar(64) collate utf8_bin NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text collate utf8_bin,
  `date_ordered` date NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_return`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_return_action`
--

DROP TABLE IF EXISTS `oc_return_action`;
CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL default '0',
  `name` varchar(64) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`return_action_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent');

-- --------------------------------------------------------

--
-- 表的结构 `oc_return_history`
--

DROP TABLE IF EXISTS `oc_return_history`;
CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL auto_increment,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text collate utf8_bin NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_return_history`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_return_reason`
--

DROP TABLE IF EXISTS `oc_return_reason`;
CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL default '0',
  `name` varchar(128) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`return_reason_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, '商品未送达'),
(2, 1, '收到错误的商品'),
(3, 1, '订单错误'),
(4, 1, '故障，请提供详细资料'),
(5, 1, '其他，请提供详细资料');

-- --------------------------------------------------------

--
-- 表的结构 `oc_return_status`
--

DROP TABLE IF EXISTS `oc_return_status`;
CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL default '0',
  `name` varchar(32) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`return_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(3, 1, 'Complete'),
(2, 1, 'Awaiting Products');

-- --------------------------------------------------------

--
-- 表的结构 `oc_review`
--

DROP TABLE IF EXISTS `oc_review`;
CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) collate utf8_bin NOT NULL default '',
  `text` text collate utf8_bin NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_review`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_setting`
--

DROP TABLE IF EXISTS `oc_setting`;
CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL auto_increment,
  `store_id` int(11) NOT NULL default '0',
  `group` varchar(32) collate utf8_bin NOT NULL,
  `key` varchar(64) collate utf8_bin NOT NULL default '',
  `value` text collate utf8_bin NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY  (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `group`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(4, 0, 'tax', 'tax_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(7, 0, 'tax', 'tax_sort_order', '5', 0),
(8, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(9, 0, 'cod', 'cod_sort_order', '5', 0),
(10, 0, 'cod', 'cod_total', '0.01', 0),
(11, 0, 'cod', 'cod_order_status_id', '1', 0),
(12, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(13, 0, 'cod', 'cod_status', '1', 0),
(14, 0, 'shipping', 'shipping_status', '1', 0),
(15, 0, 'shipping', 'shipping_estimator', '1', 0),
(397, 0, 'config', 'config_encryption', '2e7539b8c82bb6ee5f7297c7c985fb2e', 0),
(396, 0, 'config', 'config_maintenance', '0', 0),
(395, 0, 'config', 'config_seo_url', '0', 0),
(394, 0, 'config', 'config_use_ssl', '0', 0),
(392, 0, 'config', 'config_fraud_score', '', 0),
(393, 0, 'config', 'config_fraud_status_id', '15', 0),
(391, 0, 'config', 'config_fraud_key', '', 0),
(390, 0, 'config', 'config_fraud_detection', '0', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(389, 0, 'config', 'config_alert_emails', '', 0),
(388, 0, 'config', 'config_account_mail', '0', 0),
(387, 0, 'config', 'config_alert_mail', '0', 0),
(34, 0, 'flat', 'flat_sort_order', '1', 0),
(35, 0, 'flat', 'flat_status', '1', 0),
(36, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(37, 0, 'flat', 'flat_tax_class_id', '9', 0),
(38, 0, 'carousel', 'carousel_module', 'a:1:{i:0;a:9:{s:9:"banner_id";s:1:"8";s:5:"limit";s:1:"5";s:6:"scroll";s:1:"3";s:5:"width";s:2:"80";s:6:"height";s:2:"80";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:2:"-1";}}', 1),
(39, 0, 'featured', 'featured_product', '43,40,42,49,46,47,28', 0),
(40, 0, 'featured', 'featured_module', 'a:1:{i:0;a:7:{s:5:"limit";s:1:"6";s:11:"image_width";s:2:"80";s:12:"image_height";s:2:"80";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}}', 1),
(41, 0, 'flat', 'flat_cost', '5.00', 0),
(42, 0, 'credit', 'credit_sort_order', '7', 0),
(43, 0, 'credit', 'credit_status', '1', 0),
(386, 0, 'config', 'config_smtp_timeout', '5', 0),
(383, 0, 'config', 'config_smtp_username', '', 0),
(384, 0, 'config', 'config_smtp_password', '', 0),
(385, 0, 'config', 'config_smtp_port', '25', 0),
(382, 0, 'config', 'config_smtp_host', '', 0),
(381, 0, 'config', 'config_mail_parameter', '', 0),
(380, 0, 'config', 'config_mail_protocol', 'mail', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(379, 0, 'config', 'config_image_cart_height', '47', 0),
(56, 0, 'affiliate', 'affiliate_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:2:"10";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(57, 0, 'category', 'category_module', 'a:2:{i:0;a:5:{s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:5:"count";s:1:"0";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}i:1;a:5:{s:9:"layout_id";s:1:"2";s:8:"position";s:11:"column_left";s:5:"count";s:1:"0";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(378, 0, 'config', 'config_image_cart_width', '47', 0),
(377, 0, 'config', 'config_image_wishlist_height', '47', 0),
(60, 0, 'account', 'account_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:1:"6";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(376, 0, 'config', 'config_image_wishlist_width', '47', 0),
(375, 0, 'config', 'config_image_compare_height', '90', 0),
(373, 0, 'config', 'config_image_related_height', '80', 0),
(374, 0, 'config', 'config_image_compare_width', '90', 0),
(372, 0, 'config', 'config_image_related_width', '80', 0),
(371, 0, 'config', 'config_image_additional_height', '74', 0),
(369, 0, 'config', 'config_image_product_height', '80', 0),
(370, 0, 'config', 'config_image_additional_width', '74', 0),
(368, 0, 'config', 'config_image_product_width', '80', 0),
(367, 0, 'config', 'config_image_popup_height', '500', 0),
(366, 0, 'config', 'config_image_popup_width', '500', 0),
(364, 0, 'config', 'config_image_thumb_width', '228', 0),
(365, 0, 'config', 'config_image_thumb_height', '228', 0),
(363, 0, 'config', 'config_image_category_height', '80', 0),
(362, 0, 'config', 'config_image_category_width', '80', 0),
(361, 0, 'config', 'config_icon', 'data/cart.png', 0),
(360, 0, 'config', 'config_logo', 'data/logo.png', 0),
(358, 0, 'config', 'config_commission', '5', 0),
(359, 0, 'config', 'config_return_status_id', '2', 0),
(355, 0, 'config', 'config_stock_checkout', '0', 0),
(93, 0, 'voucher', 'voucher_sort_order', '8', 0),
(94, 0, 'voucher', 'voucher_status', '1', 0),
(357, 0, 'config', 'config_affiliate_id', '4', 0),
(356, 0, 'config', 'config_stock_status_id', '5', 0),
(354, 0, 'config', 'config_stock_warning', '0', 0),
(353, 0, 'config', 'config_stock_display', '0', 0),
(352, 0, 'config', 'config_complete_status_id', '5', 0),
(102, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(103, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(351, 0, 'config', 'config_order_status_id', '1', 0),
(350, 0, 'config', 'config_invoice_prefix', 'INV-2012-00', 0),
(107, 0, 'slideshow', 'slideshow_module', 'a:1:{i:0;a:7:{s:9:"banner_id";s:1:"7";s:5:"width";s:3:"980";s:6:"height";s:3:"280";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(108, 0, 'banner', 'banner_module', 'a:1:{i:0;a:7:{s:9:"banner_id";s:1:"6";s:5:"width";s:3:"182";s:6:"height";s:3:"182";s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}}', 1),
(349, 0, 'config', 'config_order_edit', '100', 0),
(347, 0, 'config', 'config_guest_checkout', '1', 0),
(348, 0, 'config', 'config_checkout_id', '5', 0),
(346, 0, 'config', 'config_cart_weight', '1', 0),
(345, 0, 'config', 'config_account_id', '3', 0),
(344, 0, 'config', 'config_customer_price', '0', 0),
(343, 0, 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:"1";}', 1),
(342, 0, 'config', 'config_customer_group_id', '1', 0),
(339, 0, 'config', 'config_vat', '0', 0),
(340, 0, 'config', 'config_tax_default', 'shipping', 0),
(341, 0, 'config', 'config_tax_customer', 'shipping', 0),
(338, 0, 'config', 'config_tax', '1', 0),
(337, 0, 'config', 'config_voucher_max', '1000', 0),
(336, 0, 'config', 'config_voucher_min', '1', 0),
(335, 0, 'config', 'config_upload_allowed', 'jpg, JPG, jpeg, gif, png, txt', 0),
(334, 0, 'config', 'config_download', '1', 0),
(333, 0, 'config', 'config_review_status', '1', 0),
(332, 0, 'config', 'config_product_count', '0', 0),
(331, 0, 'config', 'config_admin_limit', '20', 0),
(330, 0, 'config', 'config_catalog_limit', '15', 0),
(329, 0, 'config', 'config_weight_class_id', '1', 0),
(328, 0, 'config', 'config_length_class_id', '1', 0),
(327, 0, 'config', 'config_currency_auto', '1', 0),
(326, 0, 'config', 'config_currency', 'CNY', 0),
(325, 0, 'config', 'config_admin_language', 'zh-CN', 0),
(324, 0, 'config', 'config_language', 'zh-CN', 0),
(323, 0, 'config', 'config_zone_id', '710', 0),
(321, 0, 'config', 'config_layout_id', '4', 0),
(322, 0, 'config', 'config_country_id', '44', 0),
(320, 0, 'config', 'config_template', 'default', 0),
(319, 0, 'config', 'config_meta_description', 'My Store', 0),
(318, 0, 'config', 'config_title', 'Your Store', 0),
(317, 0, 'config', 'config_fax', '', 0),
(316, 0, 'config', 'config_telephone', '123456789', 0),
(315, 0, 'config', 'config_email', 'your@store.com', 0),
(314, 0, 'config', 'config_address', 'Address 1', 0),
(313, 0, 'config', 'config_owner', 'Your Name', 0),
(312, 0, 'config', 'config_name', 'Your Store', 0),
(398, 0, 'config', 'config_compression', '0', 0),
(399, 0, 'config', 'config_error_display', '1', 0),
(400, 0, 'config', 'config_error_log', '1', 0),
(401, 0, 'config', 'config_error_filename', 'error.txt', 0),
(402, 0, 'config', 'config_google_analytics', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_stock_status`
--

DROP TABLE IF EXISTS `oc_stock_status`;
CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`stock_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, '有货'),
(5, 1, '缺货'),
(6, 1, '等待2 - 3天'),
(8, 1, '预购');

-- --------------------------------------------------------

--
-- 表的结构 `oc_store`
--

DROP TABLE IF EXISTS `oc_store`;
CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) collate utf8_bin NOT NULL,
  `url` varchar(255) collate utf8_bin NOT NULL,
  `ssl` varchar(255) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_store`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_tax_class`
--

DROP TABLE IF EXISTS `oc_tax_class`;
CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL auto_increment,
  `title` varchar(32) collate utf8_bin NOT NULL default '',
  `description` varchar(255) collate utf8_bin NOT NULL default '',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, '交税商品', '征税的商品', '2009-01-06 23:21:53', '2012-06-11 01:12:36'),
(10, '可下载的商品', '可下载', '2011-09-21 22:19:39', '2012-06-11 01:10:52');

-- --------------------------------------------------------

--
-- 表的结构 `oc_tax_rate`
--

DROP TABLE IF EXISTS `oc_tax_rate`;
CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL auto_increment,
  `geo_zone_id` int(11) NOT NULL default '0',
  `name` varchar(32) collate utf8_bin NOT NULL,
  `rate` decimal(15,4) NOT NULL default '0.0000',
  `type` char(1) collate utf8_bin NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`tax_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, '增值税 (17.5%)', 17.5000, 'P', '2011-03-09 21:17:10', '2012-06-11 01:06:45'),
(87, 3, '普通税 (-2.00)', 2.0000, 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- 表的结构 `oc_tax_rate_to_customer_group`
--

DROP TABLE IF EXISTS `oc_tax_rate_to_customer_group`;
CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY  (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(87, 6),
(87, 8);

-- --------------------------------------------------------

--
-- 表的结构 `oc_tax_rule`
--

DROP TABLE IF EXISTS `oc_tax_rule`;
CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL auto_increment,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) collate utf8_bin NOT NULL,
  `priority` int(5) NOT NULL default '1',
  PRIMARY KEY  (`tax_rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(129, 10, 86, 'payment', 1),
(132, 9, 87, 'shipping', 2),
(131, 9, 86, 'shipping', 1),
(130, 10, 87, 'store', 0);

-- --------------------------------------------------------

--
-- 表的结构 `oc_url_alias`
--

DROP TABLE IF EXISTS `oc_url_alias`;
CREATE TABLE `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL auto_increment,
  `query` varchar(255) collate utf8_bin NOT NULL,
  `keyword` varchar(255) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`url_alias_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_url_alias`
--

INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(776, 'product_id=48', 'ipod_classic'),
(777, 'category_id=20', 'desktops'),
(503, 'category_id=26', 'pc'),
(778, 'category_id=27', 'mac'),
(730, 'manufacturer_id=8', 'apple'),
(774, 'information_id=4', 'about_us'),
(775, 'product_id=42', 'test'),
(779, 'category_id=34', 'mp3-players'),
(536, 'category_id=36', 'Normal');

-- --------------------------------------------------------

--
-- 表的结构 `oc_user`
--

DROP TABLE IF EXISTS `oc_user`;
CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL auto_increment,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) collate utf8_bin NOT NULL default '',
  `password` varchar(32) collate utf8_bin NOT NULL default '',
  `firstname` varchar(32) collate utf8_bin NOT NULL default '',
  `lastname` varchar(32) collate utf8_bin NOT NULL default '',
  `email` varchar(96) collate utf8_bin NOT NULL default '',
  `code` varchar(32) collate utf8_bin NOT NULL,
  `ip` varchar(15) collate utf8_bin NOT NULL default '',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_user`
--

-- --------------------------------------------------------

--
-- 表的结构 `oc_user_group`
--

DROP TABLE IF EXISTS `oc_user_group`;
CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) collate utf8_bin NOT NULL,
  `permission` text collate utf8_bin NOT NULL,
  PRIMARY KEY  (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Top Administrator', 'a:2:{s:6:"access";a:115:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:19:"catalog/information";i:5;s:20:"catalog/manufacturer";i:6;s:14:"catalog/option";i:7;s:15:"catalog/product";i:8;s:14:"catalog/review";i:9;s:18:"common/filemanager";i:10;s:13:"design/banner";i:11;s:13:"design/layout";i:12;s:14:"extension/feed";i:13;s:16:"extension/module";i:14;s:17:"extension/payment";i:15;s:18:"extension/shipping";i:16;s:15:"extension/total";i:17;s:16:"feed/google_base";i:18;s:19:"feed/google_sitemap";i:19;s:20:"localisation/country";i:20;s:21:"localisation/currency";i:21;s:21:"localisation/geo_zone";i:22;s:21:"localisation/language";i:23;s:25:"localisation/length_class";i:24;s:25:"localisation/order_status";i:25;s:26:"localisation/return_action";i:26;s:26:"localisation/return_reason";i:27;s:26:"localisation/return_status";i:28;s:25:"localisation/stock_status";i:29;s:22:"localisation/tax_class";i:30;s:21:"localisation/tax_rate";i:31;s:25:"localisation/weight_class";i:32;s:17:"localisation/zone";i:33;s:14:"module/account";i:34;s:16:"module/affiliate";i:35;s:13:"module/banner";i:36;s:17:"module/bestseller";i:37;s:15:"module/carousel";i:38;s:15:"module/category";i:39;s:15:"module/featured";i:40;s:18:"module/google_talk";i:41;s:18:"module/information";i:42;s:13:"module/latest";i:43;s:16:"module/slideshow";i:44;s:14:"module/special";i:45;s:12:"module/store";i:46;s:14:"module/welcome";i:47;s:16:"payment/alertpay";i:48;s:24:"payment/authorizenet_aim";i:49;s:21:"payment/bank_transfer";i:50;s:14:"payment/cheque";i:51;s:11:"payment/cod";i:52;s:21:"payment/free_checkout";i:53;s:14:"payment/liqpay";i:54;s:20:"payment/moneybookers";i:55;s:14:"payment/nochex";i:56;s:15:"payment/paymate";i:57;s:16:"payment/paypoint";i:58;s:26:"payment/perpetual_payments";i:59;s:14:"payment/pp_pro";i:60;s:17:"payment/pp_pro_uk";i:61;s:19:"payment/pp_standard";i:62;s:15:"payment/sagepay";i:63;s:22:"payment/sagepay_direct";i:64;s:18:"payment/sagepay_us";i:65;s:19:"payment/twocheckout";i:66;s:28:"payment/web_payment_software";i:67;s:16:"payment/worldpay";i:68;s:27:"report/affiliate_commission";i:69;s:22:"report/customer_credit";i:70;s:21:"report/customer_order";i:71;s:22:"report/customer_reward";i:72;s:24:"report/product_purchased";i:73;s:21:"report/product_viewed";i:74;s:18:"report/sale_coupon";i:75;s:17:"report/sale_order";i:76;s:18:"report/sale_return";i:77;s:20:"report/sale_shipping";i:78;s:15:"report/sale_tax";i:79;s:14:"sale/affiliate";i:80;s:12:"sale/contact";i:81;s:11:"sale/coupon";i:82;s:13:"sale/customer";i:83;s:23:"sale/customer_blacklist";i:84;s:19:"sale/customer_group";i:85;s:10:"sale/order";i:86;s:11:"sale/return";i:87;s:12:"sale/voucher";i:88;s:18:"sale/voucher_theme";i:89;s:15:"setting/setting";i:90;s:13:"setting/store";i:91;s:17:"shipping/citylink";i:92;s:13:"shipping/flat";i:93;s:13:"shipping/free";i:94;s:13:"shipping/item";i:95;s:23:"shipping/parcelforce_48";i:96;s:15:"shipping/pickup";i:97;s:19:"shipping/royal_mail";i:98;s:12:"shipping/ups";i:99;s:13:"shipping/usps";i:100;s:15:"shipping/weight";i:101;s:11:"tool/backup";i:102;s:14:"tool/error_log";i:103;s:12:"total/coupon";i:104;s:12:"total/credit";i:105;s:14:"total/handling";i:106;s:19:"total/low_order_fee";i:107;s:12:"total/reward";i:108;s:14:"total/shipping";i:109;s:15:"total/sub_total";i:110;s:9:"total/tax";i:111;s:11:"total/total";i:112;s:13:"total/voucher";i:113;s:9:"user/user";i:114;s:20:"user/user_permission";}s:6:"modify";a:115:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:19:"catalog/information";i:5;s:20:"catalog/manufacturer";i:6;s:14:"catalog/option";i:7;s:15:"catalog/product";i:8;s:14:"catalog/review";i:9;s:18:"common/filemanager";i:10;s:13:"design/banner";i:11;s:13:"design/layout";i:12;s:14:"extension/feed";i:13;s:16:"extension/module";i:14;s:17:"extension/payment";i:15;s:18:"extension/shipping";i:16;s:15:"extension/total";i:17;s:16:"feed/google_base";i:18;s:19:"feed/google_sitemap";i:19;s:20:"localisation/country";i:20;s:21:"localisation/currency";i:21;s:21:"localisation/geo_zone";i:22;s:21:"localisation/language";i:23;s:25:"localisation/length_class";i:24;s:25:"localisation/order_status";i:25;s:26:"localisation/return_action";i:26;s:26:"localisation/return_reason";i:27;s:26:"localisation/return_status";i:28;s:25:"localisation/stock_status";i:29;s:22:"localisation/tax_class";i:30;s:21:"localisation/tax_rate";i:31;s:25:"localisation/weight_class";i:32;s:17:"localisation/zone";i:33;s:14:"module/account";i:34;s:16:"module/affiliate";i:35;s:13:"module/banner";i:36;s:17:"module/bestseller";i:37;s:15:"module/carousel";i:38;s:15:"module/category";i:39;s:15:"module/featured";i:40;s:18:"module/google_talk";i:41;s:18:"module/information";i:42;s:13:"module/latest";i:43;s:16:"module/slideshow";i:44;s:14:"module/special";i:45;s:12:"module/store";i:46;s:14:"module/welcome";i:47;s:16:"payment/alertpay";i:48;s:24:"payment/authorizenet_aim";i:49;s:21:"payment/bank_transfer";i:50;s:14:"payment/cheque";i:51;s:11:"payment/cod";i:52;s:21:"payment/free_checkout";i:53;s:14:"payment/liqpay";i:54;s:20:"payment/moneybookers";i:55;s:14:"payment/nochex";i:56;s:15:"payment/paymate";i:57;s:16:"payment/paypoint";i:58;s:26:"payment/perpetual_payments";i:59;s:14:"payment/pp_pro";i:60;s:17:"payment/pp_pro_uk";i:61;s:19:"payment/pp_standard";i:62;s:15:"payment/sagepay";i:63;s:22:"payment/sagepay_direct";i:64;s:18:"payment/sagepay_us";i:65;s:19:"payment/twocheckout";i:66;s:28:"payment/web_payment_software";i:67;s:16:"payment/worldpay";i:68;s:27:"report/affiliate_commission";i:69;s:22:"report/customer_credit";i:70;s:21:"report/customer_order";i:71;s:22:"report/customer_reward";i:72;s:24:"report/product_purchased";i:73;s:21:"report/product_viewed";i:74;s:18:"report/sale_coupon";i:75;s:17:"report/sale_order";i:76;s:18:"report/sale_return";i:77;s:20:"report/sale_shipping";i:78;s:15:"report/sale_tax";i:79;s:14:"sale/affiliate";i:80;s:12:"sale/contact";i:81;s:11:"sale/coupon";i:82;s:13:"sale/customer";i:83;s:23:"sale/customer_blacklist";i:84;s:19:"sale/customer_group";i:85;s:10:"sale/order";i:86;s:11:"sale/return";i:87;s:12:"sale/voucher";i:88;s:18:"sale/voucher_theme";i:89;s:15:"setting/setting";i:90;s:13:"setting/store";i:91;s:17:"shipping/citylink";i:92;s:13:"shipping/flat";i:93;s:13:"shipping/free";i:94;s:13:"shipping/item";i:95;s:23:"shipping/parcelforce_48";i:96;s:15:"shipping/pickup";i:97;s:19:"shipping/royal_mail";i:98;s:12:"shipping/ups";i:99;s:13:"shipping/usps";i:100;s:15:"shipping/weight";i:101;s:11:"tool/backup";i:102;s:14:"tool/error_log";i:103;s:12:"total/coupon";i:104;s:12:"total/credit";i:105;s:14:"total/handling";i:106;s:19:"total/low_order_fee";i:107;s:12:"total/reward";i:108;s:14:"total/shipping";i:109;s:15:"total/sub_total";i:110;s:9:"total/tax";i:111;s:11:"total/total";i:112;s:13:"total/voucher";i:113;s:9:"user/user";i:114;s:20:"user/user_permission";}}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- 表的结构 `oc_voucher`
--

DROP TABLE IF EXISTS `oc_voucher`;
CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) collate utf8_bin NOT NULL,
  `from_name` varchar(64) collate utf8_bin NOT NULL,
  `from_email` varchar(96) collate utf8_bin NOT NULL,
  `to_name` varchar(64) collate utf8_bin NOT NULL,
  `to_email` varchar(96) collate utf8_bin NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text collate utf8_bin NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_voucher`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_voucher_history`
--

DROP TABLE IF EXISTS `oc_voucher_history`;
CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL auto_increment,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_voucher_history`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_voucher_theme`
--

DROP TABLE IF EXISTS `oc_voucher_theme`;
CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL auto_increment,
  `image` varchar(255) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`voucher_theme_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'data/canon_eos_5d_2.jpg'),
(7, 'data/gift-voucher-birthday.jpg'),
(6, 'data/apple_logo.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `oc_voucher_theme_description`
--

DROP TABLE IF EXISTS `oc_voucher_theme_description`;
CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, '圣诞'),
(7, 1, '生日'),
(8, 1, '普通');

-- --------------------------------------------------------

--
-- 表的结构 `oc_weight_class`
--

DROP TABLE IF EXISTS `oc_weight_class`;
CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL auto_increment,
  `value` decimal(15,8) NOT NULL default '0.00000000',
  PRIMARY KEY  (`weight_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, 1.00000000),
(2, 1000.00000000),
(5, 2.20460000),
(6, 35.27400000);

-- --------------------------------------------------------

--
-- 表的结构 `oc_weight_class_description`
--

DROP TABLE IF EXISTS `oc_weight_class_description`;
CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) collate utf8_bin NOT NULL,
  `unit` varchar(4) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`weight_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, '公斤', 'kg'),
(2, 1, '公克', 'g'),
(5, 1, '磅', 'lb'),
(6, 1, '盎司', 'oz');

-- --------------------------------------------------------

--
-- 表的结构 `oc_zone`
--

DROP TABLE IF EXISTS `oc_zone`;
CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL auto_increment,
  `country_id` int(11) NOT NULL,
  `code` varchar(32) collate utf8_bin NOT NULL default '',
  `name` varchar(128) collate utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `code`, `name`, `status`) VALUES
(684, 44, 'AN', '安徽', 1),
(685, 44, 'BE', '北京', 1),
(686, 44, 'CH', '重庆', 1),
(687, 44, 'FU', '福建', 1),
(688, 44, 'GA', '甘肃', 1),
(689, 44, 'GU', '广州', 1),
(690, 44, 'GX', '广西', 1),
(691, 44, 'GZ', '贵州', 1),
(692, 44, 'HA', '海南', 1),
(693, 44, 'HB', '河北', 1),
(694, 44, 'HL', '黑龙江', 1),
(695, 44, 'HE', '河南', 1),
(696, 44, 'HK', '香港', 1),
(697, 44, 'HU', '湖北', 1),
(698, 44, 'HN', '湖南', 1),
(699, 44, 'IM', '内蒙', 1),
(700, 44, 'JI', '江苏', 1),
(701, 44, 'JX', '江西', 1),
(702, 44, 'JL', '吉林', 1),
(703, 44, 'LI', '辽宁', 1),
(704, 44, 'MA', '澳门', 1),
(705, 44, 'NI', '宁夏', 1),
(706, 44, 'SH', '山西', 1),
(707, 44, 'SA', '山东', 1),
(708, 44, 'SG', '上海', 1),
(709, 44, 'SX', '陕西', 1),
(710, 44, 'SI', '四川', 1),
(711, 44, 'TI', '天津', 1),
(712, 44, 'XI', '新疆', 1),
(713, 44, 'YU', '云南', 1),
(714, 44, 'ZH', '浙江', 1);

-- --------------------------------------------------------

--
-- 表的结构 `oc_zone_to_geo_zone`
--

DROP TABLE IF EXISTS `oc_zone_to_geo_zone`;
CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL auto_increment,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL default '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`zone_to_geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(57, 44, 0, 3, '2010-02-26 22:33:24', '0000-00-00 00:00:00'),
(65, 44, 0, 4, '2010-12-15 15:18:13', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `oc_order_fraud`
--

DROP TABLE IF EXISTS `oc_order_fraud`;
CREATE TABLE `oc_order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) collate utf8_bin NOT NULL,
  `country_code` varchar(2) collate utf8_bin NOT NULL,
  `high_risk_country` varchar(3) collate utf8_bin NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) collate utf8_bin NOT NULL,
  `ip_city` varchar(255) collate utf8_bin NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) collate utf8_bin NOT NULL,
  `ip_org` varchar(255) collate utf8_bin NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) collate utf8_bin NOT NULL,
  `ip_country_confidence` varchar(3) collate utf8_bin NOT NULL,
  `ip_region_confidence` varchar(3) collate utf8_bin NOT NULL,
  `ip_city_confidence` varchar(3) collate utf8_bin NOT NULL,
  `ip_postal_confidence` varchar(3) collate utf8_bin NOT NULL,
  `ip_postal_code` varchar(10) collate utf8_bin NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) collate utf8_bin NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) collate utf8_bin NOT NULL,
  `ip_region_name` varchar(255) collate utf8_bin NOT NULL,
  `ip_domain` varchar(255) collate utf8_bin NOT NULL,
  `ip_country_name` varchar(255) collate utf8_bin NOT NULL,
  `ip_continent_code` varchar(2) collate utf8_bin NOT NULL,
  `ip_corporate_proxy` varchar(3) collate utf8_bin NOT NULL,
  `anonymous_proxy` varchar(3) collate utf8_bin NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) collate utf8_bin NOT NULL,
  `free_mail` varchar(3) collate utf8_bin NOT NULL,
  `carder_email` varchar(3) collate utf8_bin NOT NULL,
  `high_risk_username` varchar(3) collate utf8_bin NOT NULL,
  `high_risk_password` varchar(3) collate utf8_bin NOT NULL,
  `bin_match` varchar(10) collate utf8_bin NOT NULL,
  `bin_country` varchar(2) collate utf8_bin NOT NULL,
  `bin_name_match` varchar(3) collate utf8_bin NOT NULL,
  `bin_name` varchar(255) collate utf8_bin NOT NULL,
  `bin_phone_match` varchar(3) collate utf8_bin NOT NULL,
  `bin_phone` varchar(32) collate utf8_bin NOT NULL,
  `customer_phone_in_billing_location` varchar(8) collate utf8_bin NOT NULL,
  `ship_forward` varchar(3) collate utf8_bin NOT NULL,
  `city_postal_match` varchar(3) collate utf8_bin NOT NULL,
  `ship_city_postal_match` varchar(3) collate utf8_bin NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text collate utf8_bin NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) collate utf8_bin NOT NULL,
  `error` text collate utf8_bin NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_order_fraud`
--


-- --------------------------------------------------------

--
-- 表的结构 `oc_order_voucher`
--

DROP TABLE IF EXISTS `oc_order_voucher`;
CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) collate utf8_bin NOT NULL,
  `code` varchar(10) collate utf8_bin NOT NULL,
  `from_name` varchar(64) collate utf8_bin NOT NULL,
  `from_email` varchar(96) collate utf8_bin NOT NULL,
  `to_name` varchar(64) collate utf8_bin NOT NULL,
  `to_email` varchar(96) collate utf8_bin NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text collate utf8_bin NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY  (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `oc_order_voucher`
--

