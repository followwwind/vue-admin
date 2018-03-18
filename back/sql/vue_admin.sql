CREATE DATABASE  IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `test`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version 5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动id',
  `creator` int(11) DEFAULT NULL COMMENT '活动创建人',
  `club_id` int(11) DEFAULT NULL COMMENT '活动所属社团id',
  `name` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '活动名称',
  `info` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '活动介绍',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '活动发布时间',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '活动结束时间',
  `end_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='活动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `club` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '社团id',
  `name` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '社团名称',
  `info` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '社团介绍',
  `status` int(2) DEFAULT NULL COMMENT '状态，0表示审核中，1表示审核通过，2表示审核失败',
  `count` int(11) DEFAULT NULL COMMENT '社团人数',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` int(11) DEFAULT NULL COMMENT '社团创建人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='社团';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `club_user`
--

DROP TABLE IF EXISTS `club_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `club_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `club_id` int(11) DEFAULT NULL COMMENT '社团id',
  `user_id` int(11) DEFAULT NULL COMMENT '社团成员id',
  `status` int(2) DEFAULT NULL COMMENT '状态，0表示审核中，1表示审核通过，2表示审核失败',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '加入社团时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='社团参与人员信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(45) COLLATE utf8_bin NOT NULL COMMENT '账号',
  `password` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `type` int(2) DEFAULT NULL COMMENT '类型，0表示管理员，1表示教师，2表示会员',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  UNIQUE KEY `user_id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `word`
--

DROP TABLE IF EXISTS `word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `word` (
  `word_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `context` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '留言内容',
  `user_id` int(11) DEFAULT NULL COMMENT '留言用户id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '留言发布时间',
  PRIMARY KEY (`word_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='留言板';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-18 17:58:02
