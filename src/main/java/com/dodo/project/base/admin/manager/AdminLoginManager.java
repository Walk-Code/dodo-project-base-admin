package com.dodo.project.base.admin.manager;

import com.dodo.project.base.admin.bean.AdminUserInfoBean;
import com.dodo.project.base.admin.bean.AdminUserRegisterBean;
import com.dodo.project.base.admin.dao.system.model.SystemMenu;
import com.dodo.project.base.admin.dao.system.model.SystemUser;
import com.dodo.project.base.admin.dao.system.model.SystemUserGroupRole;
import com.dodo.project.base.admin.dao.system.service.SystemUserGroupDaoService;
import com.dodo.project.base.admin.manager.service.LoginService;
import com.dodo.project.base.dao.jfinal.utils.JFinalORMConvertDTOHelper;
import com.dodo.project.base.permissions.bean.UserAuthorizationInfo;
import com.dodo.project.base.permissions.utils.AuthorizationHelp;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/*
 * <b>AdminLoginManager</b></br>
 *
 * <pre>
 *  后台用户登录管理类
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/11/9 16:15
 * @Since JDK 1.8
 */
@Service
public class AdminLoginManager {
	@Resource
	private LoginService loginService;

	@Resource
	private AuthorizationHelp authorizationHelp;

	@Resource
	private SystemUserGroupDaoService systemUserGroupDaoService;

	/*
	 * @Description: 用户登录验证
	 * @Author: walk_code walk_code@163.com
	 * @Param: [username, password]
	 * @return: com.dodo.project.base.admin.bean.AdminUserInfoBean
	 * @Date: 2018/11/9 16:39
	 */
	public AdminUserInfoBean adminUserLogin(String username, String password) {
		SystemUser        systemUser        = loginService.loginValidate(username, password);
		// AdminUserInfoBean adminUserInfoBean = loginService.systemUserToAdminUserInfoBean(systemUser);

		return JFinalORMConvertDTOHelper.modelToBean(systemUser, AdminUserInfoBean.class);
	}

	/*
	 * @Description: 获取用户的授权信息
	 * @Author: walk_code walk_code@163.com
	 * @Param: [systemUserId]
	 * @return: com.dodo.project.base.permissions.bean.UserAuthorizationInfo
	 * @Date: 2018/11/9 16:52
	 */
	public UserAuthorizationInfo setUserAuthorizationInfo(int systemUserId) {
		authorizationHelp.setPermissionList(loginService.getPermission(systemUserId));;
		UserAuthorizationInfo userAuthorizationInfo = loginService.getAdminAuthorizationBySystemId(systemUserId);

		return userAuthorizationInfo;
	}

	/*
	 * @Description: 后台用户注册
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: boolean
	 * @Date: 2018/11/15 17:16
	 */
	public boolean register(AdminUserRegisterBean adminUserRegisterBean) {
		return loginService.register(adminUserRegisterBean);
	}

	/*
	 * @Description: 应用用户权限节点
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: void
	 * @Date: 2018/12/26 19:01
	 */
	public List<Map<String, Object>> applyAuthNode(int systemUserId) {
		List<SystemMenu> systemMenus  = systemUserGroupDaoService.getSystemMenu(systemUserId);

		return JFinalORMConvertDTOHelper.modelListToMapList(systemMenus);
	}
}
