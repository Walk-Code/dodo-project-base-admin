package com.dodo.project.base.admin.utils;

import com.alibaba.fastjson.JSONArray;
import com.dodo.project.base.admin.bean.ZTreeNodeBean;
import com.dodo.project.base.admin.bean.ZTreeNodeBean;
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
public class ZTreeBuilderHelper {
	List<ZTreeNodeBean> treeNodeBeans = new ArrayList<>();

	public ZTreeBuilderHelper() {

	}

	public ZTreeBuilderHelper(List<ZTreeNodeBean> treeNodeBeans) {
		this.treeNodeBeans = treeNodeBeans;
	}

	/*
	 * @Description: 构建树
	 * @Author: walk_code walk_code@163.com
	 * @Param: [ZTreeNodeBeans]
	 * @return: java.lang.String
	 * @Date: 2018/12/3 19:56
	 */
	public String buildTree(List<ZTreeNodeBean> ZTreeNodeBeans) {
		ZTreeBuilderHelper treeBuilderHelper = new ZTreeBuilderHelper(ZTreeNodeBeans);

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
		List<ZTreeNodeBean> ZTreeNodeBeans = buildTree();
		String                 jsonObject        = JsonHelper.toJson(ZTreeNodeBeans);
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
	public List<ZTreeNodeBean> buildTree() {
		List<ZTreeNodeBean> treeItemNodes = new ArrayList<>();
		List<ZTreeNodeBean> rootItemNodes = getALLRootNodes();
		for (ZTreeNodeBean ZTreeNodeBean : rootItemNodes) {
			buildChildNodes(ZTreeNodeBean);
			treeItemNodes.add(ZTreeNodeBean);
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
	public void buildChildNodes(ZTreeNodeBean ZTreeNodeBean) {
		List<ZTreeNodeBean> children = getChildNodesByParentNode(ZTreeNodeBean);
		if (!children.isEmpty()) {
			for (ZTreeNodeBean nodeBean : children) {
				buildChildNodes(nodeBean);
			}
			ZTreeNodeBean.setChildren(children);
		}
	}

	/*
	 * @Description: 通过父节点获取所有子节点
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: java.util.List<com.dodo.project.base.admin.bean.ZTreeNodeBean>
	 * @Date: 2018/12/3 19:35
	 */
	public List<ZTreeNodeBean> getChildNodesByParentNode(ZTreeNodeBean parentNode) {
		// System.out.println("通过父节点获取所有子节点-父节点id：" + parentNode.getId());
		List<ZTreeNodeBean> childNodes = new ArrayList<>();
		for (ZTreeNodeBean nodeBean : treeNodeBeans) {
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
	public boolean isRootNode(ZTreeNodeBean ZTreeNodeBean) {
		boolean isRootNode_ = true;
		for (ZTreeNodeBean n : treeNodeBeans) {
			if (ZTreeNodeBean.getPid() == n.getId()) {
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
	 * @return: java.util.List<com.dodo.project.base.admin.bean.ZTreeNodeBean>
	 * @Date: 2018/12/3 19:42
	 */
	public List<ZTreeNodeBean> getALLRootNodes() {
		List<ZTreeNodeBean> allRootNodes = new ArrayList<>();
		for (ZTreeNodeBean nodeBean : treeNodeBeans) {
			if (isRootNode(nodeBean)) {
				allRootNodes.add(nodeBean);
			}
		}

		return allRootNodes;
	}
}
