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
public class Subject {
    public int subject_id;
    public String subject_name;
    public int units;
    public int professor_id;
    public int subject_year;
    public int term;


    public ArrayList<Integer> subject_idList = new ArrayList<>();
    public ArrayList<String> subject_nameList = new ArrayList<>();
    public ArrayList<Integer> unitsList = new ArrayList<>();
    public ArrayList<Integer> professor_idList = new ArrayList<>();
    public ArrayList<Integer> subject_yearList = new ArrayList<>();
    public ArrayList<Integer> termList = new ArrayList<>();


    public int addRecord() {
        try {
             // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");

            // Get new subject_id
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(subject_id) + 1 as new_id FROM subject");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                subject_id = rs.getInt("new_id");
            }

            pstmt = conn.prepareStatement("INSERT INTO subject VALUES (?,?,?,?,?,?)");
            pstmt.setInt(1, subject_id);
            pstmt.setString(2, subject_name);
            pstmt.setInt(3, units);
            pstmt.setInt(4, professor_id);
            pstmt.setInt(5, subject_year);
            pstmt.setInt(6, term);


            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int modRecord() {
        try {
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");

            PreparedStatement pstmt = conn.prepareStatement("UPDATE subject " +
                                                            "SET subject_name = ?," +
                                                            "    units = ?," +
                                                            "    professor_id = ?," +
                                                            "    subject_year = ?," +
                                                            "    term = ? " +
                                                            "WHERE subject_id = ?");
            pstmt.setString(1, subject_name);
            pstmt.setInt(2, units);
            pstmt.setInt(3, professor_id);
            pstmt.setInt(4, subject_year);
            pstmt.setInt(5, term);

            pstmt.setInt(6, subject_id);

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int delRecord() {
        try {
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
                
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM subject_list WHERE subject_id = ?");
            pstmt.setInt(1, subject_id);
            pstmt.executeUpdate();
            
            pstmt = conn.prepareStatement("DELETE FROM subject WHERE subject_id = ?");
            pstmt.setInt(1, subject_id);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int viewRecord() {
        try {
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");

            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM subject WHERE subject_id = ?");
            pstmt.setInt(1, subject_id);
            ResultSet rs = pstmt.executeQuery();

            subject_idList.clear();
            subject_nameList.clear();
            unitsList.clear();
            professor_idList.clear();
            subject_yearList.clear();
            termList.clear();

            while (rs.next()) {
                subject_id = rs.getInt("subject_id");
                subject_name = rs.getString("subject_name");
                units = rs.getInt("units");
                professor_id = rs.getInt("professor_id");
                subject_year = rs.getInt("subject_year");
                term = rs.getInt("term");


                subject_idList.add(subject_id);
                subject_nameList.add(subject_name);
                unitsList.add(units);
                professor_idList.add(professor_id);
                subject_yearList.add(subject_year);
                termList.add(term);
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
    
    public ArrayList<String> getDistinctPrefixes() {
        ArrayList<String> prefixes = new ArrayList<>();
        try {
            // Establish a database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            // Prepare the SELECT statement to retrieve unique prefixes
            PreparedStatement pstmt = conn.prepareStatement("SELECT DISTINCT SUBSTRING(subject_name, 1, 2) as prefix FROM subject");

            // Execute the query and process the results
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                prefixes.add(rs.getString("prefix"));
            }

            // Close resources
            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return prefixes;
    }

    public int viewFilterRecord(String prefix) {
        try {
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");

            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM subject WHERE LEFT(subject_name, 2) = ?");
            pstmt.setString(1, prefix);
            ResultSet rs = pstmt.executeQuery();

            subject_idList.clear();
            subject_nameList.clear();
            unitsList.clear();
            professor_idList.clear();
            subject_yearList.clear();
            termList.clear();
            
            while (rs.next()) {
                subject_id = rs.getInt("subject_id");
                subject_name = rs.getString("subject_name");
                units = rs.getInt("units");
                professor_id = rs.getInt("professor_id");
                subject_year = rs.getInt("subject_year");
                term = rs.getInt("term");


                subject_idList.add(subject_id);
                subject_nameList.add(subject_name);
                unitsList.add(units);
                professor_idList.add(professor_id);
                subject_yearList.add(subject_year);
                termList.add(term);
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

    public int loadRecord() {
        try {
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");

            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM subject");
            ResultSet rs = pstmt.executeQuery();

            subject_idList.clear();
            subject_nameList.clear();
            unitsList.clear();
            professor_idList.clear();
            subject_yearList.clear();
            termList.clear();


            while (rs.next()) {
                subject_id = rs.getInt("subject_id");
                subject_name = rs.getString("subject_name");
                units = rs.getInt("units");
                professor_id = rs.getInt("professor_id");
                subject_year = rs.getInt("subject_year");
                term = rs.getInt("term");


                subject_idList.add(subject_id);
                subject_nameList.add(subject_name);
                unitsList.add(units);
                professor_idList.add(professor_id);
                subject_yearList.add(subject_year);
                termList.add(term);
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


