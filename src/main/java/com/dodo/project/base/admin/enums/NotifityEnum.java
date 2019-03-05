package com.dodo.project.base.admin.enums;

/*
 * @Description: 系统通知类型枚举类
 * @Author: walk_code walk_code@163.com
 * @Param:
 * @return:
 * @Date: 2019/1/17 11:47
 */
public enum NotifityEnum {
	ANNOUNCE("1", "公告"), REMIND("2", "提醒"), MESSAGE("3", "普通");

	private String type;

	private String desc;

	NotifityEnum(String type, String desc) {
		this.type = type;
		this.desc = desc;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
}
