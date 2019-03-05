package com.dodo.project.base.admin.manager.service.impl;

import com.dodo.project.base.admin.dao.system.model.SystemConfig;
import com.dodo.project.base.admin.dao.system.service.SystemConfigDaoService;
import com.dodo.project.base.admin.manager.service.SystemConfigService;
import com.dodo.project.base.exception.utils.AssertHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/*
 * <b>SystemConfigDaoServiceImpl</b></br>
 *
 * <pre>
 * 系统配置服务类实现类
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2019/1/14 18:37
 * @Since JDK 1.8
 */
@Service
public class SystemConfigServiceImpl implements SystemConfigService {
	@Resource
	private SystemConfigDaoService systemConfigDaoService;

	@Override
	public SystemConfig findSystemConfig() {
		return systemConfigDaoService.findById(SystemConfig.class, 1);
	}

	@Override
	public boolean updateSystemConfig(SystemConfig systemConfig) {
		if (null != systemConfig.getId()) {
			SystemConfig dbData    = systemConfigDaoService.findById(SystemConfig.class, systemConfig.getId());
			boolean      isOldData = dbData.getUpdateTime().compareTo(systemConfig.getUpdateTime()) == 0;
			AssertHelper.isTrue(isOldData, "数据发生改变，请刷新数据。");
		}

		return systemConfigDaoService.save(systemConfig);
	}

}
