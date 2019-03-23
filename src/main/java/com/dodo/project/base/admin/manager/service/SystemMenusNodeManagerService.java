package com.dodo.project.base.admin.manager.service;

import com.dodo.project.base.admin.bean.SystemMenusExpandBean;
import com.dodo.project.base.admin.dao.system.model.SystemMenuNode;

import java.util.List;

/*
 * <b>SystemMenusNodeManagerService</b></br>
 *
 * <pre>
 * 系统菜单节点管理服务类
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/12/19 17:05
 * @Since JDK 1.8
 */
public interface SystemMenusNodeManagerService {
	/* 
	* @Description: 获取菜单所有节点
	* @Author: walk_code walk_code@163.com
	* @Param: [] 
	* @return: java.util.List<com.dodo.project.base.admin.bean.SystemMenusExpandBean>  
	* @Date: 2018/12/19 17:15
	*/ 
	List<SystemMenusExpandBean> getList();
	
	/* 
	* @Description: 修改节点功能
	* @Author: walk_code walk_code@163.com
	* @Param: [id, type] 
	* @return: boolean  
	* @Date: 2019/3/21 20:48
	*/ 
	boolean setUrlFeatures(SystemMenuNode systemMenuNode);
}
