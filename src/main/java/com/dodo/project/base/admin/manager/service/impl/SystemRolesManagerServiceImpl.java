package com.dodo.project.base.admin.manager.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.dodo.project.base.admin.bean.SystemRoleBean;
import com.dodo.project.base.admin.bean.ZTreeNodeBean;
import com.dodo.project.base.admin.config.SystemDbConfiguration;
import com.dodo.project.base.admin.dao.system.model.*;
import com.dodo.project.base.admin.dao.system.service.*;
import com.dodo.project.base.admin.manager.service.SystemRolesManagerService;
import com.dodo.project.base.admin.utils.ZTreeBuilderHelper;
import com.dodo.project.base.dao.jfinal.annotation.JFinalORMTransaction;
import com.dodo.project.base.dao.jfinal.utils.JFinalORMConvertDTOHelper;
import com.dodo.project.base.exception.utils.AssertHelper;
import com.dodo.project.base.exception.utils.JsonHelper;
import com.jfinal.plugin.activerecord.Page;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import java.util.*;

/*
 * <b>SystemRolesManagerServiceImpl</b></br>
 *
 * <pre>
 * 系统角色实现类
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/12/11 18:51
 * @Since JDK 1.8
 */
@Service
public class SystemRolesManagerServiceImpl implements SystemRolesManagerService {
	@Resource
	private SystemRoleDaoService systemRoleDaoService;

	@Resource
	private SystemMenuNodeDaoService systemMenuNodeDaoService;

	@Resource
	private SystemMenuDaoService systemMenuDaoService;

	@Resource
	private SystemRoleMenuMappingDaoService systemRoleMenuMappingDaoService;

	@Resource
	private SystemUserGroupDaoService systemUserGroupDaoService;

	@Resource
	private SystemUserGroupRoleDaoService systemUserGroupRoleDaoService;

	public static final Logger logger = LoggerFactory.getLogger(SystemRolesManagerServiceImpl.class);

	@Override
	public Page<SystemRole> getList(int page) {
		return systemRoleDaoService.getSystemRoleList(page);
	}

	@Override
	public SystemRole findSystemRole(int id) {
		return systemRoleDaoService.findById(SystemRole.class, id);
	}

	@Override
	public boolean disable(SystemRole systemRole) {
		SystemRole dbSystemRole = systemRoleDaoService.findById(SystemRole.class, systemRole.getId());
		boolean    isOldData    = dbSystemRole.getUpdateTime().compareTo(systemRole.getUpdateTime()) == 0;
		AssertHelper.isTrue(isOldData, "数据已发生改变，请刷新页面。");

		return systemRoleDaoService.save(systemRole);
	}

	@Override
	public boolean delete(SystemRole systemRole) {
		return systemRoleDaoService.delete(systemRole);
	}

	@Override
	public boolean save(SystemRole systemRole) {
		return systemRoleDaoService.save(systemRole);
	}

	@Override
	public List<SystemMenu> getAuthMenu(int roleId) {
		return null;
	}

	@Override
	public List<ZTreeNodeBean> getZTreeNodeBeanMenusList(int roleId) {
		List<SystemMenu>          enableSystemMenus = systemMenuDaoService.getEnableSystemMenu();
		List<Map<String, Object>> list              = builtTree(enableSystemMenus, roleId);
		String                    treeJson          = JsonHelper.toJson(list);
		List<ZTreeNodeBean> menuTreeNodeBeans = JSON.parseObject(treeJson, new TypeReference<List<ZTreeNodeBean>>() {
		});

		return menuTreeNodeBeans;
	}

	@JFinalORMTransaction(dbConfigName = SystemDbConfiguration.DB_CONFIG_NAME)
	@Override
	public boolean updateRoleList(String data, int roleId) {
		List<Integer> menuNodeIds = JsonHelper.parseArray(data, Integer.class);
		AssertHelper.isTrue(menuNodeIds.size() > 0, "请选择权限节点后保存。");
		// 清除角色与菜单的所有绑定关系
		boolean                     isSuccess    = systemRoleMenuMappingDaoService.del(roleId);
		List<SystemRoleMenuMapping> menuMappings = new ArrayList<>();

		for (Integer id : menuNodeIds) {
			SystemRoleMenuMapping systemRoleMenuMapping = new SystemRoleMenuMapping();
			systemRoleMenuMapping.setRoleId(roleId);
			systemRoleMenuMapping.setMenuId(id);
			menuMappings.add(systemRoleMenuMapping);
			logger.info("roleId: {}", roleId + " " + id);
			boolean isSave = systemRoleMenuMappingDaoService.save(systemRoleMenuMapping);

			AssertHelper.isTrue(isSave, "批量修改失败。");
		}

		return true;
	}

	@Override
	public List<SystemUserGroup> getSystemUserGroup() {
		return systemUserGroupDaoService.getUserGroupList();
	}

	@Override
	public SystemRoleBean findSystemRoleBean(int roleId) {
		SystemRole systemRole = systemRoleDaoService.findSystemRole(roleId);
		AssertHelper.notNull(systemRole, "数据发生改变，请刷新数据后重试。");
		SystemRoleBean            systemRoleBean = JFinalORMConvertDTOHelper.modelToBean(systemRole, SystemRoleBean.class);
		List<SystemUserGroupRole> list           = systemUserGroupRoleDaoService.getSystemUserGroupRole(roleId);
		List<Integer>             userGroupIds   = new ArrayList<>();
		Iterator                  iterator       = list.iterator();
		while (iterator.hasNext()) {
			SystemUserGroupRole systemUserGroupRole = (SystemUserGroupRole) iterator.next();
			userGroupIds.add(systemUserGroupRole.getId());
		}
		systemRoleBean.setUserGroupSelectList(userGroupIds);

		return systemRoleBean;
	}

	@JFinalORMTransaction(dbConfigName = SystemDbConfiguration.DB_CONFIG_NAME)
	@Override
	public boolean editSystemRole(String data) {
		SystemRoleBean systemRoleBean = JsonHelper.parse(data, SystemRoleBean.class);
		SystemRole     systemRole     = systemRoleDaoService.findById(SystemRole.class, systemRoleBean.getId());
		boolean        isOldData      = systemRoleBean.getUpdateTime().compareTo(systemRole.getUpdateTime()) == 0;
		AssertHelper.isTrue(isOldData, "数据发生变化，请刷新页面。");

		systemRole.setRemark(systemRoleBean.getRemark());
		systemRole.setTitle(systemRoleBean.getTitle());
		boolean isSuccess = systemRoleDaoService.save(systemRole);
		AssertHelper.isTrue(isSuccess, "修改角色失败。");

		// 删除角色与用户组关系
		systemUserGroupRoleDaoService.delSystemUserGroupRole(systemRole.getId());

		Iterator iterator = systemRoleBean.getUserGroupSelectList().iterator();
		while (iterator.hasNext()) {
			Integer             userGroupId         = (Integer) iterator.next();
			SystemUserGroupRole systemUserGroupRole = new SystemUserGroupRole();
			systemUserGroupRole.setRoleId(systemRole.getId());
			systemUserGroupRole.setUserGroupId(userGroupId);
			boolean result = systemUserGroupRoleDaoService.save(systemUserGroupRole);
			AssertHelper.isTrue(result, "修改失败。");
		}

		return true;
	}

	@Override
	public boolean changeRoleStatus(String role) {
		SystemRole systemRole  = JsonHelper.parse(role, SystemRole.class);
		SystemRole dbSytemRole = systemRoleDaoService.findById(SystemRole.class, systemRole.getId());
		AssertHelper.notNull(dbSytemRole, "该角色不存在，请刷新页面。");
		//boolean result = systemRoleDaoService.disableRole(roleId);
		boolean isOldData = systemRole.getUpdateTime().compareTo(dbSytemRole.getUpdateTime()) == 0;
		AssertHelper.isTrue(isOldData, "数据已发生改变，请刷新页面。");

		boolean reslut = systemRoleDaoService.changeRoleStatus(systemRole.getId(), systemRole.getStatus());
		AssertHelper.isTrue(reslut, "更新失败。");

		return true;
	}

	@JFinalORMTransaction(dbConfigName = SystemDbConfiguration.DB_CONFIG_NAME)
	@Override
	public boolean delRole(int roleId) {
		SystemRole systemRole = systemRoleDaoService.findById(SystemRole.class, roleId);
		AssertHelper.notNull(systemRole, "数据发生变化，请刷新页面后重试。");

		systemUserGroupRoleDaoService.delSystemUserGroupRole(roleId);
		//AssertHelper.isTrue(result, "删除用户组失败。");

		return systemRoleDaoService.delete(systemRole);
	}

	/*
	 * @Description: 生成树
	 * @Author: walk_code walk_code@163.com
	 * @Param: [systemMenus]
	 * @return: java.util.List<java.util.Map<java.lang.String,java.lang.String>>
	 * @Date: 2018/12/4 18:18
	 */
	public List<Map<String, Object>> builtTree(List<SystemMenu> systemMenus, int roleId) {
		List<ZTreeNodeBean> menuTreeNodeBeans = new ArrayList<>();
		for (SystemMenu systemMenu : systemMenus) {
			ZTreeNodeBean menuTreeNodeBean = new ZTreeNodeBean();
			menuTreeNodeBean.setName(systemMenu.getTitle());
			menuTreeNodeBean.setPid(systemMenu.getPid());
			menuTreeNodeBean.setId(systemMenu.getId());
			menuTreeNodeBean.setIcon(systemMenu.getIcon());
			menuTreeNodeBean.setOpen(true); // 默认展开所有
			menuTreeNodeBeans.add(menuTreeNodeBean);
		}

		dealData(menuTreeNodeBeans, roleId);
		String jsonTree = new ZTreeBuilderHelper().buildTree(menuTreeNodeBeans);
		List<Map<String, Object>> tree = JSON.parseObject(jsonTree, new TypeReference<List<Map<String, Object>>>() {
		});

		return tree;
	}

	/*
	 * @Description: 显示当前角色对应的菜单节点
	 * @Author: walk_code walk_code@163.com
	 * @Param: [list, roleId]
	 * @return: void
	 * @Date: 2018/12/22 14:50
	 */
	private void dealData(List<ZTreeNodeBean> allMenuNode, Integer roleId) {
		List<SystemMenu> roleMenuNode = systemMenuNodeDaoService.getRoleEnableSystemMenuNode(roleId.toString());
		for (ZTreeNodeBean menu : allMenuNode) {
			for (SystemMenu roleMenu : roleMenuNode) {
				if (menu.getId() == roleMenu.getId()) {
					menu.setChecked(true);
				}
			}
		}
	}

	/*
	 * @Description: 获取树中id的值
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: void
	 * @Date: 2018/12/22 17:13
	 */
	public void findTreeFieldsValus(List<ZTreeNodeBean> tree, Set<Integer> list) {

		Iterator iterator = tree.iterator();
		while (iterator.hasNext()) {
			ZTreeNodeBean zTreeNodeBean = (ZTreeNodeBean) iterator.next();
			list.add(zTreeNodeBean.getId());
			if (zTreeNodeBean.getChildren().size() > 0) {
				findTreeFieldsValus(zTreeNodeBean.getChildren(), list);
			}
		}
	}

}
