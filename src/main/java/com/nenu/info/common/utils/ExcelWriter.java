package com.nenu.info.common.utils;

import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import com.nenu.info.common.entities.common.DataType;
import com.nenu.info.common.enums.ExcelTemplateEnum;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import org.apache.commons.beanutils.BeanUtils;

public class ExcelWriter {
    public ExcelWriter() {
    }

    public static <T> void writeExcelByTemplate(Collection<T> collection, int startRow, OutputStream os, ExcelTemplateEnum excelTemplateEnum, DataType[] dataTypes) throws Exception {
        InputStream tplStream = IOUtil.getFileAsStream(excelTemplateEnum.getFilePath());
        Workbook tplWorkBook = Workbook.getWorkbook(tplStream);
        WritableWorkbook outBook = Workbook.createWorkbook(os, tplWorkBook);
        WritableSheet sheet = outBook.getSheet(0);
        writeSheet(collection, sheet, dataTypes, startRow);
        outBook.write();
        outBook.close();
        tplWorkBook.close();
        tplStream.close();
        os.close();
    }

    public static <T> void writeExcel(Collection<T> collection, String sheetName, OutputStream os, DataType[] headData, DataType... dataTypes) throws Exception {
        WritableWorkbook workbook = Workbook.createWorkbook(os);
        createSheetAndWrite(collection, sheetName, headData, workbook, (String)null, dataTypes);
        workbook.write();
        workbook.close();
        os.close();
    }

    public static <T> void writeExcel(Collection<T> collection, String sheetName, OutputStream os, DataType[] headData, String footer, DataType... dataTypes) throws Exception {
        WritableWorkbook workbook = Workbook.createWorkbook(os);
        createSheetAndWrite(collection, sheetName, headData, workbook, footer, dataTypes);
        workbook.write();
        workbook.close();
        os.close();
    }

    private static <T> void createSheetAndWrite(Collection<T> collection, String sheetName, DataType[] headData, WritableWorkbook workbook, String footer, DataType... dataTypes) throws Exception {
        WritableSheet sheet = workbook.createSheet(sheetName, 0);
        writeSheet(collection, headData, sheet, footer, dataTypes);
    }

    private static <T> void writeSheet(Collection<T> collection, DataType[] headData, WritableSheet sheet, String footer, DataType... dataTypes) throws Exception {
        DataType[] var6 = headData;
        int var7 = headData.length;

        Label label;
        for(int var8 = 0; var8 < var7; ++var8) {
            DataType dataType = var6[var8];
            label = new Label(dataType.getColumn(), 0, dataType.getFiledName());
            sheet.addCell(label);
        }

        int j = 0;
        if(collection != null) {
            for(ArrayList collection1 = new ArrayList(collection); j < collection1.size(); ++j) {
                T t = (T)collection1.get(j);

                for(int i = 0; i < dataTypes.length; ++i) {
                    label = new Label(dataTypes[i].getColumn(), j + 1, BeanUtils.getProperty(t, dataTypes[i].getFiledName()));
                    sheet.addCell(label);
                }
            }
        }

        if(sheet != null && !"".equals(footer)) {
            label = new Label(0, j + 1, footer);
            sheet.addCell(label);
        }

    }

    private static <T> void writeSheet(Collection<T> collection, WritableSheet sheet, DataType[] dataTypes, int startRow) throws Exception {
        if(collection != null) {
            List<T> list = new ArrayList(collection);
            int listSize = list.size();
            int dataTypesSize = dataTypes.length;

            for(int j = 0; j < listSize; ++j) {
                T t = list.get(j);

                for(int i = 0; i < dataTypesSize; ++i) {
                    Label label = new Label(dataTypes[i].getColumn(), startRow + j, BeanUtils.getProperty(t, dataTypes[i].getFiledName()));
                    sheet.addCell(label);
                }
            }
        }

    }
}

