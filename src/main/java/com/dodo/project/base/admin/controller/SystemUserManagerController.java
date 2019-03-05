package com.dodo.project.base.admin.controller;

import com.dodo.project.base.admin.base.AbstractBaseAdminController;
import com.dodo.project.base.admin.dao.system.model.SystemUser;
import com.dodo.project.base.admin.dao.system.model.SystemUserGroup;
import com.dodo.project.base.admin.manager.service.SystemUserManagerService;
import com.dodo.project.base.exception.utils.AssertHelper;
import com.jfinal.plugin.activerecord.Page;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/*
 * <b>SystemUserManagerController</b></br>
 *
 * <pre>
 * 系统用户管理控制器
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/12/27 15:52
 * @Since JDK 1.8
 */
@RequestMapping("/systemUser")
@RestController
public class SystemUserManagerController extends AbstractBaseAdminController {
	@Resource
	private SystemUserManagerService systemUserManagerService;

	@RequestMapping(value = "/index")
	public void index() {
		renderJsp("/system/user/index");
	}

	@RequestMapping(value = "/getList")
	public void getList(int page) {
		Page<SystemUser> systemUserList = systemUserManagerService.getList(page);

		responseSuccess(systemUserList);
	}

	@RequestMapping(value = "/save")
	public void save(String data) {
		boolean result = systemUserManagerService.save(data);

		responseSuccess(result);
	}


	@RequestMapping(value = "/del")
	public void del(int id) {
		boolean result = systemUserManagerService.delSystemUser(id);

		responseSuccess(result);
	}

	@RequestMapping(value = "/getUserGroup")
	public void getUserGroup() {
		int                   systemUserId     = getParameterToInt("userId", 0);
		List<SystemUserGroup> systemUserGroups = systemUserManagerService.getSystemUserGroup(systemUserId);

		responseSuccess(systemUserGroups);
	}

	/*
	 * @Description: 是否启动
	 * @Author: walk_code walk_code@163.com
	 * @Param: [id, status]
	 * @return: void
	 * @Date: 2019/1/31 19:05
	 */
	@RequestMapping(value = "/enable")
	public void enable(String data) {
		boolean result = systemUserManagerService.changeSystemUserStatus(data);

		responseSuccess(result);
	}

	/*
	 * @Description: 修改用户密码
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: void
	 * @Date: 2019/2/11 17:41
	 */
	@RequestMapping(value = "/changePassword")
	public void changePassword(int id, String password) {
		boolean result = systemUserManagerService.changePassword(id, password);

		responseSuccess(result);
	}

}
