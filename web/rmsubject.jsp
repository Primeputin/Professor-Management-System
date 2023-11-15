<%-- 
    Document   : rmsubject
    Created on : 11 14, 23, 11:25:25 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, profmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove a Subject</title>
    </head>
    <body>
        <h1>Removed Subject</h1>
        <jsp:useBean id="subject" class="profmanagement.Subject" scope="session" />
        <jsp:useBean id="professor" class="profmanagement.Professor" scope="session" />

        <%
            
            
            String subject_id = request.getParameter("subject");


            subject.subject_id = Integer.parseInt(subject_id);
            
            subject.viewRecord();
            
            professor.professor_id = subject.professor_id;
            professor.viewRecord();
            
            subject.delRecord();
        %>    
        Removed professor Success! <br>

                Subject Name: <%=subject.subject_name%><br>
                Units: <%=subject.units%><br>
                Professor Name: <%=professor.first_name%> <%=professor.last_name%><br>
        <br>
        click <a href="homepage.jsp">here to go back to home page</a><br>
    </body>
</html>
