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
import io.renren.modules.sys.entity.SysTitleEntity;
import io.renren.modules.sys.entity.SysUserEntity;
import io.renren.modules.sys.entity.SysUserEntityss;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 *  职称
 *
 * @author Mark sunlightcs@gmail.com
 */
@Mapper
public interface SysTitleDao extends BaseMapper<SysTitleEntity> {

	List<SysTitleEntity> querySysTitle();


	SysTitleEntity getSysTitle(Map<String,Object> params);

}
