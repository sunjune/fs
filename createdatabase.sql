-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.27 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-04-26 21:45:46
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for filesystem
CREATE DATABASE IF NOT EXISTS `filesystem` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `filesystem`;


-- Dumping structure for table filesystem.fs_log
CREATE TABLE IF NOT EXISTS `fs_log` (
  `log_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `fs_id` int(10) DEFAULT NULL COMMENT '对应的文件树id',
  `fs_name` varchar(512) DEFAULT NULL COMMENT '本次操作产生的名称',
  `fs_hashname` varchar(512) DEFAULT NULL COMMENT '每次操作都会产生的hash名称',
  `fs_intro` varchar(1024) DEFAULT NULL COMMENT '文件说明',
  `fs_size` int(11) DEFAULT NULL COMMENT '文件大小',
  `fs_type` tinyint(4) DEFAULT NULL COMMENT '文件类型（扩展名）',
  `log_user` int(11) DEFAULT NULL COMMENT '操作的用户',
  `log_lastname` varchar(512) DEFAULT NULL COMMENT '操作之前的名称',
  `log_optdate` datetime DEFAULT NULL COMMENT '操作时间',
  `log_type` tinyint(4) DEFAULT NULL COMMENT '0:创建 1:更新 2:改名 3:移动 4:删除',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='修改历史记录';

-- Data exporting was unselected.


-- Dumping structure for table filesystem.fs_tree
CREATE TABLE IF NOT EXISTS `fs_tree` (
  `fs_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `fs_parent` int(11) NOT NULL DEFAULT '0' COMMENT '所在目录',
  `fs_isdir` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:文件  1:目录',
  `fs_group` int(11) NOT NULL DEFAULT '0' COMMENT '所在组',
  `fs_user` int(11) NOT NULL DEFAULT '0' COMMENT '所属用户',
  `fs_create` datetime DEFAULT NULL COMMENT '创建时期和时间',
  `fs_lastmodify` datetime DEFAULT NULL COMMENT '最后修改日期时间',
  `fs_name` varchar(1024) DEFAULT NULL COMMENT '文件名称',
  `fs_intro` varchar(1024) DEFAULT NULL COMMENT '文件说明',
  `fs_size` int(11) DEFAULT NULL COMMENT '文件大小',
  `fs_type` varchar(50) DEFAULT NULL COMMENT '文件类型',
  `fs_encrypt` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:普通  1:加密',
  `fs_haspaper` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:电子版  1:纸版',
  `fs_hashname` varchar(255) DEFAULT NULL COMMENT 'hash名称',
  PRIMARY KEY (`fs_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件目录树';

-- Data exporting was unselected.


-- Dumping structure for table filesystem.fs_user
CREATE TABLE IF NOT EXISTS `fs_user` (
  `u_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '成员ID',
  `u_parent` int(11) DEFAULT NULL COMMENT '所在组',
  `u_name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `u_isgroup` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:组员  1:组',
  `u_grade` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:组员  1:管理员  2:领导',
  PRIMARY KEY (`u_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='各组及成员';

-- Data exporting was unselected.
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
