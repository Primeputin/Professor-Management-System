package profmanagement;

import java.sql.DriverManager;
import java.sql.Connection;

/**
 * @author hans
 */
public class ConnectionUtil {
   
    
    public static Connection connect() {
        
        String port = "3306";
        String user = "root";
        String password = "12345678";
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:" + port  + "/db_app?useSSL=false&useTimezone=true&serverTimezone=UTC&user=" + user + "&password=" + password);   
            System.out.println("Connection Success!");
            return conn;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
}
