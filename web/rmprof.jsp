<%-- 
    Document   : rmprof
    Created on : 11 10, 23, 8:41:14 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, professormanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove a professor</title>
    </head>
    <body>
        <h1>Removed Professor</h1>
        <jsp:useBean id="prof" class="profmanagement.Professor" scope="session" />
        <%
            String prof_id = request.getParameter("professors");
            prof.professor_id = Integer.parseInt(prof_id);
            prof.viewRecord();
            String first_name = prof.first_nameList.get(0);
            String last_name = prof.last_nameList.get(0);
            prof.delRecord();
        %>    
        Removed professor Success! <br>

                First Name: <%=prof.first_name%><br>
                Last Name: <%=prof.last_name%><br>
        <br>
        click <a href="homepage.jsp">here to go back to home page</a><br>
    </body>
</html>
