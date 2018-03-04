package com.nenu.info.common.enums;

/**
 * JournalLevelEnum - 期刊等级枚举类
 *
 * @author zhaiaxin
 * @time: 2018/3/3 18:01.
 */
public enum JournalLevelEnum {

    one(1,"E类"),
    two(2,"D类"),
    three(3,"C类"),
    Four(4,"B类"),
    Five(5,"A类"),
    Six(6,"T类"),
    Unknown(7,"未知");

    Integer id;
    String value;

    JournalLevelEnum(Integer id, String value) {
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
        for(JournalLevelEnum journalLevelEnum : JournalLevelEnum.values()) {
            if(id.equals(journalLevelEnum.getId())) {
                return journalLevelEnum.getValue();
            }
        }
        return null;
    }

    public static Integer getIdByValue(String value) {
        for(JournalLevelEnum journalLevelEnum : JournalLevelEnum.values()) {
            if(value.equals(journalLevelEnum.getValue())) {
                return journalLevelEnum.getId();
            }
        }
        return null;
    }

    }
