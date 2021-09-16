DROP DATABASE IF EXISTS notes_db;
CREATE DATABASE notes_db;
USE notes_db;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
`user_id` int(10) NOT NULL AUTO_INCREMENT,
`name` varchar(20) NOT NULL,
`last_name` varchar(20) NOT NULL,
`e-mail` varchar(40) NOT NULL,
PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES (1,'Ramiro','Leiva','ramiroleiva@hotmail.com'),(2,'Jimena','Monteverde','jimemonteverde@hotmail.com'),(3,'Federico','Suárez','fedesuarez90@yahoo.com'),(4,'Lorenzo','Barco','lolo.barco@hotmail.com'),(5,'Bianca','Martínez','biancumartinez@hotmail.com'),(6,'Patricia','Linares','patolinares86@yahoo.com'),(7,'Marcelo','Ferreyra','marce_ferreyra@hotmail.com'),(8,'Lucia','Castillo','lucastillo97@hotmail.com'),(9,'Pablo','Medina','pablito.medina@hotmail.com'),(10,'Agustina','Varela','agusvarela98@yahoo.com');
UNLOCK TABLES;


DROP TABLE IF EXISTS `managed_notes`;
CREATE TABLE `managed_notes` (
`managed_notes_id` tinyint(3) NOT NULL AUTO_INCREMENT,
`data_managed_notes` varchar(10) NOT NULL,
PRIMARY KEY (`managed_notes_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `managed_notes` WRITE;
INSERT INTO `managed_notes` VALUES (1,'Created'),(2,'Modified'),(3,'Deleted');
UNLOCK TABLES;


DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
`notes_id` int(10) NOT NULL AUTO_INCREMENT,
`user_notes_id` int(10) NOT NULL,
`title` varchar(100) DEFAULT NULL,
`creation_date` date DEFAULT NULL,
`last_modify` datetime DEFAULT NULL,
`description` text DEFAULT NULL,
`note_protection` tinyint(10) DEFAULT NULL,
`state_notes_id` tinyint(3) DEFAULT NULL,
PRIMARY KEY (`notes_id`),
KEY `notes_user_notes_id_foreign` (`user_notes_id`),
KEY `notes_state_notes_id_foreign` (`state_notes_id`),
CONSTRAINT `notes_user_notes_id_foreign` FOREIGN KEY (`user_notes_id`) REFERENCES `users`(`user_id`),
CONSTRAINT `notes_state_notes_id_foreign` FOREIGN KEY (`state_notes_id`) REFERENCES `managed_notes`(`managed_notes_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `notes` WRITE;
INSERT INTO `notes` VALUES (1,3,NULL,'2020-11-04','2020-11-06 19:45:25',NULL,0,2),(2,6,NULL,'2021-01-10','2021-01-12 23:30:55',NULL,1,2),(3,7,NULL,'2021-04-24',NULL,NULL,1,1),(4,3,NULL,'2021-06-08','2021-06-11 10:20:13',NULL,1,2),(5,9,NULL,'2021-09-12','2021-09-14 11:05:22',NULL,1,2),(6,1,NULL,'2020-08-19','2020-08-22 16:37:40',NULL,0,2),(7,4,NULL,'2021-03-23',NULL,0,1),(8,2,NULL,'2021-03-01','2021-03-09 20:53:09',NULL,1,2),(9,8,NULL,'2021-07-25','2021-07-28 15:39:26',NULL,1,2),(10,5,NULL,'2021-05-04',NULL,NULL,1,3);
UNLOCK TABLES;


DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
`categories_id` int(10) NOT NULL AUTO_INCREMENT,
`name` varchar(50) NOT NULL,
PRIMARY KEY (`caregories_id`),
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `categories` WRITE;
INSERT INTO `categories` VALUES (1,'Deportes'),(2,'Música'),(3,'Política'),(4,'Espectáculos'),(5,'Medio ambiente'),(6,'Arte/Cultura'),(7,'Economía'),(8,'Tecnología'),(9,'Policial'),(10,'Sociedad');
UNLOCK TABLES;


DROP TABLE IF EXISTS `notes_categories`;
CREATE TABLE `notes_categories` (
`notes_categories_id` int(10) NOT NULL AUTO_INCREMENT,
`notes_table_id` int(10) DEFAULT NULL,
`categories_table_id` tinyint(10) DEFAULT NULL,
PRIMARY KEY (`notes_categories_id`),
KEY `notes_categories_notes_table_id_foreign` (`notes_table_id`),
KEY `notes_categories_categories_table_id_foreign` (`categories_table_id`),
CONSTRAINT `notes_categories_notes_table_id_foreign` FOREIGN KEY (`notes_table_id`) REFERENCES `notes`(`notes_id`),
CONSTRAINT `notes_categories_categories_table_id_foreign` FOREIGN KEY (`categories_table_id`) REFERENCES `categories`(`categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `notes_categories` WRITE;
INSERT INTO `notes_categories` VALUES (1,1,4),(2,2,3),(3,3,1),(4,4,10),(5,5,1),(6,6,7),(7,7,2),(8,8,5),(9,9,6),(10,NULL,NULL);
UNLOCK TABLES;