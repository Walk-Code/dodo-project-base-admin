package com.dodo.project.base.admin.manager.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.dodo.project.base.admin.bean.MenuTreeNodeBean;
import com.dodo.project.base.admin.bean.SystemMenusExpandBean;
import com.dodo.project.base.admin.dao.system.model.SystemMenu;
import com.dodo.project.base.admin.dao.system.model.SystemMenuNode;
import com.dodo.project.base.admin.dao.system.service.SystemMenuDaoService;
import com.dodo.project.base.admin.dao.system.service.SystemMenuNodeDaoService;
import com.dodo.project.base.admin.manager.service.SystemMenusNodeManagerService;
import com.dodo.project.base.admin.utils.TreeToolHelper;
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
 * <b>SystemMenusNodeManagerServiceImp</b></br>
 *
 * <pre>
 *  获取菜单所有节点实现类
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/12/19 17:15
 * @Since JDK 1.8
 */
@Service
public class SystemMenusNodeManagerServiceImpl implements SystemMenusNodeManagerService {
	private static final Logger log = LoggerFactory.getLogger(SystemMenusNodeManagerServiceImpl.class);

	@Resource
	private SystemMenuDaoService systemMenuDaoService;

	@Resource
	private SystemMenuNodeDaoService systemMenuNodeDaoService;

	@Override
	public List<SystemMenusExpandBean> getList() {
		List<Record>                records           = systemMenuDaoService.getEnableSystemNode();
		List<SystemMenusExpandBean> enableSystemMenus = JFinalORMConvertDTOHelper.recordListToBeanList(records, SystemMenusExpandBean.class);
		List<Map<String, Object>>   list              = TreeToolHelper.builtTree(enableSystemMenus);
		String                      treeJson          = JsonHelper.toJson(list);
		List<MenuTreeNodeBean> menuTreeNodeBeans = JSON.parseObject(treeJson, new TypeReference<List<MenuTreeNodeBean>>() {
		});

		TreeToolHelper.dealDataWithSelectBox(menuTreeNodeBeans, 0);
		List<SystemMenusExpandBean> systemMenus = new ArrayList<>();
		createSystemMenu(menuTreeNodeBeans, systemMenus);

		return systemMenus;
	}

	@Override
	public boolean setUrlFeatures(SystemMenuNode systemMenuNode) {
		SystemMenu menu = systemMenuDaoService.findById(SystemMenu.class, systemMenuNode.getMenuId());
		AssertHelper.notNull(menu, "节点数据发生改变，请刷新页面。");

		return systemMenuNodeDaoService.updateNode(systemMenuNode.getMenuId(), systemMenuNode.getIsAuth(), systemMenuNode.getIsMenu());
	}


	/*
	 * @Description: 处理dealDataWithSelectBox后的数据，拼接成List<SystemMenu>
	 * @Author: walk_code walk_code@163.com
	 * @Param: [systemMenus, systems]
	 * @return: void
	 * @Date: 2018/12/10 19:39
	 */
	public static void createSystemMenu(List<MenuTreeNodeBean> systemMenus, List<SystemMenusExpandBean> systems) {
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
				systemMenu.setUrl(menuTreeNodeBean.getUrl());
				systemMenu.setAuth(menuTreeNodeBean.isAuth());
				systemMenu.setMenu(menuTreeNodeBean.isMenu());
				systemMenu.setUpdateTime(menuTreeNodeBean.getUpdateTime());
				systems.add(systemMenu);
			}

			if (childrens.size() > 0) {
				createSystemMenu(childrens, systems);
			}
		}
	}
}
