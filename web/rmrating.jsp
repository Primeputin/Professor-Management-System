<%-- 
    Document   : rmrating
    Created on : 11 15, 23, 11:45:31 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, profmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove a Rating</title>
    </head>
    <body>
        <h1>Removed Rating</h1>
        <jsp:useBean id="rating" class="profmanagement.Rating" scope="session" />
        <jsp:useBean id="nr" class="profmanagement.NameRetriever" scope="session" />
        <%
            rating.professor_id = Integer.parseInt(request.getParameter("prof_id"));
            nr.retrieveStudentName(rating.student_id);
            nr.retrieveProfName(rating.professor_id);
            
            rating.delRecord();
        %>   
        
        Removed rating Success! <br><br>

                Student ID: <%=rating.student_id%><br>
                Student Name: <%=nr.student_first_name%> <%=nr.student_last_name%><br><br>
                Professor ID: <%=rating.professor_id%><br>
                Professor Name: <%=nr.prof_first_name%> <%=nr.prof_last_name%><br><br>
        <br>
        click <a href="homepage.jsp">here to go back to home page</a><br>
    </body>
</html>
