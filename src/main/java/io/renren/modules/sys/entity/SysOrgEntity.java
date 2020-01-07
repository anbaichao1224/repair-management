package io.renren.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 组织机构管理
 *
 * @author Mark sunlightcs@gmail.com
 */
@TableName("sys_org")
@Data
public class SysOrgEntity implements Serializable {

	/**
	 * 菜单ID
	 */
	@TableId
	private Long id;

	/**
	 * 父菜单ID，一级菜单为0
	 */
	private Long parentid;
	
	/**
	 * 父菜单名称
	 */
	@TableField(exist=false)
	private String parentname;

	/**
	 * 菜单名称
	 */
	private String name;

	/**
	 * 排序
	 */
	private Integer orderby;

	@TableField(exist=false)
	private Long userid;

	@TableField(exist=false)
	private String username;

	@TableField(exist=false)
	private String showname;

	/**
	 * ztree属性
	 */
	@TableField(exist=false)
	private Boolean open;

	@TableField(exist=false)
	private List<?> list;



	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getParentid() {
		return parentid;
	}

	public void setParentid(Long parentid) {
		this.parentid = parentid;
	}

	public String getParentname() {
		return parentname;
	}

	public void setParentname(String parentname) {
		this.parentname = parentname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getOrderby() {
		return orderby;
	}

	public void setOrderby(Integer orderby) {
		this.orderby = orderby;
	}

	public Boolean getOpen() {
		return open;
	}

	public void setOpen(Boolean open) {
		this.open = open;
	}

	public List<?> getList() {
		return list;
	}

	public void setList(List<?> list) {
		this.list = list;
	}

	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
}
