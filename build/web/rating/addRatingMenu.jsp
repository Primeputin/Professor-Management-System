<%-- 
    Document   : addrating_menu
    Created on : 11 17, 23, 11:54:45 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, profmanagement.*"%>
<!DOCTYPE html>
<html>
    <
    
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add a Rating</title>
    </head>
    <body>
        <div class="text-center">
            <h1 class="m-5">Add a Rating</h1>
        </div>
        <main class="d-flex flex-column justify-content-center align-i-center">
                
                    <jsp:useBean id="rating" class="profmanagement.Rating" scope="session" />
                    <jsp:useBean id="rating_ref" class="profmanagement.RatingRef" scope="session" />
                    <jsp:useBean id="prof" class="profmanagement.Professor" scope="session" />

                    <%
                    rating.student_id = Integer.parseInt(request.getParameter("student_id"));
                    prof.loadRecordByEnrolled(rating.student_id);
                    
                    %>

                     <%if(prof.professor_idList.size() != 0){%>
                        <form class="mx-auto" action="addRating.jsp" method="POST">
                            Select professor - 
                               <select class="form-select rounded p-2 w-75 my-2" name="prof_id"> 
                                   <% 
                                       for (int i=0; i < prof.professor_idList.size(); i++) { 
                                                       %>
                                           <option value="<%=prof.professor_idList.get(i)%>"><%=prof.professor_idList.get(i) + " - " +prof.first_nameList.get(i) + " " + prof.last_nameList.get(i)%></option>            
                                   <% } %>
                               </select><br>

                           <% rating_ref.getMaxRating(); 
                           rating_ref.getMinRating();%>
                           <label id="explanation-label">5</label>
                           <label for="explanation">Explanation:</label>
                           <input class="form-range w-75" type="range" min="<%=rating_ref.minScore%>" max="<%=rating_ref.maxScore%>" step="1" oninput="changeExplanationValue(this.value)" name="explanation" required><br>

                           <label id="kindness-label">5</label>
                           <label for="kindness">Kindness:</label>
                           <input class="form-range w-75" type="range" min="<%=rating_ref.minScore%>" max="<%=rating_ref.maxScore%>" step="1" oninput="changeKindnessValue(this.value)" name="kindness" required><br>

                           <label id="knowledgability-label">5</label>
                           <label for="knowledgability">Knowledgability:</label>
                           <input class="form-range w-75" type="range" min="<%=rating_ref.minScore%>" max="<%=rating_ref.maxScore%>" step="1" oninput="changeKnowledgabilityValue(this.value)" name="knowledgability" required><br>

                           <label id="approachability-label">5</label>
                           <label for="approachability">Approachability:</label>
                           <input class="form-range w-75" type="range" min="<%=rating_ref.minScore%>" max="<%=rating_ref.maxScore%>" step="1" oninput="changeApproachabilityValue(this.value)" name="approachability" required><br>

                           <h4>Review Description</h4>
                           <input class="rounded p-2 w-75 my-2" type="text" name="description" placeholder="Describe your experience" required/> <br/><br/>


                           <div class="position-absolute w-100 d-flex justify-content-between align-items-center">
                               <input class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Add Rating"/>
                           </div> 
                        </form>

                    <% } else{ %>

                    <div class="mx-auto">
                        <h1 class="h1">Student cannot add a rating!</h1><br/>
                        <div style="bottom: 10px" class="mt-5">
                            <a class="btn btn-lg btn-secondary" href="../homepage.jsp" role="button">Back</a>
                        </div>
                    </div>
                   <% } %>

               
               
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