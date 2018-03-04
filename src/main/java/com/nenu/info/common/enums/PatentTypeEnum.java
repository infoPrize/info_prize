package com.nenu.info.common.enums;

/**
 * PatentTypeEnum - 专利类别枚举类
 *
 * @author zhaiaxin
 * @time: 2018/3/3 16:38.
 */
public enum PatentTypeEnum {

    Patentforinvention(1, "发明专利"),
    UtilityModelPatent(2, "实用新型专利"),
    IndustrialDesignPatent(3, "外观设计专利"),
    Unknown(4, "未知");

    Integer id;
    String value;

    PatentTypeEnum(Integer id, String value) {
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
        for(PatentTypeEnum patentTypeEnum : PatentTypeEnum.values()) {
            if(id.equals(patentTypeEnum.getId())) {
                return patentTypeEnum.getValue();
            }
        }
        return null;
    }

    public static Integer getIdByValue(String value) {
        for(PatentTypeEnum patentTypeEnum : PatentTypeEnum.values()) {
            if(value.equals(patentTypeEnum.getValue())) {
                return patentTypeEnum.getId();
            }
        }
        return null;
    }
}
