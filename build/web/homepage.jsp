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
            font-family: 'comic sans ms'; /* Use the custom font */
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

       <a href = "" class="button_link">
         <button>
           Add student
         </button>
       </a>

       <a href = "" class="button_link">
         <button>
           Remove student
         </button>
       </a>

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
