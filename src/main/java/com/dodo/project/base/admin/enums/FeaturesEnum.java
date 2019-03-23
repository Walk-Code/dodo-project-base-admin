package com.dodo.project.base.admin.enums;

/* 
* @Description: 系统节点控制枚举类
* @Author: walk_code walk_code@163.com
* @Param:  
* @return:   
* @Date: 2019/3/21 20:51
*/ 
public enum FeaturesEnum {
	AUTH(1, "加入权限"), MENU(2, "加入菜单");

	private int code;

	private String desc;


	FeaturesEnum(int code, String desc) {
		this.code = code;
		this.desc = desc;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
}
