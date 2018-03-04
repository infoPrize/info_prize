package com.nenu.info.common.enums;

/**
 * @author: software-liuwang
 * @time: 2018/1/24 8:51
 * @description: 获奖等级枚举类
 */
public enum PrizeLevelEnum {

    First(1, "一等奖(金奖)"), Second(2, "二等奖(银奖)"), Third(3, "三等奖(铜奖)"),
    Fourth(4, "优胜奖(成功参赛奖)"), Fifth(5, "未知");

    Integer id;
    String value;

    PrizeLevelEnum(Integer id, String value) {
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
        for(PrizeLevelEnum prizeLevelEnum : PrizeLevelEnum.values()) {
            if(id.equals(prizeLevelEnum.getId())) {
                return prizeLevelEnum.getValue();
            }
        }
        return null;
    }

    public static Integer getIdByValue(String value) {
        for(PrizeLevelEnum prizeLevelEnum : PrizeLevelEnum.values()) {
            if(value.equals(prizeLevelEnum.getValue())) {
                return prizeLevelEnum.getId();
            }
        }
        return null;
    }
}
