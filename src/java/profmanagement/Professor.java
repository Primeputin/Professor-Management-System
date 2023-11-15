/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package profmanagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ccslearner
 */
public class Professor {
    public int professor_id;
    public String first_name;
    public String last_name;
    
    public ArrayList<Integer> professor_idList = new ArrayList<>();
    public ArrayList<String> first_nameList = new ArrayList<>();
    public ArrayList<String> last_nameList = new ArrayList<>();
    
    public int addRecord () {           // Method add a Record
        try {
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            
            // 4. Get new id
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(professor_id) + 1 as new_id FROM professor" );
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                professor_id  = rs.getInt("new_id");
            }
            
            // 5. Prepare our INSERT Statement
            pstmt = conn.prepareStatement("INSERT INTO professor VALUES (?,?,?)");
            // 6. Supply the statement with values
            pstmt.setInt    (1, professor_id);
            pstmt.setString (2, first_name);
            pstmt.setString    (3, last_name);
            // 7. Execute the SQL Statement
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int modRecord () {           // Method modify a Record
        
        try {
            // 1. Instantiate a connection variable
            Connection conn;     
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            // 4. Prepare our INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("UPDATE professor          " +
                                                            "SET    first_name   = ?," + 
                                                            "last_name   = ? " + 
                                                            "WHERE  professor_id = ? ");
            // 5. Supply the statement with values
            pstmt.setString (1, first_name);
            pstmt.setString (2, last_name);
            pstmt.setInt    (3, professor_id);
            // 6. Execute the SQL Statement
            pstmt.executeUpdate();   
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());  
            return 0;
        } 
    }

    public int delRecord () {           // Method delete a Record
        try {
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            
            // get all subjects handled by the professor
            ArrayList<Integer> subject_idList = new ArrayList<>();
            PreparedStatement pstmt = conn.prepareStatement("SELECT subject_id FROM subject WHERE professor_id=?");
            pstmt.setInt    (1, professor_id);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                subject_idList.add(rs.getInt("subject_id"));
   
            }
            rs.close();
            
//             delete all subject list handled by the professor
            for (int i = 0; i < subject_idList.size(); i++)
            {
                pstmt = conn.prepareStatement("DELETE FROM subject_list WHERE subject_id=?");
                pstmt.setInt    (1, subject_idList.get(i));
                pstmt.executeUpdate();
            }
            
            // delete subject table corresponding to the professor
            pstmt = conn.prepareStatement("DELETE FROM subject WHERE professor_id=?");
            pstmt.setInt    (1, professor_id);
            pstmt.executeUpdate();
            
            // delete rating table corresponding to the professor
            pstmt = conn.prepareStatement("DELETE FROM ratings WHERE professor_id=?");
            pstmt.setInt    (1, professor_id);
            pstmt.executeUpdate();
            
            // delete professor
            pstmt = conn.prepareStatement("DELETE FROM professor WHERE professor_id=?");
            pstmt.setInt    (1, professor_id);

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int viewRecord() {           // Method viewing a  - Getting something
        try {
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            // 4. Prepare our INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM professor WHERE professor_id=?");
            // 5. Supply the statement with values
            pstmt.setInt    (1, professor_id);
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            // 7. Get the results
            professor_idList.clear();
            first_nameList.clear();
            last_nameList.clear();
            while (rs.next()) {
                professor_id  = rs.getInt("professor_id");
                first_name  = rs.getString("first_name");
                last_name    = rs.getString("last_name");
                
                professor_idList.add(professor_id);
                first_nameList.add(first_name);
                last_nameList.add(last_name);
            }
            rs.close();
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int viewFilterRecord() {           // Method viewing a  - Getting something
        try {
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            // 4. Prepare our INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM professor WHERE first_name = ? AND last_name = ?");
            // 5. Supply the statement with values
            pstmt.setString    (1, first_name);
            pstmt.setString    (2, last_name);
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            // 7. Get the results
            professor_idList.clear();
            first_nameList.clear();
            last_nameList.clear();
            while (rs.next()) {
                professor_id  = rs.getInt("professor_id");
                first_name  = rs.getString("first_name");
                last_name    = rs.getString("last_name");
                
                professor_idList.add(professor_id);
                first_nameList.add(first_name);
                last_nameList.add(last_name);
            }
            rs.close();
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int loadRecord() {           // Method viewing a  - Getting something
        try {
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            // 4. Prepare our INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM professor");
            // 5. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            // 6. Get the results
            professor_idList.clear();
            first_nameList.clear();
            last_nameList.clear();
            while (rs.next()) {
                professor_id  = rs.getInt("professor_id");
                first_name  = rs.getString("first_name");
                last_name    = rs.getString("last_name");
                
                professor_idList.add(professor_id);
                first_nameList.add(first_name);
                last_nameList.add(last_name);
            }
            rs.close();
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
  
}

