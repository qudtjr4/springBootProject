DROP TABLE users IF EXISTS;
CREATE TABLE users
(
   id bigint auto_increment,
  username VARCHAR NOT NULL,
  password VARCHAR NOT NULL,
  email VARCHAR NOT NULL,
  address VARCHAR NOT NULL,
  phoneNum bigint NOT NULL,
  dateOfBirth VARCHAR NOT NULL,
  typeId bigint NULL,
  PRIMARY KEY (username)
);