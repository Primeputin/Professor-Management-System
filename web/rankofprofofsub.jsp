<%-- 
    Document   : rankofprofofsub
    Created on : 11 15, 23, 9:26:49 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ranking of professors </title>
    </head>
    <body>
        <h1>Rankings of professors in a subject</h1>
        <jsp:useBean id="rank" class="profmanagement.Ranking" scope="session" />
       
        <%
            String subject_id = request.getParameter("subjects");
            String year = request.getParameter("subject_year");
            rank.subject_id = Integer.parseInt(subject_id);
            rank.year = year;
            rank.showRanking();
        %>    
        Searched Results <br>
        <% 
            for (int i=0; i < rank.professor_idList.size(); i++) { %>
                Professor ID: <%=rank.professor_idList.get(i)%>  Total Average Rate: <%=rank.total_avgList.get(i)%><br>
                First Name: <%=rank.first_nameList.get(i)%><br>
                Last Name: <%=rank.last_nameList.get(i)%><br>
        <%  } %><br>
        click <a href="homepage.jsp">here to go back to home page</a><br>

    </body>
</html>
