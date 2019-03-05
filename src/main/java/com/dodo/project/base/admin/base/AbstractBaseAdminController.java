package com.dodo.project.base.admin.base;

import com.dodo.project.base.admin.bean.AdminUserInfoBean;
import com.dodo.project.base.permissions.utils.AuthorizationHelp;
import com.dodo.project.base.web.controller.AbstractController;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/*
 * <b>AbstractBaseAdminController</b></br>
 *
 * <pre>
 * 基础后台控制器
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/11/8 17:11
 * @Since JDK 1.8
 */
// @RequestMapping(value = "/admin") TODO 暂时不按路由分组
public class AbstractBaseAdminController extends AbstractController {
	@Resource
	private AuthorizationHelp authorizationHelp;

	protected void setAdminLoginUser(AdminUserInfoBean adminLoginUser) {
		authorizationHelp.setUserInfo(adminLoginUser);
	}

	protected AdminUserInfoBean getAdminLoginUser() {
		return authorizationHelp.getUserInfo(AdminUserInfoBean.class);
	}
	
	/* 
	* @Description: 生成验证码key
	* @Author: walk_code walk_code@163.com
	* @Param: [] 
	* @return: java.lang.String  
	* @Date: 2019/2/11 14:45
	*/ 
	protected String captchaKey(){
		String captchaKey = DigestUtils.md5DigestAsHex((getIp() + getUserAgent()).getBytes());

		return captchaKey+"-captcha";
	}
}
