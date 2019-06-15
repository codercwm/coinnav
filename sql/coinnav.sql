/*
 Navicat Premium Data Transfer

 Source Server         : 127
 Source Server Type    : MySQL
 Source Server Version : 50630
 Source Host           : 192.168.3.127:3306
 Source Schema         : coinnav

 Target Server Type    : MySQL
 Target Server Version : 50630
 File Encoding         : 65001

 Date: 28/01/2019 16:10:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for coin_admin
-- ----------------------------
DROP TABLE IF EXISTS `coin_admin`;
CREATE TABLE `coin_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `logintime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录时间',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `token` varchar(59) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coin_admin
-- ----------------------------
INSERT INTO `coin_admin` VALUES (1, 'admin', 'Admin', 'f73b0ed4afdd37f7dc9c02a432e873cb', '1721bb', '/assets/img/avatar.png', 'admin@admin.com', 0, 1548657554, 1492186163, 1548657554, '28b6f091-0374-412a-a0c6-73fcf75e08c1', 'normal');

-- ----------------------------
-- Table structure for coin_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `coin_admin_log`;
CREATE TABLE `coin_admin_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 157 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coin_admin_log
-- ----------------------------
INSERT INTO `coin_admin_log` VALUES (1, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"third\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.5\",\"faversion\":\"1.0.0.20181210_beta\"}', '119.130.228.35', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548061873);
INSERT INTO `coin_admin_log` VALUES (2, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"third\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.5\",\"faversion\":\"1.0.0.20181210_beta\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548062045);
INSERT INTO `coin_admin_log` VALUES (3, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548062046);
INSERT INTO `coin_admin_log` VALUES (4, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"third\",\"action\":\"disable\",\"force\":\"0\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548062374);
INSERT INTO `coin_admin_log` VALUES (5, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548062375);
INSERT INTO `coin_admin_log` VALUES (6, 1, 'admin', '/admin/addon/uninstall', '插件管理 卸载', '{\"name\":\"third\",\"force\":\"0\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548062389);
INSERT INTO `coin_admin_log` VALUES (7, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548062390);
INSERT INTO `coin_admin_log` VALUES (8, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"third\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.5\",\"faversion\":\"1.0.0.20181210_beta\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548062418);
INSERT INTO `coin_admin_log` VALUES (9, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548062419);
INSERT INTO `coin_admin_log` VALUES (10, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"third\",\"action\":\"disable\",\"force\":\"0\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548062427);
INSERT INTO `coin_admin_log` VALUES (11, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548062429);
INSERT INTO `coin_admin_log` VALUES (12, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"third\",\"action\":\"enable\",\"force\":\"0\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548062431);
INSERT INTO `coin_admin_log` VALUES (13, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548062432);
INSERT INTO `coin_admin_log` VALUES (14, 1, 'admin', '/admin/addon/local', '插件管理 本地安装', '{\"name\":\"1.0.0.zip\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548063056);
INSERT INTO `coin_admin_log` VALUES (15, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"baidutongji\",\"action\":\"enable\",\"force\":\"0\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548063057);
INSERT INTO `coin_admin_log` VALUES (16, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548063058);
INSERT INTO `coin_admin_log` VALUES (17, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"baidutongji\",\"action\":\"disable\",\"force\":\"0\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548068651);
INSERT INTO `coin_admin_log` VALUES (18, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548068652);
INSERT INTO `coin_admin_log` VALUES (19, 1, 'admin', '/admin/addon/uninstall', '插件管理 卸载', '{\"name\":\"baidutongji\",\"force\":\"0\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548068657);
INSERT INTO `coin_admin_log` VALUES (20, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548068658);
INSERT INTO `coin_admin_log` VALUES (21, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"baidutongji\",\"force\":\"0\",\"uid\":\"10879\",\"token\":\"1a7c38b5-ed4f-4a5d-ae93-f34911259544\",\"version\":\"1.0.0\",\"faversion\":\"1.0.0.20181210_beta\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548068784);
INSERT INTO `coin_admin_log` VALUES (22, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"baidutongji\",\"force\":\"0\",\"uid\":\"10879\",\"token\":\"1a7c38b5-ed4f-4a5d-ae93-f34911259544\",\"version\":\"1.0.0\",\"faversion\":\"1.0.0.20181210_beta\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548068793);
INSERT INTO `coin_admin_log` VALUES (23, 1, 'admin', '/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"name\":\"\\u5e01\\u822a\",\"beian\":\"\",\"cdnurl\":\"\",\"version\":\"1.0.0\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{\\\"backend\\\":\\\"zh-cn\\\",\\\"frontend\\\":\\\"zh-cn\\\"}\",\"fixedpage\":\"dashboard\"}}', '119.130.228.35', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548069823);
INSERT INTO `coin_admin_log` VALUES (24, 1, 'admin', '/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"name\":\"\\u5e01\\u822a\",\"beian\":\"\",\"cdnurl\":\"\",\"version\":\"1.0.0\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{\\\"backend\\\":\\\"zh-cn\\\",\\\"frontend\\\":\\\"zh-cn\\\"}\",\"fixedpage\":\"dashboard\"}}', '119.130.228.35', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548069869);
INSERT INTO `coin_admin_log` VALUES (25, 1, 'admin', '/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"name\":\"\\u5e01\\u822a\",\"beian\":\"\",\"cdnurl\":\"\",\"version\":\"1.0.0\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{\\\"backend\\\":\\\"zh-cn\\\",\\\"frontend\\\":\\\"zh-cn\\\"}\",\"fixedpage\":\"dashboard\"}}', '119.130.228.35', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548069945);
INSERT INTO `coin_admin_log` VALUES (26, 1, 'admin', '/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"name\":\"\\u5e01\\u822a\",\"beian\":\"\",\"cdnurl\":\"\",\"version\":\"1.0.0\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{\\\"backend\\\":\\\"zh-cn\\\",\\\"frontend\\\":\\\"zh-cn\\\"}\",\"fixedpage\":\"dashboard\"}}', '119.130.228.35', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548069951);
INSERT INTO `coin_admin_log` VALUES (27, 1, 'admin', '/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"name\":\"\\u5e01\\u822a\",\"beian\":\"\",\"cdnurl\":\"\",\"version\":\"1.0.0\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{\\\"backend\\\":\\\"zh-cn\\\",\\\"frontend\\\":\\\"zh-cn\\\"}\",\"fixedpage\":\"dashboard\"}}', '119.130.228.35', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548070013);
INSERT INTO `coin_admin_log` VALUES (28, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"third\",\"action\":\"disable\",\"force\":\"0\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548072973);
INSERT INTO `coin_admin_log` VALUES (29, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548072975);
INSERT INTO `coin_admin_log` VALUES (30, 1, 'admin', '/admin/addon/uninstall', '插件管理 卸载', '{\"name\":\"third\",\"force\":\"0\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548072979);
INSERT INTO `coin_admin_log` VALUES (31, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548072980);
INSERT INTO `coin_admin_log` VALUES (32, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"third\",\"force\":\"0\",\"uid\":\"10879\",\"token\":\"1a7c38b5-ed4f-4a5d-ae93-f34911259544\",\"version\":\"1.0.5\",\"faversion\":\"1.0.0.20181210_beta\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548073024);
INSERT INTO `coin_admin_log` VALUES (33, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548073025);
INSERT INTO `coin_admin_log` VALUES (34, 1, 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"12,5,13,7,11,10,6,9,8,2,4,3,1\",\"changeid\":\"13\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"category\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548073103);
INSERT INTO `coin_admin_log` VALUES (35, 1, 'admin', '/admin/user/rule/multi/ids/11', '会员管理 会员规则 批量更新', '{\"action\":\"\",\"ids\":\"11\",\"params\":\"ismenu=1\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548073316);
INSERT INTO `coin_admin_log` VALUES (36, 1, 'admin', '/admin/user/rule/multi/ids/11', '会员管理 会员规则 批量更新', '{\"action\":\"\",\"ids\":\"11\",\"params\":\"ismenu=0\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548073320);
INSERT INTO `coin_admin_log` VALUES (37, 0, 'Unknown', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"e7c6b7db5e999c1389926b7f8f7944fe\",\"username\":\"admin\",\"captcha\":\"cakl\",\"keeplogin\":\"1\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548144095);
INSERT INTO `coin_admin_log` VALUES (38, 0, 'Unknown', '/admin/index/login?url=%2Fadmin', '', '{\"url\":\"\\/admin\",\"__token__\":\"8679e207e25a82fbb701e789260fca18\",\"username\":\"admin\",\"captcha\":\"cakl\",\"keeplogin\":\"1\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548144099);
INSERT INTO `coin_admin_log` VALUES (39, 0, 'Unknown', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"4131d59f17d54a83d47fab80a1e2db63\",\"username\":\"admin\",\"captcha\":\"dhg5\",\"keeplogin\":\"1\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548144105);
INSERT INTO `coin_admin_log` VALUES (40, 1, 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"411aa16c95c31bea157e5bc6f5dc3ab5\",\"username\":\"admin\",\"captcha\":\"cbqr\",\"keeplogin\":\"1\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548144120);
INSERT INTO `coin_admin_log` VALUES (41, 1, 'admin', '/admin/addon/local', '插件管理 本地安装', '{\"name\":\"1.0.0.zip\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548144132);
INSERT INTO `coin_admin_log` VALUES (42, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"baidutongji\",\"action\":\"enable\",\"force\":\"0\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548144133);
INSERT INTO `coin_admin_log` VALUES (43, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548144134);
INSERT INTO `coin_admin_log` VALUES (44, 1, 'admin', '/admin/addon/config?name=baidutongji&dialog=1', '插件管理 配置', '{\"name\":\"baidutongji\",\"dialog\":\"1\",\"row\":{\"usernmae\":\"cwmcwm\",\"password\":\"Bd17563212\",\"token\":\"a8e8f5b67caf0705eb497846712d0ccd\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548144212);
INSERT INTO `coin_admin_log` VALUES (45, 1, 'admin', '/admin/baidutongji/clearcache', '', '[]', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548144417);
INSERT INTO `coin_admin_log` VALUES (46, 0, 'Unknown', '/admin/index/login?url=%2Fadmin%2Fcategory%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin\\/category?ref=addtabs\",\"__token__\":\"1b80c3ba8a1a770823c668023817fd5f\",\"username\":\"admin\",\"captcha\":\"bckr\",\"keeplogin\":\"1\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548144668);
INSERT INTO `coin_admin_log` VALUES (47, 0, 'Unknown', '/admin/index/login?url=%2Fadmin%2Fcategory%3Fref%3Daddtabs', '', '{\"url\":\"\\/admin\\/category?ref=addtabs\",\"__token__\":\"ab8091ee1188dea6f38552b9044cac27\",\"username\":\"admin\",\"captcha\":\"bckr\",\"keeplogin\":\"1\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548144676);
INSERT INTO `coin_admin_log` VALUES (48, 1, 'admin', '/admin/index/login?url=%2Fadmin%2Fcategory%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin\\/category?ref=addtabs\",\"__token__\":\"ea27f07663b8d59d65a0ea448370f130\",\"username\":\"admin\",\"captcha\":\"puqu\",\"keeplogin\":\"1\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548144683);
INSERT INTO `coin_admin_log` VALUES (49, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"baidutongji\",\"action\":\"disable\",\"force\":\"0\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548144805);
INSERT INTO `coin_admin_log` VALUES (50, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548144806);
INSERT INTO `coin_admin_log` VALUES (51, 1, 'admin', '/admin/addon/uninstall', '插件管理 卸载', '{\"name\":\"baidutongji\",\"force\":\"0\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548144812);
INSERT INTO `coin_admin_log` VALUES (52, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548144813);
INSERT INTO `coin_admin_log` VALUES (53, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"1544682426.png\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548152170);
INSERT INTO `coin_admin_log` VALUES (54, 1, 'admin', '/admin/general/attachment/del/ids/2', '常规管理 附件管理 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548152273);
INSERT INTO `coin_admin_log` VALUES (55, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"\\u5fae\\u4fe1\\u622a\\u56fe_20190121143325.png\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548152315);
INSERT INTO `coin_admin_log` VALUES (56, 1, 'admin', '/admin/general/attachment/del/ids/3', '常规管理 附件管理 删除', '{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548152429);
INSERT INTO `coin_admin_log` VALUES (57, 0, 'Unknown', '/admin/index/login', '登录', '{\"__token__\":\"fd6666f573b59e145e2f8a13ed725fdf\",\"username\":\"admin\",\"captcha\":\"j7sw\"}', '192.168.1.102', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548571660);
INSERT INTO `coin_admin_log` VALUES (58, 0, 'Unknown', '/admin/index/login', '', '{\"__token__\":\"40def0cb5eea3e8ecf31f71f85ac5ef6\",\"username\":\"admin\",\"captcha\":\"j7sw\"}', '192.168.1.102', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548571790);
INSERT INTO `coin_admin_log` VALUES (59, 0, 'Unknown', '/admin/index/login', '登录', '{\"__token__\":\"06acea59aef08f19d8f813ce53476c36\",\"username\":\"admin\",\"captcha\":\"jpep\"}', '192.168.1.102', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548571814);
INSERT INTO `coin_admin_log` VALUES (60, 1, 'admin', '/admin/index/login', '登录', '{\"__token__\":\"22a82a3094025ae90c0e7bcbbf6686e8\",\"username\":\"admin\",\"captcha\":\"3er5\"}', '192.168.1.102', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0', 1548571830);
INSERT INTO `coin_admin_log` VALUES (61, 0, 'Unknown', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"99a6358d690ea5a390ae8f7e487e5911\",\"username\":\"admin\",\"captcha\":\"ykrm\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548646273);
INSERT INTO `coin_admin_log` VALUES (62, 0, 'Unknown', '/admin/index/login?url=%2Fadmin', '', '{\"url\":\"\\/admin\",\"__token__\":\"badce27bdff47775f29fb96a2cf0f0f5\",\"username\":\"admin\",\"captcha\":\"ykrm\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548646280);
INSERT INTO `coin_admin_log` VALUES (63, 1, 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"5ab694847ee5fed9f36407acf15364ae\",\"username\":\"admin\",\"captcha\":\"k8s2\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548646286);
INSERT INTO `coin_admin_log` VALUES (64, 1, 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"5,12,7,11,10,6,9,8,13,2,4,3,1\",\"changeid\":\"12\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"category\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548647067);
INSERT INTO `coin_admin_log` VALUES (65, 1, 'admin', '/admin/test/multi/ids/1', '测试管理 批量更新', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"switch=0\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655533);
INSERT INTO `coin_admin_log` VALUES (66, 1, 'admin', '/admin/test/multi/ids/1', '测试管理 批量更新', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"switch=1\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655534);
INSERT INTO `coin_admin_log` VALUES (67, 1, 'admin', '/admin/test/multi/ids/1', '测试管理 批量更新', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"switch=0\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655535);
INSERT INTO `coin_admin_log` VALUES (68, 1, 'admin', '/admin/test/multi/ids/1', '测试管理 批量更新', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"switch=1\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655536);
INSERT INTO `coin_admin_log` VALUES (69, 1, 'admin', '/admin/test/multi/ids/1', '测试管理 批量更新', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"switch=0\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655536);
INSERT INTO `coin_admin_log` VALUES (70, 1, 'admin', '/admin/test/multi/ids/1', '测试管理 批量更新', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"switch=1\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655537);
INSERT INTO `coin_admin_log` VALUES (71, 1, 'admin', '/admin/test/multi/ids/1', '测试管理 批量更新', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"switch=0\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655538);
INSERT INTO `coin_admin_log` VALUES (72, 1, 'admin', '/admin/test/multi/ids/1', '测试管理 批量更新', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"switch=1\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655539);
INSERT INTO `coin_admin_log` VALUES (73, 1, 'admin', '/admin/test/multi/ids/1', '测试管理 批量更新', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"switch=0\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655539);
INSERT INTO `coin_admin_log` VALUES (74, 1, 'admin', '/admin/test/multi/ids/1', '测试管理 批量更新', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"switch=1\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655541);
INSERT INTO `coin_admin_log` VALUES (75, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12\",\"searchField\":[\"name\"]}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655547);
INSERT INTO `coin_admin_log` VALUES (76, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12,13\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12,13\",\"searchField\":[\"name\"]}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655547);
INSERT INTO `coin_admin_log` VALUES (77, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655549);
INSERT INTO `coin_admin_log` VALUES (78, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655554);
INSERT INTO `coin_admin_log` VALUES (79, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655556);
INSERT INTO `coin_admin_log` VALUES (80, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655556);
INSERT INTO `coin_admin_log` VALUES (81, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655557);
INSERT INTO `coin_admin_log` VALUES (82, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655560);
INSERT INTO `coin_admin_log` VALUES (83, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655560);
INSERT INTO `coin_admin_log` VALUES (84, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655560);
INSERT INTO `coin_admin_log` VALUES (85, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655560);
INSERT INTO `coin_admin_log` VALUES (86, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"ce\'s\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"ce\'s\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655563);
INSERT INTO `coin_admin_log` VALUES (87, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\\u6d4b\\u8bd5\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\\u6d4b\\u8bd5\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655565);
INSERT INTO `coin_admin_log` VALUES (88, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655566);
INSERT INTO `coin_admin_log` VALUES (89, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\\u6d4b\\u8bd5\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\\u6d4b\\u8bd5\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655582);
INSERT INTO `coin_admin_log` VALUES (90, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655583);
INSERT INTO `coin_admin_log` VALUES (91, 1, 'admin', '/admin/test/edit/ids/1?dialog=1', '测试管理 编辑', '{\"dialog\":\"1\",\"row\":{\"category_id\":\"12\",\"category_ids\":\"12\",\"week\":\"tuesday\",\"flag\":[\"hot\",\"index\",\"recommend\"],\"genderdata\":\"male\",\"hobbydata\":[\"music\",\"reading\"],\"title\":\"\\u6211\\u662f\\u4e00\\u7bc7\\u6d4b\\u8bd5\\u6587\\u7ae0\",\"content\":\"<p>\\u6211\\u662f\\u6d4b\\u8bd5\\u5185\\u5bb9<\\/p>\",\"image\":\"\\/assets\\/img\\/avatar.png\",\"images\":\"\\/assets\\/img\\/avatar.png,\\/assets\\/img\\/qrcode.png\",\"attachfile\":\"\\/assets\\/img\\/avatar.png\",\"keywords\":\"\\u5173\\u952e\\u5b57\",\"description\":\"\\u63cf\\u8ff0\",\"city\":\"\\u5e7f\\u897f\\u58ee\\u65cf\\u81ea\\u6cbb\\u533a\\/\\u767e\\u8272\\u5e02\\/\\u5e73\\u679c\\u53bf\",\"price\":\"0\",\"views\":\"0\",\"startdate\":\"2017-07-10\",\"activitytime\":\"2017-07-10 18:24:45\",\"year\":\"2017\",\"times\":\"18:24:45\",\"refreshtime\":\"2017-07-10 18:24:45\",\"weigh\":\"0\",\"switch\":\"1\",\"status\":\"normal\",\"state\":\"1\"},\"ids\":\"1\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655584);
INSERT INTO `coin_admin_log` VALUES (92, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12\",\"searchField\":[\"name\"]}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655620);
INSERT INTO `coin_admin_log` VALUES (93, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12\",\"searchField\":[\"name\"]}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655620);
INSERT INTO `coin_admin_log` VALUES (94, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12\",\"searchField\":[\"name\"]}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655718);
INSERT INTO `coin_admin_log` VALUES (95, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12\",\"searchField\":[\"name\"]}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655718);
INSERT INTO `coin_admin_log` VALUES (96, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12\",\"searchField\":[\"name\"]}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655844);
INSERT INTO `coin_admin_log` VALUES (97, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12\",\"searchField\":[\"name\"]}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548655844);
INSERT INTO `coin_admin_log` VALUES (98, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548656306);
INSERT INTO `coin_admin_log` VALUES (99, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548656313);
INSERT INTO `coin_admin_log` VALUES (100, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12\",\"searchField\":[\"name\"]}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548656383);
INSERT INTO `coin_admin_log` VALUES (101, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12\",\"searchField\":[\"name\"]}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548656383);
INSERT INTO `coin_admin_log` VALUES (102, 0, 'Unknown', '/admin/index/login?url=%2Fadmin%2Fdashboard%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin\\/dashboard?ref=addtabs\",\"__token__\":\"8a4a899bc9d5b8b14c93ff15f3d496b2\",\"username\":\"admin\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548657549);
INSERT INTO `coin_admin_log` VALUES (103, 1, 'admin', '/admin/index/login?url=%2Fadmin%2Fdashboard%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin\\/dashboard?ref=addtabs\",\"__token__\":\"f4830872d8dbdc5a4a1f5ed4aeda86c9\",\"username\":\"admin\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548657554);
INSERT INTO `coin_admin_log` VALUES (104, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548659499);
INSERT INTO `coin_admin_log` VALUES (105, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548659508);
INSERT INTO `coin_admin_log` VALUES (106, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548659511);
INSERT INTO `coin_admin_log` VALUES (107, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548659515);
INSERT INTO `coin_admin_log` VALUES (108, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548659518);
INSERT INTO `coin_admin_log` VALUES (109, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548659518);
INSERT INTO `coin_admin_log` VALUES (110, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548659520);
INSERT INTO `coin_admin_log` VALUES (111, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548659524);
INSERT INTO `coin_admin_log` VALUES (112, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548659677);
INSERT INTO `coin_admin_log` VALUES (113, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548659678);
INSERT INTO `coin_admin_log` VALUES (114, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548659680);
INSERT INTO `coin_admin_log` VALUES (115, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548659682);
INSERT INTO `coin_admin_log` VALUES (116, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548659689);
INSERT INTO `coin_admin_log` VALUES (117, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548659739);
INSERT INTO `coin_admin_log` VALUES (118, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548659741);
INSERT INTO `coin_admin_log` VALUES (119, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548659743);
INSERT INTO `coin_admin_log` VALUES (120, 1, 'admin', '/admin/category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"default\",\"pid\":\"0\",\"name\":\"\\u6d4b\\u8bd53\",\"nickname\":\"\\u6d4b\\u8bd53\\u7684\\u6635\\u79f0\",\"image\":\"\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548659792);
INSERT INTO `coin_admin_log` VALUES (121, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548659801);
INSERT INTO `coin_admin_log` VALUES (122, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548659803);
INSERT INTO `coin_admin_log` VALUES (123, 1, 'admin', '/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"categorytype\":\"{\\\"default\\\":\\\"Default\\\",\\\"page\\\":\\\"Page\\\",\\\"article\\\":\\\"Article\\\",\\\"test\\\":\\\"Test\\\",\\\"nav\\\":\\\"Nav\\\"}\",\"configgroup\":\"{\\\"basic\\\":\\\"Basic\\\",\\\"email\\\":\\\"Email\\\",\\\"dictionary\\\":\\\"Dictionary\\\",\\\"user\\\":\\\"User\\\",\\\"example\\\":\\\"Example\\\"}\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548660312);
INSERT INTO `coin_admin_log` VALUES (124, 1, 'admin', '/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"categorytype\":\"{\\\"article\\\":\\\"Article\\\",\\\"nav\\\":\\\"Nav\\\"}\",\"configgroup\":\"{\\\"basic\\\":\\\"Basic\\\",\\\"email\\\":\\\"Email\\\",\\\"dictionary\\\":\\\"Dictionary\\\",\\\"user\\\":\\\"User\\\",\\\"example\\\":\\\"Example\\\"}\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548661373);
INSERT INTO `coin_admin_log` VALUES (125, 1, 'admin', '/admin/category/del/ids/14,5,7,11,10,6,9,8,12,13,2,4,3,1', '分类管理 删除', '{\"action\":\"del\",\"ids\":\"14,5,7,11,10,6,9,8,12,13,2,4,3,1\",\"params\":\"\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548661498);
INSERT INTO `coin_admin_log` VALUES (126, 1, 'admin', '/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"categorytype\":\"{\\\"nav\\\":\\\"Nav\\\",\\\"article\\\":\\\"Article\\\"}\",\"configgroup\":\"{\\\"basic\\\":\\\"Basic\\\",\\\"email\\\":\\\"Email\\\",\\\"dictionary\\\":\\\"Dictionary\\\",\\\"user\\\":\\\"User\\\",\\\"example\\\":\\\"Example\\\"}\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548661527);
INSERT INTO `coin_admin_log` VALUES (127, 1, 'admin', '/admin/category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"nav\",\"pid\":\"0\",\"name\":\"\\u5e01\\u767e\\u79d1\",\"nickname\":\"\\u5e01\\u767e\\u79d1\",\"image\":\"\\/assets\\/img\\/qrcode.png\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662024);
INSERT INTO `coin_admin_log` VALUES (128, 1, 'admin', '/admin/category/edit/ids/15?dialog=1', '分类管理 编辑', '{\"dialog\":\"1\",\"row\":{\"type\":\"nav\",\"pid\":\"0\",\"name\":\"\\u5e01\\u767e\\u79d1\",\"nickname\":\"\\u5e01\\u767e\\u79d1\",\"image\":\"\\/assets\\/img\\/qrcode.png\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]},\"ids\":\"15\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662045);
INSERT INTO `coin_admin_log` VALUES (129, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662056);
INSERT INTO `coin_admin_log` VALUES (130, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662059);
INSERT INTO `coin_admin_log` VALUES (131, 1, 'admin', '/admin/category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"nav\",\"pid\":\"15\",\"name\":\"\\u4e3b\\u6d41\\u5e01\",\"nickname\":\"\\u4e3b\\u6d41\\u5e01\",\"image\":\"\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662085);
INSERT INTO `coin_admin_log` VALUES (132, 1, 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"16,15\",\"changeid\":\"16\",\"pid\":\"15\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"category\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662094);
INSERT INTO `coin_admin_log` VALUES (133, 1, 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"16,15\",\"changeid\":\"15\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"category\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662105);
INSERT INTO `coin_admin_log` VALUES (134, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662118);
INSERT INTO `coin_admin_log` VALUES (135, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662124);
INSERT INTO `coin_admin_log` VALUES (136, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662127);
INSERT INTO `coin_admin_log` VALUES (137, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662127);
INSERT INTO `coin_admin_log` VALUES (138, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662127);
INSERT INTO `coin_admin_log` VALUES (139, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662128);
INSERT INTO `coin_admin_log` VALUES (140, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662129);
INSERT INTO `coin_admin_log` VALUES (141, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662130);
INSERT INTO `coin_admin_log` VALUES (142, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662132);
INSERT INTO `coin_admin_log` VALUES (143, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662204);
INSERT INTO `coin_admin_log` VALUES (144, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662205);
INSERT INTO `coin_admin_log` VALUES (145, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662391);
INSERT INTO `coin_admin_log` VALUES (146, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662393);
INSERT INTO `coin_admin_log` VALUES (147, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662546);
INSERT INTO `coin_admin_log` VALUES (148, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"nav\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662548);
INSERT INTO `coin_admin_log` VALUES (149, 1, 'admin', '/admin/nav/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"category_ids\":\"15\",\"cname\":\"\\u6bd4\\u7279\\u5e01\",\"ename\":\"btc\",\"image\":\"\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"0\",\"recommendswitch\":\"0\",\"statusswitch\":\"1\"}}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662558);
INSERT INTO `coin_admin_log` VALUES (150, 1, 'admin', '/admin/nav/multi/ids/14', '分类管理 批量更新', '{\"action\":\"\",\"ids\":\"14\",\"params\":\"recommendswitch=1\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662566);
INSERT INTO `coin_admin_log` VALUES (151, 1, 'admin', '/admin/nav/multi/ids/14', '分类管理 批量更新', '{\"action\":\"\",\"ids\":\"14\",\"params\":\"recommendswitch=0\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662567);
INSERT INTO `coin_admin_log` VALUES (152, 1, 'admin', '/admin/nav/multi/ids/14', '分类管理 批量更新', '{\"action\":\"\",\"ids\":\"14\",\"params\":\"statusswitch=0\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662568);
INSERT INTO `coin_admin_log` VALUES (153, 1, 'admin', '/admin/nav/multi/ids/14', '分类管理 批量更新', '{\"action\":\"\",\"ids\":\"14\",\"params\":\"statusswitch=1\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662570);
INSERT INTO `coin_admin_log` VALUES (154, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"15\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"15\",\"searchField\":[\"name\"]}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662581);
INSERT INTO `coin_admin_log` VALUES (155, 1, 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"15\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"15\",\"searchField\":[\"name\"]}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662586);
INSERT INTO `coin_admin_log` VALUES (156, 1, 'admin', '/admin/nav/edit/ids/14?dialog=1', '分类管理 编辑', '{\"dialog\":\"1\",\"row\":{\"category_ids\":\"15\",\"cname\":\"\\u6bd4\\u7279\\u5e01\",\"ename\":\"btc\",\"image\":\"\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"14\",\"recommendswitch\":\"0\",\"statusswitch\":\"1\"},\"ids\":\"14\"}', '192.168.3.125', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 1548662587);

-- ----------------------------
-- Table structure for coin_attachment
-- ----------------------------
DROP TABLE IF EXISTS `coin_attachment`;
CREATE TABLE `coin_attachment`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '图片帧数',
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `mimetype` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建日期',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `uploadtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上传时间',
  `storage` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coin_attachment
-- ----------------------------
INSERT INTO `coin_attachment` VALUES (1, 1, 0, '/assets/img/qrcode.png', '150', '150', 'png', 0, 21859, 'image/png', '', 1499681848, 1499681848, 1499681848, 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');

-- ----------------------------
-- Table structure for coin_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `coin_auth_group`;
CREATE TABLE `coin_auth_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父组别',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则ID',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分组表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coin_auth_group
-- ----------------------------
INSERT INTO `coin_auth_group` VALUES (1, 0, 'Admin group', '*', 1490883540, 149088354, 'normal');
INSERT INTO `coin_auth_group` VALUES (2, 1, 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', 1490883540, 1505465692, 'normal');
INSERT INTO `coin_auth_group` VALUES (3, 2, 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', 1490883540, 1502205322, 'normal');
INSERT INTO `coin_auth_group` VALUES (4, 1, 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', 1490883540, 1502205350, 'normal');
INSERT INTO `coin_auth_group` VALUES (5, 2, 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', 1490883540, 1502205344, 'normal');

-- ----------------------------
-- Table structure for coin_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `coin_auth_group_access`;
CREATE TABLE `coin_auth_group_access`  (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '级别ID',
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限分组表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coin_auth_group_access
-- ----------------------------
INSERT INTO `coin_auth_group_access` VALUES (1, 1);

-- ----------------------------
-- Table structure for coin_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `coin_auth_rule`;
CREATE TABLE `coin_auth_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为菜单',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coin_auth_rule
-- ----------------------------
INSERT INTO `coin_auth_rule` VALUES (1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard', '', 'Dashboard tips', 1, 1497429920, 1497429920, 143, 'normal');
INSERT INTO `coin_auth_rule` VALUES (2, 'file', 0, 'general', 'General', 'fa fa-cogs', '', '', 1, 1497429920, 1497430169, 137, 'normal');
INSERT INTO `coin_auth_rule` VALUES (3, 'file', 0, 'category', 'Category', 'fa fa-list', '', 'Category tips', 1, 1497429920, 1497429920, 119, 'normal');
INSERT INTO `coin_auth_rule` VALUES (4, 'file', 0, 'addon', 'Addon', 'fa fa-rocket', '', 'Addon tips', 1, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (5, 'file', 0, 'auth', 'Auth', 'fa fa-group', '', '', 1, 1497429920, 1497430092, 99, 'normal');
INSERT INTO `coin_auth_rule` VALUES (6, 'file', 2, 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', 1, 1497429920, 1497430683, 60, 'normal');
INSERT INTO `coin_auth_rule` VALUES (7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', 1, 1497429920, 1497430699, 53, 'normal');
INSERT INTO `coin_auth_rule` VALUES (8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user', '', '', 1, 1497429920, 1497429920, 34, 'normal');
INSERT INTO `coin_auth_rule` VALUES (9, 'file', 5, 'auth/admin', 'Admin', 'fa fa-user', '', 'Admin tips', 1, 1497429920, 1497430320, 118, 'normal');
INSERT INTO `coin_auth_rule` VALUES (10, 'file', 5, 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', 'Admin log tips', 1, 1497429920, 1497430307, 113, 'normal');
INSERT INTO `coin_auth_rule` VALUES (11, 'file', 5, 'auth/group', 'Group', 'fa fa-group', '', 'Group tips', 1, 1497429920, 1497429920, 109, 'normal');
INSERT INTO `coin_auth_rule` VALUES (12, 'file', 5, 'auth/rule', 'Rule', 'fa fa-bars', '', 'Rule tips', 1, 1497429920, 1497430581, 104, 'normal');
INSERT INTO `coin_auth_rule` VALUES (13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 136, 'normal');
INSERT INTO `coin_auth_rule` VALUES (14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 135, 'normal');
INSERT INTO `coin_auth_rule` VALUES (15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 133, 'normal');
INSERT INTO `coin_auth_rule` VALUES (16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 134, 'normal');
INSERT INTO `coin_auth_rule` VALUES (17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 132, 'normal');
INSERT INTO `coin_auth_rule` VALUES (18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 52, 'normal');
INSERT INTO `coin_auth_rule` VALUES (19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 51, 'normal');
INSERT INTO `coin_auth_rule` VALUES (20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 50, 'normal');
INSERT INTO `coin_auth_rule` VALUES (21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 49, 'normal');
INSERT INTO `coin_auth_rule` VALUES (22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 48, 'normal');
INSERT INTO `coin_auth_rule` VALUES (23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', 'Attachment tips', 0, 1497429920, 1497429920, 59, 'normal');
INSERT INTO `coin_auth_rule` VALUES (24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 58, 'normal');
INSERT INTO `coin_auth_rule` VALUES (25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 57, 'normal');
INSERT INTO `coin_auth_rule` VALUES (26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 56, 'normal');
INSERT INTO `coin_auth_rule` VALUES (27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 55, 'normal');
INSERT INTO `coin_auth_rule` VALUES (28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 54, 'normal');
INSERT INTO `coin_auth_rule` VALUES (29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 33, 'normal');
INSERT INTO `coin_auth_rule` VALUES (30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 32, 'normal');
INSERT INTO `coin_auth_rule` VALUES (31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 31, 'normal');
INSERT INTO `coin_auth_rule` VALUES (32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 30, 'normal');
INSERT INTO `coin_auth_rule` VALUES (33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 29, 'normal');
INSERT INTO `coin_auth_rule` VALUES (34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 28, 'normal');
INSERT INTO `coin_auth_rule` VALUES (35, 'file', 3, 'category/index', 'View', 'fa fa-circle-o', '', 'Category tips', 0, 1497429920, 1497429920, 142, 'normal');
INSERT INTO `coin_auth_rule` VALUES (36, 'file', 3, 'category/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 141, 'normal');
INSERT INTO `coin_auth_rule` VALUES (37, 'file', 3, 'category/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 140, 'normal');
INSERT INTO `coin_auth_rule` VALUES (38, 'file', 3, 'category/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 139, 'normal');
INSERT INTO `coin_auth_rule` VALUES (39, 'file', 3, 'category/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 138, 'normal');
INSERT INTO `coin_auth_rule` VALUES (40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', 'Admin tips', 0, 1497429920, 1497429920, 117, 'normal');
INSERT INTO `coin_auth_rule` VALUES (41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 116, 'normal');
INSERT INTO `coin_auth_rule` VALUES (42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 115, 'normal');
INSERT INTO `coin_auth_rule` VALUES (43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 114, 'normal');
INSERT INTO `coin_auth_rule` VALUES (44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', 'Admin log tips', 0, 1497429920, 1497429920, 112, 'normal');
INSERT INTO `coin_auth_rule` VALUES (45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 111, 'normal');
INSERT INTO `coin_auth_rule` VALUES (46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 110, 'normal');
INSERT INTO `coin_auth_rule` VALUES (47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', 'Group tips', 0, 1497429920, 1497429920, 108, 'normal');
INSERT INTO `coin_auth_rule` VALUES (48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 107, 'normal');
INSERT INTO `coin_auth_rule` VALUES (49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 106, 'normal');
INSERT INTO `coin_auth_rule` VALUES (50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 105, 'normal');
INSERT INTO `coin_auth_rule` VALUES (51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', 'Rule tips', 0, 1497429920, 1497429920, 103, 'normal');
INSERT INTO `coin_auth_rule` VALUES (52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 102, 'normal');
INSERT INTO `coin_auth_rule` VALUES (53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 101, 'normal');
INSERT INTO `coin_auth_rule` VALUES (54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 100, 'normal');
INSERT INTO `coin_auth_rule` VALUES (55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', 'Addon tips', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (59, 'file', 4, 'addon/local', 'Local install', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (61, 'file', 4, 'addon/install', 'Install', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (62, 'file', 4, 'addon/uninstall', 'Uninstall', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (66, 'file', 0, 'user', 'User', 'fa fa-list', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (67, 'file', 66, 'user/user', 'User', 'fa fa-user', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (68, 'file', 67, 'user/user/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (69, 'file', 67, 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (70, 'file', 67, 'user/user/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (71, 'file', 67, 'user/user/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (72, 'file', 67, 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (73, 'file', 66, 'user/group', 'User group', 'fa fa-users', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (74, 'file', 73, 'user/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (75, 'file', 73, 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (76, 'file', 73, 'user/group/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (77, 'file', 73, 'user/group/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (78, 'file', 73, 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (79, 'file', 66, 'user/rule', 'User rule', 'fa fa-circle-o', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (91, 'file', 0, 'test', '测试管理', 'fa fa-circle-o\r', '', '', 1, 1548655510, 1548655510, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (92, 'file', 91, 'test/index', '查看', 'fa fa-circle-o', '', '', 0, 1548655510, 1548662460, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (93, 'file', 91, 'test/add', '添加', 'fa fa-circle-o', '', '', 0, 1548655510, 1548662460, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (94, 'file', 91, 'test/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1548655510, 1548662460, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (95, 'file', 91, 'test/del', '删除', 'fa fa-circle-o', '', '', 0, 1548655510, 1548662460, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (96, 'file', 91, 'test/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1548655510, 1548662460, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (97, 'file', 0, 'nav', '分类管理', 'fa fa-circle-o\r', '', '', 1, 1548656929, 1548656929, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (98, 'file', 97, 'nav/index', '查看', 'fa fa-circle-o', '', '', 0, 1548656929, 1548662538, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (99, 'file', 97, 'nav/add', '添加', 'fa fa-circle-o', '', '', 0, 1548656929, 1548662538, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (100, 'file', 97, 'nav/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1548656929, 1548662538, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (101, 'file', 97, 'nav/del', '删除', 'fa fa-circle-o', '', '', 0, 1548656929, 1548662538, 0, 'normal');
INSERT INTO `coin_auth_rule` VALUES (102, 'file', 97, 'nav/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1548656929, 1548662538, 0, 'normal');

-- ----------------------------
-- Table structure for coin_category
-- ----------------------------
DROP TABLE IF EXISTS `coin_category`;
CREATE TABLE `coin_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `weigh`(`weigh`, `id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coin_category
-- ----------------------------
INSERT INTO `coin_category` VALUES (15, 0, 'nav', '币百科', '币百科', '', '/assets/img/qrcode.png', '', '', '', 1548662024, 1548662045, 0, 'normal');
INSERT INTO `coin_category` VALUES (16, 15, 'nav', '主流币', '主流币', '', '', '', '', '', 1548662085, 1548662085, 16, 'normal');

-- ----------------------------
-- Table structure for coin_config
-- ----------------------------
DROP TABLE IF EXISTS `coin_config`;
CREATE TABLE `coin_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '变量值',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coin_config
-- ----------------------------
INSERT INTO `coin_config` VALUES (1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', '币航', '', 'required', '');
INSERT INTO `coin_config` VALUES (2, 'beian', 'basic', 'Beian', '粤ICP备15054802号-4', 'string', '', '', '', '');
INSERT INTO `coin_config` VALUES (3, 'cdnurl', 'basic', 'Cdn url', '如果静态资源使用第三方云储存请配置该值', 'string', '', '', '', '');
INSERT INTO `coin_config` VALUES (4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.0', '', 'required', '');
INSERT INTO `coin_config` VALUES (5, 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', '');
INSERT INTO `coin_config` VALUES (6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '');
INSERT INTO `coin_config` VALUES (7, 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '');
INSERT INTO `coin_config` VALUES (8, 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', '');
INSERT INTO `coin_config` VALUES (9, 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"nav\":\"Nav\",\"article\":\"Article\"}', '', '', '');
INSERT INTO `coin_config` VALUES (10, 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', '');
INSERT INTO `coin_config` VALUES (11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"Please select\",\"SMTP\",\"Mail\"]', '', '');
INSERT INTO `coin_config` VALUES (12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', '');
INSERT INTO `coin_config` VALUES (13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', '');
INSERT INTO `coin_config` VALUES (14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', '');
INSERT INTO `coin_config` VALUES (15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', '');
INSERT INTO `coin_config` VALUES (16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"None\",\"TLS\",\"SSL\"]', '', '');
INSERT INTO `coin_config` VALUES (17, 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '');

-- ----------------------------
-- Table structure for coin_ems
-- ----------------------------
DROP TABLE IF EXISTS `coin_ems`;
CREATE TABLE `coin_ems`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邮箱验证码表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for coin_nav
-- ----------------------------
DROP TABLE IF EXISTS `coin_nav`;
CREATE TABLE `coin_nav`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '分类ID',
  `cname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '中文名',
  `ename` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '英文名',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '描述',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `recommendswitch` tinyint(1) NOT NULL DEFAULT 0 COMMENT '推荐',
  `statusswitch` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否显示',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `weigh`(`weigh`, `id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '导航表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coin_nav
-- ----------------------------
INSERT INTO `coin_nav` VALUES (14, '15', '比特币', 'btc', '', '', '', 1548662558, 1548662587, 14, 0, 1);

-- ----------------------------
-- Table structure for coin_sms
-- ----------------------------
DROP TABLE IF EXISTS `coin_sms`;
CREATE TABLE `coin_sms`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '短信验证码表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for coin_test
-- ----------------------------
DROP TABLE IF EXISTS `coin_test`;
CREATE TABLE `coin_test`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类ID(单选)',
  `category_ids` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '省市',
  `price` float(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '价格',
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击',
  `startdate` date NULL DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime(0) NULL DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year NULL DEFAULT NULL COMMENT '年',
  `times` time(0) NULL DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '刷新时间(int)',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT 0 COMMENT '开关',
  `status` enum('normal','hidden') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测试表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coin_test
-- ----------------------------
INSERT INTO `coin_test` VALUES (1, 0, 12, '12', 'tuesday', 'hot,index,recommend', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '描述', '广西壮族自治区/百色市/平果县', 0.00, 0, '2017-07-10', '2017-07-10 18:24:45', 2017, '18:24:45', 1499682285, 1499682526, 1548655584, 0, 1, 'normal', '1');

-- ----------------------------
-- Table structure for coin_third
-- ----------------------------
DROP TABLE IF EXISTS `coin_third`;
CREATE TABLE `coin_third`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `platform` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '第三方应用',
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '第三方唯一ID',
  `openname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '第三方会员昵称',
  `access_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'AccessToken',
  `refresh_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'RefreshToken',
  `expires_in` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '有效期',
  `createtime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '更新时间',
  `logintime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '登录时间',
  `expiretime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `platform`(`platform`, `openid`) USING BTREE,
  INDEX `user_id`(`user_id`, `platform`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '第三方登录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for coin_user
-- ----------------------------
DROP TABLE IF EXISTS `coin_user`;
CREATE TABLE `coin_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '组别ID',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '等级',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '格言',
  `money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '余额',
  `score` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '积分',
  `successions` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '连续登录天数',
  `maxsuccessions` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '最大连续登录天数',
  `prevtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上次登录时间',
  `logintime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `joinip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '加入时间',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '验证',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `email`(`email`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coin_user
-- ----------------------------
INSERT INTO `coin_user` VALUES (1, 1, 'admin', 'admin', 'c13f62012fd6a8fdf06b3452a94430e5', 'rpR6Bv', 'admin@163.com', '13888888888', '/assets/img/avatar.png', 0, 0, '2017-04-15', '', 0.00, 0, 1, 1, 1516170492, 1516171614, '127.0.0.1', 0, '127.0.0.1', 1491461418, 0, 1516171614, '', 'normal', '');

-- ----------------------------
-- Table structure for coin_user_group
-- ----------------------------
DROP TABLE IF EXISTS `coin_user_group`;
CREATE TABLE `coin_user_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '权限节点',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员组表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coin_user_group
-- ----------------------------
INSERT INTO `coin_user_group` VALUES (1, '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', 1515386468, 1516168298, 'normal');

-- ----------------------------
-- Table structure for coin_user_money_log
-- ----------------------------
DROP TABLE IF EXISTS `coin_user_money_log`;
CREATE TABLE `coin_user_money_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更余额',
  `before` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更前余额',
  `after` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更后余额',
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员余额变动表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for coin_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `coin_user_rule`;
CREATE TABLE `coin_user_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) NULL DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标题',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) NULL DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NULL DEFAULT 0 COMMENT '权重',
  `status` enum('normal','hidden') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员规则表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coin_user_rule
-- ----------------------------
INSERT INTO `coin_user_rule` VALUES (1, 0, 'index', '前台', '', 1, 1516168079, 1516168079, 1, 'normal');
INSERT INTO `coin_user_rule` VALUES (2, 0, 'api', 'API接口', '', 1, 1516168062, 1516168062, 2, 'normal');
INSERT INTO `coin_user_rule` VALUES (3, 1, 'user', '会员模块', '', 1, 1515386221, 1516168103, 12, 'normal');
INSERT INTO `coin_user_rule` VALUES (4, 2, 'user', '会员模块', '', 1, 1515386221, 1516168092, 11, 'normal');
INSERT INTO `coin_user_rule` VALUES (5, 3, 'index/user/login', '登录', '', 0, 1515386247, 1515386247, 5, 'normal');
INSERT INTO `coin_user_rule` VALUES (6, 3, 'index/user/register', '注册', '', 0, 1515386262, 1516015236, 7, 'normal');
INSERT INTO `coin_user_rule` VALUES (7, 3, 'index/user/index', '会员中心', '', 0, 1516015012, 1516015012, 9, 'normal');
INSERT INTO `coin_user_rule` VALUES (8, 3, 'index/user/profile', '个人资料', '', 0, 1516015012, 1516015012, 4, 'normal');
INSERT INTO `coin_user_rule` VALUES (9, 4, 'api/user/login', '登录', '', 0, 1515386247, 1515386247, 6, 'normal');
INSERT INTO `coin_user_rule` VALUES (10, 4, 'api/user/register', '注册', '', 0, 1515386262, 1516015236, 8, 'normal');
INSERT INTO `coin_user_rule` VALUES (11, 4, 'api/user/index', '会员中心', '', 0, 1516015012, 1548073320, 10, 'normal');
INSERT INTO `coin_user_rule` VALUES (12, 4, 'api/user/profile', '个人资料', '', 0, 1516015012, 1516015012, 3, 'normal');

-- ----------------------------
-- Table structure for coin_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `coin_user_score_log`;
CREATE TABLE `coin_user_score_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT 0 COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT 0 COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT 0 COMMENT '变更后积分',
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员积分变动表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for coin_user_token
-- ----------------------------
DROP TABLE IF EXISTS `coin_user_token`;
CREATE TABLE `coin_user_token`  (
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Token',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `expiretime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '过期时间',
  PRIMARY KEY (`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员Token表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for coin_version
-- ----------------------------
DROP TABLE IF EXISTS `coin_version`;
CREATE TABLE `coin_version`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '强制更新',
  `createtime` int(10) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '版本表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coin_version
-- ----------------------------
INSERT INTO `coin_version` VALUES (1, '1.1.1,2', '1.2.1', '20M', '更新内容', 'https://www.fastadmin.net/download.html', 1, 1520425318, 0, 0, 'normal');

SET FOREIGN_KEY_CHECKS = 1;
