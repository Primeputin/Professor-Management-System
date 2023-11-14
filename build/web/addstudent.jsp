<%-- 
    Document   : addstudent
    Created on : 11 14, 23, 3:42:57 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add a student</title>
    </head>
    <body>
        <h1>Added Student</h1>
        <jsp:useBean id="student" class="profmanagement.Student" scope="session" />
        <%
            String first_name = request.getParameter("firstname");
            String last_name = request.getParameter("lastname");
            float gpa = Float.parseFloat(request.getParameter("gpa"));
            int cur_year = Integer.parseInt(request.getParameter("cur_year"));
            
            student.first_name = first_name;
            student.last_name = last_name;
            student.gpa = gpa;
            student.cur_year = cur_year;
            
            student.addRecord();
        %>    
        Added details Success! <br>

                First Name: <%=student.first_name%><br>
                Last Name: <%=student.last_name%><br>
                GPA: <%=student.gpa%><br>
                Current Year: <%=student.cur_year%><br>
                
        <br>
        click <a href="homepage.jsp">here to go back to home page</a><br>
    </body>
</html>
