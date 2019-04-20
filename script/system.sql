/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : system

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 20/04/2019 10:54:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '程序名称',
  `app_version` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '程序版本',
  `site_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站名称',
  `copy_right` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版权信息',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '程序logo',
  `miitbeian` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备案信息',
  `create_time` timestamp(0) NULL DEFAULT NULL,
  `update_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES (1, '嘟嘟', 'v0.0.1', '嘟嘟', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for system_log
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `node` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作人用户名',
  `action` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作行为',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作内容描述',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '父id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '菜单排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态:0-禁用,1-启用',
  `create_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uidx_title_url`(`title`, `url`) USING BTREE COMMENT 'title&url组成唯一键'
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES (1, 0, '系统管理', 'far fa-circle', '/', '', '_self', 0, 1, 0, '2018-12-03 14:12:56', '2019-01-15 11:10:43');
INSERT INTO `system_menu` VALUES (4, 1, '后台菜单', 'far fa-circle', '/system/menus', '', '_self', 0, 1, 0, '2018-12-06 19:28:37', '2019-01-15 11:10:45');
INSERT INTO `system_menu` VALUES (5, 1, '系统参数', 'far fa-circle', '/systemConfig/index', '', '_self', 0, 1, 0, '2018-12-06 19:28:59', '2019-01-15 11:10:48');
INSERT INTO `system_menu` VALUES (6, 1, '文件储存', 'far fa-circle', '/index', '', '_self', 0, 1, 0, '2018-12-06 19:29:09', '2019-01-30 20:27:40');
INSERT INTO `system_menu` VALUES (7, 0, '访问权限', 'far fa-circle', '/', '', '_self', 0, 1, 0, '2018-12-06 19:29:25', '2019-01-15 11:10:54');
INSERT INTO `system_menu` VALUES (8, 7, '用户管理', 'far fa-circle', '/systemUser/index', '', '_self', 0, 1, 0, '2018-12-06 19:29:38', '2019-01-29 20:43:47');
INSERT INTO `system_menu` VALUES (9, 7, '角色列表', 'far fa-circle', '/systemRoles/index', '', '_self', 0, 1, 0, '2018-12-07 11:38:42', '2019-01-15 11:10:59');
INSERT INTO `system_menu` VALUES (10, 7, '访问节点', 'far fa-circle', '/systenMenusNode/index', '', '_self', 0, 1, 0, '2018-12-07 11:38:54', '2019-01-15 11:11:00');
INSERT INTO `system_menu` VALUES (11, 0, '日志管理', 'far fa-circle', '/', '', '_self', 0, 1, 0, '2018-12-07 11:39:06', '2019-01-15 11:11:03');
INSERT INTO `system_menu` VALUES (12, 12, '系统日志', 'far fa-circle', '/', '', '_self', 0, 1, 0, '2018-12-07 11:52:54', '2019-01-18 18:35:56');
INSERT INTO `system_menu` VALUES (14, 7, '用户组管理', 'far fa-circle', '/systemUserGroup/index', '', '_self', 0, 1, 0, '2018-12-26 17:57:41', '2019-01-15 11:11:06');
INSERT INTO `system_menu` VALUES (15, 9, '删除角色', '', '/systemRoles/delRole', '', '_self', 0, 1, 0, '2019-01-08 15:31:27', '2019-01-08 15:31:27');
INSERT INTO `system_menu` VALUES (16, 4, '禁用系统菜单', '', '/system/menus/disable', '', '_self', 0, 1, 0, '2019-01-12 15:51:15', '2019-01-12 15:51:15');
INSERT INTO `system_menu` VALUES (17, 4, '添加菜单路由', '', '/system/menus/addRoute', '', '_self', 0, 1, 0, '2019-01-12 15:51:38', '2019-01-12 15:51:38');
INSERT INTO `system_menu` VALUES (18, 4, '保存菜单列表', '', '/system/menus/saveJsonTree', '', '_self', 0, 1, 0, '2019-01-12 15:53:21', '2019-01-12 15:53:21');
INSERT INTO `system_menu` VALUES (19, 5, '保存系统参数', '', '/systemConfig/updateSystemConfig', '', '_self', 0, 1, 0, '2019-01-14 19:17:52', '2019-01-14 19:17:52');
INSERT INTO `system_menu` VALUES (20, 14, '移除用户组用户', '', '/systemUserGroup/removeUserToGroup', '', '_self', 0, 1, 0, '2019-01-18 18:46:23', '2019-01-18 18:52:46');
INSERT INTO `system_menu` VALUES (21, 14, '移除用户组角色', '', '/systemUserGroup/removeRoleToGroup', '', '_self', 0, 1, 0, '2019-01-18 18:46:46', '2019-01-18 18:52:38');
INSERT INTO `system_menu` VALUES (22, 8, '删除用户', '', '/systemUser/del', '', '_self', 0, 1, 0, '2019-01-29 20:47:46', '2019-01-29 20:47:46');
INSERT INTO `system_menu` VALUES (23, 4, '菜单列表数据', '', '/system/menus/jsonTree', '', '_self', 0, 1, 0, '2019-02-11 14:28:09', '2019-02-11 14:28:09');
INSERT INTO `system_menu` VALUES (24, 4, '菜单列表select框数据', '', '/system/menus/getTreeDataList', '', '_self', 0, 1, 0, '2019-02-11 14:28:51', '2019-02-11 14:28:51');
INSERT INTO `system_menu` VALUES (25, 0, '查询用户权限', '', '/getUserPermissionList', '', '_self', 0, 1, 0, '2019-02-11 14:31:36', '2019-02-11 14:31:36');
INSERT INTO `system_menu` VALUES (26, 4, '系统左侧菜单类别数据', '', '/system/menus/jsonTree', '', '_self', 0, 1, 0, '2019-02-11 15:06:45', '2019-02-11 15:06:45');
INSERT INTO `system_menu` VALUES (27, 5, '获取系统参数数据', '', '/systemConfig/findSystemConfig', '', '_self', 0, 1, 0, '2019-02-11 15:11:35', '2019-02-11 15:11:35');
INSERT INTO `system_menu` VALUES (28, 9, '获取系统角色列表数据', '', '/systemRoles/getList', '', '_self', 0, 1, 0, '2019-02-11 15:12:49', '2019-02-11 15:12:49');
INSERT INTO `system_menu` VALUES (29, 7, '角色管理授权列表', '', '/systemRoles/auth', '', '_self', 0, 1, 0, '2019-02-11 15:15:07', '2019-02-13 19:20:28');
INSERT INTO `system_menu` VALUES (30, 29, '授权列表数据', '', '/systemRoles/getAuthList', '', '_self', 0, 1, 0, '2019-02-11 15:16:33', '2019-02-11 15:16:33');
INSERT INTO `system_menu` VALUES (31, 29, '保存授权信息', '', '/systemRoles/updateAuthList', '', '_self', 0, 1, 0, '2019-02-11 15:18:10', '2019-02-11 15:18:10');
INSERT INTO `system_menu` VALUES (32, 8, '用户列表数据', '', '/systemUser/getList', '', '_self', 0, 1, 0, '2019-02-11 15:19:34', '2019-02-11 15:19:34');
INSERT INTO `system_menu` VALUES (33, 8, '获取用户组数据', '', '/systemUser/getUserGroup', '', '_self', 0, 1, 0, '2019-02-11 15:21:30', '2019-02-11 15:21:30');
INSERT INTO `system_menu` VALUES (34, 8, '编辑用户', '', '/systemUser/save', '', '_self', 0, 1, 0, '2019-02-11 15:41:34', '2019-02-11 15:41:34');
INSERT INTO `system_menu` VALUES (36, 8, '修改用户密码', '', '/systemUser/changePassword', '', '_self', 0, 1, 0, '2019-02-11 17:56:15', '2019-02-11 17:56:15');
INSERT INTO `system_menu` VALUES (37, 14, '用户组列表数据', '', '/systemUserGroup/getList', '', '_self', 0, 1, 0, '2019-02-13 17:23:33', '2019-02-13 17:23:33');
INSERT INTO `system_menu` VALUES (38, 14, '用户组修改or保存', '', '/systemUserGroup/save', '', '_self', 0, 1, 0, '2019-02-13 17:25:12', '2019-02-13 17:43:44');
INSERT INTO `system_menu` VALUES (39, 7, '用户组添加组成员页面', '', '/systemUserGroup/addUser/index', '', '_self', 0, 1, 0, '2019-02-13 17:30:00', '2019-02-13 19:19:33');
INSERT INTO `system_menu` VALUES (40, 39, '获取用户组成员数据', '', '/systemUserGroup/getUserFromGroup', '', '_self', 0, 1, 0, '2019-02-13 17:31:24', '2019-02-13 17:43:51');
INSERT INTO `system_menu` VALUES (42, 39, '添加用户到用户组', '', '/systemUserGroup/addUserToGroup', '', '_self', 0, 1, 0, '2019-02-13 17:33:02', '2019-02-13 17:43:54');
INSERT INTO `system_menu` VALUES (44, 7, '用户组角色管理页面', '', '/systemUserGroup/addRole/index', '', '_self', 0, 1, 0, '2019-02-13 17:34:51', '2019-02-13 19:19:48');
INSERT INTO `system_menu` VALUES (45, 44, '获取用户组的角色', '', '/systemUserGroup/getRoleFromGroup', '', '_self', 0, 1, 0, '2019-02-13 17:36:31', '2019-02-13 17:36:31');
INSERT INTO `system_menu` VALUES (47, 44, '添加角色至用户组', '', '/systemUserGroup/addRoleToGroup', '', '_self', 0, 1, 0, '2019-02-13 17:37:28', '2019-02-13 17:37:28');
INSERT INTO `system_menu` VALUES (48, 44, '从用户组移除角色', '', '/systemUserGroup/addRoleToGroup', '', '_self', 0, 1, 0, '2019-02-13 17:38:20', '2019-02-13 17:38:20');
INSERT INTO `system_menu` VALUES (49, 39, '从用户组移除用户', '', '/systemUserGroup/removeUserToGroup', '', '_self', 0, 1, 0, '2019-02-13 17:40:12', '2019-02-13 19:07:17');
INSERT INTO `system_menu` VALUES (50, 39, '获取用户成员', '', '/systemUserGroup/getUserList', '', '_self', 0, 1, 0, '2019-02-13 17:40:54', '2019-02-13 19:07:13');
INSERT INTO `system_menu` VALUES (51, 44, '获取用户组角色列表', '', '/systemUserGroup/getRoleFromGroup', '', '_self', 0, 1, 0, '2019-02-13 19:08:46', '2019-02-13 19:14:01');
INSERT INTO `system_menu` VALUES (52, 44, '获取所有角色列表', '', '/systemUserGroup/getRoleList', '', '_self', 0, 1, 0, '2019-02-13 19:14:15', '2019-02-13 19:14:15');
INSERT INTO `system_menu` VALUES (53, 0, '沙盒测试', '', '/', '', '_self', 0, 1, 0, '2019-03-21 19:39:34', '2019-03-21 19:39:34');
INSERT INTO `system_menu` VALUES (54, 10, '节点列表数据', '', '/systenMenusNode/getList', '', '_self', 0, 1, 0, '2019-03-21 20:36:07', '2019-03-21 20:36:07');
INSERT INTO `system_menu` VALUES (55, 10, '修改节点数据', '', '/systenMenusNode/setUrlFeatures', '', '_self', 0, 1, 0, '2019-03-21 21:07:18', '2019-03-21 21:07:18');

-- ----------------------------
-- Table structure for system_menu_node
-- ----------------------------
DROP TABLE IF EXISTS `system_menu_node`;
CREATE TABLE `system_menu_node`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NULL DEFAULT NULL COMMENT '系统菜单表id',
  `is_menu` tinyint(1) NULL DEFAULT 0 COMMENT '是否设为菜单：1-是 2-否',
  `is_auth` tinyint(1) NULL DEFAULT 1 COMMENT '是否加入RBAC权限控制：1-是 2-否',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uidx_menu_id`(`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统菜单扩展表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_menu_node
-- ----------------------------
INSERT INTO `system_menu_node` VALUES (3, 1, 1, 1, '2018-12-19 16:03:40', '2019-03-23 10:43:07');
INSERT INTO `system_menu_node` VALUES (4, 4, 1, 1, '2018-12-19 16:03:40', '2019-03-23 10:43:07');
INSERT INTO `system_menu_node` VALUES (5, 5, 1, 1, '2018-12-19 16:03:40', '2019-03-23 10:43:07');
INSERT INTO `system_menu_node` VALUES (6, 6, 1, 1, '2018-12-19 16:03:40', '2019-03-23 10:43:07');
INSERT INTO `system_menu_node` VALUES (7, 7, 1, 1, '2018-12-19 16:03:40', '2019-03-23 10:43:07');
INSERT INTO `system_menu_node` VALUES (8, 8, 1, 1, '2018-12-19 16:03:40', '2019-03-23 10:43:07');
INSERT INTO `system_menu_node` VALUES (9, 9, 1, 1, '2018-12-19 16:03:40', '2019-03-23 10:43:07');
INSERT INTO `system_menu_node` VALUES (10, 10, 1, 1, '2018-12-19 16:03:40', '2019-03-23 10:43:07');
INSERT INTO `system_menu_node` VALUES (11, 11, 1, 1, '2018-12-19 16:03:40', '2019-03-23 10:43:07');
INSERT INTO `system_menu_node` VALUES (12, 12, 1, 1, '2018-12-19 16:03:40', '2019-03-23 10:43:07');
INSERT INTO `system_menu_node` VALUES (14, 14, 1, 1, '2018-12-26 17:57:41', '2019-03-23 10:43:07');
INSERT INTO `system_menu_node` VALUES (15, 15, 0, 1, '2019-01-08 15:31:27', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (16, 16, 0, 1, '2019-01-12 15:51:15', '2019-03-28 18:05:59');
INSERT INTO `system_menu_node` VALUES (17, 17, 0, 1, '2019-01-12 15:51:38', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (18, 18, 0, 1, '2019-01-12 15:53:21', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (19, 19, 0, 1, '2019-01-14 19:17:52', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (20, 20, 0, 1, '2019-01-18 18:46:23', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (21, 21, 0, 1, '2019-01-18 18:46:46', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (22, 22, 0, 1, '2019-01-18 18:52:13', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (23, 23, 0, 1, '2019-02-11 14:28:09', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (24, 24, 0, 1, '2019-02-11 14:28:51', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (25, 25, 0, 1, '2019-02-11 14:31:36', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (26, 26, 0, 1, '2019-02-11 15:06:45', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (27, 27, 0, 1, '2019-02-11 15:11:35', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (28, 28, 0, 1, '2019-02-11 15:12:49', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (29, 29, 0, 1, '2019-02-11 15:15:07', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (30, 30, 0, 1, '2019-02-11 15:16:33', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (31, 31, 0, 1, '2019-02-11 15:18:10', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (32, 32, 0, 1, '2019-02-11 15:19:34', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (33, 33, 0, 1, '2019-02-11 15:21:30', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (34, 34, 0, 1, '2019-02-11 15:41:34', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (36, 36, 0, 1, '2019-02-11 17:56:15', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (37, 37, 0, 1, '2019-02-13 17:23:33', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (38, 38, 0, 1, '2019-02-13 17:25:12', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (39, 39, 0, 1, '2019-02-13 17:30:00', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (40, 40, 0, 1, '2019-02-13 17:31:24', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (42, 42, 0, 1, '2019-02-13 17:33:02', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (44, 44, 0, 1, '2019-02-13 17:34:51', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (45, 45, 0, 1, '2019-02-13 17:36:31', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (47, 47, 0, 1, '2019-02-13 17:37:28', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (48, 48, 0, 1, '2019-02-13 17:38:20', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (49, 49, 0, 1, '2019-02-13 17:40:12', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (50, 50, 0, 1, '2019-02-13 17:40:54', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (51, 51, 0, 1, '2019-02-13 19:08:46', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (52, 52, 0, 1, '2019-02-13 19:14:15', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (53, 53, 1, 1, '2019-03-21 19:39:34', '2019-03-23 10:45:00');
INSERT INTO `system_menu_node` VALUES (54, 54, 0, 1, '2019-03-21 20:36:07', '2019-03-23 10:42:22');
INSERT INTO `system_menu_node` VALUES (55, 55, 0, 1, '2019-03-21 21:07:18', '2019-03-23 10:42:22');

-- ----------------------------
-- Table structure for system_notify
-- ----------------------------
DROP TABLE IF EXISTS `system_notify`;
CREATE TABLE `system_notify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消息内容',
  `type` enum('1','2','3') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '消息类型：1-公告，2-提醒，3-信息',
  `target` int(11) NULL DEFAULT NULL COMMENT '目标id',
  `target_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标的类型',
  `action` enum('1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '订阅动作：1-评论，2-收藏',
  `sender` int(11) NULL DEFAULT NULL COMMENT '发送者id',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `status` smallint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态:1-禁用,2-启用',
  `sort` smallint(6) UNSIGNED NULL DEFAULT 0 COMMENT '排序权重',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  `create_by` bigint(11) UNSIGNED NULL DEFAULT 0 COMMENT '创建人',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uidx_title`(`title`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统权限表[角色表]' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES (1, 'admin', 2, 0, '超级管理员', 0, '2018-12-17 14:10:04', '2018-12-26 15:37:54');
INSERT INTO `system_role` VALUES (2, 'test', 2, 0, 'test', 0, '2018-12-17 14:10:04', '2018-12-26 16:51:46');

-- ----------------------------
-- Table structure for system_role_menu_mapping
-- ----------------------------
DROP TABLE IF EXISTS `system_role_menu_mapping`;
CREATE TABLE `system_role_menu_mapping`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` int(11) NULL DEFAULT NULL COMMENT '系统菜单表node',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uidx_roleId_menuId`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1040 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统角色与节点绑定' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_role_menu_mapping
-- ----------------------------
INSERT INTO `system_role_menu_mapping` VALUES (994, 1, 1);
INSERT INTO `system_role_menu_mapping` VALUES (995, 1, 4);
INSERT INTO `system_role_menu_mapping` VALUES (1002, 1, 5);
INSERT INTO `system_role_menu_mapping` VALUES (1005, 1, 6);
INSERT INTO `system_role_menu_mapping` VALUES (1006, 1, 7);
INSERT INTO `system_role_menu_mapping` VALUES (1007, 1, 8);
INSERT INTO `system_role_menu_mapping` VALUES (1013, 1, 9);
INSERT INTO `system_role_menu_mapping` VALUES (1016, 1, 10);
INSERT INTO `system_role_menu_mapping` VALUES (1038, 1, 11);
INSERT INTO `system_role_menu_mapping` VALUES (1019, 1, 14);
INSERT INTO `system_role_menu_mapping` VALUES (1014, 1, 15);
INSERT INTO `system_role_menu_mapping` VALUES (996, 1, 16);
INSERT INTO `system_role_menu_mapping` VALUES (997, 1, 17);
INSERT INTO `system_role_menu_mapping` VALUES (998, 1, 18);
INSERT INTO `system_role_menu_mapping` VALUES (1003, 1, 19);
INSERT INTO `system_role_menu_mapping` VALUES (1020, 1, 20);
INSERT INTO `system_role_menu_mapping` VALUES (1021, 1, 21);
INSERT INTO `system_role_menu_mapping` VALUES (1008, 1, 22);
INSERT INTO `system_role_menu_mapping` VALUES (999, 1, 23);
INSERT INTO `system_role_menu_mapping` VALUES (1000, 1, 24);
INSERT INTO `system_role_menu_mapping` VALUES (1039, 1, 25);
INSERT INTO `system_role_menu_mapping` VALUES (1001, 1, 26);
INSERT INTO `system_role_menu_mapping` VALUES (1004, 1, 27);
INSERT INTO `system_role_menu_mapping` VALUES (1015, 1, 28);
INSERT INTO `system_role_menu_mapping` VALUES (1024, 1, 29);
INSERT INTO `system_role_menu_mapping` VALUES (1025, 1, 30);
INSERT INTO `system_role_menu_mapping` VALUES (1026, 1, 31);
INSERT INTO `system_role_menu_mapping` VALUES (1009, 1, 32);
INSERT INTO `system_role_menu_mapping` VALUES (1010, 1, 33);
INSERT INTO `system_role_menu_mapping` VALUES (1011, 1, 34);
INSERT INTO `system_role_menu_mapping` VALUES (1012, 1, 36);
INSERT INTO `system_role_menu_mapping` VALUES (1022, 1, 37);
INSERT INTO `system_role_menu_mapping` VALUES (1023, 1, 38);
INSERT INTO `system_role_menu_mapping` VALUES (1027, 1, 39);
INSERT INTO `system_role_menu_mapping` VALUES (1028, 1, 40);
INSERT INTO `system_role_menu_mapping` VALUES (1029, 1, 42);
INSERT INTO `system_role_menu_mapping` VALUES (1032, 1, 44);
INSERT INTO `system_role_menu_mapping` VALUES (1033, 1, 45);
INSERT INTO `system_role_menu_mapping` VALUES (1034, 1, 47);
INSERT INTO `system_role_menu_mapping` VALUES (1035, 1, 48);
INSERT INTO `system_role_menu_mapping` VALUES (1030, 1, 49);
INSERT INTO `system_role_menu_mapping` VALUES (1031, 1, 50);
INSERT INTO `system_role_menu_mapping` VALUES (1036, 1, 51);
INSERT INTO `system_role_menu_mapping` VALUES (1037, 1, 52);
INSERT INTO `system_role_menu_mapping` VALUES (1017, 1, 54);
INSERT INTO `system_role_menu_mapping` VALUES (1018, 1, 55);
INSERT INTO `system_role_menu_mapping` VALUES (635, 2, 1);
INSERT INTO `system_role_menu_mapping` VALUES (636, 2, 4);
INSERT INTO `system_role_menu_mapping` VALUES (640, 2, 5);
INSERT INTO `system_role_menu_mapping` VALUES (641, 2, 6);
INSERT INTO `system_role_menu_mapping` VALUES (642, 2, 11);
INSERT INTO `system_role_menu_mapping` VALUES (637, 2, 23);
INSERT INTO `system_role_menu_mapping` VALUES (638, 2, 24);
INSERT INTO `system_role_menu_mapping` VALUES (643, 2, 25);
INSERT INTO `system_role_menu_mapping` VALUES (639, 2, 26);

-- ----------------------------
-- Table structure for system_subscription
-- ----------------------------
DROP TABLE IF EXISTS `system_subscription`;
CREATE TABLE `system_subscription`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target` int(11) NULL DEFAULT NULL COMMENT '目标id',
  `target_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `action` enum('1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订阅动作：1-评论，2-收藏',
  `system_user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户订阅表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_subscription_config
-- ----------------------------
DROP TABLE IF EXISTS `system_subscription_config`;
CREATE TABLE `system_subscription_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '系统用户id',
  `action` enum('1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订阅动作：1-评论，2-收藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户订阅配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_subscription_config
-- ----------------------------
INSERT INTO `system_subscription_config` VALUES (1, 0, '1');
INSERT INTO `system_subscription_config` VALUES (2, 0, '2');

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `qq` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系QQ',
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系邮箱',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系手机号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注说明',
  `login_num` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '登录次数',
  `login_at` datetime(0) NULL DEFAULT NULL,
  `status` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态:1-禁用,2-启用',
  `system_user_group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属用户组',
  `is_deleted` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '删除状态:1-删除,0-未删',
  `create_by` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES (1, 'admin', 'ec676087e4b137042ecaa3a2c865310d', NULL, 'walk_code@163.com', NULL, '拥有一切权限。', 0, NULL, 2, NULL, 0, NULL, '2018-11-21 12:09:25', '2019-02-11 17:29:31');
INSERT INTO `system_user` VALUES (5, 'test', 'd3968747381f065de8d1c9299b3e679f', '', NULL, '123', '测试用户', 0, NULL, 2, NULL, 0, NULL, '2018-12-28 19:08:16', '2019-02-11 19:45:51');

-- ----------------------------
-- Table structure for system_user_group
-- ----------------------------
DROP TABLE IF EXISTS `system_user_group`;
CREATE TABLE `system_user_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户组名称',
  `remark` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user_group
-- ----------------------------
INSERT INTO `system_user_group` VALUES (1, '超级管理员', '拥有一切权限', '2018-12-24 11:27:48', '2018-12-24 11:27:48');
INSERT INTO `system_user_group` VALUES (2, 'test', '测试用户组', '2018-12-24 14:02:25', '2018-12-24 14:02:25');

-- ----------------------------
-- Table structure for system_user_group_detail
-- ----------------------------
DROP TABLE IF EXISTS `system_user_group_detail`;
CREATE TABLE `system_user_group_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NULL DEFAULT NULL COMMENT '用户组id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组与用户明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user_group_detail
-- ----------------------------
INSERT INTO `system_user_group_detail` VALUES (3, 2, 5, '2019-01-10 10:38:47');
INSERT INTO `system_user_group_detail` VALUES (4, 1, 1, '2019-01-18 18:48:23');

-- ----------------------------
-- Table structure for system_user_group_role
-- ----------------------------
DROP TABLE IF EXISTS `system_user_group_role`;
CREATE TABLE `system_user_group_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NULL DEFAULT NULL COMMENT '用户组id',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uidex_role_id_user_group_id`(`user_group_id`, `role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组与角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user_group_role
-- ----------------------------
INSERT INTO `system_user_group_role` VALUES (1, 1, 1, '2018-12-26 15:39:20');
INSERT INTO `system_user_group_role` VALUES (5, 2, 2, '2019-01-11 19:22:28');

-- ----------------------------
-- Table structure for system_user_notify
-- ----------------------------
DROP TABLE IF EXISTS `system_user_notify`;
CREATE TABLE `system_user_notify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_read` tinyint(1) NULL DEFAULT 0 COMMENT '是否已读：0-未读，1-已读',
  `system_user_id` int(11) NULL DEFAULT NULL COMMENT '用户消息所属者\r\n用户消息所属者\r\n用户消息所属者\r\n用户消息所属者',
  `notify_id` int(11) NULL DEFAULT NULL COMMENT 'system_notify的id',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户通知表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
