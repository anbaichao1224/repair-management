package io.renren.modules.sys.service;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.modules.sys.entity.SysOrgEntity;
import io.renren.modules.sys.entity.SysTaskEntity;

import java.util.List;
import java.util.Map;


/**
 * 组织结构管理
 *
 * @author Mark sunlightcs@gmail.com
 */
public interface SysTaskService extends IService<SysTaskEntity> {

	Page<SysTaskEntity> queryTaskPage(Map<String,Object> params);

	SysTaskEntity getTaskEntity(Map<String,Object> params);

	void saveTaskEntity(SysTaskEntity sysTaskEntity);

	void updateTaskEntity(SysTaskEntity sysTaskEntity);

	void deleteTaskEntity(String id);

}
