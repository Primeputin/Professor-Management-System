/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package profmanagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

/**
 *
 * @author Lars
 */
public class RatingRef {
    public int score;
    public String equivalent;
    
    
    public HashMap<Integer, String> equivalentList = new HashMap<>();
    
    public int increaseMax(){
        try {
            Connection conn = ConnectionUtil.connect();

            // 5. Prepare our INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO ratings_ref VALUES (?,?)");
            // 6. Supply the statement with values
            pstmt.setInt    (1, score);
            pstmt.setString (2, equivalent);
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
    
    public int modRecord(){
        try {
            Connection conn = ConnectionUtil.connect();
            
            PreparedStatement pstmt = conn.prepareStatement("UPDATE ratings_ref " +
                                                            "SET equivalent = ? " +
                                                            "WHERE  score = ?");
            // 5. Supply the statement with values
            
            pstmt.setInt    (2, score);
            pstmt.setString (1,equivalent);
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
    
    public int viewRecord(){
        try{
            Connection conn = ConnectionUtil.connect();
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM ratings_ref WHERE score=?");
            // 5. Supply the statement with values
            pstmt.setInt    (1, score);
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();
            
            // 7. Get the results
            equivalentList.clear();
            
            while(rs.next()){
                score = rs.getInt("score");
                equivalent = rs.getString("equivalent");
                
                equivalentList.put(score, equivalent);
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
    
    public int viewRecordAll(){
        try{
            Connection conn = ConnectionUtil.connect();
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM ratings_ref");
            // 5. Supply the statement with values
            pstmt.setInt    (1, score);
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();
            
            // 7. Get the results
            equivalentList.clear();
            
            while(rs.next()){
                score = rs.getInt("score");
                equivalent = rs.getString("equivalent");
                
                equivalentList.put(score, equivalent);
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
    
    public int delRecord(){
        try{
            Connection conn = ConnectionUtil.connect();
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM ratings_ref WHERE score=?");
            pstmt.setInt    (1, score);
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            return 1;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public static void main(String[] args){
        RatingRef boi = new RatingRef();
        
        boi.score = 10;
        boi.equivalent = "bust";
        
        boi.increaseMax();
        
    }
}
