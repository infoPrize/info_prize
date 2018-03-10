package com.nenu.info.controller.common;

import com.nenu.info.common.dto.common.StudentDto;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.service.common.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

import static com.nenu.info.common.utils.WebConstants.pageSize;

/**
 * @author: software-liuwang
 * @time: 2017/11/7 15:41
 * @description :
 */

@Controller
@RequestMapping(value = "/student")
public class StudentController {

    @Autowired
    StudentService studentService;

    @RequestMapping(value = "add",method = RequestMethod.POST)
    public String add(@RequestParam("name") String name,
                      @RequestParam("sex") Integer sex,
                      @RequestParam("stuNumber") String stuNumber,
                      @RequestParam("grade") String grade,
                      @RequestParam("majorCode") Integer majorCode,
                      @RequestParam("phone") String phone) {

        Student student = new Student();
        student.setName(name);
        student.setSex(sex);
        student.setStuNumber(stuNumber);
        student.setGrade(grade);
        student.setMajorCode(majorCode);
        student.setPhone(phone);

        try {
            studentService.add(student);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/student/list";
    }

    //查询所有学生
//    @RequestMapping(value = "list/{curPage}",method = RequestMethod.GET)
//    public String list(@PathVariable("curPage") Integer curPage,
//                       Model model) throws Exception {
//
//        Map<String, Object> params = null;
//        params = studentService.getParams(null, -1, null, null, -1, null);
//        Integer count = 0;
//        count = studentService.countByCondition(params);
//
//        int totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
//
//
//        List<StudentDto> studentDtoList = studentService.queryByCondition(null,0,null,null,0,null, curPage, totalPage);
//        model.addAttribute("studentDtoList",studentDtoList);
//        model.addAttribute("curPage", curPage);
//        model.addAttribute("totalPage", totalPage);
//        return "student/list";
//
//    }



    //条件查询
    @RequestMapping(value = "query/by/condition/{curPage}",method = RequestMethod.GET)
    public String queryByCondition(@PathVariable("curPage") Integer curPage,
                                   @RequestParam(value = "name", required = false, defaultValue = "") String name,
                                   @RequestParam(value = "sex", required = false, defaultValue = "-1") Integer sex,
                                   @RequestParam(value = "stuNumber", required = false, defaultValue = "") String stuNumber,
                                   @RequestParam(value = "grade", required = false, defaultValue = "") String grade,
                                   @RequestParam(value = "majorCode", required = false, defaultValue = "-1") Integer majorCode,
                                   @RequestParam(value = "phone", required = false, defaultValue = "") String phone,
                                   HttpServletRequest request,
                                   Model model) throws Exception{

        Map<String, Object> params = null;
        params = studentService.getParams(name, sex, stuNumber, grade, majorCode, phone);

        Integer count = studentService.countByCondition(params);

        Integer totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
        params = studentService.getParams(params, curPage, totalPage);

        HttpSession session = request.getSession();
        session.setAttribute("stuParams", params);

        List<StudentDto> studentDtoList = studentService.queryByCondition(params);
        model.addAttribute("studentDtoList",studentDtoList);
        model.addAttribute("curPage", curPage);
        model.addAttribute("totalPage", totalPage);
        return "student/list";

    }

    /**
     * 去往上一页
     */
    @RequestMapping(value = "toPrevious")
    public String toPrevious(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Map<String, Object> params = (Map)session.getAttribute("stuParams");
        int curPage = (int)params.get("curPage");
        int totalPage = (int)params.get("totalPage");

        curPage -= 1;
        params = studentService.getParams(params, curPage, totalPage);

        List<StudentDto> studentDtoList = null;
        try {
            studentDtoList = studentService.queryByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("studentDtoList",studentDtoList);
        model.addAttribute("curPage", params.get("curPage"));
        model.addAttribute("totalPage", params.get("totalPage"));
        return "student/list";
    }

    /**
     * 去往下一页
     */
    @RequestMapping(value = "toNext")
    public String toNext(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Map<String, Object> params = (Map)session.getAttribute("stuParams");
        int curPage = (int)params.get("curPage");
        int totalPage = (int)params.get("totalPage");

        curPage += 1;
        params = studentService.getParams(params, curPage, totalPage);

        List<StudentDto> studentDtoList = null;
        try {
            studentDtoList = studentService.queryByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("studentDtoList",studentDtoList);
        model.addAttribute("curPage", params.get("curPage"));
        model.addAttribute("totalPage", params.get("totalPage"));
        return "student/list";
    }

    //根据学号删除
    @RequestMapping(value = "delete/by/stuNumber/{stuNumber}", method = RequestMethod.GET)
    public String deleteByStuNumber(@PathVariable("stuNumber")String stuNumber) throws Exception {

        studentService.deleteByStuNumber(stuNumber);
        return "redirect:/student/list";

    }





}
