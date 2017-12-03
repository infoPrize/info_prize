package com.nenu.info.service.impl;

import com.nenu.info.Dao.ScientificProjectDao;
import com.nenu.info.common.entities.ScientificProject;
import com.nenu.info.service.ScientificProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: software-liuwang
 * @time: 2017/12/2 15:34
 * @description :
 */
@Service(value = "scientificProjectService")
public class ScientificProjectServiceImpl implements ScientificProjectService {

    @Autowired
    ScientificProjectDao scientificProjectDao;

    /**
     * 新增科研国创项目
     * @param scientificProject
     */
    @Override
    public void addScientificProject(ScientificProject scientificProject) {
        scientificProjectDao.addScientificProject(scientificProject);
    }
}
