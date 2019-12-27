/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.renren.modules.sys.entity.SysRecordEntity;
import io.renren.modules.sys.entity.SysTaskEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 纪律管理
 *
 * @author Mark sunlightcs@gmail.com
 */
@Mapper
public interface SysRecordDao extends BaseMapper<SysRecordEntity> {

	List<SysRecordEntity> queryRecordList(@Param("params") Map<String,Object> params);

	void saveRecord(SysRecordEntity sysRecordEntity);

}
