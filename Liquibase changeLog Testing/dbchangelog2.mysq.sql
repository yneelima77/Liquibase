-- liquibase formatted sql

-- changeset NeelimaYamana:1695409740571-1
CREATE TABLE jpapdppolicydeploymentaudit (ID BIGINT NOT NULL, NAME VARCHAR(120) NOT NULL, VERSION VARCHAR(20) NOT NULL, PDPGROUP VARCHAR(255) NULL, PDPTYPE VARCHAR(255) NULL, ACTION BIGINT NULL, TIMESTAMP datetime NULL, CHANGEDBYUSER VARCHAR(255) NULL, CONSTRAINT PK_JPAPDPPOLICYDEPLOYMENTAUDIT PRIMARY KEY (ID, NAME, VERSION));

-- changeset NeelimaYamana:1695409740571-2
CREATE TABLE pdpstatistics (ID BIGINT NOT NULL, NAME VARCHAR(120) NOT NULL, VERSION VARCHAR(20) NOT NULL, PDPGROUPNAME VARCHAR(255) NULL, PDPSUBGROUPNAME VARCHAR(255) NULL, POLICYDEPLOYCOUNT BIGINT NULL, POLICYDEPLOYFAILCOUNT BIGINT NULL, POLICYDEPLOYSUCCESSCOUNT BIGINT NULL, POLICYEXECUTEDCOUNT BIGINT NULL, POLICYEXECUTEDFAILCOUNT BIGINT NULL, POLICYEXECUTEDSUCCESSCOUNT BIGINT NULL, TIMESTAMP datetime NULL);

-- changeset NeelimaYamana:1695409740571-3
INSERT INTO jpapdppolicydeploymentaudit (ID, NAME, VERSION, PDPGROUP, PDPTYPE, ACTION, TIMESTAMP, CHANGEDBYUSER) VALUES (1, 'TestName', '1.0.0', 'TestGroup', 'TestType', 1, '2023-09-22T13:25:21', 'Admin');
INSERT INTO jpapdppolicydeploymentaudit (ID, NAME, VERSION, PDPGROUP, PDPTYPE, ACTION, TIMESTAMP, CHANGEDBYUSER) VALUES (2, 'TestName2', '1.0.0', 'TestGroup2', 'TestType2', 1, '2023-09-22T13:25:21', 'Admin');

-- changeset NeelimaYamana:1695409740571-4
INSERT INTO pdpstatistics (ID, NAME, VERSION, PDPGROUPNAME, PDPSUBGROUPNAME, POLICYDEPLOYCOUNT, POLICYDEPLOYFAILCOUNT, POLICYDEPLOYSUCCESSCOUNT, POLICYEXECUTEDCOUNT, POLICYEXECUTEDFAILCOUNT, POLICYEXECUTEDSUCCESSCOUNT, TIMESTAMP) VALUES (3, 'TestName', '1.0.0', 'TestGroup', 'TestSubGroup', 1, 1, 1, 1, 1, 1, '2023-09-21T15:56:14');

