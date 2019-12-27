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
import io.renren.modules.sys.dao.SysRecordDao;
import io.renren.modules.sys.dao.SysTaskDao;
import io.renren.modules.sys.entity.SysRecordEntity;
import io.renren.modules.sys.entity.SysTaskEntity;
import io.renren.modules.sys.service.SysRecordService;
import io.renren.modules.sys.service.SysTaskService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service("sysRecordServiceImpl")
public class SysRecordServiceImpl extends ServiceImpl<SysRecordDao, SysRecordEntity> implements SysRecordService {

	@Override
	public List<SysRecordEntity> queryRecordList(Map<String, Object> params) {
		return baseMapper.queryRecordList(params);
	}

	@Override
	public void saveRecord(SysRecordEntity sysRecordEntity) {
		baseMapper.saveRecord(sysRecordEntity);
	}
}
