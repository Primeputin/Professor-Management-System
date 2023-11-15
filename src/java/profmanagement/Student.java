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
public class Student {
    public int student_id;
    public String first_name;
    public String last_name;
    public float gpa;
    public int cur_year;
    
    public ArrayList<Integer> student_idList = new ArrayList<>();
    public ArrayList<String> first_nameList = new ArrayList<>();
    public ArrayList<String> last_nameList = new ArrayList<>();
    public ArrayList<Float> gpaList = new ArrayList<>();
    public ArrayList<Integer> cur_yearList = new ArrayList<>();
    
    public int addRecord () {           // Method add a Record
        try {
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            
            // 4. Get new id
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(student_id) + 1 as new_id FROM student" );
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                student_id  = rs.getInt("new_id");
            }
            
            // 5. Prepare our INSERT Statement
            pstmt = conn.prepareStatement("INSERT INTO student VALUES (?,?,?,?,?)");
            // 6. Supply the statement with values
            pstmt.setInt    (1, student_id);
            pstmt.setString (2, first_name);
            pstmt.setString    (3, last_name);
            pstmt.setFloat    (4, gpa);
            pstmt.setInt    (5, cur_year);
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
            PreparedStatement pstmt = conn.prepareStatement("UPDATE student          " +
                                                            "SET    first_name   = ?," + 
                                                            "last_name   = ?," + 
                                                            "gpa   = ?," + 
                                                            "cur_year = ? " +
                                                            "WHERE  student_id = ? ");
            // 5. Supply the statement with values
            pstmt.setString (1, first_name);
            pstmt.setString (2, last_name);
            pstmt.setFloat (3, gpa);
            pstmt.setInt (4, cur_year);
            pstmt.setInt    (5, student_id);
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
            
            // delete rating corresponding to the student
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM ratings WHERE student_id=?");
            pstmt.setInt    (1, student_id);
            pstmt.executeUpdate();
            
            // delete professor
            pstmt = conn.prepareStatement("DELETE FROM student WHERE student_id=?");
            pstmt.setInt    (1, student_id);
            
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
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM student WHERE student_id=?");
            // 5. Supply the statement with values
            pstmt.setInt    (1, student_id);
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            // 7. Get the results
            student_idList.clear();
            first_nameList.clear();
            last_nameList.clear();
            gpaList.clear();
            cur_yearList.clear();
            while (rs.next()) {
                student_id  = rs.getInt("student_id");
                first_name  = rs.getString("first_name");
                last_name    = rs.getString("last_name");
                gpa    = rs.getFloat("gpa");
                cur_year    = rs.getInt("cur_year");
                
                student_idList.add(student_id);
                first_nameList.add(first_name);
                last_nameList.add(last_name);
                gpaList.add(gpa);
                cur_yearList.add(cur_year);
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
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM student WHERE first_name = ? AND last_name = ?");
            // 5. Supply the statement with values
            pstmt.setString    (1, first_name);
            pstmt.setString    (2, last_name);
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            // 7. Get the results
            student_idList.clear();
            first_nameList.clear();
            last_nameList.clear();
            while (rs.next()) {
                student_id  = rs.getInt("student_id");
                first_name  = rs.getString("first_name");
                last_name    = rs.getString("last_name");
                
                student_idList.add(student_id);
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
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM student");
            // 5. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            // 6. Get the results
            student_idList.clear();
            first_nameList.clear();
            last_nameList.clear();
            while (rs.next()) {
                student_id  = rs.getInt("student_id");
                first_name  = rs.getString("first_name");
                last_name    = rs.getString("last_name");
                
                student_idList.add(student_id);
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


