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
     * 根据论文id查询未删除的材料信息
     * @param thesisId
     * @return
     * @throws Exception
     */
    public List<Material> listByThesisId(@Param("thesisId") Integer thesisId)  throws Exception;

    /**
     * 材料假删
     * @param id
     * @return
     * @throws Exception
     */
    public Integer falseDeleteById(@Param("id") Integer id) throws Exception;

    /**
     * 添加论文材料信息
     * @param material
     * @return
     * @throws Exception
     */
    public Boolean addThesis(@Param("material") Material material) throws Exception;
}
