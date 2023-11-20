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
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enroll Student</title>
    </head>
    <body>

        <jsp:useBean id="subject" class="profmanagement.Subject" scope="session" />
        <jsp:useBean id="student" class="profmanagement.Student" scope="session" />
        
        <%
            int student_id = Integer.parseInt(request.getParameter("studentid"));
            System.out.println(student_id);
            subject.studentToEnroll = student_id;
            subject.queryValidSubjects(student_id);
        %>    
                
        <main class="d-flex justify-content-center my-5">
            <div class="bg-light p-5 rounded shadow-sm w-50">
                
                    <h1 id = "title">Enrollment Status</h1>
                
                    <form action="enrollSuccess.jsp" action="POST" onSubmit="return validateDropdown()">
            
                        <label>Student ID: </label>
                        <label name="studentId"><%=student_id%></label><br/>

                        <% Iterator<Map.Entry<Integer, ArrayList<String>>> itr = subject.notTakenSubjects.entrySet().iterator(); %>
                        
                        Select a subject: 
                        <select class="form-select rounded p-2 w-25 my-2" name="subjectToTakeId"  id="subjectToTakeId">
                            <% while (itr.hasNext()) { %>
                                <% Map.Entry<Integer, ArrayList<String>> entry = itr.next(); %>
                                <option value="<%=entry.getKey()%>">
                                    <%=entry.getKey() + " - " + entry.getValue().get(0) + " | " + entry.getValue().get(1)%>
                                </option>
                            <% } %>

                        </select>
                            
                        <a class="btn btn-secondary" href="../homepage.jsp" role="button">Back</a>
                        <input class="btn btn-primary" type="submit" value="Enroll""/>
        
                    </form>   
            </div>
        </main>
                
        <% subject.notTakenSubjects.clear(); %>
        
        <!-- Dropdown validation script -->
        <script>
            function validateDropdown() {            
                var elementId = 'subjectToTakeId';
                if (document.getElementById(elementId).value === undefined || 
                        document.getElementById(elementId).value === "") {
                    // The error message goes here
                    window.location.href=`../error.jsp?errorMsg=${'No more subjects left to take!'}`;
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>
