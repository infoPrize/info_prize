package com.nenu.info.common.enums;

/**
 * @author: software-liuwang
 * @time: 2017/12/5 14:37
 * @description :
 */
public enum ProjectTypeEnum {

    Weizhi(5, "未知"),    SimpleProject(1, "一般科研立项"),    ZhuanxiangProject(2, "专项计划项目"),
    ImportantProject(3, "重点科研立项"),    Guochuang(4, "国家级大学生创新创业训练计划");


    private Integer id;
    private String value;

    ProjectTypeEnum(Integer id, String value) {
        this.id = id;
        this.value = value;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public static String getValueById(Integer id) {
        for(ProjectTypeEnum projectTypeEnum : ProjectTypeEnum.values()) {
            if(id.equals(projectTypeEnum.getId())) {
                return projectTypeEnum.getValue();
            }
        }
        return null;
    }

    public static Integer getIdByValue(String value) {
        for(ProjectTypeEnum projectTypeEnum : ProjectTypeEnum.values()) {
            if(value.equals(projectTypeEnum.getValue())) {
                return projectTypeEnum.getId();
            }
        }
        return null;
    }
}
