package com.dodo.project.base.admin.controller;

import com.dodo.project.base.admin.base.AbstractBaseAdminController;
import com.dodo.project.base.admin.bean.AdminUserInfoBean;
import com.dodo.project.base.admin.bean.AdminUserRegisterBean;
import com.dodo.project.base.admin.bean.ReCaptchaSettingBean;
import com.dodo.project.base.admin.config.KaptchaConfiguration;
import com.dodo.project.base.admin.manager.AdminLoginManager;
import com.dodo.project.base.exception.utils.AssertHelper;
import com.dodo.project.base.permissions.config.UserAuthorizationInfoConfiguration;
import com.google.code.kaptcha.Producer;
import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.core.env.Environment;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/*
 * <b>AdminLoginController</b></br>
 *
 * <pre>
 * 后台登录控制
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/11/8 17:15
 * @Since JDK 1.8
 */
@RestController
public class AdminLoginController extends AbstractBaseAdminController {
	private final static Logger log = LoggerFactory.getLogger(AdminLoginController.class);

	@Resource
	private AdminLoginManager adminLoginManager;

	@Autowired
	private Producer producer;

	@Resource
	private StringRedisTemplate stringRedisTemplate;

	@Resource
	private UserAuthorizationInfoConfiguration userAuthorizationInfoConfiguration;

	@Autowired
	private Environment env;

	@Resource
	private ApplicationContext applicationContext;

	/*
	 * @Description: 用户登录页面
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: void
	 * @Date: 2018/11/8 17:16
	 */
	@GetMapping(value = "/login")
	public void login() {
		ReCaptchaSettingBean captchaSettingBean = applicationContext.getBean(com.dodo.project.base.admin.bean.ReCaptchaSettingBean.class);
		setAttr("captchaSettings", captchaSettingBean);

		renderJsp("login/login");
	}

	@PostMapping(value = "/postLogin")
	public void postLogin(String username, String password, String captcha) {
		AssertHelper.notEmpty(captcha, "验证码不能为空。");
		Object captchaO = stringRedisTemplate.opsForValue().get(captchaKey());
		AssertHelper.notNull(captchaO, "获取验证码失败。");
		String captchaS = captchaO.toString();
		AssertHelper.notNull(captchaS, "验证码已过期，请刷新后重试。");
		AssertHelper.isTrue(captcha.equals(captchaS), "验证码不正确。");
		AdminUserInfoBean adminUserInfoBean = adminLoginManager.adminUserLogin(username, password);
		setAdminLoginUser(adminUserInfoBean);
		adminLoginManager.setUserAuthorizationInfo(adminUserInfoBean.getId());

		responseSuccess(true);
	}

	/*
	 * @Description: 用户注册
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: void
	 * @Date: 2018/11/10 17:31
	 */
	@GetMapping(value = "/register")
	public void register() {
		renderJsp("login/register");
	}

	@PostMapping(value = "/register")
	public void postRegister(AdminUserRegisterBean adminUserRegisterBean) {
		boolean result = adminLoginManager.register(adminUserRegisterBean);

		responseSuccess(result);
	}

	/*
	 * @Description: 获取验证码
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: void
	 * @Date: 2018/11/8 17:58
	 */
	@RequestMapping(value = "/login/captcha")
	public void captcha() throws ServletException, IOException {
		String text = producer.createText();
		// 生成图片验证码
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		BufferedImage         image        = producer.createImage(text);
		ImageIO.write(image, "jpg", outputStream);

		// 对图片进行base64编码
		StringBuilder stringBuilder = new StringBuilder();
		String        imgBaseCode   = new String(Base64.encodeBase64(outputStream.toByteArray()));
		stringBuilder.append(imgBaseCode);
		stringBuilder.insert(0, "data:image/jpg;base64,");

		Map<String, String> map = new HashMap<>();
		map.put("codeImg", stringBuilder.toString());



		stringRedisTemplate.opsForValue().set(captchaKey(), text, 30, TimeUnit.SECONDS);

		responseSuccess(map);
	}

	@RequestMapping(value = "/logout")
	public void logout() {
		getSession().invalidate();// 清空所有已定义的session
		redirect302(userAuthorizationInfoConfiguration.getLoginRoute());
	}
}
