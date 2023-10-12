--liquibase formatted sql

--changeset NeelimaY:1 labels:test-changeset1 context:test-mysql
--labels: test-changeset1, V1.0
--comment: test person table
create table person (
    id int primary key auto_increment not null,
    name varchar(50) not null,
    address1 varchar(50),
    address2 varchar(50),
    city varchar(30)
);

--rollback DROP TABLE person;


--changeset NeelimaY:4 labels:test-changeset4 context:test-mysql
--labels: test-changeset4, V1.0
--comment: test InsertIntoPerson procedure
    CALL InsertIntoPerson('John Doe', '123 Main St', 'Apt 4B', 'New York');

--rollback DELETE FROM TABLE person WHERE name = 'John Doe';

--changeset NeelimaY:5 labels:test-changeset5 context:test-mysql
--labels: test-changeset5, V1.0
--comment: test InsertIntoPerson procedure
    CALL InsertIntoPerson('Jane Smith', '456 Elm St', NULL, 'Los Angeles');

    CALL InsertIntoPerson('Bob Johnson', '789 Oak St', 'Unit 7', 'Chicago');

    CALL InsertIntoPerson('Alice Brown', '321 Pine St', NULL, 'San Francisco');

    CALL InsertIntoPerson('David Wilson', '555 Maple St', 'Suite 3', 'Miami');


