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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table demo.migrations: ~9 rows (大约)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(5, '2019_11_14_060506_create_admins_table', 2),
	(8, '2019_11_16_025308_create_ceshi_table', 3),
	(12, '2019_11_19_023214_add_sex_to_ceshi_table', 5),
	(16, '2019_11_19_013012_create_article_table', 6),
	(17, '2019_11_21_151021_change_category_id_in_article_table', 6),
	(20, '2019_11_22_093110_add_api_token_to_users_table', 7),
	(21, '2018_08_08_100000_create_telescope_entries_table', 8);
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

-- Dumping structure for table demo.telescope_entries
CREATE TABLE IF NOT EXISTS `telescope_entries` (
  `sequence` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sequence`),
  UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  KEY `telescope_entries_batch_id_index` (`batch_id`),
  KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`),
  KEY `telescope_entries_family_hash_index` (`family_hash`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table demo.telescope_entries: ~15 rows (大约)
/*!40000 ALTER TABLE `telescope_entries` DISABLE KEYS */;
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
	(1, '8f36aeaf-e15f-4f87-a56a-5e51c8e0bc32', '8f36aeb4-84c8-4286-8078-79b6743042d0', 'ad7d07e5104cadcc6e9623dfc5fefdd8', 1, 'query', '{"connection":"mysql","bindings":[],"sql":"select * from information_schema.tables where table_schema = \'demo\' and table_name = \'migrations\' and table_type = \'BASE TABLE\'","time":"19.59","slow":false,"file":"D:\\\\laravel\\\\www\\\\laraveldemo58\\\\artisan","line":37,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 10:50:17'),
	(2, '8f36aeaf-f950-4243-bdab-ef68ca4f72f8', '8f36aeb4-84c8-4286-8078-79b6743042d0', 'ed08a59c7f0b8851f0fd2291ca94d5c7', 1, 'query', '{"connection":"mysql","bindings":[],"sql":"select `migration` from `migrations` order by `batch` asc, `migration` asc","time":"4.52","slow":false,"file":"D:\\\\laravel\\\\www\\\\laraveldemo58\\\\artisan","line":37,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 10:50:17'),
	(3, '8f36aeaf-fc9b-4ff3-b12d-7dc6fe51e533', '8f36aeb4-84c8-4286-8078-79b6743042d0', '06e60d7b3d1a0c2de504de4e6f27735e', 1, 'query', '{"connection":"mysql","bindings":[],"sql":"select max(`batch`) as aggregate from `migrations`","time":"3.89","slow":false,"file":"D:\\\\laravel\\\\www\\\\laraveldemo58\\\\artisan","line":37,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 10:50:17'),
	(4, '8f36aeb0-7c41-48fa-b1cb-06952943bb11', '8f36aeb4-84c8-4286-8078-79b6743042d0', 'd9429550f8856c1af1c89f24a6440cb5', 1, 'query', '{"connection":"mysql","bindings":[],"sql":"create table `telescope_entries` (`sequence` bigint unsigned not null auto_increment primary key, `uuid` char(36) not null, `batch_id` char(36) not null, `family_hash` varchar(255) null, `should_display_on_index` tinyint(1) not null default \'1\', `type` varchar(20) not null, `content` longtext not null, `created_at` datetime null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'","time":"250.60","slow":true,"file":"D:\\\\laravel\\\\www\\\\laraveldemo58\\\\artisan","line":37,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 10:50:18'),
	(5, '8f36aeb0-db05-40af-9b55-4d127f2caf82', '8f36aeb4-84c8-4286-8078-79b6743042d0', '9fb859ae1faff74c6b9e0b70dfd8eea9', 1, 'query', '{"connection":"mysql","bindings":[],"sql":"alter table `telescope_entries` add unique `telescope_entries_uuid_unique`(`uuid`)","time":"241.95","slow":true,"file":"D:\\\\laravel\\\\www\\\\laraveldemo58\\\\artisan","line":37,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 10:50:18'),
	(6, '8f36aeb1-45aa-4266-96b5-f61ba7bcdae1', '8f36aeb4-84c8-4286-8078-79b6743042d0', '2b075509a9242d6e3f622536c5ccca07', 1, 'query', '{"connection":"mysql","bindings":[],"sql":"alter table `telescope_entries` add index `telescope_entries_batch_id_index`(`batch_id`)","time":"272.33","slow":true,"file":"D:\\\\laravel\\\\www\\\\laraveldemo58\\\\artisan","line":37,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 10:50:18'),
	(7, '8f36aeb1-93da-422b-a055-6191ee519724', '8f36aeb4-84c8-4286-8078-79b6743042d0', '7317a4cad2dfa1a5167548a6acd0b6a5', 1, 'query', '{"connection":"mysql","bindings":[],"sql":"alter table `telescope_entries` add index `telescope_entries_type_should_display_on_index_index`(`type`, `should_display_on_index`)","time":"199.53","slow":true,"file":"D:\\\\laravel\\\\www\\\\laraveldemo58\\\\artisan","line":37,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 10:50:18'),
	(8, '8f36aeb1-e31c-471f-b5e0-2793e097d078', '8f36aeb4-84c8-4286-8078-79b6743042d0', '3d25a2a244bd2028dfa0326d3dbf7f4c', 1, 'query', '{"connection":"mysql","bindings":[],"sql":"alter table `telescope_entries` add index `telescope_entries_family_hash_index`(`family_hash`)","time":"202.24","slow":true,"file":"D:\\\\laravel\\\\www\\\\laraveldemo58\\\\artisan","line":37,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 10:50:18'),
	(9, '8f36aeb2-484f-42a8-b568-2bb71f5c2cd6', '8f36aeb4-84c8-4286-8078-79b6743042d0', '5ed47d3cfcd3051674e3cb7b613f0fba', 1, 'query', '{"connection":"mysql","bindings":[],"sql":"create table `telescope_entries_tags` (`entry_uuid` char(36) not null, `tag` varchar(255) not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'","time":"257.74","slow":true,"file":"D:\\\\laravel\\\\www\\\\laraveldemo58\\\\artisan","line":37,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 10:50:19'),
	(10, '8f36aeb2-a394-4bdb-ba9b-08fc508cfd6e', '8f36aeb4-84c8-4286-8078-79b6743042d0', 'd77cdf5585b51f60954d40e76786e20f', 1, 'query', '{"connection":"mysql","bindings":[],"sql":"alter table `telescope_entries_tags` add index `telescope_entries_tags_entry_uuid_tag_index`(`entry_uuid`, `tag`)","time":"232.22","slow":true,"file":"D:\\\\laravel\\\\www\\\\laraveldemo58\\\\artisan","line":37,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 10:50:19'),
	(11, '8f36aeb2-f59c-4cae-b473-f1fb125d47d4', '8f36aeb4-84c8-4286-8078-79b6743042d0', '0bdb35d17e876d6225a7774a2c17647d', 1, 'query', '{"connection":"mysql","bindings":[],"sql":"alter table `telescope_entries_tags` add index `telescope_entries_tags_tag_index`(`tag`)","time":"209.30","slow":true,"file":"D:\\\\laravel\\\\www\\\\laraveldemo58\\\\artisan","line":37,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 10:50:19'),
	(12, '8f36aeb4-13cb-42d0-a49f-8c0c27c58998', '8f36aeb4-84c8-4286-8078-79b6743042d0', '662a818f80a3a9ba2570081fd7a6af2f', 1, 'query', '{"connection":"mysql","bindings":[],"sql":"alter table `telescope_entries_tags` add constraint `telescope_entries_tags_entry_uuid_foreign` foreign key (`entry_uuid`) references `telescope_entries` (`uuid`) on delete cascade","time":"732.03","slow":true,"file":"D:\\\\laravel\\\\www\\\\laraveldemo58\\\\artisan","line":37,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 10:50:20'),
	(13, '8f36aeb4-7130-48bf-a4fd-faf7b5220518', '8f36aeb4-84c8-4286-8078-79b6743042d0', '8cddf327ba1b3bd52637b409200a4c1f', 1, 'query', '{"connection":"mysql","bindings":[],"sql":"create table `telescope_monitoring` (`tag` varchar(255) not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'","time":"238.32","slow":true,"file":"D:\\\\laravel\\\\www\\\\laraveldemo58\\\\artisan","line":37,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 10:50:20'),
	(14, '8f36aeb4-837b-4c1d-ba10-1f51fbce1fb4', '8f36aeb4-84c8-4286-8078-79b6743042d0', 'f2b8e8e4266db16aec6db940c643eb68', 1, 'query', '{"connection":"mysql","bindings":[],"sql":"insert into `migrations` (`migration`, `batch`) values (\'2018_08_08_100000_create_telescope_entries_table\', 8)","time":"45.16","slow":false,"file":"D:\\\\laravel\\\\www\\\\laraveldemo58\\\\artisan","line":37,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 10:50:20'),
	(15, '8f36aeb4-8479-4e65-91fd-e75ae66c65de', '8f36aeb4-84c8-4286-8078-79b6743042d0', NULL, 1, 'command', '{"command":"migrate","exit_code":0,"arguments":{"command":"migrate"},"options":{"database":null,"force":false,"path":[],"realpath":false,"pretend":false,"seed":false,"step":false,"help":false,"quiet":false,"verbose":false,"version":false,"ansi":false,"no-ansi":false,"no-interaction":false,"env":null},"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 10:50:20'),
	(16, '8f36af24-914d-4f8e-a5f1-1d2e76779845', '8f36af24-98b1-4fcc-a96d-d4c76f2ea25e', '7d38c2fa4c749d63bedfddce585f9a86', 1, 'exception', '{"class":"Symfony\\\\Component\\\\Console\\\\Exception\\\\NamespaceNotFoundException","file":"D:\\\\laravel\\\\www\\\\laraveldemo58\\\\vendor\\\\symfony\\\\console\\\\Application.php","line":598,"message":"There are no commands defined in the \\"telscope\\" namespace.\\n\\nDid you mean this?\\n    telescope","trace":[{"file":"D:\\\\laravel\\\\www\\\\laraveldemo58\\\\vendor\\\\symfony\\\\console\\\\Application.php","line":651,"function":"findNamespace","class":"Symfony\\\\Component\\\\Console\\\\Application","type":"->","args":["telscope"]},{"file":"D:\\\\laravel\\\\www\\\\laraveldemo58\\\\vendor\\\\symfony\\\\console\\\\Application.php","line":236,"function":"find","class":"Symfony\\\\Component\\\\Console\\\\Application","type":"->","args":["telscope:publish"]},{"file":"D:\\\\laravel\\\\www\\\\laraveldemo58\\\\vendor\\\\symfony\\\\console\\\\Application.php","line":148,"function":"doRun","class":"Symfony\\\\Component\\\\Console\\\\Application","type":"->","args":[{},{}]},{"file":"D:\\\\laravel\\\\www\\\\laraveldemo58\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Console\\\\Application.php","line":90,"function":"run","class":"Symfony\\\\Component\\\\Console\\\\Application","type":"->","args":[{},{}]},{"file":"D:\\\\laravel\\\\www\\\\laraveldemo58\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Console\\\\Kernel.php","line":133,"function":"run","class":"Illuminate\\\\Console\\\\Application","type":"->","args":[{},{}]},{"file":"D:\\\\laravel\\\\www\\\\laraveldemo58\\\\artisan","line":37,"function":"handle","class":"Illuminate\\\\Foundation\\\\Console\\\\Kernel","type":"->","args":[{},{}]}],"line_preview":{"589":"                if (1 == \\\\count($alternatives)) {","590":"                    $message .= \\"\\\\n\\\\nDid you mean this?\\\\n    \\";","591":"                } else {","592":"                    $message .= \\"\\\\n\\\\nDid you mean one of these?\\\\n    \\";","593":"                }","594":"","595":"                $message .= implode(\\"\\\\n    \\", $alternatives);","596":"            }","597":"","598":"            throw new NamespaceNotFoundException($message, $alternatives);","599":"        }","600":"","601":"        $exact = \\\\in_array($namespace, $namespaces, true);","602":"        if (\\\\count($namespaces) > 1 && !$exact) {","603":"            throw new NamespaceNotFoundException(sprintf(\\"The namespace \\\\\\"%s\\\\\\" is ambiguous.\\\\nDid you mean one of these?\\\\n%s\\", $namespace, $this->getAbbreviationSuggestions(array_values($namespaces))), array_values($namespaces));","604":"        }","605":"","606":"        return $exact ? $namespace : reset($namespaces);","607":"    }","608":""},"hostname":"DESKTOP-LNA9NCS","occurrences":1}', '2019-11-25 10:51:34'),
	(17, '8f36af3f-ed2d-4889-b83e-41a28c0ad702', '8f36af3f-f328-4f70-bf98-ef0e6268fc23', NULL, 1, 'command', '{"command":"telescope:publish","exit_code":0,"arguments":{"command":"telescope:publish"},"options":{"force":false,"help":false,"quiet":false,"verbose":false,"version":false,"ansi":false,"no-ansi":false,"no-interaction":false,"env":null},"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 10:51:52'),
	(18, '8f36b110-eade-4ba4-9744-de8ddcffe198', '8f36b110-f126-43fb-9aa1-c6cc05abf0a1', NULL, 1, 'command', '{"command":"vendor:publish","exit_code":0,"arguments":{"command":"vendor:publish"},"options":{"force":false,"all":false,"provider":null,"tag":["telescpoe-migrations"],"help":false,"quiet":false,"verbose":false,"version":false,"ansi":false,"no-ansi":false,"no-interaction":false,"env":null},"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 10:56:56'),
	(19, '8f36b761-a98b-426d-a7cc-6b9456096937', '8f36b761-fc02-4150-8918-7c41335d4c95', NULL, 1, 'cache', '{"type":"missed","key":"5c785c036466adea360111aa28563bfd556b5fba","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:14:36'),
	(20, '8f36b761-afd2-4b4c-877c-807f1c1a4065', '8f36b761-fc02-4150-8918-7c41335d4c95', NULL, 1, 'cache', '{"type":"missed","key":"5c785c036466adea360111aa28563bfd556b5fba:timer","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:14:36'),
	(21, '8f36b761-b18f-4dad-a075-c53c05c8bc71', '8f36b761-fc02-4150-8918-7c41335d4c95', NULL, 1, 'cache', '{"type":"set","key":"5c785c036466adea360111aa28563bfd556b5fba:timer","value":1574651736,"expiration":60,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:14:36'),
	(22, '8f36b761-b1c0-4524-9bb9-21dcad03943c', '8f36b761-fc02-4150-8918-7c41335d4c95', NULL, 1, 'cache', '{"type":"missed","key":"5c785c036466adea360111aa28563bfd556b5fba","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:14:36'),
	(23, '8f36b761-b225-4e3f-af6c-3cae5a4f3a1e', '8f36b761-fc02-4150-8918-7c41335d4c95', NULL, 1, 'cache', '{"type":"set","key":"5c785c036466adea360111aa28563bfd556b5fba","value":0,"expiration":60,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:14:36'),
	(24, '8f36b761-c7a3-4b46-afd5-13f77ac04487', '8f36b761-fc02-4150-8918-7c41335d4c95', NULL, 1, 'cache', '{"type":"hit","key":"5c785c036466adea360111aa28563bfd556b5fba","value":1,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:14:36'),
	(25, '8f36b761-f607-4f13-8a10-91808e05a766', '8f36b761-fc02-4150-8918-7c41335d4c95', NULL, 1, 'debugbar', '{"requestId":"X75da3200c3c4bd865a58bfb23294e03e","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:14:36'),
	(26, '8f36b761-fb9f-45ab-bcd7-5ff42f83bfe3', '8f36b761-fc02-4150-8918-7c41335d4c95', NULL, 1, 'request', '{"uri":"\\/api\\/v5\\/user?api_token=123456","method":"GET","controller_action":"Closure","middleware":["api"],"headers":{"host":"laraveldemo58.test","user-agent":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:70.0) Gecko\\/20100101 Firefox\\/70.0","accept":"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8","accept-language":"zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2","accept-encoding":"gzip, deflate","connection":"keep-alive","upgrade-insecure-requests":"1","pragma":"no-cache","cache-control":"no-cache"},"payload":{"api_token":"123456"},"session":[],"response_status":200,"response":"HTML Response","duration":906,"memory":6,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:14:36'),
	(27, '8f36bc09-ece8-4670-99a9-5e17eb32843d', '8f36bc09-fba4-4533-b436-d3f2bd42c16c', NULL, 1, 'cache', '{"type":"missed","key":"5c785c036466adea360111aa28563bfd556b5fba","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:27:37'),
	(28, '8f36bc09-ef2b-4082-b377-faa6fb6ad2c1', '8f36bc09-fba4-4533-b436-d3f2bd42c16c', NULL, 1, 'cache', '{"type":"missed","key":"5c785c036466adea360111aa28563bfd556b5fba:timer","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:27:37'),
	(29, '8f36bc09-eff0-42f4-9182-a23f44eb53ab', '8f36bc09-fba4-4533-b436-d3f2bd42c16c', NULL, 1, 'cache', '{"type":"set","key":"5c785c036466adea360111aa28563bfd556b5fba:timer","value":1574652517,"expiration":60,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:27:37'),
	(30, '8f36bc09-f01d-45eb-bb2c-225a38e1c02b', '8f36bc09-fba4-4533-b436-d3f2bd42c16c', NULL, 1, 'cache', '{"type":"missed","key":"5c785c036466adea360111aa28563bfd556b5fba","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:27:37'),
	(31, '8f36bc09-f081-464f-942b-c45001923e6b', '8f36bc09-fba4-4533-b436-d3f2bd42c16c', NULL, 1, 'cache', '{"type":"set","key":"5c785c036466adea360111aa28563bfd556b5fba","value":0,"expiration":60,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:27:37'),
	(32, '8f36bc09-f344-41e3-bdd7-f9794810b66f', '8f36bc09-fba4-4533-b436-d3f2bd42c16c', NULL, 1, 'cache', '{"type":"hit","key":"5c785c036466adea360111aa28563bfd556b5fba","value":1,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:27:37'),
	(33, '8f36bc09-fa46-4245-9da9-89a69bbdffc1', '8f36bc09-fba4-4533-b436-d3f2bd42c16c', NULL, 1, 'debugbar', '{"requestId":"Xda87bf820a06935bc58468f843ece141","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:27:37'),
	(34, '8f36bc09-fb51-47bb-872e-5af6a40fb636', '8f36bc09-fba4-4533-b436-d3f2bd42c16c', NULL, 1, 'request', '{"uri":"\\/api\\/v5\\/user?api_token=123456","method":"GET","controller_action":"Closure","middleware":["api"],"headers":{"host":"laraveldemo58.test","user-agent":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:70.0) Gecko\\/20100101 Firefox\\/70.0","accept":"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8","accept-language":"zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2","accept-encoding":"gzip, deflate","connection":"keep-alive","cookie":"XSRF-TOKEN=eyJpdiI6Illab2NoZHRjeTVyNXhMRWo4bEFXdGc9PSIsInZhbHVlIjoiZWhVXC83VWE4M2NcL1VaU2VzTXd3UlU3R3FQQXk5MGpmNnl2eFpycitjR2ZHK1FmcmtXSlpZSUthRVdXanFNMUhZIiwibWFjIjoiOGYxYWU1NjNhMDFmNjk0OWY2OWI2MDgxY2NjOTJkZmVhYWJiNDI5YjM1Zjc5YjU0YjVlOGQ2OGFiZjhkNjc1MSJ9; laravel_session=eyJpdiI6IjNlaERoeExzQkhKXC85ZzFzbER2ZGlRPT0iLCJ2YWx1ZSI6IlwvbkVhNFVkdVZRNmNRSGpNS0E5REhoVWtQNUdoMlZGWmNnaTE5UlN5ZlRMXC9NeHZhU3dYTlNZcDhYc0FmZE5IbCIsIm1hYyI6IjgxODBjN2VjZTgxZjZhZmI3MDY1MzUwZmU4ZTBiODFiNjFlZTdlMGRhYzJmYjMxMDgxYWVlZDAxMGFhOGMwYzkifQ%3D%3D","upgrade-insecure-requests":"1","pragma":"no-cache","cache-control":"no-cache"},"payload":{"api_token":"123456"},"session":[],"response_status":200,"response":"HTML Response","duration":316,"memory":6,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:27:37'),
	(35, '8f36bd88-acaf-4e8a-9c9f-0a46c452e7ad', '8f36bd88-bc01-428e-8d97-e233b48f3b6e', NULL, 1, 'cache', '{"type":"missed","key":"5c785c036466adea360111aa28563bfd556b5fba","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:31:48'),
	(36, '8f36bd88-ae5b-4bf8-bc6d-de079a6d8309', '8f36bd88-bc01-428e-8d97-e233b48f3b6e', NULL, 1, 'cache', '{"type":"missed","key":"5c785c036466adea360111aa28563bfd556b5fba:timer","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:31:48'),
	(37, '8f36bd88-af1e-4cf6-913a-e798c198ab4c', '8f36bd88-bc01-428e-8d97-e233b48f3b6e', NULL, 1, 'cache', '{"type":"set","key":"5c785c036466adea360111aa28563bfd556b5fba:timer","value":1574652768,"expiration":60,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:31:48'),
	(38, '8f36bd88-af4b-4faf-a7f3-4dec241bc2cd', '8f36bd88-bc01-428e-8d97-e233b48f3b6e', NULL, 1, 'cache', '{"type":"missed","key":"5c785c036466adea360111aa28563bfd556b5fba","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:31:48'),
	(39, '8f36bd88-afac-485f-92c2-72ef7a51fb90', '8f36bd88-bc01-428e-8d97-e233b48f3b6e', NULL, 1, 'cache', '{"type":"set","key":"5c785c036466adea360111aa28563bfd556b5fba","value":0,"expiration":60,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:31:48'),
	(40, '8f36bd88-b185-4328-b2da-8914135c5815', '8f36bd88-bc01-428e-8d97-e233b48f3b6e', NULL, 1, 'dump', '{"dump":"<pre class=sf-dump id=sf-dump-936189047 data-indent-pad=\\"  \\">\\"<span class=sf-dump-str title=\\"9 characters\\">telescope<\\/span>\\"\\n<\\/pre><script>Sfdump(\\"sf-dump-936189047\\")<\\/script>\\n","hostname":"DESKTOP-LNA9NCS","entry_point_type":"request","entry_point_uuid":"8f36bd88-bbb4-44c1-a47b-2e70b0152cc4","entry_point_description":"GET \\/api\\/v5\\/user?api_token=123456"}', '2019-11-25 11:31:48'),
	(41, '8f36bd88-b404-487e-85f0-d68d60123bb4', '8f36bd88-bc01-428e-8d97-e233b48f3b6e', NULL, 1, 'cache', '{"type":"hit","key":"5c785c036466adea360111aa28563bfd556b5fba","value":1,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:31:48'),
	(42, '8f36bd88-ba10-45f2-903c-fb94aa09d5ff', '8f36bd88-bc01-428e-8d97-e233b48f3b6e', NULL, 1, 'debugbar', '{"requestId":"Xd5a8bc2b79dc0a2ef0a6f7e97430ae74","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:31:48'),
	(43, '8f36bd88-bbb4-44c1-a47b-2e70b0152cc4', '8f36bd88-bc01-428e-8d97-e233b48f3b6e', NULL, 1, 'request', '{"uri":"\\/api\\/v5\\/user?api_token=123456","method":"GET","controller_action":"Closure","middleware":["api"],"headers":{"host":"laraveldemo58.test","user-agent":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:70.0) Gecko\\/20100101 Firefox\\/70.0","accept":"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8","accept-language":"zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2","accept-encoding":"gzip, deflate","connection":"keep-alive","cookie":"XSRF-TOKEN=eyJpdiI6ImVRcEVBejQzK1wvYWF4WGo3aDRqN3BnPT0iLCJ2YWx1ZSI6IlwvNFFtUEhTNjJTSTNKVmxKbnhBcFpxQ3c2d3ZuaUR3ZHpSZW40bFZyVDQxemFMcG9iNG01dmNDKzhiVzV4RXhXIiwibWFjIjoiOGM3NmZmNmU3NzRjMmUyNzFlNzM2YTg1YjkyMWYxMTRlM2Q5ZWRmMDc5MWQ5NWJjMjhiN2RkMTVmZjFiM2NmYSJ9; laravel_session=eyJpdiI6IktMTnlJVTc3akpFME94YnU4Mm9qSmc9PSIsInZhbHVlIjoiVFlVV2c3VjdVVSt4ZWtYYTZcL2JkSVdKNlI2MG5zcnpIdkZWMTh5VnFZZmZGZUZtMXFEM2hEXC9ZR2pFXC9mVkFaeCIsIm1hYyI6ImVkZTkwMGM2YmMxOWJkMmUxMGU0ZDVhMjc1ZDUxYTMxNjc1NjYzODNjOWJkMTAzM2RlNjgzMGY2YmM2ZmFmMzYifQ%3D%3D","upgrade-insecure-requests":"1","pragma":"no-cache","cache-control":"no-cache"},"payload":{"api_token":"123456"},"session":[],"response_status":200,"response":"HTML Response","duration":305,"memory":6,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:31:48'),
	(44, '8f36bdda-18a0-43ec-95cb-87af98ba8d33', '8f36bdda-2be9-4a99-8510-a8e6024a2870', NULL, 1, 'cache', '{"type":"hit","key":"5c785c036466adea360111aa28563bfd556b5fba","value":1,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:32:41'),
	(45, '8f36bdda-1a2a-46a9-b0d6-a5ec44529bc6', '8f36bdda-2be9-4a99-8510-a8e6024a2870', NULL, 1, 'cache', '{"type":"hit","key":"5c785c036466adea360111aa28563bfd556b5fba:timer","value":1574652768,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:32:41'),
	(46, '8f36bdda-1a6a-4057-a325-9cf251b99440', '8f36bdda-2be9-4a99-8510-a8e6024a2870', NULL, 1, 'cache', '{"type":"hit","key":"5c785c036466adea360111aa28563bfd556b5fba","value":1,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:32:41'),
	(47, '8f36bdda-2248-4fbb-a7c9-1f1cf4238588', '8f36bdda-2be9-4a99-8510-a8e6024a2870', NULL, 1, 'cache', '{"type":"hit","key":"5c785c036466adea360111aa28563bfd556b5fba","value":2,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:32:41'),
	(48, '8f36bdda-2a1b-46d5-9f25-f126f02ad683', '8f36bdda-2be9-4a99-8510-a8e6024a2870', NULL, 1, 'debugbar', '{"requestId":"X97351d01e0eeed640ecf77ebde4272df","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:32:41'),
	(49, '8f36bdda-2b92-4211-a85e-e40b7afbb5dd', '8f36bdda-2be9-4a99-8510-a8e6024a2870', NULL, 1, 'request', '{"uri":"\\/api\\/v5\\/user?api_token=123456","method":"GET","controller_action":"Closure","middleware":["api"],"headers":{"host":"laraveldemo58.test","user-agent":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:70.0) Gecko\\/20100101 Firefox\\/70.0","accept":"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8","accept-language":"zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2","accept-encoding":"gzip, deflate","connection":"keep-alive","cookie":"XSRF-TOKEN=eyJpdiI6ImEzYzRKdUN0OVpBOEY3M1huc0pcL0VRPT0iLCJ2YWx1ZSI6ImtURnFxdnkrRE9cL093UGVSVGRaK1RVTk9mVm5cL0c4d1ZHeHVcLzlTbFRGdDJ3Wm13eHNWcGFtbTdUZFFaK1V0RDMiLCJtYWMiOiI2M2EzNTdlNjc3OTNkODEyOWQ0ZDMzYjk2MGI1ZTJhZjc4MzUyOTczN2RmMjIxYWFmOTA3YjQxMTE1ZDhlZmJhIn0%3D; laravel_session=eyJpdiI6ImdDbml0cDVBaUhCOE41MVllTmZlRFE9PSIsInZhbHVlIjoiS05OMGZPT2FPTXhhNzBLYW0zcktZaXdudWpsSUhnUTZtSmVHU09mdlpqSzlnN3VRcXM1enVhRXlrZ2ZQTDBQSCIsIm1hYyI6IjQ5NDUxZDRjMmU1Y2QwYWZkODBhNjhhZjU1YjlkZjY2NzFlZmUyMzQ1MDRkZmFjMDEyYTA1MTVhNzg5YzExMDQifQ%3D%3D","upgrade-insecure-requests":"1","pragma":"no-cache","cache-control":"no-cache"},"payload":{"api_token":"123456"},"session":[],"response_status":200,"response":"HTML Response","duration":357,"memory":6,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:32:41'),
	(50, '8f36c042-4c19-4481-a79b-01575d7d8f8a', '8f36c042-5c3e-4c75-9a79-305aa5cae1dd', NULL, 1, 'cache', '{"type":"missed","key":"5c785c036466adea360111aa28563bfd556b5fba","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:39:25'),
	(51, '8f36c042-4dc6-48d0-9b6d-2391c2125bdd', '8f36c042-5c3e-4c75-9a79-305aa5cae1dd', NULL, 1, 'cache', '{"type":"missed","key":"5c785c036466adea360111aa28563bfd556b5fba:timer","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:39:25'),
	(52, '8f36c042-4ea2-463e-9eaa-7ec7022e22a5', '8f36c042-5c3e-4c75-9a79-305aa5cae1dd', NULL, 1, 'cache', '{"type":"set","key":"5c785c036466adea360111aa28563bfd556b5fba:timer","value":1574653225,"expiration":60,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:39:25'),
	(53, '8f36c042-4edd-4f11-a9fc-f8e7502b9884', '8f36c042-5c3e-4c75-9a79-305aa5cae1dd', NULL, 1, 'cache', '{"type":"missed","key":"5c785c036466adea360111aa28563bfd556b5fba","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:39:25'),
	(54, '8f36c042-4f50-45cd-8da6-4f829108ca25', '8f36c042-5c3e-4c75-9a79-305aa5cae1dd', NULL, 1, 'cache', '{"type":"set","key":"5c785c036466adea360111aa28563bfd556b5fba","value":0,"expiration":60,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:39:25'),
	(55, '8f36c042-5226-4e0b-b936-5e2c66579226', '8f36c042-5c3e-4c75-9a79-305aa5cae1dd', NULL, 1, 'dump', '{"dump":"<pre class=sf-dump id=sf-dump-2125312613 data-indent-pad=\\"  \\">\\"<span class=sf-dump-str title=\\"9 characters\\">telescope<\\/span>\\"\\n<\\/pre><script>Sfdump(\\"sf-dump-2125312613\\")<\\/script>\\n","hostname":"DESKTOP-LNA9NCS","entry_point_type":"request","entry_point_uuid":"8f36c042-5bf9-417b-9385-2d3674da4518","entry_point_description":"GET \\/api\\/v5\\/user?api_token=123456"}', '2019-11-25 11:39:25'),
	(56, '8f36c042-5414-4ac0-b85b-b27e344aa4c0', '8f36c042-5c3e-4c75-9a79-305aa5cae1dd', NULL, 1, 'cache', '{"type":"hit","key":"5c785c036466adea360111aa28563bfd556b5fba","value":1,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:39:25'),
	(57, '8f36c042-5ad8-4cff-b297-8723538b0d6d', '8f36c042-5c3e-4c75-9a79-305aa5cae1dd', NULL, 1, 'debugbar', '{"requestId":"X07715ce2e0980a4e5c92df8cd4c699c6","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:39:25'),
	(58, '8f36c042-5bf9-417b-9385-2d3674da4518', '8f36c042-5c3e-4c75-9a79-305aa5cae1dd', NULL, 1, 'request', '{"uri":"\\/api\\/v5\\/user?api_token=123456","method":"GET","controller_action":"Closure","middleware":["api"],"headers":{"host":"laraveldemo58.test","user-agent":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:70.0) Gecko\\/20100101 Firefox\\/70.0","accept":"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8","accept-language":"zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2","accept-encoding":"gzip, deflate","connection":"keep-alive","cookie":"XSRF-TOKEN=eyJpdiI6IjJMeDJTbkZqNE9qZEpuUldnYlh2dHc9PSIsInZhbHVlIjoiMVwvU2tEWmtDR0lcL1Z0TVlCYjh5d0RxUnRYamljb1h4Z3k3ejZMa1V3elVJWUxOMjNNK1JOb3o5KzdTTmM4ZEU1IiwibWFjIjoiNDhlNDk4ODMyMmYzYzlhY2NiZDNjNjIyMDFkZjUzODEzMWVmNGJlNGY2ZDdkZTlkMmQzODQxNGQ5YWU1YzY5ZSJ9; laravel_session=eyJpdiI6Ikg2NFNCMVorRXZrVzVST01BK2E1VWc9PSIsInZhbHVlIjoicFVBK1VYdHFDMnh5bGZ2bmp3M1Y2RTJUaDFWWXpmSDFGdnVidEZSRDlSa2RtbStMVUxPeGVJV1ViR0EyY3FPVSIsIm1hYyI6ImNjNDdjNDY0YzI2ZGRmOTMxNzYzZjdiY2ZiNWM1NDI0N2EzNTlmMGU1YjFjNDM5NGEzZjEzYjFmZWExZmZlOTEifQ%3D%3D","upgrade-insecure-requests":"1","pragma":"no-cache","cache-control":"no-cache"},"payload":{"api_token":"123456"},"session":[],"response_status":200,"response":"HTML Response","duration":330,"memory":6,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:39:25'),
	(59, '8f36c048-bb3d-464b-9746-d3a0081bc623', '8f36c048-ca35-4414-b75a-a62582d30a31', NULL, 1, 'cache', '{"type":"hit","key":"5c785c036466adea360111aa28563bfd556b5fba","value":1,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:39:29'),
	(60, '8f36c048-bd33-40f6-839c-ca170b32f193', '8f36c048-ca35-4414-b75a-a62582d30a31', NULL, 1, 'cache', '{"type":"hit","key":"5c785c036466adea360111aa28563bfd556b5fba:timer","value":1574653225,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:39:29'),
	(61, '8f36c048-bd8c-4323-af78-25763853ab98', '8f36c048-ca35-4414-b75a-a62582d30a31', NULL, 1, 'cache', '{"type":"hit","key":"5c785c036466adea360111aa28563bfd556b5fba","value":1,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:39:29'),
	(62, '8f36c048-bf44-42f1-9ab8-ea2dcc43462a', '8f36c048-ca35-4414-b75a-a62582d30a31', NULL, 1, 'dump', '{"dump":"<pre class=sf-dump id=sf-dump-989416710 data-indent-pad=\\"  \\">\\"<span class=sf-dump-str title=\\"9 characters\\">telescope<\\/span>\\"\\n<\\/pre><script>Sfdump(\\"sf-dump-989416710\\")<\\/script>\\n","hostname":"DESKTOP-LNA9NCS","entry_point_type":"request","entry_point_uuid":"8f36c048-c9de-4a9b-ada4-a1c8924a74ef","entry_point_description":"GET \\/api\\/v5\\/user?api_token=123456"}', '2019-11-25 11:39:29'),
	(63, '8f36c048-c118-4cf8-8e77-087a2901b6c9', '8f36c048-ca35-4414-b75a-a62582d30a31', NULL, 1, 'cache', '{"type":"hit","key":"5c785c036466adea360111aa28563bfd556b5fba","value":2,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:39:29'),
	(64, '8f36c048-c739-4e13-bed8-c399b0111fb0', '8f36c048-ca35-4414-b75a-a62582d30a31', NULL, 1, 'debugbar', '{"requestId":"Xe8c5b0b38a8712052cd61ce8a0e644fb","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:39:30'),
	(65, '8f36c048-c9de-4a9b-ada4-a1c8924a74ef', '8f36c048-ca35-4414-b75a-a62582d30a31', NULL, 1, 'request', '{"uri":"\\/api\\/v5\\/user?api_token=123456","method":"GET","controller_action":"Closure","middleware":["api"],"headers":{"host":"laraveldemo58.test","user-agent":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:70.0) Gecko\\/20100101 Firefox\\/70.0","accept":"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8","accept-language":"zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2","accept-encoding":"gzip, deflate","connection":"keep-alive","cookie":"XSRF-TOKEN=eyJpdiI6IkNJV3NNMEpxU3BwZStGSFZLSkFqSnc9PSIsInZhbHVlIjoiTzdBTnF1RGR0QmhKWU5RUk5WZWZ3aGtGc2NKdWhFZWlmbjFpNWFXYjd6Z05HR0h2VVljYlhiUGtGV0FuRUF0UiIsIm1hYyI6IjBkMWM4MzhmZGM3NTNkOTViZTNhZDZkMWMwNDQ4OGQ0ZDVmODMwMDVlMTBmMWU5MGUyOTJmMzE4NmI2OWEzODAifQ%3D%3D; laravel_session=eyJpdiI6ImFJN2wzZWk2Vk8wclBnU3duKzdVV1E9PSIsInZhbHVlIjoiNjRSU2hLREIrTHlQS1BPaDgzd0RnSDZUVDZBbUJacnVkVmFEQmZ0cmIzdGpZQmpKa3Z1Szdnd0tTXC9lU1Y5SzUiLCJtYWMiOiI5ZWM3ZGUzMDMwYTM5NjRmMGFlN2NjNGM2NDg4YzRjZjMzNjMxZTdhNzg2M2M3YmZkZTMwMGQ5M2M1MDdmYjE5In0%3D","upgrade-insecure-requests":"1","pragma":"no-cache","cache-control":"no-cache"},"payload":{"api_token":"123456"},"session":[],"response_status":200,"response":"HTML Response","duration":299,"memory":6,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:39:30'),
	(66, '8f36c06e-4d9d-4bbe-8535-58ce472edd47', '8f36c06e-5a06-40c6-bf58-db0b2102792a', NULL, 1, 'cache', '{"type":"hit","key":"5c785c036466adea360111aa28563bfd556b5fba","value":2,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:39:54'),
	(67, '8f36c06e-4f61-442b-8001-3e3847dd8292', '8f36c06e-5a06-40c6-bf58-db0b2102792a', NULL, 1, 'cache', '{"type":"hit","key":"5c785c036466adea360111aa28563bfd556b5fba:timer","value":1574653225,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:39:54'),
	(68, '8f36c06e-4fa7-4f66-95c5-fb56e23ed85d', '8f36c06e-5a06-40c6-bf58-db0b2102792a', NULL, 1, 'cache', '{"type":"hit","key":"5c785c036466adea360111aa28563bfd556b5fba","value":2,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:39:54'),
	(69, '8f36c06e-5159-4d81-99cc-e22b676a6ea2', '8f36c06e-5a06-40c6-bf58-db0b2102792a', NULL, 1, 'dump', '{"dump":"<pre class=sf-dump id=sf-dump-216889619 data-indent-pad=\\"  \\">\\"<span class=sf-dump-str title=\\"9 characters\\">telescope<\\/span>\\"\\n<\\/pre><script>Sfdump(\\"sf-dump-216889619\\")<\\/script>\\n","hostname":"DESKTOP-LNA9NCS","entry_point_type":"request","entry_point_uuid":"8f36c06e-59be-474c-b6c4-cdd9184dcfca","entry_point_description":"GET \\/api\\/v5\\/user?api_token=123456"}', '2019-11-25 11:39:54'),
	(70, '8f36c06e-52f6-4524-9038-3be7c7e77e31', '8f36c06e-5a06-40c6-bf58-db0b2102792a', NULL, 1, 'cache', '{"type":"hit","key":"5c785c036466adea360111aa28563bfd556b5fba","value":3,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:39:54'),
	(71, '8f36c06e-58c7-4c50-a90b-fab333592519', '8f36c06e-5a06-40c6-bf58-db0b2102792a', NULL, 1, 'debugbar', '{"requestId":"X8b54ea14a47aca7ad399551ab97f5870","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:39:54'),
	(72, '8f36c06e-59be-474c-b6c4-cdd9184dcfca', '8f36c06e-5a06-40c6-bf58-db0b2102792a', NULL, 1, 'request', '{"uri":"\\/api\\/v5\\/user?api_token=123456","method":"GET","controller_action":"Closure","middleware":["api"],"headers":{"host":"laraveldemo58.test","user-agent":"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:70.0) Gecko\\/20100101 Firefox\\/70.0","accept":"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8","accept-language":"zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2","accept-encoding":"gzip, deflate","connection":"keep-alive","cookie":"XSRF-TOKEN=eyJpdiI6Im9DT0lIdldOOWM0b1pGbHdmbG1mK0E9PSIsInZhbHVlIjoidENqTktRc2tOcCs0YXAxUlJpWE5cLzdza1MxNEt6Qndxa2JCQlBnelwvSXJwaE5laklkWVV4MXhJYWk3UmRaRmpSIiwibWFjIjoiY2NjMWI2NWNlNGFjZTBiZDUzZGM2MTNmYjZkM2I1NmZkY2U3MmQ4ZjZiMTViM2U2YmRlOTA0ZjU5ODBkNTFkNSJ9; laravel_session=eyJpdiI6ImR1cHFDS1dhaXJrbmJsamxlUEdKS1E9PSIsInZhbHVlIjoic0lBZlA0V1grYXlsWTNCbkNDenBNdWZkUFBoMkIyRTB2Myt5M3QyM056SXhKT3psTlwvOFB6VVZLRlUzUzcrXC8yIiwibWFjIjoiNGFkMmRlOWIxYzFmZjgxYjQ2NzIwYjkyMGI3OTc2MjQ0YTBkMTQwYTZlNTVkMGM3N2FkMWM4MTdhZmNmN2E5OCJ9","upgrade-insecure-requests":"1","pragma":"no-cache","cache-control":"no-cache"},"payload":{"api_token":"123456"},"session":[],"response_status":200,"response":"HTML Response","duration":285,"memory":6,"hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:39:54'),
	(73, '8f36c080-f911-47a5-9f23-457728409d60', '8f36c080-fa4d-4eb7-b133-4c11c78cd0f5', NULL, 1, 'debugbar', '{"requestId":"X21e9921867dfc5ea0bac0a69a72cd460","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:40:06'),
	(74, '8f36c086-5ecc-448d-a561-c24dd316d0df', '8f36c086-6513-4a19-8b01-2cadaefb6818', NULL, 1, 'debugbar', '{"requestId":"X00ad12e016ea87269124134a311e56d3","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:40:10'),
	(75, '8f36c08b-b38d-4204-be13-612ebe4f6fb5', '8f36c08b-b49d-4209-a3b0-301e7d0477d4', NULL, 1, 'debugbar', '{"requestId":"X0b8531871da773bad501d75c928b0584","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:40:13'),
	(76, '8f36c09e-8a1d-4d0d-a857-b264610f057b', '8f36c09e-8bff-4d1f-8268-9d07e3544193', NULL, 1, 'debugbar', '{"requestId":"X056a458ac9d1cfc0d643d02dd4f59fe8","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:40:26'),
	(77, '8f36c0a2-951a-44d4-be80-a33ee92b30c4', '8f36c0a2-9739-4e0d-af43-78ce3c6adff4', NULL, 1, 'debugbar', '{"requestId":"X4cc353117c0280ac037b8d32be0ab18c","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:40:28'),
	(78, '8f36c0a6-45fe-4830-8421-1bbe82315f24', '8f36c0a6-47d3-49d5-96a5-56b7ce505e06', NULL, 1, 'debugbar', '{"requestId":"X63809b7af261c69fc4a212a752986895","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:40:31'),
	(79, '8f36c0c9-2400-4990-a06a-ccd69c84ec2e', '8f36c0c9-25b5-420b-9ce6-ca8e9544f02d', NULL, 1, 'debugbar', '{"requestId":"X43940a05dbb649486bab412e68789af8","hostname":"DESKTOP-LNA9NCS"}', '2019-11-25 11:40:54');
/*!40000 ALTER TABLE `telescope_entries` ENABLE KEYS */;

-- Dumping structure for table demo.telescope_entries_tags
CREATE TABLE IF NOT EXISTS `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  KEY `telescope_entries_tags_tag_index` (`tag`),
  CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table demo.telescope_entries_tags: ~10 rows (大约)
/*!40000 ALTER TABLE `telescope_entries_tags` DISABLE KEYS */;
INSERT INTO `telescope_entries_tags` (`entry_uuid`, `tag`) VALUES
	('8f36aeb0-7c41-48fa-b1cb-06952943bb11', 'slow'),
	('8f36aeb0-db05-40af-9b55-4d127f2caf82', 'slow'),
	('8f36aeb1-45aa-4266-96b5-f61ba7bcdae1', 'slow'),
	('8f36aeb1-93da-422b-a055-6191ee519724', 'slow'),
	('8f36aeb1-e31c-471f-b5e0-2793e097d078', 'slow'),
	('8f36aeb2-484f-42a8-b568-2bb71f5c2cd6', 'slow'),
	('8f36aeb2-a394-4bdb-ba9b-08fc508cfd6e', 'slow'),
	('8f36aeb2-f59c-4cae-b473-f1fb125d47d4', 'slow'),
	('8f36aeb4-13cb-42d0-a49f-8c0c27c58998', 'slow'),
	('8f36aeb4-7130-48bf-a4fd-faf7b5220518', 'slow');
/*!40000 ALTER TABLE `telescope_entries_tags` ENABLE KEYS */;

-- Dumping structure for table demo.telescope_monitoring
CREATE TABLE IF NOT EXISTS `telescope_monitoring` (
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table demo.telescope_monitoring: ~0 rows (大约)
/*!40000 ALTER TABLE `telescope_monitoring` DISABLE KEYS */;
/*!40000 ALTER TABLE `telescope_monitoring` ENABLE KEYS */;

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

-- Dumping data for table demo.users: ~2 rows (大约)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'userhui', '191207953@qq.com', '2019-11-22 10:41:58', '123456', '123456', NULL, NULL, NULL),
	(2, 'userlsdf', 'slkdjf@sd.cn', NULL, '$2y$10$0bJTq9V.2VP2i6X1ctpzDultJKhbs8/RnMQOsOWqJOEiyAX3nXvHG', 'WDeg5C8htVR4wXOdwiUiwPbNzaSFhuwC8htHHmpiFRbz9u99FzWIMH1chCGJ', NULL, '2019-11-22 10:54:03', '2019-11-22 10:54:03');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
