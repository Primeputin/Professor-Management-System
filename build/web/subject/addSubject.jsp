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
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add a Subject</title>
    </head>
    <body>

        <jsp:useBean id="subject" class="profmanagement.Subject" scope="session" />
        <jsp:useBean id="professor" class="profmanagement.Professor" scope="session" />

        <%
            String subject_name = request.getParameter("subjectname");
            int units = Integer.parseInt(request.getParameter("units"));
            int professor_id = Integer.parseInt(request.getParameter("professorid"));
            int subject_year = Integer.parseInt(request.getParameter("subject_year"));
            int term = Integer.parseInt(request.getParameter("term"));
            
            subject.subject_name = subject_name.toUpperCase();
            subject.units = units;
            subject.professor_id = professor_id;
            subject.subject_year = subject_year;
            subject.term = term;
            
            professor.professor_id = subject.professor_id;
            professor.viewRecord();         
            
            subject.addRecord();
        %> 
        
        <main class="d-flex justify-content-center my-5">
            <div class="bg-light p-5 rounded shadow-sm w-50 mb-2">
                <h1> Added details Success! </h1><br/>
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
