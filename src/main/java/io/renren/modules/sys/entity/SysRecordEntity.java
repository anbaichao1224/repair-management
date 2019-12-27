/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 记录操作表
 *
 * @author Mark sunlightcs@gmail.com
 */
@Data
@TableName("sys_record")
public class SysRecordEntity implements Serializable {

	@TableId
	private String id;

	private String pid;

	private Long creuser;

	private Long foruser;

	private Long user;

	private Date credate;

	private Long status;

	@TableField(exist=false)
	private String creusername;

	@TableField(exist=false)
	private String forusername;

	@TableField(exist=false)
	private String username;




}
