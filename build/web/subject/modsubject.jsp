<%-- 
    Document   : modsubject
    Created on : 11 15, 23, 12:26:41 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, profmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
            String subject_year = request.getParameter("subject_year");
            String term = request.getParameter("term");
            
            subject.subject_id = Integer.parseInt(subject_id);
            subject.subject_name = subject_name;
            subject.units = Integer.parseInt(units);
            subject.professor_id = Integer.parseInt(professor_id);
            subject.subject_year = Integer.parseInt(subject_year);
            subject.term = Integer.parseInt(term);
            
            professor.professor_id = subject.professor_id;
            professor.viewRecord();
            
            subject.modRecord();
        %>  
        
        <main class="d-flex justify-content-center">
            <div class="bg-light p-5 rounded shadow-sm w-50 mb-2">
                <h1> Modified successfully! </h1><br/>
                <label class="h5">Subject Name: <%=subject.subject_name%><br></label><br/>
                <label class="h5">Units: <%=subject.units%><br></label><br/>
                <label class="h5">Professor Name: <%=professor.first_name%> <%=professor.last_name%><br></label><br/>
                <label class="h5">Year: <%=subject.subject_year%>, Term <%=subject.term%><br></label><br/>
            <br>
            <a class="btn btn-lg btn-secondary" href="../homepage.jsp" role="button">Back</a>
             </div>
        </main>
        
    </body>
</html>
