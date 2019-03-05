package com.dodo.project.base.admin.manager.service;

import com.dodo.project.base.admin.bean.SystemRoleGroupBean;
import com.dodo.project.base.admin.bean.SystemUserGroupBean;
import com.dodo.project.base.admin.dao.system.model.SystemRole;
import com.dodo.project.base.admin.dao.system.model.SystemUser;
import com.dodo.project.base.admin.dao.system.model.SystemUserGroup;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/*
 * @Description: 用户组服务类
 * @Author: walk_code walk_code@163.com
 * @Param:
 * @return:
 * @Date: 2018/12/24 10:38
 */
public interface SystemUserGroupManagerService {

	/*
	 * @Description: 获取用户组列表数据
	 * @Author: walk_code walk_code@163.com
	 * @Param: [page]
	 * @return: com.jfinal.plugin.activerecord.Page<com.dodo.project.base.admin.dao.system.model.SystemUserGroupBean>
	 * @Date: 2018/12/24 10:40
	 */
	Page<SystemUserGroup> getList(int page);

	/*
	 * @Description: 删除用户组
	 * @Author: walk_code walk_code@163.com
	 * @Param: [id]
	 * @return: boolean
	 * @Date: 2018/12/24 11:04
	 */
	boolean del(int id);

	/*
	 * @Description: 保存or修改
	 * @Author: walk_code walk_code@163.com
	 * @Param: [data]
	 * @return: boolean
	 * @Date: 2018/12/24 11:36
	 */
	boolean save(String data);

	/*
	 * @Description: 获取用户列表
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: java.util.List<com.dodo.project.base.admin.dao.system.model.SystemUser>
	 * @Date: 2018/12/24 15:32
	 */
	List<SystemUser> getUserList();

	/*
	 * @Description: 获取用户组中的用户
	 * @Author: walk_code walk_code@163.com
	 * @Param: [groupId]
	 * @return: java.util.List<com.dodo.project.base.admin.dao.system.model.SystemUser>
	 * @Date: 2018/12/24 15:40
	 */
	SystemUserGroupBean getUserFromGroup(int groupId);

	/*
	 * @Description: 添加用户到用户组
	 * @Author: walk_code walk_code@163.com
	 * @Param: [data]
	 * @return: boolean
	 * @Date: 2018/12/24 16:22
	 */
	boolean addUserToGroup(int groupId, int userId);

	/*
	 * @Description: 移除用户到用户组
	 * @Author: walk_code walk_code@163.com
	 * @Param: [data]
	 * @return: boolean
	 * @Date: 2018/12/24 16:22
	 */
	boolean removeUserToGroup(int groupId, int userId);

	/*
	 * @Description: 获取角色列表
	 * @Author: walk_code walk_code@163.com
	 * @Param: []
	 * @return: java.util.List<com.dodo.project.base.admin.dao.system.model.SystemRole>
	 * @Date: 2019/1/10 19:08
	 */
	List<SystemRole> getRoleList();

	/*
	 * @Description: 添加角色
	 * @Author: walk_code walk_code@163.com
	 * @Param: [groupId, roleId]
	 * @return: boolean
	 * @Date: 2019/1/10 19:09
	 */
	boolean addRoleToGroup(int groupId, int roleId);

	/*
	 * @Description: 移除角色
	 * @Author: walk_code walk_code@163.com
	 * @Param: [groupId, roleId]
	 * @return: boolean
	 * @Date: 2019/1/10 19:11
	 */
	boolean removeRoleToGroup(int groupId, int roleId);

	/*
	 * @Description: 获取用户组对应的所有角色
	 * @Author: walk_code walk_code@163.com
	 * @Param: [groupId]
	 * @return: com.dodo.project.base.admin.bean.SystemRoleGroupBean
	 * @Date: 2019/1/11 18:55
	 */
	SystemRoleGroupBean getRoleFromGroup(int groupId);
}
