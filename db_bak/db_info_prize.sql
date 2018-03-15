/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : db_info_prize

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-15 23:17:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_acm_prize
-- ----------------------------
DROP TABLE IF EXISTS `t_acm_prize`;
CREATE TABLE `t_acm_prize` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识',
  `match_name` varchar(50) NOT NULL COMMENT '比赛名称',
  `match_level` tinyint(4) DEFAULT '8' COMMENT '比赛等级（1-校级，2-市级，3-省级，4-多省级，5-国家级，6-亚洲级，7-国际级，8-未知）',
  `host_unit` varchar(50) DEFAULT NULL COMMENT '主办单位',
  `team_name` varchar(50) DEFAULT NULL COMMENT '队伍名',
  `teammate_id_1` int(11) NOT NULL COMMENT '参赛队员id-1',
  `teammate_id_2` int(11) DEFAULT NULL COMMENT '参赛队员id-2',
  `teammate_id_3` int(11) DEFAULT NULL COMMENT '参赛队员id-3',
  `prize_level` int(11) DEFAULT NULL COMMENT '获奖等级(1-一等奖，2-二等奖，3-三等奖，4-优胜奖)',
  `prize_time` datetime DEFAULT NULL COMMENT '获奖时间',
  `teacher_id` int(11) DEFAULT '0' COMMENT '指导教师id',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '是否已删除, 0-未删除, 1-已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='ACM获奖情况统计';

-- ----------------------------
-- Records of t_acm_prize
-- ----------------------------
INSERT INTO `t_acm_prize` VALUES ('1', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '1', '2017-12-03 00:00:00', '1', '2017-12-08 18:42:29', '2018-03-10 13:27:31', '1');
INSERT INTO `t_acm_prize` VALUES ('2', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '2', '2017-12-03 00:00:00', '1', '2017-12-08 18:50:32', '2018-03-10 13:34:33', '1');
INSERT INTO `t_acm_prize` VALUES ('3', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-03 00:00:00', '1', '2017-12-08 18:51:13', '2018-03-10 13:35:10', '1');
INSERT INTO `t_acm_prize` VALUES ('4', '省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-03-10 13:51:06', '1');
INSERT INTO `t_acm_prize` VALUES ('5', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '1', '2017-12-03 00:00:00', '1', '2017-12-08 18:42:29', '2018-03-10 13:50:58', '1');
INSERT INTO `t_acm_prize` VALUES ('6', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '2', '2017-12-03 00:00:00', '1', '2017-12-08 18:50:32', '2018-03-10 13:51:46', '1');
INSERT INTO `t_acm_prize` VALUES ('7', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-03 00:00:00', '1', '2017-12-08 18:51:13', '2018-03-10 13:53:06', '1');
INSERT INTO `t_acm_prize` VALUES ('8', '省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-03-10 13:53:28', '1');
INSERT INTO `t_acm_prize` VALUES ('9', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', null, '1', '2017-12-03 00:00:00', '1', '2017-12-08 18:42:29', '2018-03-12 08:54:47', '1');
INSERT INTO `t_acm_prize` VALUES ('10', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '2', '2017-12-03 00:00:00', '1', '2017-12-08 18:50:32', '2018-03-10 14:13:24', '1');
INSERT INTO `t_acm_prize` VALUES ('11', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-03 00:00:00', '1', '2017-12-08 18:51:13', '2018-03-10 14:13:45', '1');
INSERT INTO `t_acm_prize` VALUES ('12', '省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-03-10 14:14:01', '1');
INSERT INTO `t_acm_prize` VALUES ('13', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '1', '2017-12-03 00:00:00', '1', '2017-12-08 18:42:29', '2018-03-11 19:00:51', '1');
INSERT INTO `t_acm_prize` VALUES ('14', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '2', '2017-12-03 00:00:00', '1', '2017-12-08 18:50:32', '2018-03-11 19:03:43', '1');
INSERT INTO `t_acm_prize` VALUES ('15', '15国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-03 00:00:00', '1', '2017-12-08 18:51:13', '2018-03-11 17:20:57', '1');
INSERT INTO `t_acm_prize` VALUES ('16', '16省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-03-11 19:14:50', '1');
INSERT INTO `t_acm_prize` VALUES ('17', '17国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '1', '2017-12-03 00:00:00', '1', '2017-12-08 18:42:29', '2018-03-11 19:16:20', '1');
INSERT INTO `t_acm_prize` VALUES ('18', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '2', '2017-12-03 00:00:00', '1', '2017-12-08 18:50:32', '2018-03-11 19:18:10', '1');
INSERT INTO `t_acm_prize` VALUES ('19', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-03 00:00:00', '1', '2017-12-08 18:51:13', '2018-03-11 18:34:58', '1');
INSERT INTO `t_acm_prize` VALUES ('20', '省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-03-10 13:47:46', '1');
INSERT INTO `t_acm_prize` VALUES ('21', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '1', '2017-12-03 00:00:00', '1', '2017-12-08 18:42:29', '2018-03-10 13:46:06', '1');
INSERT INTO `t_acm_prize` VALUES ('22', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '2', '2017-12-03 00:00:00', '1', '2017-12-08 18:50:32', '2018-03-11 18:37:07', '1');
INSERT INTO `t_acm_prize` VALUES ('23', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-03 00:00:00', '1', '2017-12-08 18:51:13', '2018-03-11 18:37:31', '1');
INSERT INTO `t_acm_prize` VALUES ('24', '省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-03-11 18:39:08', '1');
INSERT INTO `t_acm_prize` VALUES ('25', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '1', '2017-12-03 00:00:00', '1', '2017-12-08 18:42:29', '2018-03-11 19:18:45', '1');
INSERT INTO `t_acm_prize` VALUES ('26', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '2', '2017-12-03 00:00:00', '1', '2017-12-08 18:50:32', '2018-03-11 19:18:53', '1');
INSERT INTO `t_acm_prize` VALUES ('27', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-03 00:00:00', '1', '2017-12-08 18:51:13', '2018-03-11 19:22:16', '1');
INSERT INTO `t_acm_prize` VALUES ('28', '省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-03-11 19:24:12', '1');
INSERT INTO `t_acm_prize` VALUES ('29', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '1', '2017-12-03 00:00:00', '1', '2017-12-08 18:42:29', '2018-03-13 13:36:54', '1');
INSERT INTO `t_acm_prize` VALUES ('30', '30国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '2', '2017-12-03 00:00:00', '1', '2017-12-08 18:50:32', '2018-03-05 16:43:35', '0');
INSERT INTO `t_acm_prize` VALUES ('31', '31国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-03 00:00:00', '1', '2017-12-08 18:51:13', '2018-03-05 16:43:39', '0');
INSERT INTO `t_acm_prize` VALUES ('32', '省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-03-11 19:54:42', '1');
INSERT INTO `t_acm_prize` VALUES ('33', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '1', '2017-12-03 00:00:00', '1', '2017-12-08 18:42:29', '2017-12-20 18:37:30', '0');
INSERT INTO `t_acm_prize` VALUES ('34', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '2', '2017-12-03 00:00:00', '1', '2017-12-08 18:50:32', '2017-12-20 18:37:31', '0');
INSERT INTO `t_acm_prize` VALUES ('35', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-03 00:00:00', '1', '2017-12-08 18:51:13', '2017-12-20 18:37:31', '0');
INSERT INTO `t_acm_prize` VALUES ('36', '36省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-03-05 16:43:44', '0');
INSERT INTO `t_acm_prize` VALUES ('37', '37省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-03-05 17:00:49', '0');
INSERT INTO `t_acm_prize` VALUES ('38', '38省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-03-05 17:00:57', '0');
INSERT INTO `t_acm_prize` VALUES ('39', '39省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-03-05 17:01:02', '0');
INSERT INTO `t_acm_prize` VALUES ('40', '40省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-03-05 17:01:04', '0');
INSERT INTO `t_acm_prize` VALUES ('41', '41省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-03-05 17:01:07', '0');
INSERT INTO `t_acm_prize` VALUES ('42', '42省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-03-05 17:01:10', '0');
INSERT INTO `t_acm_prize` VALUES ('43', '43省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-03-05 17:01:13', '0');
INSERT INTO `t_acm_prize` VALUES ('44', '44省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-03-05 17:01:15', '0');
INSERT INTO `t_acm_prize` VALUES ('45', '45省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-03-05 17:01:17', '0');
INSERT INTO `t_acm_prize` VALUES ('46', '46省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '1', '2', '3', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-03-05 17:01:20', '0');
INSERT INTO `t_acm_prize` VALUES ('47', '国家级ACM比赛', '5', '国家鸟巢体育馆', 'diao', '1', '2', '3', '1', '2016-10-10 00:00:00', '1', '2018-03-12 16:32:28', '2018-03-12 16:32:28', '0');

-- ----------------------------
-- Table structure for t_challenge_cup
-- ----------------------------
DROP TABLE IF EXISTS `t_challenge_cup`;
CREATE TABLE `t_challenge_cup` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `project_name` varchar(50) DEFAULT NULL COMMENT '项目名',
  `team_name` varchar(50) DEFAULT NULL COMMENT '团队名称',
  `teammate_id_1` int(11) NOT NULL,
  `teammate_id_2` int(11) DEFAULT NULL,
  `teammate_id_3` int(11) DEFAULT NULL,
  `teammate_id_4` int(11) DEFAULT NULL,
  `teammate_id_5` int(11) DEFAULT NULL,
  `teammate_id_6` int(11) DEFAULT NULL,
  `teammate_id_7` int(11) DEFAULT NULL,
  `teammate_id_8` int(11) DEFAULT NULL COMMENT '比赛名称',
  `match_name` varchar(50) DEFAULT NULL COMMENT '比赛名',
  `match_level` tinyint(4) DEFAULT '8' COMMENT '比赛等级（1-校级，2-市级，3-省级，4-多省级，5-国家级，6-亚洲级，7-国际级，8-未知）',
  `prize_level` int(11) DEFAULT NULL COMMENT '获奖等级(1-一等奖，2-二等奖，3-三等奖，4-优胜奖)',
  `prize_time` datetime DEFAULT NULL COMMENT '获奖时间',
  `host_unit` varchar(30) DEFAULT NULL COMMENT '主办单位',
  `teacher_id` int(11) DEFAULT '0' COMMENT '指导教师id',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '是否已删除, 0-未删除, 1-已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='挑战杯';

-- ----------------------------
-- Records of t_challenge_cup
-- ----------------------------
INSERT INTO `t_challenge_cup` VALUES ('1', 'Test', 'HelloWorld', '1', '3', null, null, null, null, null, null, '第十五届互联网+1', '4', '2', '2018-01-17 00:00:00', null, '3', '2018-01-28 18:04:35', '2018-03-14 10:36:06', '1');
INSERT INTO `t_challenge_cup` VALUES ('2', '基于嵌入式的火锅研究', '哈哈哈', '3', '14', null, null, null, null, null, null, '第十六届互联网+2', '7', '1', '2018-02-11 00:00:00', '黑龙江省教育厅', '4', '2018-02-02 18:00:02', '2018-03-07 14:43:16', '0');
INSERT INTO `t_challenge_cup` VALUES ('3', '挑战杯很强', '去你的吧', '3', '14', null, null, null, null, null, null, '挑战杯啊挑战杯3', '7', '1', '2018-02-12 00:00:00', '国家教育总局', '4', '2018-02-02 19:40:03', '2018-03-09 12:19:48', '0');
INSERT INTO `t_challenge_cup` VALUES ('4', 'Test', 'HelloWorld', '1', '3', null, null, null, null, null, null, '第十五届互联网+4', '4', '2', '2018-01-17 00:00:00', '', '3', '2018-01-28 18:04:35', '2018-03-09 12:19:48', '0');
INSERT INTO `t_challenge_cup` VALUES ('5', '基于嵌入式的火锅研究', '哈哈哈', '3', '14', null, null, null, null, null, null, '第十六届互联网+5', '7', '1', '2018-02-11 00:00:00', '黑龙江省教育厅', '4', '2018-02-02 18:00:02', '2018-03-07 14:43:16', '0');
INSERT INTO `t_challenge_cup` VALUES ('6', '挑战杯很强', '去你的吧', '3', '14', null, null, null, null, null, null, '挑战杯啊挑战杯6', '7', '1', '2018-02-12 00:00:00', '国家教育总局', '4', '2018-02-02 19:40:03', '2018-03-07 14:43:19', '0');
INSERT INTO `t_challenge_cup` VALUES ('7', 'Test', 'HelloWorld', '1', '3', null, null, null, null, null, null, '第十五届互联网+7', '4', '2', '2018-01-17 00:00:00', '', '3', '2018-01-28 18:04:35', '2018-03-12 12:03:09', '1');

-- ----------------------------
-- Table structure for t_internet_plus
-- ----------------------------
DROP TABLE IF EXISTS `t_internet_plus`;
CREATE TABLE `t_internet_plus` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `project_name` varchar(50) DEFAULT NULL COMMENT '项目名',
  `team_name` varchar(50) DEFAULT NULL COMMENT '团队名称',
  `teammate_id_1` int(11) NOT NULL,
  `teammate_id_2` int(11) DEFAULT NULL,
  `teammate_id_3` int(11) DEFAULT NULL,
  `teammate_id_4` int(11) DEFAULT NULL,
  `teammate_id_5` int(11) DEFAULT NULL,
  `teammate_id_6` int(11) DEFAULT NULL,
  `teammate_id_7` int(11) DEFAULT NULL,
  `teammate_id_8` int(11) DEFAULT NULL COMMENT '比赛名称',
  `match_name` varchar(50) NOT NULL COMMENT '比赛名',
  `match_level` tinyint(4) DEFAULT '8' COMMENT '比赛等级（1-校级，2-市级，3-省级，4-多省级，5-国家级，6-亚洲级，7-国际级，8-未知）',
  `prize_level` int(11) DEFAULT NULL COMMENT '获奖等级(1-一等奖，2-二等奖，3-三等奖，4-优胜奖)',
  `prize_time` datetime DEFAULT NULL COMMENT '获奖时间',
  `host_unit` varchar(30) DEFAULT NULL COMMENT '主办单位',
  `teacher_id` int(11) DEFAULT '0' COMMENT '指导教师id',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '是否已删除, 0-未删除, 1-已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='互联网+';

-- ----------------------------
-- Records of t_internet_plus
-- ----------------------------
INSERT INTO `t_internet_plus` VALUES ('1', 'Test1', 'HelloWorld', '1', '3', null, null, null, null, null, null, '第十五届互联网+', '4', '2', '2018-01-17 00:00:00', null, '3', '2018-01-28 18:04:35', '2018-03-12 12:07:53', '1');
INSERT INTO `t_internet_plus` VALUES ('2', '基于嵌入式的火锅研究2', '哈哈哈', '3', '14', null, null, null, null, null, null, '第十六届互联网+', '7', '1', '2018-02-11 00:00:00', '黑龙江省教育厅', '4', '2018-02-02 18:00:02', '2018-03-14 10:50:59', '1');
INSERT INTO `t_internet_plus` VALUES ('3', 'Test3', 'HelloWorld', '1', '3', null, null, null, null, null, null, '第十五届互联网+', '4', '2', '2018-01-17 00:00:00', '', '3', '2018-01-28 18:04:35', '2018-03-07 16:09:43', '0');
INSERT INTO `t_internet_plus` VALUES ('4', '基于嵌入式的火锅研究4', '哈哈哈', '3', '14', null, null, null, null, null, null, '第十六届互联网+', '7', '1', '2018-02-11 00:00:00', '黑龙江省教育厅', '4', '2018-02-02 18:00:02', '2018-03-07 16:09:46', '0');
INSERT INTO `t_internet_plus` VALUES ('5', 'Test5', 'HelloWorld', '1', '3', null, null, null, null, null, null, '第十五届互联网+', '4', '2', '2018-01-17 00:00:00', '', '3', '2018-01-28 18:04:35', '2018-03-07 16:09:49', '0');
INSERT INTO `t_internet_plus` VALUES ('6', '基于嵌入式的火锅研究6', '哈哈哈', '3', '14', null, null, null, null, null, null, '第十六届互联网+', '7', '1', '2018-02-11 00:00:00', '黑龙江省教育厅', '4', '2018-02-02 18:00:02', '2018-03-07 16:09:51', '0');
INSERT INTO `t_internet_plus` VALUES ('7', 'Test7', 'HelloWorld', '1', '3', null, null, null, null, null, null, '第十五届互联网+', '4', '2', '2018-01-17 00:00:00', '', '3', '2018-01-28 18:04:35', '2018-03-12 12:03:58', '1');
INSERT INTO `t_internet_plus` VALUES ('8', '基于嵌入式的火锅研究8', '哈哈哈', '3', '14', null, null, null, null, null, null, '第十六届互联网+', '7', '1', '2018-02-11 00:00:00', '黑龙江省教育厅', '4', '2018-02-02 18:00:02', '2018-03-09 12:44:04', '0');

-- ----------------------------
-- Table structure for t_journal_level
-- ----------------------------
DROP TABLE IF EXISTS `t_journal_level`;
CREATE TABLE `t_journal_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(10) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_journal_level
-- ----------------------------
INSERT INTO `t_journal_level` VALUES ('1', 'E类', '2017-12-18 19:07:43', '2017-12-19 16:56:26');
INSERT INTO `t_journal_level` VALUES ('2', 'D类', '2017-12-18 19:07:46', '2017-12-19 16:56:27');
INSERT INTO `t_journal_level` VALUES ('3', 'C类', '2017-12-18 19:07:50', '2017-12-19 16:56:28');
INSERT INTO `t_journal_level` VALUES ('4', 'B类', '2017-12-18 19:07:54', '2017-12-19 16:56:29');
INSERT INTO `t_journal_level` VALUES ('5', 'A类', '2017-12-18 19:07:57', '2017-12-19 16:56:29');
INSERT INTO `t_journal_level` VALUES ('6', 'T类', '2017-12-18 19:08:01', '2017-12-19 16:56:30');
INSERT INTO `t_journal_level` VALUES ('7', '未知', '2017-12-18 19:08:05', '2017-12-18 19:08:05');

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
-- Table structure for t_match_level
-- ----------------------------
DROP TABLE IF EXISTS `t_match_level`;
CREATE TABLE `t_match_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `name` varchar(50) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='比赛级别对照表';

-- ----------------------------
-- Records of t_match_level
-- ----------------------------
INSERT INTO `t_match_level` VALUES ('1', '校级', '2017-12-08 20:23:02', '2017-12-08 20:23:02');
INSERT INTO `t_match_level` VALUES ('2', '市级', '2017-12-08 20:23:06', '2017-12-08 20:23:06');
INSERT INTO `t_match_level` VALUES ('3', '省级', '2017-12-08 20:23:11', '2017-12-08 20:23:11');
INSERT INTO `t_match_level` VALUES ('4', '多省级', '2017-12-08 20:23:16', '2017-12-08 20:23:16');
INSERT INTO `t_match_level` VALUES ('5', '国家级', '2017-12-08 20:23:21', '2017-12-08 20:23:21');
INSERT INTO `t_match_level` VALUES ('6', '亚洲级', '2017-12-08 20:23:26', '2017-12-08 20:23:26');
INSERT INTO `t_match_level` VALUES ('7', '国际级', '2017-12-08 20:23:30', '2017-12-08 20:23:30');

-- ----------------------------
-- Table structure for t_material
-- ----------------------------
DROP TABLE IF EXISTS `t_material`;
CREATE TABLE `t_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识',
  `match_type` tinyint(4) DEFAULT NULL COMMENT '比赛类别：1-论文，2-专利，3-国创科研，4-acm，5-数学建模，6-挑战杯，7-互联网＋',
  `match_id` int(11) DEFAULT NULL COMMENT '各种比赛的id（对应相应比赛表的id）',
  `material_name` varchar(50) DEFAULT NULL COMMENT '材料名称',
  `material_url` varchar(255) DEFAULT NULL COMMENT '材料路径',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '是否已经删除,0-否,1-是',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modified_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COMMENT='材料信息表';

-- ----------------------------
-- Records of t_material
-- ----------------------------
INSERT INTO `t_material` VALUES ('55', '5', '6', '', 'resources/upload/mathModel/数学建模好/', '0', '2018-03-13 20:46:38', null);
INSERT INTO `t_material` VALUES ('56', '5', '6', '', 'resources/upload/mathModel/数学建模好/', '0', '2018-03-13 20:46:42', null);
INSERT INTO `t_material` VALUES ('57', '5', '6', '', 'resources/upload/mathModel/数学建模好/', '0', '2018-03-13 20:51:51', null);
INSERT INTO `t_material` VALUES ('58', '5', '6', 'IMG20151225205458.jpg', 'resources/upload/mathModel/数学建模好/IMG20151225205458.jpg', '0', '2018-03-13 21:03:28', null);
INSERT INTO `t_material` VALUES ('59', '5', '6', 'IMG20151225205458.jpg', 'resources/upload/mathModel/数学建模好/IMG20151225205458.jpg', '0', '2018-03-13 21:03:30', null);
INSERT INTO `t_material` VALUES ('62', '1', '7', '孙大剩.jpg', 'resources/upload/thesis/7论软件工程的重要性1/孙大剩.jpg', '0', '2018-03-14 09:24:40', null);
INSERT INTO `t_material` VALUES ('64', '2', '1', 'TIM图片20180301164624.png', 'resources/upload/patent/机器猫1/TIM图片20180301164624.png', '0', '2018-03-14 09:26:59', null);
INSERT INTO `t_material` VALUES ('66', '8', '1', '桌面.jpg', 'resources/upload/otherMatch/基于Web的奖项查询系统/桌面.jpg', '0', '2018-03-14 09:45:23', null);
INSERT INTO `t_material` VALUES ('67', '8', '1', '红水晶.jpg', 'resources/upload/otherMatch/基于Web的奖项查询系统/红水晶.jpg', '0', '2018-03-14 09:46:05', null);
INSERT INTO `t_material` VALUES ('69', '6', '2', 'IMG20151225205052.jpg', 'resources/upload/ChallengeCup/基于嵌入式的火锅研究/IMG20151225205052.jpg', '0', '2018-03-14 10:38:31', null);
INSERT INTO `t_material` VALUES ('70', '6', '2', '', 'resources/upload/ChallengeCup/基于嵌入式的火锅研究/', '0', '2018-03-14 10:39:11', null);
INSERT INTO `t_material` VALUES ('71', '6', '2', '', 'resources/upload/ChallengeCup/基于嵌入式的火锅研究/', '0', '2018-03-14 10:40:43', null);
INSERT INTO `t_material` VALUES ('72', '6', '3', '', 'resources/upload/ChallengeCup/挑战杯很强/', '0', '2018-03-14 10:41:38', null);
INSERT INTO `t_material` VALUES ('73', '6', '3', '', 'resources/upload/ChallengeCup/挑战杯很强/', '0', '2018-03-14 10:41:41', null);
INSERT INTO `t_material` VALUES ('74', '7', '3', '', 'resources/upload/InternetPlus/Test3/', '0', '2018-03-14 10:52:38', null);
INSERT INTO `t_material` VALUES ('75', '7', '3', '', 'resources/upload/InternetPlus/Test3/', '0', '2018-03-14 10:52:41', null);
INSERT INTO `t_material` VALUES ('76', '7', '3', '', 'resources/upload/InternetPlus/Test3/', '0', '2018-03-14 10:52:50', null);
INSERT INTO `t_material` VALUES ('77', '7', '3', 'IMG20151225205052.jpg', 'resources/upload/InternetPlus/Test3/IMG20151225205052.jpg', '0', '2018-03-14 10:53:00', null);
INSERT INTO `t_material` VALUES ('78', '7', '3', '1 (1).jpeg', 'resources/upload/InternetPlus/Test3/1 (1).jpeg', '0', '2018-03-14 14:42:24', null);
INSERT INTO `t_material` VALUES ('79', '7', '3', '1 (1).jpeg', 'resources/upload/InternetPlus/Test3/1 (1).jpeg', '0', '2018-03-14 14:42:37', null);
INSERT INTO `t_material` VALUES ('80', '7', '3', '1 (1).jpeg', 'resources/upload/InternetPlus/Test3/1 (1).jpeg', '0', '2018-03-14 14:42:59', null);

-- ----------------------------
-- Table structure for t_math_model_prize
-- ----------------------------
DROP TABLE IF EXISTS `t_math_model_prize`;
CREATE TABLE `t_math_model_prize` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识',
  `match_name` varchar(50) NOT NULL COMMENT '比赛名称',
  `match_level` tinyint(4) DEFAULT '0' COMMENT '比赛等级（0-校级，1-市级，2-省级，3-多省级，4-国家级，5-亚洲级，6-国际级）',
  `host_unit` varchar(50) DEFAULT NULL COMMENT '主办单位',
  `team_name` varchar(50) DEFAULT NULL COMMENT '队伍名',
  `teammate_id_1` int(11) NOT NULL COMMENT '参赛队员id-1',
  `teammate_id_2` int(11) DEFAULT NULL COMMENT '参赛队员id-2',
  `teammate_id_3` int(11) DEFAULT NULL COMMENT '参赛队员id-3',
  `prize_level` int(11) DEFAULT NULL COMMENT '获奖等级(1-一等奖，2-二等奖，3-三等奖，4-优胜奖，5-未知)',
  `prize_time` datetime DEFAULT NULL COMMENT '获奖时间',
  `teacher_id` int(11) DEFAULT '0' COMMENT '指导教师id',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '是否已删除, 0-未删除, 1-已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='数学建模奖项统计';

-- ----------------------------
-- Records of t_math_model_prize
-- ----------------------------
INSERT INTO `t_math_model_prize` VALUES ('1', '数学建模省赛1', '5', '国家鸟巢体育馆', '数学建模好', '1', '2', null, '1', '2017-12-12 00:00:00', '1', '2017-12-11 20:46:00', '2018-03-14 08:53:20', '1');
INSERT INTO `t_math_model_prize` VALUES ('2', '数学建模省赛2', '3', '国家鸟巢体育馆', '数学建模好', '1', '2', '3', '2', '2017-12-12 00:00:00', '1', '2017-12-11 20:46:20', '2018-03-14 08:53:39', '1');
INSERT INTO `t_math_model_prize` VALUES ('3', '数学建模省赛3', '5', '国家鸟巢体育馆', '数学建模好', '1', '2', '3', '1', '2017-12-12 00:00:00', '1', '2017-12-11 20:46:37', '2018-03-09 10:32:11', '0');
INSERT INTO `t_math_model_prize` VALUES ('4', '数学建模省赛4', '3', '国家鸟巢体育馆', '数学建模好', '1', '2', '3', '3', '2017-12-12 00:00:00', '1', '2017-12-11 20:46:41', '2018-03-06 12:54:14', '0');
INSERT INTO `t_math_model_prize` VALUES ('5', '数学建模省赛5', '5', '国家鸟巢体育馆', '数学建模好', '1', '2', '3', '1', '2017-12-12 00:00:00', '1', '2017-12-11 20:46:45', '2018-03-06 12:55:08', '0');
INSERT INTO `t_math_model_prize` VALUES ('6', '数学建模省赛6', '3', '国家鸟巢体育馆', '数学建模好', '1', '2', '3', '2', '2017-12-12 00:00:00', '1', '2017-12-11 20:46:47', '2018-03-06 12:54:16', '0');
INSERT INTO `t_math_model_prize` VALUES ('7', '数学建模省赛7', '5', '国家鸟巢体育馆', '数学建模好', '1', '2', '3', '2', '2017-11-28 00:00:00', '1', '2017-12-13 18:28:04', '2018-03-06 12:55:10', '0');
INSERT INTO `t_math_model_prize` VALUES ('8', '东北师范大学数学建模', '1', '东北师范大学校团委', '哈哈', '1', '1', '1', '1', '2018-03-14 00:00:00', '4', '2018-03-14 08:59:36', '2018-03-14 08:59:36', '0');

-- ----------------------------
-- Table structure for t_other_match
-- ----------------------------
DROP TABLE IF EXISTS `t_other_match`;
CREATE TABLE `t_other_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `match_name` varchar(50) NOT NULL COMMENT '比赛名',
  `match_level` tinyint(4) DEFAULT NULL COMMENT '比赛等级',
  `host_unit` varchar(255) DEFAULT NULL COMMENT '主办单位',
  `teammate_id_1` int(11) NOT NULL COMMENT '获奖人员1id',
  `teammate_id_2` int(11) DEFAULT NULL COMMENT '获奖人员2id',
  `teammate_id_3` int(11) DEFAULT NULL COMMENT '获奖人员3id',
  `teammate_id_4` int(11) DEFAULT NULL COMMENT '获奖人员4id',
  `teammate_id_5` int(11) DEFAULT NULL COMMENT '获奖人员5id',
  `teammate_id_6` int(11) DEFAULT NULL COMMENT '获奖人员6id',
  `teammate_id_7` int(11) DEFAULT NULL COMMENT '获奖人员7id',
  `teammate_id_8` int(11) DEFAULT NULL COMMENT '获奖人员8id',
  `project_name` varchar(50) DEFAULT NULL COMMENT '项目名',
  `prize_time` datetime DEFAULT NULL COMMENT '获奖时间',
  `prize_level` tinyint(4) DEFAULT NULL COMMENT '获奖等级',
  `teacher_id` int(11) DEFAULT NULL COMMENT '指导教师id',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '是否已删除, 0-未删除, 1-已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='其他比赛';

-- ----------------------------
-- Records of t_other_match
-- ----------------------------
INSERT INTO `t_other_match` VALUES ('1', '第一届蓝桥杯1', '4', '吉林省教育厅', '1', '1', '1', '1', '1', '1', '1', '1', '基于Web的奖项查询系统', '2018-03-13 00:00:00', '1', null, '2018-03-08 13:35:26', '2018-03-14 10:32:53', '0');
INSERT INTO `t_other_match` VALUES ('2', '第一届蓝桥杯2', '3', '吉林省教育厅', '1', '1', '1', '1', '1', '1', '1', '1', '基于Web的奖项查询系统', '2018-03-31 00:00:00', '1', '4', '2018-03-08 13:38:38', '2018-03-08 16:46:06', '0');
INSERT INTO `t_other_match` VALUES ('3', '第一届蓝桥杯3', '3', '吉林省教育厅', '1', '2', '56', null, null, null, null, null, '基于Web的奖项查询系统', '2018-03-06 00:00:00', '1', '4', '2018-03-08 13:41:58', '2018-03-12 12:31:10', '1');
INSERT INTO `t_other_match` VALUES ('4', '第一届蓝桥杯4', '3', '吉林省教育厅', '1', '2', null, null, null, null, null, null, '基于Web的奖项查询系统', '2018-03-06 00:00:00', '1', '4', '2018-03-08 13:42:14', '2018-03-11 20:36:51', '1');
INSERT INTO `t_other_match` VALUES ('5', '第一届蓝桥杯5', '3', '吉林省教育厅', '1', '2', null, null, null, null, null, null, '基于Web的奖项查询系统', '2018-03-06 00:00:00', '1', '4', '2018-03-08 13:42:14', '2018-03-12 12:04:57', '1');
INSERT INTO `t_other_match` VALUES ('6', '第一届机器人大赛', '5', '国家教育总局', '123', null, null, null, null, null, null, null, '基于嵌入式的扫地机器人', '2018-03-06 00:00:00', '2', null, '2018-03-13 20:34:08', '2018-03-13 20:34:08', '0');
INSERT INTO `t_other_match` VALUES ('7', '哈哈哈', '4', '瑞泉中学', '4', null, null, null, null, null, null, null, '基于人工智能的多项', '2018-06-06 08:00:00', '2', '4', '2018-03-13 20:39:22', '2018-03-13 20:39:35', '1');
INSERT INTO `t_other_match` VALUES ('8', '哈哈哈', '4', '瑞泉中学', '4', null, null, null, null, null, null, null, '基于人工智能的多项', '2018-06-06 08:00:00', '2', '4', '2018-03-13 20:40:23', '2018-03-13 20:40:23', '0');
INSERT INTO `t_other_match` VALUES ('9', '哈哈哈', '4', '瑞泉中学', '4', null, null, null, null, null, null, null, '基于人工智能的多项', '2018-06-06 08:00:00', '2', '4', '2018-03-13 20:41:11', '2018-03-13 20:41:11', '0');
INSERT INTO `t_other_match` VALUES ('10', '哈哈哈1', '3', '国家体育总局', '12', '25', null, null, null, null, null, null, null, null, null, null, '2018-03-13 20:43:31', '2018-03-13 20:43:31', '0');

-- ----------------------------
-- Table structure for t_patent
-- ----------------------------
DROP TABLE IF EXISTS `t_patent`;
CREATE TABLE `t_patent` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `patent_name` varchar(20) NOT NULL COMMENT '专利名称',
  `patent_type` tinyint(4) DEFAULT NULL COMMENT '专利类别（1-发明专利；2-实用新型专利；3-外观设计专利；4-未知）',
  `owner_id_1` int(11) NOT NULL COMMENT '专利申请者1id',
  `owner_id_2` int(11) DEFAULT NULL COMMENT '专利申请者2id',
  `owner_id_3` int(11) DEFAULT NULL COMMENT '专利申请者3id',
  `owner_id_4` int(11) DEFAULT NULL COMMENT '专利申请者4id',
  `owner_id_5` int(11) DEFAULT NULL COMMENT '专利申请者5id',
  `apply_time` date DEFAULT NULL COMMENT '申请时间',
  `teacher_id` int(11) DEFAULT NULL COMMENT '指导教师id',
  `patent_introduce` text COMMENT '专利简介',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='专利统计表';

-- ----------------------------
-- Records of t_patent
-- ----------------------------
INSERT INTO `t_patent` VALUES ('1', '机器猫1', '1', '1', null, null, null, null, '2017-12-12', '3', '小叮当帮我实现，所有的愿望', '2017-12-20 14:15:20', '2018-03-09 13:36:43', '0');
INSERT INTO `t_patent` VALUES ('2', '哈哈哈2', '2', '2', '3', '5', '14', null, '2017-12-04', '3', '嘿嘿嘿', '2017-12-20 17:05:16', '2018-03-07 20:32:41', '0');
INSERT INTO `t_patent` VALUES ('3', '机器猫3', '1', '1', null, null, null, null, '2017-12-12', '3', '小叮当帮我实现，所有的愿望', '2017-12-20 14:15:20', '2018-03-07 20:28:51', '0');
INSERT INTO `t_patent` VALUES ('4', '哈哈哈4', '2', '2', '3', '5', '14', null, '2017-12-04', '3', '嘿嘿嘿', '2017-12-20 17:05:16', '2018-03-09 13:36:43', '0');
INSERT INTO `t_patent` VALUES ('5', '机器猫5', '1', '1', null, null, null, null, '2017-12-12', '3', '小叮当帮我实现，所有的愿望', '2017-12-20 14:15:20', '2018-03-09 13:36:43', '0');
INSERT INTO `t_patent` VALUES ('6', '哈哈哈6', '2', '2', '3', '5', '14', null, '2017-12-04', '3', '嘿嘿嘿', '2017-12-20 17:05:16', '2018-03-09 13:36:43', '0');
INSERT INTO `t_patent` VALUES ('7', '机器猫7', '1', '1', null, null, null, null, '2017-12-12', '3', '小叮当帮我实现，所有的愿望', '2017-12-20 14:15:20', '2018-03-12 12:01:39', '1');
INSERT INTO `t_patent` VALUES ('8', '哈哈哈8', '2', '2', '3', '5', '14', null, '2017-12-04', '3', '嘿嘿嘿', '2017-12-20 17:05:16', '2018-03-07 20:32:44', '0');
INSERT INTO `t_patent` VALUES ('9', '机器猫', '1', '1', null, null, null, null, '2017-12-12', '3', '二月的北京，寒冷还没完全消退。\n\n三里屯，凌晨00:00整。\n\n映入眼帘的是，五颜六色的美瞳，肤色各异的人种，露出脚踝的高跟鞋。\n\n程璐璐今天穿了超短裙，长发披在肩上。在冬天露出两条又白又细的长腿，她还是第一次。\n\n她刚走过太古里的优衣库，一个捧着佳能摄像头的中年男子奔了上来：“美女来几张街拍啊！”。\n\n男人身材瘦小，皮肤黝黑，深蓝色的裤子皱皱巴巴，头上顶着的红色头发遮住了右眼。程璐璐预见到了如果她接受了邀请，那么明天的北京街拍网站上她的照片上就会有这么几个关键词，“少妇，美腿，诱惑，红唇”。\n\n作者：大望路女司机\n链接：https://www.jianshu.com/p/502834c0d351\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-12 16:32:01', '2018-03-12 16:32:01', '0');
INSERT INTO `t_patent` VALUES ('10', '机器猫', '1', '1', '4', null, null, null, '2017-12-12', '3', '二月的北京，寒冷还没完全消退。\n\n三里屯，凌晨00:00整。\n\n映入眼帘的是，五颜六色的美瞳，肤色各异的人种，露出脚踝的高跟鞋。\n\n程璐璐今天穿了超短裙，长发披在肩上。在冬天露出两条又白又细的长腿，她还是第一次。\n\n她刚走过太古里的优衣库，一个捧着佳能摄像头的中年男子奔了上来：“美女来几张街拍啊！”。\n\n男人身材瘦小，皮肤黝黑，深蓝色的裤子皱皱巴巴，头上顶着的红色头发遮住了右眼。程璐璐预见到了如果她接受了邀请，那么明天的北京街拍网站上她的照片上就会有这么几个关键词，“少妇，美腿，诱惑，红唇”。\n\n作者：大望路女司机\n链接：https://www.jianshu.com/p/502834c0d351\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-12 16:32:01', '2018-03-12 16:32:01', '0');
INSERT INTO `t_patent` VALUES ('11', '机器猫', '1', '1', null, null, null, null, '2017-12-12', '3', '二月的北京，寒冷还没完全消退。\n\n三里屯，凌晨00:00整。\n\n映入眼帘的是，五颜六色的美瞳，肤色各异的人种，露出脚踝的高跟鞋。\n\n程璐璐今天穿了超短裙，长发披在肩上。在冬天露出两条又白又细的长腿，她还是第一次。\n\n她刚走过太古里的优衣库，一个捧着佳能摄像头的中年男子奔了上来：“美女来几张街拍啊！”。\n\n男人身材瘦小，皮肤黝黑，深蓝色的裤子皱皱巴巴，头上顶着的红色头发遮住了右眼。程璐璐预见到了如果她接受了邀请，那么明天的北京街拍网站上她的照片上就会有这么几个关键词，“少妇，美腿，诱惑，红唇”。\n\n作者：大望路女司机\n链接：https://www.jianshu.com/p/502834c0d351\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-14 14:11:42', '2018-03-14 14:11:42', '0');
INSERT INTO `t_patent` VALUES ('12', '机器猫', '1', '1', '4', null, null, null, '2017-12-12', '3', '二月的北京，寒冷还没完全消退。\n\n三里屯，凌晨00:00整。\n\n映入眼帘的是，五颜六色的美瞳，肤色各异的人种，露出脚踝的高跟鞋。\n\n程璐璐今天穿了超短裙，长发披在肩上。在冬天露出两条又白又细的长腿，她还是第一次。\n\n她刚走过太古里的优衣库，一个捧着佳能摄像头的中年男子奔了上来：“美女来几张街拍啊！”。\n\n男人身材瘦小，皮肤黝黑，深蓝色的裤子皱皱巴巴，头上顶着的红色头发遮住了右眼。程璐璐预见到了如果她接受了邀请，那么明天的北京街拍网站上她的照片上就会有这么几个关键词，“少妇，美腿，诱惑，红唇”。\n\n作者：大望路女司机\n链接：https://www.jianshu.com/p/502834c0d351\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-14 14:11:42', '2018-03-14 14:11:42', '0');

-- ----------------------------
-- Table structure for t_patent_type
-- ----------------------------
DROP TABLE IF EXISTS `t_patent_type`;
CREATE TABLE `t_patent_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `patent_type` varchar(50) DEFAULT NULL COMMENT '专利名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_patent_type
-- ----------------------------
INSERT INTO `t_patent_type` VALUES ('1', '发明专利');
INSERT INTO `t_patent_type` VALUES ('2', '实用新型专利');
INSERT INTO `t_patent_type` VALUES ('3', '外观设计专利');
INSERT INTO `t_patent_type` VALUES ('4', '未知');

-- ----------------------------
-- Table structure for t_prize_level
-- ----------------------------
DROP TABLE IF EXISTS `t_prize_level`;
CREATE TABLE `t_prize_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='获奖等级对照表';

-- ----------------------------
-- Records of t_prize_level
-- ----------------------------
INSERT INTO `t_prize_level` VALUES ('1', '一等奖(金奖)', '2017-12-08 20:28:51', '2017-12-08 20:28:51');
INSERT INTO `t_prize_level` VALUES ('2', '二等奖(银奖)', '2017-12-08 20:29:00', '2017-12-08 20:29:00');
INSERT INTO `t_prize_level` VALUES ('3', '三等奖(铜奖)', '2017-12-08 20:29:09', '2017-12-08 20:29:09');
INSERT INTO `t_prize_level` VALUES ('4', '优胜奖(成功参赛奖)', '2017-12-08 20:29:22', '2017-12-08 20:29:22');
INSERT INTO `t_prize_level` VALUES ('5', '未知', '2017-12-11 09:37:53', '2017-12-11 09:37:53');

-- ----------------------------
-- Table structure for t_scientific_project
-- ----------------------------
DROP TABLE IF EXISTS `t_scientific_project`;
CREATE TABLE `t_scientific_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `project_name` varchar(30) NOT NULL COMMENT '项目名',
  `project_type` tinyint(4) DEFAULT '5' COMMENT '项目类型（1-一般培育项目，2-专项计划项目，3-重点培育项目，4-国创，5-未知）',
  `set_year` varchar(10) DEFAULT '2017' COMMENT '立项年份',
  `project_man_id` int(11) NOT NULL COMMENT '项目负责人id',
  `project_member_id_1` int(11) DEFAULT NULL COMMENT '项目成员1',
  `project_member_id_2` int(11) DEFAULT NULL COMMENT '项目成员2',
  `project_member_id_3` int(11) DEFAULT NULL COMMENT '项目成员3',
  `project_member_id_4` int(11) DEFAULT NULL COMMENT '项目成员4',
  `teacher_id` int(11) DEFAULT NULL COMMENT '指导教师id',
  `funds_limit` int(11) DEFAULT NULL COMMENT '经费额度',
  `project_introduce` text COMMENT '300字左右的项目简介',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='科研项目统计';

-- ----------------------------
-- Records of t_scientific_project
-- ----------------------------
INSERT INTO `t_scientific_project` VALUES ('6', 'MyLease1', '4', '2017', '2', '1', '3', '4', '5', '1', '5000', '资源共享', '2017-12-04 15:51:31', '2018-03-09 10:59:46', '1');
INSERT INTO `t_scientific_project` VALUES ('7', 'AR2', '1', '2017', '2', '1', '3', '4', '5', '1', '5000', '啥啥啥', '2017-12-06 21:00:18', '2018-03-11 21:02:19', '1');
INSERT INTO `t_scientific_project` VALUES ('8', '3ARTravel', '1', '2017', '2', '1', '3', '4', null, '1', '2000', 'AR呀，\\', '2017-12-07 19:03:54', '2018-03-12 11:55:53', '0');
INSERT INTO `t_scientific_project` VALUES ('9', '42333', '3', '2015', '2', '1', '3', '5', '4', '1', '10000', '去你的吧', '2017-12-14 11:25:04', '2018-03-06 21:08:17', '0');
INSERT INTO `t_scientific_project` VALUES ('10', '5YourLease', '4', '2017', '2', '1', '3', '4', '5', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-05 08:02:35', '2018-03-06 21:08:20', '0');
INSERT INTO `t_scientific_project` VALUES ('11', '6YourLease', '4', '2017', '2', '1', '3', '4', '5', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-05 08:02:35', '2018-03-06 21:08:24', '0');
INSERT INTO `t_scientific_project` VALUES ('12', '7YourLease', '4', '2017', '2', '1', '3', '4', '5', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-05 08:02:35', '2018-03-06 21:08:27', '0');
INSERT INTO `t_scientific_project` VALUES ('13', '8YourLease', '4', '2017', '2', '1', '3', '4', '5', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-05 08:02:35', '2018-03-06 21:08:29', '0');
INSERT INTO `t_scientific_project` VALUES ('14', '9YourLease', '4', '2017', '2', '1', '3', '4', '5', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-05 08:02:35', '2018-03-06 21:08:33', '0');
INSERT INTO `t_scientific_project` VALUES ('15', '10YourLease', '4', '2017', '2', null, '3', '4', '5', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-05 08:03:11', '2018-03-06 21:08:36', '0');
INSERT INTO `t_scientific_project` VALUES ('16', '11YourLease', '4', '2017', '2', '1', '3', '4', '5', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-05 08:03:11', '2018-03-06 21:08:39', '0');
INSERT INTO `t_scientific_project` VALUES ('17', '12YourLease', '4', '2017', '2', '1', '3', '4', '5', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-05 08:03:11', '2018-03-06 21:08:43', '0');
INSERT INTO `t_scientific_project` VALUES ('18', '13YourLease', '4', '2017', '2', '1', '3', '4', '5', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-05 08:03:11', '2018-03-06 21:08:46', '0');
INSERT INTO `t_scientific_project` VALUES ('19', '14YourLease', '4', '2017', '2', '1', '3', '4', '5', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-05 08:03:11', '2018-03-09 11:00:02', '1');
INSERT INTO `t_scientific_project` VALUES ('20', 'YourLease', '4', '2017', '2', null, '3', '4', '5', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-12 16:23:26', '2018-03-12 16:23:26', '0');
INSERT INTO `t_scientific_project` VALUES ('21', 'YourLease', '4', '2017', '2', '1', '3', '4', '5', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-12 16:23:26', '2018-03-12 16:23:26', '0');
INSERT INTO `t_scientific_project` VALUES ('22', 'YourLease', '4', '2017', '2', '1', '3', '4', '5', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-12 16:23:26', '2018-03-12 16:23:26', '0');
INSERT INTO `t_scientific_project` VALUES ('23', 'YourLease', '4', '2017', '2', '1', '3', '4', '5', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-12 16:23:27', '2018-03-12 16:23:27', '0');
INSERT INTO `t_scientific_project` VALUES ('24', 'YourLease', '4', '2017', '2', '1', '3', '4', '5', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-12 16:23:27', '2018-03-12 16:23:27', '0');
INSERT INTO `t_scientific_project` VALUES ('25', 'MyLease', '4', '2017', '2', '1', '3', '4', '5', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-12 16:32:20', '2018-03-12 16:32:20', '0');
INSERT INTO `t_scientific_project` VALUES ('26', '111', '1', '201', '1', '2', '3', '5', '4', '1', '0', '', '2018-03-15 20:54:53', '2018-03-15 20:54:53', '0');
INSERT INTO `t_scientific_project` VALUES ('27', '玩儿', '1', '2018', '3', null, null, null, null, null, '0', '', '2018-03-15 21:18:49', '2018-03-15 21:18:49', '0');
INSERT INTO `t_scientific_project` VALUES ('28', '哈哈哈', '2', '2018', '1', null, null, null, null, null, '2000', '', '2018-03-15 22:05:47', '2018-03-15 22:05:47', '0');
INSERT INTO `t_scientific_project` VALUES ('29', '哈哈哈', '2', '2018', '1', null, null, null, null, null, '2000', '', '2018-03-15 22:07:26', '2018-03-15 22:07:26', '0');
INSERT INTO `t_scientific_project` VALUES ('30', '哈哈哈', '2', '2018', '1', null, null, null, null, null, '2000', '', '2018-03-15 22:07:28', '2018-03-15 22:07:28', '0');

-- ----------------------------
-- Table structure for t_scientific_project_type
-- ----------------------------
DROP TABLE IF EXISTS `t_scientific_project_type`;
CREATE TABLE `t_scientific_project_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目类型代码',
  `project_type` varchar(50) DEFAULT NULL COMMENT '项目类型',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='国创科研项目类型对照表';

-- ----------------------------
-- Records of t_scientific_project_type
-- ----------------------------
INSERT INTO `t_scientific_project_type` VALUES ('1', '一般科研立项', '2017-12-08 20:22:22', '2017-12-08 20:22:22');
INSERT INTO `t_scientific_project_type` VALUES ('2', '专项计划项目', '2017-12-08 20:22:22', '2017-12-08 20:22:22');
INSERT INTO `t_scientific_project_type` VALUES ('3', '重点科研立项', '2017-12-08 20:22:22', '2017-12-08 20:22:22');
INSERT INTO `t_scientific_project_type` VALUES ('4', '国家级大学生创新创业训练计划', '2017-12-08 20:22:22', '2017-12-08 20:22:22');
INSERT INTO `t_scientific_project_type` VALUES ('5', '未知', '2017-12-08 20:22:22', '2017-12-08 20:22:22');

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `sex` tinyint(4) DEFAULT '0' COMMENT '性别（1-男，2-女）',
  `stu_number` varchar(10) NOT NULL COMMENT '学生学号',
  `grade` varchar(5) NOT NULL COMMENT '年级（格式：2015）',
  `major_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '专业代码',
  `phone` varchar(15) DEFAULT NULL COMMENT '联系方式',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='学生信息表';

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('1', '刘旺', '1', '2015011969', '2015', '1', '15919864567', '2017-11-07 15:50:25', '2017-12-07 14:53:28');
INSERT INTO `t_student` VALUES ('2', '刘晶', '2', '2015011959', '2015', '1', '15764321043', '2017-11-08 09:32:50', '2017-12-07 14:53:29');
INSERT INTO `t_student` VALUES ('3', '张三', '2', '2015000000', '2015', '1', '13000000000', '2017-11-26 15:20:32', '2017-12-07 14:53:31');
INSERT INTO `t_student` VALUES ('4', '翟阿鑫', '1', '2015012015', '2015', '1', '15764315269', '2017-12-02 15:52:14', '2017-12-07 14:53:33');
INSERT INTO `t_student` VALUES ('5', '吴晓阳', '1', '2015011968', '2015', '1', '13258582288', '2017-12-02 15:52:35', '2017-12-07 14:53:34');
INSERT INTO `t_student` VALUES ('6', '王译萱', '2', '2016011897', '2016', '2', '13134308706', '2017-12-19 17:02:57', '2017-12-19 17:02:57');
INSERT INTO `t_student` VALUES ('7', '付一爽', '2', '2016011898', '2016', '2', '13134489397', '2017-12-19 17:02:57', '2017-12-19 17:02:57');
INSERT INTO `t_student` VALUES ('8', '陈鹏宇', '1', '2016011899', '2016', '2', '13266353758', '2017-12-19 17:02:57', '2017-12-19 17:02:57');
INSERT INTO `t_student` VALUES ('9', '高艳鑫', '2', '2016011900', '2016', '2', '13504433024', '2017-12-19 17:02:57', '2017-12-19 17:02:57');
INSERT INTO `t_student` VALUES ('10', '谢霖', '2', '2016011901', '2016', '2', '18844129036', '2017-12-19 17:02:57', '2017-12-19 17:02:57');
INSERT INTO `t_student` VALUES ('11', '吕鹏', '1', '2016011902', '2016', '2', '13159527526', '2017-12-19 17:02:57', '2017-12-19 17:02:57');
INSERT INTO `t_student` VALUES ('13', '杨孟茜', '2', '2016011904', '2016', '2', '15004438994', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('14', '岳天娇', '2', '2016011905', '2016', '2', '18443173604', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('15', '沈丽香', '2', '2016011906', '2016', '2', '13154364756', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('16', '邢海玲', '2', '2016011907', '2016', '2', '15764307074', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('17', '马恁超', '1', '2016011908', '2016', '2', '15526643721', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('18', '周玲玲', '2', '2016011909', '2016', '2', '15764308126', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('19', '买倩玉', '2', '2016011910', '2016', '2', '18920152262', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('20', '田佳欣', '2', '2016011911', '2016', '2', '18280197150', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('21', '武东钵', '1', '2016011912', '2016', '2', '13104472686', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('22', '孔文玉', '2', '2016011913', '2016', '2', '18844107803', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('23', '韩英慧', '2', '2016011914', '2016', '2', '18443186664', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('24', '徐澎', '1', '2016011916', '2016', '2', '18333079750', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('25', '李雨卓', '1', '2016011917', '2016', '2', '18844107437', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('26', '黄龙', '1', '2016011918', '2016', '2', '13104458758', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('27', '陈博澜', '1', '2016011919', '2016', '2', '18716787055', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('28', '唐嘉豪', '1', '2016011920', '2016', '2', '18844126128', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('29', '王维希', '1', '2016011921', '2016', '2', '13134435471', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('30', '孙豪隆', '1', '2016011922', '2016', '2', '15764308234', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('31', '宫迎莉', '2', '2016011923', '2016', '2', '13104477165', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('32', '陈俊宇', '2', '2016011924', '2016', '2', '13159609235', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('33', '王储', '1', '2016011925', '2016', '2', '15245856091', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('34', '白银升', '1', '2016011926', '2016', '2', '18443175503', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('35', '韩伊琳', '2', '2016011927', '2016', '2', '13154300898', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('36', '井冉', '2', '2016011928', '2016', '2', '13159779108', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('37', '鲁子昂', '1', '2016011930', '2016', '2', '13180829189', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('38', '樊友朋', '1', '2016011931', '2016', '2', '18443175859', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('39', '潘乐冰', '2', '2016011932', '2016', '2', '15584461777', '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('40', '张小蕾', '2', '2016011933', '2016', '2', '18844106957', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('41', '谭承成', '1', '2016011934', '2016', '2', '15694302859', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('42', '侯淑婷', '2', '2016011935', '2016', '2', '18844107417', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('43', '韩子豪', '1', '2016011936', '2016', '3', '18638169902', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('44', '王馨悦', '2', '2016011937', '2016', '3', '18280431172', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('45', '周迎新', '2', '2016011938', '2016', '3', '13104317185', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('46', '董硕', '2', '2016011939', '2016', '3', '13104309140', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('47', '李畅然', '2', '2016011940', '2016', '3', '18443175407', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('48', '张潇', '2', '2016011941', '2016', '3', '13104313253', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('49', '毛奇月', '2', '2016011943', '2016', '3', '13469630266', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('50', '郭轶玮', '1', '2016011944', '2016', '3', '13134435468', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('51', '毕睿明', '1', '2016011945', '2016', '3', '18840835451', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('52', '刘小然', '2', '2016011946', '2016', '3', '18443173585', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('53', '程鹏宇', '1', '2016011947', '2016', '3', '15940229601', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('54', '丁彦之', '2', '2016011948', '2016', '3', '13104448712', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('55', '李响', '1', '2016011949', '2016', '3', '13104490607', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('56', '张慧贤', '2', '2016011950', '2016', '3', '13159534151', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('57', '焦思博', '1', '2016011952', '2016', '3', '13944078218', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('58', '赵舜琳', '1', '2016011953', '2016', '3', '13174432805', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('59', '张华禹', '1', '2016011954', '2016', '3', '17767710025', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('60', '关智丹', '2', '2016011955', '2016', '3', '13159681395', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('61', '潘东育', '1', '2016011956', '2016', '3', '13104403853', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('62', '程培恩', '1', '2016011957', '2016', '3', '18686420885', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('63', '田时雨', '1', '2016011958', '2016', '3', '13843107947', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('64', '安明健', '1', '2016011959', '2016', '3', '15504315396', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('65', '郭远昭', '2', '2016011960', '2016', '3', '13331588646', '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('66', '罗振东', '1', '2016011961', '2016', '3', '13159530787', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('67', '朱家琪', '2', '2016011962', '2016', '3', '13159527361', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('68', '赵梓淇', '1', '2016011963', '2016', '3', '18804367668', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('69', '张勤丰', '1', '2016011964', '2016', '3', '13244435686', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('70', '万海存', '1', '2016011965', '2016', '3', '13943195868', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('71', '刘咏琪', '2', '2016011966', '2016', '3', '15249825678', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('72', '姜春晓', '2', '2016011967', '2016', '3', '13159529049', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('73', '费泽铠', '1', '2016011968', '2016', '3', '18245181773', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('74', '孙一钫', '1', '2016011969', '2016', '3', '13134450667', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('75', '刘仪鸿', '2', '2016011970', '2016', '3', '13104403942', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('76', '王源康', '1', '2016011971', '2016', '3', '13154393792', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('77', '牛方骏', '1', '2016011972', '2016', '3', '13104430193', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('78', '刘烜辰', '2', '2016011973', '2016', '3', '13134432975', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('79', '刘喆', '2', '2016011974', '2016', '3', '13159684067', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('80', '徐方舟', '1', '2016011975', '2016', '3', '13134479857', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('81', '杜恩东', '1', '2016011976', '2016', '3', '18844109678', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('82', '蔡蕊蕊', '2', '2016011977', '2016', '3', '18443175005', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('83', '吴英伟', '1', '2016011978', '2016', '3', '13739293028', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('84', '罗沛林', '2', '2016011979', '2016', '3', '13104424279', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('85', '伊志奇', '1', '2016011980', '2016', '3', '13159607980', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('86', '张昊', '1', '2016011981', '2016', '3', '17562451560', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('87', '段慧可', '1', '2016011983', '2016', '3', '18443174006', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('88', '武傲', '1', '2016011984', '2016', '3', '13839371754', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('89', '常安', '2', '2016011985', '2016', '3', '13154313507', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('90', '程诺', '2', '2016011853', '2016', '4', '15224850819', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('91', '郑祺', '2', '2016011856', '2016', '4', '13104317310', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('92', '候田田', '2', '2016011858', '2016', '4', '18443175506', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('93', '谢东', '1', '2016011859', '2016', '4', '13154379049', '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('94', '王兆雪', '2', '2016011860', '2016', '4', '13154361431', '2017-12-19 17:03:01', '2017-12-19 17:03:01');
INSERT INTO `t_student` VALUES ('95', '林靖源', '1', '2016011861', '2016', '4', '18443173468', '2017-12-19 17:03:01', '2017-12-19 17:03:01');
INSERT INTO `t_student` VALUES ('96', '张强', '1', '2016011862', '2016', '4', '18043646063', '2017-12-19 17:03:01', '2017-12-19 17:03:01');
INSERT INTO `t_student` VALUES ('97', '杨悦晨', '2', '2016011863', '2016', '4', '18648604716', '2017-12-19 17:03:01', '2017-12-19 17:03:01');
INSERT INTO `t_student` VALUES ('98', '高越', '2', '2016011864', '2016', '4', '15248070309', '2017-12-19 17:03:01', '2017-12-19 17:03:01');
INSERT INTO `t_student` VALUES ('99', '阿巴斯·阿里木', '1', '2016011865', '2016', '4', '15769013353', '2017-12-19 17:03:01', '2017-12-19 17:03:01');
INSERT INTO `t_student` VALUES ('100', '赛力克包力·对赛克', '1', '2016011866', '2016', '4', '13159682082', '2017-12-19 17:03:01', '2017-12-19 17:03:01');
INSERT INTO `t_student` VALUES ('101', '王胜', '1', '2016011867', '2016', '4', '18844108837', '2017-12-19 17:03:01', '2017-12-19 17:03:01');
INSERT INTO `t_student` VALUES ('102', '许思琪', '2', '2016011869', '2016', '4', '13154312219', '2017-12-19 17:03:01', '2017-12-19 17:03:01');
INSERT INTO `t_student` VALUES ('103', '张琨', '2', '2016011870', '2016', '4', '13159618790', '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('104', '李雨婷', '2', '2016011871', '2016', '4', '13174418758', '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('105', '王博', '2', '2016011872', '2016', '4', '18743349599', '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('106', '陈依瀚', '2', '2016011873', '2016', '4', '13134430428', '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('107', '刘一童', '1', '2016011874', '2016', '4', '13104449453', '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('108', '杨猛', '1', '2016011875', '2016', '4', '17355841121', '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('109', '丁晶晶', '2', '2016011877', '2016', '4', '18443175501', '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('110', '韩岳颖', '2', '2016011878', '2016', '4', '15849600360', '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('111', '刘博', '1', '2016011879', '2016', '4', '18030999556', '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('112', '占堆', '1', '2016011881', '2016', '4', '13154379283', '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('113', '宗吉', '2', '2016011882', '2016', '4', '13159605101', '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('114', '旦增巴宗', '2', '2016011883', '2016', '4', '13159536647', '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('115', '亢博', '1', '2016011884', '2016', '4', '13159752496', '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('116', '古丽加玛丽·图尔荪', '2', '2016011885', '2016', '4', '18844108676', '2017-12-19 17:03:02', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('117', '布威海丽且·穆合塔尔', '2', '2016011886', '2016', '4', '13159611513', '2017-12-19 17:03:02', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('118', '米热阿依·阿布都热依木', '2', '2016011887', '2016', '4', '13159564392', '2017-12-19 17:03:02', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('119', '陈文君', '2', '2016011888', '2016', '4', '13134430050', '2017-12-19 17:03:02', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('120', '黄生', '2', '2016011889', '2016', '4', '18443175675', '2017-12-19 17:03:02', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('121', '甘志丽', '2', '2016011890', '2016', '4', '18776598407', '2017-12-19 17:03:02', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('122', '樊姝玲', '2', '2016011891', '2016', '4', '13154375830', '2017-12-19 17:03:02', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('123', '刘海梅', '2', '2016011893', '2016', '4', '15543092682', '2017-12-19 17:03:02', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('124', '金璐', '2', '2016011894', '2016', '4', '18443175538', '2017-12-19 17:03:02', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('125', '匡成佳', '2', '2016011895', '2016', '4', '13174426470', '2017-12-19 17:03:02', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('126', '吴蓝天', '2', '2016011896', '2016', '4', '13174424159', '2017-12-19 17:03:02', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('127', '王月琪', '2', '2015011792', '2016', '5', '13104434730', '2017-12-19 17:03:02', '2017-12-19 17:03:02');
INSERT INTO `t_student` VALUES ('128', '曹释文', '2', '2016010016', '2016', '5', '18889669475', '2017-12-19 17:03:02', '2017-12-19 17:03:02');
INSERT INTO `t_student` VALUES ('129', '徐思诗', '2', '2016011820', '2016', '5', '13154354479', '2017-12-19 17:03:02', '2017-12-19 17:03:02');
INSERT INTO `t_student` VALUES ('130', '陈逸江', '2', '2016011822', '2016', '5', '18844129116', '2017-12-19 17:03:02', '2017-12-19 17:03:02');
INSERT INTO `t_student` VALUES ('131', '吴文竹', '2', '2016011823', '2016', '5', '13159683027', '2017-12-19 17:03:02', '2017-12-19 17:03:02');
INSERT INTO `t_student` VALUES ('132', '卢泽鑫', '1', '2016011824', '2016', '5', '15167060693', '2017-12-19 17:03:02', '2017-12-19 17:03:02');
INSERT INTO `t_student` VALUES ('133', '许志虎', '1', '2016011826', '2016', '5', '13104439981', '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('134', '陈志港', '1', '2016011827', '2016', '5', '18443175275', '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('135', '黄瑞娜', '2', '2016011828', '2016', '5', '13154305178', '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('136', '姜鑫妍', '2', '2016011829', '2016', '5', '18844103127', '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('137', '丁怡君', '2', '2016011831', '2016', '5', '13134474683', '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('138', '李子衿', '2', '2016011832', '2016', '5', '13159758895', '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('139', '林怡菲', '2', '2016011833', '2016', '5', '13843108269', '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('140', '梁陈濡', '2', '2016011834', '2016', '5', '18180335303', '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('141', '李滨钰', '2', '2016011835', '2016', '5', '13154372903', '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('142', '成晓', '1', '2016011836', '2016', '5', '18443994449', '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('143', '伊博韬', '1', '2016011837', '2016', '5', '13134451458', '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('144', '张雅婷', '2', '2016011838', '2016', '5', '18443175300', '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('145', '李璐', '2', '2016011839', '2016', '5', '18844108036', '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('146', '陈思思', '2', '2016011840', '2016', '5', '13154313229', '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('147', '郑欣月', '2', '2016011841', '2016', '5', '13104424309', '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('148', '黄南洋', '1', '2016011842', '2016', '5', '18844103786', '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('149', '其米拉姆', '2', '2016011843', '2016', '5', '13159683198', '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('150', '谭徐燕', '2', '2016011844', '2016', '5', '13154355470', '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('151', '李婧', '2', '2016011845', '2016', '5', '13104428698', '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('152', '苗艳秋', '2', '2016011846', '2016', '5', '13159568462', '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('153', '梁健', '2', '2016011847', '2016', '5', '18081440988', '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('154', '杨菁', '2', '2016011848', '2016', '5', '15568880379', '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('155', '赵婉淇', '2', '2016011849', '2016', '5', '13104462306', '2017-12-19 17:03:04', '2017-12-19 17:03:04');
INSERT INTO `t_student` VALUES ('156', '朱娅妮', '2', '2016011850', '2016', '5', '18443177578', '2017-12-19 17:03:04', '2017-12-19 17:03:04');
INSERT INTO `t_student` VALUES ('157', '江瑶', '2', '2016011851', '2016', '5', '13104490625', '2017-12-19 17:03:04', '2017-12-19 17:03:04');
INSERT INTO `t_student` VALUES ('158', '吴涵', '2', '2016013412', '2016', '5', '18443172428', '2017-12-19 17:03:04', '2017-12-19 17:03:04');
INSERT INTO `t_student` VALUES ('161', '', '0', '', '', '0', '', '2018-03-15 22:40:13', '2018-03-15 22:40:13');

-- ----------------------------
-- Table structure for t_teacher
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `teacher_name` varchar(20) NOT NULL COMMENT '教师姓名',
  `teacher_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '教师职称（1-助教，2-讲师，3-副教授，4-教授，5-未知）',
  `phone` varchar(15) DEFAULT NULL COMMENT '联系电话',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO `t_teacher` VALUES ('2', '刘志勇', '4', '12121212121', '2017-12-15 11:49:06', '2017-12-20 18:49:44');
INSERT INTO `t_teacher` VALUES ('3', '周东岱', '1', '13000000000', '2017-12-15 11:54:38', '2017-12-20 18:49:39');
INSERT INTO `t_teacher` VALUES ('4', '王文永', '3', '13255555555', '2017-12-15 11:55:56', '2017-12-15 11:55:56');
INSERT INTO `t_teacher` VALUES ('5', '潘伟', '4', '12121212121', '2017-12-15 11:57:09', '2017-12-15 11:57:09');
INSERT INTO `t_teacher` VALUES ('6', '马嘉男', '1', '13222222222', '2018-03-14 10:44:14', '2018-03-14 10:44:14');

-- ----------------------------
-- Table structure for t_teacher_level
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher_level`;
CREATE TABLE `t_teacher_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `level` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teacher_level
-- ----------------------------
INSERT INTO `t_teacher_level` VALUES ('1', '助教');
INSERT INTO `t_teacher_level` VALUES ('2', '讲师');
INSERT INTO `t_teacher_level` VALUES ('3', '副教授');
INSERT INTO `t_teacher_level` VALUES ('4', '教授');
INSERT INTO `t_teacher_level` VALUES ('5', '未知');

-- ----------------------------
-- Table structure for t_thesis
-- ----------------------------
DROP TABLE IF EXISTS `t_thesis`;
CREATE TABLE `t_thesis` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `thesis_title` varchar(50) NOT NULL COMMENT '论文标题',
  `author_id_1` tinyint(11) NOT NULL COMMENT '作者id1',
  `author_level_1` tinyint(50) NOT NULL COMMENT '作者1的等级(1-第一作者，2-第二作者....以此类推)',
  `author_id_2` tinyint(11) DEFAULT NULL COMMENT '作者id2',
  `author_level_2` tinyint(50) DEFAULT NULL COMMENT '作者2的等级(1-第一作者，2-第二作者....以此类推)',
  `author_id_3` tinyint(11) DEFAULT NULL COMMENT '作者id3',
  `author_level_3` tinyint(50) DEFAULT NULL COMMENT '作者3的等级(1-第一作者，2-第二作者....以此类推)',
  `author_id_4` tinyint(11) DEFAULT NULL COMMENT '作者id4',
  `author_level_4` tinyint(50) DEFAULT NULL COMMENT '作者4的等级(1-第一作者，2-第二作者....以此类推)',
  `author_id_5` tinyint(11) DEFAULT NULL COMMENT '作者id5',
  `author_level_5` tinyint(50) DEFAULT NULL COMMENT '作者5的等级(1-第一作者，2-第二作者....以此类推)',
  `publish_time` date DEFAULT NULL COMMENT '发布时间',
  `journal_name` varchar(50) DEFAULT NULL COMMENT '刊物名称',
  `journal_level` tinyint(4) DEFAULT '0' COMMENT '期刊等级（1-E；2-D；3-C；4-B；5-A；6-T；7-未知）',
  `thesis_abstract` text COMMENT '摘要',
  `teacher_id` int(11) DEFAULT NULL COMMENT '指导教师id',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='论文统计';

-- ----------------------------
-- Records of t_thesis
-- ----------------------------
INSERT INTO `t_thesis` VALUES ('1', '论软件工程的重要性1', '1', '1', '2', '2', '3', '3', '5', '4', '4', '5', '2017-08-31', '软件工程', '6', '软件工程贼特么重要', '3', '2017-12-15 20:36:18', '2018-03-12 15:36:17', '0');
INSERT INTO `t_thesis` VALUES ('2', 'CET62', '6', '1', '7', '2', '8', '3', null, null, null, null, '2017-12-06', '英语考试', '2', 'make your head duangduangduang on the ground', '1', '2017-12-19 15:37:24', '2018-03-12 20:40:56', '0');
INSERT INTO `t_thesis` VALUES ('3', '3论软件工程的重要性', '9', '1', '10', '2', null, null, null, null, null, null, '2017-08-31', '软件工程', '6', '软件工程贼特么重要', '3', '2017-12-15 20:36:18', '2018-03-12 20:40:57', '0');
INSERT INTO `t_thesis` VALUES ('4', '4', '11', '1', '13', '2', null, null, null, null, null, null, '2017-12-06', '英语考试', '2', 'make your head duangduangduang on the ground', '1', '2017-12-19 15:37:24', '2018-03-12 21:26:01', '0');
INSERT INTO `t_thesis` VALUES ('5', '5论软件工程的重要性1', '113', '1', null, null, null, null, null, null, null, null, '2017-08-31', '软件工程', '6', '软件工程贼特么重要', '3', '2017-12-15 20:36:18', '2018-03-12 20:40:40', '0');
INSERT INTO `t_thesis` VALUES ('6', '6CET62', '111', '1', null, null, null, null, null, null, null, null, '2017-12-06', '英语考试', '2', 'make your head duangduangduang on the ground', '1', '2017-12-19 15:37:24', '2018-03-15 20:03:16', '1');
INSERT INTO `t_thesis` VALUES ('7', '7论软件工程的重要性1', '76', '1', null, null, null, null, null, null, null, null, '2017-08-31', '软件工程', '6', '软件工程贼特么重要', '3', '2017-12-15 20:36:18', '2018-03-14 14:14:13', '1');
INSERT INTO `t_thesis` VALUES ('8', '8CET62', '23', '1', null, null, null, null, null, null, null, null, '2017-12-06', '英语考试', '2', 'make your head duangduangduang on the ground', '1', '2017-12-19 15:37:24', '2018-03-12 21:56:10', '1');
INSERT INTO `t_thesis` VALUES ('9', '论石英砂的作用', '17', '-1', null, null, null, null, null, null, null, null, '2018-03-14', '论石英砂的作用', '4', '摘要又称概要、内容提要。摘要是以提供文献内容梗概为目的，不加评论和补充解释，简明、确切地记述文献重要内容的短文。其基本要素包括研究目的、方法、结果和结论。具体地讲就是研究工作的主要对象和范围，采用的手段和方法，得出的结果和重要的结论，有时也包括具有情报价值的其它重要的信息。', null, '2018-03-12 21:41:15', '2018-03-12 21:55:43', '1');
INSERT INTO `t_thesis` VALUES ('10', '1111', '1', '-1', null, null, null, null, null, null, null, null, '2018-03-07', '1111', '1', '', null, '2018-03-14 14:08:08', '2018-03-14 14:14:11', '1');
INSERT INTO `t_thesis` VALUES ('11', '论软件工程的重要性', '1', '1', '2', '2', '3', '3', '5', '4', '4', '5', '2017-03-04', '软件工程', '6', '前几天，应邀到北京参加了一个关于创业创新的会议。\n\n感受很深，我发现那些成功的有钱人士身上都具有很多相同的特质。\n\n最重要的一点就是他们并不排斥赤裸裸的谈钱。\n\n很多人都为了自己所谓高大上的面子会觉得谈钱是一件很俗的事情，其实并不然。\n\n他们会觉得正人君子不能谈钱，钱这个字貌似很难听。\n\n作者：艳伟\n链接：https://www.jianshu.com/p/46ab46f498f5\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '4', '2018-03-14 14:09:40', '2018-03-14 14:14:09', '1');
INSERT INTO `t_thesis` VALUES ('12', '论软件工程的重要性', '1', '1', '2', '2', '3', '3', '5', '4', '4', '5', '2017-03-04', '软件工程', '6', '前几天，应邀到北京参加了一个关于创业创新的会议。\n\n感受很深，我发现那些成功的有钱人士身上都具有很多相同的特质。\n\n最重要的一点就是他们并不排斥赤裸裸的谈钱。\n\n很多人都为了自己所谓高大上的面子会觉得谈钱是一件很俗的事情，其实并不然。\n\n他们会觉得正人君子不能谈钱，钱这个字貌似很难听。\n\n作者：艳伟\n链接：https://www.jianshu.com/p/46ab46f498f5\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '4', '2018-03-14 14:09:40', '2018-03-14 14:14:07', '1');
INSERT INTO `t_thesis` VALUES ('13', '论软件工程的重要性', '1', '1', '2', '2', '3', '3', '5', '4', '4', '5', '2017-03-04', '软件工程', '6', '前几天，应邀到北京参加了一个关于创业创新的会议。\n\n感受很深，我发现那些成功的有钱人士身上都具有很多相同的特质。\n\n最重要的一点就是他们并不排斥赤裸裸的谈钱。\n\n很多人都为了自己所谓高大上的面子会觉得谈钱是一件很俗的事情，其实并不然。\n\n他们会觉得正人君子不能谈钱，钱这个字貌似很难听。\n\n作者：艳伟\n链接：https://www.jianshu.com/p/46ab46f498f5\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '4', '2018-03-14 14:09:40', '2018-03-14 14:14:04', '1');
INSERT INTO `t_thesis` VALUES ('14', '英语怎么学才好', '1', '-1', null, null, null, null, null, null, null, null, '2017-10-12', '英语怎么学才好', '4', '英语怎么学才好，这篇文章告诉你，', null, '2018-03-15 17:44:13', '2018-03-15 20:03:13', '1');
INSERT INTO `t_thesis` VALUES ('15', '英语可杂学啊', '2', '-1', null, null, null, null, null, null, null, null, '2018-03-06', '英语可杂学啊', '5', '', null, '2018-03-15 18:00:34', '2018-03-15 20:03:11', '1');
INSERT INTO `t_thesis` VALUES ('16', '论毛主席语录的重要性', '3', '-1', null, null, null, null, null, null, null, null, '2018-03-01', '', '4', '', null, '2018-03-15 18:03:09', '2018-03-15 20:03:08', '1');
INSERT INTO `t_thesis` VALUES ('17', '大有作为', '1', '-1', null, null, null, null, null, null, null, null, '2018-03-24', '', '6', '', null, '2018-03-15 18:09:14', '2018-03-15 18:14:16', '1');
INSERT INTO `t_thesis` VALUES ('18', '如：《论软件工程的重要性》', '1', '1', '2', '2', '4', '3', null, null, null, null, '2018-01-01', '如：《自然》', '6', '如：此处略去500字\n\n感受很深，我发现那些成功的有钱人士身上都具有很多相同的特质。\n\n最重要的一点就是他们并不排斥赤裸裸的谈钱。\n\n很多人都为了自己所谓高大上的面子会觉得谈钱是一件很俗的事情，其实并不然。\n\n他们会觉得正人君子不能谈钱，钱这个字貌似很难听。\n\n作者：艳伟\n链接：https://www.jianshu.com/p/46ab46f498f5\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '4', '2018-03-15 21:10:36', '2018-03-15 21:10:36', '0');
