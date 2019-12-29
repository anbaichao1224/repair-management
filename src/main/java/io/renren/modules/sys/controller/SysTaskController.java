package io.renren.modules.sys.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.renren.common.annotation.SysLog;
import io.renren.common.exception.RRException;
import io.renren.common.utils.R;
import io.renren.modules.oss.cloud.OSSFactory;
import io.renren.modules.oss.entity.SysOssEntity;
import io.renren.modules.sys.entity.*;
import io.renren.modules.sys.service.SysOrgService;
import io.renren.modules.sys.service.SysRecordService;
import io.renren.modules.sys.service.SysTaskService;
import io.renren.modules.sys.service.TaskPicService;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 组织结构管理
 *
 * @author Mark sunlightcs@gmail.com
 */
@RestController
@RequestMapping("/sys/task")
public class SysTaskController extends AbstractController {

	@Autowired
	private SysTaskService sysTaskService;

	@Autowired
	private SysRecordService sysRecordService;

	@Autowired
	private TaskPicService taskPicService;

	@Value("${task.uploadFolder}")
	private String uploadFolder;

	@Value("${task.staticAccessPath}")
	private String staticAccessPath;


	/**
	 * 所有组织结构列表
	 */
	@PostMapping("/list")
	//@RequiresPermissions("sys:task:list")
	public R list(@RequestBody Map<String,Object> params){
		Page<SysTaskEntity> taskEntityPage = sysTaskService.queryTaskPage(params);
		return  R.ok().put("page",taskEntityPage);
	}


	@PostMapping("info")
	public R info(@RequestBody Map<String,Object> params){
		try {
			SysTask sysTask = new SysTask();

			SysTaskEntity sysTaskEntity = sysTaskService.getTaskEntity(params);
			sysTask.setSysTaskEntity(sysTaskEntity);

			List<TaskPicEntity> picList = taskPicService.getTaskPic(params);
			sysTask.setPicList(picList);

			return R.ok().put("task",sysTask);
		}catch (Exception e){
			e.printStackTrace();
			return R.error(1,"获取录入信息出错!");
		}
	}

	@PostMapping("saveTask")
	public R saveTask(@RequestBody SysTask systask){
		try {

			//获取任务
			SysTaskEntity sysTaskEntity = systask.getSysTaskEntity();
			sysTaskEntity.setId(UUID.randomUUID().toString());

			sysTaskService.saveTaskEntity(sysTaskEntity);
			//获取照片
			List<TaskPicEntity> picEntityList = systask.getPicList();
			picEntityList.forEach(taskPicEntity -> {
				taskPicEntity.setId(UUID.randomUUID().toString());
				taskPicEntity.setPid(sysTaskEntity.getId());
			});

			taskPicService.savePic(picEntityList);

			//新建记录表
			SysRecordEntity sysRecordEntity = new SysRecordEntity();
			sysRecordEntity.setId(UUID.randomUUID().toString());
			sysRecordEntity.setPid(sysTaskEntity.getId());
			sysRecordEntity.setCreuser(sysTaskEntity.getCreuserid());
			sysRecordEntity.setUser(sysTaskEntity.getCreuserid());
			sysRecordEntity.setForuser(sysTaskEntity.getAssigner());
			sysRecordEntity.setStatus(0L);
			sysRecordService.saveRecord(sysRecordEntity);

			return R.ok();
		}catch (Exception e){
			e.printStackTrace();
			return R.error(1,"保存任务出错！");
		}
	}


	@PostMapping("/updateTask")
	public R updateTask(@RequestBody SysTask systask){
		try {
			//获取任务
			SysTaskEntity sysTaskEntity = systask.getSysTaskEntity();

			sysTaskService.updateTaskEntity(sysTaskEntity);

			Map<String,Object> params = new HashMap<>();
			params.put("id",sysTaskEntity.getId());
			taskPicService.deletePic(sysTaskEntity.getId());

			//获取照片
			List<TaskPicEntity> picEntityList = systask.getPicList();
			if(picEntityList.size()>0){
                picEntityList.forEach(taskPicEntity -> {
                    taskPicEntity.setId(UUID.randomUUID().toString());
                    taskPicEntity.setPid(sysTaskEntity.getId());
                });
                taskPicService.savePic(picEntityList);
            }


			//新建记录表
			SysRecordEntity sysRecordEntity = new SysRecordEntity();
			sysRecordEntity.setId(UUID.randomUUID().toString());
			sysRecordEntity.setPid(sysTaskEntity.getId());
			sysRecordEntity.setCreuser(sysTaskEntity.getCreuserid());
			sysRecordEntity.setUser(sysTaskEntity.getCreuserid());
			sysRecordEntity.setForuser(sysTaskEntity.getAssigner());
			sysRecordEntity.setStatus(1L);
			sysRecordService.saveRecord(sysRecordEntity);

			return R.ok();
		}catch (Exception e){
			e.printStackTrace();
			return R.error(1,"更新任务出错!");
		}
	}


	@PostMapping("/delete/{id}")
	public R delete(@PathVariable("id") String id){
		try {
			sysTaskService.deleteTaskEntity(id);
			return R.ok();
		}catch (Exception e){
			e.printStackTrace();
			return R.error(1,"删除任务出错!");
		}
	}



	/**
	 * 上传文件
	 */
	@PostMapping("/upload")
	public R upload(@RequestParam("file") MultipartFile file,HttpServletRequest request) throws Exception {

		if (file.isEmpty()) {
			throw new RRException("上传文件不能为空");
		}

		//上传文件
		String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		String url = uploads(file,request);
		return R.ok().put("url", url);
	}


	/**
	 * * 图片上传
     * @param multipartFiles
     * @param request
     * @return
			 */
	public String uploads(MultipartFile multipartFiles, HttpServletRequest request){
		//以“,”分割拼接文件的地址
		String thumn = "";
		//文件的个数
		try {
			//获取服务器的地址
			//request.getRequestURI().toString();
			String path = uploadFolder;
			//String path = "E:/imageSource/upload/img/";
			//文件保存的路径
			File filePath = new File(path);
			System.out.println("文件保存的路径为："+filePath);
			//判断filePath是否存在
			if(!filePath.exists() && !filePath.isDirectory()){
				//filePath目录不存在，需要创建
				filePath.mkdirs();
			}
				//获取文件的原始名称（带格式）
				String originalFileName = multipartFiles.getOriginalFilename();
				//获取文件的类型
				String type = originalFileName.substring(originalFileName.lastIndexOf(".")+1);
				//获取文件名（不带格式）
				String name = originalFileName.substring(0,originalFileName.lastIndexOf("."));
				//生成新的文件名
				SimpleDateFormat smp = new SimpleDateFormat("yyyyMMddHHmmss");
				Date date = new Date();
				String dates =smp.format(date).toString();
				String fileName = dates + name + "." + type;
				//在指定路径下创建一个文件
				File targetFile = new File(path,fileName);
				//将文件保存到服务器
				multipartFiles.transferTo(targetFile);
				//拼接文件地址
			    thumn += "http://localhost:223/renren-fast/image/" + fileName;
			    System.out.println(thumn);
		} catch (IOException e) {//文件上传失败
			e.printStackTrace();
		}
		return thumn;
	}


}
