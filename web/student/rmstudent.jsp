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
        <title>Remove a student</title>
    </head>
    <body>
        
        <div class="text-center">
            <h1 class="m-5">Removed Student</h1>
        </div>
        
        <jsp:useBean id="student" class="profmanagement.Student" scope="session" />
        <%
            String student_id = request.getParameter("student");
            student.student_id = Integer.parseInt(student_id);
            student.viewRecord();
            String first_name = student.first_nameList.get(0);
            String last_name = student.last_nameList.get(0);
            student.delRecord();
        %>    
        
        <main class="d-flex justify-content-center">
            <div class="bg-light p-5 rounded shadow-sm w-50 mb-2">
                <h1> Removed student Success! </h1><br/>
                <label class="h5">First Name: <%=first_name%><br></label><br/>
                <label class="h5">Last Name: <%=last_name%><br></label><br/>
            <br>
            <a class="btn btn-lg btn-secondary" href="../homepage.jsp" role="button">Back</a>
             </div>
        </main>
            
    </body>
</html>
