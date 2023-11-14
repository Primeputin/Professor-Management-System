<%-- 
    Document   : searchsubject
    Created on : 11 15, 23, 1:00:38 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, profmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search and view Subject</title>
    </head>
    <body>
        <h1>Search and view Subject</h1>
        <jsp:useBean id="subject" class="profmanagement.Subject" scope="session" />
        <jsp:useBean id="professor" class="profmanagement.Professor" scope="session" />

        <%
            String subject_id = request.getParameter("subjects");
            subject.subject_id = Integer.parseInt(subject_id);
            
            
            subject.viewRecord();
        %>    
        Searched Results <br>
        <% 
            for (int i=0; i < subject.subject_idList.size(); i++) {
                professor.professor_id = subject.professor_idList.get(i);
                professor.viewRecord();
        %>
            Subject Name: <%=subject.subject_nameList.get(i)%><br>
            Units: <%=subject.unitsList.get(i)%><br>
            Professor Name: <%=professor.first_name%> <%=professor.last_name%><br><br>
        <%
            }
        %><br>
        click <a href="homepage.jsp">here to go back to home page</a><br>
    </body>
</html>
