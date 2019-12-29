/**
 * Copyright (c) 2016-2019 物业移动办公平台 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.sys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.modules.sys.dao.SysTitleDao;
import io.renren.modules.sys.entity.SysTitleEntity;
import io.renren.modules.sys.service.SysTitleService;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;


/**
 *  职称
 *
 * @author Mark sunlightcs@gmail.com
 */
@Service("sysTitle")
public class SysTitleServiceImpl extends ServiceImpl<SysTitleDao, SysTitleEntity> implements SysTitleService {

	@Override
	public List<SysTitleEntity> querySysTitle() {
		return baseMapper.querySysTitle();
	}

	@Override
	public SysTitleEntity getSysTitle(Map<String, Object> params) {
		return baseMapper.getSysTitle(params);
	}
}