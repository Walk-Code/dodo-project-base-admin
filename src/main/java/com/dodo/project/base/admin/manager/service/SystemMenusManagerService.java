package com.dodo.project.base.admin.manager.service;

import com.dodo.project.base.admin.bean.MenuTreeNodeBean;
import com.dodo.project.base.admin.bean.SystemMenusExpandBean;
import com.dodo.project.base.admin.bean.ZTreeNodeBean;
import com.dodo.project.base.admin.dao.system.model.SystemMenu;

import java.util.List;
import java.util.Map;

/*
 * @Description: 系统菜单服务类
 * @Author: walk_code walk_code@163.com
 * @Param:
 * @return:
 * @Date: 2018/11/30 10:04
 */
public interface SystemMenusManagerService {
	/*
	 * @Description: 获取菜单树数据
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: java.util.List<com.dodo.project.base.admin.dao.system.model.SystemMenu>
	 * @Date: 2018/11/30 11:43
	 */
	List<SystemMenusExpandBean> getTreeDataList();

	/*
	 * @Description: 添加菜单
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: boolean
	 * @Date: 2018/11/30 14:05
	 */
	boolean addTreeDataItem(SystemMenu systemMenu);

	/*
	 * @Description: 获取系统菜单列表
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: java.util.List<java.util.Map<java.lang.String,java.lang.Object>>
	 * @Date: 2018/12/3 16:05
	 */
	List<Map<String, Object>> getJsonTree(int userId);

	/*
	 * @Description: 保存菜单json Tree树
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: boolean
	 * @Date: 2018/12/8 17:44
	 */
	boolean saveJsonTree(String jsonTreeData);

	/*
	 * @Description: 获取菜单详情
	 * @Author: walk_code walk_code@163.com
	 * @Param: [id]
	 * @return: com.dodo.project.base.admin.dao.system.model.SystemMenu
	 * @Date: 2018/12/11 14:59
	 */
	SystemMenusExpandBean findSystemMenu(int id);

	/*
	 * @Description: 编辑菜单
	 * @Author: walk_code walk_code@163.com
	 * @Param: [menuJson]
	 * @return: boolean
	 * @Date: 2018/12/11 17:32
	 */
	boolean editMenu(String menuJson);

	/*
	 * @Description: 禁用菜单
	 * @Author: walk_code walk_code@163.com
	 * @Param: [menuId]
	 * @return: boolean
	 * @Date: 2019/1/12 15:09
	 */
	boolean disableMenu(int menuId);
}
