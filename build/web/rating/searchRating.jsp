<%-- 
    Document   : searchrating
    Created on : 11 15, 23, 11:56:28 AM
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
        <title>Search and View Rating</title>
    </head>
    <body>
        <jsp:useBean id="rating" class="profmanagement.Rating" scope="session" />
        <jsp:useBean id="nr" class="profmanagement.NameRetriever" scope="session" />
        <jsp:useBean id="rref" class="profmanagement.RatingRef" scope="session" />

         <%
            rating.professor_id = Integer.parseInt(request.getParameter("prof_id"));
            rref.getMaxRating();
            
            int res = rating.viewRecord();
            
            if(res == 1){
        %>
        
        <div class="text-center">
            <h1 class="m-5">Search Results</h1>
        </div>
        
         <% for (int i=0; i < rating.student_idlist.size(); i++) { 
                nr.retrieveStudentName(rating.student_idlist.get(i));
                nr.retrieveProfName(rating.professor_idlist.get(i));
         %>
           <main class="d-flex justify-content-center">
                <div class="bg-light p-5 rounded shadow-sm w-50 mb-2">
                    <label class="h5">Student ID: <%=rating.student_idlist.get(i)%></label><br/>
                    <label class="h5">Student Name: <%=nr.student_first_name%> <%=nr.student_last_name%></label><br/>
                    <label class="h5">Professor ID:  <%=rating.professor_idlist.get(i)%></label><br/>
                    <label class="h5">Professor Name: <%=nr.prof_first_name%> <%=nr.prof_last_name%></label><br/>
                    <label class="h5">Date of Rating: <%=rating.rate_datelist.get(i)%></label><br/><br/>
                    
                    <label class="h5">Explanation: <%=rating.explanationlist.get(i)%></label><br/>
                    <div class="progress my-2 w-25">
                        <div class="progress-bar bg-danger" role="progressbar" style="width: <%=rating.explanationlist.get(i) * (rref.maxScore)%>%" aria-valuenow="<%=rating.explanationlist.get(i) * (rref.maxScore)%>" aria-valuemin="0" aria-valuemax="<%=rref.maxScore%>"></div>
                    </div>
                    
                    <label class="h5">Kindness: <%=rating.kindnesslist.get(i)%></label><br/>
                    <div class="progress my-2 w-25">
                        <div class="progress-bar bg-info" role="progressbar" style="width: <%=rating.kindnesslist.get(i) * (rref.maxScore)%>%" aria-valuenow="<%=rating.kindnesslist.get(i) * (rref.maxScore)%>" aria-valuemin="0" aria-valuemax="<%=rref.maxScore%>"></div>
                    </div>
                    
                    <label class="h5">Knowledgability: <%=rating.knowledgabilitylist.get(i)%></label><br/>
                    <div class="progress my-2 w-25">
                        <div class="progress-bar bg-warning" role="progressbar" style="width: <%=rating.knowledgabilitylist.get(i) * (rref.maxScore)%>%" aria-valuenow="<%=rating.knowledgabilitylist.get(i) * (rref.maxScore)%>" aria-valuemin="0" aria-valuemax="<%=rref.maxScore%>"></div>
                    </div>
                    
                    <label class="h5">Approachability: <%=rating.approachabilitylist.get(i)%></label><br/>
                    <div class="progress my-2 w-25">
                        <div class="progress-bar bg-success" role="progressbar" style="width: <%=rating.approachabilitylist.get(i) * (rref.maxScore)%>%" aria-valuenow="<%=rating.approachabilitylist.get(i) * (rref.maxScore)%>" aria-valuemin="0" aria-valuemax="<%=rref.maxScore%>"></div>
                    </div>
                    
                    <br/><br/>
                    
                    <label class="h5">Review Description: <%=rating.reviewlist.get(i)%></label><br/>
                    
                    <br/>
                    <a class="btn btn-lg btn-secondary" href="../homepage.jsp" role="button">Back</a>
                </div>
            </main>
        <%  } %><br>
        
        

        
        <%       
            }else{%>
            Search Failed!<br>
            <% }
         %>
         <br>

    </body>
</html>