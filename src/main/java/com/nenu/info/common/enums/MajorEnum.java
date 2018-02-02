package com.nenu.info.common.enums;

/**
 * @author: software-liuwang
 * @time: 2017/12/4 16:28
 * @description : 专业枚举类
 */
public enum MajorEnum {

    Software(1, "软件工程"),
    CST(2, "计算机科学与技术"),
    CSTCooperation(3, "计算机科学与技术（中美合作）"),
    EducationalTechnology(4, "教育技术学"),
    EducationalTeacher(41,"教育技术学（公费师范）"),
    LibraryAndWord(5, "图书情报与档案管理类"),
    Library(51, "图书馆学"),
    InformationResources(52, "信息资源管理");

    Integer id;
    String value;

    MajorEnum(Integer id, String value) {
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
        for(MajorEnum majorEnum : MajorEnum.values()) {
            if(id.equals(majorEnum.getId())) {
                return majorEnum.getValue();
            }
        }
        return null;
    }

    public static Integer getIdByValue(String value) {
        for(MajorEnum majorEnum : MajorEnum.values()) {
            if(value.equals(majorEnum.getValue())) {
                return majorEnum.getId();
            }
        }
        return null;
    }
}
