<%-- 
    Document   : addsubject
    Created on : 11 14, 23, 8:48:23 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, profmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add a Subject</title>
    </head>
    <body>
        <h1>Added Subject</h1>
        <jsp:useBean id="subject" class="profmanagement.Subject" scope="session" />
        <jsp:useBean id="professor" class="profmanagement.Professor" scope="session" />

        <%
            String subject_name = request.getParameter("subjectname");
            int units = Integer.parseInt(request.getParameter("units"));
            int professor_id = Integer.parseInt(request.getParameter("professorid"));
            
            subject.subject_name = subject_name.toUpperCase();
            subject.units = units;
            subject.professor_id = professor_id;
            
            professor.professor_id = subject.professor_id;
            professor.viewRecord();         
            
            subject.addRecord();
        %>    
        Added details Success! <br>

                Subject Name: <%=subject.subject_name%><br>
                Units: <%=subject.units%><br>
                Professor Name: <%=professor.first_name%> <%=professor.last_name%><br>
                
        <br>
        click <a href="homepage.jsp">here to go back to home page</a><br>
    </body>
</html>
