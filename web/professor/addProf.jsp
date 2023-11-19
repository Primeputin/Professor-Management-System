<%-- 
    Document   : addprof
    Created on : 11 10, 23, 8:36:44 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, profmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add a professor</title>
    </head>
    <body>
        <h1>Added Professor</h1>
        <jsp:useBean id="prof" class="profmanagement.Professor" scope="session" />
        <%
            String first_name = request.getParameter("firstname");
            String last_name = request.getParameter("lastname");
            prof.first_name = first_name;
            prof.last_name = last_name;
            prof.addRecord();
        %>    
        Added details Success! <br>

                First Name: <%=prof.first_name%><br>
                Last Name: <%=prof.last_name%><br>
        <br>
        click <a href="../homepage.jsp">here to go back to home page</a><br>
    </body>
</html>
