package com.nenu.info.Dao.category;

import com.nenu.info.common.dto.category.ScientificProjectDto;
import com.nenu.info.common.entities.category.ScientificProject;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author: software-liuwang
 * @time: 2017/11/30 15:33
 * @description : 科研国创项目的Dao接口
 */
public interface ScientificProjectDao {

    //新增科研国创项目
    public void addScientificProject(@Param("scientificProject") ScientificProject scientificProject);

    /**
     * 根据条件查询信息的数量
     */
    public Integer countByCondition(Map<String, Object> params) throws Exception;

    /**
     * 根据条件查询国创科研信息
     * @param params 参数Map
     * @return
     * @throws Exception
     */
    public List<ScientificProjectDto> listScientificProjectByCondition(Map<String, Object> params) throws Exception;

    /**
     * 查询所有国创科研信息
     * @return
     * @throws Exception
     */
    public List<ScientificProjectDto> listAll() throws Exception;

}
