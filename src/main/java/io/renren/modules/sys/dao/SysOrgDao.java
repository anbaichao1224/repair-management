/**
 * Copyright (c) 2016-2019 物业移动办公平台 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.sys.entity.SysMenuEntity;
import io.renren.modules.sys.entity.SysOrgEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 菜单管理
 *
 * @author Mark sunlightcs@gmail.com
 */
@Mapper
public interface SysOrgDao extends BaseMapper<SysOrgEntity> {
	
	/**
	 * 根据父菜单，查询子菜单
	 * @param parentid 父菜单ID
	 */
	List<SysOrgEntity> queryListParentId(Long parentid);
	
	/**
	 * 获取不包含按钮的菜单列表
	 */
	List<SysOrgEntity> queryNotButtonList();

	List<SysOrgEntity> queryList();

}
