package com.nenu.info.service.category.impl;

import com.nenu.info.Dao.category.OtherMatchDao;
import com.nenu.info.Dao.common.StudentDao;
import com.nenu.info.Dao.common.TeacherDao;
import com.nenu.info.common.dto.category.OtherMatchDto;
import com.nenu.info.common.entities.category.OtherMatch;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.service.category.OtherMatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

import static com.nenu.info.common.utils.WebConstants.pageSize;

/**
 * @author: software-liuwang
 * @time: 2018/3/8 13:15
 * @description : 其他比赛Service实现类
 */
@Service(value = "otherMatchService")
public class OtherMatchServiceImpl implements OtherMatchService {

    @Autowired
    private OtherMatchDao otherMatchDao;

    @Autowired
    private TeacherDao teacherDao;

    @Autowired
    private StudentDao studentDao;

    @Override
    public void add(OtherMatch otherMatch) {
        try {
            otherMatchDao.add(otherMatch);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Map<String, Object> getParams(String matchName, Integer matchLevel, Integer prizeLevel, Date startTime, Date endTime, String stuName, Integer majorCode, String projectName, String hostUnit, String teacherName) {
        Teacher teacher = null;
        Integer teacherId = null;
        List<Student> studentList = null;
        List<Integer> idList = new ArrayList<>();

        if(!teacherName.equals("")) {
            try {
                teacher = teacherDao.selectTeacherByName(teacherName);
            } catch (Exception e) {
                e.printStackTrace();
            }

            if(teacher != null) {
                teacherId = teacher.getId();
            }
        }

        try {
            studentList = studentDao.listStudentByStuNameAndMajor(stuName, majorCode);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(studentList != null) {
            for (Student student : studentList) {
                Integer id = student.getId();
                idList.add(id);
            }
        }

        Map<String, Object> params = new HashMap<>();
        params.put("matchName", matchName);
        params.put("matchLevel", matchLevel);
        params.put("prizeLevel", prizeLevel);
        params.put("startTime", startTime);
        params.put("endTime", endTime);
        params.put("projectName", projectName);
        params.put("hostUnit", hostUnit);
        params.put("idList", idList);
        params.put("teacherId", teacherId);

        return params;
    }

    @Override
    public Map<String, Object> getParams(Map<String, Object> params, Integer curPage, Integer totalPage) {
        if(curPage <= 0 && curPage != -500) {
            curPage = 1;
        } else if(curPage > totalPage) {
            curPage = totalPage;
        }

        int startNum = (curPage - 1) * pageSize;

        params.put("curPage", curPage);
        params.put("totalPage", totalPage);
        params.put("startNum", startNum);
        params.put("pageSize", pageSize);

        return params;
    }

    @Override
    public Integer countByCondition(Map<String, Object> params) {
        Integer count = 0;
        try {
            count = otherMatchDao.countByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    @Override
    public List<OtherMatchDto> listByCondition(Map<String, Object> params) {
        List<OtherMatchDto> otherMatchDtoList = null;
        try {
            otherMatchDtoList = otherMatchDao.listByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        if(otherMatchDtoList != null) {
            for (OtherMatchDto otherMatchDto : otherMatchDtoList) {
                Date prizeTime = otherMatchDto.getPrizeTime();
                String prizeTimeStr = sdf.format(prizeTime);
                otherMatchDto.setPrizeTimeStr(prizeTimeStr);
            }
        }

        return otherMatchDtoList;
    }

    @Override
    public OtherMatchDto selectById(Integer id) {
        OtherMatchDto otherMatchDto = null;
        try {
            otherMatchDto = otherMatchDao.selectById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return otherMatchDto;
    }
}
