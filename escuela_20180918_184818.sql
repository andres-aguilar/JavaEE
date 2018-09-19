/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- DROP DATABASE "escuela" ---------------------------------
DROP DATABASE IF EXISTS `escuela`;
-- ---------------------------------------------------------


-- CREATE DATABASE "escuela" -------------------------------
CREATE DATABASE `escuela` CHARACTER SET utf8 COLLATE utf8_bin;
USE `escuela`;
-- ---------------------------------------------------------


-- CREATE TABLE "course" ---------------------------------------
CREATE TABLE `course` ( 
	`id_course` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`id_teacher` Int( 11 ) NULL,
	`name` VarChar( 250 ) CHARACTER SET utf8 COLLATE utf8_bin NULL,
	`themes` MediumText CHARACTER SET utf8 COLLATE utf8_bin NULL,
	`project` VarChar( 250 ) CHARACTER SET utf8 COLLATE utf8_bin NULL,
	PRIMARY KEY ( `id_course` ) )
CHARACTER SET = utf8
COLLATE = utf8_bin
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "teacher" --------------------------------------
CREATE TABLE `teacher` ( 
	`id_teacher` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 250 ) CHARACTER SET utf8 COLLATE utf8_bin NULL,
	`avatar` VarChar( 250 ) CHARACTER SET utf8 COLLATE utf8_bin NULL,
	PRIMARY KEY ( `id_teacher` ) )
CHARACTER SET = utf8
COLLATE = utf8_bin
ENGINE = InnoDB;
-- -------------------------------------------------------------

-- CREATE TABLE "social_media" ---------------------------------
CREATE TABLE `social_media` ( 
	`id_social_media` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 250 ) CHARACTER SET utf8 COLLATE utf8_bin NULL,
	`icon` VarChar( 250 ) CHARACTER SET utf8 COLLATE utf8_bin NULL,
	PRIMARY KEY ( `id_social_media` ) )
CHARACTER SET = utf8
COLLATE = utf8_bin
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "teacher_social_media" -------------------------
CREATE TABLE `teacher_social_media` ( 
	`id_teacher_social_media` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`id_teacher` Int( 11 ) NULL,
	`id_social_media` Int( 11 ) NULL,
	`nickname` VarChar( 250 ) CHARACTER SET utf8 COLLATE utf8_bin NULL,
	PRIMARY KEY ( `id_teacher_social_media` ) )
CHARACTER SET = utf8
COLLATE = utf8_bin
ENGINE = InnoDB;

-- CREATE INDEX 
CREATE INDEX `index_teacher_id` USING BTREE ON `course`( `id_teacher` );
CREATE INDEX `index_social_media_id` USING BTREE ON `teacher_social_media`( `id_social_media` );
CREATE INDEX `index_teacher_id1` USING BTREE ON `teacher_social_media`( `id_teacher` );
-- -------------------------------------------------------------


ALTER TABLE `course`
	ADD CONSTRAINT `lnk_teacher_course` FOREIGN KEY ( `id_teacher` )
	REFERENCES `teacher`( `id_teacher` )
	ON DELETE Cascade
	ON UPDATE Cascade;

ALTER TABLE `teacher_social_media`
	ADD CONSTRAINT `lnk_teacher_social_media` FOREIGN KEY ( `id_teacher` )
	REFERENCES `teacher`( `id_teacher` )
	ON DELETE Cascade
	ON UPDATE Cascade;

ALTER TABLE `teacher_social_media`
	ADD CONSTRAINT `lnk_social_media` FOREIGN KEY ( `id_social_media` )
	REFERENCES `social_media`( `id_social_media` )
	ON DELETE Cascade
	ON UPDATE Cascade;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


