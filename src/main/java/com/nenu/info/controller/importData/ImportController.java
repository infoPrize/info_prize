package com.nenu.info.controller.importData;

import com.nenu.info.common.utils.URLConstants;
import com.nenu.info.service.importData.ImportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
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
public class ImportController {

    @Autowired
    ImportService importService;

    @RequestMapping(value = "student",method = RequestMethod.POST)
    public String importStudent(@RequestParam("file")MultipartFile file , RedirectAttributes redirectAttributes , HttpServletRequest request){
       try{
//           File excel = new File(file.getOriginalFilename());//服务器端
           File excel = new File(request.getSession().getServletContext().getRealPath("/")+file.getOriginalFilename());//本地调试，必须制定特定的存在目录，否则找不到存储文件的位置
           file.transferTo(excel);
           if(importService.checkStudent(excel)){
               importService.importStudent(excel);
               excel.delete();
           }

       }catch (Exception e){
           e.printStackTrace();
       }
        return "redirect:/student/list";

    }

    @RequestMapping(value = "thesis",method = RequestMethod.POST)
    public String importThesis(@RequestParam("file")MultipartFile file , RedirectAttributes redirectAttributes , HttpServletRequest request){
        try{
//           File excel = new File(file.getOriginalFilename());//服务器端
            File excel = new File(request.getSession().getServletContext().getRealPath("/")+file.getOriginalFilename());//本地调试，必须制定特定的存在目录，否则找不到存储文件的位置
            file.transferTo(excel);
            if(importService.checkThesis(excel)){
                importService.importThesis(excel);
                excel.delete();
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/thesis/toThesis";

    }

    @RequestMapping(value = "patent",method = RequestMethod.POST)
    public String importPatent(@RequestParam("file")MultipartFile file , RedirectAttributes redirectAttributes , HttpServletRequest request){
        try{
//           File excel = new File(file.getOriginalFilename());//服务器端
            File excel = new File(request.getSession().getServletContext().getRealPath("/")+file.getOriginalFilename());//本地调试，必须制定特定的存在目录，否则找不到存储文件的位置
            file.transferTo(excel);
            if(importService.checkPatent(excel)){
                importService.importPatent(excel);
                excel.delete();
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/patent/toPatent";

    }

    @RequestMapping(value = "scientificProject",method = RequestMethod.POST)
    public String importScientificProject(@RequestParam("file")MultipartFile file , RedirectAttributes redirectAttributes , HttpServletRequest request){
        try{
//           File excel = new File(file.getOriginalFilename());//服务器端
            File excel = new File(request.getSession().getServletContext().getRealPath("/")+file.getOriginalFilename());//本地调试，必须制定特定的存在目录，否则找不到存储文件的位置
            file.transferTo(excel);
            if(importService.checkScientificProject(excel)){
                importService.importScientificProject(excel);
                excel.delete();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/scientificProject/toScientificProject";
    }

    @RequestMapping(value = "ACMPrize",method = RequestMethod.POST)
    public String importACMPrize(@RequestParam("file")MultipartFile file , RedirectAttributes redirectAttributes , HttpServletRequest request){
        try{
//           File excel = new File(file.getOriginalFilename());//服务器端
            File excel = new File(request.getSession().getServletContext().getRealPath("/")+file.getOriginalFilename());//本地调试，必须制定特定的存在目录，否则找不到存储文件的位置
            file.transferTo(excel);
            if(importService.checkACMPrize(excel)){
                importService.importACMPrize(excel);
                excel.delete();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/acm/toACM";
    }

    @RequestMapping(value = "math",method = RequestMethod.POST)
    public String importMath(@RequestParam("file")MultipartFile file , RedirectAttributes redirectAttributes , HttpServletRequest request){
        try{
//           File excel = new File(file.getOriginalFilename());//服务器端
            File excel = new File(request.getSession().getServletContext().getRealPath("/")+file.getOriginalFilename());//本地调试，必须制定特定的存在目录，否则找不到存储文件的位置
            file.transferTo(excel);
            if(importService.checkMath(excel)){
                importService.importMath(excel);
                excel.delete();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/mathModel/toMathModel";
    }

}
