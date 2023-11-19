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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove a Rating</title>
    </head>
    <body>
        <form action="rmrating.jsp" method="POST">
           <h3>Remove a Rating</h3>
           <jsp:useBean id="rating" class="profmanagement.Rating" scope="session" />
           <jsp:useBean id="prof" class="profmanagement.Professor" scope="session" />
             <%
            rating.student_id = Integer.parseInt(request.getParameter("student_id"));
            prof.loadRecordByRatings(rating.student_id);
            %>
             <%if(prof.professor_idList.size() != 0){%>
             Select professor - 
                <select name="prof_id"> 
                    <% 
                        for (int i=0; i < prof.professor_idList.size(); i++) { 
                                        %>
                            <option value="<%=prof.professor_idList.get(i)%>"><%=prof.professor_idList.get(i) + " - " +prof.first_nameList.get(i) + " " + prof.last_nameList.get(i)%></option>            
                    <% } %>
                </select><br>
             
             <a href ="" class="button_link">
                <button>
                Remove
            </button>
            </a>
             <% } else{ %>
                Student has not rated any Professors!<br>
                <% } %>
             <br><br>
             click <a href="homepage.jsp">here to go back to home page</a><br>

        </form>
    </body>
</html>
