-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.2.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for project
CREATE DATABASE IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `project`;

-- Dumping structure for table project.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `questionId` int(10) NOT NULL AUTO_INCREMENT,
  `questionName` varchar(250) NOT NULL DEFAULT 'Question',
  `option1` varchar(50) NOT NULL DEFAULT 'Option_1',
  `option2` varchar(50) NOT NULL DEFAULT 'Option_2',
  `option3` varchar(50) NOT NULL DEFAULT 'Option_3',
  `option4` varchar(50) NOT NULL DEFAULT 'Option_4',
  `answerNo` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`questionId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- Dumping data for table project.questions: ~32 rows (approximately)
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`questionId`, `questionName`, `option1`, `option2`, `option3`, `option4`, `answerNo`) VALUES
	(1, 'Which is the correct syntax ?', 'int i="A";', 'String s="Hello";', 'private class ABC', 'public class ABC extends QWE extends Student', 1),
	(2, 'Which of the following a is not a keyword in Java ?', 'class', 'interface', 'extends', 'abstraction', 4),
	(3, 'Which of the following a is not a keyword in Java ?', 'class', 'interface', 'extends', 'abstraction', 4),
	(4, 'Which of the following a is not a keyword in Java ?', 'class', 'interface', 'extends', 'abstraction', 4),
	(5, 'Which of the following a is not a keyword in Java ?', 'class', 'interface', 'extends', 'abstraction', 4),
	(6, 'Which is the correct syntax ?', 'int i="A";', 'String s="Hello";', 'private class ABC', 'public class ABC extends QWE extends Student', 1),
	(7, 'Which is the correct syntax ?', 'int i="A";', 'String s="Hello";', 'private class ABC', 'public class ABC extends QWE extends Student', 1),
	(8, 'Which is the correct syntax ?', 'int i="A";', 'String s="Hello";', 'private class ABC', 'public class ABC extends QWE extends Student', 1),
	(9, 'Which is the correct syntax ?', 'int i="A";', 'String s="Hello";', 'private class ABC', 'public class ABC extends QWE extends Student', 1),
	(10, 'Which of the following a is not a keyword in Java ?', 'class', 'interface', 'extends', 'abstraction', 4),
	(11, 'What does SQL stand for?', 'Structured Query Language', 'Strong Question Language', 'Structured Question Language', 'Standard Query Language', 1),
	(12, 'Which SQL statement is used to extract data from a database?', 'OPEN', 'SELECT', 'EXTRACT', 'GET', 2),
	(13, 'Which SQL statement is used to insert new data in a database?', 'ADD RECORD', 'INSERT NEW', 'ADD NEW', 'INSERT INTO', 4),
	(14, 'With SQL, how do you select all the records from a table named "Persons" where the value of the column "FirstName" is "Peter"?', ' SELECT * FROM Persons WHERE FirstName=\'Peter\'', 'SELECT * FROM Persons WHERE FirstName<>\'Peter\'', ' SELECT [all] FROM Persons WHERE FirstName=\'Peter\'', 'SELECT * FROM Persons WHERE FirstName LIKE \'Peter\'', 1),
	(15, 'With SQL, how do you select all the records from a table named "Persons" where the value of the column "FirstName" starts with an "a"?', 'SELECT * FROM Persons WHERE FirstName=\'a\'', ' SELECT * FROM Persons WHERE FirstName LIKE \'a%\'', 'SELECT * FROM Persons WHERE FirstName=\'%a%\'', 'SELECT * FROM Persons WHERE FirstName LIKE \'%a\'', 2),
	(16, 'Which SQL keyword is used to sort the result-set?', 'SORT BY', 'SORT', 'ORDER BY', 'ORDER', 3),
	(17, ' With SQL, how can you return all the records from a table named "Persons" sorted descending by "FirstName"?', 'SELECT * FROM Persons ORDER BY FirstName DESC', 'SELECT * FROM Persons SORT BY \'FirstName\' DESC', 'SELECT * FROM Persons ORDER FirstName DESC', 'SELECT * FROM Persons SORT \'FirstName\' DESC', 1),
	(18, 'ith SQL, how can you delete the records where the "FirstName" is "Peter" in the Persons Table?', 'DELETE ROW FirstName=\'Peter\' FROM Persons', 'DELETE FirstName=\'Peter\' FROM Persons', 'DELETE FROM Persons WHERE FirstName = \'Peter\'', 'DELETE * FROM Persons WHERE FIRSTNAME=\'Peter\'', 3),
	(19, 'With SQL, how can you return the number of records in the "Persons" table?', ' SELECT COUNT(*) FROM Persons', 'SELECT NO(*) FROM Persons', 'SELECT COLUMNS(*) FROM Persons', 'SELECT LEN(*) FROM Persons', 1),
	(20, 'Which SQL statement is used to create a table in a database?', 'CREATE DB', 'CREATE TABLE', 'CREATE DATABASE TABLE', 'CREATE DATABASE TAB', 2),
	(21, 'Which can be an Identifier among them in Python?', '1abc', '$12a', ' _xy1', ' @python', 3),
	(22, 'In the following options which are python libraries which are used for data analysis and scientific computations', 'Numpy', 'Scipy', 'Pandas', 'All the above', 4),
	(23, ' Python is said to be easily', 'readable language', 'writable language', 'bug-able language', 'script-able language', 1),
	(24, 'Python was released publicly in', '1941', '1971', '1981', '1991', 4),
	(25, ' Python is said to be easily', 'readable language', 'writable language', 'bug-able language', 'script-able language', 1),
	(26, 'Python was released publicly in', '1941', '1971', '1981', '1991', 4),
	(27, 'Python was released publicly in', '1941', '1971', '1981', '1991', 4),
	(28, ' Python is said to be easily', 'readable language', 'writable language', 'bug-able language', 'script-able language', 1),
	(29, ' Python is said to be easily', 'readable language', 'writable language', 'bug-able language', 'script-able language', 1),
	(30, 'Which can be an Identifier among them in Python?', '1abc', '$12a', ' _xy1', ' @python', 3),
	(31, 'Which can be an Identifier among them in Python?', '1abc', '$12a', ' _xy1', ' @python', 3),
	(32, 'In the following options which are python libraries which are used for data analysis and scientific computations', 'Numpy', 'Scipy', 'Pandas', 'All the above', 4);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;

-- Dumping structure for table project.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `roleId` int(10) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table project.roles: ~2 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`roleId`, `roleName`) VALUES
	(1, 'STUDENT'),
	(2, 'ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table project.subjectquestionmapping
CREATE TABLE IF NOT EXISTS `subjectquestionmapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subId` int(11) NOT NULL DEFAULT 1,
  `questionId` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `fk1` (`subId`),
  KEY `fk2` (`questionId`),
  CONSTRAINT `fk1` FOREIGN KEY (`subId`) REFERENCES `subjects` (`subId`),
  CONSTRAINT `fk2` FOREIGN KEY (`questionId`) REFERENCES `questions` (`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table project.subjectquestionmapping: ~0 rows (approximately)
/*!40000 ALTER TABLE `subjectquestionmapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjectquestionmapping` ENABLE KEYS */;

-- Dumping structure for table project.subjects
CREATE TABLE IF NOT EXISTS `subjects` (
  `subId` int(10) NOT NULL AUTO_INCREMENT,
  `subName` varchar(50) NOT NULL,
  PRIMARY KEY (`subId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table project.subjects: ~5 rows (approximately)
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` (`subId`, `subName`) VALUES
	(1, 'C++'),
	(2, 'JAVA'),
	(3, 'PYTHON'),
	(4, 'JS'),
	(5, 'SQL');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;

-- Dumping structure for table project.test
CREATE TABLE IF NOT EXISTS `test` (
  `testId` int(10) NOT NULL AUTO_INCREMENT,
  `subId` int(10) NOT NULL,
  `marksScored` int(10) NOT NULL,
  `totalMarks` int(10) NOT NULL DEFAULT 100,
  `userId` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`testId`),
  KEY `contraint_fk_16` (`subId`),
  KEY `FK89` (`userId`),
  CONSTRAINT `FK89` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `contraint_fk_16` FOREIGN KEY (`subId`) REFERENCES `subjects` (`subId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table project.test: ~0 rows (approximately)
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;

-- Dumping structure for table project.users
CREATE TABLE IF NOT EXISTS `users` (
  `userId` int(10) NOT NULL AUTO_INCREMENT,
  `roleId` int(10) NOT NULL DEFAULT 1,
  `userName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `userEmail` varchar(50) NOT NULL,
  `userMobileNo` bigint(13) NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `contraint_fk_4` (`roleId`),
  CONSTRAINT `contraint_fk_4` FOREIGN KEY (`roleId`) REFERENCES `roles` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Dumping data for table project.users: ~7 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`userId`, `roleId`, `userName`, `password`, `userEmail`, `userMobileNo`, `firstName`, `lastName`) VALUES
	(1, 1, 'A M', '12345678', 'a@gmail.com', 8802467991, 'Animesh', 'Mangla'),
	(14, 2, 'Skynet', '11111111', 'as@gmail.com', 324242424, 'Animesh', 'Mangla'),
	(15, 1, 'wqdqdq', '11111111', 'qws@frs.com', 3242424, 'sdd', 'deeew'),
	(16, 1, '3wq', '12345678', 'asd@gmail.com', 231313, 'wed', 'wqddqde'),
	(17, 1, 'wedewdwd', '12345678', 'sq@gmail.com', 2342432424, 'decw', 'wedw'),
	(18, 1, 'AKD', '1234567', 'atul@gmail.com', 999068161, 'akd', 'DKA'),
	(19, 1, '23ed3d3', '1234567', 'sa@gmail.com', 2442343253, 'swdxwd', 'ewdwdw'),
	(20, 1, 'at', '1234567', 'at@at.com', 0, 'Akhi', 'at');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
