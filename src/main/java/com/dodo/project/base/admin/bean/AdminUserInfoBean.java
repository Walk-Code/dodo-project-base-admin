package com.dodo.project.base.admin.bean;

/**
 * <b>AdminUserInfoBean</b></br>
 *
 * <pre>
 * 后台用户信息bean
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/11/8 17:12
 * @Since JDK 1.8
 */
public class AdminUserInfoBean {
	private int id;

	private String username;

	private String email;

	private String remark;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}
