package com.dodo.project.base.admin.controller;

import com.dodo.project.base.admin.base.AbstractBaseAdminController;
import com.dodo.project.base.admin.bean.MenuTreeNodeBean;
import com.dodo.project.base.admin.bean.SystemMenusExpandBean;
import com.dodo.project.base.admin.dao.system.model.SystemMenu;
import com.dodo.project.base.admin.manager.service.SystemMenusManagerService;
import com.dodo.project.base.exception.utils.AssertHelper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/*
 * <b>SystemMenusManagerController</b></br>
 *
 * <pre>
 * 系统菜单管理
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/11/26 19:17
 * @Since JDK 1.8
 */
@RestController
public class SystemMenusManagerController extends AbstractBaseAdminController {
	@Resource
	SystemMenusManagerService systemMenusManagerService;

	/*
	 * @Description: 系统菜单页面
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: void
	 * @Date: 2018/12/8 17:40
	 */
	@RequestMapping(value = "/system/menus")
	public void index() {
		renderJsp("system/menu/index");
	}

	/*
	 * @Description: 系统菜单列表数据
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: void
	 * @Date: 2018/12/8 17:41
	 */
	@RequestMapping(value = "/system/menus/getTreeDataList")
	public void getTreeDataList() {
		List<SystemMenusExpandBean> systemMenuList = systemMenusManagerService.getTreeDataList();

		responseSuccess(systemMenuList);
	}

	/*
	 * @Description: 添加菜单
	 * @Author: walk_code walk_code@163.com
	 * @Param: [systemMenu]
	 * @return: void
	 * @Date: 2018/12/8 17:41
	 */
	@RequestMapping(value = "/system/menus/addRoute")
	public void addRoute(SystemMenu systemMenu) {
		boolean result = systemMenusManagerService.addTreeDataItem(systemMenu);
		responseSuccess(result);
	}

	/*
	 * @Description: 获取菜单树json
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: void
	 * @Date: 2018/12/8 17:42
	 */
	@RequestMapping(value = "/system/menus/jsonTree")
	public void getJsonTree() {
		int    userId  = getParameterToInt("userId", 0);
		List<Map<String, Object>> jsonTree = systemMenusManagerService.getJsonTree(userId);

		responseSuccess(jsonTree);
	}

	/*
	 * @Description: 保存菜单json树
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: void
	 * @Date: 2018/12/8 17:44
	 */
	@RequestMapping(value = "/system/menus/saveJsonTree")
	public void saveJsonTree(String jsonTreeData) {
		boolean result = systemMenusManagerService.saveJsonTree(jsonTreeData);

		responseSuccess(result);
	}

	@RequestMapping(value = "/system/menus/disable")
	public void disableMenu(int menuId) {
		boolean result = systemMenusManagerService.disableMenu(menuId);

		responseSuccess(result);
	}

	@RequestMapping(value = "/system/editMenu")
	public void editMemu(int nodeId) {
		setAttr("nodeId", nodeId);

		renderJsp("system//menu/editMenu");
	}

	@RequestMapping(value = "/system/findMenu")
	public void findMenu(int nodeId) {
		SystemMenusExpandBean systemMenu = systemMenusManagerService.findSystemMenu(nodeId);
		AssertHelper.notNull(systemMenu, "数据不存在。");

		responseSuccess(systemMenu);
	}

	/*
	 * @Description: 编辑菜单
	 * @Author: walk_code walk_code@163.com
	 * @Param: [menuJson]
	 * @return: void
	 * @Date: 2019/1/12 15:05
	 */
	@RequestMapping(value = "/system/menu/edit")
	public void menuEdit(String menuJson) {
		boolean isSave = systemMenusManagerService.editMenu(menuJson);

		responseSuccess(isSave);
	}
}
