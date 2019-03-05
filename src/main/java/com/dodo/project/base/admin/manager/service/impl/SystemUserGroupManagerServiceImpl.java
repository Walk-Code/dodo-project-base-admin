package com.dodo.project.base.admin.manager.service.impl;

import com.dodo.project.base.admin.bean.SystemRoleGroupBean;
import com.dodo.project.base.admin.bean.SystemUserGroupBean;
import com.dodo.project.base.admin.config.SystemDbConfiguration;
import com.dodo.project.base.admin.dao.system.model.*;
import com.dodo.project.base.admin.dao.system.service.*;
import com.dodo.project.base.admin.manager.service.SystemUserGroupManagerService;
import com.dodo.project.base.dao.jfinal.annotation.JFinalORMTransaction;
import com.dodo.project.base.exception.utils.AssertHelper;
import com.dodo.project.base.exception.utils.JsonHelper;
import com.jfinal.plugin.activerecord.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/*
 * <b>SystemUserGroupManagerServiceImpl</b></br>
 *
 * <pre>
 * 用户组管理实现类
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/12/24 10:39
 * @Since JDK 1.8
 */
@Service
public class SystemUserGroupManagerServiceImpl implements SystemUserGroupManagerService {
	@Resource
	private SystemUserGroupDaoService systemUserGroupDaoService;

	@Resource
	private SystemUserDaoService systemUserDaoService;

	@Resource
	private SystemUserGroupDetailDaoService systemUserGroupDetailDaoService;

	@Resource
	private SystemRoleDaoService systemRoleDaoService;

	@Resource
	private SystemUserGroupRoleDaoService systemUserGroupRoleDaoService;

	@Override
	public Page<SystemUserGroup> getList(int page) {
		return systemUserGroupDaoService.getUserGroupList(page);
	}

	@JFinalORMTransaction(dbConfigName = SystemDbConfiguration.DB_CONFIG_NAME)
	@Override
	public boolean del(int id) {
		SystemUserGroup systemUserGroup = systemUserGroupDaoService.findById(SystemUserGroup.class, id);
		AssertHelper.notNull(systemUserGroup, "数据已发生变化，请刷新数据。");

		// 清除用户组明细内容

		return systemUserGroupDaoService.delete(systemUserGroup);
	}

	@Override
	public boolean save(String data) {
		SystemUserGroup systemUserGroup = JsonHelper.parse(data, SystemUserGroup.class);

		return systemUserGroupDaoService.save(systemUserGroup);
	}

	@Override
	public List<SystemUser> getUserList() {
		return systemUserDaoService.getSystemUser();
	}

	@Override
	public SystemUserGroupBean getUserFromGroup(int groupId) {
		List<SystemUser>    systemUsers         = systemUserGroupDetailDaoService.getSystemUser(groupId);
		SystemUserGroupBean systemUserGroupBean = new SystemUserGroupBean();
		systemUserGroupBean.setGroupId(groupId);
		systemUserGroupBean.setSystemUserList(systemUsers);

		return systemUserGroupBean;
	}

	@JFinalORMTransaction(dbConfigName = SystemDbConfiguration.DB_CONFIG_NAME)
	@Override
	public boolean addUserToGroup(int groupId, int userId) {
		SystemUserGroupDetail systemUserGroupDetail = systemUserGroupDetailDaoService.findSystemUserGroupDetail(groupId, userId);

		if (null == systemUserGroupDetail) {
			systemUserGroupDetail = new SystemUserGroupDetail();
			systemUserGroupDetail.setUserId(userId);
			systemUserGroupDetail.setUserGroupId(groupId);

			boolean result = systemUserGroupDetailDaoService.save(systemUserGroupDetail);
			AssertHelper.isTrue(result, "保存失败。");
		}

		return true;
	}

	@Override
	public boolean removeUserToGroup(int groupId, int userId) {
		return systemUserGroupDetailDaoService.del(groupId, userId);
	}

	@Override
	public List<SystemRole> getRoleList() {
		return systemRoleDaoService.getSystemRoleList();
	}

	@Override
	public boolean addRoleToGroup(int groupId, int roleId) {
		SystemUserGroupRole userGroupRole = systemUserGroupRoleDaoService.findSystemUserGroupRole(roleId, groupId);
		if (null == userGroupRole) {
			userGroupRole = new SystemUserGroupRole();
		}

		userGroupRole.setRoleId(roleId);
		userGroupRole.setUserGroupId(groupId);

		return systemUserGroupRoleDaoService.save(userGroupRole);
	}

	@Override
	public boolean removeRoleToGroup(int groupId, int roleId) {
		SystemUserGroupRole userGroupRole = systemUserGroupRoleDaoService.findSystemUserGroupRole(roleId, groupId);
		AssertHelper.notNull(userGroupRole, "数据发生改变，刷新页面后重试。");

		return systemUserGroupRoleDaoService.delete(userGroupRole);
	}

	@Override
	public SystemRoleGroupBean getRoleFromGroup(int groupId) {
		List<SystemRole>    roleList            = systemUserGroupRoleDaoService.getSystemRoleList(groupId);
		SystemRoleGroupBean systemRoleGroupBean = new SystemRoleGroupBean();
		systemRoleGroupBean.setGroupId(groupId);
		systemRoleGroupBean.setSystemRolesList(roleList);

		return systemRoleGroupBean;
	}

	/*
	 * @Description: 校验数据
	 * @Author: walk_code walk_code@163.com
	 * @Param: [data]
	 * @return: com.dodo.project.base.admin.bean.SystemUserGroupBean
	 * @Date: 2018/12/24 16:30
	 */
	private SystemUserGroupBean validate(String data) {
		SystemUserGroupBean systemUserGroupBean = JsonHelper.parse(data, SystemUserGroupBean.class);
		List<SystemUser>    systemUsers         = systemUserGroupBean.getSystemUserList();
		SystemUserGroup     systemUserGroup     = systemUserGroupDaoService.findById(SystemUserGroup.class, systemUserGroupBean.getGroupId());
		AssertHelper.notNull(systemUserGroup, "用户组不存在，请刷新列表数据后操作。");

		return systemUserGroupBean;
	}


}
