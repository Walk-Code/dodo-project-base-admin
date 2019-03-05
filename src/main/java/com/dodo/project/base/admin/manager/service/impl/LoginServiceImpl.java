package com.dodo.project.base.admin.manager.service.impl;

import com.dodo.project.base.admin.bean.AdminUserAuthorizationInfo;
import com.dodo.project.base.admin.bean.AdminUserInfoBean;
import com.dodo.project.base.admin.bean.AdminUserRegisterBean;
import com.dodo.project.base.admin.dao.system.model.SystemMenu;
import com.dodo.project.base.admin.dao.system.model.SystemUser;
import com.dodo.project.base.admin.dao.system.service.SystemMenuDaoService;
import com.dodo.project.base.admin.dao.system.service.SystemUserDaoService;
import com.dodo.project.base.admin.manager.service.LoginService;
import com.dodo.project.base.admin.utils.AdminUserPasswordHelper;
import com.dodo.project.base.exception.utils.AssertHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/*
 * <b>LoginServiceImpl</b></br>
 *
 * <pre>
 * 后台用户登录相关服务实现类
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/11/9 16:23
 * @Since JDK 1.8
 */
@Service
public class LoginServiceImpl implements LoginService {
	private static final Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);

	@Resource
	private SystemUserDaoService systemUserDaoService;

	@Resource
	private SystemMenuDaoService systemMenuDaoService;

	@Override
	public SystemUser loginValidate(String username, String password) {
		SystemUser systemUser = systemUserDaoService.findSystemUserByUserName(username);
		AssertHelper.notNull(systemUser, "用户不存在，请联系管理员。");

		String encryptPassword = AdminUserPasswordHelper.createEncryptPasswrod(password);
		logger.info("db-password: {}", systemUser.getPassword() + " " + encryptPassword);
		boolean isSuccess = encryptPassword.equals(systemUser.getPassword());
		AssertHelper.isTrue(isSuccess, "密码错误。");

		return systemUser;
	}

	@Override
	public boolean register(AdminUserRegisterBean adminUserRegisterBean) {
		SystemUser systemUser = systemUserDaoService.findSystemUserByUserName(adminUserRegisterBean.getUsername());

		if (null == systemUser) {
			systemUser = new SystemUser();
		}

		systemUser.setUsername(adminUserRegisterBean.getUsername());
		String encryptPassword = AdminUserPasswordHelper.createEncryptPasswrod(adminUserRegisterBean.getPassword());
		systemUser.setPassword(encryptPassword);
		systemUser.setEmail(adminUserRegisterBean.getEmail());

		return systemUserDaoService.save(systemUser);
	}

	@Override
	public AdminUserInfoBean systemUserToAdminUserInfoBean(SystemUser systemUser) {
		AdminUserInfoBean adminUserInfoBean = new AdminUserInfoBean();
		adminUserInfoBean.setId(systemUser.getId());
		adminUserInfoBean.setEmail(systemUser.getEmail());
		adminUserInfoBean.setRemark(systemUser.getRemark());

		return adminUserInfoBean;
	}

	@Override
	public List<String> getAllEnableMenu() {
		List<SystemMenu> systemMenus = systemMenuDaoService.getEnableSystemMenu();

		return dealSystemUrl(systemMenus);
	}

	@Override
	public List<String> getPermission(int systemUserId) {
		List<SystemMenu> systemMenus = systemMenuDaoService.getPermission(systemUserId);

		return dealSystemUrl(systemMenus);
	}

	/*
	 * @Description: 获取系统菜单url
	 * @Author: walk_code walk_code@163.com
	 * @Param: [systemMenus]
	 * @return: java.util.List<java.lang.String>
	 * @Date: 2019/1/10 11:09
	 */
	public List<String> dealSystemUrl(List<SystemMenu> systemMenus) {
		List<String> allSystemMenus = new ArrayList<>();

		if (null == systemMenus) {
			return null;
		}

		for (SystemMenu systemMenu : systemMenus) {
			allSystemMenus.add(systemMenu.getUrl());
		}

		return allSystemMenus;
	}


	@Override
	public AdminUserAuthorizationInfo getAdminAuthorizationBySystemId(int systemId) {
		List<SystemMenu> systemMenus = systemMenuDaoService.getEnableSystemMenu();

		AdminUserAuthorizationInfo adminUserAuthorizationInfo = new AdminUserAuthorizationInfo();
		adminUserAuthorizationInfo.setSystemMenuList(systemMenus);

		return adminUserAuthorizationInfo;
	}
}
