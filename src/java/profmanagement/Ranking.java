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
    
    public String year;
    public String subject_name;
    
    public ArrayList<Integer> professor_idList = new ArrayList<>();
    public ArrayList<String> first_nameList = new ArrayList<>();
    public ArrayList<String> last_nameList = new ArrayList<>();
    public ArrayList<String> departmentList = new ArrayList<>();
    public ArrayList<Double> total_avgList = new ArrayList<>();
    public ArrayList<Double> explanationAvgList = new ArrayList<>();
    public ArrayList<Double> kindnessAvgList = new ArrayList<>();
    public ArrayList<Double> knowledgabilityAvgList = new ArrayList<>();
    public ArrayList<Double> approachabilityAvgList = new ArrayList<>();
    public ArrayList<Double> attrList = new ArrayList<>();
    
    
    public int showRanking()
    {
        try {
            Connection conn = ConnectionUtil.connect();
            PreparedStatement pstmt = conn.prepareStatement("SELECT professor.professor_id, professor.first_name, professor.last_name, professor.department, AVG((explanation + kindness +  knowledgability + approachability)) AS total_avg_rate " +
                                                                                    "FROM ratings JOIN student ON ratings.student_id = student.student_id " +
                                                                                    "			 JOIN subject_list ON student.student_id = subject_list.student_id " +
                                                                                    "             JOIN subject ON subject_list.subject_id = subject.subject_id " +
                                                                                    "             JOIN professor ON subject.professor_id = professor.professor_id"  +
                                                                                    "             WHERE subject.subject_year = ? AND subject.subject_name = ? " +
                                                                                    "GROUP BY professor.professor_id " +
                                                                                    "ORDER BY total_avg_rate DESC");
            // 5. Supply the statement with values
            pstmt.setString(1, year);
            pstmt.setString(2, subject_name);
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            // 7. Get the results
            professor_idList.clear();
            first_nameList.clear();
            last_nameList.clear();
            departmentList.clear();
            total_avgList.clear();
            while (rs.next()) {
                professor_idList.add(rs.getInt("professor_id"));
                first_nameList.add(rs.getString("first_name"));
                last_nameList.add(rs.getString("last_name"));
                departmentList.add(rs.getString("department"));
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
        
    public int showRankAttribute(String attributeType)
    {
        try {
            Connection conn = ConnectionUtil.connect();
            PreparedStatement pstmt = conn.prepareStatement("SELECT     professor.professor_id, " +
                                                                       "professor.first_name, " +
                                                                       "professor.last_name, " +
                                                                       "professor.department, " +
                                                                       "AVG(" + attributeType + ") AS avg_attr_rate" +
                                                           " FROM       ratings " +
                                                                       "JOIN student ON ratings.student_id = student.student_id " +
                                                                       "JOIN subject_list ON student.student_id = subject_list.student_id " +
                                                                       "JOIN subject ON subject_list.subject_id = subject.subject_id " +
                                                                       "JOIN professor ON subject.professor_id = professor.professor_id " +
                                                                       "WHERE subject.subject_year = ? AND subject.subject_name = ? " +
                                                            "GROUP BY   professor.professor_id " +
                                                            "ORDER BY   avg_attr_rate DESC" );
            
            // 5. Supply the statement with values
            pstmt.setString(1, year);
            pstmt.setString(2, subject_name);
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();

            // 7. Get the results
            professor_idList.clear();
            first_nameList.clear();
            last_nameList.clear();
            departmentList.clear();
            explanationAvgList.clear();
            kindnessAvgList.clear();
            knowledgabilityAvgList.clear();
            approachabilityAvgList.clear();
            
            while (rs.next()) {
                professor_idList.add(rs.getInt("professor_id"));
                first_nameList.add(rs.getString("first_name"));
                last_nameList.add(rs.getString("last_name"));
                departmentList.add(rs.getString("department"));

                if (attributeType.equals("explanation")) {
                    explanationAvgList.add(rs.getDouble("avg_attr_rate"));
                } else if (attributeType.equals("kindness")) {
                    kindnessAvgList.add(rs.getDouble("avg_attr_rate"));
                } else if (attributeType.equals("knowledgability")) {
                    knowledgabilityAvgList.add(rs.getDouble("avg_attr_rate"));
                } else if (attributeType.equals("approachability")) {
                    approachabilityAvgList.add(rs.getDouble("avg_attr_rate"));
                }

        }
            switch(attributeType)
            {
                case "approachability":
                    attrList = approachabilityAvgList;
                    break;
                case "explanation":
                    attrList = explanationAvgList;
                    break;
                case "kindness":
                    attrList = kindnessAvgList;
                    break;
                case "knowledgability":
                    attrList = knowledgabilityAvgList;


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
