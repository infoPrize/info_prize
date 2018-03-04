package com.nenu.info.common.enums;

/**
 * @author: software-liuwang
 * @time: 2017/12/8 13:55
 * @description :
 */
public enum MatchLevelEnum {

    SchoolLevel(1, "校级"), CityLevel(2, "市级"), ProvinceLevel(3, "省级"), MultiProvincialLevel(4, "多省级"),
    CountryLevel(5, "国家级"), AsianLevel(6, "亚洲级"), NationalLevel(7, "国际级");

    private Integer id;
    private String value;

    MatchLevelEnum(Integer id, String value) {
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
        for(MatchLevelEnum matchLevelEnum : MatchLevelEnum.values()) {
            if(id.equals(matchLevelEnum.getId())) {
                return matchLevelEnum.getValue();
            }
        }
        return null;
    }

    public static Integer getIdByValue(String value) {
        for(MatchLevelEnum matchLevelEnum : MatchLevelEnum.values()) {
            if(value.equals(matchLevelEnum.getValue())) {
                return matchLevelEnum.getId();
            }
        }
        return null;
    }
}
