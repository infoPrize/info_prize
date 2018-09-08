/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : db_info_prize

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-09-08 10:01:34
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='ACM获奖情况统计';

-- ----------------------------
-- Records of t_acm_prize
-- ----------------------------
INSERT INTO `t_acm_prize` VALUES ('1', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '1', '2017-12-03 00:00:00', '1', '2017-12-08 18:42:29', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('2', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '2', '2017-12-03 00:00:00', '1', '2017-12-08 18:50:32', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('3', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-03 00:00:00', '1', '2017-12-08 18:51:13', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('4', '省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('5', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '1', '2017-12-03 00:00:00', '1', '2017-12-08 18:42:29', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('6', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '2', '2017-12-03 00:00:00', '1', '2017-12-08 18:50:32', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('7', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-03 00:00:00', '1', '2017-12-08 18:51:13', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('8', '省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('9', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '1', '2017-12-03 00:00:00', '1', '2017-12-08 18:42:29', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('10', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '2', '2017-12-03 00:00:00', '1', '2017-12-08 18:50:32', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('11', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-03 00:00:00', '1', '2017-12-08 18:51:13', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('12', '省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('13', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '1', '2017-12-03 00:00:00', '1', '2017-12-08 18:42:29', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('14', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '2', '2017-12-03 00:00:00', '1', '2017-12-08 18:50:32', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('15', '15国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-03 00:00:00', '1', '2017-12-08 18:51:13', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('16', '16省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('17', '17国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '1', '2017-12-03 00:00:00', '1', '2017-12-08 18:42:29', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('18', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '2', '2017-12-03 00:00:00', '1', '2017-12-08 18:50:32', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('19', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-03 00:00:00', '1', '2017-12-08 18:51:13', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('20', '省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('21', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '1', '2017-12-03 00:00:00', '1', '2017-12-08 18:42:29', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('22', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '2', '2017-12-03 00:00:00', '1', '2017-12-08 18:50:32', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('23', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-03 00:00:00', '1', '2017-12-08 18:51:13', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('24', '省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('25', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '1', '2017-12-03 00:00:00', '1', '2017-12-08 18:42:29', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('26', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '2', '2017-12-03 00:00:00', '1', '2017-12-08 18:50:32', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('27', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-03 00:00:00', '1', '2017-12-08 18:51:13', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('28', '省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('29', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '1', '2017-12-03 00:00:00', '1', '2017-12-08 18:42:29', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('30', '30国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '2', '2017-12-03 00:00:00', '1', '2017-12-08 18:50:32', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('31', '31国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-03 00:00:00', '1', '2017-12-08 18:51:13', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('32', '省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('33', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '1', '2017-12-03 00:00:00', '1', '2017-12-08 18:42:29', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('34', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '2', '2017-12-03 00:00:00', '1', '2017-12-08 18:50:32', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('35', '国家级ACM比赛', '5', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-03 00:00:00', '1', '2017-12-08 18:51:13', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('36', '36省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('37', '37省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('38', '38省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('39', '39省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('40', '40省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('41', '41省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('42', '42省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('43', '43省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('44', '44省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('45', '45省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('46', '46省级ACM比赛', '3', '国家鸟巢体育馆', '发多少', '6', '7', '8', '3', '2017-12-30 00:00:00', '1', '2017-12-08 21:40:38', '2018-05-08 20:13:36', '0');
INSERT INTO `t_acm_prize` VALUES ('47', '国家级ACM比赛', '5', '国家鸟巢体育馆', 'diao', '6', '7', '8', '1', '2016-10-10 00:00:00', '1', '2018-03-12 16:32:28', '2018-06-13 19:13:01', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='挑战杯';

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
INSERT INTO `t_challenge_cup` VALUES ('8', '否', '法法', '1526', null, null, null, null, null, null, null, '法法发达撒', '-1', '1', '2018-04-24 00:00:00', '', null, '2018-04-20 14:26:13', '2018-04-20 14:26:13', '0');
INSERT INTO `t_challenge_cup` VALUES ('9', '否', '法法', '1526', null, null, null, null, null, null, null, '法法发达撒', '-1', '1', '2018-04-24 00:00:00', '', null, '2018-04-20 14:26:26', '2018-04-20 14:26:26', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='材料信息表';

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
INSERT INTO `t_material` VALUES ('81', '7', '8', '红水晶.jpg', 'resources/upload/InternetPlus/基于嵌入式的火锅研究8/红水晶.jpg', '0', '2018-04-21 20:12:09', null);
INSERT INTO `t_material` VALUES ('84', '4', '46', '红水晶.jpg', 'resources/upload/acm/发多少/红水晶.jpg', '0', '2018-06-14 09:06:21', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='数学建模奖项统计';

-- ----------------------------
-- Records of t_math_model_prize
-- ----------------------------
INSERT INTO `t_math_model_prize` VALUES ('1', '数学建模省赛1', '5', '国家鸟巢体育馆', '数学建模好', '11', '22', null, '1', '2017-12-12 00:00:00', '1', '2017-12-11 20:46:00', '2018-06-13 18:33:16', '1');
INSERT INTO `t_math_model_prize` VALUES ('2', '数学建模省赛2', '3', '国家鸟巢体育馆', '数学建模好', '11', '22', '3', '2', '2017-12-12 00:00:00', '1', '2017-12-11 20:46:20', '2018-06-13 18:33:16', '1');
INSERT INTO `t_math_model_prize` VALUES ('3', '数学建模省赛3', '5', '国家鸟巢体育馆', '数学建模好', '11', '22', '3', '1', '2017-12-12 00:00:00', '1', '2017-12-11 20:46:37', '2018-06-13 18:33:17', '0');
INSERT INTO `t_math_model_prize` VALUES ('4', '数学建模省赛4', '3', '国家鸟巢体育馆', '数学建模好', '11', '22', '3', '3', '2017-12-12 00:00:00', '1', '2017-12-11 20:46:41', '2018-06-13 18:33:17', '0');
INSERT INTO `t_math_model_prize` VALUES ('5', '数学建模省赛5', '5', '国家鸟巢体育馆', '数学建模好', '11', '22', '3', '1', '2017-12-12 00:00:00', '1', '2017-12-11 20:46:45', '2018-06-13 18:33:17', '0');
INSERT INTO `t_math_model_prize` VALUES ('6', '数学建模省赛6', '3', '国家鸟巢体育馆', '数学建模好', '11', '22', '3', '2', '2017-12-12 00:00:00', '1', '2017-12-11 20:46:47', '2018-06-13 18:33:18', '0');
INSERT INTO `t_math_model_prize` VALUES ('7', '数学建模省赛7', '5', '国家鸟巢体育馆', '数学建模好', '11', '22', '3', '2', '2017-11-28 00:00:00', '1', '2017-12-13 18:28:04', '2018-06-13 18:33:18', '0');
INSERT INTO `t_math_model_prize` VALUES ('8', '东北师范大学数学建模', '1', '东北师范大学校团委', '哈哈', '11', '12', '1', '1', '2018-03-14 00:00:00', '4', '2018-03-14 08:59:36', '2018-06-13 18:33:21', '0');

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
INSERT INTO `t_other_match` VALUES ('10', '哈哈哈1', '3', '国家体育总局', '12', '25', null, null, null, null, null, null, null, null, null, null, '2018-03-13 20:43:31', '2018-06-13 18:33:40', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='专利统计表';

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
INSERT INTO `t_patent` VALUES ('13', '', '-1', '161', '161', '161', '161', '161', null, null, '[object HTMLTextAreaElement]', '2018-03-16 08:02:25', '2018-03-16 08:37:57', '1');
INSERT INTO `t_patent` VALUES ('14', '', '-1', '161', '161', '161', '161', '161', null, null, '[object HTMLTextAreaElement]', '2018-03-16 08:15:14', '2018-03-16 08:37:55', '1');
INSERT INTO `t_patent` VALUES ('15', '啊', '1', '1526', null, null, null, null, '2018-04-02', null, '[object HTMLTextAreaElement]', '2018-04-20 15:27:30', '2018-04-20 15:27:30', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='科研项目统计';

-- ----------------------------
-- Records of t_scientific_project
-- ----------------------------
INSERT INTO `t_scientific_project` VALUES ('6', 'MyLease1', '4', '2017', '6', '7', '8', '9', '10', '1', '5000', '资源共享', '2017-12-04 15:51:31', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('7', 'AR2', '1', '2017', '6', '7', '8', '9', '10', '1', '5000', '啥啥啥', '2017-12-06 21:00:18', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('8', '3ARTravel', '1', '2017', '6', '7', '8', '9', '10', '1', '2000', 'AR呀，\\', '2017-12-07 19:03:54', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('9', '42333', '3', '2015', '6', '7', '8', '9', '10', '1', '10000', '去你的吧', '2017-12-14 11:25:04', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('10', '5YourLease', '4', '2017', '6', '7', '8', '9', '10', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-05 08:02:35', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('11', '6YourLease', '4', '2017', '6', '7', '8', '9', '10', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-05 08:02:35', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('12', '7YourLease', '4', '2017', '6', '7', '8', '9', '10', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-05 08:02:35', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('13', '8YourLease', '4', '2017', '6', '7', '8', '9', '10', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-05 08:02:35', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('14', '9YourLease', '4', '2017', '6', '7', '8', '9', '10', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-05 08:02:35', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('15', '10YourLease', '4', '2017', '6', '7', '8', '9', '10', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-05 08:03:11', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('16', '11YourLease', '4', '2017', '6', '7', '8', '9', '10', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-05 08:03:11', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('17', '12YourLease', '4', '2017', '6', '7', '8', '9', '10', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-05 08:03:11', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('18', '13YourLease', '4', '2017', '6', '7', '8', '9', '10', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-05 08:03:11', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('19', '14YourLease', '4', '2017', '6', '7', '8', '9', '10', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-05 08:03:11', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('20', 'YourLease', '4', '2017', '6', '7', '8', '9', '10', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-12 16:23:26', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('21', 'YourLease', '4', '2017', '6', '7', '8', '9', '10', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-12 16:23:26', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('22', 'YourLease', '4', '2017', '6', '7', '8', '9', '10', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-12 16:23:26', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('23', 'YourLease', '4', '2017', '6', '7', '8', '9', '10', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-12 16:23:27', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('24', 'YourLease', '4', '2017', '6', '7', '8', '9', '10', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-12 16:23:27', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('25', 'MyLease', '4', '2017', '6', '7', '8', '9', '10', '1', '5000', '周末整理旧物，翻出了一兜东西，打开来看，里面都是金子过去的宝贝。\n\n三个月穿的兜兜，半岁时，我给他织的人生第一件毛衣。一岁时的鞋子，一岁半那年穿的可爱瓢虫装。\n\n还有一双他刚出生穿的袜子，拇指长短大小，只有一点点。难以想像，他从一个那么小的小不点，长成了现在这样高高大大的少年。\n\n今年他的鞋子已经大我两码。他衣服的码我穿上松了一大圈，站在那里跟我差不多一般高。\n\n一时间，不仅有点恍惚，想起十一年前那个粉红色的小肉虫。\n\n记得刚出生那时候，医生抱过来给我看，五十二公分高，六斤半重，脸上胎脂还在，小手指瘦的像鸡爪一样干巴巴的，只有骨头。\n\n看到的第一眼，心里觉得好失望。那时刻心里甚至抗拒承认那就是我怀胎十月亲生的小子，我心里猜测是不是医生抱错了别人家的孩子？\n\n作者：箽四四\n链接：https://www.jianshu.com/p/399c9d1a6ae3\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-12 16:32:20', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('26', '111', '1', '201', '6', '7', '8', '9', '10', '1', '0', '', '2018-03-15 20:54:53', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('27', '玩儿', '1', '2018', '6', '7', '8', '9', '10', null, '0', '', '2018-03-15 21:18:49', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('28', '哈哈哈', '2', '2018', '6', '7', '8', '9', '10', null, '2000', '', '2018-03-15 22:05:47', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('29', '哈哈哈', '2', '2018', '6', '7', '8', '9', '10', null, '2000', '', '2018-03-15 22:07:26', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('30', '哈哈哈', '2', '2018', '6', '7', '8', '9', '10', null, '2000', '', '2018-03-15 22:07:28', '2018-05-08 20:19:48', '0');
INSERT INTO `t_scientific_project` VALUES ('31', '', '0', '2017', '6', '7', '8', '9', '10', null, '0', '', '2018-03-16 08:02:20', '2018-05-08 20:19:48', '0');

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
  `password` varchar(50) DEFAULT NULL COMMENT '登录密码',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2298 DEFAULT CHARSET=utf8 COMMENT='学生信息表';

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('6', '王译萱', '2', '2016011897', '2016', '2', '13134308706', null, '2017-12-19 17:02:57', '2017-12-19 17:02:57');
INSERT INTO `t_student` VALUES ('7', '付一爽', '2', '2016011898', '2016', '2', '13134489397', null, '2017-12-19 17:02:57', '2017-12-19 17:02:57');
INSERT INTO `t_student` VALUES ('8', '陈鹏宇', '1', '2016011899', '2016', '2', '13266353758', null, '2017-12-19 17:02:57', '2017-12-19 17:02:57');
INSERT INTO `t_student` VALUES ('9', '高艳鑫', '2', '2016011900', '2016', '2', '13504433024', null, '2017-12-19 17:02:57', '2017-12-19 17:02:57');
INSERT INTO `t_student` VALUES ('10', '谢霖', '2', '2016011901', '2016', '2', '18844129036', null, '2017-12-19 17:02:57', '2017-12-19 17:02:57');
INSERT INTO `t_student` VALUES ('11', '吕鹏', '1', '2016011902', '2016', '2', '13159527526', null, '2017-12-19 17:02:57', '2017-12-19 17:02:57');
INSERT INTO `t_student` VALUES ('13', '杨孟茜', '2', '2016011904', '2016', '2', '15004438994', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('14', '岳天娇', '2', '2016011905', '2016', '2', '18443173604', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('15', '沈丽香', '2', '2016011906', '2016', '2', '13154364756', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('16', '邢海玲', '2', '2016011907', '2016', '2', '15764307074', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('17', '马恁超', '1', '2016011908', '2016', '2', '15526643721', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('18', '周玲玲', '2', '2016011909', '2016', '2', '15764308126', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('19', '买倩玉', '2', '2016011910', '2016', '2', '18920152262', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('20', '田佳欣', '2', '2016011911', '2016', '2', '18280197150', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('21', '武东钵', '1', '2016011912', '2016', '2', '13104472686', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('22', '孔文玉', '2', '2016011913', '2016', '2', '18844107803', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('23', '韩英慧', '2', '2016011914', '2016', '2', '18443186664', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('24', '徐澎', '1', '2016011916', '2016', '2', '18333079750', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('25', '李雨卓', '1', '2016011917', '2016', '2', '18844107437', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('26', '黄龙', '1', '2016011918', '2016', '2', '13104458758', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('27', '陈博澜', '1', '2016011919', '2016', '2', '18716787055', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('28', '唐嘉豪', '1', '2016011920', '2016', '2', '18844126128', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('29', '王维希', '1', '2016011921', '2016', '2', '13134435471', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('30', '孙豪隆', '1', '2016011922', '2016', '2', '15764308234', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('31', '宫迎莉', '2', '2016011923', '2016', '2', '13104477165', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('32', '陈俊宇', '2', '2016011924', '2016', '2', '13159609235', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('33', '王储', '1', '2016011925', '2016', '2', '15245856091', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('34', '白银升', '1', '2016011926', '2016', '2', '18443175503', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('35', '韩伊琳', '2', '2016011927', '2016', '2', '13154300898', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('36', '井冉', '2', '2016011928', '2016', '2', '13159779108', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('37', '鲁子昂', '1', '2016011930', '2016', '2', '13180829189', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('38', '樊友朋', '1', '2016011931', '2016', '2', '18443175859', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('39', '潘乐冰', '2', '2016011932', '2016', '2', '15584461777', null, '2017-12-19 17:02:58', '2017-12-19 17:02:58');
INSERT INTO `t_student` VALUES ('40', '张小蕾', '2', '2016011933', '2016', '2', '18844106957', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('41', '谭承成', '1', '2016011934', '2016', '2', '15694302859', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('42', '侯淑婷', '2', '2016011935', '2016', '2', '18844107417', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('43', '韩子豪', '1', '2016011936', '2016', '3', '18638169902', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('44', '王馨悦', '2', '2016011937', '2016', '3', '18280431172', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('45', '周迎新', '2', '2016011938', '2016', '3', '13104317185', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('46', '董硕', '2', '2016011939', '2016', '3', '13104309140', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('47', '李畅然', '2', '2016011940', '2016', '3', '18443175407', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('48', '张潇', '2', '2016011941', '2016', '3', '13104313253', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('49', '毛奇月', '2', '2016011943', '2016', '3', '13469630266', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('50', '郭轶玮', '1', '2016011944', '2016', '3', '13134435468', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('51', '毕睿明', '1', '2016011945', '2016', '3', '18840835451', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('52', '刘小然', '2', '2016011946', '2016', '3', '18443173585', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('53', '程鹏宇', '1', '2016011947', '2016', '3', '15940229601', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('54', '丁彦之', '2', '2016011948', '2016', '3', '13104448712', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('55', '李响', '1', '2016011949', '2016', '3', '13104490607', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('56', '张慧贤', '2', '2016011950', '2016', '3', '13159534151', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('57', '焦思博', '1', '2016011952', '2016', '3', '13944078218', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('58', '赵舜琳', '1', '2016011953', '2016', '3', '13174432805', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('59', '张华禹', '1', '2016011954', '2016', '3', '17767710025', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('60', '关智丹', '2', '2016011955', '2016', '3', '13159681395', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('61', '潘东育', '1', '2016011956', '2016', '3', '13104403853', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('62', '程培恩', '1', '2016011957', '2016', '3', '18686420885', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('63', '田时雨', '1', '2016011958', '2016', '3', '13843107947', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('64', '安明健', '1', '2016011959', '2016', '3', '15504315396', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('65', '郭远昭', '2', '2016011960', '2016', '3', '13331588646', null, '2017-12-19 17:02:59', '2017-12-19 17:02:59');
INSERT INTO `t_student` VALUES ('66', '罗振东', '1', '2016011961', '2016', '3', '13159530787', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('67', '朱家琪', '2', '2016011962', '2016', '3', '13159527361', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('68', '赵梓淇', '1', '2016011963', '2016', '3', '18804367668', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('69', '张勤丰', '1', '2016011964', '2016', '3', '13244435686', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('70', '万海存', '1', '2016011965', '2016', '3', '13943195868', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('71', '刘咏琪', '2', '2016011966', '2016', '3', '15249825678', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('72', '姜春晓', '2', '2016011967', '2016', '3', '13159529049', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('73', '费泽铠', '1', '2016011968', '2016', '3', '18245181773', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('74', '孙一钫', '1', '2016011969', '2016', '3', '13134450667', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('75', '刘仪鸿', '2', '2016011970', '2016', '3', '13104403942', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('76', '王源康', '1', '2016011971', '2016', '3', '13154393792', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('77', '牛方骏', '1', '2016011972', '2016', '3', '13104430193', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('78', '刘烜辰', '2', '2016011973', '2016', '3', '13134432975', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('79', '刘喆', '2', '2016011974', '2016', '3', '13159684067', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('80', '徐方舟', '1', '2016011975', '2016', '3', '13134479857', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('81', '杜恩东', '1', '2016011976', '2016', '3', '18844109678', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('82', '蔡蕊蕊', '2', '2016011977', '2016', '3', '18443175005', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('83', '吴英伟', '1', '2016011978', '2016', '3', '13739293028', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('84', '罗沛林', '2', '2016011979', '2016', '3', '13104424279', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('85', '伊志奇', '1', '2016011980', '2016', '3', '13159607980', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('86', '张昊', '1', '2016011981', '2016', '3', '17562451560', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('87', '段慧可', '1', '2016011983', '2016', '3', '18443174006', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('88', '武傲', '1', '2016011984', '2016', '3', '13839371754', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('89', '常安', '2', '2016011985', '2016', '3', '13154313507', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('90', '程诺', '2', '2016011853', '2016', '4', '15224850819', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('91', '郑祺', '2', '2016011856', '2016', '4', '13104317310', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('92', '候田田', '2', '2016011858', '2016', '4', '18443175506', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('93', '谢东', '1', '2016011859', '2016', '4', '13154379049', null, '2017-12-19 17:03:00', '2017-12-19 17:03:00');
INSERT INTO `t_student` VALUES ('94', '王兆雪', '2', '2016011860', '2016', '4', '13154361431', null, '2017-12-19 17:03:01', '2017-12-19 17:03:01');
INSERT INTO `t_student` VALUES ('95', '林靖源', '1', '2016011861', '2016', '4', '18443173468', null, '2017-12-19 17:03:01', '2017-12-19 17:03:01');
INSERT INTO `t_student` VALUES ('96', '张强', '1', '2016011862', '2016', '4', '18043646063', null, '2017-12-19 17:03:01', '2017-12-19 17:03:01');
INSERT INTO `t_student` VALUES ('97', '杨悦晨', '2', '2016011863', '2016', '4', '18648604716', null, '2017-12-19 17:03:01', '2017-12-19 17:03:01');
INSERT INTO `t_student` VALUES ('98', '高越', '2', '2016011864', '2016', '4', '15248070309', null, '2017-12-19 17:03:01', '2017-12-19 17:03:01');
INSERT INTO `t_student` VALUES ('99', '阿巴斯·阿里木', '1', '2016011865', '2016', '4', '15769013353', null, '2017-12-19 17:03:01', '2017-12-19 17:03:01');
INSERT INTO `t_student` VALUES ('100', '赛力克包力·对赛克', '1', '2016011866', '2016', '4', '13159682082', null, '2017-12-19 17:03:01', '2017-12-19 17:03:01');
INSERT INTO `t_student` VALUES ('101', '王胜', '1', '2016011867', '2016', '4', '18844108837', null, '2017-12-19 17:03:01', '2017-12-19 17:03:01');
INSERT INTO `t_student` VALUES ('102', '许思琪', '2', '2016011869', '2016', '4', '13154312219', null, '2017-12-19 17:03:01', '2017-12-19 17:03:01');
INSERT INTO `t_student` VALUES ('103', '张琨', '2', '2016011870', '2016', '4', '13159618790', null, '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('104', '李雨婷', '2', '2016011871', '2016', '4', '13174418758', null, '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('105', '王博', '2', '2016011872', '2016', '4', '18743349599', null, '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('106', '陈依瀚', '2', '2016011873', '2016', '4', '13134430428', null, '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('107', '刘一童', '1', '2016011874', '2016', '4', '13104449453', null, '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('108', '杨猛', '1', '2016011875', '2016', '4', '17355841121', null, '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('109', '丁晶晶', '2', '2016011877', '2016', '4', '18443175501', null, '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('110', '韩岳颖', '2', '2016011878', '2016', '4', '15849600360', null, '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('111', '刘博', '1', '2016011879', '2016', '4', '18030999556', null, '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('112', '占堆', '1', '2016011881', '2016', '4', '13154379283', null, '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('113', '宗吉', '2', '2016011882', '2016', '4', '13159605101', null, '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('114', '旦增巴宗', '2', '2016011883', '2016', '4', '13159536647', null, '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('115', '亢博', '1', '2016011884', '2016', '4', '13159752496', null, '2017-12-19 17:03:01', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('116', '古丽加玛丽·图尔荪', '2', '2016011885', '2016', '4', '18844108676', null, '2017-12-19 17:03:02', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('117', '布威海丽且·穆合塔尔', '2', '2016011886', '2016', '4', '13159611513', null, '2017-12-19 17:03:02', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('118', '米热阿依·阿布都热依木', '2', '2016011887', '2016', '4', '13159564392', null, '2017-12-19 17:03:02', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('119', '陈文君', '2', '2016011888', '2016', '4', '13134430050', null, '2017-12-19 17:03:02', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('120', '黄生', '2', '2016011889', '2016', '4', '18443175675', null, '2017-12-19 17:03:02', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('121', '甘志丽', '2', '2016011890', '2016', '4', '18776598407', null, '2017-12-19 17:03:02', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('122', '樊姝玲', '2', '2016011891', '2016', '4', '13154375830', null, '2017-12-19 17:03:02', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('123', '刘海梅', '2', '2016011893', '2016', '4', '15543092682', null, '2017-12-19 17:03:02', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('124', '金璐', '2', '2016011894', '2016', '4', '18443175538', null, '2017-12-19 17:03:02', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('125', '匡成佳', '2', '2016011895', '2016', '4', '13174426470', null, '2017-12-19 17:03:02', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('126', '吴蓝天', '2', '2016011896', '2016', '4', '13174424159', null, '2017-12-19 17:03:02', '2018-03-15 17:36:02');
INSERT INTO `t_student` VALUES ('127', '王月琪', '2', '2015011792', '2016', '5', '13104434730', null, '2017-12-19 17:03:02', '2017-12-19 17:03:02');
INSERT INTO `t_student` VALUES ('128', '曹释文', '2', '2016010016', '2016', '5', '18889669475', null, '2017-12-19 17:03:02', '2017-12-19 17:03:02');
INSERT INTO `t_student` VALUES ('129', '徐思诗', '2', '2016011820', '2016', '5', '13154354479', null, '2017-12-19 17:03:02', '2017-12-19 17:03:02');
INSERT INTO `t_student` VALUES ('130', '陈逸江', '2', '2016011822', '2016', '5', '18844129116', null, '2017-12-19 17:03:02', '2017-12-19 17:03:02');
INSERT INTO `t_student` VALUES ('131', '吴文竹', '2', '2016011823', '2016', '5', '13159683027', null, '2017-12-19 17:03:02', '2017-12-19 17:03:02');
INSERT INTO `t_student` VALUES ('132', '卢泽鑫', '1', '2016011824', '2016', '5', '15167060693', null, '2017-12-19 17:03:02', '2017-12-19 17:03:02');
INSERT INTO `t_student` VALUES ('133', '许志虎', '1', '2016011826', '2016', '5', '13104439981', null, '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('134', '陈志港', '1', '2016011827', '2016', '5', '18443175275', null, '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('135', '黄瑞娜', '2', '2016011828', '2016', '5', '13154305178', null, '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('136', '姜鑫妍', '2', '2016011829', '2016', '5', '18844103127', null, '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('137', '丁怡君', '2', '2016011831', '2016', '5', '13134474683', null, '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('138', '李子衿', '2', '2016011832', '2016', '5', '13159758895', null, '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('139', '林怡菲', '2', '2016011833', '2016', '5', '13843108269', null, '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('140', '梁陈濡', '2', '2016011834', '2016', '5', '18180335303', null, '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('141', '李滨钰', '2', '2016011835', '2016', '5', '13154372903', null, '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('142', '成晓', '1', '2016011836', '2016', '5', '18443994449', null, '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('143', '伊博韬', '1', '2016011837', '2016', '5', '13134451458', null, '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('144', '张雅婷', '2', '2016011838', '2016', '5', '18443175300', null, '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('145', '李璐', '2', '2016011839', '2016', '5', '18844108036', null, '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('146', '陈思思', '2', '2016011840', '2016', '5', '13154313229', null, '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('147', '郑欣月', '2', '2016011841', '2016', '5', '13104424309', null, '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('148', '黄南洋', '1', '2016011842', '2016', '5', '18844103786', null, '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('149', '其米拉姆', '2', '2016011843', '2016', '5', '13159683198', null, '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('150', '谭徐燕', '2', '2016011844', '2016', '5', '13154355470', null, '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('151', '李婧', '2', '2016011845', '2016', '5', '13104428698', null, '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('152', '苗艳秋', '2', '2016011846', '2016', '5', '13159568462', null, '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('153', '梁健', '2', '2016011847', '2016', '5', '18081440988', null, '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('154', '杨菁', '2', '2016011848', '2016', '5', '15568880379', null, '2017-12-19 17:03:03', '2017-12-19 17:03:03');
INSERT INTO `t_student` VALUES ('155', '赵婉淇', '2', '2016011849', '2016', '5', '13104462306', null, '2017-12-19 17:03:04', '2017-12-19 17:03:04');
INSERT INTO `t_student` VALUES ('156', '朱娅妮', '2', '2016011850', '2016', '5', '18443177578', null, '2017-12-19 17:03:04', '2017-12-19 17:03:04');
INSERT INTO `t_student` VALUES ('157', '江瑶', '2', '2016011851', '2016', '5', '13104490625', null, '2017-12-19 17:03:04', '2017-12-19 17:03:04');
INSERT INTO `t_student` VALUES ('158', '吴涵', '2', '2016013412', '2016', '5', '18443172428', null, '2017-12-19 17:03:04', '2017-12-19 17:03:04');
INSERT INTO `t_student` VALUES ('1163', '房群', '1', '2011012329', '2011', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1164', '岳天任', '1', '2011012348', '2011', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1165', '侯勃聿', '1', '2011012383', '2011', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1166', '宫嘉鸿', '2', '2011013604', '2011', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1167', '魏桐', '2', '2011012393', '2011', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1168', '李晟', '1', '2011012386', '2011', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1169', '陈大宇', '1', '2011012382', '2011', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1170', '姜英昕', '2', '2011012390', '2011', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1171', '商琦', '1', '2011012387', '2011', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1172', '德吉央拉', '2', '2012012408', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1173', '刘亚洲', '1', '2012012392', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1174', '唐君健', '1', '2012012398', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1175', '蔡永健', '1', '2012012386', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1176', '于新蕾', '2', '2012012426', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1177', '赵一帆', '2', '2012012430', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1178', '刘帆', '2', '2012012415', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1179', '林小李', '2', '2012012414', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1180', '陈彦滢', '2', '2012012406', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1181', '张聪平', '1', '2012012403', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1182', '屈博龙', '1', '2012012395', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1183', '阮航', '1', '2012012396', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1184', '王梦莹', '2', '2012012423', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1185', '陶胜', '1', '2012012399', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1186', '周姝君', '2', '2012012432', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1187', '白相玉', '2', '2012012405', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1188', '丁胜', '1', '2012012388', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1189', '焦楠', '2', '2012012410', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1190', '赵晓琳', '2', '2012012429', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1191', '尹宗铭', '1', '2012012402', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1192', '李世鹏', '1', '2012012390', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1193', '田孟欣', '2', '2012012420', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1194', '张圣柏', '1', '2012012404', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1195', '张金玲', '2', '2012012427', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1196', '赵瑞', '2', '2012012428', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1197', '达娃桑姆', '2', '2012012407', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1198', '巴桑罗布', '1', '2012012385', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1199', '王蓓', '2', '2012012422', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1200', '向黎', '2', '2012012424', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1201', '李淼洋', '1', '2012012389', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1202', '梁微', '2', '2012012413', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1203', '李秀娟', '2', '2012012412', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1204', '拉姆曲珍', '2', '2012012411', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1205', '周擎', '2', '2012012431', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1206', '任珂', '2', '2012012419', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1207', '崔继运', '1', '2012012387', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1208', '李远杨', '1', '2012012391', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1209', '徐桂萍', '2', '2012012425', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1210', '马枢杰', '1', '2012012393', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1211', '谢易凌', '1', '2012012401', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1212', '汪晓燕', '2', '2012012421', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1213', '汤树林', '1', '2012012397', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1214', '刘雨丹', '2', '2012012416', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1215', '刘月', '2', '2012012417', '2012', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1216', '王煜淇', '1', '2012012438', '2012', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1217', '高润泽', '1', '2012012434', '2012', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1218', '朱广宇', '1', '2012012441', '2012', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1219', '徐嘉翊', '2', '2012012450', '2012', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1220', '艾宁', '2', '2012012442', '2012', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1221', '王起萌', '2', '2012012448', '2012', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1222', '彭雨欣', '2', '2012012446', '2012', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1223', '刘宇博', '1', '2012012435', '2012', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1224', '董昱杉', '2', '2012012443', '2012', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1225', '郭丽萍', '2', '2012012444', '2012', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1226', '刘书含', '2', '2012012445', '2012', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1227', '赵俊安', '1', '2012012440', '2012', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1228', '张瀚成', '1', '2012012439', '2012', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1229', '陈俊男', '1', '2012012433', '2012', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1230', '董学敏', '2', '2012012453', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1231', '苏悦', '2', '2012012463', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1232', '徐晓青', '2', '2012012467', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1233', '何瑶', '2', '2012012457', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1234', '王欣茹', '2', '2012012465', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1235', '王金灿', '2', '2012012464', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1236', '崔依冉', '2', '2012012452', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1237', '江明月', '2', '2012012458', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1238', '雷伟伟', '2', '2012012459', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1239', '宋宪成', '1', '2012012451', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1240', '都俊男', '2', '2012012454', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1241', '郝怡雪', '2', '2012012456', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1242', '任嘉瑜', '2', '2012012462', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1243', '王越', '2', '2012012466', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1244', '热孜万古丽.亚库甫', '2', '2012012461', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1245', '美丽克扎提.穆萨', '2', '2012012460', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1246', '古丽孜依那.巴当', '2', '2012012455', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1247', '韩笑', '2', '2012012478', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1248', '刘寻', '2', '2012012493', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1249', '李选阳', '2', '2012012489', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1250', '林阳阳', '2', '2012012490', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1251', '张亚东', '1', '2012012472', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1252', '王美霞', '2', '2012012498', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1253', '金山', '1', '2012012468', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1254', '金晏平', '2', '2012012483', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1255', '李丹', '2', '2012012486', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1256', '崔欣', '2', '2012012476', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1257', '苏凤娇', '2', '2012012495', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1258', '周柳', '1', '2012012473', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1259', '温圆圆', '2', '2012012501', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1260', '魏倩', '2', '2012012500', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1261', '刘格', '2', '2012012491', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1262', '谭青青', '2', '2012012496', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1263', '益西巴姆', '2', '2012012504', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1264', '韩宇茹', '2', '2012012479', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1265', '张书月', '2', '2012012507', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1266', '于冠龙', '1', '2012012471', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1267', '鞠雪', '2', '2012012484', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1268', '马芳芳', '2', '2012012418', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1269', '胡泽', '2', '2012012481', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1270', '高文翠', '2', '2012012477', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1271', '庞贺南', '2', '2012012494', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1272', '周思尧', '1', '2012012474', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1273', '陈艺', '2', '2012012475', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1274', '何琦', '2', '2012012480', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1275', '张竞丹', '2', '2012012505', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1276', '李晓婷', '2', '2012012488', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1277', '王晨', '1', '2012012470', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1278', '唐娟', '2', '2012012497', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1279', '刘晓婷', '2', '2012012492', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1280', '王旭', '2', '2012012499', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1281', '张丽媛', '2', '2012012506', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1282', '华成玲', '2', '2012012482', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1283', '拉姆次仁', '2', '2012012485', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1284', '马小龙', '1', '2012012394', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1285', '李毅', '1', '2012012469', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1286', '徐泽欣', '2', '2012012503', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1287', '李倩昕', '2', '2012012487', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1288', '张彤', '2', '2012012509', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1289', '张爽', '2', '2012012508', '2012', '4', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1290', '孙绍丹', '2', '2012012530', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1291', '帅竹青', '2', '2012012529', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1292', '黄梦圆', '2', '2012012522', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1293', '高鹤', '2', '2012012521', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1294', '李传令', '1', '2012012511', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1295', '李佳潞', '2', '2012012523', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1296', '张露月', '2', '2012012537', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1297', '安亚玲', '2', '2012012515', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1298', '徐汉青', '1', '2012012514', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1299', '戚阿阳', '2', '2012012527', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1300', '姚牟媛', '2', '2012012536', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1301', '杨玲珊', '2', '2012012535', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1302', '崔铎潆', '2', '2012012519', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1303', '崔林蔚', '2', '2012012520', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1304', '林朗', '2', '2012012526', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1305', '王颖', '2', '2012012532', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1306', '陈得霞', '2', '2012012517', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1307', '王巢琛', '2', '2012012531', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1308', '蔡沛雯', '2', '2012012516', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1309', '梁春芳', '2', '2012012525', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1310', '徐红霞', '2', '2012012533', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1311', '尚莉', '2', '2012012528', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1312', '李赛男', '2', '2012012524', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1313', '廖鹏飞', '1', '2012012512', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1314', '陈韵', '2', '2012012518', '2012', '51', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1315', '高远博', '1', '2013012450', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1316', '周文艳', '2', '2013012500', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1317', '刘明昊', '1', '2013012455', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1318', '饶泽晶', '2', '2013012484', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1319', '申芳瑜', '2', '2013012485', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1320', '刘宾楚', '1', '2013012454', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1321', '刘淑霞', '2', '2013012481', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1322', '张然', '2', '2013012497', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1323', '冉华', '1', '2013012460', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1324', '焦旭峰', '1', '2013012452', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1325', '夏冰琦', '2', '2013012488', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1326', '余东发', '1', '2013012471', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1327', '张光友', '1', '2013012473', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1328', '彭凯宇', '1', '2013012458', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1329', '许立铭', '1', '2013012468', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1330', '牟联富', '1', '2013012457', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1331', '项寒璞', '1', '2013012464', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1332', '袁玥', '2', '2013012495', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1333', '熊运超', '1', '2013012466', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1334', '王婉彬', '2', '2013012486', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1335', '袁轶皓', '1', '2013012472', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1336', '杨尧', '1', '2013012470', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1337', '张成琦', '2', '2013012496', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1338', '武小丽', '2', '2013012487', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1339', '林怡', '2', '2013012478', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1340', '叶乔宇', '2', '2013012492', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1341', '周冬妮', '2', '2013012499', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1342', '严义杰', '1', '2013012469', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1343', '刘倩', '2', '2013012480', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1344', '聂文青', '2', '2013012483', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1345', '邱长泽', '1', '2013012459', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1346', '赵玲苑', '2', '2013012498', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1347', '朱庆婷', '2', '2013012502', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1348', '黄杜立', '2', '2013012476', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1349', '徐颖', '2', '2013012489', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1350', '李晨曦', '2', '2013012477', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1351', '杨雁菲', '2', '2013012491', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1352', '徐坤', '1', '2013012467', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1353', '胡佑蓉', '2', '2013012475', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1354', '许悦', '2', '2013012490', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1355', '阚博文', '1', '2013012453', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1356', '于佳文', '2', '2013012494', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1357', '沈钊平', '1', '2013012461', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1358', '王磊', '1', '2013012463', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1359', '侯康', '1', '2013012451', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1360', '谢俊杰', '1', '2013012465', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1361', '朱敏', '2', '2013012501', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1362', '刘凯新', '2', '2013012479', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1363', '游婷', '2', '2013012493', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1364', '吕艳兰', '2', '2013012482', '2013', '2', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1365', '骆晴', '2', '2013012523', '2013', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1366', '张爱琳', '2', '2013012531', '2013', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1367', '盛煜', '1', '2013012509', '2013', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1368', '李凯新', '2', '2013012521', '2013', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1369', '韩璐', '2', '2013012519', '2013', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1370', '全星姬', '2', '2013012524', '2013', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1371', '王露芝', '2', '2013012527', '2013', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1372', '王博', '1', '2013012510', '2013', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1373', '叶茜茜', '2', '2013012530', '2013', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1374', '张斌', '1', '2013012514', '2013', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1375', '王禹强', '1', '2013012513', '2013', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1376', '张博涵', '2', '2013012532', '2013', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1377', '任思佳', '2', '2013012525', '2013', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1378', '杨琦', '2', '2013012529', '2013', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1379', '王心蕊', '2', '2013012528', '2013', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1380', '刘欢', '2', '2013012522', '2013', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1381', '周君澍', '2', '2013012534', '2013', '3', null, null, '2018-03-19 22:02:54', '2018-03-19 22:02:54');
INSERT INTO `t_student` VALUES ('1382', '朴文浩', '1', '2013012508', '2013', '3', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1383', '张博扬', '2', '2013012533', '2013', '3', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1384', '李汪洋', '1', '2013012505', '2013', '3', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1385', '王瑞', '1', '2013012511', '2013', '3', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1386', '杜雨凡', '2', '2013012517', '2013', '3', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1387', '崔嘉玲', '2', '2013012516', '2013', '3', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1388', '杜佳兴', '2', '2013012540', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1389', '张婧鑫', '2', '2013012548', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1390', '唐遥民', '1', '2013012537', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1391', '张倩', '2', '2013012550', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1392', '张萌', '2', '2013012549', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1393', '吴慧娜', '2', '2013012547', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1394', '马文博', '1', '2013012536', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1395', '曾凡军', '1', '2013012538', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1396', '文芳', '2', '2013012545', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1397', '舒莹', '2', '2013012542', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1398', '刘紫豪', '1', '2013012535', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1399', '田雅慧', '2', '2013012543', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1400', '陈醇', '2', '2013012539', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1401', '刘亚昭', '2', '2013012541', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1402', '王戈', '2', '2013012544', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1403', '文懿', '2', '2013012546', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1404', '王迪', '2', '2013012571', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1405', '扎西央宗', '2', '2013012575', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1406', '杨棵', '1', '2013012555', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1407', '张克勤', '2', '2013012577', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1408', '韩雪姣', '2', '2013012562', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1409', '张爱君', '2', '2013012576', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1410', '王蕾', '2', '2013012572', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1411', '周志民', '1', '2013012556', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1412', '古生云', '1', '2013012553', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1413', '赖晋川', '2', '2013012563', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1414', '许芊芊', '2', '2013012573', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1415', '旦增白央', '2', '2013012558', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1416', '富东洋', '2', '2013012561', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1417', '晁宁', '2', '2013012557', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1418', '李欣玲', '2', '2013012565', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1419', '刘珊珊', '2', '2013012567', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1420', '李莹', '2', '2013012566', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1421', '张婷婷', '2', '2013012578', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1422', '丁芳芳', '2', '2013012560', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1423', '达桑', '1', '2013012551', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1424', '宋羽佳', '2', '2013012570', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1425', '赵思琪', '2', '2013012579', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1426', '普连珍', '2', '2013012569', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1427', '于英丽', '2', '2013012574', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1428', '李慧', '2', '2013012564', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1429', '苗瑞雪', '2', '2013012568', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1430', '丁春红', '2', '2013012559', '2013', '4', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1431', '毕孟侠', '2', '2013012584', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1432', '李鑫鑫', '2', '2013012592', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1433', '任羽欣', '2', '2013012600', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1434', '孟育杰', '2', '2013012595', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1435', '朴香', '2', '2013012598', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1436', '宁子晨', '2', '2013012596', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1437', '韩紫薇', '2', '2013012589', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1438', '张进', '2', '2013012610', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1439', '郭雨琴', '2', '2013012588', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1440', '邝军伟', '1', '2013012580', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1441', '张馨月', '2', '2013012611', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1442', '冉小霞', '2', '2013012599', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1443', '彭香', '2', '2013012597', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1444', '马娟娟', '2', '2013012594', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1445', '师雯', '2', '2013012601', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1446', '薛海颖', '2', '2013012607', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1447', '庹锐', '2', '2013012603', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1448', '王冰冰', '2', '2013012604', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1449', '张伊', '2', '2013012613', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1450', '卞悠美', '2', '2013012585', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1451', '王洁', '2', '2013012605', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1452', '卢艺丰', '1', '2013012582', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1453', '李美娴', '2', '2013012590', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1454', '喻惠芳', '2', '2013012608', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1455', '李瑞', '1', '2013012581', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1456', '王钧钰', '2', '2013012606', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1457', '李乾萌', '2', '2013012591', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1458', '张一丹', '2', '2013012612', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1459', '陈逸飞', '2', '2013012586', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1460', '王城城', '1', '2013012583', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1461', '崔阳', '2', '2013012587', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1462', '刘丹', '2', '2013012593', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1463', '唐翠萍', '2', '2013012602', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1464', '岳霞', '2', '2013012609', '2013', '51', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1465', '王茜', '2', '2014012037', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1466', '格桑央拉', '2', '2014012065', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1467', '杨士豪', '1', '2014012054', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1468', '王虹昀', '2', '2014012061', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1469', '蒋逸鸣', '2', '2014012034', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1470', '于茹', '2', '2014012052', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1471', '左世钰', '1', '2014012059', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1472', '王浩', '2', '2014012042', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1473', '陈媛媛', '2', '2014012053', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1474', '张悦', '2', '2014012044', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1475', '杨溢施', '2', '2014012060', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1476', '李心怡', '2', '2014012066', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1477', '路慧敏', '2', '2014012063', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1478', '平措拉姆', '2', '2014012040', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1479', '张可惠', '2', '2014012047', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1480', '苗婷婷', '2', '2014012057', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1481', '赤列旺久', '1', '2014012048', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1482', '刘莹莹', '2', '2014012051', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1483', '马旺旺', '1', '2014012050', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1484', '崔耀元', '2', '2014012147', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1485', '朱蓓蓓', '2', '2014012039', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1486', '杨麒', '2', '2014012035', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1487', '乐星宇', '1', '2014012140', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1488', '许可', '2', '2014012056', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1489', '胡子键', '1', '2014012049', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1490', '李瀚森', '1', '2014012043', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1491', '冀芒来', '1', '2014012045', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1492', '梅怡静', '2', '2014012064', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1493', '李韦思', '2', '2014012062', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1494', '宋艳萍', '2', '2014012041', '2014', '2', null, null, '2018-03-19 22:02:55', '2018-03-19 22:02:55');
INSERT INTO `t_student` VALUES ('1496', '冯洋', '1', '1271410003', '2010', '4', '', null, '2018-03-19 22:11:56', '2018-03-19 22:11:56');
INSERT INTO `t_student` VALUES ('1497', '楼金久', '1', '2015011929', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1498', '孙玉梅', '2', '2015011930', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1499', '王翔', '1', '2015011931', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1500', '黄子涵', '1', '2015011932', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1501', '李琪', '2', '2015011933', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1502', '王永康', '1', '2015011934', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1503', '王长虎', '1', '2015011935', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1504', '张万卿', '1', '2015011936', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1505', '王皓', '2', '2015011937', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1506', '刘彬', '2', '2015011938', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1507', '宋雁涛', '2', '2015011939', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1508', '陈靖', '2', '2015011940', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1509', '曹明宇', '1', '2015011941', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1510', '林杰', '2', '2015011942', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1511', '王雨然', '2', '2015011943', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1512', '袁琦', '2', '2015011945', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1513', '汪婷婷', '2', '2015011946', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1514', '黄惊鸿', '1', '2015011947', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1515', '徐润擎', '1', '2015011948', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1516', '卓掌满', '1', '2015011949', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1517', '滕瑜璠', '2', '2015011950', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1518', '刘兴昌', '1', '2015011951', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1519', '汪靖豪', '1', '2015011952', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1520', '石慧', '2', '2015011953', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1521', '李君宇', '2', '2015011954', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1522', '史自娟', '2', '2015011955', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1523', '张宇', '2', '2015011956', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1524', '杨镇豪', '1', '2015011957', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1525', '王璐', '2', '2015011958', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1526', '刘晶', '2', '2015011959', '2015', '1', null, '123456', '2018-03-20 21:19:10', '2018-03-31 15:27:49');
INSERT INTO `t_student` VALUES ('1527', '程靖国', '1', '2015011960', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1528', '刘建东', '1', '2015011961', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1529', '孙雷', '1', '2015011962', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1530', '陈佳辉', '1', '2015011963', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1531', '王宇凤', '2', '2015011964', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1532', '吴丹', '2', '2015011965', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1533', '白一君', '2', '2015011966', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1534', '晏灿芸', '2', '2015011967', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1535', '吴晓阳', '1', '2015011968', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1536', '刘旺', '1', '2015011969', '2015', '1', null, 'liuj12921109147', '2018-03-20 21:19:10', '2018-03-24 20:33:25');
INSERT INTO `t_student` VALUES ('1537', '彭景浩', '1', '2015011970', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1538', '宋思嘉', '2', '2015011971', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1539', '陈自豪', '1', '2015011972', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1540', '孔维田', '1', '2015011973', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1541', '田垒', '1', '2015011974', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1542', '庄迦恒', '1', '2015011976', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1543', '李平', '2', '2015011977', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1544', '王硕', '2', '2015011978', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1545', '张紫薇', '2', '2015011979', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1546', '王彩红', '2', '2015011980', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1547', '祁乐旭', '1', '2015011981', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1548', '梁志承', '1', '2015011982', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1549', '陈可欣', '2', '2015011983', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1550', '李想', '2', '2015011984', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1551', '江昆', '1', '2015011985', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1552', '杨艳', '2', '2015011986', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1553', '郝阳', '1', '2015011987', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1554', '王梦雨', '2', '2015011988', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1555', '谢林昕', '1', '2015011989', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1556', '谭建', '2', '2015011990', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1557', '杨可欣', '2', '2015011991', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1558', '叶琳', '2', '2015011992', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1559', '梁家馨', '2', '2015011994', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1560', '李步岳', '2', '2015011995', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1561', '李晓庆', '2', '2015011996', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1562', '韦刚', '1', '2015011997', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1563', '谢淞臣', '1', '2015011998', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1564', '李俊宜', '2', '2015011999', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1565', '许烨楠', '2', '2015012000', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1566', '刘梦桃', '2', '2015012001', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1567', '李豆豆', '2', '2015012002', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1568', '刘畅', '1', '2015012003', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1569', '朱留川', '1', '2015012004', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1570', '李一博', '1', '2015012005', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1571', '江承远', '1', '2015012006', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1572', '董丝纶', '1', '2015012007', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1573', '李雪柔', '2', '2015012008', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1574', '张世萌', '2', '2015012009', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1575', '吴宇轩', '2', '2015012010', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1576', '周士铃', '1', '2015012011', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1577', '王亚楠', '2', '2015012012', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1578', '卫亚丽', '2', '2015012013', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1579', '安蕊', '2', '2015012014', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1580', '翟阿鑫', '1', '2015012015', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1581', '郑文华', '2', '2015012016', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1582', '纪紫薇', '2', '2015012017', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1583', '李瑾', '2', '2015012018', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1584', '周月', '2', '2015012019', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1585', '吴玥婷', '2', '2015012020', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1586', '周怡', '2', '2015012021', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1587', '尚晓文', '2', '2015012022', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1588', '孙启明', '1', '2015012023', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1589', '曹竞月', '2', '2015012024', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1590', '张洁', '2', '2015012025', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1591', '蔡育纯', '2', '2015012026', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1592', '马鑫珑', '1', '2015012027', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1593', '刘锡洲', '1', '2015012028', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1594', '张钰莹', '2', '2015012029', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1595', '单继重', '1', '2015012030', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1596', '高杨飞', '1', '2015012031', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1597', '程立雪', '1', '2015012032', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1598', '姜心语', '2', '2015012033', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1599', '路婉婷', '2', '2015012034', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1600', '高榕', '2', '2015012035', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1601', '魏芳', '2', '2015012036', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1602', '马梦梅', '2', '2015012037', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1603', '杨雪', '2', '2015012038', '2015', '1', null, null, '2018-03-20 21:19:10', '2018-03-20 21:19:10');
INSERT INTO `t_student` VALUES ('1604', '卢琪', '2', '2016011986', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1605', '翁梦蕾', '2', '2016011987', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1606', '洪泽芳', '1', '2016011988', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1607', '陈芳', '2', '2016011990', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1608', '杨思琦', '2', '2016011991', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1609', '顾思宇', '2', '2016011993', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1610', '胡益峰', '1', '2016011994', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1611', '李可欣', '2', '2016011995', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1612', '茅梓军', '1', '2016011997', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1613', '张舒凯', '1', '2016011998', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1614', '汪义华', '1', '2016012001', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1615', '吕乐乐', '1', '2016012002', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1616', '陈琦', '2', '2016012003', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1617', '薛智麟', '1', '2016012005', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1618', '柯招坤', '1', '2016012007', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1619', '甘彩娈', '2', '2016012008', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1620', '马佳欣', '2', '2016012009', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1621', '赵瑞雪', '2', '2016012010', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1622', '郑春雨', '2', '2016012011', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1623', '胡雅馨', '2', '2016012012', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1624', '王雪', '2', '2016012013', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1625', '樊融', '1', '2016012015', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1626', '杨帆', '2', '2016012016', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1627', '陈爽', '2', '2016012017', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1628', '张慧', '2', '2016012019', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1629', '张新宇', '2', '2016012020', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1630', '马骏', '2', '2016012021', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1631', '刘士齐', '2', '2016012022', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1632', '李伟', '1', '2016012023', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1633', '吴建瑜', '2', '2016012024', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1634', '童宇欣', '2', '2016012025', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1635', '管凌波', '2', '2016012026', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1636', '赵莉', '2', '2016012028', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1637', '于鑫宇', '1', '2016012029', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1638', '王超超', '1', '2016012030', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1639', '王慧珍', '2', '2016012032', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1640', '方柱权', '1', '2016012033', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1641', '庄莉', '2', '2016012034', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1642', '周思婷', '2', '2016012035', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1643', '吕晓真', '2', '2016012037', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1644', '李瑞超', '2', '2016012038', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1645', '张琪', '2', '2016012039', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1646', '刘畅', '1', '2016012040', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1647', '王玥莹', '2', '2016012041', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1648', '马乐平', '2', '2016012042', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1649', '周紫伊', '2', '2016012043', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1650', '马福孝', '1', '2016012044', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1651', '王怡镔', '2', '2016012045', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1652', '吕国馨', '2', '2016012046', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1653', '丁小帅', '2', '2016012047', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1654', '王玉', '2', '2016012048', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1655', '程羚', '2', '2016012050', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1656', '裴颖', '2', '2016012051', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1657', '王晓哲', '2', '2016012052', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1658', '马玲', '2', '2016012054', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1659', '刘卓锦', '2', '2016012055', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1660', '陈逸璇', '2', '2016012056', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1661', '祁晨', '2', '2016012057', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1662', '唐杰', '1', '2016012058', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1663', '郑栋', '1', '2016012059', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1664', '王政扬', '1', '2016012060', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1665', '杨有存', '2', '2016012061', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1666', '冯舒怡', '2', '2016012062', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1667', '李庭娟', '2', '2016012064', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1668', '谢月鹏', '1', '2016012066', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1669', '刘玥', '2', '2016012067', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1670', '邓旭', '2', '2016012068', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1671', '贝金林', '1', '2016012070', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1672', '张济吨', '1', '2016012072', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1673', '王文雨', '2', '2016012074', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1674', '谢月月', '2', '2016012075', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1675', '邓云剑', '1', '2016012076', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1676', '郭腾岳', '2', '2016012077', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1677', '卫小琼', '2', '2016012078', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1678', '黄鹤', '1', '2016012080', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1679', '刘哲', '1', '2016012083', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1680', '唐祎琳', '2', '2016012084', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1681', '邵汝佳', '2', '2016012085', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1682', '杨岚青', '2', '2016012086', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1683', '侯晓东', '1', '2016012087', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1684', '夏江华', '1', '2016012090', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1685', '颜超一', '1', '2016012091', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1686', '张洪宇', '1', '2016012092', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1687', '马雪', '2', '2016012093', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1688', '杜君煜', '1', '2016012094', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1689', '王璐瑶', '2', '2016012095', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1690', '许征航', '1', '2016012096', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1691', '范彦澜', '2', '2016012097', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1692', '方慧琳', '2', '2016012098', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1693', '陈杰', '1', '2016012099', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1694', '邓茜茜', '2', '2016012100', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1695', '上官文钦', '1', '2016012101', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1696', '曹滢', '2', '2016012102', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1697', '刘松', '1', '2016012104', '2016', '1', null, null, '2018-03-20 21:26:25', '2018-03-20 21:26:25');
INSERT INTO `t_student` VALUES ('1698', '卢琪', '2', '2016011986', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1699', '翁梦蕾', '2', '2016011987', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1700', '洪泽芳', '1', '2016011988', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1701', '陈芳', '2', '2016011990', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1702', '杨思琦', '2', '2016011991', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1703', '顾思宇', '2', '2016011993', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1704', '胡益峰', '1', '2016011994', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1705', '李可欣', '2', '2016011995', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1706', '茅梓军', '1', '2016011997', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1707', '张舒凯', '1', '2016011998', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1708', '汪义华', '1', '2016012001', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1709', '吕乐乐', '1', '2016012002', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1710', '陈琦', '2', '2016012003', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1711', '薛智麟', '1', '2016012005', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1712', '柯招坤', '1', '2016012007', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1713', '甘彩娈', '2', '2016012008', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1714', '马佳欣', '2', '2016012009', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1715', '赵瑞雪', '2', '2016012010', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1716', '郑春雨', '2', '2016012011', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1717', '胡雅馨', '2', '2016012012', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1718', '王雪', '2', '2016012013', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1719', '樊融', '1', '2016012015', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1720', '杨帆', '2', '2016012016', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1721', '陈爽', '2', '2016012017', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1722', '张慧', '2', '2016012019', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1723', '张新宇', '2', '2016012020', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1724', '马骏', '2', '2016012021', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1725', '刘士齐', '2', '2016012022', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1726', '李伟', '1', '2016012023', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1727', '吴建瑜', '2', '2016012024', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1728', '童宇欣', '2', '2016012025', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1729', '管凌波', '2', '2016012026', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1730', '赵莉', '2', '2016012028', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1731', '于鑫宇', '1', '2016012029', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1732', '王超超', '1', '2016012030', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1733', '王慧珍', '2', '2016012032', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1734', '方柱权', '1', '2016012033', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1735', '庄莉', '2', '2016012034', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1736', '周思婷', '2', '2016012035', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1737', '吕晓真', '2', '2016012037', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1738', '李瑞超', '2', '2016012038', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1739', '张琪', '2', '2016012039', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1740', '刘畅', '1', '2016012040', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1741', '王玥莹', '2', '2016012041', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1742', '马乐平', '2', '2016012042', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1743', '周紫伊', '2', '2016012043', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1744', '马福孝', '1', '2016012044', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1745', '王怡镔', '2', '2016012045', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1746', '吕国馨', '2', '2016012046', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1747', '丁小帅', '2', '2016012047', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1748', '王玉', '2', '2016012048', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1749', '程羚', '2', '2016012050', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1750', '裴颖', '2', '2016012051', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1751', '王晓哲', '2', '2016012052', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1752', '马玲', '2', '2016012054', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1753', '刘卓锦', '2', '2016012055', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1754', '陈逸璇', '2', '2016012056', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1755', '祁晨', '2', '2016012057', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1756', '唐杰', '1', '2016012058', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1757', '郑栋', '1', '2016012059', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1758', '王政扬', '1', '2016012060', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1759', '杨有存', '2', '2016012061', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1760', '冯舒怡', '2', '2016012062', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1761', '李庭娟', '2', '2016012064', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1762', '谢月鹏', '1', '2016012066', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1763', '刘玥', '2', '2016012067', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1764', '邓旭', '2', '2016012068', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1765', '贝金林', '1', '2016012070', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1766', '张济吨', '1', '2016012072', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1767', '王文雨', '2', '2016012074', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1768', '谢月月', '2', '2016012075', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1769', '邓云剑', '1', '2016012076', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1770', '郭腾岳', '2', '2016012077', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1771', '卫小琼', '2', '2016012078', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1772', '黄鹤', '1', '2016012080', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1773', '刘哲', '1', '2016012083', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1774', '唐祎琳', '2', '2016012084', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1775', '邵汝佳', '2', '2016012085', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1776', '杨岚青', '2', '2016012086', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1777', '侯晓东', '1', '2016012087', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1778', '夏江华', '1', '2016012090', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1779', '颜超一', '1', '2016012091', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1780', '张洪宇', '1', '2016012092', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1781', '马雪', '2', '2016012093', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1782', '杜君煜', '1', '2016012094', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1783', '王璐瑶', '2', '2016012095', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1784', '许征航', '1', '2016012096', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1785', '范彦澜', '2', '2016012097', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1786', '方慧琳', '2', '2016012098', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1787', '陈杰', '1', '2016012099', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1788', '邓茜茜', '2', '2016012100', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1789', '上官文钦', '1', '2016012101', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1790', '曹滢', '2', '2016012102', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1791', '刘松', '1', '2016012104', '2016', '1', null, null, '2018-03-20 21:26:26', '2018-03-20 21:26:26');
INSERT INTO `t_student` VALUES ('1792', '梁莉莉', '2', '2017011581', '2017', '1', '18243117232', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1793', '陈益卓', '1', '2017012843', '2017', '1', '15543654521', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1794', '阎娜', '2', '2017012452', '2017', '1', '15643193498', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1795', '胡仕臻', '2', '2017012580', '2017', '1', '15526856515', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1796', '卢婧沅', '2', '2017013405', '2017', '1', '17390948180', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1797', '聂立', '1', '2017012695', '2017', '1', '15643114938', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1798', '甄星', '1', '2017012544', '2017', '1', '17790007182', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1799', '尹国庆', '2', '2017013322', '2017', '1', '15526825968', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1800', '徐杰', '1', '2017012578', '2017', '1', '17383433151', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1801', '罗阳', '2', '2017012235', '2017', '1', '15584479322', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1802', '张继露', '1', '2017013403', '2017', '1', '17390948025', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1803', '黄珊愉', '2', '2017011580', '2017', '1', '18243117437', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1804', '陈岩', '1', '2017012844', '2017', '1', '18338195038', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1805', '张雅帧', '2', '2017012178', '2017', '1', '15584349388', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1806', '杨梦婷', '2', '2017013406', '2017', '1', '15568833948', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1807', '梁怡萍', '2', '2017012315', '2017', '1', '18735393476', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1808', '张望', '1', '2017013407', '2017', '1', '15568893290', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1809', '杨雪', '2', '2017010280', '2017', '1', '13541748636', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1810', '刘浩', '1', '2017011838', '2017', '1', '17610891910', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1811', '肖雪妮', '2', '2017011985', '2017', '1', '15543002508', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1812', '金文婧', '2', '2017011740', '2017', '1', '15567764101', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1813', '阮杲杲', '1', '2017012512', '2017', '1', '15017021200', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1814', '王男', '1', '2017013171', '2017', '1', '17743461299', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1815', '申燕萍', '2', '2017013084', '2017', '1', '15543121705', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1816', '杨圣', '1', '2017012696', '2017', '1', '18574650985', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1817', '吴晓儿', '2', '2017011774', '2017', '1', '13510621604', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1818', '梁佳悦', '2', '2017012546', '2017', '1', '15584418038', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1819', '孙俊杰', '2', '2017013320', '2017', '1', '13125808915', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1820', '李浩泽', '1', '2017011907', '2017', '1', '15848437703', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1821', '梁栋', '1', '2017012312', '2017', '1', '15568829290', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1822', '李翊铭', '2', '2017013169', '2017', '1', '13125814367', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1823', '陈玥如', '2', '2017013168', '2017', '1', '18341771780', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1824', '杜渝', '1', '2017011982', '2017', '1', '15736157191', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1825', '孙燕', '2', '2017011839', '2017', '1', '15568827765', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1826', '李金书', '2', '2017011743', '2017', '1', '15543101761', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1827', '蓝钰沁', '1', '2017010307', '2017', '1', '13350116426', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1828', '肖瑶', '1', '2017012545', '2017', '1', '15584369560', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1829', '李昕', '2', '2017012510', '2017', '1', '13870174229', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1830', '罗昌琮', '1', '2017012179', '2017', '1', '17797151500', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1831', '陈瑜', '1', '2017013465', '2017', '1', '18743088396', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1832', '孔一言', '2', '2017012842', '2017', '1', '15543564075', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1833', '王诚昱', '1', '2017012509', '2017', '1', '13317919736', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1834', '肖瑞杰', '1', '2017010303', '2017', '1', '18040306139', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1835', '吴玉东', '2', '2017013083', '2017', '1', '18919809198', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1836', '李天翔', '1', '2017013404', '2017', '1', '18243118238', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1837', '李娜', '2', '2017010897', '2017', '1', '15590564685', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1838', '魏智鸿', '1', '2017013052', '2017', '1', '15568813428', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1839', '陆睿', '1', '2017012918', '2017', '1', '15526649209', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1840', '魏文晴', '2', '2017011343', '2017', '1', '13116153229', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1841', '孙靖涵', '1', '2017012577', '2017', '1', '15568803153', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1842', '陈泽鑫', '1', '2017011983', '2017', '1', '15223354194', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1843', '郑天泽', '1', '2017012313', '2017', '1', '15568829496', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1844', '熊英', '2', '2017012176', '2017', '1', '17790009516', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1845', '贾鑫泽', '1', '2017013170', '2017', '1', '18341581405', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1846', '彭学庆', '1', '2017012694', '2017', '1', '18574386460', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1847', '潘仲秋', '1', '2017012838', '2017', '1', '15543654100', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1848', '张景浩', '1', '2017012837', '2017', '1', '17737206021', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1849', '谢振炎', '1', '2017012697', '2017', '1', '15643114929', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1850', '徐璐', '2', '2017013173', '2017', '1', '13942612859', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1851', '黄金燕', '2', '2017012693', '2017', '1', '15526824340', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1852', '杨阔', '1', '2017012453', '2017', '1', '18631449291', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1853', '唐一钦', '1', '2017013081', '2017', '1', '15097116257', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1854', '张中悦', '2', '2017011984', '2017', '1', '18323313502', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1855', '唐家阳', '1', '2017010300', '2017', '1', '15826837354', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1856', '任静', '2', '2017013323', '2017', '1', '15526826733', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1857', '赵梦宇', '1', '2017012449', '2017', '1', '18233429899', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1858', '麦慧淇', '2', '2017011775', '2017', '1', '13069137071', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1859', '徐文晴', '2', '2017013321', '2017', '1', '15526825870', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1860', '刘鹏', '1', '2017013053', '2017', '1', '15584361301', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1861', '陈慧妮', '2', '2017012698', '2017', '1', '18975529778', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1862', '黄栋', '1', '2017011773', '2017', '1', '13069132050', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1863', '张芸嘉', '2', '2017012839', '2017', '1', '15543560659', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1864', '李明', '1', '2017012579', '2017', '1', '15643191829', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1865', '肖然', '1', '2017010282', '2017', '1', '15068803073', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1866', '叶雷', '1', '2017012915', '2017', '1', '18243117476', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1867', '闫英', '2', '2017012314', '2017', '1', '15568804692', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1868', '韩彩钰', '2', '2017011837', '2017', '1', '15568804310', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1869', '丁静', '2', '2017012237', '2017', '1', '15584374767', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1870', '王伟光', '1', '2017012841', '2017', '1', '15543650692', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1871', '孙文欣', '2', '2017012236', '2017', '1', '15584479730', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1872', '吴启雯', '2', '2017013051', '2017', '1', '17390943946', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1873', '徐绪睿', '1', '2017012917', '2017', '1', '15526638991', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1874', '黄政杰', '1', '2017011776', '2017', '1', '13450145038', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1875', '王伟航', '1', '2017013466', '2017', '1', '18857028922', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1876', '孙启明', '1', '2017011741', '2017', '1', '15568807813', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1877', '屈英杰', '2', '2017012454', '2017', '1', '18243118676', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1878', '张灵翔', '1', '2017013050', '2017', '1', '15880072399', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1879', '孙誉铭', '1', '2017013082', '2017', '1', '15543120805', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1880', '楚海川', '2', '2017012451', '2017', '1', '17390943796', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1881', '王俊逸', '1', '2017013408', '2017', '1', '18871746129', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1882', '李梦宇', '2', '2017012840', '2017', '1', '15543651030', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1883', '胡茜文', '1', '2017010254', '2017', '1', '15568801950', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1884', '安添霁', '1', '2017010867', '2017', '1', '15124481809', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1885', '张之昊', '1', '2017010314', '2017', '1', '13125805376', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1886', '吴渊博', '1', '2017012511', '2017', '1', '13069040277', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1887', '谢燕发', '1', '2017011583', '2017', '1', '18776587800', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1888', '孙锡吉', '2', '2017013172', '2017', '1', '15584458486', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1889', '阎瀚', '1', '2017011582', '2017', '1', '15807735982', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1890', '吴婷婷', '2', '2017012259', '2017', '1', '15885826989', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1891', '梁洁', '1', '2017012311', '2017', '1', '15568834139', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1892', '王岳峰', '1', '2017011906', '2017', '1', '18243119921', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1893', '崔怡然', '2', '2017012450', '2017', '1', '17390943991', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1894', '孙轲', '1', '2017012234', '2017', '1', '13469657853', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1895', '李小玉', '2', '2017012547', '2017', '1', '15526655127', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1896', '袁雪峰', '1', '2017010302', '2017', '1', '14781868495', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1897', '吴孟桐', '1', '2017012916', '2017', '1', '15506017210', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1898', '马宁', '2', '2017011742', '2017', '1', '18243118768', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1899', '白亚玲', '2', '2017012177', '2017', '1', '18935629777', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1900', '赵则栋', '1', '2017011342', '2017', '1', '13388009183', null, '2018-03-20 21:31:03', '2018-03-20 21:31:03');
INSERT INTO `t_student` VALUES ('1901', '梁莉莉', '2', '2017011581', '2017', '1', '18243117232', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1902', '陈益卓', '1', '2017012843', '2017', '1', '15543654521', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1903', '阎娜', '2', '2017012452', '2017', '1', '15643193498', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1904', '胡仕臻', '2', '2017012580', '2017', '1', '15526856515', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1905', '卢婧沅', '2', '2017013405', '2017', '1', '17390948180', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1906', '聂立', '1', '2017012695', '2017', '1', '15643114938', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1907', '甄星', '1', '2017012544', '2017', '1', '17790007182', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1908', '尹国庆', '2', '2017013322', '2017', '1', '15526825968', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1909', '徐杰', '1', '2017012578', '2017', '1', '17383433151', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1910', '罗阳', '2', '2017012235', '2017', '1', '15584479322', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1911', '张继露', '1', '2017013403', '2017', '1', '17390948025', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1912', '黄珊愉', '2', '2017011580', '2017', '1', '18243117437', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1913', '陈岩', '1', '2017012844', '2017', '1', '18338195038', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1914', '张雅帧', '2', '2017012178', '2017', '1', '15584349388', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1915', '杨梦婷', '2', '2017013406', '2017', '1', '15568833948', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1916', '梁怡萍', '2', '2017012315', '2017', '1', '18735393476', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1917', '张望', '1', '2017013407', '2017', '1', '15568893290', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1918', '杨雪', '2', '2017010280', '2017', '1', '13541748636', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1919', '刘浩', '1', '2017011838', '2017', '1', '17610891910', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1920', '肖雪妮', '2', '2017011985', '2017', '1', '15543002508', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1921', '金文婧', '2', '2017011740', '2017', '1', '15567764101', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1922', '阮杲杲', '1', '2017012512', '2017', '1', '15017021200', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1923', '王男', '1', '2017013171', '2017', '1', '17743461299', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1924', '申燕萍', '2', '2017013084', '2017', '1', '15543121705', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1925', '杨圣', '1', '2017012696', '2017', '1', '18574650985', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1926', '吴晓儿', '2', '2017011774', '2017', '1', '13510621604', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1927', '梁佳悦', '2', '2017012546', '2017', '1', '15584418038', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1928', '孙俊杰', '2', '2017013320', '2017', '1', '13125808915', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1929', '李浩泽', '1', '2017011907', '2017', '1', '15848437703', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1930', '梁栋', '1', '2017012312', '2017', '1', '15568829290', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1931', '李翊铭', '2', '2017013169', '2017', '1', '13125814367', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1932', '陈玥如', '2', '2017013168', '2017', '1', '18341771780', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1933', '杜渝', '1', '2017011982', '2017', '1', '15736157191', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1934', '孙燕', '2', '2017011839', '2017', '1', '15568827765', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1935', '李金书', '2', '2017011743', '2017', '1', '15543101761', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1936', '蓝钰沁', '1', '2017010307', '2017', '1', '13350116426', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1937', '肖瑶', '1', '2017012545', '2017', '1', '15584369560', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1938', '李昕', '2', '2017012510', '2017', '1', '13870174229', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1939', '罗昌琮', '1', '2017012179', '2017', '1', '17797151500', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1940', '陈瑜', '1', '2017013465', '2017', '1', '18743088396', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1941', '孔一言', '2', '2017012842', '2017', '1', '15543564075', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1942', '王诚昱', '1', '2017012509', '2017', '1', '13317919736', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1943', '肖瑞杰', '1', '2017010303', '2017', '1', '18040306139', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1944', '吴玉东', '2', '2017013083', '2017', '1', '18919809198', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1945', '李天翔', '1', '2017013404', '2017', '1', '18243118238', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1946', '李娜', '2', '2017010897', '2017', '1', '15590564685', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1947', '魏智鸿', '1', '2017013052', '2017', '1', '15568813428', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1948', '陆睿', '1', '2017012918', '2017', '1', '15526649209', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1949', '魏文晴', '2', '2017011343', '2017', '1', '13116153229', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1950', '孙靖涵', '1', '2017012577', '2017', '1', '15568803153', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1951', '陈泽鑫', '1', '2017011983', '2017', '1', '15223354194', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1952', '郑天泽', '1', '2017012313', '2017', '1', '15568829496', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1953', '熊英', '2', '2017012176', '2017', '1', '17790009516', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1954', '贾鑫泽', '1', '2017013170', '2017', '1', '18341581405', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1955', '彭学庆', '1', '2017012694', '2017', '1', '18574386460', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1956', '潘仲秋', '1', '2017012838', '2017', '1', '15543654100', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1957', '张景浩', '1', '2017012837', '2017', '1', '17737206021', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1958', '谢振炎', '1', '2017012697', '2017', '1', '15643114929', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1959', '徐璐', '2', '2017013173', '2017', '1', '13942612859', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1960', '黄金燕', '2', '2017012693', '2017', '1', '15526824340', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1961', '杨阔', '1', '2017012453', '2017', '1', '18631449291', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1962', '唐一钦', '1', '2017013081', '2017', '1', '15097116257', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1963', '张中悦', '2', '2017011984', '2017', '1', '18323313502', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1964', '唐家阳', '1', '2017010300', '2017', '1', '15826837354', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1965', '任静', '2', '2017013323', '2017', '1', '15526826733', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1966', '赵梦宇', '1', '2017012449', '2017', '1', '18233429899', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1967', '麦慧淇', '2', '2017011775', '2017', '1', '13069137071', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1968', '徐文晴', '2', '2017013321', '2017', '1', '15526825870', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1969', '刘鹏', '1', '2017013053', '2017', '1', '15584361301', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1970', '陈慧妮', '2', '2017012698', '2017', '1', '18975529778', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1971', '黄栋', '1', '2017011773', '2017', '1', '13069132050', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1972', '张芸嘉', '2', '2017012839', '2017', '1', '15543560659', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1973', '李明', '1', '2017012579', '2017', '1', '15643191829', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1974', '肖然', '1', '2017010282', '2017', '1', '15068803073', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1975', '叶雷', '1', '2017012915', '2017', '1', '18243117476', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1976', '闫英', '2', '2017012314', '2017', '1', '15568804692', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1977', '韩彩钰', '2', '2017011837', '2017', '1', '15568804310', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1978', '丁静', '2', '2017012237', '2017', '1', '15584374767', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1979', '王伟光', '1', '2017012841', '2017', '1', '15543650692', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1980', '孙文欣', '2', '2017012236', '2017', '1', '15584479730', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1981', '吴启雯', '2', '2017013051', '2017', '1', '17390943946', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1982', '徐绪睿', '1', '2017012917', '2017', '1', '15526638991', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1983', '黄政杰', '1', '2017011776', '2017', '1', '13450145038', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1984', '王伟航', '1', '2017013466', '2017', '1', '18857028922', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1985', '孙启明', '1', '2017011741', '2017', '1', '15568807813', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1986', '屈英杰', '2', '2017012454', '2017', '1', '18243118676', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1987', '张灵翔', '1', '2017013050', '2017', '1', '15880072399', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1988', '孙誉铭', '1', '2017013082', '2017', '1', '15543120805', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1989', '楚海川', '2', '2017012451', '2017', '1', '17390943796', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1990', '王俊逸', '1', '2017013408', '2017', '1', '18871746129', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1991', '李梦宇', '2', '2017012840', '2017', '1', '15543651030', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1992', '胡茜文', '1', '2017010254', '2017', '1', '15568801950', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1993', '安添霁', '1', '2017010867', '2017', '1', '15124481809', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1994', '张之昊', '1', '2017010314', '2017', '1', '13125805376', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1995', '吴渊博', '1', '2017012511', '2017', '1', '13069040277', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1996', '谢燕发', '1', '2017011583', '2017', '1', '18776587800', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1997', '孙锡吉', '2', '2017013172', '2017', '1', '15584458486', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1998', '阎瀚', '1', '2017011582', '2017', '1', '15807735982', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('1999', '吴婷婷', '2', '2017012259', '2017', '1', '15885826989', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2000', '梁洁', '1', '2017012311', '2017', '1', '15568834139', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2001', '王岳峰', '1', '2017011906', '2017', '1', '18243119921', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2002', '崔怡然', '2', '2017012450', '2017', '1', '17390943991', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2003', '孙轲', '1', '2017012234', '2017', '1', '13469657853', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2004', '李小玉', '2', '2017012547', '2017', '1', '15526655127', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2005', '袁雪峰', '1', '2017010302', '2017', '1', '14781868495', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2006', '吴孟桐', '1', '2017012916', '2017', '1', '15506017210', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2007', '马宁', '2', '2017011742', '2017', '1', '18243118768', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2008', '白亚玲', '2', '2017012177', '2017', '1', '18935629777', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2009', '赵则栋', '1', '2017011342', '2017', '1', '13388009183', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2010', '张静', '2', '2017011733', '2017', '5', '13086838081', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2011', '张锐', '1', '2017012835', '2017', '5', '15543561061', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2012', '郭健', '1', '2017012402', '2017', '5', '17390948284', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2013', '李潍君', '2', '2017012784', '2017', '5', '17090948191', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2014', '张雨', '1', '2017012283', '2017', '5', '15526672470', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2015', '张博', '2', '2017010905', '2017', '5', '15590589634', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2016', '刘婷', '2', '2017011898', '2017', '5', '18243118255', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2017', '张星渊', '2', '2017011897', '2017', '5', '15504490407', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2018', '甘森萍', '2', '2017010321', '2017', '5', '18224387758', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2019', '周菁菁', '2', '2017013419', '2017', '5', '13069013234', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2020', '雷嘉欣', '2', '2017010216', '2017', '5', '15002827881', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2021', '马子仪', '2', '2017011698', '2017', '5', '18243119946', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2022', '杜永祥', '1', '2017012912', '2017', '5', '18712665320', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2023', '钱锟', '1', '2017010903', '2017', '5', '15843018187', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2024', '王若鼎', '1', '2017012785', '2017', '5', '13298352561', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2025', '李仁敏', '2', '2017012836', '2017', '5', '15238703627', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2026', '许晗悦', '2', '2017012000', '2017', '5', '13500815170', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2027', '范俣杰', '2', '2017010317', '2017', '5', '15568828148', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2028', '韦淦秋', '2', '2017012898', '2017', '5', '15543542613', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2029', '李雪娜', '2', '2017012447', '2017', '5', '13803338373', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2030', '刘琳', '1', '2017012169', '2017', '5', '15584215079', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2031', '宋钰', '2', '2017011980', '2017', '5', '15504494403', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2032', '魏珊', '2', '2017012403', '2017', '5', '15543680832', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2033', '张梦诗', '2', '2017011067', '2017', '5', '15526896351', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2034', '刘宝臣', '1', '2017010910', '2017', '5', '15643188625', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2035', '李莹', '2', '2017012448', '2017', '5', '18243118480', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2036', '周俊文', '1', '2017011053', '2017', '5', '15543671741', null, '2018-03-20 21:33:06', '2018-03-20 21:33:06');
INSERT INTO `t_student` VALUES ('2037', '彭毛青措', '2', '2017010046', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2038', '马进才', '1', '2017010054', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2039', '韩瑞', '1', '2017010055', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2040', '马甜甜', '2', '2017010057', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2041', '王玉虎', '1', '2017010062', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2042', '李正熙', '2', '2017010069', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2043', '周冠男', '2', '2017010070', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2044', '毛祖元', '1', '2017010073', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2045', '佟婉婷', '2', '2017010074', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2046', '韩晴', '2', '2017010075', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2047', '马佩瑄', '1', '2017010080', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2048', '索高辉', '1', '2017010083', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2049', '席爱国', '1', '2017010267', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2050', '文斌', '1', '2017010278', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2051', '石宏', '2', '2017010857', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2052', '王宇婷', '2', '2017010886', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2053', '李少飞', '1', '2017011066', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2054', '程磊', '1', '2017011472', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2055', '于浩洋', '1', '2017011629', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2056', '冯飞', '1', '2017011680', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2057', '阮家宝', '1', '2017011771', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2058', '万锴迪', '1', '2017011772', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2059', '吴迪', '1', '2017011826', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2060', '胡顺航', '1', '2017011827', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2061', '胡泽彬', '1', '2017011958', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2062', '沈萌', '2', '2017011959', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2063', '陈林峰', '1', '2017012257', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2064', '田茂吉', '1', '2017012258', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2065', '张艺翔', '2', '2017012308', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2066', '任雨莹', '2', '2017012309', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2067', '杜欣召', '1', '2017012445', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2068', '李鹏博', '1', '2017012446', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2069', '董昱辰', '2', '2017012538', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2070', '王璟馨', '2', '2017012539', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2071', '赵建伟', '1', '2017012833', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2072', '高晓雨', '2', '2017012834', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2073', '王玉月', '2', '2017013318', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2074', '焦洁', '2', '2017013319', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2075', '欧阳亚男', '2', '2017013401', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2076', '陈香菱', '2', '2017013402', '2017', '2', null, null, '2018-03-21 19:31:38', '2018-03-21 19:31:38');
INSERT INTO `t_student` VALUES ('2231', '汤家凤1', '2', '2018011999', '2018', '1', '15504475573', null, '2018-04-06 10:59:31', '2018-04-06 10:59:31');
INSERT INTO `t_student` VALUES ('2232', '汤家凤2', '1', '2018011000', '2018', '1', '15504475573', null, '2018-04-06 10:59:31', '2018-04-06 10:59:31');
INSERT INTO `t_student` VALUES ('2233', '汤家凤5', '2', '2018011100', '2018', '1', '15504475573', null, '2018-04-06 10:59:31', '2018-04-06 10:59:31');
INSERT INTO `t_student` VALUES ('2234', '汤家凤7', '2', '2018011200', '2018', '1', '15504475573', null, '2018-04-06 10:59:31', '2018-04-06 10:59:31');
INSERT INTO `t_student` VALUES ('2235', '汤家凤11', '2', '2018011300', '2018', '1', '15504475573', null, '2018-04-06 10:59:31', '2018-04-06 10:59:31');
INSERT INTO `t_student` VALUES ('2236', '汤家凤13', '2', '2018011400', '2018', '1', '15504475573', null, '2018-04-06 10:59:31', '2018-04-06 10:59:31');
INSERT INTO `t_student` VALUES ('2284', '张宇', '2', '2018011998', '2018', '1', '15504475573', null, '2018-04-06 15:34:48', '2018-04-06 15:34:48');
INSERT INTO `t_student` VALUES ('2285', '张友', '1', '2018011001', '2018', '1', '15504475573', null, '2018-04-06 15:34:48', '2018-04-06 15:34:48');
INSERT INTO `t_student` VALUES ('2286', '张翼德', '2', '2018011102', '2018', '1', '15504475573', null, '2018-04-06 15:34:48', '2018-04-06 15:34:48');
INSERT INTO `t_student` VALUES ('2289', '张宇', '0', '2018011401', '2018', '0', '', null, '2018-04-06 16:07:45', '2018-04-06 16:07:45');
INSERT INTO `t_student` VALUES ('2294', '张三', '1', '2011010000', '2015', '1', '17678313419', null, '2018-06-14 08:49:17', '2018-06-14 08:49:17');
INSERT INTO `t_student` VALUES ('2295', '李四', '2', '2011010001', '2015', '1', null, null, '2018-06-14 08:49:17', '2018-06-14 08:49:17');
INSERT INTO `t_student` VALUES ('2296', '王五', '1', '2011010002', '2015', '1', null, null, '2018-06-14 08:49:17', '2018-06-14 08:49:17');
INSERT INTO `t_student` VALUES ('2297', '赵六', '2', '2011010003', '2015', '1', null, null, '2018-06-14 08:49:17', '2018-06-14 08:49:17');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

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
  `author_id_1` int(11) NOT NULL COMMENT '作者id1',
  `author_level_1` tinyint(50) NOT NULL COMMENT '作者1的等级(1-第一作者，2-第二作者....以此类推)',
  `author_id_2` int(11) DEFAULT NULL COMMENT '作者id2',
  `author_level_2` tinyint(50) DEFAULT NULL COMMENT '作者2的等级(1-第一作者，2-第二作者....以此类推)',
  `author_id_3` int(11) DEFAULT NULL COMMENT '作者id3',
  `author_level_3` tinyint(50) DEFAULT NULL COMMENT '作者3的等级(1-第一作者，2-第二作者....以此类推)',
  `author_id_4` int(11) DEFAULT NULL COMMENT '作者id4',
  `author_level_4` tinyint(50) DEFAULT NULL COMMENT '作者4的等级(1-第一作者，2-第二作者....以此类推)',
  `author_id_5` int(11) DEFAULT NULL COMMENT '作者id5',
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='论文统计';

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
INSERT INTO `t_thesis` VALUES ('19', '《论软件工程的重要性》', '1536', '1', '1526', '2', '1580', '3', null, null, null, null, '2018-01-01', '《自然》111', '6', null, null, '2018-04-06 16:18:04', '2018-04-06 16:18:04', '0');
INSERT INTO `t_thesis` VALUES ('20', '《论软件工程的重要性》', '1536', '1', '1526', '2', '1580', '3', null, null, null, null, '2018-01-01', '《自然》111', '6', null, null, '2018-04-06 16:18:04', '2018-04-06 16:18:04', '0');
INSERT INTO `t_thesis` VALUES ('21', '《论软件工程的重要性》', '1536', '1', '1526', '2', '1580', '3', null, null, null, null, '2018-01-01', '《自然》111', '6', null, null, '2018-04-06 16:18:04', '2018-04-06 16:18:04', '0');
INSERT INTO `t_thesis` VALUES ('22', '《论软件工程的重要性》', '1536', '1', '1526', '2', '1580', '3', null, null, null, null, '2018-01-01', '《自然》111', '6', null, null, '2018-04-06 16:18:04', '2018-04-06 16:18:04', '0');
INSERT INTO `t_thesis` VALUES ('23', '《论软件工程的重要性》', '1536', '1', '1526', '2', '1580', '3', null, null, null, null, '2018-01-01', '《自然》111', '6', null, null, '2018-04-06 16:21:43', '2018-04-06 16:21:43', '0');
INSERT INTO `t_thesis` VALUES ('24', '《论软件工程的重要性》', '1536', '1', '1526', '2', '1580', '3', null, null, null, null, '2018-01-01', '《自然》111', '6', null, null, '2018-04-06 16:21:43', '2018-04-06 16:21:43', '0');
INSERT INTO `t_thesis` VALUES ('25', '《论软件工程的重要性》', '1536', '1', '1526', '2', '1580', '3', null, null, null, null, '2018-01-01', '《自然》111', '6', null, null, '2018-04-06 16:21:44', '2018-04-06 16:21:44', '0');
INSERT INTO `t_thesis` VALUES ('26', '《论软件工程的重要性》', '1536', '1', '1526', '2', '1580', '3', null, null, null, null, '2018-01-01', '《自然》111', '6', null, null, '2018-04-06 16:21:44', '2018-04-06 16:21:44', '0');
INSERT INTO `t_thesis` VALUES ('27', 'hgdf', '1536', '1', null, null, null, null, null, null, null, null, null, 'gd', '3', '', null, '2018-04-20 14:31:21', '2018-04-20 14:31:21', '0');
INSERT INTO `t_thesis` VALUES ('28', 'hgdf', '1536', '1', null, null, null, null, null, null, null, null, null, 'gd', '3', '', null, '2018-04-20 14:31:40', '2018-04-20 14:31:40', '0');
INSERT INTO `t_thesis` VALUES ('29', '啊', '1526', '1', null, null, null, null, null, null, null, null, null, '啊', '1', '', null, '2018-04-20 15:18:16', '2018-04-20 15:18:16', '0');
INSERT INTO `t_thesis` VALUES ('30', '啊', '1526', '1', null, null, null, null, null, null, null, null, null, '啊', '1', '', null, '2018-04-20 15:21:21', '2018-04-20 15:21:21', '0');
INSERT INTO `t_thesis` VALUES ('31', '去', '1526', '1', null, null, null, null, null, null, null, null, null, '去', '3', '', null, '2018-04-20 15:24:30', '2018-04-20 15:24:30', '0');
INSERT INTO `t_thesis` VALUES ('32', '1', '1526', '1', null, null, null, null, null, null, null, null, null, '去', '1', '', null, '2018-04-20 15:28:08', '2018-04-20 15:28:08', '0');
INSERT INTO `t_thesis` VALUES ('33', 'a', '1526', '1', null, null, null, null, null, null, null, null, null, 'a', '1', '', null, '2018-04-20 15:33:20', '2018-04-20 15:33:20', '0');
INSERT INTO `t_thesis` VALUES ('34', 'a', '1536', '1', null, null, null, null, null, null, null, null, null, 'a', '1', '', null, '2018-04-20 15:33:59', '2018-04-20 15:33:59', '0');
