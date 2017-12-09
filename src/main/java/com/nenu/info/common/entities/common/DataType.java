package com.nenu.info.common.entities.common;


public class DataType extends AbstractEntity {
    private static final long serialVersionUID = -6221449770334894360L;
    private String filedName;
    private int column;

    public DataType(String filedName, int column) {
        this.filedName = filedName;
        this.column = column;
    }

    public String getFiledName() {
        return this.filedName;
    }

    public void setFiledName(String filedName) {
        this.filedName = filedName;
    }

    public int getColumn() {
        return this.column;
    }

    public void setColumn(int column) {
        this.column = column;
    }

    public void setId(Integer id) {
    }
}
