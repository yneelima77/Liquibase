-- liquibase formatted sql

-- changeset NeelimaYamana:1696272930047-1
CREATE TABLE jpapdppolicydeploymentaudit (ID BIGINT NOT NULL, NAME VARCHAR(120) NOT NULL, VERSION VARCHAR(20) NOT NULL, PDPGROUP VARCHAR(255) NULL, PDPTYPE VARCHAR(255) NULL, ACTION BIGINT NULL, TIMESTAMP timestamp NULL, CHANGEDUSER VARCHAR(55) NULL, PDPSUBGROUP VARCHAR(255) NULL, CONSTRAINT PK_JPAPDPPOLICYDEPLOYMENTAUDIT PRIMARY KEY (ID, NAME, VERSION));

-- changeset NeelimaYamana:1696272930047-2
CREATE TABLE pdpstatistics (ID BIGINT NOT NULL, NAME VARCHAR(120) NOT NULL, VERSION VARCHAR(20) NOT NULL, PDPGROUPNAME VARCHAR(255) NULL, PDPSUBGROUPNAME VARCHAR(255) NULL, POLICYDEPLOYCOUNT BIGINT NULL, POLICYDEPLOYFAILCOUNT BIGINT NULL, POLICYDEPLOYSUCCESSCOUNT BIGINT NULL, POLICYEXECUTEDCOUNT BIGINT NULL, POLICYEXECUTEDFAILCOUNT BIGINT NULL, POLICYEXECUTEDSUCCESSCOUNT BIGINT NULL, TIMESTAMP timestamp NULL);

-- changeset NeelimaYamana:1696272930047-3
CREATE TABLE user (firstname VARCHAR(255) NOT NULL, lastname VARCHAR(255) NOT NULL, `role` VARCHAR(255) NOT NULL, dept_name VARCHAR(255) NOT NULL, user_id INT AUTO_INCREMENT NOT NULL, username VARCHAR(255) NOT NULL, CONSTRAINT PK_USER PRIMARY KEY (user_id), UNIQUE (username));

-- changeset NeelimaYamana:1696272930047-4
INSERT INTO jpapdppolicydeploymentaudit (ID, NAME, VERSION, PDPGROUP, PDPTYPE, ACTION, TIMESTAMP, CHANGEDUSER, PDPSUBGROUP) VALUES (1, 'TestName', '1.0.0', 'TestGroup', 'TestType', 1, '2023-09-28 15:08:15', 'Admin', 'TestSubGroup');

-- changeset NeelimaYamana:1696272930047-5
INSERT INTO user (firstname, lastname, `role`, dept_name, user_id, username) VALUES ('Thompson', 'Smith', 'Manager', 'Sales', 1, 'tsmith@gmail.com');
INSERT INTO user (firstname, lastname, `role`, dept_name, user_id, username) VALUES ('Alice', 'Johnson', 'Engineer', 'Engineering', 2, 'ajohnson@gmail.com');
INSERT INTO user (firstname, lastname, `role`, dept_name, user_id, username) VALUES ('John', 'Doe', 'Analyst', 'Finance', 3, 'jdoe@gmail.com');
INSERT INTO user (firstname, lastname, `role`, dept_name, user_id, username) VALUES ('Emily', 'Wilson', 'Developer', 'IT', 4, 'ewilson@gmail.com');
INSERT INTO user (firstname, lastname, `role`, dept_name, user_id, username) VALUES ('Michael', 'Brown', 'Designer', 'Marketing', 5, 'mbrown@gmail.com');

