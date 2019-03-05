package com.dodo.project.base.admin.bean;

import javax.validation.constraints.NotNull;

/**
 * <b>AdminUserLoginBean</b></br>
 *
 * <pre>
 * 用户登录bean
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/11/10 17:59
 * @Since JDK 1.8
 */
public class AdminUserLoginBean {
	@NotNull(message = "用户名不能为空")
	private String username;

	@NotNull(message = "密码不能为空")
	private String password;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
