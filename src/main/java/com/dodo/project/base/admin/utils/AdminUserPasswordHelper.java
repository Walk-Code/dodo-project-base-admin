package com.dodo.project.base.admin.utils;

import com.dodo.project.base.admin.constants.AdminConstants;
import org.apache.commons.codec.digest.DigestUtils;

/**
 * <b>AdminUserPasswordHelper</b></br>
 *
 * <pre>
 * 用户密码加解密辅助类
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/11/9 17:08
 * @Since JDK 1.8
 */
public class AdminUserPasswordHelper {
	/*
	 * @Description: 用户密码加密
	 * @Author: walk_code walk_code@163.com
	 * @Param: [password]
	 * @return: java.lang.String
	 * @Date: 2018/11/9 17:09
	 */
	public static String createEncryptPasswrod(String password) {
		return DigestUtils.md5Hex(AdminConstants.SALT + password);
	}

}
