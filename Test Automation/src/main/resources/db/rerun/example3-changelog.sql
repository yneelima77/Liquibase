--liquibase formatted sql

--changeset NeelimaY:6 labels:test-changeset6, V2.0 context:test-mysql
--comment: test index on person name
CREATE INDEX idx_person_name ON person (name);

--rollback DROP INDEX idx_person_name;