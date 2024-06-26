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
    public String department;
    
    public ArrayList<Integer> professor_idList = new ArrayList<>();
    public ArrayList<String> first_nameList = new ArrayList<>();
    public ArrayList<String> last_nameList = new ArrayList<>();
    public ArrayList<String> departmentList = new ArrayList<>();
    
    public int addRecord () {           // Method add a Record
        try {
            Connection conn = ConnectionUtil.connect();
            
            // 4. Get new id
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(professor_id) + 1 as new_id FROM professor" );
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                professor_id  = rs.getInt("new_id");
            }
            
            // 5. Prepare our INSERT Statement
            pstmt = conn.prepareStatement("INSERT INTO professor VALUES (?,?,?,?)");
            // 6. Supply the statement with values
            pstmt.setInt    (1, professor_id);
            pstmt.setString (2, department);
            pstmt.setString (3, first_name);
            pstmt.setString (4, last_name);
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
            Connection conn = ConnectionUtil.connect();
            
            PreparedStatement pstmt = conn.prepareStatement("UPDATE professor          " +
                                                            "SET    first_name   = ?," + 
                                                            "last_name   = ?," + 
                                                            "department  = ?" + 
                                                            "WHERE  professor_id = ? ");
            // 5. Supply the statement with values
            pstmt.setString (1, first_name);
            pstmt.setString (2, last_name);
            pstmt.setString (3, department);
            pstmt.setInt    (4, professor_id);
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
            Connection conn = ConnectionUtil.connect();
            
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
            Connection conn = ConnectionUtil.connect();
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM professor WHERE professor_id=?");
            // 5. Supply the statement with values
            pstmt.setInt    (1, professor_id);
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            // 7. Get the results
            professor_idList.clear();
            first_nameList.clear();
            last_nameList.clear();
            departmentList.clear();
            while (rs.next()) {
                professor_id  = rs.getInt("professor_id");
                first_name  = rs.getString("first_name");
                last_name    = rs.getString("last_name");
                department    = rs.getString("department");
                
                professor_idList.add(professor_id);
                first_nameList.add(first_name);
                last_nameList.add(last_name);
                departmentList.add(department);
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
    
    public int viewLastNameFilterRecord() {           // Method viewing a  - Getting something
        try {
            Connection conn = ConnectionUtil.connect();
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM professor WHERE last_name = ?");
            // 5. Supply the statement with values
            pstmt.setString    (1, last_name);
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            // 7. Get the results
            professor_idList.clear();
            first_nameList.clear();
            last_nameList.clear();
            departmentList.clear();
            while (rs.next()) {
                professor_id  = rs.getInt("professor_id");
                first_name  = rs.getString("first_name");
                last_name    = rs.getString("last_name");
                department    = rs.getString("department");
                
                professor_idList.add(professor_id);
                first_nameList.add(first_name);
                last_nameList.add(last_name);
                departmentList.add(department);
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
    
    public int viewDepartmentFilterRecord() {           // Method viewing a  - Getting something
        try {
            Connection conn = ConnectionUtil.connect();
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM professor WHERE department = ?");
            // 5. Supply the statement with values
            pstmt.setString    (1, department);
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            // 7. Get the results
            professor_idList.clear();
            first_nameList.clear();
            last_nameList.clear();
            departmentList.clear();
            while (rs.next()) {
                professor_id  = rs.getInt("professor_id");
                first_name  = rs.getString("first_name");
                last_name    = rs.getString("last_name");
                department    = rs.getString("department");
                
                professor_idList.add(professor_id);
                first_nameList.add(first_name);
                last_nameList.add(last_name);
                departmentList.add(department);
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
            Connection conn = ConnectionUtil.connect();
            
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
            departmentList.clear();
            while (rs.next()) {
                professor_id  = rs.getInt("professor_id");
                first_name  = rs.getString("first_name");
                last_name    = rs.getString("last_name");
                department    = rs.getString("department");
                
                professor_idList.add(professor_id);
                first_nameList.add(first_name);
                last_nameList.add(last_name);
                departmentList.add(department);
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
            
            Connection conn = ConnectionUtil.connect();
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM professor");
            // 5. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            // 6. Get the results
            professor_idList.clear();
            first_nameList.clear();
            last_nameList.clear();
            departmentList.clear();
            while (rs.next()) {
                professor_id  = rs.getInt("professor_id");
                first_name  = rs.getString("first_name");
                last_name    = rs.getString("last_name");
                department    = rs.getString("department");
                
                
                professor_idList.add(professor_id);
                first_nameList.add(first_name);
                last_nameList.add(last_name);
                departmentList.add(department);
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
    
    public int loadRecordByRatings(int student_id) {           // Method viewing a  - Getting something
        try {
            
            Connection conn = ConnectionUtil.connect();
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM professor p JOIN ratings r ON p.professor_id = r.professor_id WHERE r.student_id=?");
            pstmt.setInt    (1, student_id);
            // 5. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            // 6. Get the results
            professor_idList.clear();
            first_nameList.clear();
            last_nameList.clear();
            departmentList.clear();
            while (rs.next()) {
                professor_id  = rs.getInt("professor_id");
                first_name  = rs.getString("first_name");
                last_name    = rs.getString("last_name");
                department    = rs.getString("department");
                
                professor_idList.add(professor_id);
                first_nameList.add(first_name);
                last_nameList.add(last_name);
                departmentList.add(department);
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
    
    public int loadRecordByEnrolled(int student_id) {           // Method viewing a  - Getting something
        try {
            Connection conn = ConnectionUtil.connect();
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM professor p JOIN subject sb ON p.professor_id = sb.professor_id JOIN subject_list sl ON sb.subject_id = sl.subject_id WHERE sl.student_id=? AND p.professor_id NOT IN (SELECT r.professor_id FROM ratings r WHERE r.student_id=?)");
            pstmt.setInt    (1, student_id);
            pstmt.setInt    (2, student_id);
            // 5. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            // 6. Get the results
            professor_idList.clear();
            first_nameList.clear();
            last_nameList.clear();
            departmentList.clear();
            while (rs.next()) {
                professor_id  = rs.getInt("professor_id");
                first_name  = rs.getString("first_name");
                last_name    = rs.getString("last_name");
                department    = rs.getString("department");
                
                professor_idList.add(professor_id);
                first_nameList.add(first_name);
                last_nameList.add(last_name);
                departmentList.add(department);
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

