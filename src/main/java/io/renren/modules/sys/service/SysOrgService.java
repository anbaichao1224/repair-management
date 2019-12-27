package io.renren.modules.sys.service;


import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.modules.sys.entity.SysOrgEntity;

import java.util.List;


/**
 * 组织结构管理
 *
 * @author Mark sunlightcs@gmail.com
 */
public interface SysOrgService extends IService<SysOrgEntity> {

	/**
	 * 根据父菜单，查询子菜单
	 * @param parentid 父菜单ID
	 * @param orgidList  用户菜单ID
	 */
	List<SysOrgEntity> queryListParentId(Long parentid, List<Long> orgidList);

	/**
	 * 根据父菜单，查询子菜单
	 * @param parentid 父菜单ID
	 */
	List<SysOrgEntity> queryListParentId(Long parentid);

	List<SysOrgEntity> queryList();
	
	/**
	 * 获取不包含按钮的菜单列表
	 */
	List<SysOrgEntity> queryNotButtonList();
	
	/**
	 * 删除
	 */
	void delete(Long id);
}
