DROP TABLE Course_User IF EXISTS;
DROP TABLE users IF EXISTS;
DROP TABLE Announcement IF EXISTS;
DROP TABLE Grade IF EXISTS;
DROP TABLE Assignment IF EXISTS;
DROP TABLE Course IF EXISTS;

CREATE TABLE users
(
   id bigint auto_increment,
  username VARCHAR NOT NULL,
  password VARCHAR NOT NULL,
  email VARCHAR NOT NULL,
  address VARCHAR NOT NULL,
  phoneNum bigint NOT NULL,
  dateOfBirth VARCHAR NOT NULL,
  userType VARCHAR NULL,
  PRIMARY KEY (username)
);

CREATE TABLE Course
(
  courseID VARCHAR NOT NULL,
  courseName VARCHAR NOT NULL,
  courseShortName VARCHAR NOT NULL,
  startDate DATE NOT NULL,
  endDate DATE NOT NULL,
  PRIMARY KEY (courseID)
);

CREATE TABLE Announcement
(
  announcementID VARCHAR NOT NULL,
  title VARCHAR NOT NULL,
  content VARCHAR NOT NULL,
  dateCreated DATE NOT NULL,
  courseID VARCHAR NOT NULL,
  PRIMARY KEY (announcementID),
  FOREIGN KEY (courseID) REFERENCES Course(courseID)
);

CREATE TABLE Assignment
(
  assignmentID VARCHAR NOT NULL,
  assignmentName VARCHAR NOT NULL,
  createdDate DATE NOT NULL,
  dueDate DATE NOT NULL,
  courseID VARCHAR NOT NULL,
  PRIMARY KEY (assignmentID),
  FOREIGN KEY (courseID) REFERENCES Course(courseID)
);

CREATE TABLE Grade
(
  gradeID VARCHAR NOT NULL,
  markAchieved DOUBLE NOT NULL,
  totalMarks DOUBLE NOT NULL,
  percentage INT NOT NULL,
  assignmentID VARCHAR NOT NULL,
  PRIMARY KEY (gradeID),
  FOREIGN KEY (assignmentID) REFERENCES Assignment(assignmentID)
);

CREATE TABLE Course_User
(
  courseID VARCHAR NOT NULL,
  username VARCHAR NOT NULL,
  FOREIGN KEY (courseID) REFERENCES Course(courseID),
  FOREIGN KEY (username) REFERENCES Users(username)
);