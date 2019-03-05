package com.dodo.project.base.admin.bean;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

/**
 * <b>AdminUserRegisterBean</b></br>
 *
 * <pre>
 * 后台用户注册bean
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/11/10 18:01
 * @Since JDK 1.8
 */
public class AdminUserRegisterBean {
	@NotNull(message = "请输入用户名。")
	private String username;

	@NotNull(message = "请输入密码。")
	private String password;

	@NotNull(message = "请输入邮箱")
	@Email(message = "邮件格式不正确")
	private String email;

	@NotNull(message = "用确认二次密码")
	private String secPassword;

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSecPassword() {
		return secPassword;
	}

	public void setSecPassword(String secPassword) {
		this.secPassword = secPassword;
	}
}
