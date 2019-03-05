package com.dodo.project.base.admin.bean;

import com.dodo.project.base.admin.dao.system.model.SystemRole;

import java.util.ArrayList;
import java.util.List;

/*
 * <b>SystemRoleBean</b></br>
 *
 * <pre>
 * 系统角色bean
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/12/25 10:41
 * @Since JDK 1.8
 */
public class SystemRoleBean extends SystemRole {
	private List<Integer> userGroupSelectList = new ArrayList<>();

	public List<Integer> getUserGroupSelectList() {
		return userGroupSelectList;
	}

	public void setUserGroupSelectList(List<Integer> userGroupSelectList) {
		this.userGroupSelectList = userGroupSelectList;
	}
}
