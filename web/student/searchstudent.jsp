<%-- 
    Document   : searchprof
    Created on : 11 10, 23, 8:05:10 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, profmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search and view student</title>
    </head>
    <body>
        <h1>Search and view student</h1>
        <jsp:useBean id="student" class="profmanagement.Student" scope="session" />
        <%
            String student_id = request.getParameter("student");
            student.student_id = Integer.parseInt(student_id);
            student.viewRecord();
        %>    
        Searched Results <br>
        <% 
            for (int i=0; i < student.student_idList.size(); i++) { %>
                Professor ID: <%=student.student_idList.get(i)%><br>
                First Name: <%=student.first_nameList.get(i)%><br>
                Last Name: <%=student.last_nameList.get(i)%><br>
                GPA: <%=student.gpaList.get(i)%><br>
                Current Year: <%=student.cur_yearList.get(i)%><br>
        <%  } %><br>
        click <a href="homepage.jsp">here to go back to home page</a><br>
    </body>
</html>