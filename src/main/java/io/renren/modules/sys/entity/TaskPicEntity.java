/**
 * Copyright (c) 2016-2019 物业移动办公平台 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.sys.entity;

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
@TableName("task_pic")
public class TaskPicEntity implements Serializable {

	@TableId
	private String id;

	private String picname;

	private String path;

	private String pid;

}
