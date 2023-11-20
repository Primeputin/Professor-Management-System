<%-- 
    Document   : modEquivalent
    Created on : Nov 20, 2023, 10:56:22 PM
    Author     : Lars
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
        <title>Modify Equivalent</title>
    </head>
    <body>
        <jsp:useBean id="rr" class="profmanagement.RatingRef" scope="session" />
        <%
            rr.score = Integer.parseInt(request.getParameter("score"));
            
            rr.viewRecord();
            
            if(rr.equivalentList.get(rr.score) != null){
            rr.equivalent = request.getParameter("equivalent");
            rr.modRecord();
        %>
        
        <main class="d-flex justify-content-center">
          <div class="bg-light p-5 rounded shadow-sm w-50">
                <h1>Modified Equivalent!</h1><br/>
                <label class="h5">Score: <%=rr.score%></label><br/>
                <label class="h5">New Equivalent: <%=rr.equivalent%></label><br/>
            <br>
            <a class="btn btn-lg btn-secondary" href="../homepage.jsp" role="button">Back</a>
          </div>
        </main>
            
        <%}else{
        %>
            <main class="d-flex justify-content-center">
          <div class="bg-light p-5 rounded shadow-sm w-50">
                <h1>Equivalent not found!</h1><br/>
            <br>
            <a class="btn btn-lg btn-secondary" href="../homepage.jsp" role="button">Back</a>
          </div>
        </main>
        <%}%>
    </body>
</html>
