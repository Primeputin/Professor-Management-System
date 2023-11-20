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
            Connection conn = ConnectionUtil.connect();
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
    
    public int modRecord(){
        try{
            Connection conn = ConnectionUtil.connect();
            PreparedStatement pstmt = conn.prepareStatement("UPDATE ratings          " +
                                                            "SET explanation= ?, kindness=?,knowledgability=?,approachability=?,review=?, rate_date=NOW()" +
                                                            "WHERE  student_id = ? "+
                                                            "AND professor_id =?");
            
            pstmt.setInt(1, explanation);
            pstmt.setInt(2, kindness);
            pstmt.setInt(3, knowledgability);
            pstmt.setInt(4, approachability);
            pstmt.setString(5, review);
            pstmt.setInt(6, student_id);
            pstmt.setInt(7, professor_id);
            
            // 6. Execute the SQL Statement
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
            Connection conn = ConnectionUtil.connect();
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
    
    public int viewRecordByScore(int score){
        try{
            Connection conn = ConnectionUtil.connect();
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM ratings WHERE explanation=? OR kindness=? OR knowledgability=? OR approachability=?");
            // 5. Supply the statement with values
            pstmt.setInt    (1, score);
            pstmt.setInt    (2, score);
            pstmt.setInt    (3, score);
            pstmt.setInt    (4, score);
            
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
            Connection conn = ConnectionUtil.connect();
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
            Connection conn = ConnectionUtil.connect();
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
            Connection conn = ConnectionUtil.connect();
            
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

    public static void main(String args[]){
        Rating rate = new Rating();
        rate.viewRecordByScore(10);
        System.out.println(rate.student_idlist.size());
    }
}
    
