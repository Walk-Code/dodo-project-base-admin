package com.dodo.project.base.admin.bean;

import com.dodo.project.base.admin.dao.system.model.SystemMenu;
import com.dodo.project.base.permissions.bean.UserAuthorizationInfo;

import javax.validation.constraints.NotBlank;
import java.util.List;

/*
 * <b>AdminUserAuthorizationInfo</b></br>
 *
 * <pre>
 * 后台用户授权列表
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/11/10 16:37
 * @Since JDK 1.8
 */
public class AdminUserAuthorizationInfo extends UserAuthorizationInfo {
	@NotBlank
	private List<SystemMenu> systemMenuList;

	public List<SystemMenu> getSystemMenuList() {
		return systemMenuList;
	}

	public void setSystemMenuList(List<SystemMenu> systemMenuList) {
		this.systemMenuList = systemMenuList;
	}
}
