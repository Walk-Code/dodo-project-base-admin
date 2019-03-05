package com.dodo.project.base.admin.manager.service;

import com.dodo.project.base.admin.dao.system.model.SystemUser;
import com.dodo.project.base.admin.dao.system.model.SystemUserGroup;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/*
 * @Description: 用户管理服务类
 * @Author: walk_code walk_code@163.com
 * @Param:
 * @return:
 * @Date: 2018/12/27 16:00
 */
public interface SystemUserManagerService {

	/*
	 * @Description: 系统用户列表数据
	 * @Author: walk_code walk_code@163.com
	 * @Param: [page]
	 * @return: com.jfinal.plugin.activerecord.Page<com.dodo.project.base.admin.dao.system.model.SystemUser>
	 * @Date: 2018/12/27 16:01
	 */
	Page<SystemUser> getList(int page);


	/*
	 * @Description: 修改用户状态
	 * @Author: walk_code walk_code@163.com
	 * @Param: [systemUser, status]
	 * @return: boolean
	 * @Date: 2018/12/27 16:02
	 */
	boolean changeSystemUserStatus(String data);

	/*
	 * @Description: 编辑用户
	 * @Author: walk_code walk_code@163.com
	 * @Param: [data]
	 * @return: boolean
	 * @Date: 2018/12/27 16:03
	 */
	boolean editSystemUser(String data);

	/*
	 * @Description: 删除用户
	 * @Author: walk_code walk_code@163.com
	 * @Param: [data]
	 * @return: boolean
	 * @Date: 2018/12/27 16:04
	 */
	boolean delSystemUser(int id);

	/*
	 * @Description: 保存用户
	 * @Author: walk_code walk_code@163.com
	 * @Param: [data]
	 * @return: boolean
	 * @Date: 2018/12/27 18:17
	 */
	boolean save(String data);

	/*
	 * @Description: 获取用户组
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: java.util.List<com.dodo.project.base.admin.dao.system.model.SystemUserGroup>
	 * @Date: 2018/12/28 14:20
	 */
	List<SystemUserGroup> getSystemUserGroup(int systemUserId);
	
	/* 
	* @Description: 修改密码
	* @Author: walk_code walk_code@163.com
	* @Param: [id, newPassword] 
	* @return: boolean  
	* @Date: 2019/2/11 17:43
	*/ 
	boolean changePassword(int id, String newPassword);
}
