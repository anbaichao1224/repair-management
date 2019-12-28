/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.sys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.modules.sys.dao.SysTitleDao;
import io.renren.modules.sys.dao.TaskPicDao;
import io.renren.modules.sys.entity.SysTitleEntity;
import io.renren.modules.sys.entity.TaskPicEntity;
import io.renren.modules.sys.service.SysTitleService;
import io.renren.modules.sys.service.TaskPicService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


/**
 *  图片
 *
 * @author Mark sunlightcs@gmail.com
 */
@Service("taskPic")
public class TaskPicServiceImpl extends ServiceImpl<TaskPicDao, TaskPicEntity> implements TaskPicService {

	@Override
	public List<TaskPicEntity> getTaskPic(Map<String, Object> params) {
		return baseMapper.getPic(params);
	}

	@Override
	public void savePic(List<TaskPicEntity> picEntityList) {
		if(picEntityList.size()>0){
			baseMapper.savePic(picEntityList);
		}
	}

	@Override
	public void deletePic(String id) {
		baseMapper.deletePic(id);
	}
}