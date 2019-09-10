import java.sql.*;


public class SqliteNativeClient {
    public static void main(String[] args) throws Exception {
        try
        {
            Class.forName("org.sqlite.JDBC");
        } catch (ClassNotFoundException cnfe) {
            throw new SQLException(cnfe);
        }

        String url = "jdbc:sqlite:test.db";
        Connection conn = DriverManager.getConnection(url);
        conn.setAutoCommit(true);
        System.out.println("GREAT SUCCESS");
    }
}
