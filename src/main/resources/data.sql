insert into users (id, username, password, email, address, phoneNum, dateOfBirth, typeId, status) values (0, 'admin', '123', 'umedeway0@nationalgeographic.com', '10 Raven Avenue', '241-565-6808', '2020-12-20', 0, true);
insert into users (id, username, password, email, address, phoneNum, dateOfBirth, typeId, status) values (1, 'test', '123', 'umedeway0@nationalgeographic.com', '10 Raven Avenue', '241-565-6808', '2020-12-20', 0, true);
insert into users (id, username, password, email, address, phoneNum, dateOfBirth, typeId, status) values (2, 'min', '123', 'rlogan1@gravatar.com', '06 Pawling Place', '118-490-6237', '2020-12-20', 1, false);
insert into users (id, username, password, email, address, phoneNum, dateOfBirth, typeId, status) values (3, 'Art', 'BXIugWS', 'abahls2@tripod.com', '2937 Fallview Junction', '767-655-6965', '2020-12-20', 1, false);
insert into users (id, username, password, email, address, phoneNum, dateOfBirth, typeId, status) values (4, 'Barnabas', 'JmizrGtecM', 'bbaal3@berkeley.edu', '05290 Porter Plaza', '535-485-2752', '2020-12-20', 0, false);
insert into users (id, username, password, email, address, phoneNum, dateOfBirth, typeId, status) values (5, 'Arvie', 'OXFEbFDD', 'alevi4@washingtonpost.com', '7062 Golf Street', '836-864-7623', '2020-12-20', 1, false);
insert into users (id, username, password, email, address, phoneNum, dateOfBirth, typeId, status) values (6, 'Brose', 'DceBmspf4', 'bmcaneny5@w3.org', '24 Anniversary Parkway', '308-501-9856', '2020-12-20', 0, false);
insert into users (id, username, password, email, address, phoneNum, dateOfBirth, typeId, status) values (7, 'Rhodie', 'D5kpOig', 'rmerigon6@bluehost.com', '7117 Banding Terrace', '691-174-9741', '2020-12-20', 0, false);
insert into users (id, username, password, email, address, phoneNum, dateOfBirth, typeId, status) values (8, 'Marin', 'GfBP2rM', 'mlots7@webeden.co.uk', '7826 Heffernan Pass', '835-933-9589', '2020-12-20', 0, false);
insert into users (id, username, password, email, address, phoneNum, dateOfBirth, typeId, status) values (9, 'Carin', 'JUvtWWx7J', 'cgoodrick8@chicagotribune.com', '65 Logan Hill', '113-930-3412', '2020-12-20', 0, false);
insert into users (id, username, password, email, address, phoneNum, dateOfBirth, typeId, status) values (10, 'Aldus', '1p8cfLYD', 'akuhnert9@joomla.org', '868 Elka Way', '895-167-9597', '2020-12-20', 1, false);
--Insert courses
INSERT INTO course(courseID, courseName, courseShortName, startDate, endDate, folderID) values('1', 'Software Engineering', 'CSIS 3275', '2020-05-04','2020-12-20', 1);
INSERT INTO course(courseID, courseName, courseShortName, startDate, endDate, folderID) values('2', 'Advanced Networking', 'CSIS 3270', '2020-05-05','2020-12-20', 4);
INSERT INTO course(courseID, courseName, courseShortName, startDate, endDate, folderID) values('3', 'Mobile App Development II', 'CSIS 4175', '2020-05-04','2020-12-20', 5);
INSERT INTO course(courseID, courseName, courseShortName, startDate, endDate, folderID) values('4', 'Spec Topics in Web/Mob App Dev', 'CSIS 4280', '2020-05-04','2020-12-20', 6);

--Insert Course_user
INSERT INTO course_user(courseID, username) values(1, 'test');
INSERT INTO course_user(courseID, username) values(2, 'test');
INSERT INTO course_user(courseID, username) values(3, 'test');
INSERT INTO course_user(courseID, username) values(4, 'test');

--Folder
insert into folders values(1,0,'Software Engineering', CURRENT_TIMESTAMP());
insert into folders values(2,1,'Contemt', CURRENT_TIMESTAMP());
insert into folders values(3,1,'Assigment', CURRENT_TIMESTAMP());
insert into folders values(4,0,'Advanced Networking', CURRENT_TIMESTAMP());
insert into folders values(5,0,'Mobile App Development II', CURRENT_TIMESTAMP());
insert into folders values(6,0,'Spec Topics in Web/Mob App Dev', CURRENT_TIMESTAMP());