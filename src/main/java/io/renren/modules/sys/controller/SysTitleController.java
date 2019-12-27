/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.sys.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.renren.common.annotation.SysLog;
import io.renren.common.utils.Constant;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.common.validator.Assert;
import io.renren.modules.sys.entity.SysTitleEntity;
import io.renren.modules.sys.entity.SysUserEntity;
import io.renren.modules.sys.entity.SysUserEntityss;
import io.renren.modules.sys.form.PasswordForm;
import io.renren.modules.sys.service.SysTitleService;
import io.renren.modules.sys.service.SysUserRoleService;
import io.renren.modules.sys.service.SysUserService;
import org.apache.commons.lang.ArrayUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 系统用户
 *
 * @author Mark sunlightcs@gmail.com
 */
@RestController
@RequestMapping("/sys/title")
public class SysTitleController extends AbstractController {

	@Autowired
	private SysTitleService sysTitleService;


	@PostMapping("/list")
	public R list(){
		try {
			List<SysTitleEntity> list = sysTitleService.querySysTitle();
			return R.ok().put("title",list);
		}catch (Exception e){
			e.printStackTrace();
			return R.error(1,"获取职称列表出错!");
		}
	}

	@PostMapping("/getTitle")
	public R getTitle(@RequestBody Map<String,Object> params){
		try {
			SysTitleEntity sysTitleEntity = sysTitleService.getSysTitle(params);
			return R.ok().put("title",sysTitleEntity);
		}catch (Exception e){
			e.printStackTrace();
			return R.error(1,"获取个人职称出错!");
		}
	}

}
