<%-- 
    Document   : filter_rating_by_prof
    Created on : 11 15, 23, 1:51:32 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, profmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filter Rating by Professor</title>
    </head>
    <body>
        <h1>Filter and list ratings by professor</h1>
        <jsp:useBean id="rating" class="profmanagement.Rating" scope="session" />
        <jsp:useBean id="nr" class="profmanagement.NameRetriever" scope="session" />
        <%
            rating.professor_id = Integer.parseInt(request.getParameter("prof_id"));
            rating.viewFilterRecordProf();
            nr.retrieveProfName(rating.professor_id);
        %> 
         Searched Results <br>
         Professor ID: <%=rating.professor_id%><br>
         Professor Name: <%=nr.prof_first_name%> <%=nr.prof_last_name%><br><br>
        <% 
            for (int i=0; i < rating.professor_idlist.size(); i++) { 
                nr.retrieveStudentName(rating.student_idlist.get(i));
        %>
                
                Student ID: <%=rating.student_idlist.get(i)%><br>
                Student Name: <%=nr.student_first_name%> <%=nr.student_last_name%><br>
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
