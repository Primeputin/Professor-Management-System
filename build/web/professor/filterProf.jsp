<%-- 
    Document   : filterprof
    Created on : 11 10, 23, 8:31:29 PM
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
        
        <title>Filter and list professors</title>
    </head>
    <body>
        <div class="text-center">
            <h1 class="m-5">Search Results</h1>
        </div>
        <jsp:useBean id="prof" class="profmanagement.Professor" scope="session" />
        <%
            String first_name = request.getParameter("firstname");
            String last_name = request.getParameter("lastname");
            prof.first_name = first_name;
            prof.last_name = last_name;
            prof.viewFilterRecord();
        %>    
        <% for (int i=0; i < prof.professor_idList.size(); i++) { %>
            <main class="d-flex justify-content-center">
                <div class="bg-light p-5 rounded shadow-sm w-50 mb-2">
                    <h1><%=prof.last_nameList.get(i)%>, <%=prof.first_nameList.get(i)%></h1><br/>
                    <label class="h5">Professor ID: <%=prof.professor_idList.get(i)%></label><br/>
                <br>
                <a class="btn btn-lg btn-secondary" href="../homepage.jsp" role="button">Back</a>
                 </div>
            </main>
        <%  } %><br>
    </body>
</html>