<%-- 
    Document   : modrating
    Created on : 11 16, 23, 9:38:52 PM
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
        <title>Modify a Rating</title>
    </head>
    <body>
        
        <jsp:useBean id="rating" class="profmanagement.Rating" scope="session" />
        <jsp:useBean id="nr" class="profmanagement.NameRetriever" scope="session" />
        <jsp:useBean id="rref" class="profmanagement.RatingRef" scope="session" />
        
        <div class="text-center">
            <h1 class="m-5">Modified Rating!</h1>
        </div>
        <main class="d-flex justify-content-center">


            <%
                int prof_id = Integer.parseInt(request.getParameter("prof_id"));
                int explanation = Integer.parseInt(request.getParameter("explanation"));
                int kindness = Integer.parseInt(request.getParameter("kindness"));
                int knowledgability = Integer.parseInt(request.getParameter("knowledgability"));
                int approachability = Integer.parseInt(request.getParameter("approachability"));
                String review = request.getParameter("description");

                rating.professor_id = prof_id;
                rating.explanation = explanation;
                rating.kindness = kindness;
                rating.approachability = approachability;
                rating.knowledgability = knowledgability;
                rating.review = review;

                nr.retrieveStudentName(rating.student_id);
                nr.retrieveProfName(rating.professor_id);
                rating.modRecord();

                rref.getMaxRating();

            %>
            
           <main class="d-flex justify-content-center">
                <div class="bg-light p-5 rounded shadow-sm mb-2">
                    <label class="h5">Student ID: <%=rating.student_id%></label><br/>
                    <label class="h5">Student Name: <%=nr.student_first_name%> <%=nr.student_last_name%></label><br/>
                    <label class="h5">Professor ID:  <%=rating.professor_id%></label><br/>
                    <label class="h5">Professor Name: <%=nr.prof_first_name%> <%=nr.prof_last_name%></label><br/>
                    <label class="h5">Date of Rating: <%=rating.rate_date%></label><br/>
                    
                    <label class="h5">Explanation: <%=rating.explanation%></label><br/>
                    <div class="progress my-2 w-75">
                        <div class="progress-bar bg-danger" role="progressbar" style="width: <%=rating.explanation * (rref.maxScore)%>%" aria-valuenow="<%=rating.explanation * (rref.maxScore)%>" aria-valuemin="0" aria-valuemax="<%=rref.maxScore%>"></div>
                    </div>
                    
                    <label class="h5">Kindness: <%=rating.kindness%></label><br/>
                    <div class="progress my-2 w-75">
                        <div class="progress-bar bg-info" role="progressbar" style="width: <%=rating.kindness * (rref.maxScore)%>%" aria-valuenow="<%=rating.kindness * (rref.maxScore)%>" aria-valuemin="0" aria-valuemax="<%=rref.maxScore%>"></div>
                    </div>
                    
                    <label class="h5">Knowledgability: <%=rating.knowledgability%></label><br/>
                    <div class="progress my-2 w-75">
                        <div class="progress-bar bg-warning" role="progressbar" style="width: <%=rating.knowledgability * (rref.maxScore)%>%" aria-valuenow="<%=rating.knowledgability * (rref.maxScore)%>" aria-valuemin="0" aria-valuemax="<%=rref.maxScore%>"></div>
                    </div>
                    
                    <label class="h5">Approachability: <%=rating.approachability%></label><br/>
                    <div class="progress my-2 w-75">
                        <div class="progress-bar bg-success" role="progressbar" style="width: <%=rating.approachability * (rref.maxScore)%>%" aria-valuenow="<%=rating.approachability * (rref.maxScore)%>" aria-valuemin="0" aria-valuemax="<%=rref.maxScore%>"></div>
                    </div>
                    
                    <label class="h5">Review Description: <%=rating.review%></label><br/>

                    <br/>
                    <a class="btn btn-lg btn-secondary" href="../homepage.jsp" role="button">Back</a>
                </div>
            </main>

        </main>
        
    </body>
</html>