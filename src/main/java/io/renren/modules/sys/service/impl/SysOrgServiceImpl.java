/**
 * Copyright (c) 2016-2019 物业移动办公平台 All rights reserved.
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
import java.util.Map;


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

	@Override
	public List<Map<String, Object>> getOrgUser(Map<String, Object> params) {
		return baseMapper.getOrgUser(params);
	}
}
