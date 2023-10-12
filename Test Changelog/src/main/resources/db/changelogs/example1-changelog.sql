--liquibase formatted sql

--changeset Neelima.Yamana:1 labels:test-changeset1 context:test-mysql
--comment: first test
create table person (
    id int primary key auto_increment not null,
    name varchar(50) not null,
    address1 varchar(50),
    address2 varchar(50),
    city varchar(30)
)

--rollback DROP TABLE person;

--changeset Neelima.Yamana:2 labels:test-changeset2 context:test-mysql
--comment: second test
create table company (
    id int primary key auto_increment not null,
    name varchar(50) not null,
    address1 varchar(50),
    address2 varchar(50),
    city varchar(30)
)
--rollback DROP TABLE company;

--changeset Neelima.Yamana:3 labels:test-changeset3 context:test-mysql
--comment: third test
alter table person add column country varchar(2)
--rollback ALTER TABLE person DROP COLUMN country;


--changeset Neelima.Yamana:5 labels:test-changeset5 context:test-mysql
--comment: fifth test

INSERT INTO Person (name, address1, address2, city, country)
VALUES ('Tom', "123 Sunrise blvd", 'New York', 'New York','US')
--rollback DELETE FROM Person WHERE name = 'Tom';


--changeset Neelima.Yamana:6 labels:test-changeset6 context:test-mysql
--comment: 6th test
INSERT INTO company (name, address1, address2, city)
VALUES ('Tom LLC', "123 Sunrise blvd", 'New York', 'New York')
--rollback DELETE FROM Person WHERE name = 'Tom LLC';

--changeset Neelima.Yamana:7 labels:test-changeset7 context:test-mysql
--comment: 7th test
ALTER TABLE company ADD COLUMN country VARCHAR(2)
--rollback ALTER TABLE company DROP COLUMN country;

--changeset Neelima.Yamana:8 labels:test-changeset8 context:test-mysql
--comment: 8th test
UPDATE company
SET country = 'US' WHERE name = 'Tom LLC'
--rollback DELETE FROM company WHERE name = 'Tom LLC';

--changeset Neelima.Yamana:9 labels:test-changeset9 context:test-mysql
--comment: 9th test
ALTER TABLE Person
M
--rollback DELETE FROM company WHERE name = 'Tom LLC';





