package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Modular class to handle database connectivity for TaskForge.
 * Ensures a single point of configuration for JDBC.
 */
public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/TaskForgeDB";
    private static final String USER = "root";
    private static final String PASSWORD = "password"; // Update before deployment

    /**
     * Establishes and returns a connection to the database.
     */
    public static Connection getConnection() {
        Connection connection = null;
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Database connection successful.");
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Database connection failed: " + e.getMessage());
        }
        return connection;
    }
}
