package com.dodo.project.base.admin.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.dodo.project.base.admin.bean.MenuTreeNodeBean;
import com.dodo.project.base.admin.bean.SystemMenusExpandBean;
import com.dodo.project.base.exception.utils.JsonHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/*
 * <b>TreeToolHelper</b></br>
 *
 * <pre>
 * 生成树样式辅助类
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/12/19 17:37
 * @Since JDK 1.8
 */
public class TreeToolHelper {
	public static final Logger log = LoggerFactory.getLogger(TreeToolHelper.class);

	/*
	 * @Description: 处理selectbox的数据
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: java.util.List<com.dodo.project.base.admin.bean.MenuTreeNodeBean>
	 * @Date: 2018/12/10 18:11
	 */
	public static void dealDataWithSelectBox(List<MenuTreeNodeBean> systemMenus, int n) {
		n++;
		Iterator iterator = systemMenus.iterator();
		while (iterator.hasNext()) {
			MenuTreeNodeBean       menuTreeNodeBean = (MenuTreeNodeBean) iterator.next();
			List<MenuTreeNodeBean> childrens        = menuTreeNodeBean.getChildren();
			if (menuTreeNodeBean.getPid() == 0) {
				n = 1;
			}

			StringBuilder text = new StringBuilder();
			text.append(menuTreeNodeBean.getText());
			menuTreeNodeBean.setSeparator(StringUtils.repeat("&nbsp;&nbsp;-|&nbsp;&nbsp;", n));
			menuTreeNodeBean.setText(text.toString());

			if (childrens.size() > 0) {
				dealDataWithSelectBox(childrens, n);
			}
		}
	}

	/*
	 * @Description: 生成树
	 * @Author: walk_code walk_code@163.com
	 * @Param: [systemMenus]
	 * @return: java.util.List<java.util.Map<java.lang.String,java.lang.String>>
	 * @Date: 2018/12/4 18:18
	 */
	public static List<Map<String, Object>> builtTree(List<SystemMenusExpandBean> systemMenus) {
		List<MenuTreeNodeBean> menuTreeNodeBeans = new ArrayList<>();
		for (SystemMenusExpandBean systemMenu : systemMenus) {
			MenuTreeNodeBean menuTreeNodeBean = new MenuTreeNodeBean();
			menuTreeNodeBean.setText(systemMenu.getTitle());
			menuTreeNodeBean.setPid(systemMenu.getPid());
			menuTreeNodeBean.setId(systemMenu.getId());
			menuTreeNodeBean.setIcon(systemMenu.getIcon());
			menuTreeNodeBean.setTargetType("iframe-tab");
			menuTreeNodeBean.setUrlType("abosulte");
			menuTreeNodeBean.setUrl(systemMenu.getUrl());
			menuTreeNodeBean.setAuth(systemMenu.isAuth());
			menuTreeNodeBean.setMenu(systemMenu.isMenu());
			menuTreeNodeBeans.add(menuTreeNodeBean);
		}

		String jsonTree = new TreeBuilderHelper().buildTree(menuTreeNodeBeans);
		List<Map<String, Object>> tree = JSON.parseObject(jsonTree, new TypeReference<List<Map<String, Object>>>() {
		});

		return tree;
	}
}
