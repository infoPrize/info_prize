package com.nenu.info.controller.importData;

import com.nenu.info.common.utils.MessageInfo;
import com.nenu.info.common.utils.URLConstants;
import com.nenu.info.controller.common.AbstractController;
import com.nenu.info.service.importData.ImportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

/**
 * 职责
 *
 * @author zhaiaxin
 * @time: 2017/12/8 14:47.
 */
@Controller
@RequestMapping(value = URLConstants.IMPORT_URL)
public class ImportController extends AbstractController{

    @RequestMapping(value = "student",method = RequestMethod.POST)
    public String importStudent(@RequestParam("file")MultipartFile file , RedirectAttributes redirectAttributes , HttpServletRequest request , Model model){
        try{
//            File excel = new File(file.getOriginalFilename());//服务器端
            File excel = new File(request.getSession().getServletContext().getRealPath("/")+file.getOriginalFilename());//本地调试，必须制定特定的存在目录，否则找不到存储文件的位置
            int importNum = 0;
            file.transferTo(excel);
            if(importService.checkStudent(excel)){
                importNum = importService.importStudent(excel, model);
                model.addAttribute("importOK", "ok");
                model.addAttribute("message", MessageInfo.IMPORT_SUCCESS);
                model.addAttribute("importNum", importNum);
                excel.delete();
            }else {
                model.addAttribute("importOK", "ok");
                model.addAttribute("message", MessageInfo.IMPORT_CHECK_FAILED);
                model.addAttribute("importNum", importNum);
            }

        }catch (Exception e){
            e.printStackTrace();
            model.addAttribute("importOK", "ok");
            model.addAttribute("message", MessageInfo.IMPORT_STUDENT_IMFORMATION);
            model.addAttribute("importNum", "0");
        }
        return "student/add";

    }

    @RequestMapping(value = "thesis",method = RequestMethod.POST)
    public String importThesis(@RequestParam("file")MultipartFile file , Model model, HttpServletRequest request ){
        try{
//           File excel = new File(file.getOriginalFilename());//服务器端
            File excel = new File(request.getSession().getServletContext().getRealPath("/")+file.getOriginalFilename());//本地调试，必须制定特定的存在目录，否则找不到存储文件的位置
            int importNum = 0;
            file.transferTo(excel);
            if(importService.checkThesis(excel)){
                importNum = importService.importThesis(excel);
                model.addAttribute("importOK", "ok");
                model.addAttribute("message", MessageInfo.IMPORT_SUCCESS);
                model.addAttribute("importNum", importNum);
                excel.delete();
            }else {
                model.addAttribute("importOK", "ok");
                model.addAttribute("message", MessageInfo.IMPORT_CHECK_FAILED);
                model.addAttribute("importNum", 0);
            }

        }catch (Exception e){
            e.printStackTrace();
            model.addAttribute("importOK", "ok");
            model.addAttribute("message", MessageInfo.IMPORT_STUDENT_IMFORMATION);
            model.addAttribute("importNum", 0);
        }
        return "thesis/thesis_add";

    }

    @RequestMapping(value = "patent",method = RequestMethod.POST)
    public String importPatent(@RequestParam("file")MultipartFile file ,  HttpServletRequest request , Model model){
        int importNum = 0;
        try{
//           File excel = new File(file.getOriginalFilename());//服务器端
            File excel = new File(request.getSession().getServletContext().getRealPath("/")+file.getOriginalFilename());//本地调试，必须制定特定的存在目录，否则找不到存储文件的位置
            file.transferTo(excel);
            if(importService.checkPatent(excel)){
                importNum = importService.importPatent(excel);
                model.addAttribute("importOK", "ok");
                model.addAttribute("message", MessageInfo.IMPORT_SUCCESS);
                model.addAttribute("importNum", importNum);
                excel.delete();
            }else {
                model.addAttribute("importOK", "ok");
                model.addAttribute("message", MessageInfo.IMPORT_CHECK_FAILED);
                model.addAttribute("importNum", importNum);
            }

        }catch (Exception e){
            e.printStackTrace();
            model.addAttribute("importOK", "ok");
            model.addAttribute("message", MessageInfo.IMPORT_STUDENT_IMFORMATION);
            model.addAttribute("importNum", importNum);
        }
        return "patent/patent_add";

    }

    @RequestMapping(value = "scientificProject",method = RequestMethod.POST)
    public String importScientificProject(@RequestParam("file")MultipartFile file ,  HttpServletRequest request , Model model){
        int importNum = 0;
        try{
//           File excel = new File(file.getOriginalFilename());//服务器端
            File excel = new File(request.getSession().getServletContext().getRealPath("/")+file.getOriginalFilename());//本地调试，必须制定特定的存在目录，否则找不到存储文件的位置
            file.transferTo(excel);
            if(importService.checkScientificProject(excel)){
                importNum = importService.importScientificProject(excel);
                model.addAttribute("importOK", "ok");
                model.addAttribute("message", MessageInfo.IMPORT_SUCCESS);
                model.addAttribute("importNum", importNum);
                excel.delete();
            }else {
                model.addAttribute("importOK", "ok");
                model.addAttribute("message", MessageInfo.IMPORT_CHECK_FAILED);
                model.addAttribute("importNum", importNum);
            }

        }catch (Exception e){
            e.printStackTrace();
            model.addAttribute("importOK", "ok");
            model.addAttribute("message", MessageInfo.IMPORT_STUDENT_IMFORMATION);
            model.addAttribute("importNum", importNum);
        }
        return "scientific_project/scientific_project_add";
    }

    @RequestMapping(value = "ACMPrize",method = RequestMethod.POST)
    public String importACMPrize(@RequestParam("file")MultipartFile file , Model model , HttpServletRequest request ){
        int importNum = 0;
        try{
//           File excel = new File(file.getOriginalFilename());//服务器端
            File excel = new File(request.getSession().getServletContext().getRealPath("/")+file.getOriginalFilename());//本地调试，必须制定特定的存在目录，否则找不到存储文件的位置
            file.transferTo(excel);
            if(importService.checkACMPrize(excel)){
                importService.importACMPrize(excel);
                model.addAttribute("importOK", "ok");
                model.addAttribute("message", MessageInfo.IMPORT_SUCCESS);
                model.addAttribute("importNum", importNum);
                excel.delete();
            }else {
                model.addAttribute("importOK", "ok");
                model.addAttribute("message", MessageInfo.IMPORT_CHECK_FAILED);
                model.addAttribute("importNum", importNum);
            }

        }catch (Exception e){
            e.printStackTrace();
            model.addAttribute("importOK", "ok");
            model.addAttribute("message", MessageInfo.IMPORT_STUDENT_IMFORMATION);
            model.addAttribute("importNum", importNum);
        }
        return "ACM/ACM_add";
    }

    @RequestMapping(value = "math",method = RequestMethod.POST)
    public String importMath(@RequestParam("file")MultipartFile file , Model model , HttpServletRequest request ){
        int importNum = 0;
        try{
//           File excel = new File(file.getOriginalFilename());//服务器端
            File excel = new File(request.getSession().getServletContext().getRealPath("/")+file.getOriginalFilename());//本地调试，必须制定特定的存在目录，否则找不到存储文件的位置
            file.transferTo(excel);
            if(importService.checkMath(excel)){
                importService.importMath(excel);
                model.addAttribute("importOK", "ok");
                model.addAttribute("message", MessageInfo.IMPORT_SUCCESS);
                model.addAttribute("importNum", importNum);
                excel.delete();
            }else {
                model.addAttribute("importOK", "ok");
                model.addAttribute("message", MessageInfo.IMPORT_CHECK_FAILED);
                model.addAttribute("importNum", importNum);
            }

        }catch (Exception e){
            e.printStackTrace();
            model.addAttribute("importOK", "ok");
            model.addAttribute("message", MessageInfo.IMPORT_STUDENT_IMFORMATION);
            model.addAttribute("importNum", importNum);
        }
        return "math_model/math_model_add";
    }

    @RequestMapping(value = "internetPlus",method = RequestMethod.POST)
    public String importInternetPlus(@RequestParam("file")MultipartFile file , Model model , HttpServletRequest request ){
        int importNum = 0;
        try{
//           File excel = new File(file.getOriginalFilename());//服务器端
            File excel = new File(request.getSession().getServletContext().getRealPath("/")+file.getOriginalFilename());//本地调试，必须制定特定的存在目录，否则找不到存储文件的位置
            file.transferTo(excel);
            if(importService.checkInternetPlus(excel)){
                importNum = importService.importInternetPlus(excel);
                model.addAttribute("importOK", "ok");
                model.addAttribute("message", MessageInfo.IMPORT_SUCCESS);
                model.addAttribute("importNum", importNum);
                excel.delete();
            }else {
                model.addAttribute("importOK", "ok");
                model.addAttribute("message", MessageInfo.IMPORT_CHECK_FAILED);
                model.addAttribute("importNum", importNum);
            }

        }catch (Exception e){
            e.printStackTrace();
            model.addAttribute("importOK", "ok");
            model.addAttribute("message", MessageInfo.IMPORT_STUDENT_IMFORMATION);
            model.addAttribute("importNum", importNum);
        }
        return "internet_plus/internet_plus_add";
    }

    @RequestMapping(value = "challengeCup",method = RequestMethod.POST)
    public String importChallengeCup(@RequestParam("file")MultipartFile file , Model model , HttpServletRequest request ){
        int importNum = 0;
        try{
//           File excel = new File(file.getOriginalFilename());//服务器端
            File excel = new File(request.getSession().getServletContext().getRealPath("/")+file.getOriginalFilename());//本地调试，必须制定特定的存在目录，否则找不到存储文件的位置
            file.transferTo(excel);
            if(importService.checkChallengeCup(excel)){
                importNum = importService.importChallengeCup(excel);
                model.addAttribute("importOK", "ok");
                model.addAttribute("message", MessageInfo.IMPORT_SUCCESS);
                model.addAttribute("importNum", importNum);
                excel.delete();
            }else {
                model.addAttribute("importOK", "ok");
                model.addAttribute("message", MessageInfo.IMPORT_CHECK_FAILED);
                model.addAttribute("importNum", importNum);
            }

        }catch (Exception e){
            e.printStackTrace();
            model.addAttribute("importOK", "ok");
            model.addAttribute("message", MessageInfo.IMPORT_STUDENT_IMFORMATION);
            model.addAttribute("importNum", importNum);
        }
        return "challenge_cup/challenge_cup_add";
    }

    @RequestMapping(value = "otherMatch",method = RequestMethod.POST)
    public String importOtherMatch(@RequestParam("file")MultipartFile file , Model model , HttpServletRequest request ){
        int importNum = 0;
        try{
//           File excel = new File(file.getOriginalFilename());//服务器端
            File excel = new File(request.getSession().getServletContext().getRealPath("/")+file.getOriginalFilename());//本地调试，必须制定特定的存在目录，否则找不到存储文件的位置
            file.transferTo(excel);

            if(importService.checkOtherMatch(excel)){
                importNum = importService.importOtherMatch(excel);
                model.addAttribute("importOK", "ok");
                model.addAttribute("message", MessageInfo.IMPORT_SUCCESS);
                model.addAttribute("importNum", importNum);
                excel.delete();
            }else {
                model.addAttribute("importOK", "ok");
                model.addAttribute("message", MessageInfo.IMPORT_CHECK_FAILED);
                model.addAttribute("importNum", importNum);
            }

        }catch (Exception e){
            e.printStackTrace();
            model.addAttribute("importOK", "ok");
            model.addAttribute("message", MessageInfo.IMPORT_STUDENT_IMFORMATION);
            model.addAttribute("importNum", importNum);
        }
        return "other_match/other_match_add";
    }

}
