-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               8.0.28 - MySQL Community Server - GPL
-- Операционная система:         Win64
-- HeidiSQL Версия:              12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Дамп структуры для таблица users_groups.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы users_groups.groups: ~4 rows (приблизительно)
INSERT INTO `groups` (`id`, `name`) VALUES
	(1, 'group1'),
	(2, 'group2'),
	(3, 'group3'),
	(4, 'group4');

-- Дамп структуры для таблица users_groups.privileges
CREATE TABLE IF NOT EXISTS `privileges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы users_groups.privileges: ~3 rows (приблизительно)
INSERT INTO `privileges` (`id`, `name`) VALUES
	(1, 'send_messages'),
	(2, 'service_api'),
	(3, 'debug');

-- Дамп структуры для таблица users_groups.privileges_groups
CREATE TABLE IF NOT EXISTS `privileges_groups` (
  `privilege_id` int DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы users_groups.privileges_groups: ~6 rows (приблизительно)
INSERT INTO `privileges_groups` (`privilege_id`, `group_id`) VALUES
	(1, 1),
	(2, 2),
	(1, 3),
	(2, 3),
	(3, 3),
	(3, 4);

-- Дамп структуры для таблица users_groups.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы users_groups.users: ~0 rows (приблизительно)
INSERT INTO `users` (`id`, `name`) VALUES
	(1, 'user1'),
	(2, 'user2'),
	(3, 'user3');

-- Дамп структуры для таблица users_groups.users_groups
CREATE TABLE IF NOT EXISTS `users_groups` (
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  `exclude` tinyint DEFAULT NULL,
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы users_groups.users_groups: ~5 rows (приблизительно)
INSERT INTO `users_groups` (`user_id`, `group_id`, `exclude`) VALUES
	(1, 1, NULL),
	(1, 2, NULL),
	(2, 3, NULL),
	(2, 4, 1),
	(3, 3, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
