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
     * 根据id和type查询未删除的材料信息
     * @param matchId,matchType
     * @return
     * @throws Exception
     */
    public List<Material> listByTypeAndId(Integer matchId , Integer matchType)  throws Exception;


    /**
     * 材料假删
     * @param id
     * @return
     * @throws Exception
     */
    public Integer falseDeleteById(Integer id) throws Exception;

    /**
     * 添加材料信息
     * @param material
     * @return
     * @throws Exception
     */
    public Boolean add( Material material) throws Exception;
}
