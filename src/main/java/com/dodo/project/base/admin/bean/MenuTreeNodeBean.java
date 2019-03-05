package com.dodo.project.base.admin.bean;

import java.util.ArrayList;
import java.util.List;

/**
 * <b>MenuTreeNodeBean</b></br>
 *
 * <pre>
 * 菜单树Bean
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/12/3 19:15
 * @Since JDK 1.8
 */
public class MenuTreeNodeBean {
	private int     id;
	private int     pid;
	private String  text;
	private String  separator;
	private String  icon;
	private String  targetType;
	private String  urlType;
	private String  url;
	private boolean isMenu;
	private boolean isAuth;

	private List<MenuTreeNodeBean> children = new ArrayList<>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public List<MenuTreeNodeBean> getChildren() {
		return children;
	}

	public void setChildren(List<MenuTreeNodeBean> children) {
		this.children = children;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getTargetType() {
		return targetType;
	}

	public void setTargetType(String targetType) {
		this.targetType = targetType;
	}

	public String getUrlType() {
		return urlType;
	}

	public void setUrlType(String urlType) {
		this.urlType = urlType;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

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
