package com.dodo.project.base.admin.bean;

import com.dodo.project.base.admin.dao.system.model.SystemUser;

import java.util.ArrayList;
import java.util.List;

/*
 * <b>SystemUserGroupBean</b></br>
 *
 * <pre>
 * 用户组bean装载系统用户
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/12/24 16:17
 * @Since JDK 1.8
 */
public class SystemUserGroupBean {
	private int groupId;

	private List<SystemUser> systemUserList = new ArrayList<>();


	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public List<SystemUser> getSystemUserList() {
		return systemUserList;
	}

	public void setSystemUserList(List<SystemUser> systemUserList) {
		this.systemUserList = systemUserList;
	}
}
