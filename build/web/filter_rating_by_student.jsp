<%-- 
    Document   : filter_rating_by_student
    Created on : 11 15, 23, 1:32:29 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, profmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filter Rating by Student</title>
    </head>
    <body>
        <h1>Filter and list ratings by student</h1>
        <jsp:useBean id="rating" class="profmanagement.Rating" scope="session" />
        <jsp:useBean id="nr" class="profmanagement.NameRetriever" scope="session" />
        <%
            rating.student_id = Integer.parseInt(request.getParameter("student_id"));
            rating.viewFilterRecordStudent();
            nr.retrieveStudentName(rating.student_id);
        %> 
         Searched Results <br>
         Student ID: <%=rating.student_id%><br>
         Student Name: <%=nr.student_first_name%> <%=nr.student_last_name%><br><br>
        <% 
            for (int i=0; i < rating.student_idlist.size(); i++) {
                nr.retrieveProfName(rating.professor_idlist.get(i));
        %>
                
                Professor ID: <%=rating.professor_idlist.get(i)%><br>
                Professor Name: <%=nr.prof_first_name%> <%=nr.prof_last_name%><br>
                Explanation: <%=rating.explanationlist.get(i)%><br>
                Kindness: <%=rating.kindnesslist.get(i)%><br>
                Knowledgability: <%=rating.knowledgabilitylist.get(i)%><br>
                Approachability: <%=rating.approachabilitylist.get(i)%><br>
                Review Description: <%=rating.reviewlist.get(i)%><br>
                Date of Rating: <%=rating.rate_datelist.get(i)%><br><br><br>
        <%  } %><br>
        click <a href="homepage.jsp">here to go back to home page</a><br>
    </body>
</html>
