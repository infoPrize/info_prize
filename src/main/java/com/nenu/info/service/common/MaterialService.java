package com.nenu.info.service.common;

import com.nenu.info.common.entities.common.Material;

import java.util.List;

/**
 * MaterialService - 材料Service接口
 *
 * @author zhaiaxin
 * @time: 2018/3/8 15:42.
 */
public interface MaterialService {

    /**
     * 根据论文id查询未删除的材料信息
     * @param thesisId
     * @return
     * @throws Exception
     */
    public List<Material> listByThesisId(Integer thesisId)  throws Exception;


    /**
     * 材料假删
     * @param id
     * @return
     * @throws Exception
     */
    public Integer falseDeleteById(Integer id) throws Exception;

    /**
     * 添加论文材料信息
     * @param material
     * @return
     * @throws Exception
     */
    public Boolean addThesis( Material material) throws Exception;
}
