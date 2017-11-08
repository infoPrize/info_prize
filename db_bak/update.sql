#学生信息表-t_student_info 新增列stu_number
ALTER TABLE `t_student_info` ADD COLUMN `stu_number` varchar(10) NOT NULL COMMENT '学生学号' AFTER `sex`;

#修改表名，有点儿不方便
ALTER TABLE `t_student_info` RENAME `t_student`;