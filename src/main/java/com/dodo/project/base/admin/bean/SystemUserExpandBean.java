package com.dodo.project.base.admin.bean;

import com.dodo.project.base.admin.dao.system.model.SystemUser;
import com.dodo.project.base.admin.dao.system.model.SystemUserGroup;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

/*
 * <b>SystemUserExpandBean</b></br>
 *
 * <pre>
 * 系统用户拓展bean
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/12/27 18:16
 * @Since JDK 1.8
 */
public class SystemUserExpandBean extends SystemUser {
	@NotNull
	@Email(message = "邮箱格式错误")
	private String email;

	@Override
	public String getEmail() {
		return email;
	}

	@Override
	public void setEmail(String email) {
		this.email = email;
	}

	private List<SystemUserGroup> systemUserGroupList = new ArrayList<>();

	public List<SystemUserGroup> getSystemUserGroupList() {
		return systemUserGroupList;
	}

	public void setSystemUserGroupList(List<SystemUserGroup> systemUserGroupList) {
		this.systemUserGroupList = systemUserGroupList;
	}
}
