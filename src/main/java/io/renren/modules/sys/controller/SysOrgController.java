package io.renren.modules.sys.controller;

import io.renren.common.annotation.SysLog;
import io.renren.common.exception.RRException;
import io.renren.common.utils.R;
import io.renren.modules.sys.entity.SysOrgEntity;
import io.renren.modules.sys.service.SysOrgService;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 组织结构管理
 *
 * @author Mark sunlightcs@gmail.com
 */
@RestController
@RequestMapping("/sys/org")
public class SysOrgController extends AbstractController {

	@Autowired
	private SysOrgService sysOrgService;

	/**
	 * 所有组织结构列表
	 */
	@GetMapping("/list")
	@RequiresPermissions("sys:org:list")
	public List<SysOrgEntity> list(){
		List<SysOrgEntity> orgList = sysOrgService.list();
		for(SysOrgEntity sysOrgEntity : orgList){
			SysOrgEntity parentOrgEntity = sysOrgService.getById(sysOrgEntity.getParentid());
			if(parentOrgEntity != null){
				sysOrgEntity.setParentname(parentOrgEntity.getName());
			}
		}
		return orgList;
	}
	
	/**
	 * 选择菜单(添加、修改菜单)
	 */
	@GetMapping("/select")
	@RequiresPermissions("sys:org:select")
	public R select(){
		//查询列表数据
		List<SysOrgEntity> orgList = sysOrgService.list();

		SysOrgEntity root = new SysOrgEntity();
		root.setId(0L);
		root.setName("经理级");
		root.setParentid(-1L);
		orgList.add(root);
		return R.ok().put("orgList",orgList);

	}


	/**
	 * 选择菜单(添加、修改菜单)
	 */
	@GetMapping("/selectByTask")
	public R selectByTask(){

		//查询列表数据
		List<SysOrgEntity> orgList = sysOrgService.queryList();
		return R.ok().put("orgList",orgList);

	}
	
	/**
	 * 组织机构信息
	 */
	@GetMapping("/info/{id}")
	@RequiresPermissions("sys:org:info")
	public R info(@PathVariable("id") Long id){
		try {
			SysOrgEntity orgEntity = sysOrgService.getById(id);
			return R.ok().put("org", orgEntity);
		}catch (Exception e){
			return R.error(1,"获取组织机构详情出错!");
		}

	}
	
	/**
	 * 保存
	 */
	@SysLog("保存组织机构")
	@PostMapping("/save")
	@RequiresPermissions("sys:org:save")
	public R save(@RequestBody SysOrgEntity orgEntity){
		//数据校验
		verifyForm(orgEntity);
		sysOrgService.save(orgEntity);
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@SysLog("修改组织机构")
	@PostMapping("/update")
	@RequiresPermissions("sys:org:update")
	public R update(@RequestBody SysOrgEntity sysOrgEntity){
		//数据校验
		verifyForm(sysOrgEntity);

		sysOrgService.updateById(sysOrgEntity);

		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@SysLog("删除菜单")
	@PostMapping("/delete/{id}")
	@RequiresPermissions("sys:org:delete")
	public R delete(@PathVariable("id") long id){
		try {
			//判断是否有子菜单或按钮
			List<SysOrgEntity> orgEntityList = sysOrgService.queryListParentId(id);
			if(orgEntityList.size() > 0){
				return R.error("请先删除子组织机构");
			}
			sysOrgService.delete(id);
			return R.ok();
		}catch (Exception e){
			e.printStackTrace();
			return R.error("删除组织机构出错!");
		}
	}
	
	/**
	 * 验证参数是否正确
	 */
	private void verifyForm(SysOrgEntity orgEntity){
		if(StringUtils.isBlank(orgEntity.getName())){
			throw new RRException("组织机构名称不能为空");
		}
		
		if(orgEntity.getParentid() == null){
			throw new RRException("上级组织机构不能为空");
		}

	}
}
