package com.dodo.project.base.admin.controller;

import com.dodo.project.base.admin.base.AbstractBaseAdminController;
import com.dodo.project.base.admin.bean.SystemRoleBean;
import com.dodo.project.base.admin.bean.ZTreeNodeBean;
import com.dodo.project.base.admin.dao.system.model.SystemRole;
import com.dodo.project.base.admin.dao.system.model.SystemUserGroup;
import com.dodo.project.base.admin.manager.service.SystemRolesManagerService;
import com.dodo.project.base.exception.utils.JsonHelper;
import com.jfinal.plugin.activerecord.Page;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/*
 * <b>SystemRolesManagerController</b></br>
 *
 * <pre>
 * 系统访问权限控制器
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/12/11 18:10
 * @Since JDK 1.8
 */
@RequestMapping(value = "/systemRoles")
@RestController
public class SystemRolesManagerController extends AbstractBaseAdminController {
	public static final Logger logger = LoggerFactory.getLogger(SystemRolesManagerController.class);

	@Resource
	private SystemRolesManagerService systemRolesManagerService;

	/*
	 * @Description: 访问权限页面
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: void
	 * @Date: 2018/12/11 18:44
	 */
	@RequestMapping("/index")
	public void index() {
		renderJsp("system/role/index");
	}

	@RequestMapping("/getList")
	public void getList() {
		int              page            = getParameterToInt("page", 1);
		Page<SystemRole> systemRolePages = systemRolesManagerService.getList(page);
		responseSuccess(systemRolePages);
	}

	@RequestMapping("/save")
	public void save(String role) {
		SystemRole systemRole = JsonHelper.parse(role, SystemRole.class);
		boolean    result     = systemRolesManagerService.save(systemRole);
		responseSuccess(result);
	}

	/*
	 * @Description: 获取授权列表
	 * @Author: walk_code walk_code@163.com
	 * @Param: [roleId]
	 * @return: void
	 * @Date: 2018/12/18 18:02
	 */
	@RequestMapping("/auth")
	public void authorizationIndex(int roleId) {
		setAttr("roleId", roleId);
		renderJsp("system/role/auth");
	}

	/*
	 * @Description: 获取该角色对应的所有节点列表
	 * @Author: walk_code walk_code@163.com
	 * @Param: [roleId]
	 * @return: void
	 * @Date: 2019/1/8 16:34
	 */
	@RequestMapping("/getAuthList")
	public void getAuthList(int roleId) {
		List<ZTreeNodeBean> list = systemRolesManagerService.getZTreeNodeBeanMenusList(roleId);
		responseSuccess(list);
	}

	/*
	 * @Description: 更新用户权限列表
	 * @Author: walk_code walk_code@163.com
	 * @Param: [data]
	 * @return: void
	 * @Date: 2018/12/22 16:50
	 */
	@RequestMapping("/updateAuthList")
	public void updateAuthList(String data, int roleId) {
		boolean result = systemRolesManagerService.updateRoleList(data, roleId);
		responseSuccess(result);
	}

	@RequestMapping(value = "/edit")
	public void edit(int roleId) {
		setAttr("roleId", roleId);
		renderJsp("system/role/editRole");
	}

	@RequestMapping(value = "/findSystemRole")
	public void findSystemRole(int roleId) {
		SystemRoleBean systemRoleBean = systemRolesManagerService.findSystemRoleBean(roleId);

		responseSuccess(systemRoleBean);
	}

	@RequestMapping(value = "/editSystemRole")
	public void editSystemRole(String data) {
		boolean result = systemRolesManagerService.editSystemRole(data);

		responseSuccess(result);
	}


	@RequestMapping(value = "/useGroupList")
	public void getGroupList() {
		List<SystemUserGroup> systemUserGroups = systemRolesManagerService.getSystemUserGroup();

		responseSuccess(systemUserGroups);
	}

	@RequestMapping(value = "/changeRoleStatus")
	public void changeRoleStatus(String role) {
		boolean result = systemRolesManagerService.changeRoleStatus(role);

		responseSuccess(result);
	}

	@RequestMapping(value = "/delRole")
	public void delRole(int roleId) {
		boolean result = systemRolesManagerService.delRole(roleId);

		responseSuccess(result);
	}
}
