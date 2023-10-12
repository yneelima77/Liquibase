-- liquibase formatted sql

-- changeset NeelimaYamana:1696359434619-1
CREATE TABLE company (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(50) NOT NULL, address1 VARCHAR(50) NULL, address2 VARCHAR(50) NULL, city VARCHAR(30) NULL, country VARCHAR(2) NULL, CONSTRAINT PK_COMPANY PRIMARY KEY (id));

-- changeset NeelimaYamana:1696359434619-2
CREATE TABLE person (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(50) NOT NULL, address1 VARCHAR(50) NULL, address2 VARCHAR(50) NULL, city VARCHAR(30) NULL, country VARCHAR(2) NULL, CONSTRAINT PK_PERSON PRIMARY KEY (id));

-- changeset NeelimaYamana:1696359434619-3
INSERT INTO company (id, name, address1, address2, city, country) VALUES (1, 'Tom LLC', '123 Sunrise blvd', 'New York', 'New York', 'US');

-- changeset NeelimaYamana:1696359434619-4
INSERT INTO person (id, name, address1, address2, city, country) VALUES (3, 'Tom', '123 Sunrise blvd', 'New York', 'New York', 'US');
INSERT INTO person (id, name, address1, address2, city, country) VALUES (4, 'Tom', '123 Sunrise blvd', 'New York', 'New York', 'US');

