<%-- 
    Document   : filtersubject
    Created on : 11 15, 23, 12:43:25 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, profmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filter and list subjects</title>
    </head>
    <body>
        <h1>Filter and list subjects</h1>
        <jsp:useBean id="subject" class="profmanagement.Subject" scope="session" />
        <jsp:useBean id="professor" class="profmanagement.Professor" scope="session" />

        <%
            String prefix = request.getParameter("prefix");
            subject.viewFilterRecord(prefix);
        %>    
        Subjects starting with <%=prefix%> <br><br>
        <% 
            for (int i=0; i < subject.subject_idList.size(); i++) { %>
                Subject Name: <%=subject.subject_nameList.get(i)%><br>
                Units: <%=subject.unitsList.get(i)%><br>
                
                <% 
                    professor.professor_id = subject.professor_idList.get(i);
                    professor.viewRecord();
                %>
                Professor Name: <%=professor.first_name%> <%=professor.last_name%><br>
                Year: <%=subject.subject_yearList.get(i)%>, Term <%=subject.termList.get(i)%><br><br>
            <% } %><br><br>
        click <a href="homepage.jsp">here to go back to home page</a><br>
    </body>
</html>
