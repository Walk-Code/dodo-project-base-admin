package com.dodo.project.base.admin.utils;

import com.alibaba.fastjson.JSONArray;
import com.dodo.project.base.admin.bean.MenuTreeNodeBean;
import com.dodo.project.base.exception.utils.JsonHelper;

import java.util.ArrayList;
import java.util.List;

/**
 * <b>TreeBuilderHelper</b></br>
 *
 * <pre>
 * 树构建器
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/12/3 19:18
 * @Since JDK 1.8
 */
public class TreeBuilderHelper {
	List<MenuTreeNodeBean> treeNodeBeans = new ArrayList<>();

	public TreeBuilderHelper() {

	}

	public TreeBuilderHelper(List<MenuTreeNodeBean> treeNodeBeans) {
		this.treeNodeBeans = treeNodeBeans;
	}

	/*
	 * @Description: 构建树
	 * @Author: walk_code walk_code@163.com
	 * @Param: [menuTreeNodeBeans]
	 * @return: java.lang.String
	 * @Date: 2018/12/3 19:56
	 */
	public String buildTree(List<MenuTreeNodeBean> menuTreeNodeBeans) {
		TreeBuilderHelper treeBuilderHelper = new TreeBuilderHelper(menuTreeNodeBeans);

		return treeBuilderHelper.buildJSONTree();
	}

	/*
	 * @Description: 构建树
	 * @Author: walk_code walk_code@163.com
	 * @Param: [nodeBeans]
	 * @return: java.lang.String
	 * @Date: 2018/12/3 19:27
	 */
	public String buildJSONTree() {
		List<MenuTreeNodeBean> menuTreeNodeBeans = buildTree();
		String                 jsonObject        = JsonHelper.toJson(menuTreeNodeBeans);
		JSONArray              jsonArray         = JSONArray.parseArray(jsonObject);

		return jsonArray.toString();
	}

	/*
	 * @Description: 构建json树
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: java.lang.String
	 * @Date: 2018/12/3 19:28
	 */
	public List<MenuTreeNodeBean> buildTree() {
		List<MenuTreeNodeBean> treeItemNodes = new ArrayList<>();
		List<MenuTreeNodeBean> rootItemNodes = getALLRootNodes();
		// System.out.println("获取所有根节点："+JsonHelper.toJson(rootItemNodes));
		for (MenuTreeNodeBean menuTreeNodeBean : rootItemNodes) {
			buildChildNodes(menuTreeNodeBean);
			treeItemNodes.add(menuTreeNodeBean);
		}

		return treeItemNodes;
	}

	/*
	 * @Description: 递归子节点
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: void
	 * @Date: 2018/12/3 19:30
	 */
	public void buildChildNodes(MenuTreeNodeBean menuTreeNodeBean) {
		List<MenuTreeNodeBean> children = getChildNodesByParentNode(menuTreeNodeBean);
		if (!children.isEmpty()) {
			for (MenuTreeNodeBean nodeBean : children) {
				buildChildNodes(nodeBean);
			}
			menuTreeNodeBean.setChildren(children);
		}
	}

	/*
	 * @Description: 通过父节点获取所有子节点
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: java.util.List<com.dodo.project.base.admin.bean.MenuTreeNodeBean>
	 * @Date: 2018/12/3 19:35
	 */
	public List<MenuTreeNodeBean> getChildNodesByParentNode(MenuTreeNodeBean parentNode) {
		// System.out.println("通过父节点获取所有子节点-父节点id：" + parentNode.getId());
		List<MenuTreeNodeBean> childNodes = new ArrayList<>();
		for (MenuTreeNodeBean nodeBean : treeNodeBeans) {
			if (parentNode.getId() == nodeBean.getPid()) {
				childNodes.add(nodeBean);
			}
		}

		return childNodes;
	}

	/*
	 * @Description: 判断是否为根节点
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: boolean
	 * @Date: 2018/12/3 19:38
	 */
	public boolean isRootNode(MenuTreeNodeBean menuTreeNodeBean) {
		boolean isRootNode_ = true;
		for (MenuTreeNodeBean n : treeNodeBeans) {
			if (menuTreeNodeBean.getPid() == n.getId()) {
				isRootNode_ = false;
				break;
			}
		}

		return isRootNode_;
	}

	/*
	 * @Description: 获取所有根节点
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: java.util.List<com.dodo.project.base.admin.bean.MenuTreeNodeBean>
	 * @Date: 2018/12/3 19:42
	 */
	public List<MenuTreeNodeBean> getALLRootNodes() {
		List<MenuTreeNodeBean> allRootNodes = new ArrayList<>();
		for (MenuTreeNodeBean nodeBean : treeNodeBeans) {
			if (isRootNode(nodeBean)) {
				allRootNodes.add(nodeBean);
			}
		}

		return allRootNodes;
	}
}
