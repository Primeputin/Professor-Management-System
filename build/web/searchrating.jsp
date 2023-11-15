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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>search and View Rating</title>
    </head>
    <body>
        <h1>Search and View Rating</h1>
        <jsp:useBean id="rating" class="profmanagement.Rating" scope="session" />
         <%
            rating.student_id = Integer.parseInt(request.getParameter("student_id"));
            rating.professor_id = Integer.parseInt(request.getParameter("prof_id"));
            
            int res = rating.viewRecord();
            
            if(res == 1){
        %>
        Searched Results <br>
        <% 
            for (int i=0; i < rating.student_idlist.size(); i++) { %>
                Student ID: <%=rating.student_idlist.get(i)%><br>
                Professor ID: <%=rating.professor_idlist.get(i)%><br><br>
                Explanation: <%=rating.explanationlist.get(i)%><br>
                Kindness: <%=rating.kindnesslist.get(i)%><br>
                Knowledgability: <%=rating.knowledgabilitylist.get(i)%><br>
                Approachability: <%=rating.approachabilitylist.get(i)%><br>
                Review Description: <%=rating.reviewlist.get(i)%><br>
                Date of Rating: <%=rating.rate_datelist.get(i)%><br>
        <%       } 
            }else{%>
            Search Failed!<br>
            <% }
         %>
         <br>
         click <a href="homepage.jsp">here to go back to home page</a><br>
    </body>
</html>
