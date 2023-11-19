<%-- 
    Document   : rankofprofbyattr
    Created on : 11 18, 23, 4:21:37 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ranking of professors by Attribute </title>
    </head>
    <body>
        <h1>Rankings of professors in a subject by Kindness</h1>
        <jsp:useBean id="rank" class="profmanagement.Ranking" scope="session" />
       
        <%
            String subject_name = request.getParameter("subjectname");
            String year = request.getParameter("subject_year");
            String attributeType = "kindness";
            
            rank.subject_name = subject_name;
            rank.year = year;
            rank.showRankAttribute(attributeType);
            
        %>    
        Searched Results <br>
        <% 
            for (int i=0; i < rank.professor_idList.size(); i++) { %>
                Professor ID: <%=rank.professor_idList.get(i)%>  Kindness Average Rate: <%=rank.kindnessAvgList.get(i)%><br>
                First Name: <%=rank.first_nameList.get(i)%><br>
                Last Name: <%=rank.last_nameList.get(i)%><br><br>
        <%  } %><br>
        click <a href="homepage.jsp">here to go back to home page</a><br>

    </body>
</html>