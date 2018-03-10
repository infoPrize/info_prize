#学生信息表-t_student_info 新增列stu_number
ALTER TABLE `t_student_info` ADD COLUMN `stu_number` varchar(10) NOT NULL COMMENT '学生学号' AFTER `sex`;

#修改表名,有点儿不方便
ALTER TABLE `t_student_info` RENAME `t_student`;

#修改字段属性
ALTER TABLE `t_scientific_project` CHANGE `set_time` `set_year` VARCHAR(10) DEFAULT '2017'  COMMENT '立项年份';

#增加数据是否可见条件
ALTER TABLE `t_scientific_project` ADD COLUMN `is_deleted` INT COMMENT '是否已删除, 0-未删除, 1-已删除' DEFAULT 0 NOT NULL;

#新建国创科研项目类型对照表
DROP TABLE IF EXISTS `t_scientific_project_type`;
CREATE TABLE `t_scientific_project_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目类型代码',
  `project_type` varchar(50) DEFAULT NULL COMMENT '项目类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='国创科研项目类型对照表';
    -- 插入数据
INSERT INTO `t_scientific_project_type` VALUES ('1', '一般科研立项');
INSERT INTO `t_scientific_project_type` VALUES ('2', '专项计划项目');
INSERT INTO `t_scientific_project_type` VALUES ('3', '重点科研立项');
INSERT INTO `t_scientific_project_type` VALUES ('4', '国家级大学生创新创业训练计划');
INSERT INTO `t_scientific_project_type` VALUES ('5', '未知');

#增加ACM数据是否可见条件
ALTER TABLE `t_acm_prize` ADD COLUMN `is_deleted` INT COMMENT '是否已删除, 0-未删除, 1-已删除' DEFAULT 0 NOT NULL;

#新建 t_material 材料表
DROP TABLE IF EXISTS `t_material`;
CREATE TABLE `t_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识',
  `thesis_id` int(11) DEFAULT NULL COMMENT '论文的id',
  `patent_id` int(11) DEFAULT NULL COMMENT '专利的id',
  `scientific_id` int(11) DEFAULT NULL COMMENT '国创科研id',
  `acm_id` int(11) DEFAULT NULL COMMENT 'acm的id',
  `math_id` int(11) DEFAULT NULL COMMENT '数学建模',
  `internet_id` int(11) DEFAULT NULL COMMENT '互联网加的id',
  `challenge_id` int(11) DEFAULT NULL COMMENT '挑战杯的id',
  `material_name` varchar(50) DEFAULT NULL COMMENT '材料名称',
  `material_url` varchar(255) DEFAULT NULL COMMENT '材料路径',
  `is_deleted` tinyint(4) NULL DEFAULT 0 COMMENT '是否已经删除,0-否,1-是',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modified_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='材料信息表';