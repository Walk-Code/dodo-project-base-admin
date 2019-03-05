package com.dodo.project.base.admin.manager.service;

import com.dodo.project.base.admin.bean.SystemRoleBean;
import com.dodo.project.base.admin.bean.ZTreeNodeBean;
import com.dodo.project.base.admin.dao.system.model.SystemMenu;
import com.dodo.project.base.admin.dao.system.model.SystemRole;
import com.dodo.project.base.admin.dao.system.model.SystemUserGroup;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/*
 * @Description: 系统角色服务类
 * @Author: walk_code walk_code@163.com
 * @Param:
 * @return:
 * @Date: 2018/12/11 18:52getZTreeNodeBeanMenusList
 */
public interface SystemRolesManagerService {

	/*
	 * @Description: 获列表数据
	 * @Author: walk_code walk_code@163.com
	 * @Param: [page]
	 * @return: com.jfinal.plugin.activerecord.Page<com.dodo.project.base.admin.dao.system.model.SystemRole>
	 * @Date: 2018/12/11 18:47
	 */
	Page<SystemRole> getList(int page);

	/*
	 * @Description: 获取系统角色
	 * @Author: walk_code walk_code@163.com
	 * @Param: [id]
	 * @return: com.dodo.project.base.admin.dao.system.model.SystemRole
	 * @Date: 2018/12/11 18:48
	 */
	SystemRole findSystemRole(int id);

	/*
	 * @Description: 禁用角色
	 * @Author: walk_code walk_code@163.com
	 * @Param: [systemRole]
	 * @return: boolean
	 * @Date: 2018/12/11 18:50
	 */
	boolean disable(SystemRole systemRole);

	/*
	 * @Description: 删除角色
	 * @Author: walk_code walk_code@163.com
	 * @Param: [systemRole]
	 * @return: boolean
	 * @Date: 2018/12/11 18:51
	 */
	boolean delete(SystemRole systemRole);

	/*
	 * @Description: 保存用户角色
	 * @Author: walk_code walk_code@163.com
	 * @Param: [systemRole]
	 * @return: boolean
	 * @Date: 2018/12/12 19:36
	 */
	boolean save(SystemRole systemRole);

	/*
	 * @Description: 获取角色对应菜单列表
	 * @Author: walk_code walk_code@163.com
	 * @Param: [roleId]
	 * @return: java.util.List<com.dodo.project.base.admin.dao.system.model.SystemMenu>
	 * @Date: 2018/12/18 18:05
	 */
	List<SystemMenu> getAuthMenu(int roleId);

	/*
	 * @Description: 获取zTree菜单列表
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: java.util.List<com.dodo.project.base.admin.bean.ZTreeNodeBean>
	 * @Date: 2018/12/19 11:51
	 */
	List<ZTreeNodeBean> getZTreeNodeBeanMenusList(int roleId);

	/*
	 * @Description: 更新角色对应权限列表
	 * @Author: walk_code walk_code@163.com
	 * @Param: [data]
	 * @return: boolean
	 * @Date: 2018/12/22 16:51
	 */
	boolean updateRoleList(String data, int roleId);

	/*
	 * @Description: 获取用户组列表
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: java.util.List<com.dodo.project.base.admin.dao.system.model.SystemUserGroup>
	 * @Date: 2018/12/24 18:53
	 */
	List<SystemUserGroup> getSystemUserGroup();

	/*
	 * @Description: 获取系统角色信息
	 * @Author: walk_code walk_code@163.com
	 * @Param: [roleId]
	 * @return: com.dodo.project.base.admin.bean.SystemRoleBean
	 * @Date: 2018/12/25 11:15
	 */
	SystemRoleBean findSystemRoleBean(int roleId);

	/*
	 * @Description: 编辑用户角色
	 * @Author: walk_code walk_code@163.com
	 * @Param: [data]
	 * @return: boolean
	 * @Date: 2018/12/25 14:17
	 */
	boolean editSystemRole(String data);

	/*
	 * @Description: 禁用角色
	 * @Author: walk_code walk_code@163.com
	 * @Param: [roleId]
	 * @return: boolean
	 * @Date: 2018/12/25 18:43
	 */
	boolean changeRoleStatus(String role);
	
	/* 
	* @Description: 删除角色
	* @Author: walk_code walk_code@163.com
	* @Param: [roleId] 
	* @return: boolean  
	* @Date: 2018/12/26 16:30
	*/ 
	boolean delRole(int roleId);
}