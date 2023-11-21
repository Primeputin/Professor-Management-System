<%-- 
    Document   : modstudent
    Created on : 11 10, 23, 8:57:45 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, profmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify a student</title>
    </head>
    <body>
        <div class="text-center">
            <h1 class="m-5">Modified Student!</h1>
        </div>
        
        <jsp:useBean id="student" class="profmanagement.Student" scope="session" />
        <%
            String student_id = request.getParameter("student");
            String first_name = request.getParameter("firstname");
            String last_name = request.getParameter("lastname");
            Float gpa = Float.parseFloat(request.getParameter("gpa"));
            Integer cur_year = Integer.parseInt(request.getParameter("cur_year"));
            student.student_id = Integer.parseInt(student_id);
            
            student.first_name = first_name;
            student.last_name = last_name;
            student.gpa = gpa;
            student.cur_year = cur_year;
            student.modRecord();
        %>  
       
        <main class="d-flex justify-content-center">
            <div class="bg-light p-5 rounded shadow-sm w-50">
                <h1><%=student.last_name%>, <%=student.first_name%></h1><br/>
                <label class="h5">Student ID: <%=student.student_id%></label><br/>
                <label class="h5">GPA: <%=student.gpa%></label><br/>
                <label class="h5">Current Year: <%=student.cur_year%></label><br/>
                <br>
                <a class="btn btn-lg btn-secondary" href="../homepage.jsp" role="button">Back</a>
            </div>
        </main>
        
    </body>
</html>