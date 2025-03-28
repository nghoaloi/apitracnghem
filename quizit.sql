-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th3 21, 2025 lúc 09:12 AM
-- Phiên bản máy phục vụ: 8.3.0
-- Phiên bản PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Cơ sở dữ liệu: `quizit`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(255) NOT NULL,
  `CreateAt` TIMESTAMP NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`Id`, `CategoryName`, `CreateAt`) VALUES
(1005, 'C s d liu', '2023-06-04 10:00:26'),
(1006, 'Java', '2023-06-04 10:00:31'),
(1007, 'Mng my tnh', '2023-06-04 10:00:36'),
(1008, 'chu de new', '2024-05-14 13:32:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `exam`
--

DROP TABLE IF EXISTS `exam`;
CREATE TABLE IF NOT EXISTS `exam` (
  `id` int NOT NULL AUTO_INCREMENT,
  `CategoryId` int NOT NULL,
  `ExamName` varchar(255) NOT NULL,
  `Time` int NOT NULL,
  `CreateAt` TIMESTAMP NOT NULL,
  `CreateBy` int NOT NULL,
  `IsActive` bit(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CategoryId` (`CategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `exam`
--

INSERT INTO `exam` (`id`, `CategoryId`, `ExamName`, `Time`, `CreateAt`, `CreateBy`, `IsActive`) VALUES
(1, 1006, ' trc nghim Java s 1', 1, '2023-06-04 10:31:13', 3, b'0000000001'),
(2, 1006, ' trc nghim Java s 2', 15, '2023-06-04 10:37:04', 3, b'0000000001'),
(3, 1007, ' trc nghim Mng my tnh s 1', 10, '2023-06-04 10:48:19', 3, b'0000000001'),
(4, 1007, ' n Mng my tnh', 15, '2023-06-04 10:48:58', 3, b'0000000001'),
(5, 1006, ' n Java', 30, '2023-06-04 10:49:58', 3, b'0000000001'),
(6, 1007, ' trc nghim Mng my tnh s 2', 15, '2023-06-05 10:09:01', 3, b'0000000001'),
(7, 1007, ' n mng my tnh', 15, '2023-06-05 10:30:49', 3, b'0000000001'),
(8, 1008, 'demo ', 17, '2024-05-14 13:38:15', 3, b'0000000001');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `examdetail`
--

DROP TABLE IF EXISTS `examdetail`;
CREATE TABLE IF NOT EXISTS `examdetail` (
  `Id` int NOT NULL,
  `ExamId` int NOT NULL,
  `QuestionId` int NOT NULL,
  `Order` int NOT NULL,
  KEY `ExamId` (`ExamId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `history`
--

DROP TABLE IF EXISTS `history`;
CREATE TABLE IF NOT EXISTS `history` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ExamId` int NOT NULL,
  `UserId` int NOT NULL,
  `TimeDoExam` float NOT NULL,
  `Point` int NOT NULL,
  `CreatedAt` TIMESTAMP NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `ExamId` (`ExamId`),
  KEY `history_ibfk_1` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=1031 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `history`
--

INSERT INTO `history` (`Id`, `ExamId`, `UserId`, `TimeDoExam`, `Point`, `CreatedAt`) VALUES
(19, 1, 3, 0.216667, 6, '2023-06-08 20:30:57'),
(20, 1, 3, 1, 1, '2023-06-08 20:47:12'),
(1019, 5, 3, 1.16667, 5, '2023-06-11 20:19:28'),
(1020, 1, 3, 0.166667, 4, '2023-06-11 20:43:50'),
(1021, 1, 3, 0.166667, 1, '2023-06-11 20:44:15'),
(1022, 1, 3, 0.166667, 2, '2023-06-11 20:52:58'),
(1023, 1, 3, 0.166667, 3, '2023-06-11 20:53:16'),
(1024, 6, 3, 0.933333, 4, '2023-06-11 20:55:17'),
(1025, 4, 3, 0.233333, 4, '2023-06-11 20:56:28'),
(1026, 2, 3, 0.35, 4, '2023-06-11 20:57:48'),
(1027, 4, 3, 0.233333, 4, '2023-06-11 21:13:12'),
(1028, 7, 7, 0.483333, 4, '2024-05-14 11:37:20'),
(1029, 5, 8, 0.733333, 8, '2024-05-14 13:30:15'),
(1030, 3, 8, 0.3, 5, '2024-05-14 13:31:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `historydetail`
--

DROP TABLE IF EXISTS `historydetail`;
CREATE TABLE IF NOT EXISTS `historydetail` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `HistoryId` int NOT NULL,
  `QuestionId` int NOT NULL,
  `AnswerSelect` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `HistoryId` (`HistoryId`),
  KEY `QuestionId` (`QuestionId`)
) ENGINE=InnoDB AUTO_INCREMENT=1428 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `historydetail`
--

INSERT INTO `historydetail` (`Id`, `HistoryId`, `QuestionId`, `AnswerSelect`) VALUES
(238, 19, 1113, 'A'),
(239, 19, 1114, 'B'),
(240, 19, 1118, 'C'),
(241, 19, 1117, 'D'),
(242, 19, 1115, 'D'),
(243, 19, 1116, 'C'),
(244, 19, 1119, 'B'),
(245, 19, 1120, 'A'),
(246, 19, 1121, 'A'),
(247, 19, 1122, 'B'),
(248, 20, 1113, 'D'),
(249, 20, 1114, 'C'),
(250, 20, 1118, 'X'),
(251, 20, 1117, 'X'),
(252, 20, 1115, 'X'),
(253, 20, 1116, 'B'),
(254, 20, 1119, 'X'),
(255, 20, 1120, 'D'),
(256, 20, 1121, 'X'),
(257, 20, 1122, 'X'),
(1238, 1019, 1113, 'A'),
(1239, 1019, 1121, 'D'),
(1240, 1019, 1120, 'A'),
(1241, 1019, 1124, 'A'),
(1242, 1019, 1123, 'B'),
(1243, 1019, 1126, 'B'),
(1244, 1019, 1127, 'D'),
(1245, 1019, 1128, 'C'),
(1246, 1019, 1129, 'C'),
(1247, 1019, 1130, 'A'),
(1248, 1019, 1131, 'A'),
(1249, 1019, 1132, 'A'),
(1250, 1019, 1133, 'B'),
(1251, 1019, 1134, 'D'),
(1252, 1019, 1135, 'A'),
(1253, 1019, 1136, 'C'),
(1254, 1019, 1137, 'B'),
(1255, 1019, 1138, 'B'),
(1256, 1019, 1139, 'B'),
(1257, 1019, 1140, 'A'),
(1258, 1019, 1142, 'A'),
(1259, 1019, 1141, 'A'),
(1260, 1019, 1119, 'C'),
(1261, 1019, 1118, 'A'),
(1262, 1019, 1117, 'A'),
(1263, 1019, 1116, 'A'),
(1264, 1019, 1115, 'A'),
(1265, 1019, 1114, 'A'),
(1266, 1019, 1122, 'D'),
(1267, 1019, 1125, 'A'),
(1268, 1020, 1113, 'A'),
(1269, 1020, 1114, 'B'),
(1270, 1020, 1118, 'B'),
(1271, 1020, 1117, 'A'),
(1272, 1020, 1115, 'D'),
(1273, 1020, 1116, 'A'),
(1274, 1020, 1119, 'C'),
(1275, 1020, 1120, 'A'),
(1276, 1020, 1121, 'D'),
(1277, 1020, 1122, 'D'),
(1278, 1021, 1113, 'A'),
(1279, 1021, 1114, 'A'),
(1280, 1021, 1118, 'A'),
(1281, 1021, 1117, 'A'),
(1282, 1021, 1115, 'B'),
(1283, 1021, 1116, 'A'),
(1284, 1021, 1119, 'A'),
(1285, 1021, 1120, 'D'),
(1286, 1021, 1121, 'C'),
(1287, 1021, 1122, 'B'),
(1288, 1022, 1113, 'A'),
(1289, 1022, 1114, 'A'),
(1290, 1022, 1118, 'B'),
(1291, 1022, 1117, 'B'),
(1292, 1022, 1115, 'A'),
(1293, 1022, 1116, 'D'),
(1294, 1022, 1119, 'A'),
(1295, 1022, 1120, 'D'),
(1296, 1022, 1121, 'D'),
(1297, 1022, 1122, 'D'),
(1298, 1023, 1113, 'A'),
(1299, 1023, 1114, 'A'),
(1300, 1023, 1118, 'A'),
(1301, 1023, 1117, 'A'),
(1302, 1023, 1115, 'B'),
(1303, 1023, 1116, 'C'),
(1304, 1023, 1119, 'D'),
(1305, 1023, 1120, 'A'),
(1306, 1023, 1121, 'D'),
(1307, 1023, 1122, 'A'),
(1308, 1024, 1143, 'A'),
(1309, 1024, 1144, 'A'),
(1310, 1024, 1145, 'A'),
(1311, 1024, 1146, 'B'),
(1312, 1024, 1157, 'A'),
(1313, 1024, 1156, 'A'),
(1314, 1024, 1155, 'A'),
(1315, 1024, 1147, 'B'),
(1316, 1024, 1148, 'A'),
(1317, 1024, 1152, 'C'),
(1318, 1024, 1151, 'C'),
(1319, 1024, 1150, 'C'),
(1320, 1024, 1153, 'B'),
(1321, 1024, 1154, 'B'),
(1322, 1024, 1149, 'D'),
(1323, 1025, 1143, 'A'),
(1324, 1025, 1144, 'D'),
(1325, 1025, 1145, 'A'),
(1326, 1025, 1146, 'B'),
(1327, 1025, 1147, 'D'),
(1328, 1025, 1148, 'B'),
(1329, 1025, 1157, 'D'),
(1330, 1025, 1156, 'A'),
(1331, 1025, 1155, 'C'),
(1332, 1025, 1154, 'C'),
(1333, 1025, 1153, 'B'),
(1334, 1025, 1152, 'C'),
(1335, 1025, 1151, 'C'),
(1336, 1025, 1150, 'B'),
(1337, 1025, 1149, 'A'),
(1338, 1026, 1113, 'A'),
(1339, 1026, 1125, 'D'),
(1340, 1026, 1124, 'D'),
(1341, 1026, 1126, 'D'),
(1342, 1026, 1127, 'D'),
(1343, 1026, 1128, 'D'),
(1344, 1026, 1129, 'B'),
(1345, 1026, 1130, 'C'),
(1346, 1026, 1123, 'C'),
(1347, 1026, 1122, 'A'),
(1348, 1026, 1121, 'A'),
(1349, 1026, 1120, 'A'),
(1350, 1026, 1118, 'A'),
(1351, 1026, 1119, 'A'),
(1352, 1026, 1117, 'A'),
(1353, 1026, 1116, 'B'),
(1354, 1026, 1115, 'A'),
(1355, 1026, 1114, 'A'),
(1356, 1026, 1131, 'C'),
(1357, 1026, 1132, 'C'),
(1358, 1027, 1143, 'A'),
(1359, 1027, 1144, 'A'),
(1360, 1027, 1145, 'B'),
(1361, 1027, 1146, 'D'),
(1362, 1027, 1147, 'D'),
(1363, 1027, 1148, 'D'),
(1364, 1027, 1157, 'A'),
(1365, 1027, 1156, 'A'),
(1366, 1027, 1155, 'A'),
(1367, 1027, 1154, 'A'),
(1368, 1027, 1153, 'C'),
(1369, 1027, 1152, 'D'),
(1370, 1027, 1151, 'A'),
(1371, 1027, 1150, 'B'),
(1372, 1027, 1149, 'C'),
(1373, 1028, 1150, 'A'),
(1374, 1028, 1151, 'A'),
(1375, 1028, 1154, 'A'),
(1376, 1028, 1153, 'D'),
(1377, 1028, 1152, 'A'),
(1378, 1028, 1155, 'A'),
(1379, 1028, 1143, 'C'),
(1380, 1028, 1144, 'B'),
(1381, 1028, 1145, 'A'),
(1382, 1028, 1146, 'D'),
(1383, 1028, 1147, 'B'),
(1384, 1028, 1148, 'A'),
(1385, 1028, 1149, 'A'),
(1386, 1029, 1113, 'C'),
(1387, 1029, 1121, 'D'),
(1388, 1029, 1120, 'A'),
(1389, 1029, 1124, 'A'),
(1390, 1029, 1123, 'B'),
(1391, 1029, 1126, 'A'),
(1392, 1029, 1127, 'B'),
(1393, 1029, 1128, 'B'),
(1394, 1029, 1129, 'C'),
(1395, 1029, 1130, 'A'),
(1396, 1029, 1131, 'B'),
(1397, 1029, 1132, 'B'),
(1398, 1029, 1133, 'B'),
(1399, 1029, 1134, 'B'),
(1400, 1029, 1135, 'A'),
(1401, 1029, 1136, 'D'),
(1402, 1029, 1137, 'A'),
(1403, 1029, 1138, 'B'),
(1404, 1029, 1139, 'B'),
(1405, 1029, 1140, 'B'),
(1406, 1029, 1142, 'B'),
(1407, 1029, 1141, 'B'),
(1408, 1029, 1119, 'A'),
(1409, 1029, 1118, 'B'),
(1410, 1029, 1117, 'A'),
(1411, 1029, 1116, 'B'),
(1412, 1029, 1115, 'B'),
(1413, 1029, 1114, 'B'),
(1414, 1029, 1122, 'A'),
(1415, 1029, 1125, 'A'),
(1416, 1030, 1157, 'D'),
(1417, 1030, 1156, 'A'),
(1418, 1030, 1153, 'A'),
(1419, 1030, 1155, 'A'),
(1420, 1030, 1151, 'A'),
(1421, 1030, 1149, 'A'),
(1422, 1030, 1152, 'A'),
(1423, 1030, 1146, 'A'),
(1424, 1030, 1147, 'A'),
(1425, 1030, 1148, 'A'),
(1426, 1030, 1143, 'B'),
(1427, 1030, 1145, 'B');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CategoryId` int NOT NULL,
  `Content` varchar(255) NOT NULL,
  `AnswerA` varchar(255) NOT NULL,
  `AnswerB` varchar(255) NOT NULL,
  `AnswerC` varchar(255) NOT NULL,
  `AnswerD` varchar(255) NOT NULL,
  `AnswerCorrect` varchar(1) NOT NULL,
  `CreatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `CategoryId` (`CategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=1185 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `question`
--

INSERT INTO `question` (`Id`, `CategoryId`, `Content`, `AnswerA`, `AnswerB`, `AnswerC`, `AnswerD`, `AnswerCorrect`, `CreatedAt`, `CreatedBy`) VALUES
(1113, 1006, 'u l cu sai v ngn ng Java?', 'Ngn ng Java c phn bit ch hoa   ch thng', 'Java l ngn ng lp trnh hng i tng', 'Du chm phy c s dng  kt thc lnh trong java', 'Chng trnh vit bng Java ch c th chy trn h iu hnh Window', 'D', '2023-06-04 00:00:00', 3),
(1114, 1006, 'Cho xu k t s= ABCDEF .  ly k t th  E  ca xu k t s(String) dng cu lnh no sau y?', 's.charAt(5)', 's.charAt(4)', 's`5`', 's`4`', 'B', '2023-06-04 00:00:00', 3),
(1115, 1006, 'Phm vi truy cp ca mt i tng khi c khai bo public l g?', 'C th c truy cp t bt k v tr no trong chng trnh', 'C th c truy cp t cc lp trong cng package', 'C th c truy cp t cc lp trong cng package v lp con nm trong package khc', 'Ch c th truy cp t cc phng thc khc trong class ', 'A', '2023-06-04 00:00:00', 3),
(1116, 1006, 'Phm vi truy cp ca mt i tng khi c khai bao protected l g?', 'C th c truy cp t bt k v tr no trong chng trnh', 'C th c truy cp t cc lp trong cng package', 'C th c truy cp t cc lp trong cng package v lp con nm trong package khc', 'Ch c th truy cp t cc phng thc khc trong class ', 'C', '2023-06-04 00:00:00', 3),
(1117, 1006, 'Kiu enum l g?', 'L kiu d liu gm cc trng cha mt tp hp c nh cc hng s', 'L kiu d liu lit k cc bin s', 'L mt kiu d liu trong java', 'Tt c u sai', 'A', '2023-06-04 00:00:00', 3),
(1118, 1006, 'Mt lp trong Java c bao nhiu lp con?', '2', '3', 'V s', '4', 'C', '2023-06-04 00:00:00', 3),
(1119, 1006, 'Mt lp trong Java c th c bao nhiu lp cha?', '2', '1', '3', '4', 'B', '2023-06-04 00:00:00', 3),
(1120, 1006, 'Khi bin dch gp li Exception in thread main java.lang.NoClassDefFoundError: myprogram. Li ny c ngh)a g?', 'ng dn chng trnh sai', 'Khng c hm mai', 'Khng khai bo class', 'Khng c t kha public ti m u khai bo class', 'A', '2023-06-04 00:00:00', 3),
(1121, 1006, 'Ngn ng lp trnh Java cung cp cc chc nng no sau y?', 'Tt c p n tr', 'Giao din lp trnh ng dng', 'B cng c giao din ngi dng', 'Th vin tch hp', 'A', '2023-06-04 00:00:00', 3),
(1122, 1006, 'Java chy trn h iu hnh no sau y?', 'Microsoft Windows', 'Linux', 'Sun Solaris OS', 'Tt c cc p n u ng', 'D', '2023-06-04 00:00:00', 3),
(1123, 1006, 'Java Virtual Machine l g?', 'L mt thnh phn ca Java platform dng  c m bytecode trong file .class', 'L chng trnh bin dch ca java dng  bin dch file ngun java thnh m bytecode', 'L chng trnh chy cho java', 'Tt c cc p n u ng', 'A', '2023-06-04 00:00:00', 3),
(1124, 1006, 'Nu phng thc ca bn ghi  mt trong s cc phng thc ca lp cha, bn c th gi phng thc b ghi  thng qua t kha no?', 'parent', 'super', 'this', 'static', 'B', '2023-06-04 00:00:00', 3),
(1125, 1006, 'Pht biu no sau y l ng?', 'Mng c th lu gi cc phn t thuc nhiu kiu d liu khc nhau', 'Ch s ca mng c th s dng kiu s thc (float, double)', 'Biu thc array.length c s dng  tr v s phn t trong mng', 'Mt phn t ca mng khng th truyn vo trong mt phng thc', 'C', '2023-06-04 00:00:00', 3),
(1126, 1006, 'Trong cc khai bo sau u l khai bo khng hp l?', 'int a1```` = new int```3`', 'int a2```` = new int`2``3`', 'int a3```` = new int`2```', 'int a4```` = {{}, {}, {}}', 'A', '2023-06-04 00:00:00', 3),
(1127, 1006, 'C my cch  truyn tham s vo cho mt phng thc?', '2', '1', '3', '4', 'A', '2023-06-04 00:00:00', 3),
(1128, 1006, 'u l khai bo bin hp l?', 'theOne', 'the One', '1the_One', '$the One', 'A', '2023-06-04 00:00:00', 3),
(1129, 1006, 'Vi gi tr no ca x, th biu thc x % 3 == 0 tr v true vi x l kiu s nguyn?', '2', '7', '4', '9', 'D', '2023-06-04 00:00:00', 3),
(1130, 1006, 'Kiu d liu no trong Java cha gi tr bao gm c ch v s?', 'int', 'byte', 'char', 'String', 'D', '2023-06-04 00:00:00', 3),
(1131, 1006, 'i tng trong Java l g?', 'Cc lp c to th hin t ', 'Mt th hin ca lp', 'Mt tham chiu n mt thuc tnh', 'Mt bi', 'B', '2023-06-04 00:00:00', 3),
(1132, 1006, 'u khng phi l thnh phn trong cu trc ca lp trong Java.', 'Tn lp', 'Thuc tnh', 'Phng thc', 'Bi', 'D', '2023-06-04 00:00:00', 3),
(1133, 1006, 'Gi s  nh ngh)a lp XX vi mt phng thc thng thng l Display, sau  sinh ra i tng objX t lp XX.  gi phng thc Display ta s dng c php no?', 'XX.Display ', 'XX.Display() ', 'objX.Display() ', 'Display() ', 'C', '2023-06-04 00:00:00', 3),
(1134, 1006, 'Tn u tin ca Java l g?', 'Java', 'Oak', 'Cafe', 'James golings', 'B', '2023-06-04 00:00:00', 3),
(1135, 1006, 'Gi no trong java cha lp Scanner dng  nhp d liu t bn phm?', 'java.net', 'java.io', 'java.util', 'java.awt', 'C', '2023-06-04 00:00:00', 3),
(1136, 1006, 'u l khai bo ng v lp Cat?', 'interface Cat{}', 'public class Cat{}', 'static Cat{}', 'class public Cat{}', 'B', '2023-06-04 00:00:00', 3),
(1137, 1006, 'Mun chy c chng trnh Java, ch cn ci phn mn no sau y?', 'JDK', 'Java Platform', 'Eclipse', 'Netbeans', 'B', '2023-06-04 00:00:00', 3),
(1138, 1006, 'Phng thc next() ca lp Scanner dng  lm g?', 'Nhp mt chui', 'Nhp mt s nguy', 'Nhp mt k t', 'Khng c phng thc ny', 'A', '2023-06-04 00:00:00', 3),
(1139, 1006, 'Trong cu lnh sau: public static void main(String`` agrs) th phn t agrs`0` cha gi tr g?', 'Tn ca chng trnh', 'S lng tham s', 'Tham s u tin trong danh sch tham s', 'Khng cu no ng', 'C', '2023-06-04 00:00:00', 3),
(1140, 1006, 'u khng phi l mt kiu d liu nguyn thy trong Java?', 'double', 'int', 'long', 'long float', 'D', '2023-06-04 00:00:00', 3),
(1141, 1006, 'Trong Java, kiu d liu no l mt a ch ca i tng hoc mt mng c to ra trong b nh?', 'Kiu primitive', 'Kiu reference', 'Kiu format', 'Khng c p n ng', 'B', '2023-06-04 00:00:00', 3),
(1142, 1006, 'Bin d liu l cc bin dng no sau y?', 'Bin lp v Tham s', 'Bin cc b v Tham s', 'Bin cc b v bin lp', 'Cc p n u sai', 'B', '2023-06-04 00:00:00', 3),
(1143, 1007, 'Thit b hub thng thng nm  tng no ca m hnh OSI?', 'Tng 1', 'Tng 2', 'Tng 3', 'Tt c u sai', 'A', '2023-06-04 00:00:00', 3),
(1144, 1007, 'Thit b Switch thng thng nm  tng no ca m hnh OSI?', 'Tng 1', 'Tng 2', 'Tng 3', 'Tt c u sai', 'B', '2023-06-04 00:00:00', 3),
(1145, 1007, 'Thit b Bridge nm  tng no ca m hnh OSI?', 'Tng 1', 'Tng 2', 'Tng 3', 'Tt c u sai', 'B', '2023-06-04 00:00:00', 3),
(1146, 1007, 'Thit b router c bao nhiu Broadcast domain?', '1 broadcast/1port', '2', '3', '4', 'B', '2023-06-04 00:00:00', 3),
(1147, 1007, 'Thit b Router c bao nhiu collision domain?', '1', '2', '3', '4', 'A', '2023-06-04 00:00:00', 3),
(1148, 1007, 'Cp UTP c th kt ni ti a bao nhiu mt?', '10', '20', '100', '200', 'C', '2023-06-04 00:00:00', 3),
(1149, 1007, 'Cp quang c th kt ni ti a bao nhiu mt?', '1000', '2000', '500', 'Di 500', 'B', '2023-06-04 00:00:00', 3),
(1150, 1007, ' ni Router v my tnh ta phi bm cp kiu no?', 'Thng', 'Cho', 'Kiu no cing c', 'Tt c u sai', 'A', '2023-06-04 00:00:00', 3),
(1151, 1007, 'nh ngh)a giao thc (protocol) l g?', 'L cc tn hiu nh phn truyn i trc khi truyn d liu tht s', 'L c ch  bt tay ba ln  m mi thit b mng u phi thc hin khi khi ng', 'L mt tp cc c t m mi nh sn xut sn phm mng phi da theo  thit k sn phm ca mnh', 'Tt c p n tr', 'A', '2023-06-04 00:00:00', 3),
(1152, 1007, ' kt ni hai HUB vi nhau ta s dng kiu bm cp no?', 'Thng (straight-through)', 'Cho (cross-over)', 'Console', 'Tt c u ng', 'B', '2023-06-04 00:00:00', 3),
(1153, 1007, 'Subnet mask trong mt cng seria ca router l 11111000. S thp phn ca n l g?', '210', '224', '240', '248', 'D', '2023-06-04 00:00:00', 3),
(1154, 1007, 'Chc nng chnh ca router l?', 'Kt ni LAN vi LA', 'Chia nh broadcast domai', 'Tt c u ng', 'Tt c u sai', 'B', '2023-06-04 00:00:00', 3),
(1155, 1007, 'Modem dng ?', 'Giao tip vi mng', 'Truyn d liu i xa', 'Truyn d liu trong mng LA', 'A v B', 'D', '2023-06-04 00:00:00', 3),
(1156, 1007, 'Dch v no cho php ngi s dng t mt trm lm vic ca mnh c th ng nhp vo mt trm  xa qua mng v c th lm vic vi h thng?', 'Telnet', 'Email', 'FTP', 'WWW', 'A', '2023-06-04 00:00:00', 3),
(1157, 1007, 'Pht biu no sau y m t ng nht cho cu hnh Star?', 'Cn t cp hn nhiu so vi cc cu hnh khc', 'Khi cp t ti mt im no  lm ton b mng ngng hot ng', 'Kh ti lp cu hnh hn so vi cc cu hnh khc', 'D kim sot v qun l tp trung', 'D', '2023-06-04 00:00:00', 3),
(1158, 1005, 'Mt h qun tr CSDL khng c chc nng no trong cc chc nng di y?', 'Cung cp mi trng to lp CSDL', 'Cung cp mi trng cp nht v khai thc d liu', 'Cung cp cng c qun l b nh', 'Cung cp cng c kim sot, iu khin truy cp vo CSDL', 'C', '2023-06-05 00:00:00', 3),
(1159, 1005, 'Ngn ng nh ngh)a d liu tht cht l?', 'Ngn ng lp trnh Pascal', 'Ngn ng C', 'Cc k hiu ton hc dng  thc hin cc tnh to', 'H thng cc k hiu  m t CSDL', 'D', '2023-06-05 00:00:00', 3),
(1160, 1005, 'Ngn ng nh ngh)a d liu bao gm cc lnh cho php?', 'm bo tnh c lp d liu', 'Khai bo kiu d liu, cu trc d liu v cc rng buc trn d liu ca CSDL', 'M t cc i tng c lu tr trong CSDL', 'Khai bo kiu d liu ca CSDL', 'B', '2023-06-05 00:00:00', 3),
(1161, 1005, 'Nhng nhim v no di y khng thuc nhim v ca cng c kim sot, iu khin truy cp vo CSDL?', 'Duy tr tnh nht qun ca CSDL', 'Cp nht (thm, sa, xa d liu)', 'Khi phc CSDL khi c s c', 'Pht hin v ngn chn s truy cp khng c php', 'B', '2023-06-05 00:00:00', 3),
(1162, 1005, 'c trng ca mt m hnh d liu?', 'M hnh d liu n gi', 'Biu din d liu n gin v khng cu trc', 'Tnh n nh, tnh n gin, cn phi kim tra d tha , i xng v c c s l thuyt vng chc', 'Ngi s dng c quyn truy nhp ti mi lc, mi ni', 'C', '2023-06-05 00:00:00', 3),
(1163, 1005, 'Lin kt gia cc bng c da trn?', 'Thuc tnh kha', 'Cc thuc tnh trng tn nhau gia cc bng', ' nh ca ngi qun tr h CSDL', ' nh ghp cc bng thnh mt bng c nhiu thuc tnh h', 'A', '2023-06-05 00:00:00', 3),
(1164, 1005, 'SQL l tn vit tt ca?', 'Structure Query Language', 'Query Structure Language', 'Structure Question Language', 'Structure Query Locator', 'A', '2023-06-05 00:00:00', 3),
(1165, 1005, 'Thc th l g?', 'Cc i tng d liu', 'Cc quan h', 'Cc mi lin kt gia cc i tng', 'Cc i tng v mi lin kt gia cc i tng', 'A', '2023-06-05 00:00:00', 3),
(1166, 1005, 'Trong qu trnh cp nht d liu, c h qun tr CSDL kim sot  m bo tnh cht no?', 'Tnh cht rng buc ton v', 'Tnh c lp', 'Tnh nht qu', 'Tnh bo mt', 'C', '2023-06-05 00:00:00', 3),
(1167, 1005, 'Trng kha chnh l thng c gi l g?', 'Single Key', 'Unique Key', 'First Key', 'Primary Key', 'D', '2023-06-05 00:00:00', 3),
(1168, 1005, 'Khng nh no sau y v CSDL quan h l ng?', 'Tp hp cc bng d liu', 'C s d liu c to ra t h QTCSDL Access', 'C s d liu m gia cc d liu c quan h vi nhau', 'C s d liu c xy dng trn m hnh d liu quan h', 'D', '2023-06-05 00:00:00', 3),
(1169, 1005, 'u l cu lnh iu kin trong truy vn CSDL?', 'Select', 'Where', 'Having', 'Like', 'B', '2023-06-05 00:00:00', 3),
(1170, 1005, 'Lnh to database l g?', 'Create Database demo sa', 'Alter Databse', 'Select demo sa', 'Drop Datable', 'B', '2023-06-05 00:00:00', 3),
(1171, 1005, 'Mt h qun tr CSDL khng c chc nng no trong cc chc nng di y?', 'Cung cp mi trng to lp CSDL', 'Cung cp mi trng cp nht v khai thc d liu', 'Cung cp cng c qun l b nh', 'Cung cp cng c kim sot, iu khin truy cp vo CSDL', 'C', '2024-05-14 00:00:00', 3),
(1172, 1005, 'Ngn ng nh ngh)a d liu tht cht l?', 'Ngn ng lp trnh Pascal', 'Ngn ng C', 'Cc k hiu ton hc dng  thc hin cc tnh to', 'H thng cc k hiu  m t CSDL', 'D', '2024-05-14 00:00:00', 3),
(1173, 1005, 'Ngn ng nh ngh)a d liu bao gm cc lnh cho php?', 'm bo tnh c lp d liu', 'Khai bo kiu d liu, cu trc d liu v cc rng buc trn d liu ca CSDL', 'M t cc i tng c lu tr trong CSDL', 'Khai bo kiu d liu ca CSDL', 'B', '2024-05-14 00:00:00', 3),
(1174, 1005, 'Nhng nhim v no di y khng thuc nhim v ca cng c kim sot, iu khin truy cp vo CSDL?', 'Duy tr tnh nht qun ca CSDL', 'Cp nht (thm, sa, xa d liu)', 'Khi phc CSDL khi c s c', 'Pht hin v ngn chn s truy cp khng c php', 'B', '2024-05-14 00:00:00', 3),
(1175, 1005, 'c trng ca mt m hnh d liu?', 'M hnh d liu n gi', 'Biu din d liu n gin v khng cu trc', 'Tnh n nh, tnh n gin, cn phi kim tra d tha , i xng v c c s l thuyt vng chc', 'Ngi s dng c quyn truy nhp ti mi lc, mi ni', 'C', '2024-05-14 00:00:00', 3),
(1176, 1005, 'Lin kt gia cc bng c da trn?', 'Thuc tnh kha', 'Cc thuc tnh trng tn nhau gia cc bng', ' nh ca ngi qun tr h CSDL', ' nh ghp cc bng thnh mt bng c nhiu thuc tnh h', 'A', '2024-05-14 00:00:00', 3),
(1177, 1005, 'SQL l tn vit tt ca?', 'Structure Query Language', 'Query Structure Language', 'Structure Question Language', 'Structure Query Locator', 'A', '2024-05-14 00:00:00', 3),
(1178, 1005, 'Thc th l g?', 'Cc i tng d liu', 'Cc quan h', 'Cc mi lin kt gia cc i tng', 'Cc i tng v mi lin kt gia cc i tng', 'A', '2024-05-14 00:00:00', 3),
(1179, 1005, 'Trong qu trnh cp nht d liu, c h qun tr CSDL kim sot  m bo tnh cht no?', 'Tnh cht rng buc ton v', 'Tnh c lp', 'Tnh nht qu', 'Tnh bo mt', 'C', '2024-05-14 00:00:00', 3),
(1180, 1005, 'Trng kha chnh l thng c gi l g?', 'Single Key', 'Unique Key', 'First Key', 'Primary Key', 'D', '2024-05-14 00:00:00', 3),
(1181, 1005, 'Khng nh no sau y v CSDL quan h l ng?', 'Tp hp cc bng d liu', 'C s d liu c to ra t h QTCSDL Access', 'C s d liu m gia cc d liu c quan h vi nhau', 'C s d liu c xy dng trn m hnh d liu quan h', 'D', '2024-05-14 00:00:00', 3),
(1182, 1005, 'u l cu lnh iu kin trong truy vn CSDL?', 'Select', 'Where', 'Having', 'Like', 'B', '2024-05-14 00:00:00', 3),
(1183, 1006, 'demo cau hoi', 'A', 'B', 'C', 'D', 'C', '2024-05-14 00:00:00', 3),
(1184, 1008, 'fd', 'sfd', 'dsf', 'fds', 'fsd', 'A', '2024-05-14 00:00:00', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rank`
--

DROP TABLE IF EXISTS `rank`;
CREATE TABLE IF NOT EXISTS `rank` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ExamId` int NOT NULL,
  `UserId` int NOT NULL,
  `TimeDoExam` int NOT NULL,
  `Point` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `ExamId` (`ExamId`),
  KEY `UserId` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=1017 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `rank`
--

INSERT INTO `rank` (`Id`, `ExamId`, `UserId`, `TimeDoExam`, `Point`) VALUES
(10, 1, 3, 0, 6),
(1010, 5, 3, 1, 5),
(1011, 6, 3, 1, 4),
(1012, 4, 3, 0, 4),
(1013, 2, 3, 0, 4),
(1015, 5, 8, 1, 8),
(1016, 3, 8, 0, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `Id` int NOT NULL,
  `RoleName` varchar(255) NOT NULL,
  `CreateAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`Id`, `RoleName`, `CreateAt`) VALUES
(1, 'Admi', '2023-05-23 22:16:57'),
(2, 'Khch hng', '2023-05-23 22:17:03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` int NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `CreateAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`Id`, `RoleId`, `FullName`, `UserName`, `Password`, `CreateAt`) VALUES
(3, 1, 'Admi', 'admi', '25d55ad283aa400af464c76d713c07ad', '2023-05-29 19:59:51'),
(4, 2, 'Vn Chi', 'chie', '202cb962ac59075b964b07152d234b70', '2023-06-04 08:59:26'),
(5, 2, 'Vi Hiu', 'vuhieu', '202cb962ac59075b964b07152d234b70', '2023-06-04 20:06:16'),
(6, 2, 'Cng Phc', 'congphuc', '202cb962ac59075b964b07152d234b70', '2023-06-05 10:25:44'),
(7, 2, 'demo', 'demo', 'fe01ce2a7fbac8fafaed7c982a04e229', '2024-05-14 11:36:29'),
(8, 2, 'sinhvie', 'sinhvie', '615ad206666f8086103305b8f77173f4', '2024-05-14 13:29:04');

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `examdetail`
--
ALTER TABLE `examdetail`
  ADD CONSTRAINT `examdetail_ibfk_1` FOREIGN KEY (`ExamId`) REFERENCES `exam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `historydetail`
--
ALTER TABLE `historydetail`
  ADD CONSTRAINT `historydetail_ibfk_1` FOREIGN KEY (`HistoryId`) REFERENCES `history` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `historydetail_ibfk_2` FOREIGN KEY (`QuestionId`) REFERENCES `question` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `rank`
--
ALTER TABLE `rank`
  ADD CONSTRAINT `rank_ibfk_1` FOREIGN KEY (`ExamId`) REFERENCES `exam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `rank_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
