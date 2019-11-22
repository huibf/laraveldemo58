-- --------------------------------------------------------
-- 主机:                           localhost
-- 服务器版本:                        5.7.24 - MySQL Community Server (GPL)
-- 服务器OS:                        Win64
-- HeidiSQL 版本:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for demo
CREATE DATABASE IF NOT EXISTS `demo` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `demo`;

-- Dumping structure for table demo.admins
CREATE TABLE IF NOT EXISTS `admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table demo.admins: ~7 rows (大约)
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` (`id`, `username`, `password`, `created_at`, `updated_at`) VALUES
	(2, 'admin', '$2y$10$qzOQxT2GopemgQ5JBwxLPu8yhxftZXte06xe5Om7y2/IaPPfVZy3y', '2019-11-14 06:43:28', '2019-11-14 06:43:28'),
	(3, 'Adrienne Murazik PhD', '$2y$10$qzOQxT2GopemgQ5JBwxLPu8yhxftZXte06xe5Om7y2/IaPPfVZy3y', '2019-11-14 06:43:30', '2019-11-14 06:43:30'),
	(4, 'Kellie Mitchell', '$2y$10$hU4e./cgZAqyby.yhhjRme/ecu9oqMq2gIm16dcOV77LZ/0X/Tj.q', '2019-11-14 06:43:30', '2019-11-14 06:43:30'),
	(5, 'Erika Bednar', '$2y$10$f2JQrQol2TGTmnTjz2WIXelOtd0m6ahvS3PR4X0sXnqnKw48p8Peq', '2019-11-16 07:21:57', '2019-11-16 07:21:57'),
	(6, 'Prof. Caleigh Russel DVM', '$2y$10$f2JQrQol2TGTmnTjz2WIXelOtd0m6ahvS3PR4X0sXnqnKw48p8Peq', '2019-11-16 07:23:15', '2019-11-16 07:23:15'),
	(7, 'Miss Clare Bartell', '$2y$10$hU4e./cgZAqyby.yhhjRme/ecu9oqMq2gIm16dcOV77LZ/0X/Tj.q', '2019-11-16 07:25:09', '2019-11-16 07:25:09'),
	(8, 'Watson Klein', '$2y$10$hU4e./cgZAqyby.yhhjRme/ecu9oqMq2gIm16dcOV77LZ/0X/Tj.q', '2019-11-16 07:31:48', '2019-11-16 07:31:48'),
	(9, '吴智敏', '$2y$10$PqiPwT6gLHRVjh9p.zMNA.AFIyKg.bPL1vC6TaeaBfwDmhG7m.L0W', '2019-11-16 07:34:47', '2019-11-16 07:34:47');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;

-- Dumping structure for table demo.article
CREATE TABLE IF NOT EXISTS `article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分类id',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `tag_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签id',
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题图片',
  `author` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `realname` char(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '真实姓名',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table demo.article: ~0 rows (大约)
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
/*!40000 ALTER TABLE `article` ENABLE KEYS */;

-- Dumping structure for table demo.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table demo.migrations: ~8 rows (大约)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(5, '2019_11_14_060506_create_admins_table', 2),
	(8, '2019_11_16_025308_create_ceshi_table', 3),
	(12, '2019_11_19_023214_add_sex_to_ceshi_table', 5),
	(16, '2019_11_19_013012_create_article_table', 6),
	(17, '2019_11_21_151021_change_category_id_in_article_table', 6),
	(20, '2019_11_22_093110_add_api_token_to_users_table', 7);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table demo.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table demo.password_resets: ~0 rows (大约)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table demo.tbl_ceshi
CREATE TABLE IF NOT EXISTS `tbl_ceshi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `age` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table demo.tbl_ceshi: ~8 rows (大约)
/*!40000 ALTER TABLE `tbl_ceshi` DISABLE KEYS */;
INSERT INTO `tbl_ceshi` (`id`, `name`, `age`) VALUES
	(1, 'huibf', 10),
	(2, 'laozhu', 15),
	(3, 'longjie', 45),
	(4, 'Wruce Bayne', 10),
	(5, 'Wruce Bayne', 10),
	(6, 'Wruce Bayne', 10),
	(7, 'Wruce Bayne', 10),
	(8, 'Wruce Bayne', 10),
	(9, 'Wruce Bayne', 10);
/*!40000 ALTER TABLE `tbl_ceshi` ENABLE KEYS */;

-- Dumping structure for table demo.tbl_failed_jobs
CREATE TABLE IF NOT EXISTS `tbl_failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table demo.tbl_failed_jobs: ~0 rows (大约)
/*!40000 ALTER TABLE `tbl_failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_failed_jobs` ENABLE KEYS */;

-- Dumping structure for table demo.tbl_migrations
CREATE TABLE IF NOT EXISTS `tbl_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table demo.tbl_migrations: ~4 rows (大约)
/*!40000 ALTER TABLE `tbl_migrations` DISABLE KEYS */;
INSERT INTO `tbl_migrations` (`id`, `migration`, `batch`) VALUES
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2014_10_12_000000_create_users_table', 2);
/*!40000 ALTER TABLE `tbl_migrations` ENABLE KEYS */;

-- Dumping structure for table demo.tbl_password_resets
CREATE TABLE IF NOT EXISTS `tbl_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `tbl_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table demo.tbl_password_resets: ~0 rows (大约)
/*!40000 ALTER TABLE `tbl_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_password_resets` ENABLE KEYS */;

-- Dumping structure for table demo.tbl_users
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table demo.tbl_users: ~0 rows (大约)
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'huibf', '15222@sldk.dsd', NULL, '123456', NULL, NULL, NULL);
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;

-- Dumping structure for table demo.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table demo.users: ~1 rows (大约)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'userhui', '191207953@qq.com', '2019-11-22 10:41:58', '123456', '123456', NULL, NULL, NULL),
	(2, 'userlsdf', 'slkdjf@sd.cn', NULL, '$2y$10$0bJTq9V.2VP2i6X1ctpzDultJKhbs8/RnMQOsOWqJOEiyAX3nXvHG', 'WDeg5C8htVR4wXOdwiUiwPbNzaSFhuwC8htHHmpiFRbz9u99FzWIMH1chCGJ', NULL, '2019-11-22 10:54:03', '2019-11-22 10:54:03');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
