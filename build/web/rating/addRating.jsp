<%-- 
    Document   : addrating
    Created on : 11 14, 23, 9:56:55 PM
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
        <title>Add a Rating</title>
    </head>
    <body>
        <h1>Added Rating</h1>
        <jsp:useBean id="rating" class="profmanagement.Rating" scope="session" />
        <jsp:useBean id="rr" class="profmanagement.RatingRef" scope="session" />
        <jsp:useBean id="nr" class="profmanagement.NameRetriever" scope="session" />
        <%
            int prof_id = Integer.parseInt(request.getParameter("prof_id"));
            int explanation = Integer.parseInt(request.getParameter("explanation"));
            int kindness = Integer.parseInt(request.getParameter("kindness"));
            int knowledgability = Integer.parseInt(request.getParameter("knowledgability"));
            int approachability = Integer.parseInt(request.getParameter("approachability"));
            String review = request.getParameter("description");
            
            if (rr.inRatingRef(explanation) && rr.inRatingRef(kindness) && rr.inRatingRef(knowledgability) && rr.inRatingRef(approachability))
            {
                        
            
                rating.professor_id = prof_id;
                rating.explanation = explanation;
                rating.kindness = kindness;
                rating.approachability = approachability;
                rating.knowledgability = knowledgability;
                rating.review = review;

                nr.retrieveStudentName(rating.student_id);
                nr.retrieveProfName(rating.professor_id);
                int res = rating.addRating();



                if(res == 1){
        %>    
        
        <main class="d-flex justify-content-center">
            <div class="bg-light p-5 rounded shadow-sm w-50 mb-2">
                <h1> Added Ratings Success! </h1><br/>
                <label class="h5">Student ID: <%=rating.student_id%><br></label><br/>
                <label class="h5">Student Name: <%=nr.student_first_name%> <%=nr.student_last_name%><br></label><br/>
                <label class="h5">Professor ID: <%=rating.professor_id%><br></label><br/>
                <label class="h5">Professor Name: <%=nr.prof_first_name%> <%=nr.prof_last_name%><br></label><br/>
                <label class="h5">Explanation: <%=rating.explanation%><br></label><br/>
                <label class="h5">Kindness: <%=rating.kindness%><br></label><br/>
                <label class="h5">Approachability: <%=rating.approachability%><br></label><br/>
                <label class="h5">Review Description: <%=rating.review%><br></label><br/>
                <label class="h5">Date of Rating: <%=rating.rate_date%><br></label><br/>
            <br>
            <a class="btn btn-lg btn-secondary" href="../homepage.jsp" role="button">Back to homepage</a>

             </div>
        </main>

         <% } else{
         %>
         Add Ratings Failed!<br>
         <script>window.location.href=`../error.jsp?errorMsg=${'Add ratings failed!'}`;</script>

         <% } } else {
         %>
         Add Ratings Failed!<br>
         <script>window.location.href=`../error.jsp?errorMsg=${'Add ratings failed!'}`;</script>
         <% }
         %>
        <br>
    </body>
</html>