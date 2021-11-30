DROP DATABASE IF EXISTS notes_db;
CREATE DATABASE notes_db;
USE notes_db;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`name` varchar(100) NOT NULL,
`last_name` varchar(100) NOT NULL,
`e-mail` varchar(100) NOT NULL,
PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `managed_notes`;
CREATE TABLE `managed_notes` (
`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`data_managed_notes` varchar(100) NOT NULL,
PRIMARY KEY (`id`)
);


DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`title` varchar(100) DEFAULT NULL,
`creation_date` date DEFAULT NULL,
`last_modify` datetime DEFAULT NULL,
`description` text DEFAULT NULL,
`note_protection` decimal(6, 2) NOT NULL,
`user_id` int(10) UNSIGNED NOT NULL,
`state_notes_id` int(10) UNSIGNED NOT NULL,
PRIMARY KEY (`id`),
FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
FOREIGN KEY (`state_notes_id`) REFERENCES `managed_notes`(`id`)
);


DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`name` varchar(100) NOT NULL,
PRIMARY KEY (`id`)
);


DROP TABLE IF EXISTS `notes_categories`;
CREATE TABLE `notes_categories` (
`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`notes_id` int(10) UNSIGNED NOT NULL,
`categories_id` int(10) UNSIGNED NOT NULL,
PRIMARY KEY (`id`),
FOREIGN KEY (`notes_id`) REFERENCES `notes`(`id`),
FOREIGN KEY (`categories_id`) REFERENCES `categories`(`id`)
);



LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES (1,'Ramiro','Leiva','ramiroleiva@hotmail.com'),(2,'Jimena','Monteverde','jimemonteverde@hotmail.com'),(3,'Federico','Suárez','fedesuarez90@yahoo.com'),(4,'Lorenzo','Barco','lolo.barco@hotmail.com'),(5,'Bianca','Martínez','biancumartinez@hotmail.com'),(6,'Patricia','Linares','patolinares86@yahoo.com'),(7,'Marcelo','Ferreyra','marce_ferreyra@hotmail.com'),(8,'Lucia','Castillo','lucastillo97@hotmail.com'),(9,'Pablo','Medina','pablito.medina@hotmail.com'),(10,'Agustina','Varela','agusvarela98@yahoo.com');
UNLOCK TABLES;


LOCK TABLES `managed_notes` WRITE;
INSERT INTO `managed_notes` VALUES (1,'Created'),(2,'Modified'),(3,'Deleted');
UNLOCK TABLES;


LOCK TABLES `notes` WRITE;
INSERT INTO `notes` VALUES (1,NULL,'2020-11-04','2020-11-06 19:45:25',NULL,0,3,2),(2,NULL,'2021-01-10','2021-01-12 23:30:55',NULL,1,6,2),(3,NULL,'2021-04-24',NULL,NULL,1,7,1),(4,NULL,'2021-06-08','2021-06-11 10:20:13',NULL,1,3,2),(5,NULL,'2021-09-12','2021-09-14 11:05:22',NULL,1,9,2),(6,NULL,'2020-08-19','2020-08-22 16:37:40',NULL,0,1,2),(7,NULL,'2021-03-23',NULL,0,4,1),(8,NULL,'2021-03-01','2021-03-09 20:53:09',NULL,1,2,2),(9,NULL,'2021-07-25','2021-07-28 15:39:26',NULL,1,8,2),(10,NULL,'2021-05-04',NULL,NULL,1,5,3);
UNLOCK TABLES;


LOCK TABLES `categories` WRITE;
INSERT INTO `categories` VALUES (1,'Deportes'),(2,'Música'),(3,'Política'),(4,'Espectáculos'),(5,'Medio ambiente'),(6,'Arte/Cultura'),(7,'Economía'),(8,'Tecnología'),(9,'Policial'),(10,'Sociedad');
UNLOCK TABLES;


LOCK TABLES `notes_categories` WRITE;
INSERT INTO `notes_categories` VALUES (1,1,4),(2,2,3),(3,3,1),(4,4,10),(5,5,1),(6,6,7),(7,7,2),(8,8,5),(9,9,6),(10,NULL,NULL);
UNLOCK TABLES;