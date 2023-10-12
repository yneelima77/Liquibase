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
    void setUp() throws SQLException {
        try {
            // Initialize the database connection
            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/testdb", "root", "password");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @AfterClass
    void tearDown() throws SQLException {
        conn.close();

    }

    @Test(priority = 1)
    private void test_test1TableExists() throws SQLException {
        stmt = conn.createStatement();
        rst = stmt.executeQuery("SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'test1'");

        int count = 0;
        if (rst.next()) {
            count = rst.getInt(1);
        }
        // Expected value
        int expectedCount = 1; // Change this to the expected count

        // Assert the result
        assertEquals("Table PERSON should exist in the database", expectedCount, count);
        System.out.println("test1 table exists: " + count);
    }

    @Test(priority = 2)
    private void test_metadata() throws SQLException {
        stmt = conn.createStatement();
        rst = stmt.executeQuery("DESCRIBE test1");

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
                assert "varchar(255)".equals(columnType);
                assert "YES".equals(isNullable);
            }
        }
    }

    @Test(priority = 3)
    private void test_test1DataExists() throws SQLException {

        String query = "SELECT COUNT(*) FROM TEST1";
        try {
            PreparedStatement preStmt = conn.prepareStatement(query);
            rst = preStmt.executeQuery();
            rst.next();
            int count = rst.getInt(1);
            if (count > 0) {
                System.out.println("Data exists in the table.");
            } else {
                System.out.println("Data does not exist in the table.");
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
