<%-- 
    Document   : homepage
    Created on : 11 9, 23, 10:28:10 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, profmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>

      <title>Professor Management System</title>

      <style>
        body {
            font-family: 'Arial'; /* Use the custom font */
            color: black;
        }

        .button_link {
          color: black;
          text-decoration: none;
        }

      </style>

    </head>
    <body>

    <h2>Professor</h2>
        <jsp:useBean id="prof" class="profmanagement.Professor" scope="session" />
 

        <% prof.loadRecord(); %>
        <form action="searchprof.jsp" method="POST">
            Select professor - 
                <select name="professors"> 
                    <% for (int i=0; i < prof.professor_idList.size(); i++) { 
                                        %>
                            <option value="<%=prof.professor_idList.get(i)%>"><%=prof.professor_idList.get(i) + " - " +prof.first_nameList.get(i) + " " + prof.last_nameList.get(i)%></option>            
                    <% } %>
                </select><br>
  
            <input type="submit" value="Search and view professor"/>
        </form>
 

        <br><br>
        
        
        <form action="filterprof.jsp" method="POST">

                     <label for="firstname">First name:</label>
                     <input type="text"  name="firstname" placeholder="First Name" required>

                     <label for="lastname">Last name:</label>
                     <input type="text"  name="lastname" placeholder="Last Name" required>


                    <input type="submit" value="Filter and list professor"/>

        </form>
        <br><br>
        <form action="addprof.jsp" method="POST">
       
    	     <label for="firstname">First name:</label>
    	     <input type="text" name="firstname" placeholder="First Name" required>

   	     <label for="lastname">Last name:</label>
   	     <input type="text" name="lastname" placeholder="Last Name" required>

  
            <input type="submit" value="Add a professor" />

        </form>
        <br><br>
        <form action="rmprof.jsp" method="POST">
             Select a professor -
    	     <select name="professors"> 
                    <% for (int i=0; i < prof.professor_idList.size(); i++) { 
                                        %>
                            <option value="<%=prof.professor_idList.get(i)%>"><%=prof.professor_idList.get(i) + " - " +prof.first_nameList.get(i) + " " + prof.last_nameList.get(i)%></option>            
                    <% } %>
                </select><br>

  
            <input type="submit" value="Remove a professor"/>

        </form>
        <br><br>
        <form action="modprof.jsp" method="POST">
             Select a professor -
    	     <select name="professors"> 
                    <% for (int i=0; i < prof.professor_idList.size(); i++) { 
                                        %>
                            <option value="<%=prof.professor_idList.get(i)%>"><%=prof.professor_idList.get(i) + " - " +prof.first_nameList.get(i) + " " + prof.last_nameList.get(i)%></option>            
                    <% } %>
              </select><br>
               
             <label for="firstname">First name:</label>
    	     <input type="text" name="firstname" placeholder="First Name" required>

   	     <label for="lastname">Last name:</label>
   	     <input type="text" name="lastname" placeholder="Last Name" required>
  
            <input type="submit" value="Modify a professor"/>

        </form>
    <h2>Student</h2>
    
        <jsp:useBean id="student" class="profmanagement.Student" scope="session" />
 

        <% student.loadRecord(); %>
        <form action="searchstudent.jsp" method="POST">
            Select student - 
                <select name="students"> 
                    <% for (int i=0; i < student.student_idList.size(); i++) { 
                                        %>
                            <option value="<%=student.student_idList.get(i)%>"><%=student.student_idList.get(i) + " - " +student.first_nameList.get(i) + " " + student.last_nameList.get(i)%></option>            
                    <% } %>
                </select><br>
  
            <input type="submit" value="Search and view professor"/>
        </form>

       <a href = "" class="button_link">
         <button>
           Search and view student
         </button>
       </a>

       <input/>

       <br><br>

       <a href = "" class="button_link">
         <button>
           Filter and list student
         </button>
       </a>
       
       <br/><br/>
       
       <form action="addstudent.jsp" method="POST">
       
    	     <label for="firstname">First name:</label>
    	     <input type="text" name="firstname" placeholder="First Name" required>

   	     <label for="lastname">Last name:</label>
   	     <input type="text" name="lastname" placeholder="Last Name" required>
             
             <br/>
             <label id="gpa-label">0.0</label>
             <label for="gpa">GPA:</label>

   	     <input type="range" min="0.0" max="4.0" step="0.1" oninput="changeGPAValue(this.value)" name="gpa" placeholder="Last Name" required>
             
             <label for="cur_year">Current Year:</label>
   	     <input type="number" name="cur_year" placeholder="Current Year" required>
  
             <br/><br/>
            <input type="submit" value="Add a student" />

       </form>
       
       <br/>
       
        <form action="rmstudent.jsp" method="POST">
             Select a student -
    	     <select name="student"> 
                    <% for (int i=0; i < student.student_idList.size(); i++) { 
                                        %>
                            <option value="<%=student.student_idList.get(i)%>"><%=student.student_idList.get(i) + " - " +student.first_nameList.get(i) + " " + student.last_nameList.get(i)%></option>            
                    <% } %>
             </select><br>
             
             <input type="submit" value="Remove student" />

        </form>
                


    <h2>Ratings</h2>

       <form action="searchrating.jsp" method="POST">
           <h3>Search and View a Rating</h3>
             Select a student -
    	     <input type="number" name="student_id" placeholder="###" required/><br>
             
             Select a professor - 
             <input type="number" name="prof_id" placeholder="###" required/><br>
             
             <a href ="" class="button_link">
                <button>
                Search
            </button>
            </a>

        </form>

       <br><br>

       <form action="filter_rating_by_student.jsp" method="POST">
           <h3>Filter Rating by Student</h3>
            Enter Student ID -
            <input type="number"  name="student_id" placeholder="###" required><br>

            <a href ="" class="button_link">
                <button>
                Filter by Student
            </button>
            </a>

        </form>
       
        <br><br>
        
        <form action="filter_rating_by_prof.jsp" method="POST">
           <h3>Filter Rating by Professor</h3>
            Enter Professor ID -
            <input type="number"  name="prof_id" placeholder="###" required><br>

            <a href ="" class="button_link">
                <button>
                Filter by Professor
            </button>
            </a>

        </form>
       
        <br><br>
      
       <form action="addrating.jsp" method="POST">
            <h3>Rate a professor</h3>

            <h4>Student ID</h4>
            <input type="number" name="student_id" placeholder="###" required/>
       
            <h4>Professor ID</h4>
            <input type="number" name="prof_id" placeholder="###" required/><br>
            
            <label id="explanation-label">5</label>
            <label for="explanation">Explanation:</label>
            <input type="range" min="1" max="10" step="1" oninput="changeExplanationValue(this.value)" name="explanation" required><br>
            
            <label id="kindness-label">5</label>
            <label for="kindness">Kindness:</label>
            <input type="range" min="1" max="10" step="1" oninput="changeKindnessValue(this.value)" name="kindness" required><br>
            
            <label id="knowledgability-label">5</label>
            <label for="knowledgability">Knowledgability:</label>
            <input type="range" min="1" max="10" step="1" oninput="changeKnowledgabilityValue(this.value)" name="knowledgability" required><br>
            
            <label id="approachability-label">5</label>
            <label for="approachability">Approachability:</label>
            <input type="range" min="1" max="10" step="1" oninput="changeApproachabilityValue(this.value)" name="approachability" required><br>

            <h4>Review Description</h4>
            <input type="text" name="description" placeholder="Describe your experience" required/> <br/><br/>

            <a href ="" class="button_link">
                <button>
                Confirm
            </button>
            </a>
       </form>
       
       <br/><br/>

       
       <form action="rmrating.jsp" method="POST">
           <h3>Remove a Rating</h3>
             Select a student -
    	     <input type="number" name="student_id" placeholder="###" required/><br>
             
             Select a professor - 
             <input type="number" name="prof_id" placeholder="###" required/><br>
             
             <a href ="" class="button_link">
                <button>
                Remove rating
            </button>
            </a>

        </form>

    <h2>Subjects</h2>

       <a href = "" class="button_link">
         <button>
           Search and view subjects
         </button>
       </a>

       <input/>

       <br><br>

       <a href = "" class="button_link">
         <button>
           Filter and list subjects
         </button>
       </a>

       <a href = "" class="button_link">
         <button>
           Add subject
         </button>
       </a>

       <a href = "" class="button_link">
         <button>
           Remove subject
         </button>
       </a>

       <br><br>

       <h2>Enroll</h2>

       <h4>Subject ID</h4>
       <input placeholder="###"/>

       <h4>Student ID</h4>
       <input placeholder=""/>

       <br/><br/>

       <a href = "" class="button_link">
         <button>
           Enroll this nigga
         </button>
       </a>

       <br/><br/>

       

    <h1> Report </h1>

    <ul>
        <li><a>Rankings of Professors per subject in a year</a></li>
        <li><a>Rankings of Professors per subject based on a single attribute in a year</a></li>
    </ul>
    </body>
</html>

<script>
    
    function changeGPAValue(value) {
        document.getElementById("gpa-label").innerHTML = value;
    }
    
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
    
    
