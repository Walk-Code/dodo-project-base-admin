package com.dodo.project.base.admin.bean;

import com.dodo.project.base.admin.dao.system.model.SystemRole;
import com.dodo.project.base.admin.dao.system.model.SystemUser;

import java.util.ArrayList;
import java.util.List;

/*
 * <b>SystemRoleGroupBean</b></br>
 *
 * <pre>
 * 用户组bean装载系统角色
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2019/1/11 18:46
 * @Since JDK 1.8
 */
public class SystemRoleGroupBean {
	private int groupId;

	private List<SystemRole> systemRolesList = new ArrayList<>();

	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public List<SystemRole> getSystemRolesList() {
		return systemRolesList;
	}

	public void setSystemRolesList(List<SystemRole> systemRolesList) {
		this.systemRolesList = systemRolesList;
	}
}
