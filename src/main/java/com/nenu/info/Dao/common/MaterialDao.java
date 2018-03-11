package com.nenu.info.Dao.common;

import com.nenu.info.common.entities.common.Material;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * MaterialDao - 材料Dao接口
 *
 * @author zhaiaxin
 * @time: 2018/3/8 15:33.
 */
public interface MaterialDao {

    /**
     * 根据id和type查询未删除的材料信息
     * @param matchId,matchType
     * @return
     * @throws Exception
     */
    public List<Material> listByTypeAndId(@Param("matchId") Integer matchId , @Param("matchType") Integer matchType)  throws Exception;

    /**
     * 材料假删
     * @param id
     * @return
     * @throws Exception
     */
    public Integer falseDeleteById(@Param("id") Integer id) throws Exception;

    /**
     * 添加材料信息
     * @param material
     * @return
     * @throws Exception
     */
    public Boolean add(@Param("material") Material material) throws Exception;
}
