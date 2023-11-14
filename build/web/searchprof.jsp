<%-- 
    Document   : searchprof
    Created on : 11 10, 23, 8:05:10 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, profmanagement.*"%>
<!DOCTYPE html>S
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search and view professor</title>
    </head>
    <body>
        <h1>Search and view professor</h1>
        <jsp:useBean id="prof" class="profmanagement.Professor" scope="session" />
        <%
            String prof_id = request.getParameter("professors");
            prof.professor_id = Integer.parseInt(prof_id);
            prof.viewRecord();
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