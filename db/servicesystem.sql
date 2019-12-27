/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80018
Source Host           : localhost:3306
Source Database       : servicesystem

Target Server Type    : MYSQL
Target Server Version : 80018
File Encoding         : 65001

Date: 2019-12-27 14:52:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'DESKTOP-RN5ST311577349784213', '1577356449940', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'testTask', 'renren', '0', null, '8', '2019-11-20 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('2', '1', 'testTask', 'renren', '0', null, '5', '2019-11-20 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('3', '1', 'testTask', 'renren', '0', null, '8', '2019-11-20 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('4', '1', 'testTask', 'renren', '0', null, '8', '2019-11-20 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('5', '1', 'testTask', 'renren', '0', null, '9', '2019-11-20 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('6', '1', 'testTask', 'renren', '0', null, '8', '2019-11-20 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('7', '1', 'testTask', 'renren', '0', null, '9', '2019-11-20 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('8', '1', 'testTask', 'renren', '0', null, '9', '2019-11-20 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('9', '1', 'testTask', 'renren', '0', null, '10', '2019-11-20 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('10', '1', 'testTask', 'renren', '0', null, '8', '2019-11-20 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('11', '1', 'testTask', 'renren', '0', null, '8', '2019-11-20 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('12', '1', 'testTask', 'renren', '0', null, '8', '2019-11-21 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('13', '1', 'testTask', 'renren', '0', null, '4', '2019-11-21 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('14', '1', 'testTask', 'renren', '0', null, '5', '2019-11-21 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('15', '1', 'testTask', 'renren', '0', null, '5', '2019-11-21 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('16', '1', 'testTask', 'renren', '0', null, '5', '2019-11-21 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('17', '1', 'testTask', 'renren', '0', null, '5', '2019-11-21 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('18', '1', 'testTask', 'renren', '0', null, '5', '2019-11-21 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('19', '1', 'testTask', 'renren', '0', null, '5', '2019-11-21 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('20', '1', 'testTask', 'renren', '0', null, '4', '2019-11-21 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('21', '1', 'testTask', 'renren', '0', null, '4', '2019-11-21 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('22', '1', 'testTask', 'renren', '0', null, '5', '2019-11-21 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('23', '1', 'testTask', 'renren', '0', null, '4', '2019-11-21 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('24', '1', 'testTask', 'renren', '0', null, '5', '2019-11-21 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('25', '1', 'testTask', 'renren', '0', null, '5', '2019-11-21 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('26', '1', 'testTask', 'renren', '0', null, '4', '2019-11-21 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('27', '1', 'testTask', 'renren', '0', null, '4', '2019-11-21 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('28', '1', 'testTask', 'renren', '0', null, '6', '2019-11-21 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('29', '1', 'testTask', 'renren', '0', null, '5', '2019-11-21 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('30', '1', 'testTask', 'renren', '0', null, '5', '2019-11-21 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('31', '1', 'testTask', 'renren', '0', null, '4', '2019-11-21 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('32', '1', 'testTask', 'renren', '0', null, '5', '2019-11-21 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('33', '1', 'testTask', 'renren', '0', null, '6', '2019-11-21 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('34', '1', 'testTask', 'renren', '0', null, '5', '2019-11-21 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('35', '1', 'testTask', 'renren', '0', null, '3', '2019-11-21 11:30:09');
INSERT INTO `schedule_job_log` VALUES ('36', '1', 'testTask', 'renren', '0', null, '5', '2019-11-21 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('37', '1', 'testTask', 'renren', '0', null, '9', '2019-11-21 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('38', '1', 'testTask', 'renren', '0', null, '9', '2019-11-21 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('39', '1', 'testTask', 'renren', '0', null, '9', '2019-11-21 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('40', '1', 'testTask', 'renren', '0', null, '5', '2019-11-21 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('41', '1', 'testTask', 'renren', '0', null, '6', '2019-11-21 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('42', '1', 'testTask', 'renren', '0', null, '5', '2019-11-21 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('43', '1', 'testTask', 'renren', '0', null, '6', '2019-11-21 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('44', '1', 'testTask', 'renren', '0', null, '6', '2019-11-21 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('45', '1', 'testTask', 'renren', '0', null, '6', '2019-11-21 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('46', '1', 'testTask', 'renren', '0', null, '5', '2019-11-21 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('47', '1', 'testTask', 'renren', '0', null, '13', '2019-11-21 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('48', '1', 'testTask', 'renren', '0', null, '6', '2019-11-21 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('49', '1', 'testTask', 'renren', '0', null, '1', '2019-11-25 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('50', '1', 'testTask', 'renren', '0', null, '1', '2019-11-25 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('51', '1', 'testTask', 'renren', '0', null, '1', '2019-11-25 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('52', '1', 'testTask', 'renren', '0', null, '0', '2019-11-25 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('53', '1', 'testTask', 'renren', '0', null, '0', '2019-11-25 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('54', '1', 'testTask', 'renren', '0', null, '1', '2019-11-25 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('55', '1', 'testTask', 'renren', '0', null, '1', '2019-11-25 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('56', '1', 'testTask', 'renren', '0', null, '1', '2019-11-25 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('57', '1', 'testTask', 'renren', '0', null, '0', '2019-11-25 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('58', '1', 'testTask', 'renren', '0', null, '0', '2019-11-25 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('59', '1', 'testTask', 'renren', '0', null, '1', '2019-11-25 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('60', '1', 'testTask', 'renren', '0', null, '1', '2019-11-25 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('61', '1', 'testTask', 'renren', '0', null, '1', '2019-11-25 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('62', '1', 'testTask', 'renren', '0', null, '144', '2019-11-26 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('63', '1', 'testTask', 'renren', '0', null, '23', '2019-11-26 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('64', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('65', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('66', '1', 'testTask', 'renren', '0', null, '2', '2019-11-26 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('67', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('68', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('69', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('70', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('71', '1', 'testTask', 'renren', '0', null, '2', '2019-11-26 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('72', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('73', '1', 'testTask', 'renren', '0', null, '2', '2019-11-26 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('74', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('75', '1', 'testTask', 'renren', '0', null, '2', '2019-11-26 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('76', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('77', '1', 'testTask', 'renren', '0', null, '0', '2019-11-26 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('78', '1', 'testTask', 'renren', '0', null, '2', '2019-11-26 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('79', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('80', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('81', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('82', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('83', '1', 'testTask', 'renren', '0', null, '0', '2019-11-26 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('84', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('85', '1', 'testTask', 'renren', '0', null, '1', '2019-11-26 11:30:00');

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统验证码';

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('04e0ff6d-6e8a-4825-8a15-b5115dac5f71', 'm6eg4', '2019-11-28 14:35:12');
INSERT INTO `sys_captcha` VALUES ('1447f2fe-5e0f-4edb-805f-4040d05d5bf1', 'c3nxg', '2019-12-04 13:39:28');
INSERT INTO `sys_captcha` VALUES ('17954134-3001-4b49-862a-7872510881e3', 'ane6d', '2019-12-25 09:25:55');
INSERT INTO `sys_captcha` VALUES ('1d9b7e9b-7df0-4d5d-8701-e4f417b0b458', 'dpmx6', '2019-11-26 11:14:50');
INSERT INTO `sys_captcha` VALUES ('37af3c6b-9225-4ac3-8fde-abb74498a254', 'wc43a', '2019-11-21 16:22:02');
INSERT INTO `sys_captcha` VALUES ('3d9fa6f0-0535-4d7a-85b9-a6c516c7432b', 'wy7c7', '2019-11-21 16:40:47');
INSERT INTO `sys_captcha` VALUES ('413ef66b-f80a-4321-8297-1f0e46c3c5b6', 'bbm4c', '2019-12-11 22:56:01');
INSERT INTO `sys_captcha` VALUES ('6127f937-5c35-43c7-8bc4-ca7615fbad66', '66c83', '2019-11-27 15:07:29');
INSERT INTO `sys_captcha` VALUES ('6e4ed5f0-142e-4fce-8e6d-04c657b3857c', '28ngc', '2019-12-03 15:00:46');
INSERT INTO `sys_captcha` VALUES ('9f585b5d-477c-4bdc-899f-692afedc7cfe', 'w866p', '2019-11-28 09:22:31');
INSERT INTO `sys_captcha` VALUES ('b17ed718-7d56-4946-86fd-9a3428a10731', 'agbg6', '2019-12-02 09:43:53');
INSERT INTO `sys_captcha` VALUES ('b3f2b528-4a6c-4322-80ea-e330442b3588', '5g37w', '2019-11-25 17:39:27');
INSERT INTO `sys_captcha` VALUES ('cd9c03f5-5151-4ecb-8fee-21d5692b9ff9', 'fd8xn', '2019-11-26 11:13:08');
INSERT INTO `sys_captcha` VALUES ('dd168f02-d7d0-4422-849a-0606c940bd79', 'f4mne', '2019-11-21 16:21:33');
INSERT INTO `sys_captcha` VALUES ('ea250e8f-ef87-4ac0-8b83-683110f49324', 'n7pnn', '2019-12-13 21:57:15');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[5]', '0', '0:0:0:0:0:0:0:1', '2019-11-20 18:07:22');
INSERT INTO `sys_log` VALUES ('2', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[5]', '0', '0:0:0:0:0:0:0:1', '2019-11-20 18:07:27');
INSERT INTO `sys_log` VALUES ('3', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":5,\"parentId\":1,\"name\":\"SQL监控\",\"url\":\"http://localhost:8080/renren-fast/druid/sql.html\",\"type\":0,\"icon\":\"sql\",\"orderNum\":4}]', '27', '0:0:0:0:0:0:0:1', '2019-11-20 18:07:35');
INSERT INTO `sys_log` VALUES ('4', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[5]', '0', '0:0:0:0:0:0:0:1', '2019-11-20 18:07:41');
INSERT INTO `sys_log` VALUES ('5', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":5,\"parentId\":1,\"name\":\"SQL监控\",\"url\":\"http://localhost:8080/renren-fast/druid/sql.html\",\"type\":1,\"icon\":\"sql\",\"orderNum\":4}]', '25', '0:0:0:0:0:0:0:1', '2019-11-20 18:07:46');
INSERT INTO `sys_log` VALUES ('6', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":2,\"parentId\":1,\"name\":\"会员管理\",\"url\":\"sys/user\",\"type\":1,\"icon\":\"admin\",\"orderNum\":1}]', '22', '0:0:0:0:0:0:0:1', '2019-11-20 18:09:43');
INSERT INTO `sys_log` VALUES ('7', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"录入管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"config\",\"orderNum\":0}]', '35', '0:0:0:0:0:0:0:1', '2019-11-20 18:10:17');
INSERT INTO `sys_log` VALUES ('8', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"系统管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":1}]', '19', '0:0:0:0:0:0:0:1', '2019-11-20 18:10:31');
INSERT INTO `sys_log` VALUES ('9', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"录入管理\",\"url\":\"/entering\",\"perms\":\"\",\"type\":1,\"icon\":\"config\",\"orderNum\":0}]', '14', '0:0:0:0:0:0:0:1', '2019-11-20 18:11:22');
INSERT INTO `sys_log` VALUES ('10', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":32,\"parentId\":0,\"name\":\"维修管理\",\"url\":\"/miantain\",\"perms\":\"\",\"type\":1,\"icon\":\"config\",\"orderNum\":1}]', '15', '0:0:0:0:0:0:0:1', '2019-11-20 18:12:19');
INSERT INTO `sys_log` VALUES ('11', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"系统管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":2}]', '18', '0:0:0:0:0:0:0:1', '2019-11-20 18:12:26');
INSERT INTO `sys_log` VALUES ('12', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"录入管理\",\"url\":\"/entering\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0}]', '11', '0:0:0:0:0:0:0:1', '2019-11-20 18:12:32');
INSERT INTO `sys_log` VALUES ('13', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"录入员\",\"remark\":\"录入员\",\"createUserId\":1,\"menuIdList\":[31,-666666],\"createTime\":\"Nov 20, 2019 6:18:27 PM\"}]', '96', '0:0:0:0:0:0:0:1', '2019-11-20 18:18:27');
INSERT INTO `sys_log` VALUES ('14', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":2,\"roleName\":\"修理员\",\"remark\":\"修理员\",\"createUserId\":1,\"menuIdList\":[32,-666666],\"createTime\":\"Nov 20, 2019 6:18:44 PM\"}]', '44', '0:0:0:0:0:0:0:1', '2019-11-20 18:18:45');
INSERT INTO `sys_log` VALUES ('15', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":3,\"roleName\":\"班长\",\"remark\":\"班长\",\"createUserId\":1,\"menuIdList\":[31,32,-666666],\"createTime\":\"Nov 20, 2019 6:18:58 PM\"}]', '35', '0:0:0:0:0:0:0:1', '2019-11-20 18:18:58');
INSERT INTO `sys_log` VALUES ('16', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":4,\"roleName\":\"经理\",\"remark\":\"经理\",\"createUserId\":1,\"menuIdList\":[2,15,16,17,18,31,32,-666666,1],\"createTime\":\"Nov 20, 2019 6:19:25 PM\"}]', '71', '0:0:0:0:0:0:0:1', '2019-11-20 18:19:25');
INSERT INTO `sys_log` VALUES ('17', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":5,\"roleName\":\"主任\",\"remark\":\"主任\",\"createUserId\":1,\"menuIdList\":[2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,31,32,-666666,1],\"createTime\":\"Nov 20, 2019 6:19:45 PM\"}]', '68', '0:0:0:0:0:0:0:1', '2019-11-20 18:19:46');
INSERT INTO `sys_log` VALUES ('18', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":2,\"username\":\"test\",\"password\":\"813a3cac748abdc79340e07ac94fbe2085a17ddd43dd87a8d9ef581b99adbc40\",\"salt\":\"guOCrLXBid7er68hcBMo\",\"email\":\"test@qq.com\",\"mobile\":\"13000010001\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Nov 21, 2019 2:45:17 PM\"}]', '247', '0:0:0:0:0:0:0:1', '2019-11-21 14:45:18');
INSERT INTO `sys_log` VALUES ('19', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"test\",\"salt\":\"guOCrLXBid7er68hcBMo\",\"email\":\"test@qq.com\",\"mobile\":\"13000010001\",\"status\":1,\"roleIdList\":[1,2],\"createUserId\":1}]', '64', '0:0:0:0:0:0:0:1', '2019-11-21 14:45:28');
INSERT INTO `sys_log` VALUES ('20', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":3,\"username\":\"hcl\",\"password\":\"5cffd870b13cba8930d9a995678448d6141cb8af466e8baa519cdaee0d841478\",\"salt\":\"rcvqOqWNwwZRMzQqSzYS\",\"email\":\"a1234567@qq.com\",\"mobile\":\"13111111111\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Nov 21, 2019 4:44:03 PM\"}]', '136', '0:0:0:0:0:0:0:1', '2019-11-21 16:44:03');
INSERT INTO `sys_log` VALUES ('21', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"录入员\",\"remark\":\"录入员\",\"createUserId\":1,\"menuIdList\":[15,31,-666666,1,2]}]', '143', '0:0:0:0:0:0:0:1', '2019-11-26 11:27:22');
INSERT INTO `sys_log` VALUES ('22', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"hcl\",\"salt\":\"rcvqOqWNwwZRMzQqSzYS\",\"mobile\":\"13111111111\",\"status\":1,\"createUserId\":1}]', '21', '0:0:0:0:0:0:0:1', '2019-11-26 11:41:48');
INSERT INTO `sys_log` VALUES ('23', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"录入员\",\"remark\":\"录入员\",\"createUserId\":1,\"menuIdList\":[15,31,-666666,1,2]}]', '105', '0:0:0:0:0:0:0:1', '2019-11-26 11:42:40');
INSERT INTO `sys_log` VALUES ('24', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"hcl\",\"password\":\"51b70da1824c3ed37ceb0eb243c1530dcc5233cf7ce70eaaa92656966357b424\",\"salt\":\"rcvqOqWNwwZRMzQqSzYS\",\"mobile\":\"13111111111\",\"status\":1,\"createUserId\":1}]', '26061', '0:0:0:0:0:0:0:1', '2019-11-26 11:44:02');
INSERT INTO `sys_log` VALUES ('25', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"hcl\",\"password\":\"51b70da1824c3ed37ceb0eb243c1530dcc5233cf7ce70eaaa92656966357b424\",\"salt\":\"rcvqOqWNwwZRMzQqSzYS\",\"mobile\":\"13111111111\",\"status\":1,\"createUserId\":1}]', '58730', '0:0:0:0:0:0:0:1', '2019-11-26 11:45:16');
INSERT INTO `sys_log` VALUES ('26', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"hcl\",\"password\":\"51b70da1824c3ed37ceb0eb243c1530dcc5233cf7ce70eaaa92656966357b424\",\"salt\":\"rcvqOqWNwwZRMzQqSzYS\",\"mobile\":\"13111111111\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', '24', '0:0:0:0:0:0:0:1', '2019-11-26 11:46:50');
INSERT INTO `sys_log` VALUES ('27', 'admin', '删除定时任务', 'io.renren.modules.job.controller.ScheduleJobController.delete()', '[[1]]', '49', '0:0:0:0:0:0:0:1', '2019-11-26 11:48:10');
INSERT INTO `sys_log` VALUES ('28', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":6,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,31,32,-666666,1],\"createTime\":\"Nov 26, 2019 11:49:44 AM\"}]', '61', '0:0:0:0:0:0:0:1', '2019-11-26 11:49:44');
INSERT INTO `sys_log` VALUES ('29', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[6],\"createUserId\":1}]', '22', '0:0:0:0:0:0:0:1', '2019-11-26 11:50:16');
INSERT INTO `sys_log` VALUES ('30', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"hcl\",\"password\":\"51b70da1824c3ed37ceb0eb243c1530dcc5233cf7ce70eaaa92656966357b424\",\"salt\":\"rcvqOqWNwwZRMzQqSzYS\",\"mobile\":\"13111111111\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', '35', '0:0:0:0:0:0:0:1', '2019-11-26 12:24:37');
INSERT INTO `sys_log` VALUES ('31', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"hcl\",\"password\":\"51b70da1824c3ed37ceb0eb243c1530dcc5233cf7ce70eaaa92656966357b424\",\"salt\":\"rcvqOqWNwwZRMzQqSzYS\",\"mobile\":\"13111111111\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', '56', '0:0:0:0:0:0:0:1', '2019-11-26 13:30:38');
INSERT INTO `sys_log` VALUES ('32', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"hcl\",\"password\":\"51b70da1824c3ed37ceb0eb243c1530dcc5233cf7ce70eaaa92656966357b424\",\"salt\":\"rcvqOqWNwwZRMzQqSzYS\",\"idcard\":\"23230119910212031X\",\"mobile\":\"13111111111\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"sex\":0}]', '31', '0:0:0:0:0:0:0:1', '2019-11-26 13:31:57');
INSERT INTO `sys_log` VALUES ('33', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"hcl\",\"salt\":\"rcvqOqWNwwZRMzQqSzYS\",\"idcard\":\"23230119910212031X\",\"mobile\":\"13111111111\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"sex\":0}]', '1938', '0:0:0:0:0:0:0:1', '2019-11-26 13:42:38');
INSERT INTO `sys_log` VALUES ('34', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"test\",\"salt\":\"guOCrLXBid7er68hcBMo\",\"idcard\":\"232301199102120315\",\"mobile\":\"13000010001\",\"status\":1,\"roleIdList\":[4],\"createUserId\":1,\"sex\":1}]', '1513', '0:0:0:0:0:0:0:1', '2019-11-26 14:47:57');
INSERT INTO `sys_log` VALUES ('35', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"hcl\",\"salt\":\"rcvqOqWNwwZRMzQqSzYS\",\"idcard\":\"23230119910212031X\",\"mobile\":\"13111111111\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"sex\":0}]', '15473', '0:0:0:0:0:0:0:1', '2019-11-26 14:49:33');
INSERT INTO `sys_log` VALUES ('36', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"hcl\",\"salt\":\"rcvqOqWNwwZRMzQqSzYS\",\"idcard\":\"23230119910212031X\",\"mobile\":\"13111111111\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"sex\":0}]', '114545', '0:0:0:0:0:0:0:1', '2019-11-26 14:51:34');
INSERT INTO `sys_log` VALUES ('37', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"hcl\",\"salt\":\"rcvqOqWNwwZRMzQqSzYS\",\"idcard\":\"23230119910212031X\",\"mobile\":\"13111111111\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"title\":\"2\",\"sex\":0}]', '27', '0:0:0:0:0:0:0:1', '2019-11-26 14:51:41');
INSERT INTO `sys_log` VALUES ('38', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":6,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,7,8,9,10,11,12,13,14,31,32,-666666]}]', '185', '0:0:0:0:0:0:0:1', '2019-11-28 09:23:36');
INSERT INTO `sys_log` VALUES ('39', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[7]', '0', '0:0:0:0:0:0:0:1', '2019-11-28 10:44:07');
INSERT INTO `sys_log` VALUES ('40', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":33,\"parentId\":1,\"name\":\"test\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}]', '28', '0:0:0:0:0:0:0:1', '2019-11-28 10:45:52');
INSERT INTO `sys_log` VALUES ('41', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":34,\"parentId\":33,\"name\":\"test\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}]', '29', '0:0:0:0:0:0:0:1', '2019-11-28 10:46:08');
INSERT INTO `sys_log` VALUES ('42', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[33]', '2', '0:0:0:0:0:0:0:1', '2019-11-28 10:46:26');
INSERT INTO `sys_log` VALUES ('43', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[34]', '48', '0:0:0:0:0:0:0:1', '2019-11-28 10:46:30');
INSERT INTO `sys_log` VALUES ('44', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[33]', '17', '0:0:0:0:0:0:0:1', '2019-11-28 10:46:39');
INSERT INTO `sys_log` VALUES ('45', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"hcl\",\"salt\":\"rcvqOqWNwwZRMzQqSzYS\",\"idcard\":\"23230119910212031X\",\"mobile\":\"13111111111\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"title\":\"2\",\"sex\":0}]', '1942', '0:0:0:0:0:0:0:1', '2019-11-29 16:04:16');
INSERT INTO `sys_log` VALUES ('46', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"hcl\",\"salt\":\"rcvqOqWNwwZRMzQqSzYS\",\"idcard\":\"23230119910212031X\",\"mobile\":\"13111111111\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"sex\":0}]', '1713', '0:0:0:0:0:0:0:1', '2019-11-29 16:05:42');
INSERT INTO `sys_log` VALUES ('47', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"hcl\",\"salt\":\"rcvqOqWNwwZRMzQqSzYS\",\"idcard\":\"23230119910212031X\",\"mobile\":\"13111111111\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"sex\":0}]', '13026', '0:0:0:0:0:0:0:1', '2019-11-29 16:06:04');
INSERT INTO `sys_log` VALUES ('48', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"hcl\",\"salt\":\"rcvqOqWNwwZRMzQqSzYS\",\"idcard\":\"23230119910212031X\",\"mobile\":\"13111111111\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"title\":\"1\",\"sex\":0}]', '1474', '0:0:0:0:0:0:0:1', '2019-11-29 16:07:13');
INSERT INTO `sys_log` VALUES ('49', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"test\",\"salt\":\"guOCrLXBid7er68hcBMo\",\"idcard\":\"232301199102120315\",\"mobile\":\"13000010001\",\"status\":1,\"roleIdList\":[4],\"createUserId\":1,\"title\":\"1\",\"sex\":0}]', '1958', '0:0:0:0:0:0:0:1', '2019-11-29 16:09:51');
INSERT INTO `sys_log` VALUES ('50', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"test\",\"salt\":\"guOCrLXBid7er68hcBMo\",\"idcard\":\"232301199102120315\",\"mobile\":\"13000010001\",\"status\":1,\"roleIdList\":[6],\"createUserId\":1,\"title\":\"1\",\"sex\":0}]', '1399', '0:0:0:0:0:0:0:1', '2019-11-29 16:10:01');
INSERT INTO `sys_log` VALUES ('51', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":35,\"parentId\":1,\"name\":\"组织结构管理\",\"url\":\"sys/org\",\"perms\":\"\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":3}]', '19', '0:0:0:0:0:0:0:1', '2019-12-02 09:42:05');
INSERT INTO `sys_log` VALUES ('52', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":35,\"parentId\":1,\"name\":\"组织结构管理\",\"url\":\"sys/org\",\"perms\":\"\",\"type\":0,\"icon\":\"zhedie\",\"orderNum\":3}]', '24', '0:0:0:0:0:0:0:1', '2019-12-02 09:49:49');
INSERT INTO `sys_log` VALUES ('53', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":35,\"parentId\":1,\"name\":\"组织结构管理\",\"url\":\"sys/org\",\"perms\":\"sys:org:save,sys:org:update,sys:org:delete\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":3}]', '21', '0:0:0:0:0:0:0:1', '2019-12-02 09:51:04');
INSERT INTO `sys_log` VALUES ('54', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":35,\"parentId\":1,\"name\":\"组织结构管理\",\"url\":\"sys/org\",\"perms\":\"\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":3}]', '33', '0:0:0:0:0:0:0:1', '2019-12-02 09:51:26');
INSERT INTO `sys_log` VALUES ('55', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":36,\"parentId\":35,\"name\":\"查看\",\"url\":\"sys/org\",\"perms\":\"sys:org:list,sys:org:info\",\"type\":2,\"orderNum\":0}]', '18', '0:0:0:0:0:0:0:1', '2019-12-02 09:52:07');
INSERT INTO `sys_log` VALUES ('56', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":37,\"parentId\":35,\"name\":\"新增\",\"url\":\"sys/org\",\"perms\":\"sys:org:save\",\"type\":2,\"orderNum\":0}]', '52', '0:0:0:0:0:0:0:1', '2019-12-02 09:52:29');
INSERT INTO `sys_log` VALUES ('57', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":38,\"parentId\":35,\"name\":\"修改\",\"url\":\"sys/org\",\"perms\":\"sys:org:update\",\"type\":2,\"orderNum\":0}]', '19', '0:0:0:0:0:0:0:1', '2019-12-02 09:52:48');
INSERT INTO `sys_log` VALUES ('58', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":39,\"parentId\":35,\"name\":\"删除\",\"url\":\"sys/org\",\"perms\":\"sys:org:delete\",\"type\":2,\"orderNum\":0}]', '14', '0:0:0:0:0:0:0:1', '2019-12-02 09:53:09');
INSERT INTO `sys_log` VALUES ('59', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":37,\"parentId\":35,\"name\":\"新增\",\"url\":\"sys/org\",\"perms\":\"sys:org:save\",\"type\":2,\"orderNum\":0}]', '2', '0:0:0:0:0:0:0:1', '2019-12-02 09:53:48');
INSERT INTO `sys_log` VALUES ('60', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":37,\"parentId\":35,\"name\":\"新增\",\"url\":\"sys/org\",\"perms\":\"sys:org:save,sys:org:select\",\"type\":2,\"orderNum\":0}]', '24', '0:0:0:0:0:0:0:1', '2019-12-02 15:37:04');
INSERT INTO `sys_log` VALUES ('61', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":38,\"parentId\":35,\"name\":\"修改\",\"url\":\"sys/org\",\"perms\":\"sys:org:update,sys:org:select\",\"type\":2,\"orderNum\":0}]', '59', '0:0:0:0:0:0:0:1', '2019-12-02 15:37:22');
INSERT INTO `sys_log` VALUES ('62', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":39,\"parentId\":35,\"name\":\"删除\",\"url\":\"sys/org\",\"perms\":\"sys:org:delete\",\"type\":2,\"orderNum\":0}]', '3', '0:0:0:0:0:0:0:1', '2019-12-02 15:37:41');
INSERT INTO `sys_log` VALUES ('63', 'admin', '保存组织机构', 'io.renren.modules.sys.controller.SysOrgController.save()', '[{\"id\":6,\"parentid\":0,\"name\":\"经理3\",\"orderby\":0}]', '25', '0:0:0:0:0:0:0:1', '2019-12-02 16:26:08');
INSERT INTO `sys_log` VALUES ('64', 'admin', '保存组织机构', 'io.renren.modules.sys.controller.SysOrgController.save()', '[{\"id\":7,\"parentid\":4,\"name\":\"木工组\",\"orderby\":0}]', '11', '0:0:0:0:0:0:0:1', '2019-12-02 16:27:08');
INSERT INTO `sys_log` VALUES ('65', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[7]', '0', '0:0:0:0:0:0:0:1', '2019-12-02 16:27:20');
INSERT INTO `sys_log` VALUES ('66', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[7]', '0', '0:0:0:0:0:0:0:1', '2019-12-02 16:27:39');
INSERT INTO `sys_log` VALUES ('67', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[7]', '0', '0:0:0:0:0:0:0:1', '2019-12-02 16:27:44');
INSERT INTO `sys_log` VALUES ('68', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysOrgController.delete()', '[7]', '6594', '0:0:0:0:0:0:0:1', '2019-12-02 16:29:34');
INSERT INTO `sys_log` VALUES ('69', 'admin', '保存组织机构', 'io.renren.modules.sys.controller.SysOrgController.save()', '[{\"id\":8,\"parentid\":4,\"name\":\"木工组\",\"orderby\":0}]', '28', '0:0:0:0:0:0:0:1', '2019-12-02 16:29:48');
INSERT INTO `sys_log` VALUES ('70', 'admin', '保存组织机构', 'io.renren.modules.sys.controller.SysOrgController.save()', '[{\"id\":9,\"parentid\":4,\"name\":\"瓦工组\",\"orderby\":0}]', '28608', '0:0:0:0:0:0:0:1', '2019-12-02 16:30:45');
INSERT INTO `sys_log` VALUES ('71', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysOrgController.delete()', '[9]', '2198', '0:0:0:0:0:0:0:1', '2019-12-02 16:31:09');
INSERT INTO `sys_log` VALUES ('72', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysOrgController.delete()', '[4]', '1', '0:0:0:0:0:0:0:1', '2019-12-02 16:31:15');
INSERT INTO `sys_log` VALUES ('73', 'admin', '保存组织机构', 'io.renren.modules.sys.controller.SysOrgController.save()', '[{\"id\":10,\"parentid\":4,\"name\":\"瓦工组\",\"orderby\":1}]', '1375', '0:0:0:0:0:0:0:1', '2019-12-02 16:31:31');
INSERT INTO `sys_log` VALUES ('74', 'admin', '修改组织机构', 'io.renren.modules.sys.controller.SysOrgController.update()', '[{\"id\":8,\"parentid\":4,\"name\":\"木工组\",\"orderby\":2}]', '28', '0:0:0:0:0:0:0:1', '2019-12-02 16:31:42');
INSERT INTO `sys_log` VALUES ('75', 'admin', '修改组织机构', 'io.renren.modules.sys.controller.SysOrgController.update()', '[{\"id\":6,\"parentid\":0,\"name\":\"经理3\",\"orderby\":3}]', '12', '0:0:0:0:0:0:0:1', '2019-12-02 16:32:11');
INSERT INTO `sys_log` VALUES ('76', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"hcl\",\"salt\":\"rcvqOqWNwwZRMzQqSzYS\",\"idcard\":\"23230119910212031X\",\"mobile\":\"13111111111\",\"status\":1,\"roleIdList\":[6],\"createUserId\":1,\"title\":\"3\",\"sex\":0}]', '1947', '0:0:0:0:0:0:0:1', '2019-12-02 16:33:32');
INSERT INTO `sys_log` VALUES ('77', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"hcl\",\"password\":\"f6e194e47ea5b60c7e0ae175ac625e5071e6166120ae66fc0fc0b8a9a81f39c1\",\"salt\":\"rcvqOqWNwwZRMzQqSzYS\",\"idcard\":\"23230119910212031X\",\"mobile\":\"13111111111\",\"status\":1,\"roleIdList\":[6],\"createUserId\":1,\"title\":\"3\",\"sex\":0}]', '2409', '0:0:0:0:0:0:0:1', '2019-12-02 16:34:19');
INSERT INTO `sys_log` VALUES ('78', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":6,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,35,36,37,38,39,31,32,-666666]}]', '2143', '0:0:0:0:0:0:0:1', '2019-12-02 16:38:25');
INSERT INTO `sys_log` VALUES ('79', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"orgid\":2,\"username\":\"hcl\",\"salt\":\"rcvqOqWNwwZRMzQqSzYS\",\"idcard\":\"23230119910212031X\",\"mobile\":\"13111111111\",\"status\":1,\"roleIdList\":[6],\"createUserId\":1,\"title\":\"3\",\"sex\":0}]', '59', '0:0:0:0:0:0:0:1', '2019-12-02 18:01:22');
INSERT INTO `sys_log` VALUES ('80', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"orgid\":0,\"username\":\"hcl\",\"salt\":\"rcvqOqWNwwZRMzQqSzYS\",\"idcard\":\"23230119910212031X\",\"mobile\":\"13111111111\",\"status\":1,\"roleIdList\":[6],\"createUserId\":1,\"title\":\"3\",\"sex\":0}]', '41', '0:0:0:0:0:0:0:1', '2019-12-03 13:45:38');
INSERT INTO `sys_log` VALUES ('81', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"orgid\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"idcard\":\"232301199102120314\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[6],\"createUserId\":1,\"title\":\"2\",\"sex\":1}]', '33', '0:0:0:0:0:0:0:1', '2019-12-03 13:53:05');
INSERT INTO `sys_log` VALUES ('82', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"orgid\":1,\"username\":\"hcl\",\"salt\":\"rcvqOqWNwwZRMzQqSzYS\",\"idcard\":\"23230119910212031X\",\"mobile\":\"13111111111\",\"status\":1,\"roleIdList\":[6],\"createUserId\":1,\"title\":\"3\",\"sex\":0}]', '52', '0:0:0:0:0:0:0:1', '2019-12-03 14:04:22');
INSERT INTO `sys_log` VALUES ('83', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"orgid\":0,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"idcard\":\"232301199102120314\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[6],\"createUserId\":1,\"title\":\"2\",\"sex\":1}]', '15', '0:0:0:0:0:0:0:1', '2019-12-03 14:04:32');
INSERT INTO `sys_log` VALUES ('84', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"orgid\":1,\"orgname\":\"\",\"username\":\"hcl\",\"salt\":\"rcvqOqWNwwZRMzQqSzYS\",\"idcard\":\"23230119910212031X\",\"mobile\":\"13111111111\",\"status\":1,\"roleIdList\":[6],\"createUserId\":1,\"title\":\"3\",\"sex\":0,\"isadmin\":1}]', '44', '0:0:0:0:0:0:0:1', '2019-12-03 15:12:08');
INSERT INTO `sys_log` VALUES ('85', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"orgname\":\"\",\"username\":\"test\",\"salt\":\"guOCrLXBid7er68hcBMo\",\"idcard\":\"232301199102120315\",\"mobile\":\"13000010001\",\"status\":1,\"roleIdList\":[6],\"createUserId\":1,\"title\":\"1\",\"sex\":0,\"isadmin\":0}]', '25', '0:0:0:0:0:0:0:1', '2019-12-03 15:12:12');
INSERT INTO `sys_log` VALUES ('86', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"orgid\":0,\"orgname\":\"\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"idcard\":\"232301199102120314\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[6],\"createUserId\":1,\"title\":\"2\",\"sex\":1,\"isadmin\":0}]', '36', '0:0:0:0:0:0:0:1', '2019-12-03 15:12:17');
INSERT INTO `sys_log` VALUES ('87', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"orgid\":4,\"orgname\":\"经理2\",\"username\":\"test\",\"salt\":\"guOCrLXBid7er68hcBMo\",\"idcard\":\"232301199102120315\",\"mobile\":\"13000010001\",\"status\":1,\"roleIdList\":[6],\"createUserId\":1,\"title\":\"1\",\"sex\":0,\"isadmin\":1}]', '44', '0:0:0:0:0:0:0:1', '2019-12-03 16:03:51');
INSERT INTO `sys_log` VALUES ('88', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"录入管理\",\"url\":\"/entering-manager\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0}]', '35', '0:0:0:0:0:0:0:1', '2019-12-04 13:30:48');
INSERT INTO `sys_log` VALUES ('89', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"录入管理\",\"url\":\"work/entering-manager\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0}]', '18', '0:0:0:0:0:0:0:1', '2019-12-04 13:38:58');
INSERT INTO `sys_log` VALUES ('90', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"录入管理\",\"url\":\"work/entering-manager\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0}]', '2', '0:0:0:0:0:0:0:1', '2019-12-04 13:48:47');
INSERT INTO `sys_log` VALUES ('91', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"录入管理\",\"url\":\"work/entering-manager\",\"perms\":\"\",\"type\":0,\"icon\":\"bianji\",\"orderNum\":3}]', '23', '0:0:0:0:0:0:0:1', '2019-12-04 13:53:15');
INSERT INTO `sys_log` VALUES ('92', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":40,\"parentId\":31,\"name\":\"录入\",\"url\":\"work/entering-manager\",\"perms\":\"\",\"type\":1,\"icon\":\"geren\",\"orderNum\":1}]', '39', '0:0:0:0:0:0:0:1', '2019-12-04 13:53:55');
INSERT INTO `sys_log` VALUES ('93', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[40]', '140', '0:0:0:0:0:0:0:1', '2019-12-04 13:54:43');
INSERT INTO `sys_log` VALUES ('94', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"录入管理\",\"url\":\"work/entering-manage\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":3}]', '28', '0:0:0:0:0:0:0:1', '2019-12-04 13:54:52');
INSERT INTO `sys_log` VALUES ('95', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"录入管理\",\"url\":\"work/entering-manage\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0}]', '22', '0:0:0:0:0:0:0:1', '2019-12-04 13:55:05');
INSERT INTO `sys_log` VALUES ('96', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"录入管理\",\"url\":\"work/entering-manage\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0}]', '3', '0:0:0:0:0:0:0:1', '2019-12-04 13:55:49');
INSERT INTO `sys_log` VALUES ('97', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"录入管理\",\"url\":\"work/entering-manage\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0}]', '5', '0:0:0:0:0:0:0:1', '2019-12-04 14:00:08');
INSERT INTO `sys_log` VALUES ('98', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"录入管理\",\"url\":\"work/entering-manage\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0}]', '1', '0:0:0:0:0:0:0:1', '2019-12-04 14:00:08');
INSERT INTO `sys_log` VALUES ('99', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"录入管理\",\"url\":\"work/entering_manage\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0}]', '10', '0:0:0:0:0:0:0:1', '2019-12-04 14:00:17');
INSERT INTO `sys_log` VALUES ('100', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"录入管理\",\"url\":\"/work/entering_manage\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0}]', '10', '0:0:0:0:0:0:0:1', '2019-12-04 14:06:18');
INSERT INTO `sys_log` VALUES ('101', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"录入管理\",\"url\":\"/entering_manage\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0}]', '21', '0:0:0:0:0:0:0:1', '2019-12-04 14:06:44');
INSERT INTO `sys_log` VALUES ('102', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"录入管理\",\"url\":\"sys/entering_manage\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0}]', '19', '0:0:0:0:0:0:0:1', '2019-12-04 14:07:16');
INSERT INTO `sys_log` VALUES ('103', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":41,\"parentId\":31,\"name\":\"修改\",\"url\":\"\",\"perms\":\"sys:task:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '33', '0:0:0:0:0:0:0:1', '2019-12-13 14:29:45');
INSERT INTO `sys_log` VALUES ('104', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":42,\"parentId\":31,\"name\":\"删除\",\"url\":\"\",\"perms\":\"sys:task:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '28', '0:0:0:0:0:0:0:1', '2019-12-13 14:30:03');
INSERT INTO `sys_log` VALUES ('105', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"录入员\",\"remark\":\"录入员\",\"createUserId\":1,\"menuIdList\":[15,31,41,42,-666666,1,2]}]', '1481', '0:0:0:0:0:0:0:1', '2019-12-13 14:30:17');
INSERT INTO `sys_log` VALUES ('106', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":6,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,35,36,37,38,39,31,41,42,32,-666666]}]', '111', '0:0:0:0:0:0:0:1', '2019-12-13 14:30:34');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'system', '2');
INSERT INTO `sys_menu` VALUES ('2', '1', '会员管理', 'sys/user', null, '1', 'admin', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'sys/role', null, '1', 'role', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'sys/menu', null, '1', 'menu', '3');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('31', '0', '录入管理', 'work/entering_manage', '', '1', 'bianji', '0');
INSERT INTO `sys_menu` VALUES ('32', '0', '维修管理', '/miantain', '', '1', 'config', '1');
INSERT INTO `sys_menu` VALUES ('35', '1', '组织机构管理', 'sys/org', '', '1', 'zhedie', '3');
INSERT INTO `sys_menu` VALUES ('36', '35', '查看', 'sys/org', 'sys:org:list,sys:org:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('37', '35', '新增', 'sys/org', 'sys:org:save,sys:org:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('38', '35', '修改', 'sys/org', 'sys:org:update,sys:org:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('39', '35', '删除', 'sys/org', 'sys:org:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('41', '31', '修改', '', 'sys:task:update', '2', '', '0');
INSERT INTO `sys_menu` VALUES ('42', '31', '删除', '', 'sys:task:delete', '2', '', '0');

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parentid` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `orderby` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO `sys_org` VALUES ('1', '0', '经理1', '1');
INSERT INTO `sys_org` VALUES ('2', '1', '木工班组', '1');
INSERT INTO `sys_org` VALUES ('3', '1', '瓦工班组', '2');
INSERT INTO `sys_org` VALUES ('4', '0', '经理2', '2');
INSERT INTO `sys_org` VALUES ('6', '0', '经理3', '3');
INSERT INTO `sys_org` VALUES ('8', '4', '木工组', '2');
INSERT INTO `sys_org` VALUES ('10', '4', '瓦工组', '1');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_record`;
CREATE TABLE `sys_record` (
  `id` varchar(255) NOT NULL,
  `pid` varchar(255) NOT NULL,
  `creuser` bigint(4) DEFAULT NULL,
  `user` bigint(4) DEFAULT NULL,
  `credate` datetime DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  `foruser` bigint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_record
-- ----------------------------
INSERT INTO `sys_record` VALUES ('abff4631-13bd-4cd3-858b-0214b2f0cc74', '3813d522-a7cb-4c9e-af32-65cc373864db', null, null, '2019-12-24 17:20:31', '0', '4');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '录入员', '录入员', '1', '2019-11-20 18:18:27');
INSERT INTO `sys_role` VALUES ('2', '修理员', '修理员', '1', '2019-11-20 18:18:45');
INSERT INTO `sys_role` VALUES ('3', '班长', '班长', '1', '2019-11-20 18:18:58');
INSERT INTO `sys_role` VALUES ('4', '经理', '经理', '1', '2019-11-20 18:19:25');
INSERT INTO `sys_role` VALUES ('5', '主任', '主任', '1', '2019-11-20 18:19:46');
INSERT INTO `sys_role` VALUES ('6', '超级管理员', '超级管理员', '1', '2019-11-26 11:49:44');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('3', '2', '32');
INSERT INTO `sys_role_menu` VALUES ('4', '2', '-666666');
INSERT INTO `sys_role_menu` VALUES ('5', '3', '31');
INSERT INTO `sys_role_menu` VALUES ('6', '3', '32');
INSERT INTO `sys_role_menu` VALUES ('7', '3', '-666666');
INSERT INTO `sys_role_menu` VALUES ('8', '4', '2');
INSERT INTO `sys_role_menu` VALUES ('9', '4', '15');
INSERT INTO `sys_role_menu` VALUES ('10', '4', '16');
INSERT INTO `sys_role_menu` VALUES ('11', '4', '17');
INSERT INTO `sys_role_menu` VALUES ('12', '4', '18');
INSERT INTO `sys_role_menu` VALUES ('13', '4', '31');
INSERT INTO `sys_role_menu` VALUES ('14', '4', '32');
INSERT INTO `sys_role_menu` VALUES ('15', '4', '-666666');
INSERT INTO `sys_role_menu` VALUES ('16', '4', '1');
INSERT INTO `sys_role_menu` VALUES ('17', '5', '2');
INSERT INTO `sys_role_menu` VALUES ('18', '5', '15');
INSERT INTO `sys_role_menu` VALUES ('19', '5', '16');
INSERT INTO `sys_role_menu` VALUES ('20', '5', '17');
INSERT INTO `sys_role_menu` VALUES ('21', '5', '18');
INSERT INTO `sys_role_menu` VALUES ('22', '5', '3');
INSERT INTO `sys_role_menu` VALUES ('23', '5', '19');
INSERT INTO `sys_role_menu` VALUES ('24', '5', '20');
INSERT INTO `sys_role_menu` VALUES ('25', '5', '21');
INSERT INTO `sys_role_menu` VALUES ('26', '5', '22');
INSERT INTO `sys_role_menu` VALUES ('27', '5', '4');
INSERT INTO `sys_role_menu` VALUES ('28', '5', '23');
INSERT INTO `sys_role_menu` VALUES ('29', '5', '24');
INSERT INTO `sys_role_menu` VALUES ('30', '5', '25');
INSERT INTO `sys_role_menu` VALUES ('31', '5', '26');
INSERT INTO `sys_role_menu` VALUES ('32', '5', '31');
INSERT INTO `sys_role_menu` VALUES ('33', '5', '32');
INSERT INTO `sys_role_menu` VALUES ('34', '5', '-666666');
INSERT INTO `sys_role_menu` VALUES ('35', '5', '1');
INSERT INTO `sys_role_menu` VALUES ('116', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('117', '1', '31');
INSERT INTO `sys_role_menu` VALUES ('118', '1', '41');
INSERT INTO `sys_role_menu` VALUES ('119', '1', '42');
INSERT INTO `sys_role_menu` VALUES ('120', '1', '-666666');
INSERT INTO `sys_role_menu` VALUES ('121', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('122', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('123', '6', '1');
INSERT INTO `sys_role_menu` VALUES ('124', '6', '2');
INSERT INTO `sys_role_menu` VALUES ('125', '6', '15');
INSERT INTO `sys_role_menu` VALUES ('126', '6', '16');
INSERT INTO `sys_role_menu` VALUES ('127', '6', '17');
INSERT INTO `sys_role_menu` VALUES ('128', '6', '18');
INSERT INTO `sys_role_menu` VALUES ('129', '6', '3');
INSERT INTO `sys_role_menu` VALUES ('130', '6', '19');
INSERT INTO `sys_role_menu` VALUES ('131', '6', '20');
INSERT INTO `sys_role_menu` VALUES ('132', '6', '21');
INSERT INTO `sys_role_menu` VALUES ('133', '6', '22');
INSERT INTO `sys_role_menu` VALUES ('134', '6', '4');
INSERT INTO `sys_role_menu` VALUES ('135', '6', '23');
INSERT INTO `sys_role_menu` VALUES ('136', '6', '24');
INSERT INTO `sys_role_menu` VALUES ('137', '6', '25');
INSERT INTO `sys_role_menu` VALUES ('138', '6', '26');
INSERT INTO `sys_role_menu` VALUES ('139', '6', '35');
INSERT INTO `sys_role_menu` VALUES ('140', '6', '36');
INSERT INTO `sys_role_menu` VALUES ('141', '6', '37');
INSERT INTO `sys_role_menu` VALUES ('142', '6', '38');
INSERT INTO `sys_role_menu` VALUES ('143', '6', '39');
INSERT INTO `sys_role_menu` VALUES ('144', '6', '31');
INSERT INTO `sys_role_menu` VALUES ('145', '6', '41');
INSERT INTO `sys_role_menu` VALUES ('146', '6', '42');
INSERT INTO `sys_role_menu` VALUES ('147', '6', '32');
INSERT INTO `sys_role_menu` VALUES ('148', '6', '-666666');

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `taskdate` datetime DEFAULT NULL COMMENT '日期',
  `position` varchar(500) DEFAULT NULL COMMENT '位置',
  `desc` varchar(2000) DEFAULT NULL COMMENT '描述',
  `creuser` varchar(255) DEFAULT NULL COMMENT '上报人',
  `cremobile` varchar(255) DEFAULT NULL COMMENT '上报人电话',
  `creuserid` bigint(4) DEFAULT NULL COMMENT '上报人id',
  `org` bigint(4) DEFAULT NULL COMMENT '处理群组',
  `assigner` bigint(4) DEFAULT NULL COMMENT '处理人',
  `status` bigint(4) DEFAULT NULL COMMENT '0 待分配 1 以分配 2待处理 3以处理',
  `credate` datetime DEFAULT NULL,
  `types` bigint(4) DEFAULT NULL COMMENT ' 1 房产 2 电力 3 水暖 4 其他',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_task
-- ----------------------------
INSERT INTO `sys_task` VALUES ('3813d522-a7cb-4c9e-af32-65cc373864db', '1', '2019-12-03 00:00:00', '1', '', null, '1', null, null, '4', '0', '2019-12-24 17:20:31', '2');
INSERT INTO `sys_task` VALUES ('69bbd3f1-dbf1-4ede-b489-29a005608e22', 'test1', '2019-12-27 16:29:18', '5层518', '这是个描述', null, '13000000001', null, null, '4', '0', '2019-12-26 16:45:35', '1');
INSERT INTO `sys_task` VALUES ('7fe3a0f8-6d25-42ee-bb7a-5259b5af7871', '水管爆裂', '2019-12-13 13:57:04', '教学楼5楼东侧男厕', '教学A楼5栋男厕水管爆裂了，快来修理吧', '韩春霖', '1333333333', '3', '2', '2', '0', '2019-12-13 13:58:06', null);
INSERT INTO `sys_task` VALUES ('7fe3a0f8-6d25-42ee-bb7a-5259b5af7872', '水管再次爆裂', '2019-12-13 14:18:03', '教学楼5楼东侧男厕', '教学A楼5栋男厕水管爆裂了，快来修理吧', '韩春霖', '1333333333', '3', '2', '2', '0', '2019-12-13 13:58:06', null);
INSERT INTO `sys_task` VALUES ('c2c4c548-75c8-445d-8353-9dddeb57d71c', 'test1', '2019-12-27 16:29:18', '5层518', '这是个描述', null, '13000000001', null, null, '4', '0', '2019-12-26 16:29:52', '1');
INSERT INTO `sys_task` VALUES ('e24f845d-4bff-41a0-8b98-bf2772fea469', 'test1', '2019-12-27 16:29:18', '5层518', '这是个描述', null, '13000000001', null, null, '4', '0', '2019-12-26 16:41:30', '1');

-- ----------------------------
-- Table structure for sys_title
-- ----------------------------
DROP TABLE IF EXISTS `sys_title`;
CREATE TABLE `sys_title` (
  `id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_title
-- ----------------------------
INSERT INTO `sys_title` VALUES ('1', '班长');
INSERT INTO `sys_title` VALUES ('2', '经理');
INSERT INTO `sys_title` VALUES ('3', '主任');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orgid` bigint(20) DEFAULT NULL COMMENT '主管id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `idcard` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `sex` tinyint(4) DEFAULT NULL,
  `title` tinyint(4) DEFAULT NULL,
  `isadmin` tinyint(4) DEFAULT NULL COMMENT '是否管理员 0 否 1是',
  `openid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '0', 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', '232301199102120314', '13612345678', '1', '1', '2016-11-11 11:11:11', '1', '2', '0', null);
INSERT INTO `sys_user` VALUES ('2', '4', '测试员', '813a3cac748abdc79340e07ac94fbe2085a17ddd43dd87a8d9ef581b99adbc40', 'guOCrLXBid7er68hcBMo', '232301199102120315', '13000010001', '1', '1', '2019-11-21 14:45:18', '0', '1', '1', null);
INSERT INTO `sys_user` VALUES ('3', '1', '韩春霖', 'f6e194e47ea5b60c7e0ae175ac625e5071e6166120ae66fc0fc0b8a9a81f39c1', 'rcvqOqWNwwZRMzQqSzYS', '23230119910212031X', '13111111111', '1', '1', '2019-11-21 16:44:03', '0', '3', '1', null);
INSERT INTO `sys_user` VALUES ('4', '2', '测试1', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', '232301199102120314', '13612345678', '1', '1', '2019-12-16 14:29:58', '0', '1', '1', null);
INSERT INTO `sys_user` VALUES ('5', '2', '测试2', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', '232301199102120314', '13612345678', '1', '1', '2019-12-16 14:30:26', '0', '1', '0', null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('28', '3', '6');
INSERT INTO `sys_user_role` VALUES ('30', '1', '6');
INSERT INTO `sys_user_role` VALUES ('31', '2', '6');

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES ('1', '51a99fe4ee63e36fb71e8580dee90ffa', '2019-12-26 23:10:30', '2019-12-26 11:10:30');
INSERT INTO `sys_user_token` VALUES ('2', '2d3e3711fe55e06e91068185000035f2', '2019-11-30 04:10:16', '2019-11-29 16:10:16');
INSERT INTO `sys_user_token` VALUES ('3', '9b10bafadf6ee3943d8ac9b0f8193196', '2019-12-03 04:38:36', '2019-12-02 16:38:36');

-- ----------------------------
-- Table structure for task_pic
-- ----------------------------
DROP TABLE IF EXISTS `task_pic`;
CREATE TABLE `task_pic` (
  `id` varchar(255) NOT NULL,
  `picname` varchar(255) DEFAULT NULL,
  `path` varchar(2000) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of task_pic
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');
