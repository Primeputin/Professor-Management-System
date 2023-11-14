<%-- 
    Document   : modsubject
    Created on : 11 15, 23, 12:26:41 AM
    Author     : ccslearner
--%>

<%@page import = "java.util.*, professormanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify a Subject</title>
    </head>
    <body>
        <h1>Modify a Subject</h1>
        
        <jsp:useBean id="subject" class="profmanagement.Subject" scope="session" />
        <jsp:useBean id="professor" class="profmanagement.Professor" scope="session" />

        <%
            String subject_id = request.getParameter("subjects");
            String subject_name = request.getParameter("subjectname");
            String units = request.getParameter("units");
            String professor_id = request.getParameter("professor");
            
            subject.subject_id = Integer.parseInt(subject_id);
            subject.subject_name = subject_name;
            subject.units = Integer.parseInt(units);
            subject.professor_id = Integer.parseInt(professor_id);
            
            professor.professor_id = subject.professor_id;
            professor.viewRecord();
            
            subject.modRecord();
        %>  
        Modified successfully!
        <br>

                Subject Name: <%=subject.subject_name%><br>
                Units: <%=subject.units%><br>
                Professor Name: <%=professor.first_name%> <%=professor.last_name%>

        <br>
        click <a href="homepage.jsp">here to go back to home page</a><br>
    </body>
</html>
