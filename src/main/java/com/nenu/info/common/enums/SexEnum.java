package com.nenu.info.common.enums;

/**
 * @author: software-liuwang
 * @time: 2017/12/5 15:31
 * @description :
 */
public enum SexEnum {

    Male(1, "男"), Female(2, "女");

    SexEnum(Integer id, String value) {
        this.id = id;
        this.value = value;
    }

    private Integer id;
    private String value;

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
        for(SexEnum sexEnum : SexEnum.values()) {
            if(id.equals(sexEnum.getId())) {
                return sexEnum.getValue();
            }
        }
        return null;
    }

    public static Integer getIdByValue(String value) {
        for(SexEnum sexEnum : SexEnum.values()) {
            if(value.equals(sexEnum.getValue())) {
                return sexEnum.getId();
            }
        }
        return null;
    }
}
