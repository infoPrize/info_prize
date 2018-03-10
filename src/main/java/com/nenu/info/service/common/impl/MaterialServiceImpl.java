package com.nenu.info.service.common.impl;

import com.nenu.info.Dao.common.MaterialDao;
import com.nenu.info.common.entities.common.Material;
import com.nenu.info.service.common.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * MaterialServiceImpl - 材料Service的实现
 *
 * @author zhaiaxin
 * @time: 2018/3/8 15:44.
 */
@Service(value = "materialService")
public class MaterialServiceImpl implements MaterialService{

    @Autowired
    private MaterialDao materialDao;

    public List<Material> listByThesisId(Integer thesisId)  throws Exception{

        List<Material> list = materialDao.listByThesisId(thesisId);
        return list;
    }

    public Integer falseDeleteById(Integer id) throws Exception{
        try {
            materialDao.falseDeleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
        return 1;
    }

    public Boolean addThesis( Material material) throws Exception{
        try{
            materialDao.addThesis(material);
        } catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
