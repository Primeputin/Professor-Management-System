<%-- 
    Document   : addstudent
    Created on : 11 14, 23, 3:42:57 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        
        <title>Add a student</title>
    </head>
    <body>
        <div class="text-center">
            <h1 class="m-5">Added Student!</h1>
        </div>
        <jsp:useBean id="student" class="profmanagement.Student" scope="session" />
        <%
            String first_name = request.getParameter("firstname");
            String last_name = request.getParameter("lastname");
            float gpa = Float.parseFloat(request.getParameter("gpa"));
            int cur_year = Integer.parseInt(request.getParameter("cur_year"));
            
            student.first_name = first_name;
            student.last_name = last_name;
            student.gpa = gpa;
            student.cur_year = cur_year;
            
            student.addRecord();
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
