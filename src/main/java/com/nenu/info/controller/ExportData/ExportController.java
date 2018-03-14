package com.nenu.info.controller.ExportData;

import com.nenu.info.common.dto.category.*;
import com.nenu.info.common.utils.ExcelUtil;
import com.nenu.info.common.utils.URLConstants;
import com.nenu.info.common.utils.WebConstants;
import com.nenu.info.service.category.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import static com.nenu.info.common.utils.WebConstants.pageSize;

/**
 * 职责
 *
 * @author zhaiaxin
 * @time: 2018/3/6 15:34.
 */
@Controller
@RequestMapping(value = URLConstants.EXPORT_URL)
public class ExportController {


    @Autowired
    private ACMService acmService;

    @Autowired
    private ScientificProjectService scientificProjectService;

    @Autowired
    private MathModelPrizeService mathModelPrizeService;

    @Autowired
    private ChallengeCupService challengeCupService;

    @Autowired
    private InternetPlusService internetPlusService;

    @Autowired
    private ThesisService thesisService;

    @Autowired
    private PatentService patentService;

    @RequestMapping(value = "acm",method = RequestMethod.GET)
    public String exportACM(// @RequestParam(value = "page", required = false, defaultValue = "-500") Integer curPage,
                          @RequestParam(value = "matchLevel", required = false, defaultValue = "-1") Integer matchLevel,
                          @RequestParam(value = "matchName", required = false, defaultValue = "") String matchName,
                          @RequestParam(value = "beginTime", required = false) Date beginTime,
                          @RequestParam(value = "endTime", required = false) Date endTime,
                          @RequestParam(value = "prizeLevel", required = false, defaultValue = "-1") Integer prizeLevel,
                          @RequestParam(value = "major", required = false, defaultValue = "-1") Integer major,
                          @RequestParam(value = "stuName", required = false, defaultValue = "") String stuName,
                          @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                          @RequestParam(value = "hostUnit", required = false, defaultValue = "") String hostUnit,
                          Model model,
                          HttpServletRequest request, HttpServletResponse response,
                          @RequestParam(value = "message", required = false, defaultValue = "") String message){

        try{

            Map<String, Object> params = acmService.getParams(matchLevel, matchName, beginTime, endTime, prizeLevel, major, stuName, teacherName, hostUnit);

            List<ACMPrizeDto> acmPrizeDtoList = acmService.listByConditions(params);

            String filename = "acm.xls";//设置下载时Excel的名称

            filename = ExcelUtil.encodeFilename(filename, request);//处理中文文件名

            if(acmPrizeDtoList.size() != 0){
                ExcelUtil.writeExcel(acmPrizeDtoList, "recruit", filename, response);//调用Excel工具类生成Excel
            } else {
                model.addAttribute("message","导出的数据为空");
            }

            model.addAttribute("acmPrizeDtoList", acmPrizeDtoList);
            model.addAttribute("message",message);

        } catch (Exception e){
            e.printStackTrace();
        }
        return "ACM/ACM";
    }


    @RequestMapping(value = "scientificProject")
    public String ExportScientificProject(//@RequestParam(value = "curPage", required = false, defaultValue = "-500") Integer curPage,
                                          @RequestParam(value = "projectName", required = false, defaultValue = "") String projectName,
                                          @RequestParam(value = "projectType", required = false, defaultValue = "-1") Integer projectType,
                                          @RequestParam(value = "setYear", required = false, defaultValue = "") String setYear,
                                          @RequestParam(value = "majorCode", required = false, defaultValue = "-1") Integer majorCode,
                                          @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                                          @RequestParam(value = "stuName", required = false, defaultValue = "") String stuName,
                                          @RequestParam(value = "stuNumber", required = false, defaultValue = "") String stuNumber,
                                          Model model,
                                          HttpServletRequest request , HttpServletResponse response) {

        Map<String, Object> params = scientificProjectService.getParams(projectName, projectType, setYear, majorCode, teacherName, stuName, stuNumber);


        List<ScientificProjectDto> scientificProjectDtoList = null;

        scientificProjectDtoList = scientificProjectService.listScientificProjectByConditions(params);

        String filename = "scientificProject.xls";//设置下载时Excel的名称

        filename = ExcelUtil.encodeFilename(filename, request);//处理中文文件名

        if(scientificProjectDtoList.size() != 0){
            ExcelUtil.writeExcel(scientificProjectDtoList, "recruit", filename, response);//调用Excel工具类生成Excel
        } else {
            model.addAttribute("message","导出的数据为空");
        }



        model.addAttribute("scientificProjectDtoList", scientificProjectDtoList);

        return "scientific_project/scientific_project";
    }

    @RequestMapping(value = "math")
    public String ExportMath(@RequestParam(value = "curPage", required = false, defaultValue = "-500") Integer curPage,
                             @RequestParam(value = "matchLevel", required = false, defaultValue = "-1") Integer matchLevel,
                             @RequestParam(value = "matchName", required = false, defaultValue = "") String matchName,
                             @RequestParam(value = "beginTime", required = false) Date beginTime,
                             @RequestParam(value = "endTime", required = false) Date endTime,
                             @RequestParam(value = "prizeLevel", required = false, defaultValue = "-1") Integer prizeLevel,
                             @RequestParam(value = "major", required = false, defaultValue = "-1") Integer major,
                             @RequestParam(value = "stuName", required = false, defaultValue = "") String stuName,
                             @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                             @RequestParam(value = "hostUnit", required = false, defaultValue = "") String hostUnit,
                             Model model, HttpServletRequest request ,HttpServletResponse response){

        Map<String, Object> params = mathModelPrizeService.getParams(matchLevel, matchName, beginTime, endTime, prizeLevel, major, stuName, teacherName, hostUnit);

        List<MathModelPrizeDto> mathModelPrizeDtoList = mathModelPrizeService.listByConditions(params);


        String filename = "math.xls";//设置下载时Excel的名称

        filename = ExcelUtil.encodeFilename(filename, request);//处理中文文件名

        if(mathModelPrizeDtoList.size() != 0){
            ExcelUtil.writeExcel(mathModelPrizeDtoList, "recruit", filename, response);//调用Excel工具类生成Excel
        } else {
            model.addAttribute("message","导出的数据为空");
        }


        model.addAttribute("mathModelPrizeDtoList", mathModelPrizeDtoList);
        return "math_model/math_model";

    }

    @RequestMapping(value = "challengeCup")
    public String ExportChallengeCup(@RequestParam(value = "curPage", required = false, defaultValue = "-500") Integer curPage,
                                     @RequestParam(value = "matchName", required = false, defaultValue = "") String matchName,
                                     @RequestParam(value = "matchLevel", required = false, defaultValue = "-1") Integer matchLevel,
                                     @RequestParam(value = "prizeLevel", required = false, defaultValue = "-1") Integer prizeLevel,
                                     @RequestParam(value = "startTime", required = false) Date startTime,
                                     @RequestParam(value = "endTime", required = false) Date endTime,
                                     @RequestParam(value = "teamName", required = false, defaultValue = "") String teamName,
                                     @RequestParam(value = "stuName", required = false, defaultValue = "") String stuName,
                                     @RequestParam(value = "majorCode", required = false, defaultValue = "") Integer majorCode,
                                     @RequestParam(value = "projectName", required = false, defaultValue = "") String projectName,
                                     @RequestParam(value = "hostUnit", required = false, defaultValue = "") String hostUnit,
                                     @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                                     Model model,
                                     HttpServletRequest request , HttpServletResponse response){

        List<ChallengeCupDto> challengeCupDtoList = null;

        Map<String, Object> params = null;
        try {
            params = challengeCupService.getParams(matchName, matchLevel, prizeLevel, startTime, endTime, teamName, stuName,
                    majorCode, projectName, hostUnit, teacherName);
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            challengeCupDtoList = challengeCupService.listByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String filename = "challengeCup.xls";//设置下载时Excel的名称

        filename = ExcelUtil.encodeFilename(filename, request);//处理中文文件名

        if(challengeCupDtoList.size() != 0){
            ExcelUtil.writeExcel(challengeCupDtoList, "recruit", filename, response);//调用Excel工具类生成Excel
        } else {
            model.addAttribute("message","导出的数据为空");
        }

        model.addAttribute("challengeCupDtoList", challengeCupDtoList);


        return "challenge_cup/challenge_cup";
    }

    @RequestMapping(value = "internetPlus")
    public String ExportInternetPlus(@RequestParam(value = "curPage", required = false, defaultValue = "-500") Integer curPage,
                                     @RequestParam(value = "matchName", required = false, defaultValue = "") String matchName,
                                     @RequestParam(value = "matchLevel", required = false, defaultValue = "-1") Integer matchLevel,
                                     @RequestParam(value = "prizeLevel", required = false, defaultValue = "-1") Integer prizeLevel,
                                     @RequestParam(value = "startTime", required = false) Date startTime,
                                     @RequestParam(value = "endTime", required = false) Date endTime,
                                     @RequestParam(value = "teamName", required = false, defaultValue = "") String teamName,
                                     @RequestParam(value = "stuName", required = false, defaultValue = "") String stuName,
                                     @RequestParam(value = "majorCode", required = false, defaultValue = "") Integer majorCode,
                                     @RequestParam(value = "projectName", required = false, defaultValue = "") String projectName,
                                     @RequestParam(value = "hostUnit", required = false, defaultValue = "") String hostUnit,
                                     @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                                     HttpServletRequest request,HttpServletResponse response,
                                     Model model){

        Map<String, Object> params = null;
        try {
            params = internetPlusService.getParams(matchName, matchLevel, prizeLevel, startTime, endTime, teamName, stuName, majorCode, projectName, hostUnit, teacherName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<InternetPlusDto> internetPlusDtoList = null;

        try {
            internetPlusDtoList = internetPlusService.listByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String filename = "internetPlus.xls";//设置下载时Excel的名称

        filename = ExcelUtil.encodeFilename(filename, request);//处理中文文件名

        if(internetPlusDtoList.size() != 0){
            ExcelUtil.writeExcel(internetPlusDtoList, "recruit", filename, response);//调用Excel工具类生成Excel
        } else {
            model.addAttribute("message","导出的数据为空");
        }

        return "internet_plus/internet_plus";


    }

    @RequestMapping(value = "thesis")
    public String ExportThesis(@RequestParam(value = "journalLevel", required = false, defaultValue = "-1") Integer journalLevel,
                               @RequestParam(value = "journalName", required = false, defaultValue = "") String journalName,
                               @RequestParam(value = "thesisTitle", required = false, defaultValue = "") String thesisTitle,
                               @RequestParam(value = "authorName", required = false, defaultValue = "") String authorName,
                               @RequestParam(value = "authorStuNumber", required = false, defaultValue = "") String authorStuNumber,
                               @RequestParam(value = "authorMajor", required = false, defaultValue = "-1") Integer authorMajor,
                               @RequestParam(value = "authorGrade", required = false, defaultValue = "") String authorGrade,
                               @RequestParam(value = "beginTime", required = false) Date beginTime,
                               @RequestParam(value = "endTime", required = false) Date endTime,
                               @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                               HttpServletRequest request, HttpServletResponse response,
                               Model model){
        Map<String, Object> params = null;
        try {
            params = thesisService.getParams(journalLevel, journalName, thesisTitle, authorName, authorStuNumber, authorMajor, authorGrade,
                    beginTime, endTime, teacherName);
        } catch (Exception e) {
            e.printStackTrace();
        }

        List<ThesisDto> thesisDtoList = null;
        try {
            thesisDtoList = thesisService.listByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String filename = "thesis.xls";//设置下载时Excel的名称

        filename = ExcelUtil.encodeFilename(filename, request);//处理中文文件名

        if(thesisDtoList.size() != 0){
            ExcelUtil.writeExcel(thesisDtoList, "recruit", filename, response);//调用Excel工具类生成Excel
        } else {
            model.addAttribute("message","导出的数据为空");
        }

        model.addAttribute("thesisDtoList", thesisDtoList);

        return "thesis/thesis";

    }


    @RequestMapping(value = "patent")
    public String ExportPatent(@RequestParam(value = "curPage", required = false, defaultValue = "-500") Integer curPage,
                               @RequestParam(value = "patentType", required = false, defaultValue = "-1") Integer patentType,
                               @RequestParam(value = "patentName", required = false, defaultValue = "") String patentName,
                               @RequestParam(value = "beginTime", required = false) Date beginTime,
                               @RequestParam(value = "endTime", required = false) Date endTime,
                               @RequestParam(value = "majorCode", required = false, defaultValue = "-1") Integer majorCode,
                               @RequestParam(value = "grade", required = false, defaultValue = "") String grade,
                               @RequestParam(value = "stuNumber", required = false, defaultValue = "") String stuNumber,
                               @RequestParam(value = "stuName", required = false, defaultValue = "") String stuName,
                               @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                               Model model,HttpServletResponse response,
                               HttpServletRequest request){

        Map<String, Object> params = null;
        try {
            params = patentService.getParams(patentType, patentName, beginTime, endTime, majorCode, grade, stuNumber, stuName, teacherName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<PatentDto> patentDtoList = null;

        try {
            patentDtoList = patentService.listByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String filename = "patent.xls";//设置下载时Excel的名称

        filename = ExcelUtil.encodeFilename(filename, request);//处理中文文件名

        if(patentDtoList.size() != 0){
            ExcelUtil.writeExcel(patentDtoList, "recruit", filename, response);//调用Excel工具类生成Excel
        } else {
            model.addAttribute("message","导出的数据为空");
        }

        model.addAttribute("patentDtoList", patentDtoList);

        return "patent/patent";

    }
}
