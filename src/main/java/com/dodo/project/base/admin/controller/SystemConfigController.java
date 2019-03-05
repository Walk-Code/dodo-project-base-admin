package com.dodo.project.base.admin.controller;

import com.dodo.project.base.admin.base.AbstractBaseAdminController;
import com.dodo.project.base.admin.dao.system.model.SystemConfig;
import com.dodo.project.base.admin.manager.service.SystemConfigService;
import com.dodo.project.base.exception.utils.JsonHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/*
 * <b>ConfigController</b></br>
 *
 * <pre>
 * 系统配置控制器
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2019/1/14 17:48
 * @Since JDK 1.8
 */
@RestController
@RequestMapping(value = "/systemConfig")
public class SystemConfigController extends AbstractBaseAdminController {
	@Resource
	private SystemConfigService systemConfigService;

	private static final Logger log = LoggerFactory.getLogger(SystemConfigController.class);

	@RequestMapping("/index")
	public void index() {
		renderJsp("/system/config/index");
	}

	/*
	 * @Description: 获取系统配置
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: void
	 * @Date: 2019/1/14 18:46
	 */
	@RequestMapping(value = "/findSystemConfig")
	public void findSystemConfig() {
		SystemConfig systemConfig = systemConfigService.findSystemConfig();

		responseSuccess(systemConfig);
	}

	/*
	 * @Description: 保存系统配置
	 * @Author: walk_code walk_code@163.com
	 * @Param: [systemConfig]
	 * @return: void
	 * @Date: 2019/1/14 18:46
	 */
	@RequestMapping(value = "/updateSystemConfig")
	public void updateSystemConfig(String data) {
		log.info("输出系统配置：{}", data);
		SystemConfig systemConfig = JsonHelper.parse(data, SystemConfig.class);
		boolean      result       = systemConfigService.updateSystemConfig(systemConfig);

		responseSuccess(result);
	}

}
