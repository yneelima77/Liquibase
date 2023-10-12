package changelogTests;

import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import java.sql.*;

import static org.testng.AssertJUnit.assertEquals;

public class TestChangelog {
    private Connection conn = null;
    private Statement stmt = null;
    private ResultSet rst;

    @BeforeClass
    void setUp() {
        try {
            // Initialize the database connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb", "root", "password");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @AfterClass
    void tearDown() throws SQLException {
        conn.close();
    }

    @Test(priority = 1)
    public void test_personTableExist() throws SQLException {
        // Assertions to validate changesets, for example, assert the existence of tables
        stmt = conn.createStatement();
        rst = stmt.executeQuery("SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'PERSON'");

        // Retrieve the result
        int count = 0;
        if (rst.next()) {
            count = rst.getInt(1);
        }

        // Expected value
        int expectedCount = 1; // Change this to the expected count

        // Assert the result
        assertEquals("Table PERSON should exist in the database", expectedCount, count);
        System.out.println("Person table exists: " + count);
    }

    @Test(priority = 2)
    public void test_InsertIntoPersonExists() throws SQLException {
        stmt = conn.createStatement();
        rst = stmt.executeQuery("DESCRIBE PERSON");

        while (rst.next()) {
            String columnName = rst.getString("Field");
            String columnType = rst.getString("Type");
            String isNullable = rst.getString("Null");
            String key = rst.getString("Key");
            String defaultValue = rst.getString("Default");
            String extra = rst.getString("Extra");

            // Validate column properties
            if ("id".equals(columnName)) {
                // Primary key, integer type, not null
                assert "PRI".equals(key);
                assert "int".equals(columnType);
                assert "NO".equals(isNullable);
            } else if ("name".equals(columnName)) {
                assert "MUL".equals(key);
                assert "varchar(50)".equals(columnType);
                assert "NO".equals(isNullable);
            } else if ("address1".equals(columnName) || "address2".equals(columnName)) {
                assert "varchar(50)".equals(columnType);
                assert "YES".equals(isNullable);
            } else if ("city".equals(columnName)) {
                assert "varchar(30)".equals(columnType);
                assert "YES".equals(isNullable);
            }
        }
    }
    @Test(priority = 4)
    public void test_dataExistenceInPerson() throws SQLException {

    }
    @Test(priority = 3)
    public void test_InsertIntoPersonExist() throws SQLException {
        stmt = conn.createStatement();
        rst = stmt.executeQuery("SHOW procedure status WHERE NAME = 'InsertIntoPerson'");
        rst.next();

        String procedureName = "InsertIntoPerson";
        Assert.assertEquals(rst.getString("name"),procedureName);
    }

    @Test(priority = 4)
    public void test_IndexExist() throws SQLException {
        stmt = conn.createStatement();
        rst = stmt.executeQuery("SELECT * FROM information_schema.statistics \n" +
                "  WHERE table_schema = 'testdb'\n" +
                "  AND table_name = 'person' AND column_name = 'name';");
        rst.next();

        String nameofIndex = "idx_person_name";
        Assert.assertEquals(rst.getString("INDEX_NAME"),nameofIndex);
    }
}
