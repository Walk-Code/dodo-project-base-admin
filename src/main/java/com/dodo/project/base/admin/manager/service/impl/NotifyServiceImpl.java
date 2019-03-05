package com.dodo.project.base.admin.manager.service.impl;

import com.dodo.project.base.admin.config.SystemDbConfiguration;
import com.dodo.project.base.admin.dao.system.model.SystemNotify;
import com.dodo.project.base.admin.dao.system.model.SystemSubscriptionConfig;
import com.dodo.project.base.admin.dao.system.model.SystemUserNotify;
import com.dodo.project.base.admin.dao.system.service.SystemNotifyDaoService;
import com.dodo.project.base.admin.dao.system.service.SystemSubscriptionConfigDaoService;
import com.dodo.project.base.admin.dao.system.service.SystemUserNotifyDaoService;
import com.dodo.project.base.admin.enums.NotifityEnum;
import com.dodo.project.base.admin.manager.service.NotifyService;
import com.dodo.project.base.dao.jfinal.annotation.JFinalORMTransaction;
import com.dodo.project.base.exception.utils.AssertHelper;
import com.dodo.project.base.web.utils.DateHelper;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/*
 * <b>NotifyServiceImpl</b></br>
 *
 * <pre>
 *  通知服务实现类
 * </pre>
 *
 * @Author xqyjjq walk_code@163.com
 * @Date 2019/1/17 11:43
 * @Since JDK 1.8
 */
public class NotifyServiceImpl implements NotifyService {
	@Resource
	private SystemNotifyDaoService systemNotifyDaoService;

	@Resource
	private SystemUserNotifyDaoService  systemUserNotifyDaoService;

	@Resource
	private SystemSubscriptionConfigDaoService systemSubscriptionConfigDaoService;


	@Override
	public boolean createAnnounce(String content, int sender) {
		SystemNotify systemNotify = new SystemNotify();
		systemNotify.setContent(content);
		systemNotify.setSender(sender);
		systemNotify.setType(NotifityEnum.ANNOUNCE.getType());

		return systemNotifyDaoService.save(systemNotify);
	}

	@Override
	public boolean createRemind(int target, String targetType, String action, String content, int sender) {
		SystemNotify systemNotify = new SystemNotify();
		systemNotify.setTarget(target);
		systemNotify.setTargetType(targetType);
		systemNotify.setAction(action);
		systemNotify.setContent(content);
		systemNotify.setSender(sender);
		systemNotify.setType(NotifityEnum.REMIND.getType());

		return systemNotifyDaoService.save(systemNotify);
	}

	@JFinalORMTransaction(dbConfigName = SystemDbConfiguration.DB_CONFIG_NAME)
	@Override
	public boolean createMessage(String content, int sender, int receiver) {
		SystemNotify systemNotify = new SystemNotify();
		systemNotify.setContent(content);
		systemNotify.setType(NotifityEnum.MESSAGE.getType());
		systemNotify.setSender(sender);
		boolean result = systemNotifyDaoService.save(systemNotify);
		AssertHelper.isTrue(result, "创建消息通知失败。");

		SystemUserNotify userNotify = new SystemUserNotify();
		userNotify.setSystemUserId(receiver);
		userNotify.setNotifyId(systemNotify.getId());
		boolean isSuccess = systemUserNotifyDaoService.save(userNotify);
		AssertHelper.isTrue(isSuccess, "创建用户通知失败");

		return true;
	}

	@Override
	public boolean pullAnnounce(int userId) {
		// 获取最近发送一条公告信息的创建时间
		SystemUserNotify systemUserNotify = systemUserNotifyDaoService.getLast(userId);
		List<SystemNotify> list = null;
		if (null == systemUserNotify) {
			list = systemNotifyDaoService.getSystemAnnounceNotify();
		}else{
			String createTime = DateHelper.dateToStr(systemUserNotify.getCreateTime());
			list = systemNotifyDaoService.getSystemAnnounceNotify(createTime);
		}

		Iterator iterator = list.iterator();
		while (iterator.hasNext()) {
			SystemNotify systemNotify = (SystemNotify) iterator.next();
			// 需要发送的公告信息
			SystemUserNotify userNotify = new SystemUserNotify();
			userNotify.setNotifyId(systemNotify.getId());
			userNotify.setSystemUserId(userId);
			boolean isSuccess = systemUserNotifyDaoService.save(userNotify);
			AssertHelper.isTrue(isSuccess, "发送公告信息失败。");
		}

		return true;
	}

	@JFinalORMTransaction(dbConfigName = SystemDbConfiguration.DB_CONFIG_NAME)
	@Override
	public boolean pullRemind(int userId) {
		// 查询用户订阅Notify记录
		List<SystemNotify> notifies = systemNotifyDaoService.getRemindNotify(userId);
		// 获取用户的订阅配置，如果没有则获取默认配置
		List<SystemSubscriptionConfig> subscriptionConfigs = systemSubscriptionConfigDaoService.findSystemSubscriptionConfig(userId);
		if (0 == subscriptionConfigs.size()) {
			// 获取默认订阅配置
			subscriptionConfigs = systemSubscriptionConfigDaoService.findSystemSubscriptionConfig(0);
		}

		List<String> configs = new ArrayList<>();
		for (SystemSubscriptionConfig config: subscriptionConfigs) {
			configs.add(config.getAction());
		}
		
		Iterator iterator = notifies.iterator();
		while (iterator.hasNext()) {
			SystemNotify systemNotify = (SystemNotify) iterator.next();
			// 使用订阅配置，过滤查询出来的Notify
			if (!configs.contains(systemNotify.getAction())) {
				iterator.remove();
			}
		}

		// 保存到用户通知表
		for(SystemNotify systemNotify: notifies) {
			SystemUserNotify userNotify = new SystemUserNotify();
			userNotify.setNotifyId(systemNotify.getId());
			userNotify.setSystemUserId(userId);
			boolean result = systemUserNotifyDaoService.save(userNotify);
			AssertHelper.isTrue(result, "创建用户通知失败。");
		}

		return true;
	}

	@Override
	public boolean pullMessage(int userId) {
		return false;
	}

	@Override
	public boolean subscribe(int userId, int targer, String targerType, String reason) {
		return false;
	}

	@Override
	public boolean cancelSubscribe(int userId, int targer, String tragerType) {
		return false;
	}

	@Override
	public SystemSubscriptionConfig getSystemSubscriptionConfig(int userId) {
		return null;
	}

	@Override
	public boolean updateSystemSubscriptionConfig(int userId) {
		return false;
	}

	@Override
	public List<SystemUserNotify> getUserNotify(int userId) {
		return systemUserNotifyDaoService.getList(userId);
	}

	@Override
	public boolean read(int userId, int notifityId) {
		SystemUserNotify userNotify = systemUserNotifyDaoService.findSystemUserNotify(userId, notifityId);
		AssertHelper.notNull(userNotify, "数据发生改变，请刷新页面。");
		userNotify.setIsRead(true);

		return systemUserNotifyDaoService.save(userNotify);
	}
}
