package com.dodo.project.base.admin.bean;

import com.dodo.project.base.admin.dao.system.model.SystemMenu;

import java.util.Date;

/*
 * <b>SystemMenusExpandBean</b></br>
 *
 * <pre>
 * 系统菜单拓展bean
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/12/19 17:07
 * @Since JDK 1.8
 */
public class SystemMenusExpandBean extends SystemMenu {
	private boolean isMenu;

	private boolean isAuth;

	private String separator;

	public boolean isMenu() {
		return isMenu;
	}

	public void setMenu(boolean menu) {
		isMenu = menu;
	}

	public boolean isAuth() {
		return isAuth;
	}

	public void setAuth(boolean auth) {
		isAuth = auth;
	}

	public String getSeparator() {
		return separator;
	}

	public void setSeparator(String separator) {
		this.separator = separator;
	}
}
