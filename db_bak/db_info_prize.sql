/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : db_info_prize

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-11-06 10:58:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_acm_prize
-- ----------------------------
DROP TABLE IF EXISTS `t_acm_prize`;
CREATE TABLE `t_acm_prize` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识',
  `match_name` varchar(50) NOT NULL COMMENT '比赛名称',
  `match_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '比赛等级（0-校级，1-市级，2-省级，3-多省级，4-国家级，5-亚洲级，6-国际级）',
  `host_unit` varchar(50) NOT NULL COMMENT '主办单位',
  `team_name` varchar(50) NOT NULL COMMENT '队伍名',
  `teammate_id_1` int(11) NOT NULL COMMENT '参赛队员id-1',
  `teammate_id_2` int(11) NOT NULL COMMENT '参赛队员id-2',
  `teammate_id_3` int(11) NOT NULL COMMENT '参赛队员id-3',
  `prize_time` datetime NOT NULL COMMENT '获奖时间',
  `teacher_id` int(11) NOT NULL DEFAULT '0' COMMENT '指导教师id',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ACM获奖情况统计';

-- ----------------------------
-- Records of t_acm_prize
-- ----------------------------

-- ----------------------------
-- Table structure for t_major_code
-- ----------------------------
DROP TABLE IF EXISTS `t_major_code`;
CREATE TABLE `t_major_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `major_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '专业代码',
  `major_name` varchar(20) NOT NULL COMMENT '专业名称',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='专业代码对照表';

-- ----------------------------
-- Records of t_major_code
-- ----------------------------
INSERT INTO `t_major_code` VALUES ('1', '1', '软件工程', '2017-11-05 19:57:09', '2017-11-05 19:57:15');
INSERT INTO `t_major_code` VALUES ('2', '2', '计算机科学与技术', '2017-11-05 19:57:09', '2017-11-05 19:57:15');
INSERT INTO `t_major_code` VALUES ('3', '3', '计算机科学与技术（中美合作）', '2017-11-05 19:57:09', '2017-11-05 19:57:15');
INSERT INTO `t_major_code` VALUES ('4', '4', '教育技术学', '2017-11-05 19:57:09', '2017-11-05 19:57:15');
INSERT INTO `t_major_code` VALUES ('5', '5', '图书情报与档案管理', '2017-11-05 19:57:09', '2017-11-05 19:57:15');
INSERT INTO `t_major_code` VALUES ('6', '51', '图书馆学', '2017-11-05 19:57:09', '2017-11-05 19:57:15');
INSERT INTO `t_major_code` VALUES ('7', '52', '信息资源管理', '2017-11-05 19:57:09', '2017-11-05 19:57:15');

-- ----------------------------
-- Table structure for t_math_model_prize
-- ----------------------------
DROP TABLE IF EXISTS `t_math_model_prize`;
CREATE TABLE `t_math_model_prize` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识',
  `match_name` varchar(50) NOT NULL COMMENT '比赛名称',
  `match_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '比赛等级（0-校级，1-市级，2-省级，3-多省级，4-国家级，5-亚洲级，6-国际级）',
  `host_unit` varchar(50) NOT NULL COMMENT '主办单位',
  `team_name` varchar(50) NOT NULL COMMENT '队伍名',
  `teammate_id_1` int(11) NOT NULL COMMENT '参赛队员id-1',
  `teammate_id_2` int(11) NOT NULL COMMENT '参赛队员id-2',
  `teammate_id_3` int(11) NOT NULL COMMENT '参赛队员id-3',
  `prize_time` datetime NOT NULL COMMENT '获奖时间',
  `teacher_id` int(11) NOT NULL DEFAULT '0' COMMENT '指导教师id',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数学建模奖项统计';

-- ----------------------------
-- Records of t_math_model_prize
-- ----------------------------

-- ----------------------------
-- Table structure for t_patent
-- ----------------------------
DROP TABLE IF EXISTS `t_patent`;
CREATE TABLE `t_patent` (
  `id` int(11) NOT NULL COMMENT '唯一标识',
  `patent_name` varchar(20) NOT NULL COMMENT '专利名称',
  `patent_type` tinyint(4) NOT NULL COMMENT '专利类别（0-未知；1-发明专利；2-实用新型专利；3-外观设计专利）',
  `owner_id` int(11) NOT NULL COMMENT '专利申请者id',
  `other_owner` varchar(30) DEFAULT NULL COMMENT '其他专利申请者，用顿号隔开，如：张三、李四',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `teacher_id` int(11) DEFAULT NULL COMMENT '指导教师id',
  `patent_introduce` text COMMENT '专利简介',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专利统计表';

-- ----------------------------
-- Records of t_patent
-- ----------------------------

-- ----------------------------
-- Table structure for t_pro_match
-- ----------------------------
DROP TABLE IF EXISTS `t_pro_match`;
CREATE TABLE `t_pro_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `match_name` varchar(50) NOT NULL COMMENT '比赛名称',
  `match_level` tinyint(4) NOT NULL COMMENT '比赛等级（0-校级；1-市级；2-省级；3-多省级；4-国家级；5-亚洲及；6-国际级）',
  `host_unit` varchar(50) NOT NULL COMMENT '主办单位',
  `teammate_id_1` int(11) NOT NULL COMMENT '获奖人员1',
  `teammate_id_2` int(11) DEFAULT NULL COMMENT '获奖人员2',
  `teammate_id_3` int(11) DEFAULT NULL COMMENT '获奖人员3',
  `teammate_id_4` int(11) DEFAULT NULL COMMENT '获奖人员4',
  `teammate_id_5` int(11) DEFAULT NULL COMMENT '获奖人员5',
  `teammate_id_6` int(11) DEFAULT NULL COMMENT '获奖人员6',
  `other_teammate` varchar(50) DEFAULT NULL COMMENT '其他参赛成员，姓名中间用顿号隔开，如：张三、李四',
  `prize_time` datetime NOT NULL COMMENT '获奖时间',
  `teacher_id` int(11) DEFAULT NULL COMMENT '指导教师id',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='其他专业比赛，如：\r\n“理想杯”PPT、PS大赛\r\n“理想杯”静态网页制作大赛\r\n“理想杯”动态网页制作大赛\r\n互联网+校赛、省赛\r\n挑战杯、家曦杯、北斗杯\r\n';

-- ----------------------------
-- Records of t_pro_match
-- ----------------------------

-- ----------------------------
-- Table structure for t_scientific_project
-- ----------------------------
DROP TABLE IF EXISTS `t_scientific_project`;
CREATE TABLE `t_scientific_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `project_name` varchar(30) NOT NULL COMMENT '项目名',
  `project_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '项目类型（0-未知，1-一般培育项目，2-专项计划项目，3-重点培育项目，4-国创）',
  `set_time` datetime NOT NULL COMMENT '立项时间',
  `project_man_id` int(11) NOT NULL COMMENT '项目负责人id',
  `project_member_id_1` int(11) DEFAULT NULL COMMENT '项目成员1',
  `project_member_id_2` int(11) DEFAULT NULL COMMENT '项目成员2',
  `project_member_id_3` int(11) DEFAULT NULL COMMENT '项目成员3',
  `project_member_id_4` int(11) DEFAULT NULL COMMENT '项目成员4',
  `teacher_id` int(11) NOT NULL COMMENT '指导教师id',
  `funds_limit` int(11) DEFAULT NULL COMMENT '经费额度',
  `project_introduce` text COMMENT '300字左右的项目简介',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科研项目统计';

-- ----------------------------
-- Records of t_scientific_project
-- ----------------------------

-- ----------------------------
-- Table structure for t_student_info
-- ----------------------------
DROP TABLE IF EXISTS `t_student_info`;
CREATE TABLE `t_student_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别（0-男，1-女）',
  `grade` varchar(5) NOT NULL COMMENT '年级（格式：2015）',
  `major_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '专业代码',
  `phone` varchar(15) DEFAULT NULL COMMENT '联系方式',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生信息表';

-- ----------------------------
-- Records of t_student_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_teacher
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `teacher_name` varchar(20) NOT NULL COMMENT '教师姓名',
  `teacher_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '教师职称（0-未知，1-助教，2-讲师，3-副教授，4-教授）',
  `phone` varchar(15) DEFAULT NULL COMMENT '联系电话',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO `t_teacher` VALUES ('1', '刘旺', '3', '15919864567', '2017-11-05 19:39:43', '2017-11-05 19:39:52');

-- ----------------------------
-- Table structure for t_thesis
-- ----------------------------
DROP TABLE IF EXISTS `t_thesis`;
CREATE TABLE `t_thesis` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `title` varchar(50) NOT NULL COMMENT '论文标题',
  `author_id_1` tinyint(4) NOT NULL COMMENT '第一作者',
  `other_author` varchar(50) DEFAULT NULL COMMENT '其他作者，以顿号分隔，如：张三、李四',
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  `journal_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '期刊等级（0-未知；1-E；2-D；3-C；4-B；5-A；6-T）',
  `thesis_abstract` text COMMENT '摘要',
  `teacher_id` int(11) DEFAULT NULL COMMENT '指导教师id',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论文统计';

-- ----------------------------
-- Records of t_thesis
-- ----------------------------
