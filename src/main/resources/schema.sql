DROP TABLE Course_User IF EXISTS;
DROP TABLE users IF EXISTS;
DROP TABLE Announcement IF EXISTS;
DROP TABLE Grade IF EXISTS;
DROP TABLE Assignment IF EXISTS;
DROP TABLE Course IF EXISTS;

DROP TABLE files IF EXISTS;
DROP TABLE folders IF EXISTS;
CREATE TABLE users
(
	id INT auto_increment,
	username VARCHAR(50) NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL,
	phoneNum VARCHAR(50) NOT NULL,
	dateOfBirth DATE NOT NULL,
	typeId INT NOT NULL,
	status VARCHAR(50) NOT NULL,
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

CREATE TABLE folders
(
  id INT auto_increment,
  parentId INT NOT NULL,
  courseId INT not null,
  name VARCHAR NOT NULL,
  createDate Date NULL,
  PRIMARY KEY (id),
  FOREIGN kEY (courseId) REFERENCES Course(CourseID)
);

CREATE TABLE files
(
  id INT auto_increment,
  folderId INT NOT NULL,
  location VARCHAR NOT NULL,
  name VARCHAR NOT NULL,
  createDate Date NULL,
  PRIMARY KEY (id),
  constraint FK_folderId foreign key (folderId) references folders (id)
);