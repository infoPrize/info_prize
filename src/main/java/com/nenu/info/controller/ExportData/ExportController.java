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
    public String exportACM( @RequestParam(value = "page", required = false, defaultValue = "-500") Integer curPage,
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

            Integer count = acmService.countByCondition(params);

            Integer pageSize = WebConstants.pageSize;

            Integer totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;

            params = acmService.getParams(matchLevel, matchName, beginTime, endTime, prizeLevel, major, stuName, teacherName, hostUnit, curPage, totalPage);

            HttpSession session = request.getSession();
            session.setAttribute("ACMParams", params);
            session.setAttribute("ACMTotalPage", totalPage);

            List<ACMPrizeDto> acmPrizeDtoList = acmService.listByConditions(params);

            if(acmPrizeDtoList != null) {
                //对日期进行处理
                for (ACMPrizeDto acmPrizeDto : acmPrizeDtoList) {
                    Date dateStr = acmPrizeDto.getPrizeTime();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    String prizeTimeStr = sdf.format(dateStr);
                    acmPrizeDto.setPrizeTimeStr(prizeTimeStr);
                }
            }

            String filename = "acm.xls";//设置下载时Excel的名称

            filename = ExcelUtil.encodeFilename(filename, request);//处理中文文件名

            ExcelUtil.writeExcel(acmPrizeDtoList, "recruit", filename, response);//调用Excel工具类生成Excel

            model.addAttribute("acmPrizeDtoList", acmPrizeDtoList);
            model.addAttribute("totalPage", totalPage);
            model.addAttribute("curPage", params.get("curPage"));
            model.addAttribute("message",message);

        } catch (Exception e){
            e.printStackTrace();
        }
        return "ACM/ACM";
    }


    @RequestMapping(value = "scientificProject")
    public String ExportScientificProject(@RequestParam(value = "curPage", required = false, defaultValue = "-500") Integer curPage,
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

        int count = scientificProjectService.countByCondition(params);

        int pageSize = WebConstants.pageSize;

        int totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;

        params = scientificProjectService.getParams(projectName, projectType, setYear, majorCode, teacherName, stuName, stuNumber, curPage, totalPage);

        HttpSession session = request.getSession();
        session.setAttribute("scientificProjectParams", params);

        List<ScientificProjectDto> scientificProjectDtoList = null;

        scientificProjectDtoList = scientificProjectService.listScientificProjectByConditions(params);

        String filename = "scientificProject.xls";//设置下载时Excel的名称

        filename = ExcelUtil.encodeFilename(filename, request);//处理中文文件名

        ExcelUtil.writeExcel(scientificProjectDtoList, "recruit", filename, response);//调用Excel工具类生成Excel

        model.addAttribute("scientificProjectDtoList", scientificProjectDtoList);
        model.addAttribute("curPage", params.get("curPage"));
        model.addAttribute("totalPage", params.get("totalPage"));

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
        int count = 0;
        count = mathModelPrizeService.countByConditions(params);

        int pageSize = WebConstants.pageSize;
        int totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;

        params = mathModelPrizeService.getParams(matchLevel, matchName, beginTime, endTime, prizeLevel, major, stuName, teacherName, hostUnit, curPage, totalPage);

        HttpSession session = request.getSession();
        session.setAttribute("mathModelParams", params);

        List<MathModelPrizeDto> mathModelPrizeDtoList = mathModelPrizeService.listByConditions(params);


        String filename = "math.xls";//设置下载时Excel的名称

        filename = ExcelUtil.encodeFilename(filename, request);//处理中文文件名

        ExcelUtil.writeExcel(mathModelPrizeDtoList, "recruit", filename, response);//调用Excel工具类生成Excel

        model.addAttribute("mathModelPrizeDtoList", mathModelPrizeDtoList);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("curPage", curPage);
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
                                     @RequestParam(value = "message", required = false, defaultValue = "") String message,
                                     Model model,
                                     HttpServletRequest request , HttpServletResponse response){

        List<ChallengeCupDto> challengeCupDtoList = null;
//        JSONArray jsonArray = new JSONArray();

        Map<String, Object> params = null;
        try {
            params = challengeCupService.getParams(matchName, matchLevel, prizeLevel, startTime, endTime, teamName, stuName,
                    majorCode, projectName, hostUnit, teacherName);
        } catch (Exception e) {
            e.printStackTrace();
        }

        int count = 0;

        try {
            count = challengeCupService.countByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        int pageSize = WebConstants.pageSize;
        int totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;

        try {
            params = challengeCupService.getParams(params, curPage, totalPage);
        } catch (Exception e) {
            e.printStackTrace();
        }

        HttpSession session = request.getSession();
        session.setAttribute("challengeCupParams", params);

        try {
            challengeCupDtoList = challengeCupService.listByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if(challengeCupDtoList != null) {
            for (ChallengeCupDto challengCupDto : challengeCupDtoList) {
                Date prizeTime = challengCupDto.getPrizeTime();
                String prizeTimeStr = sdf.format(prizeTime);
                challengCupDto.setPrizeTimeStr(prizeTimeStr);
            }
        }

        String filename = "challengeCup.xls";//设置下载时Excel的名称

        filename = ExcelUtil.encodeFilename(filename, request);//处理中文文件名

        ExcelUtil.writeExcel(challengeCupDtoList, "recruit", filename, response);//调用Excel工具类生成Excel

        model.addAttribute("challengeCupDtoList", challengeCupDtoList);
        model.addAttribute("curPage", curPage);
        model.addAttribute("totalPage", totalPage);

        model.addAttribute("message",message);

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
                                     @RequestParam(value = "message", required = false, defaultValue = "") String message,
                                     HttpServletRequest request,HttpServletResponse response,
                                     Model model){

        Map<String, Object> params = null;
        try {
            params = internetPlusService.getParams(matchName, matchLevel, prizeLevel, startTime, endTime, teamName, stuName, majorCode, projectName, hostUnit, teacherName);
        } catch (Exception e) {
            e.printStackTrace();
        }

        int count = 0;
        try {
            count = internetPlusService.countByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        int totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
        try {
            params = internetPlusService.getParams(params, curPage, totalPage);
        } catch (Exception e) {
            e.printStackTrace();
        }

        HttpSession session = request.getSession();
        session.setAttribute("internetPlusParams", params);

        List<InternetPlusDto> internetPlusDtoList = null;
//        JSONArray jsonArray = new JSONArray();

        try {
            internetPlusDtoList = internetPlusService.listByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //对日期进行处理
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if(internetPlusDtoList != null) {
            for (InternetPlusDto internetPlusDto : internetPlusDtoList) {
                Date prizeTime = internetPlusDto.getPrizeTime();
                String prizeTimeStr = sdf.format(prizeTime);
                internetPlusDto.setPrizeTimeStr(prizeTimeStr);
            }
        }

        String filename = "internetPlus.xls";//设置下载时Excel的名称

        filename = ExcelUtil.encodeFilename(filename, request);//处理中文文件名

        ExcelUtil.writeExcel(internetPlusDtoList, "recruit", filename, response);//调用Excel工具类生成Excel

        return "internet_plus/internet_plus";


    }

    @RequestMapping(value = "thesis")
    public String ExportThesis(@RequestParam(value = "curPage", required = false, defaultValue = "-500") Integer curPage,
                               @RequestParam(value = "journalLevel", required = false, defaultValue = "-1") Integer journalLevel,
                               @RequestParam(value = "journalName", required = false, defaultValue = "") String journalName,
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
            params = thesisService.getParams(journalLevel, journalName, authorName, authorStuNumber, authorMajor, authorGrade,
                    beginTime, endTime, teacherName);
        } catch (Exception e) {
            e.printStackTrace();
        }

        int count = 0;
        try {
            count = thesisService.countByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        int totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
        try {
            params = thesisService.getParams(params, curPage, totalPage);
        } catch (Exception e) {
            e.printStackTrace();
        }

        HttpSession session = request.getSession();
        session.setAttribute("thesisParams", params);

        List<ThesisDto> thesisDtoList = null;
        try {
            thesisDtoList = thesisService.listByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String filename = "thesis.xls";//设置下载时Excel的名称

        filename = ExcelUtil.encodeFilename(filename, request);//处理中文文件名

        ExcelUtil.writeExcel(thesisDtoList, "recruit", filename, response);//调用Excel工具类生成Excel

        model.addAttribute("thesisDtoList", thesisDtoList);
        model.addAttribute("curPage", params.get("curPage"));
        model.addAttribute("totalPage", params.get("totalPage"));

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

        int count = 0;
        try {
            count = patentService.countByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        int totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
        try {
            params = patentService.getParams(params, curPage, totalPage);
        } catch (Exception e) {
            e.printStackTrace();
        }

        HttpSession session = request.getSession();
        session.setAttribute("patentParams", params);

        List<PatentDto> patentDtoList = null;

        try {
            patentDtoList = patentService.listByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String filename = "patent.xls";//设置下载时Excel的名称

        filename = ExcelUtil.encodeFilename(filename, request);//处理中文文件名

        ExcelUtil.writeExcel(patentDtoList, "recruit", filename, response);//调用Excel工具类生成Excel

        model.addAttribute("patentDtoList", patentDtoList);
        model.addAttribute("curPage", curPage);
        model.addAttribute("totalPage", totalPage);

        return "patent/patent";

    }
}
