<%-- 
    Document   : addEquivalentMenu
    Created on : Nov 21, 2023, 12:04:54 AM
    Author     : Lars
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, profmanagement.*"%>
<!DOCTYPE html>
<html>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Equivalent Menu</title>
    </head>
    <body>
        <div class="text-center">
            <h1 class="m-5">Add Equivalent</h1>
        </div>
        <main class="d-flex justify-content-center">
          <div class="bg-light p-5 rounded shadow-sm w-25">
                <form class="mx-auto" action="addEquivalent.jsp" method="POST">
                    <jsp:useBean id="rating" class="profmanagement.Rating" scope="session" />
                    <jsp:useBean id="rr" class="profmanagement.RatingRef" scope="session" />

                    <label for="score">Enter a Score - </label></br>
                    <input class="border rounded p-2 w-100" type="number" name="score" placeholder="###" required><br>
                    <label for="score">Enter an Equivalent - </label></br>
                    <input class="border rounded p-2 w-100" type="text" name="equivalent" placeholder="Extremely Poor." required><br><br>

                    <input class="btn btn-primary" type="submit" value="Add"/>                            
                </form>
          </div>
        </main>
    </body>
</html>
