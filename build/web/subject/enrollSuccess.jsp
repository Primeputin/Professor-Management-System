<%-- 
    Document   : enrollSuccess
    Created on : 11 10, 23, 8:57:45 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enrollment Status</title>
    </head>
    <body>

        
        <jsp:useBean id="subject" class="profmanagement.Subject" scope="session" />
        <%
            int subject_id = Integer.parseInt(request.getParameter("subjectToTakeId"));
            
            subject.subject_id = subject_id;
            subject.enrollStudent(subject.studentToEnroll);
            subject.getSubjectName(subject_id);

        %>  
        

        
        <main class="my-5 d-flex justify-content-center">
            <div class="bg-light p-5 rounded shadow-sm w-50">
                <h1>Enrollment Success!</h1>
                <p>Enrolled Student ID <%=subject.studentToEnroll%> in <%=subject.enrolledSubject%><br/></p>

                <br>
                <a class="btn btn-lg btn-secondary" href="../homepage.jsp" role="button">Back</a>
            </div>
        </main>


    </body>
</html>