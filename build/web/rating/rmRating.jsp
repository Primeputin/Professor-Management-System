<%-- 
    Document   : rmrating
    Created on : 11 15, 23, 11:45:31 AM
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
        <title>Remove a Rating</title>
    </head>
    <body>
        <jsp:useBean id="rating" class="profmanagement.Rating" scope="session" />
        <jsp:useBean id="nr" class="profmanagement.NameRetriever" scope="session" />
        <%
            rating.professor_id = Integer.parseInt(request.getParameter("prof_id"));
            nr.retrieveStudentName(rating.student_id);
            nr.retrieveProfName(rating.professor_id);
            
            rating.delRecord();
        %>
        
        <div class="text-center">
            <h1 class="m-5">Removed Rating!</h1>
        </div>
        
        <main class="d-flex justify-content-center">

            <div class="bg-light p-5 rounded shadow-sm w-50 mb-2">

                <label class="h5">Student ID: <%=rating.student_id%><br></label><br/>
                <label class="h5">Student Name: <%=nr.student_last_name%>, <%=nr.student_first_name%><br></label><br/>
                <label class="h5">Professor ID: <%=rating.professor_id%><br></label><br/>
                <label class="h5">Professor Name: <%=nr.prof_first_name%>, <%=nr.prof_last_name%><br></label><br/>
            <br>
            <a class="btn btn-lg btn-secondary" href="../homepage.jsp" role="button">Back</a>
             </div>
        </main>
        
    </body>
</html>