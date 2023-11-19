<%-- 
    Document   : enrollSuccess
    Created on : 11 10, 23, 8:57:45 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, profmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enrollment Status</title>
    </head>
    <body>
        <h1>Enrollment Success!</h1>
        
        <jsp:useBean id="subject" class="profmanagement.Subject" scope="session" />
        <%
            int subject_id = Integer.parseInt(request.getParameter("subjectToTakeId"));
            
            subject.subject_id = subject_id;
            subject.enrollStudent(subject.studentToEnroll);
            subject.getSubjectName(subject_id);

        %>  
        
        Enrolled Student ID <%=subject.studentToEnroll%> in <%=subject.enrolledSubject%><br/>

        click <a href="homepage.jsp">here to go back to home page</a><br>
    </body>
</html>