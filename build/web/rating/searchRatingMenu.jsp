<%-- 
    Document   : searchrating_menu
    Created on : 11 16, 23, 10:12:05 PM
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
        <title>Search and View a Rating</title>
    </head>
    
    <jsp:useBean id="rating" class="profmanagement.Rating" scope="session" />
    <jsp:useBean id="prof" class="profmanagement.Professor" scope="session" />
    
    <body>
        <div class="text-center">
            <h1 class="m-5">Search and View a Rating</h1>
        </div>

        <%
            rating.student_id = Integer.parseInt(request.getParameter("student_id"));
            prof.loadRecordByRatings(rating.student_id);
        %>


                
        <main class="d-flex justify-content-center">
            <div class="bg-light p-5 rounded shadow-sm w-50 mb-2">
            
                <form action="searchRating.jsp" method="POST">
                    <div class="form-group">
                        <label for="prof_id">Professor - </label>
                        <div class="d-flex">
                          <select class="form-select rounded p-1" name="prof_id" id="prof_id">
                            <% for (int i=0; i < prof.professor_idList.size(); i++) { %>
                              <option value="<%=prof.professor_idList.get(i)%>">
                                <%=prof.professor_idList.get(i) + " - " + prof.first_nameList.get(i) + " " + prof.last_nameList.get(i)%>
                              </option>            
                            <% } %>
                          </select>
                        </div>
                        <input class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Search"/>
                    </div>
                </form>

            </div>
        </main>
                

    </body>
</html>
