package com.nenu.info.common.utils;

import com.nenu.info.common.entities.common.DataType;
import jxl.Cell;
import jxl.DateCell;
import jxl.Sheet;
import jxl.Workbook;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;


public class ExcelReader {
    private static final String ENDFLAG = "EOF";

    public ExcelReader() {
    }

    public static <T> Collection<T> readExcel(Class<T> clazz, File sourceFile, int beginRow, DataType... dataTypes) throws Exception {
        new ArrayList();
        InputStream is = new FileInputStream(sourceFile);
        Workbook book = Workbook.getWorkbook(is);
        Collection<T> list = readWorkBook(clazz, book, beginRow, dataTypes);
        is.close();
        return list;
    }

    public static <T> Collection<T> readExcel(Class<T> clazz, String sourcePath, int beginRow, DataType... dataTypes) throws Exception {
        return readExcel(clazz, IOUtil.getFile(sourcePath), beginRow, dataTypes);
    }

    private static <T> Collection<T> readWorkBook(Class<T> clazz, Workbook book, int beginRow, DataType... dataTypes) throws Exception {
        Collection<T> list = new ArrayList();
        Sheet[] var5 = book.getSheets();
        int var6 = var5.length;

        for(int var7 = 0; var7 < var6; ++var7) {
            Sheet sheet = var5[var7];
            list.addAll(readShell(clazz, sheet, beginRow, dataTypes));
        }

        return list;
    }

    private static <T> Collection<T> readShell(Class<T> clazz, Sheet sheet, int beginRow, DataType... dataTypes) throws Exception {
        Collection<T> list = new ArrayList();

        for(int i = beginRow; i < sheet.getRows(); ++i) {
            T obj = clazz.newInstance();
            Cell[] cells = sheet.getRow(i);
            if(cells.length > 0) {
                Object end = cells[0].getContents();
                if(end instanceof String) {
                    String strEnd = (String)end;
                    if("EOF".equals(strEnd.trim())) {
                        break;
                    }
                }
            }

            DataType[] var16 = dataTypes;
            int var17 = dataTypes.length;

            for(int var10 = 0; var10 < var17; ++var10) {
                DataType dataType = var16[var10];
                if(dataType != null) {
                    Object data = null;
                    if(dataType.getColumn() < cells.length) {
                        Cell cell = cells[dataType.getColumn()];
                        if(cell instanceof DateCell) {
                            Date date = ((DateCell)cell).getDate();
                            data = date;
                        } else {
                            data = cell.getContents();
                        }
                    }

                    if(data != null && !data.equals("")) {
                        try {
                            BeanUtils.setProperty(obj, dataType.getFiledName(), data);
                        } catch (Exception var15) {
                            throw new Exception(data + "不能转化为目标的属性", var15);
                        }
                    }
                }
            }

            list.add(obj);
        }

        return list;
    }

    public static final void main(String[] args) {
        String[] patterns = new String[]{"yyyy-M-d", "yyyy/M/d", "yyyyMd", "yyyyMMdd", "M-d-yyyy", "M/d/yyyy", ""};
        DateTimeConverter converter = new DateConverter();
        converter.setPatterns(patterns);
        converter.setUseLocaleFormat(true);
        ConvertUtils.register(converter, Date.class);
        Date date = (Date)converter.convert(Date.class, "2011/5/12");
        System.out.println(date);
    }
}

