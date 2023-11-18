<%-- 
    Document   : modstudent
    Created on : 11 10, 23, 8:57:45 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, profmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify a student</title>
    </head>
    <body>
        <h1>Modify a student</h1>
        
        <jsp:useBean id="student" class="profmanagement.Student" scope="session" />
        <%
            String student_id = request.getParameter("student");
            String first_name = request.getParameter("firstname");
            String last_name = request.getParameter("lastname");
            Float gpa = Float.parseFloat(request.getParameter("gpa"));
            Integer cur_year = Integer.parseInt(request.getParameter("cur_year"));
            student.student_id = Integer.parseInt(student_id);
            
            student.first_name = first_name;
            student.last_name = last_name;
            student.gpa = gpa;
            student.cur_year = cur_year;
            student.modRecord();
        %>  
        Modified successfully!
        <br>

                First Name: <%=student.first_name%><br>
                Last Name: <%=student.last_name%><br>
                GPA: <%=student.gpa%><br>
                Current year: <%=student.cur_year%><br>
        <br>
        click <a href="homepage.jsp">here to go back to home page</a><br>
    </body>
</html>