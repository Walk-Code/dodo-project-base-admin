package com.dodo.project.base.admin.controller;

import com.dodo.project.base.admin.base.AbstractBaseAdminController;
import com.dodo.project.base.admin.bean.AdminUserInfoBean;
import com.dodo.project.base.exception.utils.AssertHelper;
import com.dodo.project.base.exception.utils.JsonHelper;
import com.dodo.project.base.permissions.utils.AuthorizationHelp;
import com.dodo.project.base.web.controller.AbstractController;
import com.dodo.project.base.web.utils.DateHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/*
 * <b>IndexController</b></br>
 *
 * <pre>
 * 首页控制器
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/11/12 18:56
 * @Since JDK 1.8
 */
@RestController
public class IndexController extends AbstractBaseAdminController {
	@Resource
	private AuthorizationHelp authorizationHelp;

	private static final Logger log = LoggerFactory.getLogger(IndexController.class);

	@GetMapping(value = "/")
	public void index() {
		String menusJsonStr = JsonHelper.toJson(authorizationHelp.getMenuMoudleList());
		setAttr("menusList", menusJsonStr);
		setAttr("admin", getAdminLoginUser());
		setAttr("ip", getIp());
		setAttr("loginTime", DateHelper.getCurrentDateStr());

		AdminUserInfoBean adminUserInfoBean = authorizationHelp.getUserInfo(AdminUserInfoBean.class);
		setAttr("userInfo", adminUserInfoBean);
		renderJsp("home/adminLTE-main");
	}


	@GetMapping("/getUserPermissionList")
	public void getUserPermissionList() {
		List<String> permissionList = authorizationHelp.getPermissionList();

		responseSuccess(permissionList);
	}

	@GetMapping(value = "/index")
	public void welcome() {
		renderJsp("system/index/index");
	}
}
