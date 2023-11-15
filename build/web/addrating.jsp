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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add a Rating</title>
    </head>
    <body>
        <h1>Added Rating</h1>
        <jsp:useBean id="rating" class="profmanagement.Rating" scope="session" />
        <%
            int student_id = Integer.parseInt(request.getParameter("student_id"));
            int prof_id = Integer.parseInt(request.getParameter("prof_id"));
            int explanation = Integer.parseInt(request.getParameter("explanation"));
            int kindness = Integer.parseInt(request.getParameter("kindness"));
            int knowledgability = Integer.parseInt(request.getParameter("knowledgability"));
            int approachability = Integer.parseInt(request.getParameter("approachability"));
            String review = request.getParameter("description");
            
            rating.student_id = student_id;
            rating.professor_id = prof_id;
            rating.explanation = explanation;
            rating.kindness = kindness;
            rating.approachability = approachability;
            rating.knowledgability = knowledgability;
            rating.review = review;
            
            int res = rating.addRating();
            
            if(res == 1){
        %>    
        
        Added Ratings Success! <br>

                Student ID: <%=rating.student_id%><br>
                Professor ID: <%=rating.professor_id%><br>
                Explanation: <%=rating.explanation%><br>
                Kindness: <%=rating.kindness%><br>
                Knowledgability: <%=rating.knowledgability%><br>
                Approachability: <%=rating.approachability%><br>
                Review Description: <%=rating.review%><br>
                Date of Rating: <%=rating.rate_date%><br>
         <% } else{
         %>
         Add Ratings Failed!<br>
         <% }
         %>
        <br>
        click <a href="homepage.jsp">here to go back to home page</a><br>
    </body>
</html>
