package com.nenu.info.common.entities.common;

import java.io.Serializable;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import org.apache.commons.beanutils.PropertyUtils;

public abstract class AbstractEntity implements Serializable {
    private static final long serialVersionUID = -8826342395112178831L;
    private transient Map allFileds;
    private transient String tableName;

    public AbstractEntity() {
    }

    public String toString() {
        try {
            Map<?, ?> map = PropertyUtils.describe(this);
            return map.toString();
        } catch (Exception var2) {
            var2.printStackTrace();
            return "null";
        }
    }

    public boolean equals(Object obj) {
        return super.equals(obj);
    }

    public int hashCode() {
        return super.hashCode();
    }

    public String getTableName() {
        return this.tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public Map getAllFileds() {
        return (Map)(this.allFileds == null?new HashMap():this.allFileds);
    }

    public Collection getAllFiledsKeys() {
        return this.allFileds == null?Collections.emptyMap().keySet():this.allFileds.keySet();
    }

    public Collection getAllFiledsValues() {
        return this.allFileds == null?Collections.emptyMap().values():this.allFileds.values();
    }

    public void setAllFileds(Map allFileds) {
        this.allFileds = allFileds;
    }

    public abstract void setId(Integer var1);

    public String[] escap() {
        String[] escap = new String[]{"class", "allFileds", "tableName", "allFiledsKeys", "allFiledsValues"};
        return escap;
    }
}
