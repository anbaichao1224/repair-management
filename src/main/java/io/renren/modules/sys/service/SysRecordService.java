package io.renren.modules.sys.service;


import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.modules.sys.entity.SysRecordEntity;

import java.util.List;
import java.util.Map;


/**
 * 记录操作
 *
 * @author Mark sunlightcs@gmail.com
 */
public interface SysRecordService extends IService<SysRecordEntity> {

	List<SysRecordEntity> queryRecordList(Map<String,Object> params);

	void saveRecord(SysRecordEntity sysRecordEntity);

}
