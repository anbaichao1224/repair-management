/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.sys.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.modules.sys.dao.SysOrgDao;
import io.renren.modules.sys.entity.SysOrgEntity;
import io.renren.modules.sys.service.SysOrgService;
import io.renren.modules.sys.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service("sysOrgServiceImpl")
public class SysOrgServiceImpl extends ServiceImpl<SysOrgDao, SysOrgEntity> implements SysOrgService{

	@Autowired
	private SysUserService sysUserService;

	@Override
	public List<SysOrgEntity> queryListParentId(Long parentId, List<Long> idList) {

		List<SysOrgEntity> orgList = queryListParentId(parentId);

		if(idList == null){
			return orgList;
		}
		
		List<SysOrgEntity> userMenuList = new ArrayList<>();
		for(SysOrgEntity org : orgList){
			if(idList.contains(org.getId())){
				userMenuList.add(org);
			}
		}
		return userMenuList;
	}

	@Override
	public List<SysOrgEntity> queryList() {
		return baseMapper.queryList();
	}

	@Override
	public List<SysOrgEntity> queryListParentId(Long parentId) {
		return baseMapper.queryListParentId(parentId);
	}

	@Override
	public List<SysOrgEntity> queryNotButtonList() {
		return baseMapper.queryNotButtonList();
	}


	@Override
	public void delete(Long id){
		//删除菜单
		this.removeById(id);
	}

//	/**
//	 * 获取所有菜单列表
//	 */
//	private List<SysOrgEntity> getAllMenuList(List<Long> idList){
//		//查询根菜单列表
//		List<SysMenuEntity> menuList = queryListParentId(0L, idList);
//		//递归获取子菜单
//		getMenuTreeList(menuList, menuIdList);
//
//		return menuList;
//	}
//
//	/**
//	 * 递归
//	 */
//	private List<SysOrgEntity> getMenuTreeList(List<SysOrgEntity> menuList, List<Long> menuIdList){
//		List<SysOrgEntity> subMenuList = new ArrayList<SysOrgEntity>();
//
//		for(SysMenuEntity entity : menuList){
//			entity.setList(getMenuTreeList(queryListParentId(entity.getMenuId(), menuIdList), menuIdList));
//			subMenuList.add(entity);
//		}
//
//		return subMenuList;
//	}
}
