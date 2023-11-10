<%-- 
    Document   : modprof
    Created on : 11 10, 23, 8:57:45 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, professormanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify a professor</title>
    </head>
    <body>
        <h1>Modify a professor</h1>
        
        <jsp:useBean id="prof" class="profmanagement.Professor" scope="session" />
        <%
            String prof_id = request.getParameter("professors");
            String first_name = request.getParameter("firstname");
            String last_name = request.getParameter("lastname");
            prof.professor_id = Integer.parseInt(prof_id);
            prof.first_name = first_name;
            prof.last_name = last_name;
            prof.modRecord();
        %>  
        Modified successfully!
        <br>

                First Name: <%=prof.first_name%><br>
                Last Name: <%=prof.last_name%><br>
        <br>
        click <a href="homepage.jsp">here to go back to home page</a><br>
    </body>
</html>