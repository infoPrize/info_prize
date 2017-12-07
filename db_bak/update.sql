#学生信息表-t_student_info 新增列stu_number
ALTER TABLE `t_student_info` ADD COLUMN `stu_number` varchar(10) NOT NULL COMMENT '学生学号' AFTER `sex`;

#修改表名，有点儿不方便
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
