<%-- 
    Document   : searchsubject
    Created on : 11 15, 23, 1:00:38 AM
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
        <title>Search and view Subject</title>
    </head>
    <body>
        <h1>Search and view Subject</h1>
        <jsp:useBean id="subject" class="profmanagement.Subject" scope="session" />
        <jsp:useBean id="professor" class="profmanagement.Professor" scope="session" />

        <%
            String subject_id = request.getParameter("subjects");
            subject.subject_id = Integer.parseInt(subject_id);
            
            
            subject.viewRecord();
        %>    
        
        
        <main class="d-flex justify-content-center">
          <div class="bg-light p-5 rounded shadow-sm w-50">
                <h1><%=subject.subject_nameList.get(0)%></h1><br/>
                <label class="h5">Units: <%=subject.unitsList.get(0)%></label><br/>
                <label class="h5">Professor Name: <%=professor.first_name%> <%=professor.last_name%><</label><br/>
                <label class="h5">Year: <%=subject.subject_year%>, Term <%=subject.term%></label><br/>
            <br>
            <a class="btn btn-lg btn-secondary" href="../homepage.jsp" role="button">Back</a>
          </div>
        </main>
        
       
    </body>
</html>
