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

        exportFieldDesc.put("matchLevel","比赛等级");
        exportFieldDesc.put("matchName", "比赛名称");
        exportFieldDesc.put("hostUnit","主办单位");
        exportFieldDesc.put("prizeTime","获奖时间(默认格式)");

        exportFieldDesc.put("prizeTimeStr","获奖时间");
        exportFieldDesc.put("prizeLevel","获奖等级");
        exportFieldDesc.put("teamName", "团队名称");
        exportFieldDesc.put("teammateName1","参赛人员1姓名");
        exportFieldDesc.put("teammateStuNumber1","参赛人员1学号");

        exportFieldDesc.put("teammateName2","参赛人员2姓名");
        exportFieldDesc.put("teammateStuNumber2", "参赛人员2学号");
        exportFieldDesc.put("teammateName3","参赛人员3姓名");
        exportFieldDesc.put("teammateStuNumber3","参赛人员3学号");

        exportFieldDesc.put("teammateMajor1","参赛人员1专业");
        exportFieldDesc.put("teammateName2","参赛人员2姓名");
        exportFieldDesc.put("teammateStuNumber2", "参赛人员2学号");
        exportFieldDesc.put("teammateMajor2","参赛人员2专业");
        exportFieldDesc.put("teammateName3","参赛人员3姓名");
        exportFieldDesc.put("teammateStuNumber3","参赛人员3学号");
        exportFieldDesc.put("teammateMajor3","参赛人员3专业");

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

        //挑战杯和互联网加
        exportFieldDesc.put("stuName1","项目成员1姓名");
        exportFieldDesc.put("stuNumber1", "项目成员1学号");
        exportFieldDesc.put("stuName2","项目成员2姓名");
        exportFieldDesc.put("stuNumber2", "项目成员2学号");
        exportFieldDesc.put("stuName2","项目成员2姓名");
        exportFieldDesc.put("stuNumber2", "项目成员2学号");
        exportFieldDesc.put("stuName3","项目成员3姓名");
        exportFieldDesc.put("stuNumber3", "项目成员3学号");
        exportFieldDesc.put("stuName4","项目成员4姓名");
        exportFieldDesc.put("stuNumber4", "项目成员4学号");
        exportFieldDesc.put("stuName5","项目成员5姓名");
        exportFieldDesc.put("stuNumber5", "项目成员5学号");
        exportFieldDesc.put("stuName6","项目成员6姓名");
        exportFieldDesc.put("stuNumber6", "项目成员6学号");
        exportFieldDesc.put("stuName7","项目成员7姓名");
        exportFieldDesc.put("stuNumber7", "项目成员7学号");
        exportFieldDesc.put("stuName8","项目成员8姓名");
        exportFieldDesc.put("stuNumber8", "项目成员8学号");

        //专利

        exportFieldDesc.put("patentType","专利类别");
        exportFieldDesc.put("patentName","专利名称");
        exportFieldDesc.put("applyTime","申请成功时间（默认）");
        exportFieldDesc.put("applyTimeStr","申请成功时间");
        exportFieldDesc.put("applierName1","申请人1姓名");
        exportFieldDesc.put("applierMajor1","申请人1专业");
        exportFieldDesc.put("applierStuNumber1","申请人1学号");
        exportFieldDesc.put("applierName2","申请人2姓名");
        exportFieldDesc.put("applierMajor2","申请人2专业");
        exportFieldDesc.put("applierStuNumber2","申请人2学号");
        exportFieldDesc.put("applierName3","申请人3姓名");
        exportFieldDesc.put("applierMajor3","申请人3专业");
        exportFieldDesc.put("applierStuNumber3","申请人3学号");
        exportFieldDesc.put("applierName4","申请人4姓名");
        exportFieldDesc.put("applierMajor4","申请人4专业");
        exportFieldDesc.put("applierStuNumber4","申请人4学号");
        exportFieldDesc.put("applierName5","申请人5姓名");
        exportFieldDesc.put("applierMajor5","申请人5专业");
        exportFieldDesc.put("applierStuNumber5","申请人5学号");
        exportFieldDesc.put("introduce","专利介绍");

        //论文
        exportFieldDesc.put("journalLevel","期刊级别");
        exportFieldDesc.put("journalName","发表刊物");
        exportFieldDesc.put("thesisTitle","论文题目");
        exportFieldDesc.put("publishTime","发表时间（默认）");
        exportFieldDesc.put("publishTimeStr","发表时间");
        exportFieldDesc.put("authorName1","作者1姓名");
        exportFieldDesc.put("authorLevel1","作者1排名");
        exportFieldDesc.put("authorStuNumber1","作者1学号");
        exportFieldDesc.put("authorMajor1","作者1专业");

        exportFieldDesc.put("authorName2","作者2姓名");
        exportFieldDesc.put("authorLevel2","作者2排名");
        exportFieldDesc.put("authorStuNumber2","作者2学号");
        exportFieldDesc.put("authorMajor2","作者2专业");

        exportFieldDesc.put("authorName3","作者3姓名");
        exportFieldDesc.put("authorLevel3","作者3排名");
        exportFieldDesc.put("authorStuNumber3","作者3学号");
        exportFieldDesc.put("authorMajor3","作者3专业");

        exportFieldDesc.put("authorName4","作者4姓名");
        exportFieldDesc.put("authorLevel4","作者4排名");
        exportFieldDesc.put("authorStuNumber4","作者4学号");
        exportFieldDesc.put("authorMajor4","作者4专业");

        exportFieldDesc.put("authorName5","作者5姓名");
        exportFieldDesc.put("authorLevel5","作者5排名");
        exportFieldDesc.put("authorStuNumber5","作者5学号");
        exportFieldDesc.put("authorMajor5","作者5专业");

        exportFieldDesc.put("thesisAbstract","论文摘要");


        
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
        DataType[] dataTypes = new DataType[fields.length];
        DataType[] heads = new DataType[fields.length];
        for (int j = 0; j < fields.length; j++) {
            if(!fields[j].isAccessible()){
                fields[j].setAccessible(true);
            }
            DataType dataType = new DataType(fields[j].getName(),j);
            dataTypes[j] = dataType;
            heads[j] = new DataType(exportFieldDesc.get(fields[j].getName()),j);
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
