<%-- 
    Document   : filter_rating_by_prof
    Created on : 11 15, 23, 1:51:32 PM
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
        <title>Filter Rating by Professor</title>
    </head>
    <body>
        <jsp:useBean id="rating" class="profmanagement.Rating" scope="session" />
        <jsp:useBean id="nr" class="profmanagement.NameRetriever" scope="session" />
        <%
            rating.professor_id = Integer.parseInt(request.getParameter("prof_id"));
            rating.viewFilterRecordProf();
            nr.retrieveProfName(rating.professor_id);
        %> 
        
        <div class="text-center">
            <h1 class="m-5">Search Results</h1>
        </div>

        <div class="container bg-light p-5 rounded shadow-sm w-50" style="min-height: 300px">        
            <table class="table">
                <thead>
                  <tr>
                    <th scope="col">Student ID</th>
                    <th scope="col">Student Name</th>
                    <th scope="col">Explanation</th>
                    <th scope="col">Kindness</th>
                    <th scope="col">Knowledgability</th>
                    <th scope="col">Approachability</th>
                    <th scope="col">Review Description</th>
                    <th scope="col">Date of Rating</th>
                    
                  </tr>
                </thead>
                <tbody>

                  <% for (int i=0; i < rating.professor_idlist.size(); i++) { 
                        nr.retrieveStudentName(rating.student_idlist.get(i));
                  %>
                        <tr>
                            <td scope="row"><%=rating.student_idlist.get(i)%></td>
                            <td><%=nr.student_first_name%> <%=nr.student_last_name%></td>
                            <td><%=rating.explanationlist.get(i)%></td>
                            <td><%=rating.kindnesslist.get(i)%></td>
                            <td><%=rating.knowledgabilitylist.get(i)%></td>
                            <td><%=rating.approachabilitylist.get(i)%></td>
                            <td><%=rating.reviewlist.get(i)%></td>
                            <td><%=rating.rate_datelist.get(i)%></td>
                        </tr>
                   <%  } %><br> 

                </tbody>
              </table>
                   
            <div style="bottom: 10px" class="mt-5">
                <a class="btn btn-lg btn-secondary" href="../homepage.jsp" role="button">Back</a>
            </div>
        </div>
        
        


    </body>
</html>
