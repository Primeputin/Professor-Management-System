<%-- 
    Document   : modrating_menu
    Created on : 11 16, 23, 11:03:36 PM
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
        <div class="text-center">
            <h1 class="m-5">Added Professor</h1>
        </div>
        
        <main class="d-flex justify-content-center">
            <div class="bg-light p-5 rounded shadow-sm w-50 mb-2">
                <form action="modRating.jsp" method="POST">
                   <h3>Modify a Rating</h3>
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
                    
                    <label for="explanation">Explanation:</label>
                    <label id="explanation-label">5</label><br/>
                    <input class="form-range w-25" type="range" min="1" max="10" step="1" oninput="changeExplanationValue(this.value)" name="explanation" required><br>

                   <label for="kindness">Kindness:</label>
                    <label id="kindness-label">5</label><br/>
                    <input class="form-range w-25" type="range" min="1" max="10" step="1" oninput="changeKindnessValue(this.value)" name="kindness" required><br>

                    <label for="approachability">Knowledgability:</label>
                    <label id="approachability-label">5</label><br/>
                    <input class="form-range w-25" type="range" min="1" max="10" step="1" oninput="changeKnowledgabilityValue(this.value)" name="knowledgability" required><br>

                    <label for="approachability">Approachability:</label>
                    <label id="approachability-label">5</label><br/>
                    <input class="form-range w-25" type="range" min="1" max="10" step="1" oninput="changeApproachabilityValue(this.value)" name="approachability" required><br>

                    <h4>Review Description</h4>
                    <input type="text" name="description" placeholder="Describe your experience" required/> <br/><br/>

                    <a href ="" class="button_link">
                    <button>
                       Modify rating
                    </button>
                    </a>

                     <% } else{ %>
                        Student has not rated any Professors!<br>
                        <% } %>
                     <br><br>
                     
                     <a class="btn btn-secondary" href="../homepage.jsp">Back</a><br>

                </form>
            </div>
        </main>
    </body>
</html>

<script>
    function changeExplanationValue(value) {
        document.getElementById("explanation-label").innerHTML = value;
    }
    
    function changeKindnessValue(value) {
        document.getElementById("kindness-label").innerHTML = value;
    }
    
    function changeApproachabilityValue(value) {
        document.getElementById("approachability-label").innerHTML = value;
    }
    
    function changeKnowledgabilityValue(value) {
        document.getElementById("knowledgability-label").innerHTML = value;
    }
    
</script>
