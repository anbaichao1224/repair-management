/**
 * Copyright (c) 2016-2019 物业移动办公平台 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.renren.modules.sys.entity.SysOrgEntity;
import io.renren.modules.sys.entity.SysTaskEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 菜单管理
 *
 * @author Mark sunlightcs@gmail.com
 */
@Mapper
public interface SysTaskDao extends BaseMapper<SysTaskEntity> {
	
	List<SysTaskEntity>  queryTaskPage(Page<SysTaskEntity> page, @Param("params")Map<String,Object> params);

	SysTaskEntity getTaskEntity(@Param("params")Map<String,Object> params);

	void saveTaskEntity(SysTaskEntity sysTaskEntity);

	void updateTaskEntity(SysTaskEntity sysTaskEntity);

	void updateAssigner(Map<String,Object> params);

	void deleteTaskEntity(String id);

}
