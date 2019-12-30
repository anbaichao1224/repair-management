/**
 * Copyright (c) 2016-2019 物业移动办公平台 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.modules.sys.entity.TaskPicEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;


/**
 *  图片
 *
 * @author Mark sunlightcs@gmail.com
 */
public interface TaskPicService extends IService<TaskPicEntity> {

	List<TaskPicEntity> getTaskPic(Map<String,Object> params);

	void savePic(List<TaskPicEntity> picEntityList);

	void deletePic(String id);

}
