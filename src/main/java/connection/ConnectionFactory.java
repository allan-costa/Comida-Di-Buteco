package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class ConnectionFactory {

    private static Connection conn = null;

    private static Connection conectar() {
        
    	try {
            String url = "jdbc:derby:banco-de-dados;create=true";
            return DriverManager.getConnection(url);
          

        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }

    }

    public static Connection getConnection(){
        try {
            if (conn == null || conn.isClosed()) {
                conn = conectar();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return conn;
    }

    public static void closeConnection(Connection conn, PreparedStatement ps){
        try {
            ps.close();
            ps = null;
            conn.close();
            conn= null;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void closeConnection(Connection conn, PreparedStatement ps, ResultSet rs){
        try {
            rs.close();
            rs = null;
            ps.close();
            closeConnection(conn, ps);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}
