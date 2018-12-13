/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云mysql
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 47.98.112.121:3306
 Source Schema         : sso_server

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 13/12/2018 15:14:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `USER_ID` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `AVATAR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `ACCOUNT` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `PASSWORD` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `SALT` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'md5密码盐',
  `NAME` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  `BIRTHDAY` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `SEX` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别（M：男 F：女）',
  `EMAIL` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `PHONE` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `STATUS` int(11) NULL DEFAULT NULL COMMENT '状态(1：启用  2：冻结  3：删除）',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (00000000001, 'girl.gif', 'admin', '9b3e6e1c69fa52ada33ed46275c88b3a', 'siwxg', '张三', '2017-05-04 11:00:00', '2', 'sn93@qq.com', '18200000000', 1, NULL, '2018-12-11 10:39:28');
INSERT INTO `sys_user` VALUES (00000000055, '-', 'vn0bz5u', 'e476f1c1703af2e707c42dee89ee296f', 'p3fsf', '任广森', '2018-12-07 00:00:00', '2', '1291117164@qq.com', '189', 1, '2018-12-07 17:14:17', '2018-12-12 17:26:08');
INSERT INTO `sys_user` VALUES (00000000056, '', 'kevin', 'ed6d7b7310bd8776db89c8968ead0e2c', '5v7fj', '陈', '2018-11-25 00:00:00', '1', '1294@qq.com', '', 1, '2018-12-10 11:24:19', '2018-12-12 17:26:42');
INSERT INTO `sys_user` VALUES (00000000058, '-', 'vn05suo', 'b8f938028d75dc31841bd7f72fa14657', 'ifjw1', '刘国华', '2018-12-10 00:00:00', '1', '947626340@qq.com', '18565684816', 1, '2018-12-10 19:03:11', '2018-12-12 17:26:29');

SET FOREIGN_KEY_CHECKS = 1;
