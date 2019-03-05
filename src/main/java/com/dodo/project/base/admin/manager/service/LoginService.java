package com.dodo.project.base.admin.manager.service;

import com.dodo.project.base.admin.bean.AdminUserAuthorizationInfo;
import com.dodo.project.base.admin.bean.AdminUserInfoBean;
import com.dodo.project.base.admin.bean.AdminUserRegisterBean;
import com.dodo.project.base.admin.dao.system.model.SystemUser;

import java.util.List;

/*
 * <b>LoginService</b></br>
 *
 * <pre>
 * 后台用户登录相关服务类
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/11/9 16:16
 * @Since JDK 1.8
 */
public interface LoginService {
	/*
	 * @Description: 登录验证
	 * @Author: walk_code walk_code@163.com
	 * @Param: [username, password]
	 * @return: com.dodo.project.base.admin.dao.system.model.SystemUser
	 * @Date: 2018/11/9 16:18
	 */
	SystemUser loginValidate(String username, String password);

	/*
	 * @Description: 用户注册
	 * @Author: walk_code walk_code@163.com
	 * @Param: [adminUserRegisterBean]
	 * @return: boolean
	 * @Date: 2018/11/10 18:26
	 */
	boolean register(AdminUserRegisterBean adminUserRegisterBean);

	/*
	 * @Description: 用户model转bean
	 * @Author: walk_code walk_code@163.com
	 * @Param: [systemUser]
	 * @return: com.dodo.project.base.admin.bean.AdminUserInfoBean
	 * @Date: 2018/11/9 16:22
	 */
	AdminUserInfoBean systemUserToAdminUserInfoBean(SystemUser systemUser);

	/*
	 * @Description: 获取所有的启用的菜单
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: java.util.List<java.lang.String>
	 * @Date: 2018/11/9 17:14
	 */
	List<String> getAllEnableMenu();

	/*
	 * @Description: 获取用户权限
	 * @Author: walk_code walk_code@163.com
	 * @Param: [systemUserId]
	 * @return: java.util.List<java.lang.String>
	 * @Date: 2019/1/10 10:40
	 */
	List<String> getPermission(int systemUserId);


	/*
	 * @Description: 获取用户授权
	 * @Author: walk_code walk_code@163.com
	 * @Param: [systemId]
	 * @return: com.dodo.project.base.admin.bean.AdminUserInfoBean
	 * @Date: 2018/11/9 18:26
	 */
	AdminUserAuthorizationInfo getAdminAuthorizationBySystemId(int systemId);
}
