<%-- 
    Document   : filterprof
    Created on : 11 10, 23, 8:31:29 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, profmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filter and list professors</title>
    </head>
    <body>
        <h1>Filter and list professors</h1>
        <jsp:useBean id="prof" class="profmanagement.Professor" scope="session" />
        <%
            String first_name = request.getParameter("firstname");
            String last_name = request.getParameter("lastname");
            prof.first_name = first_name;
            prof.last_name = last_name;
            prof.viewFilterRecord();
        %>    
        Searched Results <br>
        <% 
            for (int i=0; i < prof.professor_idList.size(); i++) { %>
                Professor ID: <%=prof.professor_idList.get(i)%><br>
                First Name: <%=prof.first_nameList.get(i)%><br>
                Last Name: <%=prof.last_nameList.get(i)%><br>
        <%  } %><br>
        click <a href="homepage.jsp">here to go back to home page</a><br>
    </body>
</html>