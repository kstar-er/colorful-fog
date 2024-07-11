/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : colorful_fog

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 15/05/2024 10:24:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cwu_bill_main
-- ----------------------------
DROP TABLE IF EXISTS `cwu_bill_main`;
CREATE TABLE `cwu_bill_main`  (
  `bill_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '账单编码',
  `status` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '对账状态',
  `scheme_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '所属计划id',
  `cost_term` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '账期',
  `bill_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '应付还是应收账单',
  `belong_user_id` int(11) NULL DEFAULT NULL COMMENT '对应的账号的id，直接控制权限',
  `belong_archive_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '对应的档案code,司机code或者商家code，做上下级权限控制',
  `belong_archive_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '对应档案中的名称，司机、车队、商家',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '1删除0有效',
  `collect_result_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '汇总表绑定的code',
  `batch_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '批次号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4838 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '账单主表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cwu_bill_main
-- ----------------------------

-- ----------------------------
-- Table structure for cwu_bill_result
-- ----------------------------
DROP TABLE IF EXISTS `cwu_bill_result`;
CREATE TABLE `cwu_bill_result`  (
  `result_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '绑定的字段的id',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '结果值',
  `bill_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '所属哪条记录',
  `result_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '绑定字段的名称',
  `scheme_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '所属计划的id',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '字段的类型',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '值状态，计算成功1，计算失败0，手动添加3',
  `result_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '计算结果的类型，数字，小数，文本，日期',
  `batch_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '批次号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_code_and_name_index`(`bill_code`, `result_name`) USING BTREE COMMENT '账单编码和字段名称索引，更新时需要',
  INDEX `bill_code__index`(`bill_code`) USING BTREE COMMENT '账单编号索引',
  INDEX `batch_code_index`(`batch_code`) USING BTREE COMMENT '方案和批次索引，刷新用'
) ENGINE = InnoDB AUTO_INCREMENT = 124845 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '账单字段明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cwu_bill_result
-- ----------------------------

-- ----------------------------
-- Table structure for cwu_collect_result
-- ----------------------------
DROP TABLE IF EXISTS `cwu_collect_result`;
CREATE TABLE `cwu_collect_result`  (
  `result_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定的字段的id',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结果值',
  `bill_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属哪条记录',
  `result_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定字段的名称',
  `scheme_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属计划的id',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段的类型',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `result_type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计算结果的类型，数字，小数，文本，日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_code_and_name_index`(`bill_code`, `result_name`) USING BTREE COMMENT '账单编码和字段名称索引，更新时需要'
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '汇总数据明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cwu_collect_result
-- ----------------------------

-- ----------------------------
-- Table structure for cwu_collect_result_main
-- ----------------------------
DROP TABLE IF EXISTS `cwu_collect_result_main`;
CREATE TABLE `cwu_collect_result_main`  (
  `bill_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账单编码',
  `status` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对账状态',
  `scheme_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属计划id',
  `cost_term` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账期',
  `bill_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应付还是应收账单',
  `belong_user_id` int(11) NULL DEFAULT NULL COMMENT '对应的账号的id，直接控制权限',
  `belong_archive_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应的档案code,司机code或者商家code，做上下级权限控制',
  `belong_archive_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应档案中的名称，司机、车队、商家',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新新时间',
  `update_user` bigint(20) NULL DEFAULT NULL,
  `create_user` bigint(20) NULL DEFAULT NULL,
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '1删除0有效',
  `collect_result_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被汇聚时的编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '汇总数据主表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cwu_collect_result_main
-- ----------------------------

-- ----------------------------
-- Table structure for cwu_collect_scheme_detail
-- ----------------------------
DROP TABLE IF EXISTS `cwu_collect_scheme_detail`;
CREATE TABLE `cwu_collect_scheme_detail`  (
  `collect_scheme_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '汇总方案的编码',
  `collect_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '汇总方式类型,sum,或者count、first(所有都是一样的，取第一个)',
  `scheme_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方案的编码',
  `scheme_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方案的名称',
  `scheme_result_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '需要汇总的方案的编码',
  `scheme_result_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '需要汇总的方案的名称',
  `collect_result_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '汇总后的字段名称',
  `collect_result_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外键，绑定汇总结果',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL,
  `create_user` bigint(20) NULL DEFAULT NULL,
  `create_org` int(11) NULL DEFAULT NULL COMMENT '创建的组织id',
  `update_org` int(11) NULL DEFAULT NULL COMMENT '更新的组织id',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '1删除0有效',
  `version` int(11) NULL DEFAULT NULL,
  `time_field_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间范围字段名称',
  `time_field` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间范围',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '汇总计划明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cwu_collect_scheme_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cwu_collect_scheme_main
-- ----------------------------
DROP TABLE IF EXISTS `cwu_collect_scheme_main`;
CREATE TABLE `cwu_collect_scheme_main`  (
  `collect_scheme_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '汇总计划的名称',
  `collect_scheme_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '汇总方案的编码',
  `collect_scheme_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '汇总方案的描述',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL,
  `create_user` bigint(20) NULL DEFAULT NULL,
  `create_org` int(11) NULL DEFAULT NULL COMMENT '创建的组织id',
  `update_org` int(11) NULL DEFAULT NULL COMMENT '更新的组织id',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '1删除0有效',
  `version` int(11) NULL DEFAULT NULL,
  `time_formula_start` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间公式，mon表示当月，day表示几号，如mon.day1=当月1号，mon-1.day1=上月1号',
  `time_formula_end` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间公式，mon表示当月，day表示几号，如mon.day1=当月1号，mon-1.day1=上月1号',
  `cost_term` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账期，默认是上个月的时间表达式',
  `collect_object` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收集对象：账单或者汇总单',
  `bill_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账单类型，应收or应付',
  `belong_archive_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属名称，收集对象是汇总任务时手动填写',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '汇总计划主表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cwu_collect_scheme_main
-- ----------------------------

-- ----------------------------
-- Table structure for cwu_condition
-- ----------------------------
DROP TABLE IF EXISTS `cwu_condition`;
CREATE TABLE `cwu_condition`  (
  `table_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '对应表名',
  `condition_field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生效条件(先生成完再存入,使用时直接读取拼接)',
  `scheme_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '计划的CODE',
  `expression_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '表达式类型AND | OR',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新新时间',
  `update_user` bigint(20) NULL DEFAULT NULL,
  `create_user` bigint(20) NULL DEFAULT NULL,
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '1删除0有效',
  `public_connect` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '关联主体',
  `condition_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生效条件名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '计划条件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cwu_condition
-- ----------------------------
INSERT INTO `cwu_condition` VALUES ('zz_sale_order_main', 'process_status = \'SALE_ORDER_DOC\'', 'SHE2405060000', NULL, 30, 1715180476244, 1715180651361, 1783676987621154817, 1783676987621154817, 0, '[!]AND', '销售单归档');

-- ----------------------------
-- Table structure for cwu_data_source
-- ----------------------------
DROP TABLE IF EXISTS `cwu_data_source`;
CREATE TABLE `cwu_data_source`  (
  `source_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源编码',
  `source_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源名称',
  `source_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源描述',
  `source_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源类型 DIC_NAME=SOURCE_TYPE; mysql，orace，sqlserver，elasticsearch，接口，javaBean，数据源类型字典中item-extend动态生成表单',
  `source_config` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源连接配置json：关系库{ jdbcUrl:\'\', username:\'\', password:\'\' } ES{ hostList:\'ip1:9300,ip2:9300,ip3:9300\', clusterName:\'elasticsearch_cluster\' }  接口{ apiUrl:\'http://ip:port/url\', method:\'\' } javaBean{ beanNamw:\'xxx\' }',
  `enable_flag` int(11) NULL DEFAULT 1 COMMENT '0--已禁用 1--已启用  DIC_NAME=ENABLE_FLAG',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL,
  `create_user` bigint(20) NULL DEFAULT NULL,
  `create_org` int(11) NULL DEFAULT NULL COMMENT '创建的组织id',
  `update_org` int(11) NULL DEFAULT NULL COMMENT '更新的组织id',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '1删除0有效',
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_source_code`(`source_code`, `create_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据源管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cwu_data_source
-- ----------------------------
INSERT INTO `cwu_data_source` VALUES ('testdatabas', '测试数据库', NULL, 'mysql', '{\"driverName\":\"com.mysql.cj.jdbc.Driver\",\"jdbcUrl\":\"jdbc:mysql://8.138.143.21:3306/testdatabase?useSSL=false&useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai&rewriteBatchedStatements=true&&autoReconnect=true\",\"username\":\"onlyRead\",\"password\":\"read1122\"}', 1, 4, 1713942554326, 1713945800565, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `cwu_data_source` VALUES ('testdatabas', '测试数据库', NULL, 'mysql', '{\"driverName\":\"com.mysql.cj.jdbc.Driver\",\"jdbcUrl\":\"jdbc:mysql://8.138.143.21:3306/testdatabase?useSSL=false&useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai&rewriteBatchedStatements=true&&autoReconnect=true\",\"username\":\"onlyRead\",\"password\":\"read1122\"}', 1, 5, 1713942554326, 1713945800565, NULL, 5, NULL, NULL, 0, NULL);

-- ----------------------------
-- Table structure for cwu_depend_data
-- ----------------------------
DROP TABLE IF EXISTS `cwu_depend_data`;
CREATE TABLE `cwu_depend_data`  (
  `depend_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '依赖的主表code',
  `range_start` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '范围的开始',
  `range_end` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '范围的结束',
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '联合的key',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '最终确定的值',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新新时间',
  `update_user` bigint(20) NULL DEFAULT NULL,
  `create_user` bigint(20) NULL DEFAULT NULL,
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '1删除0有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 131 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '依赖表数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cwu_depend_data
-- ----------------------------
INSERT INTO `cwu_depend_data` VALUES ('DEP2405060001', '[0', '0.5)', NULL, '小件', 114, 1714976304664, 1714986207871, 1, 1, 114);
INSERT INTO `cwu_depend_data` VALUES ('DEP2405060001', '[0.8', '99)', NULL, '大件', 115, 1714976343920, 1714986732165, 1, 1, 0);
INSERT INTO `cwu_depend_data` VALUES ('DEP2405060001', '[0.5', '0.8)', NULL, '中件', 116, 1714976343924, 1714986732168, 1, 1, 0);
INSERT INTO `cwu_depend_data` VALUES ('DEP2405060000', 'null', NULL, 'ZDA204JPW', '工程机', 117, 1714976600627, 1715181651296, 1, 1, 0);
INSERT INTO `cwu_depend_data` VALUES ('DEP2405060000', 'null', NULL, 'KB173042800', '工程机', 118, 1714976600632, 1715181651302, 1, 1, 0);
INSERT INTO `cwu_depend_data` VALUES ('DEP2405060000', 'null', NULL, 'KB182041000', '家用机', 119, 1714976600633, 1715181651302, 1, 1, 0);
INSERT INTO `cwu_depend_data` VALUES ('DEP2405060002', 'null', NULL, '大件[-]工程机', '8', 120, 1714977136733, 1714977282518, 1, 1, 120);
INSERT INTO `cwu_depend_data` VALUES ('DEP2405060002', 'null', NULL, '大件[-]家用机', '10', 121, 1714977136737, 1714977304103, 1, 1, 0);
INSERT INTO `cwu_depend_data` VALUES ('DEP2405060002', 'null', NULL, '小件[-]工程机', '5', 122, 1714977261171, 1714977304107, 1, 1, 0);
INSERT INTO `cwu_depend_data` VALUES ('DEP2405060002', 'null', NULL, '中件[-]工程机', '7', 123, 1714977261175, 1714977304107, 1, 1, 0);
INSERT INTO `cwu_depend_data` VALUES ('DEP2405060002', 'null', NULL, '大件[-]工程机', '9', 124, 1714977261175, 1714977304107, 1, 1, 0);
INSERT INTO `cwu_depend_data` VALUES ('DEP2405060002', 'null', NULL, '小件[-]家用机', '6', 125, 1714977261175, 1714977304108, 1, 1, 0);
INSERT INTO `cwu_depend_data` VALUES ('DEP2405060002', 'null', NULL, '中间[-]家用机', '8', 126, 1714977261176, 1714977304108, 1, 1, 0);
INSERT INTO `cwu_depend_data` VALUES ('DEP2405060001', '[0', '0.5)', NULL, '小件', 127, 1714986204252, 1714986732168, 1, 1, 0);
INSERT INTO `cwu_depend_data` VALUES ('DEP2405080000', '[0.8', '99)', NULL, '大件', 128, 1715180898352, 1715180898352, 1783676987621154817, 1783676987621154817, 0);
INSERT INTO `cwu_depend_data` VALUES ('DEP2405080000', '[0.5', '0.8)', NULL, '小件', 129, 1715180898361, 1715180898361, 1783676987621154817, 1783676987621154817, 0);
INSERT INTO `cwu_depend_data` VALUES ('DEP2405060000', NULL, NULL, 'KB602000400', '新机器', 130, 1715181651276, 1715181651276, 1, 1, 0);

-- ----------------------------
-- Table structure for cwu_depend_main
-- ----------------------------
DROP TABLE IF EXISTS `cwu_depend_main`;
CREATE TABLE `cwu_depend_main`  (
  `depend_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `depend_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '依赖表的类型，范围或者是分类',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新新时间',
  `update_user` bigint(20) NULL DEFAULT NULL,
  `create_user` bigint(20) NULL DEFAULT NULL,
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '1删除0有效',
  `is_lose_efficacy` int(11) NULL DEFAULT 0 COMMENT '是否失效 0：生效 1：失效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '依赖表主表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cwu_depend_main
-- ----------------------------
INSERT INTO `cwu_depend_main` VALUES ('DEP2405060000', '物料类型分类', 'SORT', 26, 1714976077468, 1714976077468, 1, 1, 0, 0);
INSERT INTO `cwu_depend_main` VALUES ('DEP2405060001', '物料体积分类', 'RANGE', 27, 1714976093234, 1714976093234, 1, 1, 0, 0);
INSERT INTO `cwu_depend_main` VALUES ('DEP2405060002', '运费分类', 'SORT', 28, 1714977082345, 1714977082345, 1, 1, 0, 0);
INSERT INTO `cwu_depend_main` VALUES ('DEP2405080000', '商品类型分类', 'RANGE', 29, 1715180784063, 1715217753195, 1783676987621154817, 1783676987621154817, 0, 1);

-- ----------------------------
-- Table structure for cwu_depend_rule
-- ----------------------------
DROP TABLE IF EXISTS `cwu_depend_rule`;
CREATE TABLE `cwu_depend_rule`  (
  `depend_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '所属依赖',
  `order_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '关联订单名称',
  `order_table` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '关联表',
  `order_field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '关联表字段',
  `order_field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '字段名称',
  `second_depend_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '二次依赖表',
  `depend_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '依赖表的类型，范围或者是分类',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新新时间',
  `update_user` bigint(20) NULL DEFAULT NULL,
  `create_user` bigint(20) NULL DEFAULT NULL,
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '1删除0有效',
  `get_data_from` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '获取数据的来源，计划中的字段或者表字段',
  `scheme_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '计划的名称',
  `scheme_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '计划的编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '依赖表规则表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cwu_depend_rule
-- ----------------------------
INSERT INTO `cwu_depend_rule` VALUES ('DEP2405060001', NULL, NULL, 'RS24050600011', '体积', NULL, 'RANGE', 63, 1714976171128, 1714976253784, 1, 1, 0, 'SCHEME', '测试销售单应收', 'SHE2405060000');
INSERT INTO `cwu_depend_rule` VALUES ('DEP2405060000', NULL, NULL, 'RS24050600013', '物料代码', NULL, 'SORT', 64, 1714976455672, 1714976455672, 1, 1, 0, 'SCHEME', '测试销售单应收', 'SHE2405060000');
INSERT INTO `cwu_depend_rule` VALUES ('DEP2405060002', NULL, NULL, 'RS24050600020', '大中小件分类', NULL, 'SORT', 65, 1714977098492, 1714977098492, 1, 1, 0, 'SCHEME', '测试销售单应收', 'SHE2405060000');
INSERT INTO `cwu_depend_rule` VALUES ('DEP2405060002', NULL, NULL, 'RS24050600021', '物料类型分类', NULL, 'SORT', 66, 1714977104842, 1714977104842, 1, 1, 0, 'SCHEME', '测试销售单应收', 'SHE2405060000');
INSERT INTO `cwu_depend_rule` VALUES ('DEP2405080000', NULL, NULL, 'RS24050600011', '体积', NULL, 'RANGE', 67, 1715180811170, 1715180811170, 1783676987621154817, 1783676987621154817, 0, 'SCHEME', '测试销售单应收', 'SHE2405060000');

-- ----------------------------
-- Table structure for cwu_err_reason
-- ----------------------------
DROP TABLE IF EXISTS `cwu_err_reason`;
CREATE TABLE `cwu_err_reason`  (
  `depend_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '依赖的主表code',
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联合的key',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最终确定的值',
  `deal_flag` int(11) NULL DEFAULT 0 COMMENT '是否已经处理',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误原因:1、不在分类依赖表2、超出范围',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL,
  `create_user` bigint(20) NULL DEFAULT NULL,
  `create_org` int(11) NULL DEFAULT NULL COMMENT '创建的组织id',
  `update_org` int(11) NULL DEFAULT NULL COMMENT '更新的组织id',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '1删除0有效',
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 521 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账单无法生成原因汇总' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cwu_err_reason
-- ----------------------------

-- ----------------------------
-- Table structure for cwu_foreign_key
-- ----------------------------
DROP TABLE IF EXISTS `cwu_foreign_key`;
CREATE TABLE `cwu_foreign_key`  (
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `table_id` int(11) NULL DEFAULT NULL COMMENT '对应表的id',
  `foreign_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外键',
  `foreign_table_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联表',
  `foreign_table_id` int(11) NULL DEFAULT NULL COMMENT '外键关联表的id',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` int(11) NULL DEFAULT NULL COMMENT '更新者id',
  `create_user` int(11) NULL DEFAULT NULL COMMENT '创建者id',
  `create_org` int(11) NULL DEFAULT NULL COMMENT '创建的组织id',
  `update_org` int(11) NULL DEFAULT NULL COMMENT '更新的组织id',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '1删除0有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '外键关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cwu_foreign_key
-- ----------------------------

-- ----------------------------
-- Table structure for cwu_order_table_relation
-- ----------------------------
DROP TABLE IF EXISTS `cwu_order_table_relation`;
CREATE TABLE `cwu_order_table_relation`  (
  `order_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '单据的名称',
  `order_table` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '单据关联的表单',
  `order_foreign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '外键',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `order_main_table` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '关联的主表',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新新时间',
  `update_user` bigint(20) NULL DEFAULT NULL,
  `create_user` bigint(20) NULL DEFAULT NULL,
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '1删除0有效',
  `order_table_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '单据关联表名称',
  `order_foreign_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '外键名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '单据和数据库关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cwu_order_table_relation
-- ----------------------------
INSERT INTO `cwu_order_table_relation` VALUES ('销售订单', 'zz_sale_order_main', 'sale_order_code', 'MAIN', 'zz_sale_order_main', '销售订单主表，记录商家信息，收货人信息，配送信息，流程状态等', 15, 1713945877227, 1713945877227, NULL, 1, 0, '销售订单主表', '销售单号');
INSERT INTO `cwu_order_table_relation` VALUES ('销售订单明细表', 'zz_sale_order_detail', 'sale_order_code', 'DETAIL', 'zz_sale_order_main', '销售订单明细表，记录销售的物料信息', 16, 1713946018019, 1713946018019, NULL, 1, 0, '销售订单明细表', '销售单号');
INSERT INTO `cwu_order_table_relation` VALUES ('商家表', 'merchant', 'merchant_code', 'MAIN', 'merchant', NULL, 17, 1714967688887, 1714967731265, 1, 1, 0, '商家表主表', '商家编码');

-- ----------------------------
-- Table structure for cwu_scheme_detail
-- ----------------------------
DROP TABLE IF EXISTS `cwu_scheme_detail`;
CREATE TABLE `cwu_scheme_detail`  (
  `scheme_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '跟随主表外键',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '系数类型',
  `fixed_coefficient` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '固定系数',
  `depend_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '依赖表的code',
  `order_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '绑定的表的名称',
  `order_field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '绑定表的字段名称',
  `order_table` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '单据里面表的名称',
  `result_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '计算结果的编码',
  `result_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '计算结果的名字',
  `result_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '计算结果的类型，数字，小数，文本，日期',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新新时间',
  `update_user` bigint(20) NULL DEFAULT NULL,
  `create_user` bigint(20) NULL DEFAULT NULL,
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '1删除0有效',
  `expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '计算表达式',
  `group_by_field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'sum类型使用，汇总依据字段的名称',
  `group_by_field` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'sum类型使用，汇总依据字段',
  `display_order` int(11) NULL DEFAULT NULL COMMENT '展示顺序',
  `calculate_order` int(11) NULL DEFAULT NULL COMMENT '计算的顺序',
  `get_data_from` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '获取数据的来源，计划中的字段或者表字段',
  `group_by_table` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '汇总依赖字段所在的表',
  `one_row_tag` tinyint(4) NULL DEFAULT 0 COMMENT '单行标记，此标记为1时，当前分组中的数据只会标记在一行中',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 207 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '计划内容明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cwu_scheme_detail
-- ----------------------------
INSERT INTO `cwu_scheme_detail` VALUES ('SHE2405060000', 'ORDER_DATA', NULL, NULL, '所属用户编码', 'merchant_code', 'zz_sale_order_main', 'RS24050600000', '所属用户编码', 'STRING', 186, 1714975651683, 1714977383914, 1, 1, 0, NULL, NULL, NULL, 1, 0, 'TABLE', NULL, 0);
INSERT INTO `cwu_scheme_detail` VALUES ('SHE2405060000', 'ORDER_DATA', NULL, NULL, '创建时间', 'create_time', 'zz_sale_order_main', 'RS24050600001', '计算时间', 'STRING', 187, 1714975651684, 1714977383921, 1, 1, 0, NULL, NULL, NULL, 2, 0, 'TABLE', NULL, 0);
INSERT INTO `cwu_scheme_detail` VALUES ('SHE2405060000', 'ORDER_DATA', NULL, NULL, '销售订单', 'merchant_name', 'zz_sale_order_main', 'RS24050600002', '商家名称', 'STRING', 188, 1714975971453, 1714977383929, 1, 1, 0, NULL, NULL, NULL, 3, 0, 'TABLE', NULL, 0);
INSERT INTO `cwu_scheme_detail` VALUES ('SHE2405060000', 'ORDER_DATA', NULL, NULL, '销售订单', 'sale_order_code', 'zz_sale_order_main', 'RS24050600003', '销售订单号', 'STRING', 189, 1714975971454, 1714977383936, 1, 1, 0, NULL, NULL, NULL, 4, 0, 'TABLE', NULL, 0);
INSERT INTO `cwu_scheme_detail` VALUES ('SHE2405060000', 'ORDER_DATA', NULL, NULL, '销售订单', 'merchant_phone', 'zz_sale_order_main', 'RS24050600004', '商家联系人电话', 'STRING', 190, 1714975971455, 1714977383944, 1, 1, 0, NULL, NULL, NULL, 5, 0, 'TABLE', NULL, 0);
INSERT INTO `cwu_scheme_detail` VALUES ('SHE2405060000', 'ORDER_DATA', NULL, NULL, '销售订单', 'customer_name', 'zz_sale_order_main', 'RS24050600005', '客户名称', 'STRING', 191, 1714975971456, 1714977383952, 1, 1, 0, NULL, NULL, NULL, 6, 0, 'TABLE', NULL, 0);
INSERT INTO `cwu_scheme_detail` VALUES ('SHE2405060000', 'ORDER_DATA', NULL, NULL, '销售订单', 'customer_phone', 'zz_sale_order_main', 'RS24050600006', '客户电话', 'STRING', 192, 1714975971457, 1714977383959, 1, 1, 0, NULL, NULL, NULL, 7, 0, 'TABLE', NULL, 0);
INSERT INTO `cwu_scheme_detail` VALUES ('SHE2405060000', 'ORDER_DATA', NULL, NULL, '销售订单', 'merchant_linkman', 'zz_sale_order_main', 'RS24050600007', '商家联系人', 'STRING', 193, 1714975971458, 1714977383966, 1, 1, 0, NULL, NULL, NULL, 8, 0, 'TABLE', NULL, 0);
INSERT INTO `cwu_scheme_detail` VALUES ('SHE2405060000', 'ORDER_DATA', NULL, NULL, '销售订单', 'warehouse_name', 'zz_sale_order_main', 'RS24050600008', '发货仓库名称', 'STRING', 194, 1714975971458, 1714977383973, 1, 1, 0, NULL, NULL, NULL, 9, 0, 'TABLE', NULL, 0);
INSERT INTO `cwu_scheme_detail` VALUES ('SHE2405060000', 'ORDER_DATA', NULL, NULL, '销售订单', 'receipt_address', 'zz_sale_order_main', 'RS24050600009', '送货地址', 'STRING', 195, 1714975971459, 1714977383980, 1, 1, 0, NULL, NULL, NULL, 10, 0, 'TABLE', NULL, 0);
INSERT INTO `cwu_scheme_detail` VALUES ('SHE2405060000', 'ORDER_DATA', NULL, NULL, '销售订单明细表', 'delivered_number', 'zz_sale_order_detail', 'RS24050600010', '数量', 'STRING', 196, 1714976013372, 1714977383988, 1, 1, 0, NULL, NULL, NULL, 3, 2, 'TABLE', NULL, 0);
INSERT INTO `cwu_scheme_detail` VALUES ('SHE2405060000', 'ORDER_DATA', NULL, NULL, '销售订单明细表', 'volume', 'zz_sale_order_detail', 'RS24050600011', '体积', 'STRING', 197, 1714976013373, 1714977383995, 1, 1, 0, NULL, NULL, NULL, 4, 1, 'TABLE', NULL, 0);
INSERT INTO `cwu_scheme_detail` VALUES ('SHE2405060000', 'ORDER_DATA', NULL, NULL, '销售订单明细表', 'material_name', 'zz_sale_order_detail', 'RS24050600012', '产品名称', 'STRING', 198, 1714976013376, 1714977384004, 1, 1, 0, NULL, NULL, NULL, 5, 0, 'TABLE', NULL, 0);
INSERT INTO `cwu_scheme_detail` VALUES ('SHE2405060000', 'ORDER_DATA', NULL, NULL, '销售订单明细表', 'material_code', 'zz_sale_order_detail', 'RS24050600013', '物料代码', 'STRING', 199, 1714976013377, 1714977384011, 1, 1, 0, NULL, NULL, NULL, 6, 3, 'TABLE', NULL, 0);
INSERT INTO `cwu_scheme_detail` VALUES ('SHE2405060000', 'ORDER_DATA', NULL, NULL, '销售订单明细表', 'material_specification', 'zz_sale_order_detail', 'RS24050600014', '规格型号', 'STRING', 200, 1714976013377, 1714977384018, 1, 1, 0, NULL, NULL, NULL, 7, 0, 'TABLE', NULL, 0);
INSERT INTO `cwu_scheme_detail` VALUES ('SHE2405060000', 'DEPEND', NULL, 'DEP2405060001', NULL, NULL, NULL, 'RS24050600020', '大中小件分类', 'STRING', 201, 1714976969539, 1714977384025, 1, 1, 0, NULL, NULL, NULL, 16, 4, 'SCHEME', NULL, 0);
INSERT INTO `cwu_scheme_detail` VALUES ('SHE2405060000', 'DEPEND', NULL, 'DEP2405060000', NULL, NULL, NULL, 'RS24050600021', '物料类型分类', 'STRING', 202, 1714977043065, 1714977384034, 1, 1, 0, NULL, NULL, NULL, 17, 5, 'SCHEME', NULL, 0);
INSERT INTO `cwu_scheme_detail` VALUES ('SHE2405060000', 'DEPEND', NULL, 'DEP2405060002', NULL, NULL, NULL, 'RS24050600023', '运费系数', 'NUM', 203, 1714977356518, 1714977384041, 1, 1, 0, NULL, NULL, NULL, 18, 6, 'SCHEME', NULL, 0);
INSERT INTO `cwu_scheme_detail` VALUES ('SHE2405060000', 'EQUATION', NULL, NULL, NULL, NULL, NULL, 'RS24050600024', '运费', 'STRING', 204, 1714977383906, 1714977383906, 1, 1, 0, '${RS24050600023}*${RS24050600010}', NULL, NULL, 19, 7, 'SCHEME', NULL, 0);
INSERT INTO `cwu_scheme_detail` VALUES ('SHE2405080000', 'ORDER_DATA', NULL, NULL, '所属用户编码', 'merchant_code', 'merchant', 'RS24050800000', '所属用户编码', 'STRING', 205, 1715153500245, 1715153500245, 1783676987621154817, 1783676987621154817, 0, NULL, NULL, NULL, 1, 0, 'TABLE', NULL, 0);
INSERT INTO `cwu_scheme_detail` VALUES ('SHE2405080000', 'ORDER_DATA', NULL, NULL, '商家编码', 'merchant_code', 'merchant', 'RS24050800001', '计算时间', 'STRING', 206, 1715153500247, 1715153500247, 1783676987621154817, 1783676987621154817, 0, NULL, NULL, NULL, 2, 0, 'TABLE', NULL, 0);

-- ----------------------------
-- Table structure for cwu_scheme_main
-- ----------------------------
DROP TABLE IF EXISTS `cwu_scheme_main`;
CREATE TABLE `cwu_scheme_main`  (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `scheme_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `granularity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '粒度，具体到哪个表中的字段为最小生成账单单位',
  `bill_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '应付还是应收',
  `belong_rel_table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '账单归属用户关联表',
  `belong_rel_table_field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '账单所属用户绑定字段',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新新时间',
  `update_user` bigint(20) NULL DEFAULT NULL,
  `create_user` bigint(20) NULL DEFAULT NULL,
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '1删除0有效',
  `data_source_id` int(11) NULL DEFAULT NULL,
  `data_source_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '数据库名称',
  `sort` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '默认' COMMENT '分类',
  `user_data_table` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '查询用户数据的表',
  `user_data_code_field` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '查询用户数据的字段',
  `user_data_name_field` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '查询用户数据的展示的名称字段',
  `execution_unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '执行时间单位，每天执行，还是每月执行一次',
  `execution_time` int(11) NULL DEFAULT NULL COMMENT '每日执行的话是0-24，每月执行的话是0-31',
  `time_formula_start` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '时间公式，mon表示当月，day表示几号，如0.1=当月1号，-1.day1=上月1号',
  `time_formula_end` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '时间公式，mon表示当月，day表示几号，如0.1=当月1号，-1.1=上月1号',
  `time_field_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '时间字段名称',
  `time_field` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '时间字段',
  `time_field_table` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '时间字段所在表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '计划内容主表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cwu_scheme_main
-- ----------------------------
INSERT INTO `cwu_scheme_main` VALUES ('测试销售单应收', 'SHE2405060000', 'zz_sale_order_detail', 'COST', 'zz_sale_order_main', 'merchant_code', 49, 1714975651695, 1714977448825, 1, 1, 0, 4, '测试数据库', '物流费用', 'merchant', 'merchant_code', 'merchant_name', 'MONTHLY', 1, '-2.1', '1.1', '创建时间', 'create_time', 'zz_sale_order_main');
INSERT INTO `cwu_scheme_main` VALUES ('测试仓储费用计划', 'SHE2405080000', 'merchant', 'COST', 'merchant', 'merchant_code', 50, 1715153500255, 1715153500255, 1783676987621154817, 1783676987621154817, 0, 4, '测试数据库', '仓储费用计划', 'merchant', 'merchant_code', 'merchant_code', 'DAILY', 8, '0.9', '-1.11', '商家编码', 'merchant_code', 'merchant');

-- ----------------------------
-- Table structure for cwu_scheme_user_relation
-- ----------------------------
DROP TABLE IF EXISTS `cwu_scheme_user_relation`;
CREATE TABLE `cwu_scheme_user_relation`  (
  `scheme_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '计划的code',
  `archive_user_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '档案中用户的code',
  `archive_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '档案中的用户名称',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户在账号系统的id',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新新时间',
  `update_user` bigint(20) NULL DEFAULT NULL,
  `create_user` bigint(20) NULL DEFAULT NULL,
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '1删除0有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '计划和用户关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cwu_scheme_user_relation
-- ----------------------------
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', '广州镕', 'JXS23010广州镕', NULL, 91, 1714975700622, 1714980116945, 1, 1, 91);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', '广州鸿', 'JXS23010广州鸿', NULL, 92, 1714975700626, 1714980116948, 1, 1, 92);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', '广东格', 'JXS23082广东格', NULL, 93, 1714975700627, 1714980116948, 1, 1, 93);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', '佛山市', 'JXS23010佛山市', NULL, 94, 1714975700627, 1714980116948, 1, 1, 94);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', '佛山维', 'JXS23080佛山维', NULL, 95, 1714975700628, 1714980116948, 1, 1, 95);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', '云安县', 'JXS23031云安县', NULL, 96, 1714975700629, 1714980116949, 1, 1, 96);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', '广州大', 'JXS23010广州大', NULL, 97, 1714975700630, 1714980116949, 1, 1, 97);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', '罗定市', 'JXS23060罗定市', NULL, 98, 1714975700631, 1714980116949, 1, 1, 98);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', '四会市', 'JXS23010四会市', NULL, 99, 1714975700632, 1714980116949, 1, 1, 99);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', '怀集县', 'JXS24012怀集县', NULL, 100, 1714975700632, 1714980116949, 1, 1, 100);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', '德庆县', 'JXS23010德庆县', NULL, 101, 1714975700632, 1714980116949, 1, 1, 101);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', '广宁县', 'JXS23010广宁县', NULL, 102, 1714975700633, 1714980116949, 1, 1, 102);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', '四会隆', 'JXS23010四会隆', NULL, 103, 1714975700633, 1714980116950, 1, 1, 103);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', '广州市', 'JXS23051广州市', NULL, 104, 1714975700634, 1714980116950, 1, 1, 104);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', '高要区', 'JXS23091高要区', NULL, 105, 1714975700634, 1714980116950, 1, 1, 105);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', '肇庆市', 'JXS23010肇庆市', NULL, 106, 1714975700635, 1714980116951, 1, 1, 106);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', '广州傲', 'JXS23010广州傲', NULL, 107, 1714975700635, 1714980116951, 1, 1, 107);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', '广东粤', 'JXS23010广东粤', NULL, 108, 1714975700636, 1714980116951, 1, 1, 108);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', '高新区', 'JXS23010高新区', NULL, 109, 1714975700636, 1714980116951, 1, 1, 109);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', 'JXS23010广州镕', '广州镕', NULL, 110, 1714980116960, 1714980116960, 1, 1, 0);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', 'JXS23010广州鸿', '广州鸿', NULL, 111, 1714980116960, 1714980116960, 1, 1, 0);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', 'JXS23082广东格', '广东格', NULL, 112, 1714980116961, 1714980116961, 1, 1, 0);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', 'JXS23010佛山市', '佛山市', NULL, 113, 1714980116961, 1714980116961, 1, 1, 0);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', 'JXS23080佛山维', '佛山维', NULL, 114, 1714980116961, 1714980116961, 1, 1, 0);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', 'JXS23031云安县', '云安县', NULL, 115, 1714980116962, 1714980116962, 1, 1, 0);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', 'JXS23010广州大', '广州大', NULL, 116, 1714980116962, 1714980116962, 1, 1, 0);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', 'JXS23060罗定市', '罗定市', NULL, 117, 1714980116962, 1714980116962, 1, 1, 0);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', 'JXS23010四会市', '四会市', NULL, 118, 1714980116962, 1714980116962, 1, 1, 0);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', 'JXS24012怀集县', '怀集县', NULL, 119, 1714980116962, 1714980116962, 1, 1, 0);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', 'JXS23010德庆县', '德庆县', NULL, 120, 1714980116962, 1714980116962, 1, 1, 0);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', 'JXS23010广宁县', '广宁县', NULL, 121, 1714980116963, 1714980116963, 1, 1, 0);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', 'JXS23010四会隆', '四会隆', NULL, 122, 1714980116963, 1714980116963, 1, 1, 0);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', 'JXS23051广州市', '广州市', NULL, 123, 1714980116963, 1714980116963, 1, 1, 0);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', 'JXS23091高要区', '高要区', NULL, 124, 1714980116964, 1714980116964, 1, 1, 0);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', 'JXS23010肇庆市', '肇庆市', NULL, 125, 1714980116964, 1714980116964, 1, 1, 0);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', 'JXS23010广州傲', '广州傲', NULL, 126, 1714980116964, 1714980116964, 1, 1, 0);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', 'JXS23010广东粤', '广东粤', NULL, 127, 1714980116964, 1714980116964, 1, 1, 0);
INSERT INTO `cwu_scheme_user_relation` VALUES ('SHE2405060000', 'JXS23010高新区', '高新区', NULL, 128, 1714980116964, 1714980116964, 1, 1, 0);

-- ----------------------------
-- Table structure for cwu_table_field_relation
-- ----------------------------
DROP TABLE IF EXISTS `cwu_table_field_relation`;
CREATE TABLE `cwu_table_field_relation`  (
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '表名称',
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '字段名称',
  `field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '字段的中文含义',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '字段类型',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新新时间',
  `update_user` bigint(20) NULL DEFAULT NULL,
  `create_user` bigint(20) NULL DEFAULT NULL,
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '1删除0有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 751 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '数据库表和字段名称关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cwu_table_field_relation
-- ----------------------------
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'sale_order_code', '销售订单号', 'varchar(40)', 689, 1713945881824, 1713945881824, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'merchant_code', '商家编码', 'varchar(40)', 690, 1713945881834, 1713945881834, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'merchant_name', '商家名称', 'varchar(40)', 691, 1713945881835, 1713945881835, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'merchant_linkman', '商家联系人', 'varchar(40)', 692, 1713945881835, 1713945881835, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'merchant_phone', '商家联系人电话', 'varchar(40)', 693, 1713945881836, 1713945881836, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'customer_name', '客户名称', 'varchar(40)', 694, 1713945881838, 1713945881838, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'customer_phone', '客户电话', 'varchar(255)', 695, 1713945881839, 1713945881839, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'warehouse_code', '发货仓库编码。外键', 'varchar(40)', 696, 1713945881839, 1713945881839, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'warehouse_name', '发货仓库名称', 'varchar(40)', 697, 1713945881840, 1713945881840, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'receipt_address', '送货地址', 'varchar(255)', 698, 1713945881841, 1713945881841, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'province', '省', 'varchar(40)', 699, 1713945881843, 1713945881843, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'city', '市', 'varchar(40)', 700, 1713945881843, 1713945881843, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'area', '区', 'varchar(40)', 701, 1713945881844, 1713945881844, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'street', '街道', 'varchar(200)', 702, 1713945881846, 1713945881846, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'comment', '备注', 'varchar(1000)', 703, 1713945881847, 1713945881847, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'require_delivery_date', '要求送货日期', 'bigint', 704, 1713945881847, 1713945881847, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'old_ord_code', '旧销售订单号', 'varchar(40)', 705, 1713945881849, 1713945881849, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'process_status', '流程状态，制单-留料-出库中-归档', 'varchar(40)', 706, 1713945881849, 1713945881849, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'id', '', 'int', 707, 1713945881850, 1713945881850, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'create_time', '创建时间', 'bigint', 708, 1713945881850, 1713945881850, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'update_time', '更新新时间', 'bigint', 709, 1713945881851, 1713945881851, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'update_user', '更新者id', 'int', 710, 1713945881852, 1713945881852, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'create_user', '创建者id', 'int', 711, 1713945881852, 1713945881852, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'create_org', '创建的组织id', 'int', 712, 1713945881853, 1713945881853, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'update_org', '更新的组织id', 'int', 713, 1713945881853, 1713945881853, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'is_delete', '1删除0有效', 'int', 714, 1713945881854, 1713945881854, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'number_of_prints', '打印次数', 'int', 715, 1713945881854, 1713945881854, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'sum_number', '总数量', 'int', 716, 1713945881855, 1713945881855, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'sales_man', '业务员（跟进单据）', 'varchar(1000)', 717, 1713945881855, 1713945881855, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'order_maker', '制单员', 'varchar(1000)', 718, 1713945881856, 1713945881856, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'branch_name', '网点名称', 'varchar(20)', 719, 1713945881856, 1713945881856, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'branch_code', '网点代码', 'varchar(20)', 720, 1713945881857, 1713945881857, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'mat_date', '留料时间', 'bigint', 721, 1713945881858, 1713945881858, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'is_direct', '是否直配', 'varchar(10)', 722, 1713945881858, 1713945881858, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'trans_type', '转换提货订单备注,0为正常，1为特殊情况，需要直接生成销售订单', 'int', 723, 1713945881859, 1713945881859, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'abnormal_type', '异常原因枚举', 'varchar(40)', 724, 1713945881859, 1713945881859, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'abnormal_comment', '异常原因备注（选填）', 'varchar(1000)', 725, 1713945881860, 1713945881860, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'recommend_warehouse', '0否1是', 'int', 726, 1713945881860, 1713945881860, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_main', 'recommend_warehouse_name', '默认推荐的仓库名称', 'varchar(40)', 727, 1713945881861, 1713945881861, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_detail', 'sale_order_code', '销售订单号。外键', 'varchar(40)', 728, 1713946025354, 1713946025354, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_detail', 'material_name', '产品名称', 'varchar(40)', 729, 1713946025358, 1713946025358, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_detail', 'material_code', '物料代码', 'varchar(40)', 730, 1713946025359, 1713946025359, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_detail', 'material_specification', '规格型号', 'varchar(100)', 731, 1713946025359, 1713946025359, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_detail', 'delivered_number', '数量', 'int', 732, 1713946025360, 1713946025360, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_detail', 'volume', '体积', 'decimal(12,7)', 733, 1713946025360, 1713946025360, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_detail', 'total_volume', '总体积', 'decimal(12,7)', 734, 1713946025360, 1713946025360, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_detail', 'comment', '备注', 'varchar(1000)', 735, 1713946025361, 1713946025361, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_detail', 'id', '', 'int', 736, 1713946025361, 1713946025361, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_detail', 'create_time', '创建时间', 'bigint', 737, 1713946025362, 1713946025362, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_detail', 'update_time', '更新新时间', 'bigint', 738, 1713946025362, 1713946025362, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_detail', 'update_user', '更新者id', 'int', 739, 1713946025362, 1713946025362, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_detail', 'create_user', '创建者id', 'int', 740, 1713946025363, 1713946025363, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_detail', 'create_org', '创建的组织id', 'int', 741, 1713946025363, 1713946025363, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_detail', 'update_org', '更新的组织id', 'int', 742, 1713946025364, 1713946025364, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_detail', 'is_delete', '1删除0有效', 'int', 743, 1713946025364, 1713946025364, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('zz_sale_order_detail', 'material_status', '良品，或者不良品', 'varchar(40)', 744, 1713946025365, 1713946025365, NULL, NULL, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('merchant', 'merchant_name', '商家名称', 'varchar(20)', 745, 1714967742826, 1714967742826, 1, 1, 0);
INSERT INTO `cwu_table_field_relation` VALUES ('merchant', 'merchant_code', '商家编码', 'varchar(20)', 746, 1714967742830, 1714967742830, 1, 1, 0);

-- ----------------------------
-- Table structure for cwu_update_bill_log
-- ----------------------------
DROP TABLE IF EXISTS `cwu_update_bill_log`;
CREATE TABLE `cwu_update_bill_log`  (
  `origin_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原值',
  `after_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新后的值',
  `bill_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属哪条记录',
  `result_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定字段的名称',
  `result_type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作的类型：collect和bill',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL,
  `create_user` bigint(20) NULL DEFAULT NULL,
  `create_org` int(11) NULL DEFAULT NULL COMMENT '创建的组织id',
  `update_org` int(11) NULL DEFAULT NULL COMMENT '更新的组织id',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '1删除0有效',
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_code_name_index`(`bill_code`, `result_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '手动更新账单的日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cwu_update_bill_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` bigint(20) NOT NULL COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-05-06 10:47:24', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-05-06 10:47:24', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-05-06 10:47:24', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2024-05-06 10:47:24', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-05-06 10:47:24', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (11, 'OSS预览列表资源开关', 'sys.oss.previewListResource', 'true', 'Y', 'admin', '2024-05-06 10:47:24', '', NULL, 'true:开启, false:关闭');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-06 10:47:24', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-06 10:47:24', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-06 10:47:24', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-06 10:47:24', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-06 10:47:24', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-06 10:47:24', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-06 10:47:24', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-06 10:47:24', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-06 10:47:24', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-06 10:47:24', '', NULL);
INSERT INTO `sys_dept` VALUES (1787420409289256962, 102, '0,100,102', '测试部门', 0, '神秘人111', '11111', '', '0', '0', 'admin', '2024-05-06 17:53:29', 'admin', '2024-05-06 17:55:24');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '其他操作');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_key_value
-- ----------------------------
DROP TABLE IF EXISTS `sys_key_value`;
CREATE TABLE `sys_key_value`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '值',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新新时间',
  `update_user` bigint(20) NULL DEFAULT NULL,
  `create_user` bigint(20) NULL DEFAULT NULL,
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '1删除0有效',
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sys_key`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_key_value
-- ----------------------------
INSERT INTO `sys_key_value` VALUES (9, '1', NULL, 1714975651635, 1715153500219, 1783676987621154817, 1, 0, 'SCHEME_CODE_NUM');
INSERT INTO `sys_key_value` VALUES (10, '2', NULL, 1714975651654, 1715153500239, 1783676987621154817, 1, 0, 'RESULT_FIELD_NUM');
INSERT INTO `sys_key_value` VALUES (11, '1', NULL, 1714976077453, 1715180784053, 1783676987621154817, 1, 0, 'DEPEND_CODE_NUM');
INSERT INTO `sys_key_value` VALUES (12, '4', NULL, 1714977389906, 1715181655976, 1, 1, 0, 'RESULT_BATCH_CODE_NUM');
INSERT INTO `sys_key_value` VALUES (13, '15', NULL, 1714977389956, 1715181656002, 1, 1, 0, 'COST_BILL_NUM');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1787326312272625666, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 11:39:34');
INSERT INTO `sys_logininfor` VALUES (1787362086472912897, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 14:01:44');
INSERT INTO `sys_logininfor` VALUES (1787405073882148865, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 16:52:33');
INSERT INTO `sys_logininfor` VALUES (1787405191813394434, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-05-06 16:53:01');
INSERT INTO `sys_logininfor` VALUES (1787405216765308930, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 16:53:07');
INSERT INTO `sys_logininfor` VALUES (1787406328255811586, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2024-05-06 16:57:32');
INSERT INTO `sys_logininfor` VALUES (1787406338091454465, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2024-05-06 16:57:34');
INSERT INTO `sys_logininfor` VALUES (1787406351416758273, 'admin', '192.168.28.101', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2024-05-06 16:57:37');
INSERT INTO `sys_logininfor` VALUES (1787406471323521025, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2024-05-06 16:58:06');
INSERT INTO `sys_logininfor` VALUES (1787406505452572673, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2024-05-06 16:58:14');
INSERT INTO `sys_logininfor` VALUES (1787406583110111234, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2024-05-06 16:58:32');
INSERT INTO `sys_logininfor` VALUES (1787406613476872194, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2024-05-06 16:58:40');
INSERT INTO `sys_logininfor` VALUES (1787406822348955649, 'admin', '192.168.28.101', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2024-05-06 16:59:30');
INSERT INTO `sys_logininfor` VALUES (1787407012464173058, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2024-05-06 17:00:15');
INSERT INTO `sys_logininfor` VALUES (1787407031988658177, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2024-05-06 17:00:20');
INSERT INTO `sys_logininfor` VALUES (1787407041245487105, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2024-05-06 17:00:22');
INSERT INTO `sys_logininfor` VALUES (1787407682764283906, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '1', '验证码错误', '2024-05-06 17:02:55');
INSERT INTO `sys_logininfor` VALUES (1787407694818713602, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:02:58');
INSERT INTO `sys_logininfor` VALUES (1787407760530874369, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-05-06 17:03:13');
INSERT INTO `sys_logininfor` VALUES (1787407770676895745, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '1', '验证码错误', '2024-05-06 17:03:16');
INSERT INTO `sys_logininfor` VALUES (1787408129315053570, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2024-05-06 17:04:41');
INSERT INTO `sys_logininfor` VALUES (1787408135556177921, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2024-05-06 17:04:43');
INSERT INTO `sys_logininfor` VALUES (1787408219610021890, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:05:03');
INSERT INTO `sys_logininfor` VALUES (1787408250379436033, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:05:10');
INSERT INTO `sys_logininfor` VALUES (1787409051495706626, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:08:21');
INSERT INTO `sys_logininfor` VALUES (1787409059817205761, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:08:23');
INSERT INTO `sys_logininfor` VALUES (1787409094759952386, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:08:31');
INSERT INTO `sys_logininfor` VALUES (1787409163517177858, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:08:48');
INSERT INTO `sys_logininfor` VALUES (1787409538278346753, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:10:17');
INSERT INTO `sys_logininfor` VALUES (1787409547761668098, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:10:19');
INSERT INTO `sys_logininfor` VALUES (1787409963761127425, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:11:58');
INSERT INTO `sys_logininfor` VALUES (1787410269764964353, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:13:11');
INSERT INTO `sys_logininfor` VALUES (1787410854174052354, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:15:31');
INSERT INTO `sys_logininfor` VALUES (1787410942455762946, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:15:52');
INSERT INTO `sys_logininfor` VALUES (1787410972373733378, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-05-06 17:15:59');
INSERT INTO `sys_logininfor` VALUES (1787410986550480898, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:16:02');
INSERT INTO `sys_logininfor` VALUES (1787411117047861249, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:16:33');
INSERT INTO `sys_logininfor` VALUES (1787411526302879745, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:18:11');
INSERT INTO `sys_logininfor` VALUES (1787411538575413249, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:18:14');
INSERT INTO `sys_logininfor` VALUES (1787411577204953089, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:18:23');
INSERT INTO `sys_logininfor` VALUES (1787411585413206018, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:18:25');
INSERT INTO `sys_logininfor` VALUES (1787411663435649026, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:18:44');
INSERT INTO `sys_logininfor` VALUES (1787411680598740993, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:18:48');
INSERT INTO `sys_logininfor` VALUES (1787411984622866434, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:20:00');
INSERT INTO `sys_logininfor` VALUES (1787412185420976130, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:20:48');
INSERT INTO `sys_logininfor` VALUES (1787412535569862657, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:22:12');
INSERT INTO `sys_logininfor` VALUES (1787412598996127745, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:22:27');
INSERT INTO `sys_logininfor` VALUES (1787412879695695873, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:23:34');
INSERT INTO `sys_logininfor` VALUES (1787413234856783873, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-05-06 17:24:58');
INSERT INTO `sys_logininfor` VALUES (1787413248035287041, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:25:02');
INSERT INTO `sys_logininfor` VALUES (1787413248169504770, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-05-06 17:25:02');
INSERT INTO `sys_logininfor` VALUES (1787413860625969153, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:27:28');
INSERT INTO `sys_logininfor` VALUES (1787414562605658113, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:30:15');
INSERT INTO `sys_logininfor` VALUES (1787414663843573761, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:30:39');
INSERT INTO `sys_logininfor` VALUES (1787414663973597186, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-05-06 17:30:39');
INSERT INTO `sys_logininfor` VALUES (1787414688132788225, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:30:45');
INSERT INTO `sys_logininfor` VALUES (1787414688254423041, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-05-06 17:30:45');
INSERT INTO `sys_logininfor` VALUES (1787414752284667905, 'admin', '192.168.28.101', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:31:00');
INSERT INTO `sys_logininfor` VALUES (1787414977141305346, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:31:54');
INSERT INTO `sys_logininfor` VALUES (1787416787679756289, 'admin', '192.168.28.101', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:39:05');
INSERT INTO `sys_logininfor` VALUES (1787417489684574210, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:41:53');
INSERT INTO `sys_logininfor` VALUES (1787421172665167873, 'admin', '192.168.28.101', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 17:56:31');
INSERT INTO `sys_logininfor` VALUES (1787422408453926913, 'admin', '192.168.28.101', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-06 18:01:26');
INSERT INTO `sys_logininfor` VALUES (1787653988552335361, 'admin', '192.168.28.101', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-07 09:21:39');
INSERT INTO `sys_logininfor` VALUES (1787654119888576513, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-07 09:22:10');
INSERT INTO `sys_logininfor` VALUES (1787688063455481857, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-05-07 11:37:03');
INSERT INTO `sys_logininfor` VALUES (1787688083906908162, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-07 11:37:08');
INSERT INTO `sys_logininfor` VALUES (1787741081127374850, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-07 15:07:43');
INSERT INTO `sys_logininfor` VALUES (1788090474938527746, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-08 14:16:05');
INSERT INTO `sys_logininfor` VALUES (1788123345711558658, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-08 16:26:42');
INSERT INTO `sys_logininfor` VALUES (1788465988878495746, 'admin', '192.168.28.101', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-09 15:08:14');
INSERT INTO `sys_logininfor` VALUES (1788466010110062593, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-09 15:08:20');
INSERT INTO `sys_logininfor` VALUES (1788466509253210114, 'admin', '192.168.28.123', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-09 15:10:19');
INSERT INTO `sys_logininfor` VALUES (1788466516291252225, 'admin', '192.168.28.123', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-09 15:10:20');
INSERT INTO `sys_logininfor` VALUES (1788466518610702337, 'admin', '192.168.28.123', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-09 15:10:21');
INSERT INTO `sys_logininfor` VALUES (1788466541012480001, 'admin', '192.168.28.123', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-09 15:10:26');
INSERT INTO `sys_logininfor` VALUES (1788466590832422913, 'admin', '192.168.28.123', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-09 15:10:38');
INSERT INTO `sys_logininfor` VALUES (1788845418452926466, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '1', '密码输入错误1次', '2024-05-10 16:15:58');
INSERT INTO `sys_logininfor` VALUES (1788845437411180546, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-10 16:16:02');
INSERT INTO `sys_logininfor` VALUES (1789126944923107330, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-11 10:54:39');
INSERT INTO `sys_logininfor` VALUES (1789127023977349121, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-11 10:54:58');
INSERT INTO `sys_logininfor` VALUES (1789127093804122114, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-11 10:55:14');
INSERT INTO `sys_logininfor` VALUES (1789127106915516417, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-11 10:55:17');
INSERT INTO `sys_logininfor` VALUES (1789127148229410818, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-11 10:55:27');
INSERT INTO `sys_logininfor` VALUES (1789127288826675201, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-11 10:56:01');
INSERT INTO `sys_logininfor` VALUES (1789127370376527874, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-11 10:56:20');
INSERT INTO `sys_logininfor` VALUES (1789202471407108098, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-05-11 15:54:46');
INSERT INTO `sys_logininfor` VALUES (1789202484677885953, 'ccadmin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-11 15:54:49');
INSERT INTO `sys_logininfor` VALUES (1789202529540161538, 'ccadmin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-05-11 15:54:59');
INSERT INTO `sys_logininfor` VALUES (1789202544090202114, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-11 15:55:03');
INSERT INTO `sys_logininfor` VALUES (1790292454612172802, 'admin', '192.168.28.101', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-14 16:05:58');
INSERT INTO `sys_logininfor` VALUES (1790292665640189954, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-14 16:06:48');
INSERT INTO `sys_logininfor` VALUES (1790293297772150786, 'admin', '192.168.28.134', '内网IP', 'Firefox', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-14 16:09:19');
INSERT INTO `sys_logininfor` VALUES (1790296680646107137, 'admin', '192.168.28.101', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-14 16:22:45');
INSERT INTO `sys_logininfor` VALUES (1790305933117153281, 'admin', '192.168.28.121', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-05-14 16:59:31');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '显示状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', 'test', 'monitor', 'admin', '2023-11-01 14:22:40', 'lwy2', '2023-11-16 16:24:18', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '1', '0', '', 'monitor', 'admin', '2023-11-01 14:22:40', 'admin', '2024-03-07 15:21:49', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-11-01 14:22:40', 'admin', '2024-04-10 15:36:09', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, 'PLUS官网', 0, 4, 'https://gitee.com/dromara/RuoYi-Cloud-Plus', NULL, '', 0, 0, 'M', '1', '0', '', 'guide', 'admin', '2023-11-01 14:22:40', 'admin', '2023-11-13 17:41:26', 'RuoYi-Cloud-Plus官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', '/views/sysManagement/userManagement', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-11-01 14:22:40', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', '/views/sysManagement/roleManagement', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-11-01 14:22:40', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', '/views/sysManagement/menuManagement', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-11-01 14:22:40', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', '/views/sysManagement/departmentManagement', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-11-01 14:22:40', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '1', '1', 'system:post:list', 'post', 'admin', '2023-11-01 14:22:40', 'admin', '2024-05-06 17:42:54', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '1', '1', 'system:dict:list', 'dict', 'admin', '2023-11-01 14:22:40', 'admin', '2024-05-06 17:42:48', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '1', '1', 'system:config:list', 'edit', 'admin', '2023-11-01 14:22:40', 'admin', '2024-05-06 17:42:42', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '1', '1', 'system:notice:list', 'message', 'admin', '2023-11-01 14:22:40', 'admin', '2024-05-06 17:42:35', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '1', '1', '', 'log', 'admin', '2023-11-01 14:22:40', 'admin', '2024-05-06 17:42:29', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-11-01 14:22:40', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, 'XxlJob控制台', 2, 2, 'http://localhost:9900', '', '', 0, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-11-01 14:22:40', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, 'Sentinel控制台', 2, 3, 'http://localhost:8718', '', '', 0, 0, 'C', '0', '0', 'monitor:sentinel:list', 'sentinel', 'admin', '2023-11-01 14:22:40', '', NULL, '流量控制菜单');
INSERT INTO `sys_menu` VALUES (112, 'Nacos控制台', 2, 4, 'http://localhost:8848/nacos', '', '', 0, 0, 'C', '0', '0', 'monitor:nacos:list', 'nacos', 'admin', '2023-11-01 14:22:40', '', NULL, '服务治理菜单');
INSERT INTO `sys_menu` VALUES (113, 'Admin控制台', 2, 5, 'http://localhost:9100/login', '', '', 0, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-11-01 14:22:40', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-11-01 14:22:40', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-11-01 14:22:40', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (118, '文件管理', 1, 10, 'oss', 'system/oss/index', '', 1, 0, 'C', '1', '1', 'system:oss:list', 'upload', 'admin', '2023-11-01 14:22:40', 'admin', '2024-05-06 17:42:25', '文件管理菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', '', 1, 0, 'C', '0', '0', 'system:operlog:list', 'form', 'admin', '2023-11-01 14:22:40', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', '/views/sysManagement/loginRecord', '', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', 'admin', '2023-11-01 14:22:40', 'admin', '2024-01-22 16:46:23', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:unlock', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1600, '文件查询', 118, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:query', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1601, '文件上传', 118, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:upload', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1602, '文件下载', 118, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:download', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1603, '文件删除', 118, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:remove', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1604, '配置添加', 118, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:add', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1605, '配置编辑', 118, 6, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:edit', '#', 'admin', '2023-11-01 14:22:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1716625747821522945, '财务管理', 0, 1, 'financial', '', '', 1, 0, 'M', '0', '0', 'Finance', 'Coin', 'admin', '2023-10-24 09:20:46', 'admin', '2024-03-20 15:31:56', '2023-10-24 09:25:26');
INSERT INTO `sys_menu` VALUES (1716626012737957889, '表达式管理', 1716625747821522945, 2, 'conditionsConfig', '/views/financial/conditionsConfig/index', '', 1, 0, 'C', '0', '0', 'conditionsConfig', '#', 'admin', '2023-10-24 09:21:49', 'admin', '2024-02-26 17:00:56', '2024-02-26 17:00:56');
INSERT INTO `sys_menu` VALUES (1716626156917157889, '方案管理', 1716625747821522945, 0, 'programme', '/views/financial/programmeList', '', 1, 0, 'C', '0', '0', 'settlementPlan', '#', 'admin', '2023-10-24 09:22:24', 'admin', '2024-02-26 16:57:07', '2024-02-26 16:57:07');
INSERT INTO `sys_menu` VALUES (1762039212013043714, '账单数据', 1716625747821522945, 3, 'billingdata', '/views/financial/billingdata', '', 1, 0, 'C', '0', '0', 'billingdata', '#', 'admin', '2024-02-26 16:57:40', 'admin', '2024-04-10 11:06:34', '2024-02-26 17:01:01');
INSERT INTO `sys_menu` VALUES (1762039407819931649, '数据库管理', 1716625747821522945, 4, 'database', '/views/financial/database', '', 1, 0, 'C', '0', '0', 'Finance', '#', 'admin', '2024-02-26 16:58:27', 'admin', '2024-02-26 17:01:07', '2024-02-26 17:01:07');
INSERT INTO `sys_menu` VALUES (1762039795503644673, '数据库表', 1716625747821522945, 3, 'structure', '/views/financial/structure', '', 1, 0, 'C', '0', '0', 'structure', '#', 'admin', '2024-02-26 16:59:59', 'admin', '2024-04-10 11:48:47', '2024-02-26 17:00:06');
INSERT INTO `sys_menu` VALUES (1762039924981809154, '分类管理', 1716625747821522945, 1, 'relationship', '/views/financial/relationship', '', 1, 0, 'C', '0', '0', 'relationship', '#', 'admin', '2024-02-26 17:00:30', 'admin', '2024-04-10 10:51:27', '2024-02-26 17:00:49');
INSERT INTO `sys_menu` VALUES (1764543750641074178, '汇总计划', 1716625747821522945, 0, 'summaryPlan', '/views/financial/summaryPlan', '', 1, 0, 'C', '0', '0', 'summaryPlan', '#', 'admin', '2024-03-04 14:49:48', 'admin', '2024-04-10 10:42:59', '2024-03-04 14:50:08');
INSERT INTO `sys_menu` VALUES (1777588150732386305, '分类数据缺失', 1716625747821522945, 10, 'classificationError', '/views/financial/classificationError', NULL, 1, 0, 'C', '0', '0', 'classificationError', '#', 'admin', '2024-04-09 14:43:36', 'admin', '2024-04-09 14:43:36', '');
INSERT INTO `sys_menu` VALUES (1777888106904481794, '新增方案', 1716626156917157889, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'settlementPlan:add', '#', 'admin', '2024-04-10 10:35:31', 'admin', '2024-04-10 10:35:31', '');
INSERT INTO `sys_menu` VALUES (1777888688243404802, '生成账单', 1716626156917157889, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'settlementPlan:createBill', '#', 'admin', '2024-04-10 10:37:50', 'admin', '2024-04-10 10:37:50', '');
INSERT INTO `sys_menu` VALUES (1777888789443571714, '删除计划', 1716626156917157889, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'settlementPlan:delete', '#', 'admin', '2024-04-10 10:38:14', 'admin', '2024-04-10 10:38:14', '');
INSERT INTO `sys_menu` VALUES (1777888945761087489, '查看账单', 1716626156917157889, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'settlementPlan:check', '#', 'admin', '2024-04-10 10:38:51', 'admin', '2024-04-10 10:38:51', '');
INSERT INTO `sys_menu` VALUES (1777888993093808130, '刷新账单', 1716626156917157889, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'settlementPlan:refresh', '#', 'admin', '2024-04-10 10:39:02', 'admin', '2024-04-10 10:39:02', '');
INSERT INTO `sys_menu` VALUES (1777889953031581697, '新增汇总计划', 1764543750641074178, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'summaryPlan:add', '#', 'admin', '2024-04-10 10:42:51', 'admin', '2024-04-10 10:42:51', '');
INSERT INTO `sys_menu` VALUES (1777890236801413122, '删除汇总计划', 1764543750641074178, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'summaryPlan:delete', '#', 'admin', '2024-04-10 10:43:59', 'admin', '2024-04-10 10:43:59', '');
INSERT INTO `sys_menu` VALUES (1777890557254627329, '查看汇总账单', 1764543750641074178, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'summaryPlan:check', '#', 'admin', '2024-04-10 10:45:15', 'admin', '2024-04-10 10:45:15', '');
INSERT INTO `sys_menu` VALUES (1777890597524140034, '生成数据', 1764543750641074178, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'summaryPlan:create', '#', 'admin', '2024-04-10 10:45:25', 'admin', '2024-04-10 10:45:25', '');
INSERT INTO `sys_menu` VALUES (1777892260360155137, '新增分类', 1762039924981809154, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'relationship:add', '#', 'admin', '2024-04-10 10:52:01', 'admin', '2024-04-10 10:52:01', '');
INSERT INTO `sys_menu` VALUES (1777892717476376578, '关闭依赖', 1762039924981809154, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'relationship:delete', '#', 'admin', '2024-04-10 10:53:50', 'admin', '2024-04-10 10:53:50', '');
INSERT INTO `sys_menu` VALUES (1777893571944181762, '导出汇总账单', 1777274618821668866, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'SummarizeData:export', '#', 'admin', '2024-04-10 10:57:14', 'admin', '2024-04-10 10:57:31', '');
INSERT INTO `sys_menu` VALUES (1777893721894744065, '修改汇总账单', 1777274618821668866, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'SummarizeData:update', '#', 'admin', '2024-04-10 10:57:50', 'admin', '2024-04-10 10:57:50', '');
INSERT INTO `sys_menu` VALUES (1777893788441571329, '新增汇总计划', 1777274618821668866, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'SummarizeData:add', '#', 'admin', '2024-04-10 10:58:05', 'admin', '2024-04-10 10:58:05', '');
INSERT INTO `sys_menu` VALUES (1777896026643820545, '刷新账单', 1762039212013043714, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'billingdata:refresh', '#', 'admin', '2024-04-10 11:06:59', 'admin', '2024-04-10 11:06:59', '');
INSERT INTO `sys_menu` VALUES (1777896105840668674, '导出账单', 1762039212013043714, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'billingdata:export', '#', 'admin', '2024-04-10 11:07:18', 'admin', '2024-04-10 11:07:18', '');
INSERT INTO `sys_menu` VALUES (1777896340897853442, '导入更新账单', 1762039212013043714, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'billingdata:update', '#', 'admin', '2024-04-10 11:08:14', 'admin', '2024-04-10 11:08:14', '');
INSERT INTO `sys_menu` VALUES (1777896476881383425, '查看修改日志', 1762039212013043714, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'billingdata:checkUpdateData', '#', 'admin', '2024-04-10 11:08:46', 'admin', '2024-04-10 11:08:46', '');
INSERT INTO `sys_menu` VALUES (1777906610672168961, '新增', 1762039795503644673, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'structure:add', '#', 'admin', '2024-04-10 11:49:03', 'admin', '2024-04-10 11:49:03', '');
INSERT INTO `sys_menu` VALUES (1777906675860041729, '导入明细', 1762039795503644673, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'structure:import', '#', 'admin', '2024-04-10 11:49:18', 'admin', '2024-04-10 11:49:18', '');
INSERT INTO `sys_menu` VALUES (1777907706706718721, '导入excel', 1762039795503644673, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'structure:importExcel', '#', 'admin', '2024-04-10 11:53:24', 'admin', '2024-04-10 11:53:24', '');
INSERT INTO `sys_menu` VALUES (1777907834842705921, '删除', 1762039795503644673, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'structure:delete', '#', 'admin', '2024-04-10 11:53:54', 'admin', '2024-04-10 11:53:54', '');
INSERT INTO `sys_menu` VALUES (1777908056847216641, '更新明细', 1762039795503644673, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'structure:update', '#', 'admin', '2024-04-10 11:54:47', 'admin', '2024-04-10 11:54:47', '');
INSERT INTO `sys_menu` VALUES (1777908150875123713, '查看明细', 1762039795503644673, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'structure:check', '#', 'admin', '2024-04-10 11:55:10', 'admin', '2024-04-10 11:55:10', '');
INSERT INTO `sys_menu` VALUES (1787328110278160386, '编辑数据库', 1762039407819931649, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'database:database:edit', '#', 'admin', '2024-05-06 11:46:43', 'admin', '2024-05-06 11:46:43', '');
INSERT INTO `sys_menu` VALUES (1787328152158285825, '数据库测试', 1762039407819931649, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'database:database:test', '#', 'admin', '2024-05-06 11:46:53', 'admin', '2024-05-06 11:46:53', '');
INSERT INTO `sys_menu` VALUES (1787328197012172801, '删除数据库', 1762039407819931649, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'database:database:delete', '#', 'admin', '2024-05-06 11:47:04', 'admin', '2024-05-06 11:47:22', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` bigint(20) NOT NULL COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-05-06 10:47:24', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-05-06 10:47:24', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1787417625936539649, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-01 14:22:40\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-06 17:42:25\",\"parentName\":null,\"parentId\":1,\"children\":[],\"menuId\":118,\"menuName\":\"文件管理\",\"orderNum\":10,\"path\":\"oss\",\"component\":\"system/oss/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"1\",\"perms\":\"system:oss:list\",\"icon\":\"upload\",\"remark\":\"文件管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-06 17:42:25');
INSERT INTO `sys_oper_log` VALUES (1787417643250626561, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-01 14:22:40\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-06 17:42:29\",\"parentName\":null,\"parentId\":1,\"children\":[],\"menuId\":108,\"menuName\":\"日志管理\",\"orderNum\":9,\"path\":\"log\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"1\",\"status\":\"1\",\"perms\":\"\",\"icon\":\"log\",\"remark\":\"日志管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-06 17:42:29');
INSERT INTO `sys_oper_log` VALUES (1787417667263016961, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-01 14:22:40\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-06 17:42:35\",\"parentName\":null,\"parentId\":1,\"children\":[],\"menuId\":107,\"menuName\":\"通知公告\",\"orderNum\":8,\"path\":\"notice\",\"component\":\"system/notice/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"1\",\"perms\":\"system:notice:list\",\"icon\":\"message\",\"remark\":\"通知公告菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-06 17:42:35');
INSERT INTO `sys_oper_log` VALUES (1787417695067058178, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-01 14:22:40\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-06 17:42:41\",\"parentName\":null,\"parentId\":1,\"children\":[],\"menuId\":106,\"menuName\":\"参数设置\",\"orderNum\":7,\"path\":\"config\",\"component\":\"system/config/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"1\",\"perms\":\"system:config:list\",\"icon\":\"edit\",\"remark\":\"参数设置菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-06 17:42:42');
INSERT INTO `sys_oper_log` VALUES (1787417722577498114, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-01 14:22:40\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-06 17:42:48\",\"parentName\":null,\"parentId\":1,\"children\":[],\"menuId\":105,\"menuName\":\"字典管理\",\"orderNum\":6,\"path\":\"dict\",\"component\":\"system/dict/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"1\",\"perms\":\"system:dict:list\",\"icon\":\"dict\",\"remark\":\"字典管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-06 17:42:48');
INSERT INTO `sys_oper_log` VALUES (1787417745830719489, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-01 14:22:40\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-06 17:42:53\",\"parentName\":null,\"parentId\":1,\"children\":[],\"menuId\":104,\"menuName\":\"岗位管理\",\"orderNum\":5,\"path\":\"post\",\"component\":\"system/post/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"1\",\"perms\":\"system:post:list\",\"icon\":\"post\",\"remark\":\"岗位管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-06 17:42:54');
INSERT INTO `sys_oper_log` VALUES (1787420409352171522, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-06 17:53:28\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-06 17:53:28\",\"parentName\":null,\"parentId\":100,\"children\":[],\"deptId\":\"1787420409289256962\",\"deptName\":\"测试部门\",\"orderNum\":0,\"leader\":\"神秘人\",\"phone\":\"11111\",\"email\":\"\",\"status\":\"0\",\"delFlag\":null,\"ancestors\":\"0,100\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-06 17:53:29');
INSERT INTO `sys_oper_log` VALUES (1787420621978218497, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-06 17:53:29\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-06 17:53:29\",\"parentName\":\"若依科技\",\"parentId\":\"1787420409289256962\",\"children\":[],\"deptId\":\"1787420409289256962\",\"deptName\":\"测试部门\",\"orderNum\":0,\"leader\":\"神秘人\",\"phone\":\"11111\",\"email\":\"\",\"status\":\"0\",\"delFlag\":\"0\",\"ancestors\":\"0,100\"}', '{\"code\":500,\"msg\":\"修改部门\'测试部门\'失败，上级部门不能是自己\",\"data\":null}', 0, '', '2024-05-06 17:54:20');
INSERT INTO `sys_oper_log` VALUES (1787420637404868610, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-06 17:53:29\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-06 17:53:29\",\"parentName\":\"若依科技\",\"parentId\":101,\"children\":[],\"deptId\":\"1787420409289256962\",\"deptName\":\"测试部门\",\"orderNum\":0,\"leader\":\"神秘人\",\"phone\":\"11111\",\"email\":\"\",\"status\":\"0\",\"delFlag\":\"0\",\"ancestors\":\"0,100\"}', '{\"code\":500,\"msg\":\"修改部门\'测试部门\'失败，部门名称已存在\",\"data\":null}', 0, '', '2024-05-06 17:54:23');
INSERT INTO `sys_oper_log` VALUES (1787420689481347073, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-06 17:53:29\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-06 17:53:29\",\"parentName\":\"若依科技\",\"parentId\":101,\"children\":[],\"deptId\":\"1787420409289256962\",\"deptName\":\"测试部门\",\"orderNum\":0,\"leader\":\"神秘人\",\"phone\":\"11111\",\"email\":\"\",\"status\":\"0\",\"delFlag\":\"0\",\"ancestors\":\"0,100\"}', '{\"code\":500,\"msg\":\"修改部门\'测试部门\'失败，部门名称已存在\",\"data\":null}', 0, '', '2024-05-06 17:54:36');
INSERT INTO `sys_oper_log` VALUES (1787420783521837058, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-06 17:53:29\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-06 17:54:58\",\"parentName\":\"若依科技\",\"parentId\":100,\"children\":[],\"deptId\":\"1787420409289256962\",\"deptName\":\"测试部门\",\"orderNum\":0,\"leader\":\"神秘人111\",\"phone\":\"11111\",\"email\":\"\",\"status\":\"0\",\"delFlag\":\"0\",\"ancestors\":\"0,100\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-06 17:54:58');
INSERT INTO `sys_oper_log` VALUES (1787420892825399298, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-06 17:53:29\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-06 17:55:24\",\"parentName\":\"若依科技\",\"parentId\":102,\"children\":[],\"deptId\":\"1787420409289256962\",\"deptName\":\"测试部门\",\"orderNum\":0,\"leader\":\"神秘人111\",\"phone\":\"11111\",\"email\":\"\",\"status\":\"0\",\"delFlag\":\"0\",\"ancestors\":\"0,100,102\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-06 17:55:24');
INSERT INTO `sys_oper_log` VALUES (1787655238626893825, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/resetPwd', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-06 10:47:24\",\"updateBy\":null,\"updateTime\":null,\"userId\":1,\"deptId\":103,\"userName\":\"admin\",\"nickName\":\"疯狂的狮子Li\",\"userType\":null,\"email\":\"crazyLionLi@163.com\",\"phonenumber\":\"15888888888\",\"sex\":\"1\",\"avatar\":\"\",\"status\":\"0\",\"delFlag\":\"0\",\"loginIp\":\"192.168.28.134\",\"loginDate\":\"2024-05-07 09:22:10\",\"remark\":\"管理员\",\"dept\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"parentName\":null,\"parentId\":null,\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"orderNum\":null,\"leader\":\"若依\",\"phone\":null,\"email\":null,\"status\":null,\"delFlag\":null,\"ancestors\":null},\"roles\":[],\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"userWarehouseCode\":null,\"admin\":true}', '', 1, '不允许操作超级管理员用户', '2024-05-07 09:26:37');
INSERT INTO `sys_oper_log` VALUES (1788478008034095105, '产品', 3, 'com.ruoyi.web.controller.wms.ProductController.remove()', 'DELETE', 1, 'admin', '研发部门', '/wms/product/10', '192.168.28.134', '内网IP', '{}', '', 1, '存在组合产品关联此产品，无法删除，组合产品id：[1]', '2024-05-09 15:56:00');
INSERT INTO `sys_oper_log` VALUES (1788493662011289601, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-03-05 11:50:25\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-09 16:58:12\",\"parentName\":null,\"parentId\":\"1764891093791961089\",\"children\":[],\"menuId\":\"1764859726752456704\",\"menuName\":\"仓库档案\",\"orderNum\":3,\"path\":\"warehouse\",\"component\":\"/views/fileManager/warehouse\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"wms:warehouse:list\",\"icon\":\"#\",\"remark\":\"仓库菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-09 16:58:12');
INSERT INTO `sys_oper_log` VALUES (1788493700275924994, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-01 14:37:04\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-09 16:58:21\",\"parentName\":null,\"parentId\":\"1764891093791961089\",\"children\":[],\"menuId\":\"1774687237329944576\",\"menuName\":\"员工档案\",\"orderNum\":5,\"path\":\"employee\",\"component\":\"/views/worker/worker\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"wms:employee:list\",\"icon\":\"#\",\"remark\":\"员工档案菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-09 16:58:21');
INSERT INTO `sys_oper_log` VALUES (1788493753208041473, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-03-05 11:48:52\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-09 16:58:34\",\"parentName\":null,\"parentId\":\"1764891093791961089\",\"children\":[],\"menuId\":\"1764859724361703424\",\"menuName\":\"商家档案\",\"orderNum\":4,\"path\":\"merchant\",\"component\":\"/views/fileManager/shoper\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"wms:merchant:list\",\"icon\":\"#\",\"remark\":\"商家档案菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-09 16:58:34');
INSERT INTO `sys_oper_log` VALUES (1788501760809660417, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-03-05 11:48:52\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-09 17:30:23\",\"parentName\":null,\"parentId\":\"1764891093791961089\",\"children\":[],\"menuId\":\"1764859724361703424\",\"menuName\":\"商家档案\",\"orderNum\":6,\"path\":\"merchant\",\"component\":\"/views/fileManager/shoper\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"wms:merchant:list\",\"icon\":\"#\",\"remark\":\"商家档案菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-09 17:30:23');
INSERT INTO `sys_oper_log` VALUES (1788502036010528769, '员工档案', 1, 'com.ruoyi.web.controller.wms.EmployeeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/employee', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-08 10:59:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-08 10:59:23\",\"id\":\"1777169339388600321\",\"accountId\":\"wenyong\",\"accountPassword\":\"123456\",\"employeeCode\":\"YG24040800000\",\"employeeName\":\"文勇\",\"employeePhone\":\"18420186890\",\"employeeRoleName\":\"仓储商家\",\"roleIds\":\"1765659501503844353\",\"employeeWarehouseName\":\"万豪前置仓\",\"employeeWarehouseCode\":\"CK24030700001\",\"email\":null,\"isDelete\":0,\"remark\":null}', '', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1777169339388600321\' for key \'PRIMARY\'\r\n### The error may exist in com/ruoyi/wms/mapper/EmployeeMapper.java (best guess)\r\n### The error may involve com.ruoyi.wms.mapper.EmployeeMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO employee  ( id, account_id, employee_code, employee_name, employee_phone, employee_role_name,  is_delete,  employee_warehouse_name, employee_warehouse_code, create_by, create_time, update_by, update_time )  VALUES (  ?, ?, ?, ?, ?, ?,  ?,  ?, ?, ?, ?, ?, ?  )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1777169339388600321\' for key \'PRIMARY\'\n; Duplicate entry \'1777169339388600321\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1777169339388600321\' for key \'PRIMARY\'', '2024-05-09 17:31:29');
INSERT INTO `sys_oper_log` VALUES (1788502062141042689, '员工档案', 1, 'com.ruoyi.web.controller.wms.EmployeeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/employee', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-08 10:59:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-08 10:59:23\",\"id\":\"1777169339388600321\",\"accountId\":\"wenyong\",\"accountPassword\":\"123456\",\"employeeCode\":\"YG24040800000\",\"employeeName\":\"文勇\",\"employeePhone\":\"18420186890\",\"employeeRoleName\":\"仓储商家\",\"roleIds\":\"1765659501503844353\",\"employeeWarehouseName\":\"万豪前置仓\",\"employeeWarehouseCode\":\"CK24030700001\",\"email\":null,\"isDelete\":0,\"remark\":null}', '', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1777169339388600321\' for key \'PRIMARY\'\r\n### The error may exist in com/ruoyi/wms/mapper/EmployeeMapper.java (best guess)\r\n### The error may involve com.ruoyi.wms.mapper.EmployeeMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO employee  ( id, account_id, employee_code, employee_name, employee_phone, employee_role_name,  is_delete,  employee_warehouse_name, employee_warehouse_code, create_by, create_time, update_by, update_time )  VALUES (  ?, ?, ?, ?, ?, ?,  ?,  ?, ?, ?, ?, ?, ?  )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1777169339388600321\' for key \'PRIMARY\'\n; Duplicate entry \'1777169339388600321\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1777169339388600321\' for key \'PRIMARY\'', '2024-05-09 17:31:35');
INSERT INTO `sys_oper_log` VALUES (1788502133872029697, '员工档案', 1, 'com.ruoyi.web.controller.wms.EmployeeController.add()', 'POST', 1, 'admin', '研发部门', '/wms/employee', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-08 10:59:23\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-08 10:59:23\",\"id\":\"1777169339388600321\",\"accountId\":\"wenyong\",\"accountPassword\":\"123456\",\"employeeCode\":\"YG24040800000\",\"employeeName\":\"文勇\",\"employeePhone\":\"18420186890\",\"employeeRoleName\":\"仓储商家\",\"roleIds\":\"1765659501503844353\",\"employeeWarehouseName\":\"万豪前置仓\",\"employeeWarehouseCode\":\"CK24030700001\",\"email\":null,\"isDelete\":0,\"remark\":null}', '', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1777169339388600321\' for key \'PRIMARY\'\r\n### The error may exist in com/ruoyi/wms/mapper/EmployeeMapper.java (best guess)\r\n### The error may involve com.ruoyi.wms.mapper.EmployeeMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO employee  ( id, account_id, employee_code, employee_name, employee_phone, employee_role_name,  is_delete,  employee_warehouse_name, employee_warehouse_code, create_by, create_time, update_by, update_time )  VALUES (  ?, ?, ?, ?, ?, ?,  ?,  ?, ?, ?, ?, ?, ?  )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1777169339388600321\' for key \'PRIMARY\'\n; Duplicate entry \'1777169339388600321\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1777169339388600321\' for key \'PRIMARY\'', '2024-05-09 17:31:52');
INSERT INTO `sys_oper_log` VALUES (1788503071869399041, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-03-05 14:17:45\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-09 17:35:35\",\"parentName\":null,\"parentId\":\"1764890605604335617\",\"children\":[],\"menuId\":\"1764898069229891586\",\"menuName\":\"盘点管理\",\"orderNum\":2,\"path\":\"pdgl\",\"component\":null,\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"pdgl\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-09 17:35:36');
INSERT INTO `sys_oper_log` VALUES (1788503113833410561, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-03-05 14:05:33\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-09 17:35:45\",\"parentName\":null,\"parentId\":\"1764890605604335617\",\"children\":[],\"menuId\":\"1764894998638653442\",\"menuName\":\"库存管理\",\"orderNum\":2,\"path\":\"kcgl\",\"component\":null,\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"kcgl\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-09 17:35:46');
INSERT INTO `sys_oper_log` VALUES (1788503216006656002, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-03-05 14:17:45\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-09 17:36:10\",\"parentName\":null,\"parentId\":\"1764890605604335617\",\"children\":[],\"menuId\":\"1764898069229891586\",\"menuName\":\"盘点管理\",\"orderNum\":4,\"path\":\"pdgl\",\"component\":null,\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"pdgl\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-09 17:36:10');
INSERT INTO `sys_oper_log` VALUES (1788867766908403714, '调拨单主', 1, 'com.ruoyi.web.controller.wms.AllocationOrderMainController.add()', 'POST', 1, 'admin', '研发部门', '/wms/allocationOrderMain', '192.168.28.134', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"allocationCode\":null,\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"toWarehouseCode\":\"CK24030800002\",\"toWarehouseName\":\"四会前置仓\",\"totalNumber\":null,\"totalVolume\":null,\"pickingMan\":\"牢大\",\"comment\":null,\"processStatus\":null,\"numberOfPrints\":null,\"remark\":null,\"allocationOrderDetailList\":[{\"allocationCode\":\"DB24051000000\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"number\":2,\"volume\":\"97.0000000\",\"totalVolume\":\"194.0000000\",\"id\":\"1788867766774185986\"}]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"createBy\":\"admin\",\"createTime\":\"2024-05-10 17:44:45\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-10 17:44:45\",\"id\":\"1788867766774185985\",\"allocationCode\":\"DB24051000000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"toWarehouseCode\":\"CK24030800002\",\"toWarehouseName\":\"四会前置仓\",\"totalNumber\":2,\"totalVolume\":\"194.0000000\",\"pickingMan\":\"牢大\",\"comment\":null,\"processStatus\":\"allocation_wait_out\",\"numberOfPrints\":null,\"remark\":null}}', 0, '', '2024-05-10 17:44:46');
INSERT INTO `sys_oper_log` VALUES (1788869404251439105, '出库单制作', 1, 'com.ruoyi.web.controller.wms.OutWarehouseOrderMainController.saveOutWarehouseOrder()', 'POST', 1, 'admin', '研发部门', '/wms/OutWarehouseOrderMain/saveOutWarehouseOrder', '192.168.28.134', '内网IP', '[{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"outWarehouseCode\":\"CK24051000000\",\"type\":\"调拨出库\",\"saleAllCodes\":\"DB24051000000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"merchantCode\":null,\"merchantName\":null,\"totalNumber\":2,\"totalVolume\":\"194.0000000\",\"processStatus\":\"out_wait_out\",\"numberOfPrints\":null,\"remark\":null,\"outWarehouseOrderDetailList\":[{\"id\":\"1788869404184330243\",\"outWarehouseCode\":\"CK24051000000\",\"saleOrderCode\":null,\"allocationCode\":\"DB24051000000\",\"productName\":\"格力电饭煲\",\"productCode\":\"GLDFB\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"productUnit\":null,\"number\":2,\"volume\":\"97.0000000\",\"totalVolume\":\"194.0000000\",\"merchantCode\":null,\"merchantName\":null,\"merchantLinkman\":null,\"merchantLinkmanPhone\":null,\"customerName\":null,\"customerPhone\":null,\"receiptAddress\":null,\"remark\":null,\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"batchCode\":null}],\"outWarehouseOrderProductDetailList\":[{\"id\":\"1788869404184330244\",\"outWarehouseCode\":\"CK24051000000\",\"saleOrderCode\":null,\"allocationCode\":\"DB24051000000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24031100004\",\"positionName\":\"仓位1\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"productUnit\":null,\"barCodeHead\":\"47BR5\",\"volume\":\"97.0000000\",\"shouldOutNumber\":2,\"haveOutNumber\":null,\"noOutNumber\":2,\"totalVolume\":\"194.0000000\",\"sort\":null,\"parentProductCode\":\"GLDFB\",\"remark\":null,\"batchCode\":null}],\"outWarehouseOrderPositionDetailList\":null,\"outWarehouseOrderScanDetailList\":null}]', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"createBy\":\"admin\",\"createTime\":\"2024-05-10 17:51:16\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-10 17:51:16\",\"id\":\"1788869404184330242\",\"outWarehouseCode\":\"CK24051000000\",\"type\":\"调拨出库\",\"saleAllCodes\":\"DB24051000000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"merchantCode\":null,\"merchantName\":null,\"totalNumber\":2,\"totalVolume\":\"194.0000000\",\"processStatus\":\"out_wait_out\",\"numberOfPrints\":null,\"remark\":null}}', 0, '', '2024-05-10 17:51:16');
INSERT INTO `sys_oper_log` VALUES (1788869556198490114, '出库单主', 3, 'com.ruoyi.web.controller.wms.OutWarehouseOrderMainController.remove()', 'DELETE', 1, 'admin', '研发部门', '/wms/OutWarehouseOrderMain/1788869404184330242/false', '192.168.28.134', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-10 17:51:52');
INSERT INTO `sys_oper_log` VALUES (1788870543931916293, '出库单制作', 1, 'com.ruoyi.web.controller.wms.OutWarehouseOrderMainController.saveOutWarehouseOrder()', 'POST', 1, 'admin', '研发部门', '/wms/OutWarehouseOrderMain/saveOutWarehouseOrder', '192.168.28.134', '内网IP', '[{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"outWarehouseCode\":\"CK24051000000\",\"type\":\"调拨出库\",\"saleAllCodes\":\"DB24051000000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"merchantCode\":null,\"merchantName\":null,\"totalNumber\":2,\"totalVolume\":\"194.0000000\",\"processStatus\":\"out_wait_out\",\"numberOfPrints\":null,\"remark\":null,\"outWarehouseOrderDetailList\":[{\"id\":\"1788870543931916291\",\"outWarehouseCode\":\"CK24051000000\",\"saleOrderCode\":null,\"allocationCode\":\"DB24051000000\",\"productName\":\"格力电饭煲\",\"productCode\":\"GLDFB\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"productUnit\":null,\"number\":2,\"volume\":\"97.0000000\",\"totalVolume\":\"194.0000000\",\"merchantCode\":null,\"merchantName\":null,\"merchantLinkman\":null,\"merchantLinkmanPhone\":null,\"customerName\":null,\"customerPhone\":null,\"receiptAddress\":null,\"remark\":null,\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"batchCode\":null}],\"outWarehouseOrderProductDetailList\":[{\"id\":\"1788870543931916292\",\"outWarehouseCode\":\"CK24051000000\",\"saleOrderCode\":null,\"allocationCode\":\"DB24051000000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24031100004\",\"positionName\":\"仓位1\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"productUnit\":null,\"barCodeHead\":\"47BR5\",\"volume\":\"97.0000000\",\"shouldOutNumber\":2,\"haveOutNumber\":null,\"noOutNumber\":2,\"totalVolume\":\"194.0000000\",\"sort\":null,\"parentProductCode\":\"GLDFB\",\"remark\":null,\"batchCode\":null}],\"outWarehouseOrderPositionDetailList\":null,\"outWarehouseOrderScanDetailList\":null}]', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"createBy\":\"admin\",\"createTime\":\"2024-05-10 17:55:47\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-10 17:55:47\",\"id\":\"1788870543931916290\",\"outWarehouseCode\":\"CK24051000000\",\"type\":\"调拨出库\",\"saleAllCodes\":\"DB24051000000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"merchantCode\":null,\"merchantName\":null,\"totalNumber\":2,\"totalVolume\":\"194.0000000\",\"processStatus\":\"out_wait_out\",\"numberOfPrints\":null,\"remark\":null}}', 0, '', '2024-05-10 17:55:48');
INSERT INTO `sys_oper_log` VALUES (1788870778569670657, '手动出库', 2, 'com.ruoyi.web.controller.wms.OutWarehouseOrderMainController.manualOutOrder()', 'POST', 1, 'admin', '研发部门', '/wms/OutWarehouseOrderMain/manualOutOrder', '192.168.28.134', '内网IP', '[{\"id\":\"1788870543931916292\",\"outWarehouseCode\":\"CK24051000000\",\"saleOrderCode\":null,\"allocationCode\":\"DB24051000000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24031100004\",\"positionName\":\"仓位1\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"productUnit\":null,\"barCodeHead\":\"47BR5\",\"volume\":\"97.0000000\",\"shouldOutNumber\":2,\"haveOutNumber\":0,\"noOutNumber\":2,\"totalVolume\":\"194.0000000\",\"sort\":null,\"parentProductCode\":\"GLDFB\",\"remark\":null,\"batchCode\":null,\"isOutNumber\":1}]', '', 1, 'com.ruoyi.wms.mapper.OutWarehouseOrderPositionDetailMapper.insert (batch index #1) failed. Cause: java.sql.BatchUpdateException: Data truncation: Data too long for column \'bar_code\' at row 1\n; Data truncation: Data too long for column \'bar_code\' at row 1; nested exception is java.sql.BatchUpdateException: Data truncation: Data too long for column \'bar_code\' at row 1', '2024-05-10 17:56:44');
INSERT INTO `sys_oper_log` VALUES (1788870907884257281, '手动出库', 2, 'com.ruoyi.web.controller.wms.OutWarehouseOrderMainController.manualOutOrder()', 'POST', 1, 'admin', '研发部门', '/wms/OutWarehouseOrderMain/manualOutOrder', '192.168.28.134', '内网IP', '[{\"id\":\"1788870543931916292\",\"outWarehouseCode\":\"CK24051000000\",\"saleOrderCode\":null,\"allocationCode\":\"DB24051000000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24031100004\",\"positionName\":\"仓位1\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"productUnit\":null,\"barCodeHead\":\"47BR5\",\"volume\":\"97.0000000\",\"shouldOutNumber\":2,\"haveOutNumber\":0,\"noOutNumber\":2,\"totalVolume\":\"194.0000000\",\"sort\":null,\"parentProductCode\":\"GLDFB\",\"remark\":null,\"batchCode\":null,\"isOutNumber\":1}]', '', 1, 'com.ruoyi.wms.mapper.OutWarehouseOrderPositionDetailMapper.insert (batch index #1) failed. Cause: java.sql.BatchUpdateException: Data truncation: Data too long for column \'bar_code\' at row 1\n; Data truncation: Data too long for column \'bar_code\' at row 1; nested exception is java.sql.BatchUpdateException: Data truncation: Data too long for column \'bar_code\' at row 1', '2024-05-10 17:57:15');
INSERT INTO `sys_oper_log` VALUES (1788870946576711681, '手动出库', 2, 'com.ruoyi.web.controller.wms.OutWarehouseOrderMainController.manualOutOrder()', 'POST', 1, 'admin', '研发部门', '/wms/OutWarehouseOrderMain/manualOutOrder', '192.168.28.134', '内网IP', '[{\"id\":\"1788870543931916292\",\"outWarehouseCode\":\"CK24051000000\",\"saleOrderCode\":null,\"allocationCode\":\"DB24051000000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24031100004\",\"positionName\":\"仓位1\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"productUnit\":null,\"barCodeHead\":\"47BR5\",\"volume\":\"97.0000000\",\"shouldOutNumber\":2,\"haveOutNumber\":0,\"noOutNumber\":2,\"totalVolume\":\"194.0000000\",\"sort\":null,\"parentProductCode\":\"GLDFB\",\"remark\":null,\"batchCode\":null,\"isOutNumber\":1}]', '', 1, 'com.ruoyi.wms.mapper.OutWarehouseOrderPositionDetailMapper.insert (batch index #1) failed. Cause: java.sql.BatchUpdateException: Data truncation: Data too long for column \'bar_code\' at row 1\n; Data truncation: Data too long for column \'bar_code\' at row 1; nested exception is java.sql.BatchUpdateException: Data truncation: Data too long for column \'bar_code\' at row 1', '2024-05-10 17:57:24');
INSERT INTO `sys_oper_log` VALUES (1788871187732414468, '手动出库', 2, 'com.ruoyi.web.controller.wms.OutWarehouseOrderMainController.manualOutOrder()', 'POST', 1, 'admin', '研发部门', '/wms/OutWarehouseOrderMain/manualOutOrder', '192.168.28.134', '内网IP', '[{\"id\":\"1788870543931916292\",\"outWarehouseCode\":\"CK24051000000\",\"saleOrderCode\":null,\"allocationCode\":\"DB24051000000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24031100004\",\"positionName\":\"仓位1\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"productUnit\":null,\"barCodeHead\":\"47BR5\",\"volume\":\"97.0000000\",\"shouldOutNumber\":2,\"haveOutNumber\":0,\"noOutNumber\":2,\"totalVolume\":\"194.0000000\",\"sort\":null,\"parentProductCode\":\"GLDFB\",\"remark\":null,\"batchCode\":null,\"isOutNumber\":1}]', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-10 17:58:21');
INSERT INTO `sys_oper_log` VALUES (1789132906983636993, '创建入库单', 1, 'com.ruoyi.web.controller.wms.inWarehouse.InWarehouseOrderMainController.create()', 'POST', 1, 'admin', '研发部门', '/wms/InWarehouseOrderMain/create', '192.168.28.134', '内网IP', '{\"id\":\"1789132906916528138\",\"inWarehouseCode\":\"RK24051100000\",\"warehouseCode\":\"CK24030800002\",\"warehouseName\":\"四会前置仓\",\"type\":\"普通入库\",\"processStatus\":\"in_create\",\"inspectionPerson\":null,\"merchantCode\":null,\"merchantName\":null,\"totalNumber\":5,\"totalVolume\":\"485.0000000\",\"isDelete\":null,\"numberOfPrints\":null,\"pickUpWarehouseCode\":null,\"pickUpWarehouse\":null,\"remark\":null,\"inWarehouseOrderDetailList\":[{\"id\":\"1789132906916528135\",\"inWarehouseCode\":\"RK24051100000\",\"allocationCode\":null,\"saleOrderReturnCode\":null,\"productCode\":\"KFYCNAG005\",\"productName\":\"格力促销套装\",\"productType\":\"组合\",\"productSpecification\":\"格力组合套装\",\"productUnit\":null,\"number\":1,\"volume\":\"3.0000000\",\"totalVolume\":null,\"comment\":null,\"lastInWarehouseCode\":null,\"pickUpWarehouseCode\":null,\"pickUpWarehouse\":null,\"remark\":null,\"batchCode\":null},{\"id\":\"1789132906916528136\",\"inWarehouseCode\":\"RK24051100000\",\"allocationCode\":null,\"saleOrderReturnCode\":null,\"productCode\":\"KCMEY452\",\"productName\":\"格力洗衣机\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"productUnit\":null,\"number\":1,\"volume\":\"97.0000000\",\"totalVolume\":null,\"comment\":null,\"lastInWarehouseCode\":null,\"pickUpWarehouseCode\":null,\"pickUpWarehouse\":null,\"remark\":null,\"batchCode\":null},{\"id\":\"1789132906916528137\",\"inWarehouseCode\":\"RK24051100000\",\"allocationCode\":null,\"saleOrderReturnCode\":null,\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"productUnit\":null,\"number\":1,\"volume\":\"97.0000000\",\"totalVolume\":null,\"comment\":null,\"lastInWarehouseCode\":null,\"pickUpWarehouseCode\":null,\"pickUpWarehouse\":null,\"remark\":null,\"batchCode\":null}]}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"id\":\"1789132906916528138\",\"inWarehouseCode\":\"RK24051100000\",\"warehouseCode\":\"CK24030800002\",\"warehouseName\":\"四会前置仓\",\"type\":\"普通入库\",\"processStatus\":\"in_create\",\"inspectionPerson\":null,\"merchantCode\":null,\"merchantName\":null,\"totalNumber\":5,\"totalVolume\":\"485.0000000\",\"isDelete\":null,\"numberOfPrints\":null,\"pickUpWarehouseCode\":null,\"pickUpWarehouse\":null,\"remark\":null,\"inWarehouseOrderDetailList\":[{\"id\":\"1789132906916528135\",\"inWarehouseCode\":\"RK24051100000\",\"allocationCode\":null,\"saleOrderReturnCode\":null,\"productCode\":\"KFYCNAG005\",\"productName\":\"格力促销套装\",\"productType\":\"组合\",\"productSpecification\":\"格力组合套装\",\"productUnit\":null,\"number\":1,\"volume\":\"3.0000000\",\"totalVolume\":null,\"comment\":null,\"lastInWarehouseCode\":null,\"pickUpWarehouseCode\":null,\"pickUpWarehouse\":null,\"remark\":null,\"batchCode\":null},{\"id\":\"1789132906916528136\",\"inWarehouseCode\":\"RK24051100000\",\"allocationCode\":null,\"saleOrderReturnCode\":null,\"productCode\":\"KCMEY452\",\"productName\":\"格力洗衣机\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"productUnit\":null,\"number\":1,\"volume\":\"97.0000000\",\"totalVolume\":null,\"comment\":null,\"lastInWarehouseCode\":null,\"pickUpWarehouseCode\":null,\"pickUpWarehouse\":null,\"remark\":null,\"batchCode\":null},{\"id\":\"1789132906916528137\",\"inWarehouseCode\":\"RK24051100000\",\"allocationCode\":null,\"saleOrderReturnCode\":null,\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"productUnit\":null,\"number\":1,\"volume\":\"97.0000000\",\"totalVolume\":null,\"comment\":null,\"lastInWarehouseCode\":null,\"pickUpWarehouseCode\":null,\"pickUpWarehouse\":null,\"remark\":null,\"batchCode\":null}]}}', 0, '', '2024-05-11 11:18:20');
INSERT INTO `sys_oper_log` VALUES (1789139688007188482, '盘点', 1, 'com.ruoyi.web.controller.wms.InventorySheetController.add()', 'POST', 1, 'admin', '研发部门', '/wms/sheet', '192.168.28.134', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"inventorySheetOrderCode\":null,\"inventorySheetDate\":\"2024-05-11 00:00:00\",\"profitAndLossQuantitySum\":null,\"comment\":null,\"processStatus\":null,\"id\":null,\"remark\":null,\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"inventorySheetDetailList\":[{\"createBy\":\"admin\",\"createTime\":\"2024-04-19 14:28:55\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-19 14:28:55\",\"id\":\"1781208334699368450\",\"inventorySheetOrderCode\":null,\"warehouseCode\":null,\"warehouseName\":null,\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":0,\"profitAndLossQuantity\":0,\"remark\":null},{\"createBy\":\"admin\",\"createTime\":\"2024-04-19 14:28:55\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-19 14:28:55\",\"id\":\"1781208334699368455\",\"inventorySheetOrderCode\":null,\"warehouseCode\":null,\"warehouseName\":null,\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLSDJQR\",\"productName\":\"格力扫地机器人\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":0,\"profitAndLossQuantity\":0,\"remark\":null}],\"processStatusList\":null}', '', 1, '仓库有出库单在出库，无法盘点', '2024-05-11 11:45:17');
INSERT INTO `sys_oper_log` VALUES (1789139737982320646, '手动出库', 2, 'com.ruoyi.web.controller.wms.OutWarehouseOrderMainController.manualOutOrder()', 'POST', 1, 'admin', '研发部门', '/wms/OutWarehouseOrderMain/manualOutOrder', '192.168.28.134', '内网IP', '[{\"id\":\"1788870543931916292\",\"outWarehouseCode\":\"CK24051000000\",\"saleOrderCode\":null,\"allocationCode\":\"DB24051000000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24031100004\",\"positionName\":\"仓位1\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"productUnit\":null,\"barCodeHead\":\"47BR5\",\"volume\":\"97.0000000\",\"shouldOutNumber\":2,\"haveOutNumber\":1,\"noOutNumber\":1,\"totalVolume\":\"194.0000000\",\"sort\":null,\"parentProductCode\":\"GLDFB\",\"remark\":null,\"batchCode\":null,\"isOutNumber\":1}]', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 11:45:29');
INSERT INTO `sys_oper_log` VALUES (1789139801446334468, '盘点', 1, 'com.ruoyi.web.controller.wms.InventorySheetController.add()', 'POST', 1, 'admin', '研发部门', '/wms/sheet', '192.168.28.134', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"inventorySheetOrderCode\":null,\"inventorySheetDate\":null,\"profitAndLossQuantitySum\":null,\"comment\":null,\"processStatus\":null,\"id\":\"1789139801446334467\",\"remark\":null,\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"inventorySheetDetailList\":[{\"createBy\":\"admin\",\"createTime\":\"2024-04-19 14:28:55\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-19 14:28:55\",\"id\":\"1789139801446334465\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLSDJQR\",\"productName\":\"格力扫地机器人\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":0,\"profitAndLossQuantity\":0,\"remark\":null},{\"createBy\":\"admin\",\"createTime\":\"2024-04-19 14:28:55\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-19 14:28:55\",\"id\":\"1789139801446334466\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":0,\"profitAndLossQuantity\":0,\"remark\":null}],\"processStatusList\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"inventorySheetOrderCode\":null,\"inventorySheetDate\":null,\"profitAndLossQuantitySum\":null,\"comment\":null,\"processStatus\":null,\"id\":\"1789139801446334467\",\"remark\":null,\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"inventorySheetDetailList\":[{\"createBy\":\"admin\",\"createTime\":\"2024-04-19 14:28:55\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-19 14:28:55\",\"id\":\"1789139801446334465\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLSDJQR\",\"productName\":\"格力扫地机器人\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":0,\"profitAndLossQuantity\":0,\"remark\":null},{\"createBy\":\"admin\",\"createTime\":\"2024-04-19 14:28:55\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-19 14:28:55\",\"id\":\"1789139801446334466\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":0,\"profitAndLossQuantity\":0,\"remark\":null}],\"processStatusList\":null}}', 0, '', '2024-05-11 11:45:44');
INSERT INTO `sys_oper_log` VALUES (1789139833759252481, '盘点', 2, 'com.ruoyi.web.controller.wms.InventorySheetController.nextProcess()', 'PUT', 1, 'admin', '研发部门', '/wms/sheet/nextProcess/1789139801446334467', '192.168.28.134', '内网IP', '\"1789139801446334467\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 11:45:52');
INSERT INTO `sys_oper_log` VALUES (1789139859071877121, '盘点', 2, 'com.ruoyi.web.controller.wms.InventorySheetController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/sheet', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-11 11:45:44\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:45:52\",\"inventorySheetOrderCode\":\"PD24051100000\",\"inventorySheetDate\":null,\"profitAndLossQuantitySum\":null,\"comment\":null,\"processStatus\":\"inventory_ing\",\"id\":\"1789139801446334467\",\"remark\":null,\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"inventorySheetDetailList\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:45:57\",\"id\":\"1789139801446334465\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLSDJQR\",\"productName\":\"格力扫地机器人\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":1,\"profitAndLossQuantity\":-4,\"remark\":null},{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:45:57\",\"id\":\"1789139801446334466\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":0,\"profitAndLossQuantity\":0,\"remark\":null}],\"processStatusList\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 11:45:58');
INSERT INTO `sys_oper_log` VALUES (1789139859868794882, '盘点', 2, 'com.ruoyi.web.controller.wms.InventorySheetController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/sheet', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-11 11:45:44\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:45:58\",\"inventorySheetOrderCode\":\"PD24051100000\",\"inventorySheetDate\":null,\"profitAndLossQuantitySum\":-4,\"comment\":null,\"processStatus\":\"inventory_ing\",\"id\":\"1789139801446334467\",\"remark\":null,\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"inventorySheetDetailList\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:45:57\",\"id\":\"1789139801446334465\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLSDJQR\",\"productName\":\"格力扫地机器人\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":2,\"profitAndLossQuantity\":-3,\"remark\":null},{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:45:57\",\"id\":\"1789139801446334466\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":0,\"profitAndLossQuantity\":0,\"remark\":null}],\"processStatusList\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 11:45:58');
INSERT INTO `sys_oper_log` VALUES (1789139860539883522, '盘点', 2, 'com.ruoyi.web.controller.wms.InventorySheetController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/sheet', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-11 11:45:44\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:45:58\",\"inventorySheetOrderCode\":\"PD24051100000\",\"inventorySheetDate\":null,\"profitAndLossQuantitySum\":-3,\"comment\":null,\"processStatus\":\"inventory_ing\",\"id\":\"1789139801446334467\",\"remark\":null,\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"inventorySheetDetailList\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:45:58\",\"id\":\"1789139801446334465\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLSDJQR\",\"productName\":\"格力扫地机器人\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":3,\"profitAndLossQuantity\":-2,\"remark\":null},{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:45:58\",\"id\":\"1789139801446334466\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":0,\"profitAndLossQuantity\":0,\"remark\":null}],\"processStatusList\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 11:45:58');
INSERT INTO `sys_oper_log` VALUES (1789139861265498114, '盘点', 2, 'com.ruoyi.web.controller.wms.InventorySheetController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/sheet', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-11 11:45:44\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:45:58\",\"inventorySheetOrderCode\":\"PD24051100000\",\"inventorySheetDate\":null,\"profitAndLossQuantitySum\":-2,\"comment\":null,\"processStatus\":\"inventory_ing\",\"id\":\"1789139801446334467\",\"remark\":null,\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"inventorySheetDetailList\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:45:58\",\"id\":\"1789139801446334465\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLSDJQR\",\"productName\":\"格力扫地机器人\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":4,\"profitAndLossQuantity\":-1,\"remark\":null},{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:45:58\",\"id\":\"1789139801446334466\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":0,\"profitAndLossQuantity\":0,\"remark\":null}],\"processStatusList\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 11:45:58');
INSERT INTO `sys_oper_log` VALUES (1789139862066610177, '盘点', 2, 'com.ruoyi.web.controller.wms.InventorySheetController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/sheet', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-11 11:45:44\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:45:58\",\"inventorySheetOrderCode\":\"PD24051100000\",\"inventorySheetDate\":null,\"profitAndLossQuantitySum\":-1,\"comment\":null,\"processStatus\":\"inventory_ing\",\"id\":\"1789139801446334467\",\"remark\":null,\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"inventorySheetDetailList\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:45:58\",\"id\":\"1789139801446334465\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLSDJQR\",\"productName\":\"格力扫地机器人\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":5,\"profitAndLossQuantity\":0,\"remark\":null},{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:45:58\",\"id\":\"1789139801446334466\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":0,\"profitAndLossQuantity\":0,\"remark\":null}],\"processStatusList\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 11:45:58');
INSERT INTO `sys_oper_log` VALUES (1789139865849872385, '盘点', 2, 'com.ruoyi.web.controller.wms.InventorySheetController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/sheet', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-11 11:45:44\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:45:58\",\"inventorySheetOrderCode\":\"PD24051100000\",\"inventorySheetDate\":null,\"profitAndLossQuantitySum\":0,\"comment\":null,\"processStatus\":\"inventory_ing\",\"id\":\"1789139801446334467\",\"remark\":null,\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"inventorySheetDetailList\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:45:59\",\"id\":\"1789139801446334465\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLSDJQR\",\"productName\":\"格力扫地机器人\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":4,\"profitAndLossQuantity\":-1,\"remark\":null},{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:45:59\",\"id\":\"1789139801446334466\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":0,\"profitAndLossQuantity\":0,\"remark\":null}],\"processStatusList\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 11:45:59');
INSERT INTO `sys_oper_log` VALUES (1789139868437757954, '盘点', 2, 'com.ruoyi.web.controller.wms.InventorySheetController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/sheet', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-11 11:45:44\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:45:59\",\"inventorySheetOrderCode\":\"PD24051100000\",\"inventorySheetDate\":null,\"profitAndLossQuantitySum\":-1,\"comment\":null,\"processStatus\":\"inventory_ing\",\"id\":\"1789139801446334467\",\"remark\":null,\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"inventorySheetDetailList\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:45:59\",\"id\":\"1789139801446334465\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLSDJQR\",\"productName\":\"格力扫地机器人\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":5,\"profitAndLossQuantity\":0,\"remark\":null},{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:45:59\",\"id\":\"1789139801446334466\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":0,\"profitAndLossQuantity\":0,\"remark\":null}],\"processStatusList\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 11:46:00');
INSERT INTO `sys_oper_log` VALUES (1789139869104652289, '盘点', 2, 'com.ruoyi.web.controller.wms.InventorySheetController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/sheet', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-11 11:45:44\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:00\",\"inventorySheetOrderCode\":\"PD24051100000\",\"inventorySheetDate\":null,\"profitAndLossQuantitySum\":0,\"comment\":null,\"processStatus\":\"inventory_ing\",\"id\":\"1789139801446334467\",\"remark\":null,\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"inventorySheetDetailList\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:00\",\"id\":\"1789139801446334465\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLSDJQR\",\"productName\":\"格力扫地机器人\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":6,\"profitAndLossQuantity\":1,\"remark\":null},{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:00\",\"id\":\"1789139801446334466\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":0,\"profitAndLossQuantity\":0,\"remark\":null}],\"processStatusList\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 11:46:00');
INSERT INTO `sys_oper_log` VALUES (1789139869830266881, '盘点', 2, 'com.ruoyi.web.controller.wms.InventorySheetController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/sheet', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-11 11:45:44\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:00\",\"inventorySheetOrderCode\":\"PD24051100000\",\"inventorySheetDate\":null,\"profitAndLossQuantitySum\":1,\"comment\":null,\"processStatus\":\"inventory_ing\",\"id\":\"1789139801446334467\",\"remark\":null,\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"inventorySheetDetailList\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:00\",\"id\":\"1789139801446334465\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLSDJQR\",\"productName\":\"格力扫地机器人\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":7,\"profitAndLossQuantity\":2,\"remark\":null},{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:00\",\"id\":\"1789139801446334466\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":0,\"profitAndLossQuantity\":0,\"remark\":null}],\"processStatusList\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 11:46:00');
INSERT INTO `sys_oper_log` VALUES (1789139871625428994, '盘点', 2, 'com.ruoyi.web.controller.wms.InventorySheetController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/sheet', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-11 11:45:44\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:00\",\"inventorySheetOrderCode\":\"PD24051100000\",\"inventorySheetDate\":null,\"profitAndLossQuantitySum\":2,\"comment\":null,\"processStatus\":\"inventory_ing\",\"id\":\"1789139801446334467\",\"remark\":null,\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"inventorySheetDetailList\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:00\",\"id\":\"1789139801446334465\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLSDJQR\",\"productName\":\"格力扫地机器人\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":6,\"profitAndLossQuantity\":1,\"remark\":null},{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:00\",\"id\":\"1789139801446334466\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":0,\"profitAndLossQuantity\":0,\"remark\":null}],\"processStatusList\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 11:46:01');
INSERT INTO `sys_oper_log` VALUES (1789139872296517634, '盘点', 2, 'com.ruoyi.web.controller.wms.InventorySheetController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/sheet', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-11 11:45:44\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:01\",\"inventorySheetOrderCode\":\"PD24051100000\",\"inventorySheetDate\":null,\"profitAndLossQuantitySum\":1,\"comment\":null,\"processStatus\":\"inventory_ing\",\"id\":\"1789139801446334467\",\"remark\":null,\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"inventorySheetDetailList\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:00\",\"id\":\"1789139801446334465\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLSDJQR\",\"productName\":\"格力扫地机器人\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":5,\"profitAndLossQuantity\":0,\"remark\":null},{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:00\",\"id\":\"1789139801446334466\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":0,\"profitAndLossQuantity\":0,\"remark\":null}],\"processStatusList\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 11:46:01');
INSERT INTO `sys_oper_log` VALUES (1789139872963411969, '盘点', 2, 'com.ruoyi.web.controller.wms.InventorySheetController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/sheet', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-11 11:45:44\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:01\",\"inventorySheetOrderCode\":\"PD24051100000\",\"inventorySheetDate\":null,\"profitAndLossQuantitySum\":0,\"comment\":null,\"processStatus\":\"inventory_ing\",\"id\":\"1789139801446334467\",\"remark\":null,\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"inventorySheetDetailList\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:00\",\"id\":\"1789139801446334465\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLSDJQR\",\"productName\":\"格力扫地机器人\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":4,\"profitAndLossQuantity\":-1,\"remark\":null},{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:00\",\"id\":\"1789139801446334466\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":0,\"profitAndLossQuantity\":0,\"remark\":null}],\"processStatusList\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 11:46:01');
INSERT INTO `sys_oper_log` VALUES (1789139875492577282, '盘点', 2, 'com.ruoyi.web.controller.wms.InventorySheetController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/sheet', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-11 11:45:44\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:01\",\"inventorySheetOrderCode\":\"PD24051100000\",\"inventorySheetDate\":null,\"profitAndLossQuantitySum\":-1,\"comment\":null,\"processStatus\":\"inventory_ing\",\"id\":\"1789139801446334467\",\"remark\":null,\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"inventorySheetDetailList\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:01\",\"id\":\"1789139801446334465\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLSDJQR\",\"productName\":\"格力扫地机器人\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":4,\"profitAndLossQuantity\":-1,\"remark\":null},{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:01\",\"id\":\"1789139801446334466\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":1,\"profitAndLossQuantity\":-4,\"remark\":null}],\"processStatusList\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 11:46:02');
INSERT INTO `sys_oper_log` VALUES (1789139878134988802, '盘点', 2, 'com.ruoyi.web.controller.wms.InventorySheetController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/sheet', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-11 11:45:44\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:02\",\"inventorySheetOrderCode\":\"PD24051100000\",\"inventorySheetDate\":null,\"profitAndLossQuantitySum\":-5,\"comment\":null,\"processStatus\":\"inventory_ing\",\"id\":\"1789139801446334467\",\"remark\":null,\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"inventorySheetDetailList\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:02\",\"id\":\"1789139801446334465\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLSDJQR\",\"productName\":\"格力扫地机器人\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":4,\"profitAndLossQuantity\":-1,\"remark\":null},{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:02\",\"id\":\"1789139801446334466\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":2,\"profitAndLossQuantity\":-3,\"remark\":null}],\"processStatusList\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 11:46:02');
INSERT INTO `sys_oper_log` VALUES (1789139878873186305, '盘点', 2, 'com.ruoyi.web.controller.wms.InventorySheetController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/sheet', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-11 11:45:44\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:02\",\"inventorySheetOrderCode\":\"PD24051100000\",\"inventorySheetDate\":null,\"profitAndLossQuantitySum\":-4,\"comment\":null,\"processStatus\":\"inventory_ing\",\"id\":\"1789139801446334467\",\"remark\":null,\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"inventorySheetDetailList\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:02\",\"id\":\"1789139801446334465\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLSDJQR\",\"productName\":\"格力扫地机器人\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":4,\"profitAndLossQuantity\":-1,\"remark\":null},{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:02\",\"id\":\"1789139801446334466\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":3,\"profitAndLossQuantity\":-2,\"remark\":null}],\"processStatusList\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 11:46:02');
INSERT INTO `sys_oper_log` VALUES (1789139879477166082, '盘点', 2, 'com.ruoyi.web.controller.wms.InventorySheetController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/sheet', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-11 11:45:44\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:02\",\"inventorySheetOrderCode\":\"PD24051100000\",\"inventorySheetDate\":null,\"profitAndLossQuantitySum\":-3,\"comment\":null,\"processStatus\":\"inventory_ing\",\"id\":\"1789139801446334467\",\"remark\":null,\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"inventorySheetDetailList\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:02\",\"id\":\"1789139801446334465\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLSDJQR\",\"productName\":\"格力扫地机器人\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":4,\"profitAndLossQuantity\":-1,\"remark\":null},{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:02\",\"id\":\"1789139801446334466\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":4,\"profitAndLossQuantity\":-1,\"remark\":null}],\"processStatusList\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 11:46:03');
INSERT INTO `sys_oper_log` VALUES (1789140175028797441, '盘点', 2, 'com.ruoyi.web.controller.wms.InventorySheetController.edit()', 'PUT', 1, 'admin', '研发部门', '/wms/sheet', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-11 11:45:44\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:46:03\",\"inventorySheetOrderCode\":\"PD24051100000\",\"inventorySheetDate\":null,\"profitAndLossQuantitySum\":-2,\"comment\":null,\"processStatus\":\"inventory_ing\",\"id\":\"1789139801446334467\",\"remark\":null,\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"inventorySheetDetailList\":[{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:47:13\",\"id\":\"1789139801446334465\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLSDJQR\",\"productName\":\"格力扫地机器人\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":4,\"profitAndLossQuantity\":-1,\"remark\":null},{\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 11:47:13\",\"id\":\"1789139801446334466\",\"inventorySheetOrderCode\":\"PD24051100000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"positionCode\":\"CK24032900001\",\"positionName\":\"仓位2\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":5,\"firmOfferQuantity\":4,\"profitAndLossQuantity\":-1,\"remark\":null}],\"processStatusList\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 11:47:13');
INSERT INTO `sys_oper_log` VALUES (1789140257161658369, '盘点', 2, 'com.ruoyi.web.controller.wms.InventorySheetController.nextProcess()', 'PUT', 1, 'admin', '研发部门', '/wms/sheet/nextProcess/1789139801446334467', '192.168.28.134', '内网IP', '\"1789139801446334467\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 11:47:33');
INSERT INTO `sys_oper_log` VALUES (1789140516814241798, '盘点', 2, 'com.ruoyi.web.controller.wms.InventorySheetController.nextProcess()', 'PUT', 1, 'admin', '研发部门', '/wms/sheet/nextProcess/1789139801446334467', '192.168.28.134', '内网IP', '\"1789139801446334467\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 11:48:34');
INSERT INTO `sys_oper_log` VALUES (1789142661634506754, '盘点任务', 1, 'com.ruoyi.web.controller.wms.InventoryTaskMainController.add()', 'POST', 1, 'admin', '研发部门', '/wms/taskMain', '192.168.28.134', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"inventoryTaskOrderCode\":\"PDRW240511000\",\"inventoryTaskDate\":null,\"profitAndLossQuantitySum\":0,\"comment\":null,\"processStatus\":\"inventory_task_create\",\"isOpenCheck\":1,\"inventoryType\":\"CW\",\"userObject\":null,\"inventoryTaskName\":\"例行盘点\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"id\":null,\"remark\":null,\"inventoryUserDtoList\":[],\"inventoryTaskDetailList\":[{\"createBy\":\"admin\",\"createTime\":\"2024-04-19 13:50:44\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-19 13:50:44\",\"inventoryTaskOrderCode\":\"PDRW240511000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":null,\"warehousePositionCode\":\"CK24031100004\",\"warehousePositionName\":\"仓位1\",\"productCode\":\"KCMEY452\",\"productName\":\"格力洗衣机\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":10,\"firmOfferQuantity\":0,\"profitAndLossQuantity\":0,\"comment\":null,\"processStatus\":\"inventory_task_detail_not_started\",\"isOpenCheck\":1,\"barCodes\":null,\"id\":1,\"remark\":null},{\"createBy\":\"admin\",\"createTime\":\"2024-04-19 14:28:55\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-19 14:28:55\",\"inventoryTaskOrderCode\":\"PDRW240511000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":null,\"warehousePositionCode\":\"CK24032900001\",\"warehousePositionName\":\"仓位2\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":4,\"firmOfferQuantity\":0,\"profitAndLossQuantity\":0,\"comment\":null,\"processStatus\":\"inventory_task_detail_not_started\",\"isOpenCheck\":1,\"barCodes\":null,\"id\":2,\"remark\":null},{\"createBy\":\"admin\",\"createTime\":\"2024-04-19 13:50:44\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-19 13:50:44\",\"inventoryTaskOrderCode\":\"PDRW240511000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":null,\"warehousePositionCode\":\"CK24031100004\",\"warehousePositionName\":\"仓位1\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":13,\"firmOfferQuantity\":0,\"profitAndLossQuantity\":0,\"comment\":null,\"process', '{\"code\":200,\"msg\":\"1\",\"data\":null}', 0, '', '2024-05-11 11:57:06');
INSERT INTO `sys_oper_log` VALUES (1789143913357426690, '盘点任务', 3, 'com.ruoyi.web.controller.wms.InventoryTaskMainController.remove()', 'DELETE', 1, 'admin', '研发部门', '/wms/taskMain/1', '192.168.28.134', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 12:02:04');
INSERT INTO `sys_oper_log` VALUES (1789144038989414402, '盘点任务', 1, 'com.ruoyi.web.controller.wms.InventoryTaskMainController.add()', 'POST', 1, 'admin', '研发部门', '/wms/taskMain', '192.168.28.134', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"inventoryTaskOrderCode\":\"PDRW240511000\",\"inventoryTaskDate\":null,\"profitAndLossQuantitySum\":0,\"comment\":null,\"processStatus\":\"inventory_task_create\",\"isOpenCheck\":1,\"inventoryType\":\"CW\",\"userObject\":null,\"inventoryTaskName\":\"例行盘点\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":\"万豪前置仓\",\"id\":null,\"remark\":null,\"inventoryUserDtoList\":[{\"inventoryUserId\":\"wenyong\",\"inventoryUserName\":\"文勇\"}],\"inventoryTaskDetailList\":[{\"createBy\":\"admin\",\"createTime\":\"2024-04-19 13:50:44\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-19 13:50:44\",\"inventoryTaskOrderCode\":\"PDRW240511000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":null,\"warehousePositionCode\":\"CK24031100004\",\"warehousePositionName\":\"仓位1\",\"productCode\":\"KCMEY452\",\"productName\":\"格力洗衣机\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":10,\"firmOfferQuantity\":0,\"profitAndLossQuantity\":0,\"comment\":null,\"processStatus\":\"inventory_task_detail_not_started\",\"isOpenCheck\":1,\"barCodes\":null,\"id\":5,\"remark\":null},{\"createBy\":\"admin\",\"createTime\":\"2024-04-19 14:28:55\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-19 14:28:55\",\"inventoryTaskOrderCode\":\"PDRW240511000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":null,\"warehousePositionCode\":\"CK24032900001\",\"warehousePositionName\":\"仓位2\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":4,\"firmOfferQuantity\":0,\"profitAndLossQuantity\":0,\"comment\":null,\"processStatus\":\"inventory_task_detail_not_started\",\"isOpenCheck\":1,\"barCodes\":null,\"id\":6,\"remark\":null},{\"createBy\":\"admin\",\"createTime\":\"2024-04-19 13:50:44\",\"updateBy\":\"admin\",\"updateTime\":\"2024-04-19 13:50:44\",\"inventoryTaskOrderCode\":\"PDRW240511000\",\"warehouseCode\":\"CK24030700001\",\"warehouseName\":null,\"warehousePositionCode\":\"CK24031100004\",\"warehousePositionName\":\"仓位1\",\"productCode\":\"GLDFB\",\"productName\":\"格力电饭煲\",\"productType\":\"单件\",\"productSpecification\":\"格力就是好\",\"bookQuantity\":13,\"firmOfferQuantit', '{\"code\":200,\"msg\":\"2\",\"data\":null}', 0, '', '2024-05-11 12:02:34');
INSERT INTO `sys_oper_log` VALUES (1789202288631922690, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-11 15:54:02\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 15:54:02\",\"roleId\":\"1789202288564813826\",\"roleName\":\"仓储游客\",\"roleKey\":\"ccyk\",\"roleSort\":6,\"dataScope\":\"4\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":null,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":[\"1764859725477388289\",\"1764859725477388290\",\"1764859725477388291\",\"1764859725682909184\",\"1764859725682909185\",\"1764859725682909186\",\"1764859725682909187\",\"1764859725682909188\",\"1764859725682909189\",\"1764859726752456705\",\"1764859726752456706\",\"1764859726752456707\",\"1774687237334138880\",\"1774687237334138881\",\"1774687237334138882\",\"1764859724361703425\",\"1764859724361703426\",\"1764859724361703427\",\"1764894998638653442\",\"1764859722830782464\",\"1764859722830782465\",\"1764859722830782466\",\"1764859722830782467\",\"1764859722830782468\",\"1764859722830782469\",\"1764859723220852736\",\"1764859723220852737\",\"1764859723220852738\",\"1764859723220852739\",\"1764859723220852740\",\"1764859723220852741\",\"1764859724747579392\",\"1764859724747579393\",\"1764859724747579394\",\"1764859724747579395\",\"1764859724747579396\",\"1772834299485663233\",\"1764859724747579397\",\"1764898069229891586\",\"1764859724000993280\",\"1775425430065049602\",\"1764859724000993281\",\"1764859724000993282\",\"1764859724000993283\",\"1764859724000993284\",\"1764859724000993285\",\"1777578717711208448\",\"1777578717711208449\",\"1777578717711208450\",\"1777578717711208451\",\"1777578717711208452\",\"1777578717711208453\",\"1777578717908340736\",\"1777578717908340737\",\"1764896625915359234\",\"1764859726148476928\",\"1764859726148476929\",\"1764859726148476930\",\"1764859726148476931\",\"1764859726337220608\",\"1764859726337220609\",\"1764859726337220610\",\"1764859726337220611\",\"1764859726538547200\",\"1764859726538547201\",\"1764859726538547202\",\"1764859726538547203\",\"1764859726538547204\",\"1764859726538547205\",\"1764862375728062464\",\"1764862375728062465\",\"1773606587030077442\",\"1773608004914544642\",\"1773608077098516482\",\"1764890605604335617\",\"1764891093791961089\",\"1764859', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 15:54:02');
INSERT INTO `sys_oper_log` VALUES (1789202456152424450, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-11 15:54:41\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 15:54:41\",\"userId\":\"1789202456089509890\",\"deptId\":null,\"userName\":\"ccadmin\",\"nickName\":\"仓储管理账号\",\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":\"0\",\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[\"1789202288564813826\"],\"postIds\":null,\"roleId\":null,\"userWarehouseCode\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 15:54:42');
INSERT INTO `sys_oper_log` VALUES (1789202617050120193, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', '研发部门', '/system/role/dataScope', '192.168.28.134', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-11 15:54:02\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 15:55:20\",\"roleId\":\"1789202288564813826\",\"roleName\":\"仓储游客\",\"roleKey\":\"ccyk\",\"roleSort\":6,\"dataScope\":\"1\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":[],\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-05-11 15:55:20');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `oss_id` bigint(20) NOT NULL COMMENT '对象存储主键',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'URL地址',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '上传人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新人',
  `service` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'minio' COMMENT '服务商',
  PRIMARY KEY (`oss_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'OSS对象存储表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oss_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss_config`;
CREATE TABLE `sys_oss_config`  (
  `oss_config_id` bigint(20) NOT NULL COMMENT '主建',
  `config_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配置key',
  `access_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'accessKey',
  `secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '秘钥',
  `bucket_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '桶名称',
  `prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前缀',
  `endpoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '访问站点',
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '自定义域名',
  `is_https` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否https（Y=是,N=否）',
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '域',
  `access_policy` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '桶权限类型(0=private 1=public 2=custom)',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否默认（0=是,1=否）',
  `ext1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '扩展字段',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`oss_config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '对象存储配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oss_config
-- ----------------------------
INSERT INTO `sys_oss_config` VALUES (1, 'minio', 'ruoyi', 'ruoyi123', 'ruoyi', '', '127.0.0.1:9000', '', 'N', '', '1', '0', '', 'admin', '2024-05-06 10:47:24', 'admin', '2024-05-06 10:47:24', NULL);
INSERT INTO `sys_oss_config` VALUES (2, 'qiniu', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi', '', 's3-cn-north-1.qiniucs.com', '', 'N', '', '1', '1', '', 'admin', '2024-05-06 10:47:24', 'admin', '2024-05-06 10:47:24', NULL);
INSERT INTO `sys_oss_config` VALUES (3, 'aliyun', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi', '', 'oss-cn-beijing.aliyuncs.com', '', 'N', '', '1', '1', '', 'admin', '2024-05-06 10:47:24', 'admin', '2024-05-06 10:47:24', NULL);
INSERT INTO `sys_oss_config` VALUES (4, 'qcloud', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi-1250000000', '', 'cos.ap-beijing.myqcloud.com', '', 'N', 'ap-beijing', '1', '1', '', 'admin', '2024-05-06 10:47:24', 'admin', '2024-05-06 10:47:24', NULL);
INSERT INTO `sys_oss_config` VALUES (5, 'image', 'ruoyi', 'ruoyi123', 'ruoyi', 'image', '127.0.0.1:9000', '', 'N', '', '1', '1', '', 'admin', '2024-05-06 10:47:24', 'admin', '2024-05-06 10:47:24', NULL);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-05-06 10:47:24', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-05-06 10:47:24', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-05-06 10:47:24', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-05-06 10:47:24', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-05-06 10:47:24', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (3, '本部门及以下', 'test1', 3, '4', 1, 1, '0', '0', 'admin', '2024-05-06 10:48:05', 'admin', NULL, NULL);
INSERT INTO `sys_role` VALUES (4, '仅本人', 'test2', 4, '5', 1, 1, '0', '0', 'admin', '2024-05-06 10:48:05', 'admin', NULL, NULL);
INSERT INTO `sys_role` VALUES (1783068772843823106, '游客', 'guest', 3, '4', 1, 1, '0', '0', 'admin', '2024-04-24 17:41:38', 'admin', '2024-05-06 11:48:26', '游客，可以看到样例数据和自己创建的数据');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 5);
INSERT INTO `sys_role_menu` VALUES (3, 100);
INSERT INTO `sys_role_menu` VALUES (3, 101);
INSERT INTO `sys_role_menu` VALUES (3, 102);
INSERT INTO `sys_role_menu` VALUES (3, 103);
INSERT INTO `sys_role_menu` VALUES (3, 104);
INSERT INTO `sys_role_menu` VALUES (3, 105);
INSERT INTO `sys_role_menu` VALUES (3, 106);
INSERT INTO `sys_role_menu` VALUES (3, 107);
INSERT INTO `sys_role_menu` VALUES (3, 108);
INSERT INTO `sys_role_menu` VALUES (3, 500);
INSERT INTO `sys_role_menu` VALUES (3, 501);
INSERT INTO `sys_role_menu` VALUES (3, 1001);
INSERT INTO `sys_role_menu` VALUES (3, 1002);
INSERT INTO `sys_role_menu` VALUES (3, 1003);
INSERT INTO `sys_role_menu` VALUES (3, 1004);
INSERT INTO `sys_role_menu` VALUES (3, 1005);
INSERT INTO `sys_role_menu` VALUES (3, 1006);
INSERT INTO `sys_role_menu` VALUES (3, 1007);
INSERT INTO `sys_role_menu` VALUES (3, 1008);
INSERT INTO `sys_role_menu` VALUES (3, 1009);
INSERT INTO `sys_role_menu` VALUES (3, 1010);
INSERT INTO `sys_role_menu` VALUES (3, 1011);
INSERT INTO `sys_role_menu` VALUES (3, 1012);
INSERT INTO `sys_role_menu` VALUES (3, 1013);
INSERT INTO `sys_role_menu` VALUES (3, 1014);
INSERT INTO `sys_role_menu` VALUES (3, 1015);
INSERT INTO `sys_role_menu` VALUES (3, 1016);
INSERT INTO `sys_role_menu` VALUES (3, 1017);
INSERT INTO `sys_role_menu` VALUES (3, 1018);
INSERT INTO `sys_role_menu` VALUES (3, 1019);
INSERT INTO `sys_role_menu` VALUES (3, 1020);
INSERT INTO `sys_role_menu` VALUES (3, 1021);
INSERT INTO `sys_role_menu` VALUES (3, 1022);
INSERT INTO `sys_role_menu` VALUES (3, 1023);
INSERT INTO `sys_role_menu` VALUES (3, 1024);
INSERT INTO `sys_role_menu` VALUES (3, 1025);
INSERT INTO `sys_role_menu` VALUES (3, 1026);
INSERT INTO `sys_role_menu` VALUES (3, 1027);
INSERT INTO `sys_role_menu` VALUES (3, 1028);
INSERT INTO `sys_role_menu` VALUES (3, 1029);
INSERT INTO `sys_role_menu` VALUES (3, 1030);
INSERT INTO `sys_role_menu` VALUES (3, 1031);
INSERT INTO `sys_role_menu` VALUES (3, 1032);
INSERT INTO `sys_role_menu` VALUES (3, 1033);
INSERT INTO `sys_role_menu` VALUES (3, 1034);
INSERT INTO `sys_role_menu` VALUES (3, 1035);
INSERT INTO `sys_role_menu` VALUES (3, 1036);
INSERT INTO `sys_role_menu` VALUES (3, 1037);
INSERT INTO `sys_role_menu` VALUES (3, 1038);
INSERT INTO `sys_role_menu` VALUES (3, 1039);
INSERT INTO `sys_role_menu` VALUES (3, 1040);
INSERT INTO `sys_role_menu` VALUES (3, 1041);
INSERT INTO `sys_role_menu` VALUES (3, 1042);
INSERT INTO `sys_role_menu` VALUES (3, 1043);
INSERT INTO `sys_role_menu` VALUES (3, 1044);
INSERT INTO `sys_role_menu` VALUES (3, 1045);
INSERT INTO `sys_role_menu` VALUES (3, 1500);
INSERT INTO `sys_role_menu` VALUES (3, 1501);
INSERT INTO `sys_role_menu` VALUES (3, 1502);
INSERT INTO `sys_role_menu` VALUES (3, 1503);
INSERT INTO `sys_role_menu` VALUES (3, 1504);
INSERT INTO `sys_role_menu` VALUES (3, 1505);
INSERT INTO `sys_role_menu` VALUES (3, 1506);
INSERT INTO `sys_role_menu` VALUES (3, 1507);
INSERT INTO `sys_role_menu` VALUES (3, 1508);
INSERT INTO `sys_role_menu` VALUES (3, 1509);
INSERT INTO `sys_role_menu` VALUES (3, 1510);
INSERT INTO `sys_role_menu` VALUES (3, 1511);
INSERT INTO `sys_role_menu` VALUES (4, 5);
INSERT INTO `sys_role_menu` VALUES (4, 1500);
INSERT INTO `sys_role_menu` VALUES (4, 1501);
INSERT INTO `sys_role_menu` VALUES (4, 1502);
INSERT INTO `sys_role_menu` VALUES (4, 1503);
INSERT INTO `sys_role_menu` VALUES (4, 1504);
INSERT INTO `sys_role_menu` VALUES (4, 1505);
INSERT INTO `sys_role_menu` VALUES (4, 1506);
INSERT INTO `sys_role_menu` VALUES (4, 1507);
INSERT INTO `sys_role_menu` VALUES (4, 1508);
INSERT INTO `sys_role_menu` VALUES (4, 1509);
INSERT INTO `sys_role_menu` VALUES (4, 1510);
INSERT INTO `sys_role_menu` VALUES (4, 1511);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'sys_user' COMMENT '用户类型（sys_user系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `user_warehouse_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓库code',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '疯狂的狮子Li', 'sys_user', 'crazyLionLi@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '192.168.28.121', '2024-05-14 16:59:31', 'admin', '2024-05-06 10:47:24', 'admin', '2024-05-14 16:59:31', '管理员', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 3);
INSERT INTO `sys_user_role` VALUES (4, 4);

-- ----------------------------
-- Table structure for test_demo
-- ----------------------------
DROP TABLE IF EXISTS `test_demo`;
CREATE TABLE `test_demo`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '排序号',
  `test_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'key键',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '值',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '测试单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of test_demo
-- ----------------------------
INSERT INTO `test_demo` VALUES (1, 102, 4, 1, '测试数据权限', '测试', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (2, 102, 3, 2, '子节点1', '111', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (3, 102, 3, 3, '子节点2', '222', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (4, 108, 4, 4, '测试数据', 'demo', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (5, 108, 3, 13, '子节点11', '1111', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (6, 108, 3, 12, '子节点22', '2222', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (7, 108, 3, 11, '子节点33', '3333', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (8, 108, 3, 10, '子节点44', '4444', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (9, 108, 3, 9, '子节点55', '5555', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (10, 108, 3, 8, '子节点66', '6666', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (11, 108, 3, 7, '子节点77', '7777', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (12, 108, 3, 6, '子节点88', '8888', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (13, 108, 3, 5, '子节点99', '9999', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);

-- ----------------------------
-- Table structure for test_tree
-- ----------------------------
DROP TABLE IF EXISTS `test_tree`;
CREATE TABLE `test_tree`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父id',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `tree_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '值',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '测试树表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of test_tree
-- ----------------------------
INSERT INTO `test_tree` VALUES (1, 0, 102, 4, '测试数据权限', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (2, 1, 102, 3, '子节点1', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (3, 2, 102, 3, '子节点2', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (4, 0, 108, 4, '测试树1', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (5, 4, 108, 3, '子节点11', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (6, 4, 108, 3, '子节点22', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (7, 4, 108, 3, '子节点33', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (8, 5, 108, 3, '子节点44', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (9, 6, 108, 3, '子节点55', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (10, 7, 108, 3, '子节点66', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (11, 7, 108, 3, '子节点77', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (12, 10, 108, 3, '子节点88', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (13, 10, 108, 3, '子节点99', 0, '2024-05-06 10:48:05', 'admin', NULL, NULL, 0);

-- ----------------------------
-- Table structure for xxl_job_group
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_group`;
CREATE TABLE `xxl_job_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行器AppName',
  `title` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行器名称',
  `address_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '执行器地址列表，多地址逗号分隔',
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_group
-- ----------------------------
INSERT INTO `xxl_job_group` VALUES (1, 'xxl-job-executor', '示例执行器', 0, NULL, '2018-11-03 22:21:31');

-- ----------------------------
-- Table structure for xxl_job_info
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_info`;
CREATE TABLE `xxl_job_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `add_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `author` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报警邮件',
  `schedule_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NONE' COMMENT '调度类型',
  `schedule_conf` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调度配置，值含义取决于调度类型',
  `misfire_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DO_NOTHING' COMMENT '调度过期策略',
  `executor_route_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int(11) NOT NULL DEFAULT 0 COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int(11) NOT NULL DEFAULT 0 COMMENT '失败重试次数',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime NULL DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint(13) NOT NULL DEFAULT 0 COMMENT '上次调度时间',
  `trigger_next_time` bigint(13) NOT NULL DEFAULT 0 COMMENT '下次调度时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_info
-- ----------------------------
INSERT INTO `xxl_job_info` VALUES (1, 1, '测试任务1', '2018-11-03 22:21:31', '2018-11-03 22:21:31', 'XXL', '', 'CRON', '0 0 0 * * ? *', 'DO_NOTHING', 'FIRST', 'demoJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2018-11-03 22:21:31', '', 0, 0, 0);

-- ----------------------------
-- Table structure for xxl_job_lock
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_lock`;
CREATE TABLE `xxl_job_lock`  (
  `lock_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '锁名称',
  PRIMARY KEY (`lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_lock
-- ----------------------------
INSERT INTO `xxl_job_lock` VALUES ('schedule_lock');

-- ----------------------------
-- Table structure for xxl_job_log
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log`;
CREATE TABLE `xxl_job_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
  `executor_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int(11) NOT NULL DEFAULT 0 COMMENT '失败重试次数',
  `trigger_time` datetime NULL DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int(11) NOT NULL COMMENT '调度-结果',
  `trigger_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '调度-日志',
  `handle_time` datetime NULL DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int(11) NOT NULL COMMENT '执行-状态',
  `handle_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '执行-日志',
  `alarm_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `I_trigger_time`(`trigger_time`) USING BTREE,
  INDEX `I_handle_code`(`handle_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_log_report
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log_report`;
CREATE TABLE `xxl_job_log_report`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trigger_day` datetime NULL DEFAULT NULL COMMENT '调度-时间',
  `running_count` int(11) NOT NULL DEFAULT 0 COMMENT '运行中-日志数量',
  `suc_count` int(11) NOT NULL DEFAULT 0 COMMENT '执行成功-日志数量',
  `fail_count` int(11) NOT NULL DEFAULT 0 COMMENT '执行失败-日志数量',
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `i_trigger_day`(`trigger_day`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_log_report
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_logglue
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_logglue`;
CREATE TABLE `xxl_job_logglue`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'GLUE备注',
  `add_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_logglue
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_registry
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_registry`;
CREATE TABLE `xxl_job_registry`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `registry_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `registry_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_g_k_v`(`registry_group`, `registry_key`, `registry_value`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_registry
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_user
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_user`;
CREATE TABLE `xxl_job_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `role` tinyint(4) NOT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `i_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_user
-- ----------------------------
INSERT INTO `xxl_job_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;