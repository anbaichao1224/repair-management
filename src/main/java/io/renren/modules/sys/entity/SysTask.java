/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.sys.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 记录操作表
 *
 * @author Mark sunlightcs@gmail.com
 */
@Data
public class SysTask implements Serializable {

	private SysTaskEntity sysTaskEntity;

	private List<TaskPicEntity> picList;

}
