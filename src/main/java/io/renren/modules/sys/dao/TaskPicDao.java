package io.renren.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.renren.modules.sys.entity.SysTaskEntity;
import io.renren.modules.sys.entity.TaskPicEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

/**
 *  图片
 *
 * @author Mark sunlightcs@gmail.com
 */
@Mapper
public interface TaskPicDao extends BaseMapper<TaskPicEntity> {

	List<TaskPicEntity> getPic(@RequestParam("params")Map<String,Object> params);

	void savePic(List<TaskPicEntity> picEntityList);

	void deletePic(@RequestParam("params") Map<String,Object> params);

}
