<%-- 
    Document   : rmprof
    Created on : 11 10, 23, 8:41:14 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, profmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove a student</title>
    </head>
    <body>
        <h1>Removed Student</h1>
        <jsp:useBean id="student" class="profmanagement.Student" scope="session" />
        <%
            String student_id = request.getParameter("student");
            student.student_id = Integer.parseInt(student_id);
            student.viewRecord();
            String first_name = student.first_nameList.get(0);
            String last_name = student.last_nameList.get(0);
            student.delRecord();
        %>    
        Removed student Success! <br>

                First Name: <%=student.first_name%><br>
                Last Name: <%=student.last_name%><br>
        <br>
        click <a href="homepage.jsp">here to go back to home page</a><br>
    </body>
</html>
