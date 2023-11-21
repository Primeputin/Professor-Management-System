<%-- 
    Document   : error.jsp
    Created on : Nov 21, 2023, 5:12:17 AM
    Author     : hans
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!--<script>window.location.href=`../error.jsp?errorMsg=${'Score equivalent already exists!'}`;</script>-->

    <main class="flex-shrink-0">
      <div class="container">

        <h1 class="mt-5">
            <span>
                <svg xmlns="http://www.w3.org/2000/svg" width="44" height="44" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
                  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                </svg>
            </span>Oh no! An error has occurred!
        </h1>
        <p class="lead"><%=request.getParameter("errorMsg")%></p>
        <button class="btn btn-primary" onclick="window.location='homepage.jsp';">Return to homepage.</button>
      </div>
    </main>
</html>
