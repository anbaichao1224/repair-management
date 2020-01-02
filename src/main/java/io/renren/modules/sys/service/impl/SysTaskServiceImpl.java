/**
 * Copyright (c) 2016-2019 物业移动办公平台 All rights reserved.
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
import io.renren.modules.sys.entity.*;
import io.renren.modules.sys.service.SysOrgService;
import io.renren.modules.sys.service.SysTaskService;
import io.renren.modules.sys.service.SysUserService;
import io.renren.modules.sys.service.TaskPicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
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
		if(records.size()>0){
			records.forEach(sysTaskEntity -> {
				Map<String,Object> resultMap = new HashMap<>();
				resultMap.put("id",sysTaskEntity.getId());
				List<TaskPicEntity> picEntityList = taskPicService.getTaskPic(resultMap);
				sysTaskEntity.setPicEntityList(picEntityList);
			});
		}

		return page.setRecords(records);
	}

	@Override
	public Page<SysTask> queryTaskPicPage(Map<String, Object> params) {
		int pageNum = Integer.parseInt(params.get("pageNum").toString());
		int pageSize =Integer.parseInt(params.get("pageSize").toString());

		Page<SysTaskEntity> page = new Page<>(pageNum,pageSize);// 当前页，总条数 构造 page 对象
		List<SysTaskEntity> records = baseMapper.queryTaskPage(page,params);

		Page<SysTask> pages = new Page<>(pageNum,pageSize);

		List<SysTask> taskList = new ArrayList<>();
		if(records.size()>0){
			for (SysTaskEntity taskEntity : records){
				SysTask sysTask = new SysTask();
				sysTask.setSysTaskEntity(taskEntity);
				Map<String,Object> result = new HashMap<>();
				result.put("id",taskEntity.getId());
				List<TaskPicEntity> picEntityList = taskPicService.getTaskPic(result);
				sysTask.setPicList(picEntityList);
				taskList.add(sysTask);
			}
		}

		return pages.setRecords(taskList);
	}


	@Override
	public void udpateTaskForAssigner(Map<String, Object> params) {
		baseMapper.updateAssigner(params);
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
