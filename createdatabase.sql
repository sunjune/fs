
CREATE DATABASE IF NOT EXISTS `filesystem` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `filesystem`;

CREATE TABLE IF NOT EXISTS `fs_log` (
  `log_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `fs_id` int(10) DEFAULT NULL COMMENT '对应的文件树id',
  `fs_name` varchar(512) DEFAULT NULL COMMENT '本次操作产生的名称',
  `fs_hashname` varchar(512) DEFAULT NULL COMMENT '每次对文件的更新操作都会产生的hash名称',
  `fs_intro` varchar(1024) DEFAULT NULL COMMENT '文件说明',
  `fs_size` int(11) DEFAULT NULL COMMENT '文件大小',
  `fs_type` tinyint(4) DEFAULT NULL COMMENT '文件类型（扩展名）',
  `log_user` int(11) DEFAULT NULL COMMENT '操作的用户',
  `log_type` tinyint(4) DEFAULT NULL COMMENT '0:创建 1:更新 2:改名 3:移动 4:删除',
  `log_lastname` varchar(512) DEFAULT NULL COMMENT '操作之前的名称',
  `log_optdate` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='修改历史记录';

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
  `fs_type` varchar(50) DEFAULT NULL COMMENT '文件类型 扩展名',
  `fs_encrypt` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:普通  1:加密',
  `fs_haspaper` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:电子版(过程文件)  1:纸版',
  `fs_hashname` varchar(255) DEFAULT NULL COMMENT 'hash名称',
  PRIMARY KEY (`fs_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件目录树';

CREATE TABLE IF NOT EXISTS `fs_user` (
  `u_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '成员ID',
  `u_parent` int(11) DEFAULT NULL COMMENT '所在组',
  `u_name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `u_email` varchar(255) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `u_isgroup` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:组员  1:组',
  `u_grade` tinyint(4) DEFAULT NULL COMMENT '0:组员  1:管理员  2:领导',
  PRIMARY KEY (`u_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='各组及成员';

INSERT INTO `fs_user` (`u_id`, `u_parent`, `u_name`, `u_email`, `u_isgroup`, `u_grade`) VALUES
  (1, 0, '总管理员', '', 0, 99),
	(2, 1, '技术组', '', 1, NULL),
	(3, 2, '牛胜强', '', 0, 2),
	(4, 2, '苗宇枫', '', 0, 1),
	(5, 2, '余虹美', '', 0, 0),
	(6, 2, '肖立川', '', 0, 0),
	(7, 2, '胡珺', '', 0, 0),
	(8, 2, '秦沁峰', 'qinqinfeng@staff.cntv.cn', 0, 0),
	(9, 1, '大项目组', '', 1, NULL),
	(10, 9, '樊翠芳', '', 0, 2),
	(11, 9, '王栋', '', 0, 1),
	(12, 9, '刘楠', '', 0, 0),
	(13, 1, '项目管理组', '', 1, NULL),
	(14, 13, '黄宇', '', 0, 2),
	(15, 13, '魏洁', '', 0, 1),
	(16, 13, '彭莉', '', 0, 0),
	(17, 13, '关健', '', 0, 0),
	(18, 1, '平台规划组', '', 1, NULL),
	(19, 18, '穆江英', '', 0, 2),
	(20, 18, '张晨歌', '', 0, 1),
	(21, 1, '测试组', '', 1, NULL),
	(22, 21, '陈欣', '', 0, 2),
	(23, 21, '唐甜甜', '', 0, 1);

CREATE TABLE IF NOT EXISTS `fs_sys_log` (
	`log_id` INT(11) NOT NULL DEFAULT '0' COMMENT '日志ID',
	`log_date` DATETIME NULL DEFAULT NULL COMMENT '日志发生时间',
	`log_user` VARCHAR(50) NULL DEFAULT NULL COMMENT '操作者姓名',
	`log_email` VARCHAR(50) NULL DEFAULT NULL COMMENT '操作者登录邮箱',
	`log_desc` VARCHAR(255) NULL DEFAULT NULL COMMENT '操作描述',
	PRIMARY KEY (`log_id`)
) COMMENT='系统操作日志' COLLATE='utf8_general_ci' ENGINE=MyISAM;

