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
public class Rating {
    public int professor_id;
    public int student_id;
    
    public int explanation;
    public int kindness;
    public int knowledgability;
    public int approachability;
    public String review;
    public String rate_date;
    
    public ArrayList<Integer> professor_idlist = new ArrayList<>();
    public ArrayList<Integer> student_idlist = new ArrayList<>();
    
    public ArrayList<Integer> explanationlist = new ArrayList<>();
    public ArrayList<Integer> kindnesslist = new ArrayList<>();
    public ArrayList<Integer> knowledgabilitylist = new ArrayList<>();
    public ArrayList<Integer> approachabilitylist = new ArrayList<>();
    public ArrayList<String> reviewlist = new ArrayList<>();
    public ArrayList<String> rate_datelist = new ArrayList<>();
    
    public int addRating(){
        try{
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            
            // 4. Preparing the insert statement
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO ratings(student_id, professor_id, explanation, kindness, knowledgability, approachability, review, rate_date) VALUES (?, ?, ?, ?, ?, ?, ?, NOW())" );
            pstmt.setInt(1, student_id);
            pstmt.setInt(2, professor_id);
            pstmt.setInt(3, explanation);
            pstmt.setInt(4, kindness);
            pstmt.setInt(5, knowledgability);
            pstmt.setInt(6, approachability);
            pstmt.setString(7, review);
            
            
            // 5. Execute statement
            pstmt.executeUpdate();
            
            // 6. Preparing SQL statement for getting the date
            pstmt = conn.prepareStatement("SELECT rate_date FROM ratings WHERE student_id = ? AND professor_id = ?" );
            pstmt.setInt(1, student_id);
            pstmt.setInt(2, professor_id);
            
            
            // 7. Execute Statement
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                rate_date = rs.getString("rate_date");
            }
            
            // 8. Cleanup
            rs.close();
            pstmt.close();
            conn.close();
            return 1;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int viewRecord(){
        try{
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            // 4. Prepare our INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM ratings WHERE student_id=? AND professor_id=?");
            // 5. Supply the statement with values
            pstmt.setInt    (1, student_id);
            pstmt.setInt    (2, professor_id);
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();
            
            // 7. Get the results
            student_idlist.clear();
            professor_idlist.clear();
            explanationlist.clear();
            kindnesslist.clear();
            knowledgabilitylist.clear();
            approachabilitylist.clear();
            reviewlist.clear();
            rate_datelist.clear();
            
            while(rs.next()){
                student_id = rs.getInt("student_id");
                professor_id = rs.getInt("professor_id");
                
                explanation = rs.getInt("explanation");
                kindness = rs.getInt("kindness");
                knowledgability = rs.getInt("knowledgability");
                approachability = rs.getInt("approachability");
                review = rs.getString("review");
                rate_date = rs.getString("rate_date");
                
                student_idlist.add(student_id);
                professor_idlist.add(professor_id);
                
                explanationlist.add(explanation);
                kindnesslist.add(kindness);
                knowledgabilitylist.add(knowledgability);
                approachabilitylist.add(approachability);
                reviewlist.add(review);
                rate_datelist.add(rate_date);
            }
            rs.close();
            pstmt.close();
            conn.close();
            return 1;
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int delRecord (){
        try{
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            
            // 4. Delete Ratings
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM ratings WHERE student_id=? AND professor_id=?");
            pstmt.setInt    (1, student_id);
            pstmt.setInt    (2, professor_id);
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            return 1;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int viewFilterRecordStudent(){
        try{
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            // 4. Prepare our SELECT Statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM ratings WHERE student_id=?");
            // 5. Supply the statement with values
            pstmt.setInt    (1, student_id);
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            student_idlist.clear();
            professor_idlist.clear();
            explanationlist.clear();
            kindnesslist.clear();
            knowledgabilitylist.clear();
            approachabilitylist.clear();
            reviewlist.clear();
            rate_datelist.clear();
            
            while(rs.next()){
                student_id = rs.getInt("student_id");
                professor_id = rs.getInt("professor_id");
                
                explanation = rs.getInt("explanation");
                kindness = rs.getInt("kindness");
                knowledgability = rs.getInt("knowledgability");
                approachability = rs.getInt("approachability");
                review = rs.getString("review");
                rate_date = rs.getString("rate_date");
                
                student_idlist.add(student_id);
                professor_idlist.add(professor_id);
                
                explanationlist.add(explanation);
                kindnesslist.add(kindness);
                knowledgabilitylist.add(knowledgability);
                approachabilitylist.add(approachability);
                reviewlist.add(review);
                rate_datelist.add(rate_date);
            }
            rs.close();
            pstmt.close();
            conn.close();
            return 1;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int viewFilterRecordProf(){
        try{
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            // 4. Prepare our SELECT Statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM ratings WHERE professor_id=?");
            // 5. Supply the statement with values
            pstmt.setInt    (1, professor_id);
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            student_idlist.clear();
            professor_idlist.clear();
            explanationlist.clear();
            kindnesslist.clear();
            knowledgabilitylist.clear();
            approachabilitylist.clear();
            reviewlist.clear();
            rate_datelist.clear();
            
            while(rs.next()){
                student_id = rs.getInt("student_id");
                professor_id = rs.getInt("professor_id");
                
                explanation = rs.getInt("explanation");
                kindness = rs.getInt("kindness");
                knowledgability = rs.getInt("knowledgability");
                approachability = rs.getInt("approachability");
                review = rs.getString("review");
                rate_date = rs.getString("rate_date");
                
                student_idlist.add(student_id);
                professor_idlist.add(professor_id);
                
                explanationlist.add(explanation);
                kindnesslist.add(kindness);
                knowledgabilitylist.add(knowledgability);
                approachabilitylist.add(approachability);
                reviewlist.add(review);
                rate_datelist.add(rate_date);
            }
            rs.close();
            pstmt.close();
            conn.close();
            return 1;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public static void main(String[] args){
        Rating r = new Rating();
        r.student_id = 2;
        r.professor_id = 2;
        //r.explanation = 1;
        //r.kindness = 1;
        //r.knowledgability = 1;
        //r.approachability = 1;
        //r.review = "He's pretty cool";
        
        int result = r.delRecord();
        System.out.println(result);
        
        
        
        
        
    }
}
    
