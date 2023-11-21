<%-- 
    Document   : filter_rating_by_student
    Created on : 11 15, 23, 1:32:29 PM
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
        <title>Filter Rating by Student</title>
    </head>
    <body>
        <jsp:useBean id="rating" class="profmanagement.Rating" scope="session" />
        <jsp:useBean id="nr" class="profmanagement.NameRetriever" scope="session" />
        <%
            rating.student_id = Integer.parseInt(request.getParameter("student_id"));
            rating.viewFilterRecordStudent();
            nr.retrieveStudentName(rating.student_id);
        %> 
        
        <div class="text-center">
            <h1 class="m-5">Search Results</h1>
        </div>
        
         <% 
            for (int i=0; i < rating.student_idlist.size(); i++) {
                nr.retrieveProfName(rating.professor_idlist.get(i));
         %>
            <main class="d-flex flex-column justify-content-center">
                
                <h4 class="align-self-center"> Student ID: <%=rating.student_id%></h4>
                <h4 class="align-self-center"> Student Name: <%=nr.student_first_name%> <%=nr.student_last_name%> </h4> <br/>
                
                <div class="bg-light p-5 rounded shadow-sm w-50 mb-2 align-self-center ">
                    <label class="h5">Professor ID: <%=rating.professor_idlist.get(i)%></label><br/>
                    <label class="h5">Professor Name: <%=nr.prof_first_name%> <%=nr.prof_last_name%></label><br/>
                    <label class="h5">Explanation: <%=rating.explanationlist.get(i)%></label><br/>
                    <label class="h5">Kindness: <%=rating.kindnesslist.get(i)%></label><br/>
                    <label class="h5">Knowledgability:  <%=rating.knowledgabilitylist.get(i)%></label><br/>
                    <label class="h5">Approachability: <%=rating.approachabilitylist.get(i)%></label><br/>
                    <label class="h5">Review Description: <%=rating.reviewlist.get(i)%></label><br/>
                    <label class="h5">Date of Rating: <%=rating.rate_datelist.get(i)%></label><br/>
                    <a class="btn btn-lg btn-secondary" href="../homepage.jsp" role="button">Back</a>
                <br>
                
                </div>
            </main>
        <%  } %><br>
        
        

        

    </body>
</html>
