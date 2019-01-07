/*
Navicat MySQL Data Transfer

Source Server         : mysql_5.7
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : stmis

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-01-06 02:28:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LBBH` varchar(200) NOT NULL DEFAULT '',
  `LBMC` varchar(200) NOT NULL DEFAULT '',
  `BXZD_1` varchar(200) DEFAULT NULL,
  `BXZD_2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`LBBH`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for competition
-- ----------------------------
DROP TABLE IF EXISTS `competition`;
CREATE TABLE `competition` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `JSKCBH` varchar(200) NOT NULL DEFAULT '',
  `JSZT` varchar(200) NOT NULL DEFAULT '',
  `JSFS` varchar(200) NOT NULL DEFAULT '',
  `JSMS` varchar(200) NOT NULL DEFAULT '',
  `JSJL` varchar(200) NOT NULL DEFAULT '',
  `JSGZ` varchar(200) NOT NULL DEFAULT '',
  `JSRS` int(11) NOT NULL DEFAULT '0',
  `JSKSSJ` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `JSJSSJ` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `JSSTBH` varchar(200) NOT NULL DEFAULT '',
  `JSSTNR` varchar(200) DEFAULT NULL,
  `JSSTDA` varchar(200) DEFAULT NULL,
  `FZRGH` varchar(200) DEFAULT NULL,
  `JSSH` varchar(200) DEFAULT NULL,
  `BXZD_1` varchar(200) DEFAULT NULL,
  `BXZD_2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `JSKCBH` (`JSKCBH`),
  CONSTRAINT `competition_ibfk_1` FOREIGN KEY (`JSKCBH`) REFERENCES `course` (`KCBH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competition
-- ----------------------------

-- ----------------------------
-- Table structure for competitionentry
-- ----------------------------
DROP TABLE IF EXISTS `competitionentry`;
CREATE TABLE `competitionentry` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `JSBH` int(11) NOT NULL DEFAULT '0',
  `JSZT` varchar(200) NOT NULL DEFAULT '',
  `BMYGZH` varchar(200) NOT NULL DEFAULT '',
  `ZDLS` varchar(200) NOT NULL DEFAULT '',
  `BXZD_1` varchar(200) DEFAULT NULL,
  `BXZD_2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `JSBH` (`JSBH`),
  KEY `BMYGZH` (`BMYGZH`),
  CONSTRAINT `competitionentry_ibfk_1` FOREIGN KEY (`JSBH`) REFERENCES `competition` (`ID`),
  CONSTRAINT `competitionentry_ibfk_2` FOREIGN KEY (`BMYGZH`) REFERENCES `employee` (`YGZH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competitionentry
-- ----------------------------

-- ----------------------------
-- Table structure for competition_question
-- ----------------------------
DROP TABLE IF EXISTS `competition_question`;
CREATE TABLE `competition_question` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STBH` varchar(200) NOT NULL DEFAULT '',
  `JSBH` varchar(200) NOT NULL DEFAULT '',
  `JSZT` varchar(200) NOT NULL DEFAULT '',
  `JSTX` varchar(200) NOT NULL DEFAULT '',
  `TMNR` varchar(200) NOT NULL DEFAULT '',
  `TMDA` varchar(200) NOT NULL DEFAULT '',
  `TMJX` varchar(200) NOT NULL DEFAULT '',
  `BXZD_1` varchar(200) DEFAULT NULL,
  `BXZD_2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competition_question
-- ----------------------------

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `KCBH` varchar(200) NOT NULL DEFAULT '',
  `KCMC` varchar(200) NOT NULL DEFAULT '',
  `KCLB` varchar(200) NOT NULL DEFAULT '',
  `KCJJ` varchar(200) NOT NULL DEFAULT '',
  `KCJS` varchar(200) NOT NULL DEFAULT '',
  `KCZT` int(11) NOT NULL DEFAULT '0',
  `KCXF` int(11) NOT NULL DEFAULT '0',
  `QXKCBH` varchar(200) DEFAULT NULL,
  `XGKCBH` varchar(200) DEFAULT NULL,
  `KCLJ` varchar(200) DEFAULT NULL,
  `KKSJ` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `JKSJ` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `BXZD_1` varchar(200) DEFAULT NULL,
  `BXZD_2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`KCBH`),
  UNIQUE KEY `ID` (`ID`),
  KEY `KCLB` (`KCLB`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`KCLB`) REFERENCES `category` (`LBBH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------

-- ----------------------------
-- Table structure for course_resource
-- ----------------------------
DROP TABLE IF EXISTS `course_resource`;
CREATE TABLE `course_resource` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `KCBH` varchar(200) NOT NULL DEFAULT '',
  `KCMC` varchar(200) NOT NULL DEFAULT '',
  `ZJXH` int(11) NOT NULL DEFAULT '0',
  `ZJMC` varchar(200) NOT NULL DEFAULT '',
  `ZYLX` varchar(200) NOT NULL DEFAULT '',
  `ZYLJ` varchar(200) NOT NULL DEFAULT '',
  `BXZD_1` varchar(200) DEFAULT NULL,
  `BXZD_2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `KCBH` (`KCBH`),
  CONSTRAINT `course_resource_ibfk_1` FOREIGN KEY (`KCBH`) REFERENCES `course` (`KCBH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_resource
-- ----------------------------

-- ----------------------------
-- Table structure for course_selection
-- ----------------------------
DROP TABLE IF EXISTS `course_selection`;
CREATE TABLE `course_selection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `YGZH` varchar(200) NOT NULL DEFAULT '',
  `KCBH` varchar(200) NOT NULL DEFAULT '',
  `KCJD` int(11) NOT NULL DEFAULT '0',
  `BXZD_1` varchar(200) DEFAULT NULL,
  `BXZD_2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `YGZH` (`YGZH`),
  KEY `KCBH` (`KCBH`),
  CONSTRAINT `course_selection_ibfk_1` FOREIGN KEY (`YGZH`) REFERENCES `employee` (`YGZH`),
  CONSTRAINT `course_selection_ibfk_2` FOREIGN KEY (`KCBH`) REFERENCES `course` (`KCBH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_selection
-- ----------------------------

-- ----------------------------
-- Table structure for course_structure
-- ----------------------------
DROP TABLE IF EXISTS `course_structure`;
CREATE TABLE `course_structure` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ZJBH` varchar(200) NOT NULL DEFAULT '',
  `ZJMC` varchar(200) NOT NULL DEFAULT '',
  `KCBH` varchar(200) NOT NULL DEFAULT '',
  `BXZD_1` varchar(200) DEFAULT NULL,
  `BXZD_2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `KCBH` (`KCBH`),
  CONSTRAINT `course_structure_ibfk_1` FOREIGN KEY (`KCBH`) REFERENCES `course` (`KCBH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_structure
-- ----------------------------

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `YGZH` varchar(200) NOT NULL DEFAULT '',
  `YGMM` varchar(200) NOT NULL DEFAULT '',
  `YGXM` varchar(200) NOT NULL DEFAULT '',
  `YGXB` varchar(200) NOT NULL DEFAULT '',
  `YGNL` int(11) NOT NULL DEFAULT '0',
  `YGDZ` varchar(200) NOT NULL DEFAULT '',
  `YGDWBH` varchar(200) NOT NULL DEFAULT '',
  `YGDH` varchar(200) NOT NULL DEFAULT '',
  `YGQX` int(11) NOT NULL DEFAULT '0',
  `YGYX` varchar(200) NOT NULL DEFAULT '',
  `YGXF` varchar(200) NOT NULL DEFAULT '',
  `YGCJ` double NOT NULL DEFAULT '0',
  `YGPXYQ` varchar(200) NOT NULL DEFAULT '',
  `YGPXZP` varchar(200) NOT NULL DEFAULT '',
  `YGZT` int(11) NOT NULL DEFAULT '0',
  `YGDLZT` int(11) NOT NULL DEFAULT '0',
  `JSBS` varchar(200) NOT NULL DEFAULT '',
  `BXZD_1` varchar(200) DEFAULT NULL,
  `BXZD_2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`YGZH`),
  UNIQUE KEY `ID` (`ID`),
  KEY `YGDWBH` (`YGDWBH`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`YGDWBH`) REFERENCES `unitinfo` (`DWBH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `YGZH` varchar(200) NOT NULL DEFAULT '',
  `JSBH` varchar(200) NOT NULL DEFAULT '',
  `KCBH` varchar(200) NOT NULL DEFAULT '',
  `KCFS` double NOT NULL DEFAULT '0',
  `KSDFSJ` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `BXZD_1` varchar(200) DEFAULT NULL,
  `BXZD_2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GLYZH` varchar(200) NOT NULL DEFAULT '',
  `GLYMM` varchar(200) NOT NULL DEFAULT '',
  `JSBS` varchar(200) NOT NULL DEFAULT '管理员',
  `BXZD_1` varchar(200) DEFAULT NULL,
  `BXZD_2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`GLYZH`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------

-- ----------------------------
-- Table structure for rank
-- ----------------------------
DROP TABLE IF EXISTS `rank`;
CREATE TABLE `rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `YGZH` varchar(200) NOT NULL DEFAULT '',
  `JSBH` int(11) NOT NULL DEFAULT '0',
  `JSZT` varchar(200) NOT NULL DEFAULT '',
  `YGXM` varchar(200) NOT NULL DEFAULT '',
  `YGJSFS` varchar(200) NOT NULL DEFAULT '',
  `YGJSPM` varchar(200) NOT NULL DEFAULT '',
  `BXZD_1` varchar(200) DEFAULT NULL,
  `BXZD_2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `JSBH` (`JSBH`),
  CONSTRAINT `rank_ibfk_1` FOREIGN KEY (`JSBH`) REFERENCES `competition` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rank
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `JSBS` varchar(200) NOT NULL DEFAULT '',
  `JSMC` varchar(200) NOT NULL DEFAULT '',
  `BXZD_1` varchar(200) DEFAULT NULL,
  `BXZD_2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`JSBS`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `JSZH` varchar(200) NOT NULL DEFAULT '',
  `JSMM` varchar(200) NOT NULL DEFAULT '',
  `JSXM` varchar(200) NOT NULL DEFAULT '',
  `JSZY` varchar(200) NOT NULL DEFAULT '',
  `JSDWBH` varchar(200) NOT NULL DEFAULT '',
  `JSDJ` int(11) NOT NULL DEFAULT '0',
  `JSDLZT` int(11) NOT NULL DEFAULT '0',
  `KCBH` varchar(200) NOT NULL DEFAULT '',
  `JSBS` varchar(200) NOT NULL DEFAULT '教师',
  `JSXB` varchar(200) NOT NULL DEFAULT '',
  `JSNL` int(11) DEFAULT NULL,
  `JSTX` varchar(200) DEFAULT NULL,
  `JSJJ` varchar(200) DEFAULT NULL,
  `BXZD_1` varchar(200) DEFAULT NULL,
  `BXZD_2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`JSZH`),
  UNIQUE KEY `ID` (`ID`),
  KEY `JSDWBH` (`JSDWBH`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`JSDWBH`) REFERENCES `unitinfo` (`DWBH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------

-- ----------------------------
-- Table structure for totalgrades
-- ----------------------------
DROP TABLE IF EXISTS `totalgrades`;
CREATE TABLE `totalgrades` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `YGZH` varchar(200) NOT NULL DEFAULT '',
  `BNDSXKCZS` int(11) NOT NULL DEFAULT '0',
  `LJSXKCZS` int(11) NOT NULL DEFAULT '0',
  `BNDZF` double NOT NULL DEFAULT '0',
  `LJZF` double NOT NULL DEFAULT '0',
  `BXZD_1` varchar(200) DEFAULT NULL,
  `BXZD_2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of totalgrades
-- ----------------------------

-- ----------------------------
-- Table structure for unitinfo
-- ----------------------------
DROP TABLE IF EXISTS `unitinfo`;
CREATE TABLE `unitinfo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DWBH` varchar(200) NOT NULL DEFAULT '',
  `DWMC` varchar(200) NOT NULL DEFAULT '',
  `HY` varchar(200) NOT NULL DEFAULT '',
  `BXZD_1` varchar(200) DEFAULT NULL,
  `BXZD_2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`DWBH`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of unitinfo
-- ----------------------------
