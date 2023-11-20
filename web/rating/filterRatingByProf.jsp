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

        <main class="d-flex flex-column justify-content-center align-i-center">
            <h1 class="align-self-center"> Professor ID: <%=rating.professor_id%></h1><br/>
            <h1 class="align-self-center"> Professor Name: <%=nr.prof_first_name%> <%=nr.prof_last_name%> </h1> <br><br> 

            <% 
               for (int i=0; i < rating.professor_idlist.size(); i++) { 
                   nr.retrieveStudentName(rating.student_idlist.get(i));
            %>

            <div class="mx-auto bg-light p-5 rounded shadow-sm w-50 mb-2">
                <label class="h5">Student ID: <%=rating.student_idlist.get(i)%></label><br/>
                <label class="h5">Student Name: <%=nr.student_first_name%> <%=nr.student_last_name%></label><br/>
                <label class="h5">Explanation: <%=rating.explanationlist.get(i)%></label><br/>
                <label class="h5">Kindness: <%=rating.kindnesslist.get(i)%></label><br/>
                <label class="h5">Knowledgability:  <%=rating.knowledgabilitylist.get(i)%></label><br/>
                <label class="h5">Approachability: <%=rating.approachabilitylist.get(i)%></label><br/>
                <label class="h5">Review Description: <%=rating.reviewlist.get(i)%></label><br/>
                <label class="h5">Date of Rating: <%=rating.rate_datelist.get(i)%></label><br/>
                <a class="btn btn-lg btn-secondary" href="../homepage.jsp" role="button">Back</a>
            <br/>
            </div>
        </main>
        <%  } %><br>
        


    </body>
</html>
