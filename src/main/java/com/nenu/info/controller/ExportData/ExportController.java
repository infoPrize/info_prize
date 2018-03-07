package com.nenu.info.controller.ExportData;

import com.nenu.info.common.dto.category.ACMPrizeDto;
import com.nenu.info.common.dto.category.MathModelPrizeDto;
import com.nenu.info.common.dto.category.ScientificProjectDto;
import com.nenu.info.common.dto.category.ThesisDto;
import com.nenu.info.common.utils.ExcelUtil;
import com.nenu.info.common.utils.URLConstants;
import com.nenu.info.common.utils.WebConstants;
import com.nenu.info.controller.category.ACMController;
import com.nenu.info.service.category.ACMService;
import com.nenu.info.service.category.MathModelPrizeService;
import com.nenu.info.service.category.ScientificProjectService;
import com.nenu.info.service.category.ThesisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
        return "ACM";
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

        return "scientific_project";
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


        String filename = "scientificProject.xls";//设置下载时Excel的名称

        filename = ExcelUtil.encodeFilename(filename, request);//处理中文文件名

        ExcelUtil.writeExcel(mathModelPrizeDtoList, "recruit", filename, response);//调用Excel工具类生成Excel

        model.addAttribute("mathModelPrizeDtoList", mathModelPrizeDtoList);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("curPage", curPage);
        return "math_model";

    }
}
