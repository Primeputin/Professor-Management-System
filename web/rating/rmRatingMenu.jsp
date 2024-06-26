<%-- 
    Document   : rmrating_menu
    Created on : 11 16, 23, 10:56:26 PM
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
        <title>Remove a Rating</title>
    </head>
    <body>
        
        <jsp:useBean id="rating" class="profmanagement.Rating" scope="session" />
        <jsp:useBean id="prof" class="profmanagement.Professor" scope="session" />
        
        <%
            rating.student_id = Integer.parseInt(request.getParameter("student_id"));
            prof.loadRecordByRatings(rating.student_id);
        %>

        <main class="d-flex justify-content-center mt-5">
            <div class="bg-light p-5 rounded shadow-sm w-50 mb-2">
                <h3 class="mx-auto">Remove a Rating</h3>
                <form action="rmRating.jsp" method="POST" onSubmit="return validateDropdown('prof_id', 'No more ratings to remove!')">
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
                        <input class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Remove"/>
                    </div>
                </form>

            </div>
        </main>
                          
        <script>
            
            function validateDropdown(elementId, error) {  
                
                error = error.replace(/ /g, '%20');
                
                if (document.getElementById(elementId).value === undefined || 
                        document.getElementById(elementId).value === "") {
                    // The error message goes here
                    var url = "../error.jsp?errorMsg=" + error;
                    window.location.href=url;
                    return false;
                }
                return true;
            }

        </script
             
    </body>
</html>
