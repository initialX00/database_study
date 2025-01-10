
CREATE TABLE `course_registering_information_tb` (
  `course_registering_information_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `instructor_id` int NOT NULL,
  `day` varchar(45) NOT NULL,
  `course_duration_start` date NOT NULL,
  `course_duration_end` date NOT NULL,
  `major_id` int NOT NULL,
  PRIMARY KEY (`course_registering_information_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `course_registering_information_tb` VALUES (1,1,2,'월','2025-01-07','2025-06-06',2),(2,1,2,'목','2025-01-07','2025-06-06',2),(3,1,3,'화','2025-01-07','2025-06-06',2),(4,1,3,'수','2025-01-07','2025-06-06',2),(5,2,1,'월','2025-03-07','2025-08-06',1),(6,2,1,'수','2025-03-07','2025-08-06',1),(7,3,1,'화','2025-02-07','2025-07-06',1),(8,3,1,'금','2025-02-07','2025-07-06',1),(9,4,3,'수','2025-03-07','2025-08-06',2),(10,4,3,'금','2025-03-07','2025-08-06',2);


CREATE TABLE `course_registering_tb` (
  `course_registering_id` int NOT NULL AUTO_INCREMENT,
  `course_registering_information_id` int NOT NULL,
  `student_id` int NOT NULL,
  PRIMARY KEY (`course_registering_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `course_registering_tb` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,2),(6,2,4),(7,3,1),(8,3,3),(9,4,1),(10,4,2),(11,4,3),(12,5,1),(13,5,2),(14,6,1),(15,6,2),(16,6,3);


CREATE TABLE `course_tb` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(45) NOT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_name_UNIQUE` (`course_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `course_tb` VALUES (1,'데이트베이스론'),(2,'알고리즘'),(3,'운영체재'),(4,'자료구조');


CREATE TABLE `courses` (
  `course_name` varchar(255) DEFAULT NULL,
  `instructor` varchar(45) DEFAULT NULL,
  `student_name` varchar(45) DEFAULT NULL,
  `major` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `courses` VALUES ('데이터베이스론','김교수','홍길동','컴퓨터 공헉','남'),('데이터베이스론','김교수','김씨','소프트웨어공학','여'),('데이터베이스론','김교수','서씨','컴퓨터공학','남'),('알고리즘','박교수','최씨','소프트웨어공학','여'),('알고리즘','박교소','주씨','컴퓨터공학','남'),('운영체제','이교수','백씨','컴퓨터공학','남');


CREATE TABLE `instructor_tb` (
  `instructor_id` int NOT NULL AUTO_INCREMENT,
  `instructor_name` varchar(45) NOT NULL,
  PRIMARY KEY (`instructor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `instructor_tb` VALUES (1,'김교수'),(2,'박교수'),(3,'이교수');


CREATE TABLE `major_tb` (
  `major_id` int NOT NULL AUTO_INCREMENT,
  `major_name` varchar(45) NOT NULL,
  PRIMARY KEY (`major_id`),
  UNIQUE KEY `major_name_UNIQUE` (`major_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `major_tb` VALUES (2,'소프트웨어공학과'),(1,'컴퓨터공학과');


CREATE TABLE `student_tb` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `student_name` varchar(45) NOT NULL,
  `student_year` int NOT NULL,
  `gender` varchar(45) NOT NULL,
  `major_id` int NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `student_tb` VALUES (1,'최석현',3,'남',1),(2,'백진우',4,'남',1),(3,'박소율',3,'여',2),(4,'정현영',4,'여',1);


