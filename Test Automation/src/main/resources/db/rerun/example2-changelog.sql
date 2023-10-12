--liquibase formatted sql

--changeset NeelimaY:3 labels:test-changeset3
--labels:test-changeset3, V1.1
--context:test-mysql
--comment: test stored procedure
CREATE PROCEDURE InsertIntoPerson(
    IN p_name VARCHAR(50),
    IN p_address1 VARCHAR(50),
    IN p_address2 VARCHAR(50),
    IN p_city VARCHAR(30)
)
BEGIN
    -- Insert data into the "Person" table
    INSERT INTO Person (name, address1, address2, city)
    VALUES (p_name, p_address1, p_address2, p_city);

    -- Print a message indicating a successful insert
    SELECT 'Data inserted into Person table successfully' AS Message;
END;

--rollback DROP PROCEDURE InsertIntoPerson;