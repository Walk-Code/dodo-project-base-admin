package com.dodo.project.base.admin.controller;

import com.dodo.project.base.admin.base.AbstractBaseAdminController;
import com.dodo.project.base.admin.bean.AdminUserInfoBean;
import com.dodo.project.base.admin.bean.SystemRoleGroupBean;
import com.dodo.project.base.admin.bean.SystemUserGroupBean;
import com.dodo.project.base.admin.dao.system.model.SystemRole;
import com.dodo.project.base.admin.dao.system.model.SystemUser;
import com.dodo.project.base.admin.dao.system.model.SystemUserGroup;
import com.dodo.project.base.admin.manager.service.SystemUserGroupManagerService;
import com.dodo.project.base.dao.jfinal.utils.JFinalORMConvertDTOHelper;
import com.jfinal.plugin.activerecord.Page;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/*
 * <b>SystemUserGroupManagerController</b></br>
 *
 * <pre>
 * 用户组管理控制器
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/12/24 10:22
 * @Since JDK 1.8
 */
@RequestMapping("/systemUserGroup")
@RestController
public class SystemUserGroupManagerController extends AbstractBaseAdminController {
	@Resource
	private SystemUserGroupManagerService systemUserGroupManagerService;

	@RequestMapping(value = "/index")
	public void index() {
		renderJsp("/system/userGroup/index");
	}

	@RequestMapping(value = "/getList")
	public void getList() {
		int                   page                = getParameterToInt("page");
		Page<SystemUserGroup> systemUserGroupList = systemUserGroupManagerService.getList(page);

		responseSuccess(systemUserGroupList);
	}

	@RequestMapping(value = "/save")
	public void save(String data) {
		boolean result = systemUserGroupManagerService.save(data);

		responseSuccess(result);
	}


	@RequestMapping(value = "/del")
	public void del(int id) {
		boolean result = systemUserGroupManagerService.del(id);

		responseSuccess(result);
	}

	@RequestMapping(value = "/addUser/index")
	public void addUser(int userGroupId) {
		setAttr("groupId", userGroupId);
		renderJsp("system/userGroup/addUser");
	}

	@RequestMapping(value = "/getUserFromGroup")
	public void getUserFromGroup(int userGroupId) {
		SystemUserGroupBean systemUsers = systemUserGroupManagerService.getUserFromGroup(userGroupId);

		responseSuccess(systemUsers);
	}

	@RequestMapping(value = "/getUserList")
	public void getUserList() {
		List<SystemUser>        systemUsers        = systemUserGroupManagerService.getUserList();
		List<AdminUserInfoBean> adminUserInfoBeans = JFinalORMConvertDTOHelper.modelListToBeanList(systemUsers, AdminUserInfoBean.class);

		responseSuccess(adminUserInfoBeans);
	}

	@RequestMapping(value = "/addUserToGroup")
	public void addUserToGroup(int groupId, int userId) {
		boolean result = systemUserGroupManagerService.addUserToGroup(groupId, userId);

		responseSuccess(result);
	}

	@RequestMapping(value = "/removeUserToGroup")
	public void removeUserToGroup(int groupId, int userId) {
		boolean result = systemUserGroupManagerService.removeUserToGroup(groupId, userId);

		responseSuccess(result);
	}

	@RequestMapping(value = "/getRoleList")
	public void getRoleList() {
		List<SystemRole> systemRoles = systemUserGroupManagerService.getRoleList();

		responseSuccess(systemRoles);
	}


	@RequestMapping(value = "/addRole/index")
	public void addRole(int userGroupId) {
		setAttr("groupId", userGroupId);
		renderJsp("system/userGroup/addRole");
	}

	@RequestMapping(value = "/getRoleFromGroup")
	public void getRoleFromGroup(int userGroupId) {
		SystemRoleGroupBean systemRoles = systemUserGroupManagerService.getRoleFromGroup(userGroupId);

		responseSuccess(systemRoles);
	}

	@RequestMapping(value = "/addRoleToGroup")
	public void addRoleToGroup(int groupId, int roleId) {
		boolean result = systemUserGroupManagerService.addRoleToGroup(groupId, roleId);

		responseSuccess(result);
	}

	@RequestMapping(value = "/removeRoleToGroup")
	public void removeRoleToGroup(int groupId, int roleId) {
		boolean result = systemUserGroupManagerService.removeRoleToGroup(groupId, roleId);

		responseSuccess(result);
	}


}
