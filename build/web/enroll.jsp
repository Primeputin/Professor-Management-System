<%-- 
    Document   : addsubject
    Created on : 11 14, 23, 8:48:23 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, profmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enroll Student</title>
    </head>
    <body>
        <h1 id = "title">Enrollment Status</h1>
        <jsp:useBean id="subject" class="profmanagement.Subject" scope="session" />
        <jsp:useBean id="student" class="profmanagement.Student" scope="session" />
        
        <%
            int student_id = Integer.parseInt(request.getParameter("studentid"));
            subject.studentToEnroll = student_id;
            subject.queryValidSubjects(student_id);
        %>    
        Enrollment success! <br>
        
        Select a subject my nigger: 
 
        <form action="enrollSuccess.jsp" action="POST">
            
            <label>Student ID: </label>
            <label name="studentId"><%=student_id%></label><br/>
            
            <% Iterator<Map.Entry<Integer, ArrayList<String>>> itr = subject.notTakenSubjects.entrySet().iterator(); %>
            <select name="subjectToTakeId">
                <% while (itr.hasNext()) { %>
                    <% Map.Entry<Integer, ArrayList<String>> entry = itr.next(); %>
                    <option value="<%=entry.getKey()%>">
                        <%=entry.getKey() + " - " + entry.getValue().get(0) + " | " + entry.getValue().get(1)%>
                    </option>
                <% } %>

            </select>
            
            <input type="submit" value="Enroll"/>
        
        </form>
                
        <% subject.notTakenSubjects.clear(); %>
                
        <br>
        click <a href="homepage.jsp">here to go back to home page</a><br>
    </body>
</html>
