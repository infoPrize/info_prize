package com.nenu.info.common.utils;


import com.nenu.info.common.entities.common.DataType;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by root on 14-9-26.
 */
public final class ExcelUtil {
    public static Map<String,String> exportFieldDesc = new HashMap<>();
    static{
        //ACM和数学建模信息
        exportFieldDesc.put("matchLevel","比赛类别");
        exportFieldDesc.put("matchName", "比赛名称");
        exportFieldDesc.put("hostUnit","主办单位");
        exportFieldDesc.put("prizeTimeStr","获奖时间");
        exportFieldDesc.put("prizeLevel","获奖等级");
        exportFieldDesc.put("teamName", "团队名称");
        exportFieldDesc.put("teammateName1","参赛人员1姓名");
        exportFieldDesc.put("teammateStuNumber1","参赛人员1学号");
        exportFieldDesc.put("teammateName2","参赛人员2姓名");
        exportFieldDesc.put("teammateStuNumber2", "参赛人员2学号");
        exportFieldDesc.put("teammateName3","参赛人员3姓名");
        exportFieldDesc.put("teammateStuNumber3","参赛人员3学号");
        exportFieldDesc.put("teacherName","指导老师");

        //国创科研
        exportFieldDesc.put("projectType","项目类别");
        exportFieldDesc.put("projectName", "项目名称");
        exportFieldDesc.put("setYear","立项年份");
        exportFieldDesc.put("projectManName","项目负责人");
        exportFieldDesc.put("projectManSex","负责人性别");
        exportFieldDesc.put("projectManStuNumber", "负责人学号");
        exportFieldDesc.put("projectManPhone","负责人联系方式");
        exportFieldDesc.put("projectManMajor","负责人专业");
        exportFieldDesc.put("projectMemberName1","项目成员1姓名");
        exportFieldDesc.put("projectMemberStuNumber1", "项目成员1学号");
        exportFieldDesc.put("projectMemberName2","项目成员2姓名");
        exportFieldDesc.put("projectMemberStuNumber2","项目成员2学号");
        exportFieldDesc.put("projectMemberName3","项目成员3姓名");
        exportFieldDesc.put("projectMemberStuNumber3","项目成员3学号");
        exportFieldDesc.put("projectMemberName4","项目成员4姓名");
        exportFieldDesc.put("projectMemberStuNumber4","项目成员4学号");
        exportFieldDesc.put("fundsLimit","批复经费");
        exportFieldDesc.put("projectIntroduce","项目介绍");



    }



    /**
     * 调用core导出Excel
     *
     * @param list   要导出的数据集合
     * @param sheetName    Excel的sheet名称
     * @param path         导出Excel名称
     * SSException
     */
    public static void writeExcel(List list, String sheetName, String path, HttpServletResponse response){
        Field[] fields = list.get(0).getClass().getDeclaredFields();
        DataType[] dataTypes = new DataType[fields.length-1];
        DataType[] heads = new DataType[fields.length-1];
        for (int j = 1; j < fields.length; j++) {
            if(!fields[j].isAccessible()){
                fields[j].setAccessible(true);
            }
            DataType dataType = new DataType(fields[j].getName(),j-1);
            dataTypes[j-1] = dataType;
            heads[j-1] = new DataType(exportFieldDesc.get(fields[j].getName()),j-1);
        }
        response.setContentType("application/vnd.ms-excel");

        response.setHeader("Content-disposition", "attachment;filename=" + path);

        OutputStream out = null;
        try {
            out = response.getOutputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            //out = new FileOutputStream(path);
            ExcelWriter.writeExcel(list,sheetName,out,heads,dataTypes);
         } catch (FileNotFoundException e) {
            e.printStackTrace();
         } catch (Exception e) {
            e.printStackTrace();
         }
    }

    public static String encodeFilename(String filename, HttpServletRequest request) {
        String agent = request.getHeader("USER-AGENT");
        try {
            if ((agent != null) && (-1 != agent.indexOf("MSIE"))) {
                String newFileName = URLEncoder.encode(filename, "UTF-8");
                newFileName = StringUtils.replace(newFileName, "+", "%20");
                if (newFileName.length() > 150) {
                    newFileName = new String(filename.getBytes("GB2312"), "ISO8859-1");
                    newFileName = StringUtils.replace(newFileName, " ", "%20");
                }
                return newFileName;
            }
            if ((agent != null) && (-1 != agent.indexOf("Mozilla")))
                return MimeUtility.encodeText(filename, "UTF-8", "B");

            return filename;
        } catch (Exception ex) {
            return filename;
        }
    }



}
