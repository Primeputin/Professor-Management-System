<%-- 
    Document   : addsubject
    Created on : 11 14, 23, 8:48:23 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, profmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enroll Student</title>
    </head>
    <body>
        <h1 id = "title"></h1>
        <jsp:useBean id="subject" class="profmanagement.Subject" scope="session" />
        <jsp:useBean id="student" class="profmanagement.Student" scope="session" />
        
        <%
            int subject_id = Integer.parseInt(request.getParameter("subject"));
            int student_id = Integer.parseInt(request.getParameter("student"));
            
            student.enroll(student_id, subject_id);
        %>    
        Enrollment success! <br>
                
        <br>
        click <a href="homepage.jsp">here to go back to home page</a><br>
    </body>
</html>
