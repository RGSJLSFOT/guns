/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云mysql
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 47.98.112.121:3306
 Source Schema         : guns

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 13/12/2018 15:14:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父部门id',
  `pids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级ids',
  `simplename` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简称',
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '全称',
  `tips` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提示',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本（乐观锁保留字段）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (24, 1, 0, '[0],', '沃尔玛中国', '沃尔玛中国有限公司', '', NULL);
INSERT INTO `sys_dept` VALUES (25, 2, 24, '[0],[24],', '科技部', '科技部', '', NULL);
INSERT INTO `sys_dept` VALUES (26, 3, 24, '[0],[24],', '运营部', '运营部', '', NULL);
INSERT INTO `sys_dept` VALUES (27, 4, 24, '[0],[24],', '战略部', '战略部', '', NULL);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级字典',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `tips` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提示',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (50, 0, 0, '性别', NULL, 'sys_sex');
INSERT INTO `sys_dict` VALUES (51, 1, 50, '男', NULL, '1');
INSERT INTO `sys_dict` VALUES (52, 2, 50, '女', NULL, '2');
INSERT INTO `sys_dict` VALUES (53, 0, 0, '状态', NULL, 'sys_state');
INSERT INTO `sys_dict` VALUES (54, 1, 53, '启用', NULL, '1');
INSERT INTO `sys_dict` VALUES (55, 2, 53, '禁用', NULL, '2');
INSERT INTO `sys_dict` VALUES (56, 0, 0, '账号状态', NULL, 'account_state');
INSERT INTO `sys_dict` VALUES (57, 1, 56, '启用', NULL, '1');
INSERT INTO `sys_dict` VALUES (58, 2, 56, '冻结', NULL, '2');
INSERT INTO `sys_dict` VALUES (59, 3, 56, '已删除', NULL, '3');
INSERT INTO `sys_dict` VALUES (69, 0, 0, '请假类型', '请假类型', 'tbl_leaveStyle');
INSERT INTO `sys_dict` VALUES (70, 1, 69, '调休', NULL, '0');
INSERT INTO `sys_dict` VALUES (71, 2, 69, '事假', NULL, '1');
INSERT INTO `sys_dict` VALUES (72, 3, 69, '病假', NULL, '2');
INSERT INTO `sys_dict` VALUES (73, 4, 69, '年假', NULL, '3');
INSERT INTO `sys_dict` VALUES (74, 0, 0, '供应商人员状态', '', '1');
INSERT INTO `sys_dict` VALUES (75, 1, 74, '有po', NULL, '0');
INSERT INTO `sys_dict` VALUES (76, 0, 74, '无po', NULL, '1');
INSERT INTO `sys_dict` VALUES (77, 0, 0, '职级', '', 'tbl_professionalLevel');
INSERT INTO `sys_dict` VALUES (78, 1, 77, '初级', NULL, '1');
INSERT INTO `sys_dict` VALUES (79, 2, 77, '中级', NULL, '2');
INSERT INTO `sys_dict` VALUES (80, 3, 77, '高级', NULL, '3');
INSERT INTO `sys_dict` VALUES (81, 0, 0, '岗位', '', 'tbl_position');
INSERT INTO `sys_dict` VALUES (82, 1, 81, '开发', NULL, '1');
INSERT INTO `sys_dict` VALUES (83, 2, 81, '测试', NULL, '2');
INSERT INTO `sys_dict` VALUES (84, 3, 81, '运维', NULL, '3');
INSERT INTO `sys_dict` VALUES (85, 4, 81, 'UI', NULL, '4');
INSERT INTO `sys_dict` VALUES (91, 0, 0, '单据状态', '', 'submitStatus');
INSERT INTO `sys_dict` VALUES (92, 0, 91, '草稿', NULL, '0');
INSERT INTO `sys_dict` VALUES (93, 1, 91, '提交', NULL, '1');
INSERT INTO `sys_dict` VALUES (94, 2, 91, '审核通过', NULL, '2');
INSERT INTO `sys_dict` VALUES (95, 3, 91, '审核不通过', NULL, '3');

-- ----------------------------
-- Table structure for sys_expense
-- ----------------------------
DROP TABLE IF EXISTS `sys_expense`;
CREATE TABLE `sys_expense`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` decimal(20, 2) NULL DEFAULT NULL COMMENT '报销金额',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '描述',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `state` int(11) NULL DEFAULT NULL COMMENT '状态: 1.待提交  2:待审核   3.审核通过 4:驳回',
  `userid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `processId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程定义id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报销表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) NULL DEFAULT NULL COMMENT '管理员id',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否执行成功',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '具体消息',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 217 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单编号',
  `pcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单父编号',
  `pcodes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前菜单的所有父菜单编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url地址',
  `num` int(65) NULL DEFAULT NULL COMMENT '菜单排序号',
  `levels` int(65) NULL DEFAULT NULL COMMENT '菜单层级',
  `ismenu` int(11) NULL DEFAULT NULL COMMENT '是否是菜单（1：是  0：不是）',
  `tips` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` int(65) NULL DEFAULT NULL COMMENT '菜单状态 :  1:启用   0:不启用',
  `isopen` int(11) NULL DEFAULT NULL COMMENT '是否打开:    1:打开   0:不打开',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1072677569146404872 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (105, 'system', '0', '[0],', '系统管理', 'fa-user', '#', 4, 1, 1, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (106, 'mgr', 'system', '[0],[system],', '用户管理', '', '/mgr', 1, 2, 1, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (107, 'mgr_add', 'mgr', '[0],[system],[mgr],', '添加用户', NULL, '/mgr/add', 1, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (108, 'mgr_edit', 'mgr', '[0],[system],[mgr],', '修改用户', NULL, '/mgr/edit', 2, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (109, 'mgr_delete', 'mgr', '[0],[system],[mgr],', '删除用户', NULL, '/mgr/delete', 3, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (110, 'mgr_reset', 'mgr', '[0],[system],[mgr],', '重置密码', NULL, '/mgr/reset', 4, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (111, 'mgr_freeze', 'mgr', '[0],[system],[mgr],', '冻结用户', NULL, '/mgr/freeze', 5, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (112, 'mgr_unfreeze', 'mgr', '[0],[system],[mgr],', '解除冻结用户', NULL, '/mgr/unfreeze', 6, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (113, 'mgr_setRole', 'mgr', '[0],[system],[mgr],', '分配角色', NULL, '/mgr/setRole', 7, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (114, 'role', 'system', '[0],[system],', '角色管理', NULL, '/role', 2, 2, 1, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (115, 'role_add', 'role', '[0],[system],[role],', '添加角色', NULL, '/role/add', 1, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (116, 'role_edit', 'role', '[0],[system],[role],', '修改角色', NULL, '/role/edit', 2, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (117, 'role_remove', 'role', '[0],[system],[role],', '删除角色', NULL, '/role/remove', 3, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (118, 'role_setAuthority', 'role', '[0],[system],[role],', '配置权限', NULL, '/role/setAuthority', 4, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (119, 'menu', 'system', '[0],[system],', '菜单管理', NULL, '/menu', 4, 2, 1, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (120, 'menu_add', 'menu', '[0],[system],[menu],', '添加菜单', NULL, '/menu/add', 1, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (121, 'menu_edit', 'menu', '[0],[system],[menu],', '修改菜单', NULL, '/menu/edit', 2, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (122, 'menu_remove', 'menu', '[0],[system],[menu],', '删除菜单', NULL, '/menu/remove', 3, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (128, 'log', 'system', '[0],[system],', '业务日志', NULL, '/log', 6, 2, 1, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (130, 'druid', 'system', '[0],[system],', '监控管理', NULL, '/druid', 7, 2, 1, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (131, 'dept', 'system', '[0],[system],', '部门管理', NULL, '/dept', 3, 2, 1, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (132, 'dict', 'system', '[0],[system],', '字典管理', NULL, '/dict', 4, 2, 1, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (133, 'loginLog', 'system', '[0],[system],', '登录日志', NULL, '/loginLog', 6, 2, 1, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (134, 'log_clean', 'log', '[0],[system],[log],', '清空日志', NULL, '/log/delLog', 3, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (135, 'dept_add', 'dept', '[0],[system],[dept],', '添加部门', NULL, '/dept/add', 1, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (136, 'dept_update', 'dept', '[0],[system],[dept],', '修改部门', NULL, '/dept/update', 1, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (137, 'dept_delete', 'dept', '[0],[system],[dept],', '删除部门', NULL, '/dept/delete', 1, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (138, 'dict_add', 'dict', '[0],[system],[dict],', '添加字典', NULL, '/dict/add', 1, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (139, 'dict_update', 'dict', '[0],[system],[dict],', '修改字典', NULL, '/dict/update', 1, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (140, 'dict_delete', 'dict', '[0],[system],[dict],', '删除字典', NULL, '/dict/delete', 1, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (141, 'notice', 'system', '[0],[system],', '通知管理', NULL, '/notice', 9, 2, 1, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (142, 'notice_add', 'notice', '[0],[system],[notice],', '添加通知', NULL, '/notice/add', 1, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (143, 'notice_update', 'notice', '[0],[system],[notice],', '修改通知', NULL, '/notice/update', 2, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (144, 'notice_delete', 'notice', '[0],[system],[notice],', '删除通知', NULL, '/notice/delete', 3, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (145, 'hello', '0', '[0],', '通知', 'fa-rocket', '/notice/hello', 1, 1, 1, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (148, 'code', '0', '[0],', '代码生成', 'fa-code', '/code', 3, 1, 1, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (149, 'api_mgr', '0', '[0],', '接口文档', 'fa-leaf', '/swagger-ui.html', 2, 1, 1, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (150, 'to_menu_edit', 'menu', '[0],[system],[menu],', '菜单编辑跳转', '', '/menu/menu_edit', 4, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (151, 'menu_list', 'menu', '[0],[system],[menu],', '菜单列表', '', '/menu/list', 5, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (152, 'to_dept_update', 'dept', '[0],[system],[dept],', '修改部门跳转', '', '/dept/dept_update', 4, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (153, 'dept_list', 'dept', '[0],[system],[dept],', '部门列表', '', '/dept/list', 5, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (154, 'dept_detail', 'dept', '[0],[system],[dept],', '部门详情', '', '/dept/detail', 6, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (155, 'to_dict_edit', 'dict', '[0],[system],[dict],', '修改菜单跳转', '', '/dict/dict_edit', 4, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (156, 'dict_list', 'dict', '[0],[system],[dict],', '字典列表', '', '/dict/list', 5, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (157, 'dict_detail', 'dict', '[0],[system],[dict],', '字典详情', '', '/dict/detail', 6, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (158, 'log_list', 'log', '[0],[system],[log],', '日志列表', '', '/log/list', 2, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (159, 'log_detail', 'log', '[0],[system],[log],', '日志详情', '', '/log/detail', 3, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (160, 'del_login_log', 'loginLog', '[0],[system],[loginLog],', '清空登录日志', '', '/loginLog/delLoginLog', 1, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (161, 'login_log_list', 'loginLog', '[0],[system],[loginLog],', '登录日志列表', '', '/loginLog/list', 2, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (162, 'to_role_edit', 'role', '[0],[system],[role],', '修改角色跳转', '', '/role/role_edit', 5, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (163, 'to_role_assign', 'role', '[0],[system],[role],', '角色分配跳转', '', '/role/role_assign', 6, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (164, 'role_list', 'role', '[0],[system],[role],', '角色列表', '', '/role/list', 7, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (165, 'to_assign_role', 'mgr', '[0],[system],[mgr],', '分配角色跳转', '', '/mgr/role_assign', 8, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (166, 'to_user_edit', 'mgr', '[0],[system],[mgr],', '编辑用户跳转', '', '/mgr/user_edit', 9, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (167, 'mgr_list', 'mgr', '[0],[system],[mgr],', '用户列表', '', '/mgr/list', 10, 3, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (171, 'walmart_vendors', '0', '[0],', '供应商管理', '', '#', 21, 1, 1, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (172, 'walmart_vendorUsers', '0', '[0],', '供应商员工管理', '', '#', 31, 1, 1, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1070251841058521089, 'vendors', 'walmart_vendors', '[0],[walmart_vendors],', '供应商', '', '/vendors', 22, 2, 1, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070251841058521090, 'vendors_list', 'vendors', '[0],[vendors],', '供应商列表', '', '/vendors/list', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070251841058521091, 'vendors_add', 'vendors', '[0],[vendors],', '供应商添加', '', '/vendors/add', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070251841058521092, 'vendors_update', 'vendors', '[0],[vendors],', '供应商更新', '', '/vendors/update', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070251841058521093, 'vendors_delete', 'vendors', '[0],[vendors],', '供应商删除', '', '/vendors/delete', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070251841058521094, 'vendors_detail', 'vendors', '[0],[vendors],', '供应商详情', '', '/vendors/detail', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070252041726607362, 'worktime', 'walmart_vendorUsers', '[0],', '工时', '', '/worktime', 32, 2, 1, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070252041726607363, 'worktime_list', 'worktime', '[0],[worktime],', '工时列表', '', '/worktime/list', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070252041726607364, 'worktime_add', 'worktime', '[0],[worktime],', '工时添加', '', '/worktime/add', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070252041726607365, 'worktime_update', 'worktime', '[0],[worktime],', '工时更新', '', '/worktime/update', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070252041726607366, 'worktime_delete', 'worktime', '[0],[worktime],', '工时删除', '', '/worktime/delete', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070252041726607367, 'worktime_detail', 'worktime', '[0],[worktime],', '工时详情', '', '/worktime/detail', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070501712789266434, 'overTime', 'walmart_vendorUsers', '[0],', '加班', '', '/overTime', 33, 2, 1, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070501712789266435, 'overTime_list', 'overTime', '[0],[overTime],', '加班列表', '', '/overTime/list', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070501712789266436, 'overTime_add', 'overTime', '[0],[overTime],', '加班添加', '', '/overTime/add', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070501712789266437, 'overTime_update', 'overTime', '[0],[overTime],', '加班更新', '', '/overTime/update', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070501712789266438, 'overTime_delete', 'overTime', '[0],[overTime],', '加班删除', '', '/overTime/delete', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070501712789266439, 'overTime_detail', 'overTime', '[0],[overTime],', '加班详情', '', '/overTime/detail', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070503305580408833, 'leaveTime', 'walmart_vendorUsers', '[0],', '请假', '', '/leaveTime', 34, 2, 1, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070503305580408834, 'leaveTime_list', 'leaveTime', '[0],[leaveTime],', '请假列表', '', '/leaveTime/list', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070503305580408835, 'leaveTime_add', 'leaveTime', '[0],[leaveTime],', '请假添加', '', '/leaveTime/add', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070503305580408836, 'leaveTime_update', 'leaveTime', '[0],[leaveTime],', '请假更新', '', '/leaveTime/update', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070503305580408837, 'leaveTime_delete', 'leaveTime', '[0],[leaveTime],', '请假删除', '', '/leaveTime/delete', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070503305580408838, 'leaveTime_detail', 'leaveTime', '[0],[leaveTime],', '请假详情', '', '/leaveTime/detail', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070505884548861954, 'project', 'walmart_vendors', '[0],[walmart_vendors],', '产品项目', '', '/project', 23, 2, 1, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070505884548861955, 'project_list', 'project', '[0],[project],', '产品项目列表', '', '/project/list', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070505884548861956, 'project_add', 'project', '[0],[project],', '产品项目添加', '', '/project/add', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070505884548861957, 'project_update', 'project', '[0],[project],', '产品项目更新', '', '/project/update', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070505884548861958, 'project_delete', 'project', '[0],[project],', '产品项目删除', '', '/project/delete', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070505884548861959, 'project_detail', 'project', '[0],[project],', '产品项目详情', '', '/project/detail', 99, 2, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070589413278453762, 'vendorUser', 'walmart_vendors', '[0],[walmart_vendors],', '供应商员工', '', '/vendorUser', 24, 2, 1, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070589413278453763, 'vendorUser_list', 'vendorUser', '[0],[vendorUser],', '供应商员工列表', '', '/vendorUser/list', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070589413278453764, 'vendorUser_add', 'vendorUser', '[0],[vendorUser],', '供应商员工添加', '', '/vendorUser/add', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070589413278453765, 'vendorUser_update', 'vendorUser', '[0],[vendorUser],', '供应商员工更新', '', '/vendorUser/update', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070589413278453766, 'vendorUser_delete', 'vendorUser', '[0],[vendorUser],', '供应商员工删除', '', '/vendorUser/delete', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070589413278453767, 'vendorUser_detail', 'vendorUser', '[0],[vendorUser],', '供应商员工详情', '', '/vendorUser/detail', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1070589413278453768, 'overTime_submit', 'overTime', '[0],[overTime],', '供应商提交加班', '', '/overTime/submit', 6, 2, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1070589413278453769, 'overTime_audit', 'overTime', '[0],[overTime],', '本部审核加班', '', '/overTime/audit', 7, 2, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1070589413278453770, 'vendor_submit', '0', '[0],', 'vendor_submit', '', 'vendor/submit', 99, 1, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1070589413278453771, 'walmart_audit', '0', '[0],', 'walmart_audit', '', 'walmart/audit', 99, 1, 0, NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1072677569146404866, 'submitRecord', 'walmart_vendorUsers', '[0],[walmart_vendorUsers],', '审核记录', '', '/submitRecord', 99, 2, 1, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1072677569146404867, 'submitRecord_list', 'submitRecord', '[0],[walmart_vendorUsers],[submitRecord],', '审核记录列表', '', '/submitRecord/list', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1072677569146404868, 'submitRecord_add', 'submitRecord', '[0],[walmart_vendorUsers],[submitRecord],', '审核记录添加', '', '/submitRecord/add', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1072677569146404869, 'submitRecord_update', 'submitRecord', '[0],[walmart_vendorUsers],[submitRecord],', '审核记录更新', '', '/submitRecord/update', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1072677569146404870, 'submitRecord_delete', 'submitRecord', '[0],[walmart_vendorUsers],[submitRecord],', '审核记录删除', '', '/submitRecord/delete', 99, 3, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (1072677569146404871, 'submitRecord_detail', 'submitRecord', '[0],[walmart_vendorUsers],[submitRecord],', '审核记录详情', '', '/submitRecord/detail', 99, 3, 0, NULL, 1, 0);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creater` int(11) NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (6, '欢迎', 10, '欢迎使用沃尔玛中国供应商管理系统<p><br></p>', '2017-01-11 08:53:20', 1);
INSERT INTO `sys_notice` VALUES (8, '你好', NULL, '<p>Hellow World！</p>', '2017-05-10 19:28:57', 1);

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log`  (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logtype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志类型',
  `logname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) NULL DEFAULT NULL COMMENT '用户id',
  `classname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类名称',
  `method` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '方法名称',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否成功',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 747 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_relation`;
CREATE TABLE `sys_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menuid` bigint(11) NULL DEFAULT NULL COMMENT '菜单id',
  `roleid` int(11) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5178 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_relation
-- ----------------------------
INSERT INTO `sys_relation` VALUES (3377, 105, 5);
INSERT INTO `sys_relation` VALUES (3378, 106, 5);
INSERT INTO `sys_relation` VALUES (3379, 107, 5);
INSERT INTO `sys_relation` VALUES (3380, 108, 5);
INSERT INTO `sys_relation` VALUES (3381, 109, 5);
INSERT INTO `sys_relation` VALUES (3382, 110, 5);
INSERT INTO `sys_relation` VALUES (3383, 111, 5);
INSERT INTO `sys_relation` VALUES (3384, 112, 5);
INSERT INTO `sys_relation` VALUES (3385, 113, 5);
INSERT INTO `sys_relation` VALUES (3386, 114, 5);
INSERT INTO `sys_relation` VALUES (3387, 115, 5);
INSERT INTO `sys_relation` VALUES (3388, 116, 5);
INSERT INTO `sys_relation` VALUES (3389, 117, 5);
INSERT INTO `sys_relation` VALUES (3390, 118, 5);
INSERT INTO `sys_relation` VALUES (3391, 119, 5);
INSERT INTO `sys_relation` VALUES (3392, 120, 5);
INSERT INTO `sys_relation` VALUES (3393, 121, 5);
INSERT INTO `sys_relation` VALUES (3394, 122, 5);
INSERT INTO `sys_relation` VALUES (3395, 150, 5);
INSERT INTO `sys_relation` VALUES (3396, 151, 5);
INSERT INTO `sys_relation` VALUES (4412, 105, 6);
INSERT INTO `sys_relation` VALUES (4413, 106, 6);
INSERT INTO `sys_relation` VALUES (4414, 107, 6);
INSERT INTO `sys_relation` VALUES (4415, 108, 6);
INSERT INTO `sys_relation` VALUES (4416, 109, 6);
INSERT INTO `sys_relation` VALUES (4417, 110, 6);
INSERT INTO `sys_relation` VALUES (4418, 111, 6);
INSERT INTO `sys_relation` VALUES (4419, 112, 6);
INSERT INTO `sys_relation` VALUES (4420, 113, 6);
INSERT INTO `sys_relation` VALUES (4421, 165, 6);
INSERT INTO `sys_relation` VALUES (4422, 166, 6);
INSERT INTO `sys_relation` VALUES (4423, 167, 6);
INSERT INTO `sys_relation` VALUES (4424, 114, 6);
INSERT INTO `sys_relation` VALUES (4425, 115, 6);
INSERT INTO `sys_relation` VALUES (4426, 116, 6);
INSERT INTO `sys_relation` VALUES (4427, 117, 6);
INSERT INTO `sys_relation` VALUES (4428, 118, 6);
INSERT INTO `sys_relation` VALUES (4429, 162, 6);
INSERT INTO `sys_relation` VALUES (4430, 163, 6);
INSERT INTO `sys_relation` VALUES (4431, 164, 6);
INSERT INTO `sys_relation` VALUES (4432, 1070251841058521089, 6);
INSERT INTO `sys_relation` VALUES (4433, 1070251841058521090, 6);
INSERT INTO `sys_relation` VALUES (4434, 1070251841058521091, 6);
INSERT INTO `sys_relation` VALUES (4435, 1070251841058521092, 6);
INSERT INTO `sys_relation` VALUES (4436, 1070251841058521093, 6);
INSERT INTO `sys_relation` VALUES (4437, 1070251841058521094, 6);
INSERT INTO `sys_relation` VALUES (4438, 1070252041726607362, 6);
INSERT INTO `sys_relation` VALUES (4439, 1070252041726607363, 6);
INSERT INTO `sys_relation` VALUES (4440, 1070252041726607364, 6);
INSERT INTO `sys_relation` VALUES (4441, 1070252041726607365, 6);
INSERT INTO `sys_relation` VALUES (4442, 1070252041726607366, 6);
INSERT INTO `sys_relation` VALUES (4443, 1070252041726607367, 6);
INSERT INTO `sys_relation` VALUES (4444, 1070501712789266434, 6);
INSERT INTO `sys_relation` VALUES (4445, 1070501712789266435, 6);
INSERT INTO `sys_relation` VALUES (4446, 1070501712789266436, 6);
INSERT INTO `sys_relation` VALUES (4447, 1070501712789266437, 6);
INSERT INTO `sys_relation` VALUES (4448, 1070501712789266438, 6);
INSERT INTO `sys_relation` VALUES (4449, 1070501712789266439, 6);
INSERT INTO `sys_relation` VALUES (4450, 1070503305580408833, 6);
INSERT INTO `sys_relation` VALUES (4451, 1070503305580408834, 6);
INSERT INTO `sys_relation` VALUES (4452, 1070503305580408835, 6);
INSERT INTO `sys_relation` VALUES (4453, 1070503305580408836, 6);
INSERT INTO `sys_relation` VALUES (4454, 1070503305580408837, 6);
INSERT INTO `sys_relation` VALUES (4455, 1070503305580408838, 6);
INSERT INTO `sys_relation` VALUES (4456, 1070505884548861954, 6);
INSERT INTO `sys_relation` VALUES (4457, 1070505884548861955, 6);
INSERT INTO `sys_relation` VALUES (4458, 1070505884548861956, 6);
INSERT INTO `sys_relation` VALUES (4459, 1070505884548861957, 6);
INSERT INTO `sys_relation` VALUES (4460, 1070505884548861958, 6);
INSERT INTO `sys_relation` VALUES (4461, 1070505884548861959, 6);
INSERT INTO `sys_relation` VALUES (4746, 172, 8);
INSERT INTO `sys_relation` VALUES (4747, 1070252041726607362, 8);
INSERT INTO `sys_relation` VALUES (4748, 1070252041726607363, 8);
INSERT INTO `sys_relation` VALUES (4749, 1070252041726607364, 8);
INSERT INTO `sys_relation` VALUES (4750, 1070252041726607365, 8);
INSERT INTO `sys_relation` VALUES (4751, 1070252041726607366, 8);
INSERT INTO `sys_relation` VALUES (4752, 1070252041726607367, 8);
INSERT INTO `sys_relation` VALUES (4753, 1070501712789266434, 8);
INSERT INTO `sys_relation` VALUES (4754, 1070501712789266435, 8);
INSERT INTO `sys_relation` VALUES (4755, 1070501712789266436, 8);
INSERT INTO `sys_relation` VALUES (4756, 1070501712789266437, 8);
INSERT INTO `sys_relation` VALUES (4757, 1070501712789266438, 8);
INSERT INTO `sys_relation` VALUES (4758, 1070501712789266439, 8);
INSERT INTO `sys_relation` VALUES (4759, 1070589413278453768, 8);
INSERT INTO `sys_relation` VALUES (4760, 1070589413278453769, 8);
INSERT INTO `sys_relation` VALUES (4761, 1070503305580408833, 8);
INSERT INTO `sys_relation` VALUES (4762, 1070503305580408834, 8);
INSERT INTO `sys_relation` VALUES (4763, 1070503305580408835, 8);
INSERT INTO `sys_relation` VALUES (4764, 1070503305580408836, 8);
INSERT INTO `sys_relation` VALUES (4765, 1070503305580408837, 8);
INSERT INTO `sys_relation` VALUES (4766, 1070503305580408838, 8);
INSERT INTO `sys_relation` VALUES (4767, 1070589413278453770, 8);
INSERT INTO `sys_relation` VALUES (4863, 105, 1);
INSERT INTO `sys_relation` VALUES (4864, 106, 1);
INSERT INTO `sys_relation` VALUES (4865, 107, 1);
INSERT INTO `sys_relation` VALUES (4866, 108, 1);
INSERT INTO `sys_relation` VALUES (4867, 109, 1);
INSERT INTO `sys_relation` VALUES (4868, 110, 1);
INSERT INTO `sys_relation` VALUES (4869, 111, 1);
INSERT INTO `sys_relation` VALUES (4870, 112, 1);
INSERT INTO `sys_relation` VALUES (4871, 113, 1);
INSERT INTO `sys_relation` VALUES (4872, 165, 1);
INSERT INTO `sys_relation` VALUES (4873, 166, 1);
INSERT INTO `sys_relation` VALUES (4874, 167, 1);
INSERT INTO `sys_relation` VALUES (4875, 114, 1);
INSERT INTO `sys_relation` VALUES (4876, 115, 1);
INSERT INTO `sys_relation` VALUES (4877, 116, 1);
INSERT INTO `sys_relation` VALUES (4878, 117, 1);
INSERT INTO `sys_relation` VALUES (4879, 118, 1);
INSERT INTO `sys_relation` VALUES (4880, 162, 1);
INSERT INTO `sys_relation` VALUES (4881, 163, 1);
INSERT INTO `sys_relation` VALUES (4882, 164, 1);
INSERT INTO `sys_relation` VALUES (4883, 119, 1);
INSERT INTO `sys_relation` VALUES (4884, 120, 1);
INSERT INTO `sys_relation` VALUES (4885, 121, 1);
INSERT INTO `sys_relation` VALUES (4886, 122, 1);
INSERT INTO `sys_relation` VALUES (4887, 150, 1);
INSERT INTO `sys_relation` VALUES (4888, 151, 1);
INSERT INTO `sys_relation` VALUES (4889, 128, 1);
INSERT INTO `sys_relation` VALUES (4890, 134, 1);
INSERT INTO `sys_relation` VALUES (4891, 158, 1);
INSERT INTO `sys_relation` VALUES (4892, 159, 1);
INSERT INTO `sys_relation` VALUES (4893, 130, 1);
INSERT INTO `sys_relation` VALUES (4894, 131, 1);
INSERT INTO `sys_relation` VALUES (4895, 135, 1);
INSERT INTO `sys_relation` VALUES (4896, 136, 1);
INSERT INTO `sys_relation` VALUES (4897, 137, 1);
INSERT INTO `sys_relation` VALUES (4898, 152, 1);
INSERT INTO `sys_relation` VALUES (4899, 153, 1);
INSERT INTO `sys_relation` VALUES (4900, 154, 1);
INSERT INTO `sys_relation` VALUES (4901, 132, 1);
INSERT INTO `sys_relation` VALUES (4902, 138, 1);
INSERT INTO `sys_relation` VALUES (4903, 139, 1);
INSERT INTO `sys_relation` VALUES (4904, 140, 1);
INSERT INTO `sys_relation` VALUES (4905, 155, 1);
INSERT INTO `sys_relation` VALUES (4906, 156, 1);
INSERT INTO `sys_relation` VALUES (4907, 157, 1);
INSERT INTO `sys_relation` VALUES (4908, 133, 1);
INSERT INTO `sys_relation` VALUES (4909, 160, 1);
INSERT INTO `sys_relation` VALUES (4910, 161, 1);
INSERT INTO `sys_relation` VALUES (4911, 141, 1);
INSERT INTO `sys_relation` VALUES (4912, 142, 1);
INSERT INTO `sys_relation` VALUES (4913, 143, 1);
INSERT INTO `sys_relation` VALUES (4914, 144, 1);
INSERT INTO `sys_relation` VALUES (4915, 145, 1);
INSERT INTO `sys_relation` VALUES (4916, 148, 1);
INSERT INTO `sys_relation` VALUES (4917, 149, 1);
INSERT INTO `sys_relation` VALUES (4918, 171, 1);
INSERT INTO `sys_relation` VALUES (4919, 1070251841058521089, 1);
INSERT INTO `sys_relation` VALUES (4920, 1070251841058521090, 1);
INSERT INTO `sys_relation` VALUES (4921, 1070251841058521091, 1);
INSERT INTO `sys_relation` VALUES (4922, 1070251841058521092, 1);
INSERT INTO `sys_relation` VALUES (4923, 1070251841058521093, 1);
INSERT INTO `sys_relation` VALUES (4924, 1070251841058521094, 1);
INSERT INTO `sys_relation` VALUES (4925, 1070505884548861954, 1);
INSERT INTO `sys_relation` VALUES (4926, 1070505884548861955, 1);
INSERT INTO `sys_relation` VALUES (4927, 1070505884548861956, 1);
INSERT INTO `sys_relation` VALUES (4928, 1070505884548861957, 1);
INSERT INTO `sys_relation` VALUES (4929, 1070505884548861958, 1);
INSERT INTO `sys_relation` VALUES (4930, 1070505884548861959, 1);
INSERT INTO `sys_relation` VALUES (4931, 1070589413278453762, 1);
INSERT INTO `sys_relation` VALUES (4932, 1070589413278453763, 1);
INSERT INTO `sys_relation` VALUES (4933, 1070589413278453764, 1);
INSERT INTO `sys_relation` VALUES (4934, 1070589413278453765, 1);
INSERT INTO `sys_relation` VALUES (4935, 1070589413278453766, 1);
INSERT INTO `sys_relation` VALUES (4936, 1070589413278453767, 1);
INSERT INTO `sys_relation` VALUES (4937, 172, 1);
INSERT INTO `sys_relation` VALUES (4938, 1070252041726607362, 1);
INSERT INTO `sys_relation` VALUES (4939, 1070252041726607363, 1);
INSERT INTO `sys_relation` VALUES (4940, 1070252041726607364, 1);
INSERT INTO `sys_relation` VALUES (4941, 1070252041726607365, 1);
INSERT INTO `sys_relation` VALUES (4942, 1070252041726607366, 1);
INSERT INTO `sys_relation` VALUES (4943, 1070252041726607367, 1);
INSERT INTO `sys_relation` VALUES (4944, 1070501712789266434, 1);
INSERT INTO `sys_relation` VALUES (4945, 1070501712789266435, 1);
INSERT INTO `sys_relation` VALUES (4946, 1070501712789266436, 1);
INSERT INTO `sys_relation` VALUES (4947, 1070501712789266437, 1);
INSERT INTO `sys_relation` VALUES (4948, 1070501712789266438, 1);
INSERT INTO `sys_relation` VALUES (4949, 1070501712789266439, 1);
INSERT INTO `sys_relation` VALUES (4950, 1070589413278453768, 1);
INSERT INTO `sys_relation` VALUES (4951, 1070589413278453769, 1);
INSERT INTO `sys_relation` VALUES (4952, 1070503305580408833, 1);
INSERT INTO `sys_relation` VALUES (4953, 1070503305580408834, 1);
INSERT INTO `sys_relation` VALUES (4954, 1070503305580408835, 1);
INSERT INTO `sys_relation` VALUES (4955, 1070503305580408836, 1);
INSERT INTO `sys_relation` VALUES (4956, 1070503305580408837, 1);
INSERT INTO `sys_relation` VALUES (4957, 1070503305580408838, 1);
INSERT INTO `sys_relation` VALUES (4958, 1072677569146404866, 1);
INSERT INTO `sys_relation` VALUES (4959, 1072677569146404867, 1);
INSERT INTO `sys_relation` VALUES (4960, 1072677569146404868, 1);
INSERT INTO `sys_relation` VALUES (4961, 1072677569146404869, 1);
INSERT INTO `sys_relation` VALUES (4962, 1072677569146404870, 1);
INSERT INTO `sys_relation` VALUES (4963, 1072677569146404871, 1);
INSERT INTO `sys_relation` VALUES (5040, 105, 7);
INSERT INTO `sys_relation` VALUES (5041, 106, 7);
INSERT INTO `sys_relation` VALUES (5042, 107, 7);
INSERT INTO `sys_relation` VALUES (5043, 108, 7);
INSERT INTO `sys_relation` VALUES (5044, 109, 7);
INSERT INTO `sys_relation` VALUES (5045, 110, 7);
INSERT INTO `sys_relation` VALUES (5046, 111, 7);
INSERT INTO `sys_relation` VALUES (5047, 112, 7);
INSERT INTO `sys_relation` VALUES (5048, 113, 7);
INSERT INTO `sys_relation` VALUES (5049, 165, 7);
INSERT INTO `sys_relation` VALUES (5050, 166, 7);
INSERT INTO `sys_relation` VALUES (5051, 167, 7);
INSERT INTO `sys_relation` VALUES (5052, 171, 7);
INSERT INTO `sys_relation` VALUES (5053, 1070251841058521089, 7);
INSERT INTO `sys_relation` VALUES (5054, 1070251841058521090, 7);
INSERT INTO `sys_relation` VALUES (5055, 1070251841058521091, 7);
INSERT INTO `sys_relation` VALUES (5056, 1070251841058521092, 7);
INSERT INTO `sys_relation` VALUES (5057, 1070251841058521093, 7);
INSERT INTO `sys_relation` VALUES (5058, 1070251841058521094, 7);
INSERT INTO `sys_relation` VALUES (5059, 1070505884548861954, 7);
INSERT INTO `sys_relation` VALUES (5060, 1070505884548861955, 7);
INSERT INTO `sys_relation` VALUES (5061, 1070505884548861956, 7);
INSERT INTO `sys_relation` VALUES (5062, 1070505884548861957, 7);
INSERT INTO `sys_relation` VALUES (5063, 1070505884548861958, 7);
INSERT INTO `sys_relation` VALUES (5064, 1070505884548861959, 7);
INSERT INTO `sys_relation` VALUES (5065, 1070589413278453762, 7);
INSERT INTO `sys_relation` VALUES (5066, 1070589413278453763, 7);
INSERT INTO `sys_relation` VALUES (5067, 1070589413278453764, 7);
INSERT INTO `sys_relation` VALUES (5068, 1070589413278453765, 7);
INSERT INTO `sys_relation` VALUES (5069, 1070589413278453766, 7);
INSERT INTO `sys_relation` VALUES (5070, 1070589413278453767, 7);
INSERT INTO `sys_relation` VALUES (5071, 172, 7);
INSERT INTO `sys_relation` VALUES (5072, 1070252041726607362, 7);
INSERT INTO `sys_relation` VALUES (5073, 1070252041726607363, 7);
INSERT INTO `sys_relation` VALUES (5074, 1070252041726607364, 7);
INSERT INTO `sys_relation` VALUES (5075, 1070252041726607365, 7);
INSERT INTO `sys_relation` VALUES (5076, 1070252041726607366, 7);
INSERT INTO `sys_relation` VALUES (5077, 1070252041726607367, 7);
INSERT INTO `sys_relation` VALUES (5078, 1070501712789266434, 7);
INSERT INTO `sys_relation` VALUES (5079, 1070501712789266435, 7);
INSERT INTO `sys_relation` VALUES (5080, 1070501712789266436, 7);
INSERT INTO `sys_relation` VALUES (5081, 1070501712789266437, 7);
INSERT INTO `sys_relation` VALUES (5082, 1070501712789266438, 7);
INSERT INTO `sys_relation` VALUES (5083, 1070501712789266439, 7);
INSERT INTO `sys_relation` VALUES (5084, 1070503305580408833, 7);
INSERT INTO `sys_relation` VALUES (5085, 1070503305580408834, 7);
INSERT INTO `sys_relation` VALUES (5086, 1070503305580408835, 7);
INSERT INTO `sys_relation` VALUES (5087, 1070503305580408836, 7);
INSERT INTO `sys_relation` VALUES (5088, 1070503305580408837, 7);
INSERT INTO `sys_relation` VALUES (5089, 1070503305580408838, 7);
INSERT INTO `sys_relation` VALUES (5090, 1072677569146404866, 7);
INSERT INTO `sys_relation` VALUES (5091, 1072677569146404867, 7);
INSERT INTO `sys_relation` VALUES (5092, 1072677569146404868, 7);
INSERT INTO `sys_relation` VALUES (5093, 1072677569146404869, 7);
INSERT INTO `sys_relation` VALUES (5094, 1072677569146404870, 7);
INSERT INTO `sys_relation` VALUES (5095, 1072677569146404871, 7);
INSERT INTO `sys_relation` VALUES (5137, 171, 9);
INSERT INTO `sys_relation` VALUES (5138, 1070251841058521089, 9);
INSERT INTO `sys_relation` VALUES (5139, 1070251841058521090, 9);
INSERT INTO `sys_relation` VALUES (5140, 1070251841058521091, 9);
INSERT INTO `sys_relation` VALUES (5141, 1070251841058521092, 9);
INSERT INTO `sys_relation` VALUES (5142, 1070251841058521093, 9);
INSERT INTO `sys_relation` VALUES (5143, 1070251841058521094, 9);
INSERT INTO `sys_relation` VALUES (5144, 1070505884548861954, 9);
INSERT INTO `sys_relation` VALUES (5145, 1070505884548861955, 9);
INSERT INTO `sys_relation` VALUES (5146, 1070505884548861956, 9);
INSERT INTO `sys_relation` VALUES (5147, 1070505884548861957, 9);
INSERT INTO `sys_relation` VALUES (5148, 1070505884548861958, 9);
INSERT INTO `sys_relation` VALUES (5149, 1070505884548861959, 9);
INSERT INTO `sys_relation` VALUES (5150, 1070589413278453762, 9);
INSERT INTO `sys_relation` VALUES (5151, 1070589413278453763, 9);
INSERT INTO `sys_relation` VALUES (5152, 1070589413278453764, 9);
INSERT INTO `sys_relation` VALUES (5153, 1070589413278453765, 9);
INSERT INTO `sys_relation` VALUES (5154, 1070589413278453766, 9);
INSERT INTO `sys_relation` VALUES (5155, 1070589413278453767, 9);
INSERT INTO `sys_relation` VALUES (5156, 172, 9);
INSERT INTO `sys_relation` VALUES (5157, 1070252041726607362, 9);
INSERT INTO `sys_relation` VALUES (5158, 1070252041726607363, 9);
INSERT INTO `sys_relation` VALUES (5159, 1070252041726607364, 9);
INSERT INTO `sys_relation` VALUES (5160, 1070252041726607365, 9);
INSERT INTO `sys_relation` VALUES (5161, 1070252041726607366, 9);
INSERT INTO `sys_relation` VALUES (5162, 1070252041726607367, 9);
INSERT INTO `sys_relation` VALUES (5163, 1070501712789266434, 9);
INSERT INTO `sys_relation` VALUES (5164, 1070501712789266435, 9);
INSERT INTO `sys_relation` VALUES (5165, 1070501712789266436, 9);
INSERT INTO `sys_relation` VALUES (5166, 1070501712789266437, 9);
INSERT INTO `sys_relation` VALUES (5167, 1070501712789266438, 9);
INSERT INTO `sys_relation` VALUES (5168, 1070501712789266439, 9);
INSERT INTO `sys_relation` VALUES (5169, 1070589413278453768, 9);
INSERT INTO `sys_relation` VALUES (5170, 1070589413278453769, 9);
INSERT INTO `sys_relation` VALUES (5171, 1070503305580408833, 9);
INSERT INTO `sys_relation` VALUES (5172, 1070503305580408834, 9);
INSERT INTO `sys_relation` VALUES (5173, 1070503305580408835, 9);
INSERT INTO `sys_relation` VALUES (5174, 1070503305580408836, 9);
INSERT INTO `sys_relation` VALUES (5175, 1070503305580408837, 9);
INSERT INTO `sys_relation` VALUES (5176, 1070503305580408838, 9);
INSERT INTO `sys_relation` VALUES (5177, 1070589413278453771, 9);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) NULL DEFAULT NULL COMMENT '序号',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父角色id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `deptid` int(11) NULL DEFAULT NULL COMMENT '部门名称',
  `tips` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提示',
  `version` int(11) NULL DEFAULT NULL COMMENT '保留字段(暂时没用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 1, 0, '超级管理员', 24, 'administrator', 1);
INSERT INTO `sys_role` VALUES (5, 2, 1, '临时', 26, 'temp', NULL);
INSERT INTO `sys_role` VALUES (6, 1, 1, '部门长', 25, '部门经理', NULL);
INSERT INTO `sys_role` VALUES (7, 2, 6, '组长', 25, '项目负责人', NULL);
INSERT INTO `sys_role` VALUES (8, NULL, 7, '供应商职员', 25, '供应商职员', NULL);
INSERT INTO `sys_role` VALUES (9, NULL, 7, '本部职员', 25, '沃尔玛职员', NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `account` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'md5密码盐',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `sex` int(11) NULL DEFAULT NULL COMMENT '性别（1：男 2：女）',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `roleid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `deptid` int(11) NULL DEFAULT NULL COMMENT '部门id',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态(1：启用  2：冻结  3：删除）',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `version` int(11) NULL DEFAULT NULL COMMENT '保留字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `INDEX_UNI_ACCOUNT`(`account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'girl.gif', 'admin', '9b3e6e1c69fa52ada33ed46275c88b3a', 'siwxg', '张三', '2017-05-04 11:00:00', 2, 'sn93@qq.com', '18200000000', '1', 27, 1, '2016-03-29 08:49:53', 25);
INSERT INTO `sys_user` VALUES (55, '-', 'vn0bz5u', 'e476f1c1703af2e707c42dee89ee296f', 'p3fsf', '任广森', '2018-12-07 00:00:00', 2, '1291117164@qq.com', '189', '8', 25, 1, '2018-12-07 17:14:17', NULL);
INSERT INTO `sys_user` VALUES (56, '', 'kevin', 'ed6d7b7310bd8776db89c8968ead0e2c', '5v7fj', '陈', '2018-11-25 00:00:00', 1, '1294@qq.com', '', '9', 25, 1, '2018-12-09 21:24:20', NULL);
INSERT INTO `sys_user` VALUES (58, '-', 'vn05suo', 'b8f938028d75dc31841bd7f72fa14657', 'ifjw1', '刘国华', '2018-12-10 00:00:00', 1, '947626340@qq.com', '18565684816', NULL, 25, 1, '2018-12-10 19:03:11', NULL);

-- ----------------------------
-- Table structure for tbl_leaveTime
-- ----------------------------
DROP TABLE IF EXISTS `tbl_leaveTime`;
CREATE TABLE `tbl_leaveTime`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL,
  `startTime` datetime(0) NULL DEFAULT NULL,
  `endTime` datetime(0) NULL DEFAULT NULL,
  `leaveType` int(1) NULL DEFAULT NULL,
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `submitStatus` tinyint(2) NOT NULL COMMENT '提交状态(0:草稿 1:提交 2:审核通过 3:否决)',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_overTime
-- ----------------------------
DROP TABLE IF EXISTS `tbl_overTime`;
CREATE TABLE `tbl_overTime`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `startTime` datetime(0) NULL DEFAULT NULL,
  `endTime` datetime(0) NULL DEFAULT NULL,
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `submitStatus` int(1) NOT NULL COMMENT '提交状态(0:草稿 1:提交 2:审核通过 3:否决)',
  `overTimeHour` int(2) NULL DEFAULT NULL COMMENT '加班时长',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_project
-- ----------------------------
DROP TABLE IF EXISTS `tbl_project`;
CREATE TABLE `tbl_project`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projectKey` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `responsiblePersion` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentId` int(2) NULL DEFAULT NULL,
  `description` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_project
-- ----------------------------
INSERT INTO `tbl_project` VALUES (1, '速购小程序', 'seos', 'Spring', 0, '速购小程序', '2018-12-06 12:46:04', '2018-12-06 12:46:04');
INSERT INTO `tbl_project` VALUES (2, '扫码购', 'SCANGO', 'Kevin', 1, '扫码购', '2018-12-07 10:55:23', '2018-12-07 10:55:23');
INSERT INTO `tbl_project` VALUES (4, '京东到家', 'JDDJ', 'spring', NULL, '京东到家', '2018-12-12 18:35:40', '2018-12-12 18:35:40');

-- ----------------------------
-- Table structure for tbl_submitRecord
-- ----------------------------
DROP TABLE IF EXISTS `tbl_submitRecord`;
CREATE TABLE `tbl_submitRecord`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NULL DEFAULT NULL COMMENT '1 工时 2 加班 3请假',
  `ywId` int(11) NULL DEFAULT NULL,
  `submitUserId` int(11) NULL DEFAULT NULL,
  `submitTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `auditUserId` int(11) NULL DEFAULT NULL,
  `auditTime` timestamp(0) NULL DEFAULT NULL,
  `auditResult` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_vendorUser
-- ----------------------------
DROP TABLE IF EXISTS `tbl_vendorUser`;
CREATE TABLE `tbl_vendorUser`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userNO` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pwd` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userNameCh` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userNameEn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` int(1) NULL DEFAULT NULL,
  `leaderId` int(11) NULL DEFAULT NULL,
  `professionalLevel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleId` int(11) NULL DEFAULT NULL,
  `vendorId` int(11) NULL DEFAULT NULL,
  `projectId` int(11) NULL DEFAULT NULL,
  `hiringStatus` int(1) NULL DEFAULT NULL,
  `positionId` int(11) NULL DEFAULT NULL,
  `entryTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `photo` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uptdaeTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `salt` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'md5密码盐',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `Unique_index_userId`(`userNO`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_vendorUser
-- ----------------------------
INSERT INTO `tbl_vendorUser` VALUES (55, 'vn0bz5u', '0775bb4f5353423a8700e861ab0a9b80', '任广森', 'guangsen', 2, 56, '2', '1291117164@qq.com', '189', 8, 6, NULL, 1, 3, '2018-12-10 11:27:00', '', '2018-12-07 17:14:17', '2018-12-07 17:14:17', 'lqir8');
INSERT INTO `tbl_vendorUser` VALUES (56, 'vn05suo', 'b8f938028d75dc31841bd7f72fa14657', '刘国华', 'liuguohua', 1, 1, '1', '947626340', '18565684816', 8, 6, 1, 1, 1, '2018-12-09 10:00:00', '', '2018-12-10 19:03:11', '2018-12-10 19:03:11', 'ifjw1');

-- ----------------------------
-- Table structure for tbl_vendors
-- ----------------------------
DROP TABLE IF EXISTS `tbl_vendors`;
CREATE TABLE `tbl_vendors`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `vendorNameCh` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vendorNameEn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `responsiblePerson` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_vendors
-- ----------------------------
INSERT INTO `tbl_vendors` VALUES (6, '快找网络科技', 'kzwlkj', '深圳宝安', '133', '133', '向晓梅', '2018-12-07 17:13:30', '2018-12-07 17:13:30');
INSERT INTO `tbl_vendors` VALUES (8, '法本', 'fb', '深圳', '18986021795', '129111@qq.com', '法本hr', '2018-12-12 18:35:06', '2018-12-12 18:35:06');

-- ----------------------------
-- Table structure for tbl_worktime
-- ----------------------------
DROP TABLE IF EXISTS `tbl_worktime`;
CREATE TABLE `tbl_worktime`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL,
  `week` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `workDate` date NULL DEFAULT NULL,
  `startTime` timestamp(0) NULL DEFAULT NULL,
  `endTime` timestamp(0) NULL DEFAULT NULL,
  `workTime` decimal(10, 3) NULL DEFAULT NULL,
  `overTime` decimal(10, 3) NULL DEFAULT NULL,
  `content` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `submitStatus` int(1) NOT NULL COMMENT '提交状态(0:草稿 1:提交 2:审核通过 3:否决)',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `aaa` int(11) NOT NULL AUTO_INCREMENT,
  `bbb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`aaa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Triggers structure for table sys_user
-- ----------------------------
DROP TRIGGER IF EXISTS `tib_sys_user`;
delimiter ;;
CREATE TRIGGER `tib_sys_user` AFTER INSERT ON `sys_user` FOR EACH ROW BEGIN
  
	INSERT INTO sso_server.sys_user (USER_ID, AVATAR, ACCOUNT, PASSWORD, SALT, NAME, BIRTHDAY, SEX, EMAIL, PHONE, STATUS, CREATE_TIME, UPDATE_TIME )
	VALUES
		( NEW.id, NEW.AVATAR, NEW.ACCOUNT, NEW.PASSWORD, NEW.SALT, NEW.NAME, NEW.BIRTHDAY, NEW.SEX, NEW.EMAIL, NEW.PHONE, NEW.STATUS,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP );

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table sys_user
-- ----------------------------
DROP TRIGGER IF EXISTS `tub_sys_user`;
delimiter ;;
CREATE TRIGGER `tub_sys_user` AFTER UPDATE ON `sys_user` FOR EACH ROW BEGIN
		UPDATE sso_server.sys_user 
		SET USER_ID = NEW.id,
		AVATAR = NEW.AVATAR,
		ACCOUNT = NEW.ACCOUNT,
		PASSWORD = NEW.PASSWORD,
		SALT = NEW.SALT,
		NAME = NEW.NAME,
		BIRTHDAY = NEW.BIRTHDAY,
		SEX = NEW.SEX,
		EMAIL = NEW.EMAIL,
		PHONE = NEW.PHONE,
		STATUS = NEW.STATUS,
		UPDATE_TIME = CURRENT_TIMESTAMP 
	WHERE
		USER_ID = NEW.id;

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table tbl_vendorUser
-- ----------------------------
DROP TRIGGER IF EXISTS `tib_vendor_user`;
delimiter ;;
CREATE TRIGGER `tib_vendor_user` AFTER INSERT ON `tbl_vendorUser` FOR EACH ROW BEGIN
	
	INSERT INTO sys_user ( AVATAR, ACCOUNT, PASSWORD, SALT, NAME, BIRTHDAY, SEX, EMAIL, PHONE, STATUS, CREATETIME )
	VALUES
		( '-',
			NEW.userNO,
			NEW.PWD,
			NEW.SALT,
			NEW.USERNAMEch,
			CURRENT_TIMESTAMP,
			NEW.gender,
			NEW.EMAIL,
			NEW.PHONE,
			1,
			CURRENT_TIMESTAMP  
		);

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;