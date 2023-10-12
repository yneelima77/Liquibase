@echo off
setlocal enabledelayedexpansion

REM Set database connection parameters for your test database
set DB_URL=jdbc:mysql://localhost:3306/testdb
set DB_USERNAME=root
set DB_PASSWORD=password

REM Set the JDBC driver class
set JDBC_DRIVER=com.mysql.cj.jdbc.Driver

REM Set the path to your Liquibase changelog file
set CHANGELOG_FILE=example1-changelog.sql

REM Liquibase command to apply the changeset
echo Running Liquibase update...
liquibase.bat --driver=com.mysql.cj.jdbc.Driver --url=jdbc:mysql://localhost:3306/testdb --username=root --password=password --changeLogFile=example1-changelog.sql update
echo Liquibase update completed.
