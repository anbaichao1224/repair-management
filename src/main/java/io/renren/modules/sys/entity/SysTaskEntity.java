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

/**
 * 系统用户
 *
 * @author Mark sunlightcs@gmail.com
 */
@Data
@TableName("sys_task")
public class SysTaskEntity implements Serializable {

	@TableId
	private String id;

	private String title;  //标题

	private String taskdate;  //上报日期

	private String position;  //位置

	private String desc; //情况描述

	private Long types;//报修分类 1 房产 2 电力 3 水暖 4 其他

	private String creuser; //上报人姓名

	private String cremobile; //上报人电话

	private Long creuserid; //上报人id

	private Long org; //维修所在群组

	private Long assigner; //维修人

	private Long status; //状态 0 待分配 1 以分配 2待处理 3以处理

	private String credate;

	@TableField(exist=false)
	private String orgname;

	@TableField(exist=false)
	private String assignername;


}
