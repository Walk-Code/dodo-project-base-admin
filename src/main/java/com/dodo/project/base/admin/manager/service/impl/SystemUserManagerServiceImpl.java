package com.dodo.project.base.admin.manager.service.impl;

import com.dodo.project.base.admin.bean.SystemUserExpandBean;
import com.dodo.project.base.admin.config.SystemDbConfiguration;
import com.dodo.project.base.admin.dao.system.model.SystemUser;
import com.dodo.project.base.admin.dao.system.model.SystemUserGroup;
import com.dodo.project.base.admin.dao.system.service.SystemUserDaoService;
import com.dodo.project.base.admin.dao.system.service.SystemUserGroupDaoService;
import com.dodo.project.base.admin.manager.service.SystemUserManagerService;
import com.dodo.project.base.admin.utils.AdminUserPasswordHelper;
import com.dodo.project.base.dao.jfinal.annotation.JFinalORMTransaction;
import com.dodo.project.base.exception.utils.AssertHelper;
import com.dodo.project.base.exception.utils.JsonHelper;
import com.jfinal.plugin.activerecord.Page;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/*
 * <b>SystemUserManagerServiceImpl</b></br>
 *
 * <pre>
 * 用户管理实现类
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2018/12/27 16:04
 * @Since JDK 1.8
 */
@Service
public class SystemUserManagerServiceImpl implements SystemUserManagerService {
	private Logger log = LoggerFactory.getLogger(SystemUserManagerServiceImpl.class);

	@Resource
	private SystemUserDaoService systemUserDaoService;

	@Resource
	private SystemUserGroupDaoService systemUserGroupDaoService;


	@Override
	public Page<SystemUser> getList(int page) {
		return systemUserDaoService.getList(page);
	}

	@Override
	public boolean changeSystemUserStatus(String data) {
		SystemUser systemUser   = JsonHelper.parse(data, SystemUser.class);
		SystemUser dbSystemUser = systemUserDaoService.findById(SystemUser.class, systemUser.getId());
		AssertHelper.notNull(dbSystemUser, "该用户不存在，请刷新页面。");
		boolean isOldData = systemUser.getUpdateTime().compareTo(dbSystemUser.getUpdateTime()) == 0;
		AssertHelper.isTrue(isOldData, "数据已发生改变，请刷新页面。");
		boolean reslut = systemUserDaoService.changeSystemUserStatus(systemUser.getId(), systemUser.getStatus());
		AssertHelper.isTrue(reslut, "更新失败。");

		return true;
	}

	@Override
	public boolean editSystemUser(String data) {
		return false;
	}

	@Override
	public boolean delSystemUser(int id) {
		SystemUser systemUser = systemUserDaoService.findById(SystemUser.class, id);
		AssertHelper.notNull(systemUser, "数据发生变化，请刷新页面后重试。");

		return systemUserDaoService.delete(systemUser);
	}

	@JFinalORMTransaction(dbConfigName = SystemDbConfiguration.DB_CONFIG_NAME)
	@Override
	public boolean save(String data) {
		SystemUserExpandBean systemUserExpandBean = JsonHelper.parse(data, SystemUserExpandBean.class);
		SystemUser           isExtis              = systemUserDaoService.checkSystemUser(systemUserExpandBean.getId(), systemUserExpandBean.getUsername());
		AssertHelper.isNull(isExtis, "用户姓名已存在。");
		SystemUser systemUser = dealExpanBean(systemUserExpandBean);
		boolean    result     = systemUserDaoService.save(systemUser);
		AssertHelper.isTrue(result, "保存用户失败。");

		return true;
	}

	@Override
	public List<SystemUserGroup> getSystemUserGroup(int systemUserId) {
		return systemUserGroupDaoService.getSystemUserGroup(systemUserId);
	}

	@Override
	public boolean changePassword(int id, String newPassword) {
		SystemUser systemUser = systemUserDaoService.findById(SystemUser.class, id);
		AssertHelper.notNull(systemUser, "数据发生变化，请刷新页面后重试。");
		systemUser.setPassword(AdminUserPasswordHelper.createEncryptPasswrod(newPassword));

		return systemUserDaoService.save(systemUser);
	}

	/*
	 * @Description: 拓展bean转化成model
	 * @Author: walk_code walk_code@163.com
	 * @Param: [systemUserExpandBean]
	 * @return: com.dodo.project.base.admin.dao.system.model.SystemUser
	 * @Date: 2018/12/29 14:54
	 */
	private SystemUser dealExpanBean(SystemUserExpandBean systemUserExpandBean) {
		SystemUser systemUser = systemUserDaoService.findById(SystemUser.class, systemUserExpandBean.getId());
		Boolean    isOldData  = systemUser.getUpdateTime().compareTo(systemUserExpandBean.getUpdateTime()) == 0;
		AssertHelper.isTrue(isOldData, "数据发生改变，请刷新页面重试。");
		systemUser.setId(systemUserExpandBean.getId());
		systemUser.setUsername(systemUserExpandBean.getUsername());
		systemUser.setEmail(systemUserExpandBean.getEmail());
		systemUser.setPhone(systemUserExpandBean.getPhone());
		systemUser.setQq(systemUserExpandBean.getQq());
		systemUser.setRemark(systemUserExpandBean.getRemark());

		return systemUser;
	}
}
