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
public class Ranking {
    
    public int subject_id;
    public String year;
    
    public ArrayList<Integer> professor_idList = new ArrayList<>();
    public ArrayList<String> first_nameList = new ArrayList<>();
    public ArrayList<String> last_nameList = new ArrayList<>();
    public ArrayList<Double> total_avgList = new ArrayList<>();
    
    
    public int showRanking()
    {
        try {
            // 1. Instantiate a connection variable
            Connection conn;
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            // 4. Prepare our INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT professor.professor_id, professor.first_name, professor.last_name, AVG((explanation + kindness +  knowledgability + approachability)) AS total_avg_rate " +
                                                                                    "FROM ratings JOIN student ON ratings.student_id = student.student_id " +
                                                                                    "			 JOIN subject_list ON student.student_id = subject_list.student_id " +
                                                                                    "             JOIN subject ON subject_list.subject_id = subject.subject_id " +
                                                                                    "             JOIN professor ON subject.professor_id = professor.professor_id"  +
                                                                                    "             WHERE subject.subject_year = ? AND subject.subject_id = ? " +
                                                                                    "GROUP BY professor.professor_id " +
                                                                                    "ORDER BY total_avg_rate DESC");
            // 5. Supply the statement with values
            pstmt.setString(1, year);
            pstmt.setInt(2, subject_id);
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            // 7. Get the results
            professor_idList.clear();
            first_nameList.clear();
            last_nameList.clear();
            total_avgList.clear();
            while (rs.next()) {
                professor_idList.add(rs.getInt("professor_id"));
                first_nameList.add(rs.getString("first_name"));
                last_nameList.add(rs.getString("last_name"));
                total_avgList.add(rs.getDouble("total_avg_rate"));

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
