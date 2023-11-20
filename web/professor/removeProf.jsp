<%-- 
    Document   : rmprof
    Created on : 11 10, 23, 8:41:14 PM
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
        
        <title>Remove a professor</title>
    </head>
    <body>
        <div class="text-center">
            <h1 class="m-5">Removed Professor</h1>
        </div>
        
        <jsp:useBean id="prof" class="profmanagement.Professor" scope="session" />
        <%
            String prof_id = request.getParameter("professors");
            prof.professor_id = Integer.parseInt(prof_id);
            prof.viewRecord();
            String first_name = prof.first_nameList.get(0);
            String last_name = prof.last_nameList.get(0);
            String department = prof.departmentList.get(0);
            prof.delRecord();
        %>    
        
        <main class="d-flex justify-content-center">
            <div class="bg-light p-5 rounded shadow-sm w-50 mb-2">
                <h1> Removed professor Success! </h1><br/>
                <label class="h5">First Name: <%=prof.first_name%><br></label><br/>
                <label class="h5">Last Name: <%=prof.last_name%><br></label><br/>
                <label class="h5">Department: <%=prof.department%><br></label><br/>
            <br>
            <a class="btn btn-lg btn-secondary" href="../homepage.jsp" role="button">Back</a>
             </div>
        </main>
    </body>
</html>
