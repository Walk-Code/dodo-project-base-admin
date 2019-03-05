package com.dodo.project.base.admin.manager.service;

import com.dodo.project.base.admin.dao.system.model.SystemNotify;
import com.dodo.project.base.admin.dao.system.model.SystemSubscriptionConfig;
import com.dodo.project.base.admin.dao.system.model.SystemUserNotify;

import java.util.List;

/*
* @Description: 通知服务
* @Author: walk_code walk_code@163.com
* @Param:  
* @return:   
* @Date: 2019/1/17 11:09
*/ 
public interface NotifyService {
	/* 
	* @Description: 创建一条公告通知
	* @Author: walk_code walk_code@163.com
	* @Param: [content, sender] 
	* @return: boolean  
	* @Date: 2019/1/17 11:10
	*/ 
	boolean createAnnounce(String content, int sender);
	
	/* 
	* @Description: 创建一条提醒通知
	* @Author: walk_code walk_code@163.com
	* @Param: [target, targetType, action, content, sender] 
	* @return: boolean  
	* @Date: 2019/1/17 14:19
	*/ 
	boolean createRemind(int target, String targetType, String action, String content, int sender);

	/* 
	* @Description: 创建一条普通通知
	* @Author: walk_code walk_code@163.com
	* @Param: [content, sender] 
	* @return: boolean  
	* @Date: 2019/1/17 11:23
	*/ 
	boolean createMessage(String content, int sender, int receiver);
	
	/* 
	* @Description: 推送所有公告
	* @Author: walk_code walk_code@163.com
	* @Param: [userId] 
	* @return: boolean  
	* @Date: 2019/1/17 11:25
	*/ 
	boolean pullAnnounce(int userId);
	
	/* TODO 未完成
	* @Description: 推送所有提醒通知
	* @Author: walk_code walk_code@163.com
	* @Param: [userId] 
	* @return: boolean  
	* @Date: 2019/1/17 11:27
	*/ 
	boolean pullRemind(int userId);
	
	/* 
	* @Description: 推送所有普通通知
	* @Author: walk_code walk_code@163.com
	* @Param: [userId]
	* @return: boolean  
	* @Date: 2019/1/17 11:27
	*/ 
	boolean pullMessage(int userId);
	
	/* 
	* @Description: 订阅
	* @Author: walk_code walk_code@163.com
	* @Param: [userId, targer, targerType, reason] 
	* @return: boolean  
	* @Date: 2019/1/17 11:29
	*/ 
	boolean subscribe(int userId, int targer, String targerType, String reason);
	
	/* 
	* @Description: 取消订阅
	* @Author: walk_code walk_code@163.com
	* @Param: [userId, targer, tragerType] 
	* @return: boolean  
	* @Date: 2019/1/17 11:33
	*/ 
	boolean cancelSubscribe(int userId, int targer, String tragerType);
	
	/* 
	* @Description: 获取订阅配置
	* @Author: walk_code walk_code@163.com
	* @Param: [userId] 
	* @return: com.dodo.project.base.admin.dao.system.model.SystemSubscriptionConfig  
	* @Date: 2019/1/17 11:36
	*/ 
	SystemSubscriptionConfig getSystemSubscriptionConfig(int userId);
	
	/* 
	* @Description: 更新订阅配置
	* @Author: walk_code walk_code@163.com
	* @Param: [userId] 
	* @return: boolean  
	* @Date: 2019/1/17 11:36
	*/ 
	boolean updateSystemSubscriptionConfig(int userId);
	
	/* 
	* @Description: 获取用户通知
	* @Author: walk_code walk_code@163.com
	* @Param: [userId] 
	* @return: java.util.List<com.dodo.project.base.admin.dao.system.model.SystemNotify>  
	* @Date: 2019/1/17 11:40
	*/ 
	List<SystemUserNotify> getUserNotify(int userId);
	
	/* 
	* @Description: 标记为已读
	* @Author: walk_code walk_code@163.com
	* @Param: [userId, notifityId] 
	* @return: boolean  
	* @Date: 2019/1/17 11:43
	*/ 
	boolean read(int userId, int notifityId);
}
