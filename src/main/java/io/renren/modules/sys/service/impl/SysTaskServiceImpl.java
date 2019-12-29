/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.sys.service.impl;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.modules.sys.dao.SysOrgDao;
import io.renren.modules.sys.dao.SysTaskDao;
import io.renren.modules.sys.entity.SysOrgEntity;
import io.renren.modules.sys.entity.SysTaskEntity;
import io.renren.modules.sys.entity.SysUserEntityss;
import io.renren.modules.sys.service.SysOrgService;
import io.renren.modules.sys.service.SysTaskService;
import io.renren.modules.sys.service.SysUserService;
import io.renren.modules.sys.service.TaskPicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Service("sysTaskServiceImpl")
public class SysTaskServiceImpl extends ServiceImpl<SysTaskDao, SysTaskEntity> implements SysTaskService {

    @Autowired
    private TaskPicService taskPicService;

	@Override
	public Page<SysTaskEntity> queryTaskPage(Map<String, Object> params) {
		int pageNum = Integer.parseInt(params.get("pageNum").toString());
		int pageSize =Integer.parseInt(params.get("pageSize").toString());

		Page<SysTaskEntity> page = new Page<>(pageNum,pageSize);// 当前页，总条数 构造 page 对象
		List<SysTaskEntity> records = baseMapper.queryTaskPage(page,params);

		return page.setRecords(records);
	}

	@Override
	public SysTaskEntity getTaskEntity(Map<String, Object> params) {
		return baseMapper.getTaskEntity(params);
	}

	@Override
	public void saveTaskEntity(SysTaskEntity sysTaskEntity) {
		baseMapper.saveTaskEntity(sysTaskEntity);
	}

	@Override
	public void updateTaskEntity(SysTaskEntity sysTaskEntity) {
		baseMapper.updateTaskEntity(sysTaskEntity);
	}

	@Override
    @Transactional
	public void deleteTaskEntity(String id) {

	    baseMapper.deleteTaskEntity(id);
	    taskPicService.deletePic(id);

	}
}
