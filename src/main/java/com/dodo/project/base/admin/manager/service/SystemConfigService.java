package com.dodo.project.base.admin.manager.service;

import com.dodo.project.base.admin.dao.system.model.SystemConfig;

/* 
* @Description: 系统配置服务类
* @Author: walk_code walk_code@163.com
* @Param:  
* @return:   
* @Date: 2019/1/14 18:36
*/ 
public interface SystemConfigService {
	/* 
	* @Description: 获取系统配置 
	* @Author: walk_code walk_code@163.com
	* @Param: [] 
	* @return: com.dodo.project.base.admin.dao.system.model.SystemConfig  
	* @Date: 2019/1/14 18:37
	*/ 
	SystemConfig findSystemConfig();
	
	/* 
	* @Description:
	* @Author: walk_code walk_code@163.com
	* @Param: [] 
	* @return: boolean  
	* @Date: 2019/1/14 18:37
	*/ 
	boolean updateSystemConfig(SystemConfig systemConfig);
}
