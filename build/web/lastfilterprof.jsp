<%-- 
    Document   : lastfilterprof
    Created on : 11 15, 23, 2:58:35 PM
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
            String last_name = request.getParameter("lastname");
            prof.last_name = last_name;
            prof.viewLastNameFilterRecord();
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