package com.dodo.project.base.admin.manager.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.dodo.project.base.admin.bean.MenuTreeNodeBean;
import com.dodo.project.base.admin.bean.SystemMenusExpandBean;
import com.dodo.project.base.admin.config.SystemDbConfiguration;
import com.dodo.project.base.admin.dao.system.model.SystemMenu;
import com.dodo.project.base.admin.dao.system.model.SystemMenuNode;
import com.dodo.project.base.admin.dao.system.service.SystemMenuDaoService;
import com.dodo.project.base.admin.dao.system.service.SystemMenuNodeDaoService;
import com.dodo.project.base.admin.manager.service.SystemMenusManagerService;
import com.dodo.project.base.admin.utils.TreeToolHelper;
import com.dodo.project.base.dao.jfinal.annotation.JFinalORMTransaction;
import com.dodo.project.base.dao.jfinal.utils.JFinalORMConvertDTOHelper;
import com.dodo.project.base.exception.utils.AssertHelper;
import com.dodo.project.base.exception.utils.JsonHelper;
import com.jfinal.plugin.activerecord.Record;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/*
 * <b>SystemMenusManagerServiceImpl</b></br>
 *
 * <pre>
 * 系统菜单服务实现类
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/11/30 14:05
 * @Since JDK 1.8
 */
@Service
public class SystemMenusManagerServiceImpl implements SystemMenusManagerService {
	@Resource
	private SystemMenuDaoService systemMenuDaoService;

	@Resource
	private SystemMenuNodeDaoService systemMenuNodeDaoService;

	public static final Logger log = LoggerFactory.getLogger(SystemMenusManagerServiceImpl.class);

	@Override
	public List<SystemMenusExpandBean> getTreeDataList() {
		List<SystemMenu>            systemMenuList    = systemMenuDaoService.getEnableSystemMenu();
		List<SystemMenusExpandBean> enableSystemMenus = JFinalORMConvertDTOHelper.modelListToBeanList(systemMenuList, SystemMenusExpandBean.class);
		List<Map<String, Object>>   list              = TreeToolHelper.builtTree(enableSystemMenus);

		String treeJson = JsonHelper.toJson(list);
		List<MenuTreeNodeBean> menuTreeNodeBeans = JSON.parseObject(treeJson, new TypeReference<List<MenuTreeNodeBean>>() {
		});
		TreeToolHelper.dealDataWithSelectBox(menuTreeNodeBeans, 0);
		List<SystemMenusExpandBean> systemMenus = new ArrayList<>();
		createSystemMenu(menuTreeNodeBeans, systemMenus);

		// root 菜单
		SystemMenusExpandBean root = new SystemMenusExpandBean();
		root.setId(0);
		root.setPid(-1);
		root.setTitle("Root");
		root.setUrl("/");
		root.setIcon("");
		root.setSeparator("");
		systemMenus.add(0, root);

		return systemMenus;
	}

	@JFinalORMTransaction(dbConfigName = SystemDbConfiguration.DB_CONFIG_NAME)
	@Override
	public boolean addTreeDataItem(SystemMenu systemMenu) {
		// 校验url中存在//
		String currentUrl = systemMenu.getUrl().replace("//", "/");
		systemMenu.setUrl(currentUrl);
		// 校验url前是否带有/
		if (!systemMenu.getUrl().startsWith("/")) {
			String url = "/" + systemMenu.getUrl();
			systemMenu.setUrl(url);
		}

		boolean result = systemMenuDaoService.save(systemMenu);
		AssertHelper.isTrue(result, "添加路由失败。");
		SystemMenuNode menuNode = new SystemMenuNode();
		menuNode.setMenuId(systemMenu.getId());

		return systemMenuNodeDaoService.save(menuNode);
	}

	@Override
	public List<Map<String, Object>> getJsonTree(int userId) {
		List<SystemMenu>            systemMenus       = systemMenuDaoService.getEnableSystemMenuNoNode(userId);
		List<SystemMenusExpandBean> enableSystemMenus = JFinalORMConvertDTOHelper.modelListToBeanList(systemMenus, SystemMenusExpandBean.class);

		return TreeToolHelper.builtTree(enableSystemMenus);
	}

	@Override
	public boolean saveJsonTree(String jsonTreeData) {
		List<MenuTreeNodeBean> menuTreeNodeBeans = JSON.parseObject(jsonTreeData, new TypeReference<List<MenuTreeNodeBean>>() {
		});

		for (MenuTreeNodeBean menuTreeNodeBean : menuTreeNodeBeans) {
			menuTreeNodeBean.setPid(0);
		}

		dealData(menuTreeNodeBeans);

		saveSystemMenus(menuTreeNodeBeans);
		return true;
	}

	@Override
	public SystemMenusExpandBean findSystemMenu(int id) {
		Record systemMenu = systemMenuDaoService.findSystemMenu(id);

		return JFinalORMConvertDTOHelper.recordToBean(systemMenu, SystemMenusExpandBean.class);
	}

	@Override
	public boolean editMenu(String menuJson) {
		SystemMenusExpandBean systemMenu   = JsonHelper.parse(menuJson, SystemMenusExpandBean.class);
		SystemMenu            dbSystemMenu = systemMenuDaoService.findById(SystemMenu.class, systemMenu.getId());
		boolean               isOldData    = systemMenu.getUpdateTime().compareTo(dbSystemMenu.getUpdateTime()) == 0;
		AssertHelper.isTrue(isOldData, "数据发生变化，请刷新页面。");

		dbSystemMenu.setTitle(systemMenu.getTitle());
		dbSystemMenu.setPid(systemMenu.getPid());
		dbSystemMenu.setIcon(systemMenu.getIcon());
		dbSystemMenu.setUrl(systemMenu.getUrl());

		return systemMenuDaoService.save(dbSystemMenu);
	}

	@Override
	public boolean disableMenu(int menuId) {
		SystemMenu dbSystemMenu = systemMenuDaoService.findById(SystemMenu.class, menuId);
		AssertHelper.notNull(dbSystemMenu, "数据发生改变，请刷新页面。");
		dbSystemMenu.setStatus(false);

		return systemMenuDaoService.save(dbSystemMenu);
	}

	/*
	 * @Description: 处理提交过来json Tree
	 * @Author: walk_code walk_code@163.com
	 * @Param: [list]
	 * @return: java.util.List<com.dodo.project.base.admin.bean.MenuTreeNodeBean>
	 * @Date: 2018/12/8 18:00
	 */
	private List<MenuTreeNodeBean> dealData(List<MenuTreeNodeBean> list) {
		Iterator it = list.iterator();
		while (it.hasNext()) {
			MenuTreeNodeBean       menuTreeNodeBean = (MenuTreeNodeBean) it.next();
			List<MenuTreeNodeBean> childs           = menuTreeNodeBean.getChildren();

			for (MenuTreeNodeBean menuTreeNodeBean1 : childs) {
				menuTreeNodeBean1.setPid(menuTreeNodeBean.getId());
			}

			if (childs.size() > 0) {
				dealData(childs);
			}
		}

		return list;
	}

	/*
	 * @Description: 保存系统菜单
	 * @Author: walk_code walk_code@163.com
	 * @Param: [menuTreeNodeBeans]
	 * @return: void
	 * @Date: 2018/12/8 19:01
	 */
	private void saveSystemMenus(List<MenuTreeNodeBean> menuTreeNodeBeans) {
		Iterator iterator = menuTreeNodeBeans.iterator();
		while (iterator.hasNext()) {
			MenuTreeNodeBean       menuTreeNodeBean = (MenuTreeNodeBean) iterator.next();
			List<MenuTreeNodeBean> childs           = menuTreeNodeBean.getChildren();
			SystemMenu             systemMenu       = new SystemMenu();
			systemMenu.setId(menuTreeNodeBean.getId());
			systemMenu.setPid(menuTreeNodeBean.getPid());
			boolean result = systemMenuDaoService.save(systemMenu);
			AssertHelper.isTrue(result, "菜单保存失败。");

			if (childs.size() > 0) {
				saveSystemMenus(childs);
			}
		}
	}

	/*
	 * @Description: 处理dealDataWithSelectBox后的数据，拼接成List<SystemMenu>
	 * @Author: walk_code walk_code@163.com
	 * @Param: [systemMenus, systems]
	 * @return: void
	 * @Date: 2018/12/10 19:39
	 */
	private void createSystemMenu(List<MenuTreeNodeBean> systemMenus, List<SystemMenusExpandBean> systems) {
		Iterator iterator = systemMenus.iterator();
		while (iterator.hasNext()) {
			MenuTreeNodeBean       menuTreeNodeBean = (MenuTreeNodeBean) iterator.next();
			List<MenuTreeNodeBean> childrens        = menuTreeNodeBean.getChildren();

			if (menuTreeNodeBean.getPid() >= 0) {
				SystemMenusExpandBean systemMenu = new SystemMenusExpandBean();
				systemMenu.setPid(menuTreeNodeBean.getPid());
				systemMenu.setId(menuTreeNodeBean.getId());
				systemMenu.setTitle(menuTreeNodeBean.getText());
				systemMenu.setSeparator(menuTreeNodeBean.getSeparator());
				systems.add(systemMenu);
			}

			if (childrens.size() > 0) {
				createSystemMenu(childrens, systems);
			}
		}
	}
}
