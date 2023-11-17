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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify a Rating</title>
    </head>
    <body>
        <h1>Modify a Rating</h1>
        <jsp:useBean id="rating" class="profmanagement.Rating" scope="session" />
        <jsp:useBean id="nr" class="profmanagement.NameRetriever" scope="session" />
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
            
            
            
        %>
        Modified Ratings Success! <br><br>

                Student ID: <%=rating.student_id%><br>
                Student Name: <%=nr.student_first_name%> <%=nr.student_last_name%><br><br>
                Professor ID: <%=rating.professor_id%><br>
                Professor Name: <%=nr.prof_first_name%> <%=nr.prof_last_name%><br><br>
                Explanation: <%=rating.explanation%><br>
                Kindness: <%=rating.kindness%><br>
                Knowledgability: <%=rating.knowledgability%><br>
                Approachability: <%=rating.approachability%><br>
                Review Description: <%=rating.review%><br>
                Date of Rating: <%=rating.rate_date%><br>
        <br>
        click <a href="homepage.jsp">here to go back to home page</a><br>
    </body>
</html>
