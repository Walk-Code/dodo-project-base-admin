package com.dodo.project.base.admin.bean;

import java.util.ArrayList;
import java.util.List;

/**
 * <b>ZTreeNodeBean</b></br>
 *
 * <pre>
 * zTree node Bean
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/12/19 11:47
 * @Since JDK 1.8
 */
public class ZTreeNodeBean {
	private int     id;
	private int     pid;
	private String  name;
	private String  icon;
	private boolean checked;
	private boolean open; //默认打开

	private List<ZTreeNodeBean> children = new ArrayList<>();

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public List<ZTreeNodeBean> getChildren() {
		return children;
	}

	public void setChildren(List<ZTreeNodeBean> children) {
		this.children = children;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}
}
