package com.dodo.project.base.admin.controller;

import com.dodo.project.base.admin.base.AbstractBaseAdminController;
import com.dodo.project.base.admin.bean.SystemMenusExpandBean;
import com.dodo.project.base.admin.dao.system.model.SystemMenuNode;
import com.dodo.project.base.admin.manager.service.SystemMenusNodeManagerService;
import com.dodo.project.base.exception.utils.AssertHelper;
import com.dodo.project.base.exception.utils.JsonHelper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/*
 * <b>SystemMenusNodeManagerController</b></br>
 *
 * <pre>
 * 系统菜单节点管理类
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/12/19 16:27
 * @Since JDK 1.8
 */
@RequestMapping("/systenMenusNode")
@RestController
public class SystemMenusNodeManagerController extends AbstractBaseAdminController {
	@Resource
	SystemMenusNodeManagerService systemMenusNodeManagerService;


	@RequestMapping(value = "/index")
	public void index() {
		renderJsp("system/node/index");
	}

	@RequestMapping(value = "/getList")
	public void getList() {
		List<SystemMenusExpandBean> list = systemMenusNodeManagerService.getList();
		responseSuccess(list);
	}

	/*
	 * @Description: 修改角色权限列表
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: void
	 * @Date: 2018/12/22 15:04
	 */
	@RequestMapping(value = "/setUrlFeatures")
	public void setUrlFeatures(SystemMenuNode systemMenuNode) {
		boolean result = systemMenusNodeManagerService.setUrlFeatures(systemMenuNode);

		responseSuccess(result);
	}
}
