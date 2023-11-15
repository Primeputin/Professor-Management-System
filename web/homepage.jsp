<%-- 
    Document   : homepage
    Created on : 11 9, 23, 10:28:10 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, professormanagement.*"%>
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
 
        <h4>Search for a student</h4>   

        <% student.loadRecord(); %>
        <form action="searchstudent.jsp" method="POST">
            Select student - 
                <select name="student"> 
                    <% for (int i=0; i < student.student_idList.size(); i++) { 
                                        %>
                            <option value="<%=student.student_idList.get(i)%>"><%=student.student_idList.get(i) + " - " +student.first_nameList.get(i) + " " + student.last_nameList.get(i)%></option>            
                    <% } %>
                </select><br><br>
  
            <input type="submit" value="View Student"/>
        </form>
     
       <h4>Add a student</h4>
       
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
       
       <h4>Remove a student</h4>
       
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
             
        <br><br>
        
        <h4>Modify a student</h4>
       
       <form action="modstudent.jsp" method="POST">
           
            Select a student -
    	     <select name="student"> 
                    <% for (int i=0; i < student.student_idList.size(); i++) { 
                                        %>
                            <option value="<%=student.student_idList.get(i)%>"><%=student.student_idList.get(i) + " - " +student.first_nameList.get(i) + " " + student.last_nameList.get(i)%></option>            
                    <% } %>
             </select><br>
       
    	     <label for="firstname">First name:</label>
    	     <input type="text" name="firstname" placeholder="First Name" required>

   	     <label for="lastname">Last name:</label>
   	     <input type="text" name="lastname" placeholder="Last Name" required>
             
             <br/>
             <label id="gpa-label-modify">0.0</label>
             <label for="gpa">GPA:</label>

   	     <input type="range" min="0.0" max="4.0" step="0.1" oninput="changeGPAValueModify(this.value)" name="gpa" placeholder="Last Name" required>
             <br/>
             <label for="cur_year">Current Year:</label>
   	     <input type="number" name="cur_year" placeholder="Current Year" required>
  
             <br/><br/>
            <input type="submit" value="Modify Student" />

       </form>
                


    <h2>Ratings</h2>

       <a href = "" class="button_link">
         <button>
           Search and view ratings
         </button>
       </a>

       <input/>

       <br><br>

       <a href = "" class="button_link">
         <button>
           Filter and list ratings
         </button>
       </a>

       <a href = "" class="button_link">
         <button>
           Add rating
         </button>
       </a>

       <a href = "" class="button_link">
         <button>
           Remove rating
         </button>
       </a>

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

       <h2>Rate a professor</h2>

       <h4>Professor ID</h4>
       <input placeholder="###"/>

       <h4>Explanation</h4>
       <input placeholder="1 - 10"/>

       <h4>Kindness</h4>
       <input placeholder="1 - 10"/>

       <h4>Approachability</h4>
       <input placeholder="1 - 10"/> <br/><br/>

       <h4>Knowledgability</h4>
       <input placeholder="1 - 10"/> <br/><br/>

       <a href ="" class="button_link">
         <button>
           Confirm
         </button>
       </a>

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
    
    function changeGPAValueModify(value) {
        document.getElementById("gpa-label-modify").innerHTML = value;
    }
    
</script>
    
    
