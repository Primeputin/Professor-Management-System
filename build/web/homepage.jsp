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
            <% if (prof.professor_idList.size() > 0) { %>
                <select name="professors"> 
                    
                    <% for (int i=0; i < prof.professor_idList.size(); i++) { 
                                        %>
                            <option value="<%=prof.professor_idList.get(i)%>"><%=prof.professor_idList.get(i) + " - " +prof.first_nameList.get(i) + " " + prof.last_nameList.get(i)%></option>            
                    <% } %>
                </select><br>
  
            <input type="submit" value="Search and view professor"/>
             <% } 
            else {%>
            Sorry! no Professors for searching and viewing
            <% } %>

             
        </form>
 

        <br><br>
        
        <form action="lastfilterprof.jsp" method="POST">

                     <label for="lastname">Last name:</label>
                     <input type="text"  name="lastname" placeholder="Last Name" required>


                    <input type="submit" value="Filter and list last name of the professor"/>

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
             Select professor - 
            <% if (prof.professor_idList.size() > 0) { %>
    	     <select name="professors"> 
                    <% for (int i=0; i < prof.professor_idList.size(); i++) { 
                                        %>
                            <option value="<%=prof.professor_idList.get(i)%>"><%=prof.professor_idList.get(i) + " - " +prof.first_nameList.get(i) + " " + prof.last_nameList.get(i)%></option>            
                    <% } %>
                </select><br>

  
            <input type="submit" value="Remove a professor"/>
             <% } 
            else {%>
            No professors to remove
            <% } %>

        </form>
        <br><br>
        <form action="modprof.jsp" method="POST">
             Select professor - 
             <% if (prof.professor_idList.size() > 0) { %>
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
            <% } 
            else {%>
            No professors to modify
            <% } %>

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
    
       <form action="searchrating_menu.jsp" method="POST">
           <h3>Search and View a Rating</h3>
             Select a student -
    	     <select name="student_id"> 
                    <% for (int i=0; i < student.student_idList.size(); i++) { 
                                        %>
                            <option value="<%=student.student_idList.get(i)%>"><%=student.student_idList.get(i) + " - " +student.first_nameList.get(i) + " " + student.last_nameList.get(i)%></option>            
                    <% } %>
             </select><br><br>
             
             <a href ="" class="button_link">
                <button>
                Proceed
            </button>
            </a>

        </form>

       <br><br>

       <form action="filter_rating_by_student.jsp" method="POST">
           <h3>Filter Rating by Student</h3>
            Select student - 
                <select name="student_id"> 
                    <% for (int i=0; i < student.student_idList.size(); i++) { 
                                        %>
                            <option value="<%=student.student_idList.get(i)%>"><%=student.student_idList.get(i) + " - " +student.first_nameList.get(i) + " " + student.last_nameList.get(i)%></option>            
                    <% } %>
                </select><br><br>

            <a href ="" class="button_link">
                <button>
                Filter by Student
            </button>
            </a>

        </form>
       
        <br><br>
        
        <form action="filter_rating_by_prof.jsp" method="POST">
           <h3>Filter Rating by Professor</h3>
             Select professor - 
                <select name="prof_id"> 
                    <% for (int i=0; i < prof.professor_idList.size(); i++) { 
                                        %>
                            <option value="<%=prof.professor_idList.get(i)%>"><%=prof.professor_idList.get(i) + " - " +prof.first_nameList.get(i) + " " + prof.last_nameList.get(i)%></option>            
                    <% } %>
                </select><br><br>

            <a href ="" class="button_link">
                <button>
                Filter by Professor
            </button>
            </a>

        </form>
       
        <br><br>
      
       <form action="addrating_menu.jsp" method="POST">
            <h3>Rate a professor</h3>
             Select a student -
    	     <select name="student_id"> 
                    <% for (int i=0; i < student.student_idList.size(); i++) { 
                                        %>
                            <option value="<%=student.student_idList.get(i)%>"><%=student.student_idList.get(i) + " - " +student.first_nameList.get(i) + " " + student.last_nameList.get(i)%></option>            
                    <% } %>
             </select><br><br>
             
             <a href ="" class="button_link">
                <button>
                Proceed
            </button>
            </a>
       </form>
       
       <br/><br/>

       
       <form action="rmrating_menu.jsp" method="POST">
           <h3>Remove a Rating</h3>
             Select a student -
    	     <select name="student_id"> 
                    <% for (int i=0; i < student.student_idList.size(); i++) { 
                                        %>
                            <option value="<%=student.student_idList.get(i)%>"><%=student.student_idList.get(i) + " - " +student.first_nameList.get(i) + " " + student.last_nameList.get(i)%></option>            
                    <% } %>
             </select><br><br>
             
             <a href ="" class="button_link">
                <button>
                Proceed
            </button>
            </a>

        </form>
       
       <form action="modrating_menu.jsp" method="POST">
           <h3>Modify a Rating</h3>
             Select a student -
    	     <select name="student_id"> 
                    <% for (int i=0; i < student.student_idList.size(); i++) { 
                                        %>
                            <option value="<%=student.student_idList.get(i)%>"><%=student.student_idList.get(i) + " - " +student.first_nameList.get(i) + " " + student.last_nameList.get(i)%></option>            
                    <% } %>
             </select><br><br>
             
             <a href ="" class="button_link">
                <button>
                Proceed
            </button>
            </a>

        </form>

    <h2>Subjects</h2>
    
       <jsp:useBean id="subject" class="profmanagement.Subject" scope="session" /> 
       
        <% subject.loadRecord(); %>
        
        <form action="searchsubject.jsp" method="POST">
            Select subject -
            <select name="subjects">
                <% for (int i=0; i < subject.subject_idList.size(); i++) { %>
                    <option value="<%=subject.subject_idList.get(i)%>">
                        <%=subject.subject_idList.get(i) + " - " + subject.subject_nameList.get(i)%>
                    </option>
                <% } %>
            </select><br>

            <input type="submit" value="Search and view subject"/>
        </form>
            
            <br><br>
            
        <form action="filtersubject.jsp" method="POST">
            Select subject prefix:
            <select name="prefix">
                <% 
                    ArrayList<String> prefixes = subject.getDistinctPrefixes(); 
                    
                    for (String prefix : prefixes) { %>
                    <option value="<%=prefix%>"><%=prefix%></option>
                <% } %>
            </select>

            <input type="submit" value="Filter and list subjects"/>
        </form>
        
        <br><br>

        <form action="addsubject.jsp" method="POST">
            <label for="subjectname">Subject Name:</label>
            <input type="text" name="subjectname" pattern="[A-Za-z0-9]{7}" placeholder="ex. CCPROG1" required>

            <label for="units">Units:</label>
            <input type="number" min="1" max="5" name="units" placeholder="Units" required>
            
            <br>
            <label for="professorid">Professor:</label>
            <select name="professorid">
                <% for (int i=0; i < prof.professor_idList.size(); i++) { %>
                    <option value="<%=prof.professor_idList.get(i)%>">
                        <%=prof.professor_idList.get(i) + " - " + prof.first_nameList.get(i) + " " + prof.last_nameList.get(i)%>
                    </option>
                <% } %>
            </select><br>

            <label for="subject_year">Subject Year:</label>
            <input type="text" name="subject_year" pattern="[0-9]{4}" placeholder="YYYY" required>

            <label for="term">Term:</label>
            <input type="number" name="term" min="1" max="3" placeholder="1, 2, or 3" required>

            <input type="submit" value="Add a subject" />
        </form>

       <br><br>

        <form action="rmsubject.jsp" method="POST">
            Select a subject -
            <select name="subject">
                <% for (int i=0; i < subject.subject_idList.size(); i++) { %>
                    <option value="<%=subject.subject_idList.get(i)%>">
                        <%=subject.subject_idList.get(i) + " - " + subject.subject_nameList.get(i)%>
                    </option>
                <% } %>
            </select><br>

            <input type="submit" value="Remove a subject"/>
        </form>

       <br><br>
        <form action="modsubject.jsp" method="POST">
             Select a subject -
             <select name="subjects">
                 <% for (int i=0; i < subject.subject_idList.size(); i++) { %>
                     <option value="<%=subject.subject_idList.get(i)%>">
                         <%=subject.subject_idList.get(i) + " - " + subject.subject_nameList.get(i)%>
                     </option>
                 <% } %>
             </select><br>

             <label for="subjectname">New Subject Name:</label>
            <input type="text" name="subjectname" pattern="[A-Za-z0-9]{7}" placeholder="ex. CCPROG1" required>

            <label for="units">Units:</label>
            <input type="number" min="1" max="5" name="units" placeholder="Units" required>
             <br>
             <label for="professor">New Professor:</label>
             <select name="professor">
                 <% for (int i=0; i < prof.professor_idList.size(); i++) { %>
                     <option value="<%=prof.professor_idList.get(i)%>">
                         <%=prof.professor_idList.get(i) + " - " + prof.first_nameList.get(i) + " " + prof.last_nameList.get(i)%>
                     </option>
                 <% } %>
             </select><br>
             
            <label for="subject_year">New Subject Year:</label>
            <input type="text" name="subject_year" pattern="[0-9]{4}" placeholder="YYYY" required>

            <label for="term">New Term:</label>
            <input type="number" name="term" min="1" max="3" placeholder="1, 2, or 3" required>

             <input type="submit" value="Modify a subject"/>
         </form>

       <br><br>


       <form action="enroll.jsp" method="POST">
           <h1> Enroll </h1>
               
             Select student - 
                <select name="studentid"> 
                    <% for (int i=0; i < student.student_idList.size(); i++) { 
                                        %>
                            <option value="<%=student.student_idList.get(i)%>"><%=student.student_idList.get(i) + " - " +student.first_nameList.get(i) + " " + student.last_nameList.get(i)%></option>            
                    <% } %>
                </select><br><br>
                
                <input type="submit" value="enroll la"/>

        </form>
       <br/><br/>

       

    <h2>Overall rankings of Professors per subject in a year</h2>
    
    <% subject.loadDistinctSubjects(); %>

    
    <form action="rankofprofofsub.jsp" method="POST">
            Select subject - 
            <% if (subject.distinctSubjectNames.size() > 0) { %>
            <select name="subjectname">
                <% for (int i=0; i <subject.distinctSubjectNames.size(); i++) { %>
                    <option value="<%=subject.distinctSubjectNames.get(i)%>">
                        <%=(i+1) + " - " + subject.distinctSubjectNames.get(i)%>
                    </option>
                <% } %>
            </select><br>

            <label for="subject_year">Subject Year:</label>
            <input type="text" name="subject_year" pattern="[0-9]{4}" placeholder="YYYY" required>

            <input type="submit" value="Rankings of Professors per subject in a year" />
            <% } 
            else {%>
            No available subjects to rank by in general
            <% } %>
        </form>
            <br>
    
    <h2>Rankings of Professors per subject based on a single attribute in a year</h2>
    <form action="" method="POST">
            Select subject - 
            <% if (subject.distinctSubjectNames.size() > 0) { %>
            <select name="subjectname">
                <% for (int i=0; i <subject.distinctSubjectNames.size(); i++) { %>
                    <option value="<%=subject.distinctSubjectNames.get(i)%>">
                        <%=(i+1) + " - " + subject.distinctSubjectNames.get(i)%>
                    </option>
                <% } %>
            </select><br>
            
            <label for="subject_year">Subject Year:</label>
            <input type="text" name="subject_year" pattern="[0-9]{4}" placeholder="YYYY" required>
            
            <button type="submit" formaction="rankofprofbyexplanation.jsp">Explanation</button>
            <button type="submit" formaction="rankofprofbykindness.jsp">Kindness</button>
            <button type="submit" formaction="rankofprofbyknowledgability.jsp">Knowledgeability</button>
            <button type="submit" formaction="rankofprofbyapproachability.jsp">Approachability</button>
            <% } 
            else {%>
            No available subjects to rank by a specific attribute
            <% } %>
        
    </form>
    
  
        
    </body>
</html>

<script>
    function changeGPAValue(value) {
        document.getElementById("gpa-label").innerHTML = value;
    }
    
</script>
    
    
