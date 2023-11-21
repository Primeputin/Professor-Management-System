
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, profmanagement.*"%>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <title>Professor Management System</title>
        
        <style>
            #card-component {
                height: 650px;
            }
        </style>
        

    </head>
    <body>

        <!-- Global Beans -->
        <jsp:useBean id="prof" class="profmanagement.Professor" scope="session" />
        <jsp:useBean id="student" class="profmanagement.Student" scope="session" />
        <jsp:useBean id="subject" class="profmanagement.Subject" scope="session" />

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
            <a class="navbar-brand mx-4" href="#" id = "mainButton">Professor Management System</a>

            <div>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active" id="profButton">
                        <a class="nav-link" href="#">Professor</a>
                    </li>
                    <li class="nav-item" id="studentButton">
                        <a class="nav-link" href="#">Student</a>
                    </li>
                    <li class="nav-item" id="ratingEquivalentButton">
                        <a class="nav-link" href="#">Rating Equivalent Settings</a>
                    </li>
                    <li class="nav-item" id="ratingsButton">
                        <a class="nav-link" href="#">Ratings</a>
                    </li>
                    <li class="nav-item" id="subjectsButton">
                        <a class="nav-link" href="#">Subjects</a>
                    </li>
                    <li class="nav-item" id="enrollmentButton">
                        <a class="nav-link" href="#">Enrollment and Ranking</a>
                    </li>
                </ul>

            </div>
        </nav>
         
        <section class="jumbotron text-center">
            <div class="container py-5">
                <h1 class="jumbotron-heading">Welcome to the Professor Management System.</h1>
                <p class="lead text-muted">To get started, kindly select an option from the navigation bar.</p>
            </div>
        </section>

        <!-- Section Start -->
        <div class="album py-5 bg-light" id="professorDiv">
            <% prof.loadRecord(); %>
            <!-- Section Title -->
            <div class="text-center mb-4">
                <h1 class="align-self-center">Professor</h1>
            </div>
            
            <div class="container">
                <div class="row">
                    
                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body">
                                <h5 class="card-title">Search for a Professor</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form  action="professor/searchProf.jsp" method="POST" onSubmit="return validateDropdown('professorDropDownId', 'No professors found! Add some!')">

                                    <div class="form-group">
                                        <label>Professor - </label><br/>
                                        <select class="form-select rounded p-2 w-75" name="professors" id="professorDropDownId">
                                            <% for (int i=0; i < prof.professor_idList.size(); i++) { 
                                                                %>
                                                    <option value="<%=prof.professor_idList.get(i)%>"><%=prof.professor_idList.get(i) + " - " +prof.first_nameList.get(i) + " " + prof.last_nameList.get(i)%></option>            
                                            <% } %>
                                        </select>
                                        <br/>
                                        <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                            <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Search"/>
                                        </div>

                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                    <!-- Component End -->
                                        
                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body" >
                                <h5 class="card-title">Filter Professor Last Names</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form action="professor/lastFilterProf.jsp" method="POST">
                                    <label for="lastname">Last name - </label><br/>
                                    <input class="border rounded p-2 w-75" type="text"  name="lastname" placeholder="Last Name" required>

                                   <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                       <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Filter"/>
                                   </div>
                                </form>       
                            </div>
                        </div>
                    </div>
                    <!-- Component End -->
                    
                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body" >

                                <h5 class="card-title">Filter Professor Full Name</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form action="professor/filterProf.jsp" method="POST">

                                             <label class="m-1" for="firstname">First name:</label><br/>
                                             <input class="border rounded p-2 w-75" type="text"  name="firstname" placeholder="First Name" required>
                                             <br/>
                                             <label class="m-1" for="lastname">Last name:</label><br/>
                                             <input class="border rounded p-2 w-75" type="text"  name="lastname" placeholder="Last Name" required>

                                            <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                                <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Filter"/>
                                            </div>

                                </form>     
                            </div>
                        </div>
                    </div>
                    <!-- Component End -->
                    
                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body" >

                                <h5 class="card-title">Filter Professor By Department</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form action="professor/filterDepartmentProf.jsp" method="POST">

                                             <label>Department - </label><br/>
                                             <select class="form-select rounded p-2 w-75" name="department">
                                                 <option value= "CCS"> CCS </option>            
                                                 <option value= "COB"> COB </option> 
                                                 <option value= "CLA"> CLA </option> 
                                                 <option value= "COS"> COS </option> 
                                                 <option value= "GCOE"> GCOE </option>
                                            </select>

                                            <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                                <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Filter"/>
                                            </div>

                                </form>     
                            </div>
                        </div>
                    </div>
                    <!-- Component End -->
                    
                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body" >

                                <h5 class="card-title">Add a Professor</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form action="professor/addProf.jsp" method="POST">

                                             <label class="m-1" for="firstname">First name:</label><br/>
                                             <input class="border rounded p-2 w-75" type="text"  name="firstname" placeholder="First Name" required>
                                             <br/>
                                             <label class="m-1" for="lastname">Last name:</label><br/>
                                             <input class="border rounded p-2 w-75" type="text"  name="lastname" placeholder="Last Name" required>
                                             <br/>
                                             <label class="m-1">Department - </label><br/>
                                             <select class="form-select rounded p-2 w-75" name="department">
                                                 <option value= "CCS"> CCS </option>            
                                                 <option value= "COB"> COB </option> 
                                                 <option value= "CLA"> CLA </option> 
                                                 <option value= "COS"> COS </option> 
                                                 <option value= "GCOE"> GCOE </option>
                                            </select>

                                            <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                                <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Add"/>
                                            </div>

                                </form>     
                            </div>
                        </div>
                    </div>
                    <!-- Component End -->
                    
                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body">

                                <h5 class="card-title">Remove a Professor</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form  action="professor/removeProf.jsp" method="POST" onSubmit="return validateDropdown('professorDropDownId', 'No professors found! Add some!')">
                                    <div class="form-group">
                                        <label>Professor - </label><br/>
                                        <select class="form-select rounded p-2 w-75" name="professors">
                                            <% for (int i=0; i < prof.professor_idList.size(); i++) { 
                                                                %>
                                                    <option value="<%=prof.professor_idList.get(i)%>"><%=prof.professor_idList.get(i) + " - " +prof.first_nameList.get(i) + " " + prof.last_nameList.get(i)%></option>            
                                            <% } %>
                                        </select>
                                        <br/>
                                        <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                            <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Remove"/>
                                        </div>

                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                    <!-- Component End -->
                    
                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body" >
                                <h5 class="card-title">Modify a Professor</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form action="professor/modProf.jsp" method="POST" onSubmit="return validateDropdown('modProfId', 'No professors found! Add some!')">

                                            <label>Professor - </label><br/>
                                            <select class="form-select rounded p-2 w-75 my-2" name="professors" id="modProfId">
                                                <% for (int i=0; i < prof.professor_idList.size(); i++) { 
                                                                    %>
                                                        <option value="<%=prof.professor_idList.get(i)%>"><%=prof.professor_idList.get(i) + " - " +prof.first_nameList.get(i) + " " + prof.last_nameList.get(i)%></option>            
                                                <% } %>
                                            </select>

                                             <label class="m-1" for="firstname">First name:</label><br/>
                                             <input class="border rounded p-2 w-75" type="text"  name="firstname" placeholder="First Name" required>
                                             <br/>
                                             <label class="m-1" for="lastname">Last name:</label><br/>
                                             <input class="border rounded p-2 w-75" type="text"  name="lastname" placeholder="Last Name" required>

                                             <label>Department - </label><br/>
                                             <select class="form-select rounded p-2 w-75" name="department">
                                                 <option value= "CCS"> CCS </option>            
                                                 <option value= "COB"> COB </option> 
                                                 <option value= "CLA"> CLA </option> 
                                                 <option value= "COS"> COS </option> 
                                                 <option value= "GCOE"> GCOE </option>
                                            </select>

                                            <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                                <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Modify"/>
                                            </div>

                                </form>     
                            </div>
                        </div>
                    </div>
                    <!-- Component End -->
                                        
                </div>    
            </div>                              
        </div>
        <!-- Section End -->
        
        <!-- Section Start -->                            
        <div class="album py-5 bg-light" id="studentDiv">
            <% student.loadRecord(); %>
            <div class="text-center mb-4">
                <h1 class="align-self-center">Student</h1>
            </div>
            
            <div class="container">
                <div class="row">
            
                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body">

                                <h5 class="card-title">Search for a Student</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form action="student/searchStudent.jsp" method="POST" onSubmit="return validateDropdown('studentDropDownId', 'No students found! Add some!')">
                                    <label>Select a student - </label><br/>
                                    <select class="form-select rounded p-2 w-75 my-2" name="student" id="studentDropDownId">
                                        <% for (int i=0; i < student.student_idList.size(); i++) {
                                                            %>
                                                <option value="<%=student.student_idList.get(i)%>"><%=student.student_idList.get(i) + " - " +student.first_nameList.get(i) + " " + student.last_nameList.get(i)%></option>
                                        <% } %>
                                    </select><br><br>

                                    <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                        <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Search"/>
                                    </div>                            
                                </form>

                            </div>
                        </div>
                    </div>
                    <!-- Component End -->
                    
                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body" >
                                <h5 class="card-title">Add a Student</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form action="student/addStudent.jsp" method="POST">

                                    <label for="firstname">First name:</label></br>
                                    <input class="border rounded p-2 w-75" type="text" name="firstname" placeholder="First Name" required>
                                    <br/>
                                    <label for="lastname">Last name:</label></br>
                                    <input class="border rounded p-2 w-75 mb-2" type="text" name="lastname" placeholder="Last Name" required>

                                    <br/>

                                    <label for="gpa">GPA:</label>
                                    <label id="gpa-label">0.0</label><br/>

                                    <input class="form-range w-75" type="range" min="0.0" max="4.0" step="0.1" value="0.0" oninput="changeGPAValue(this.value)" name="gpa" placeholder="Last Name" required>

                                    <br/>

                                    <label for="lastname">Current year:</label></br>
                                    <input class="border rounded p-2 w-75" type="number" min = "0" name="cur_year" placeholder="Current Year" required>

                                    <br/><br/>
                                    <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                        <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Add"/>
                                    </div> 
                                </form>   
                            </div>
                        </div>
                    </div>
                    <!-- Component End -->
                    
                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body" >

                                <h5 class="card-title">Remove Student</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form action="student/rmStudent.jsp" method="POST" onSubmit="return validateDropdown('studentDropDownId', 'No students found! Add some!')">
                                    <label>Select a student - </label><br/> 
                                    <select class="form-select rounded p-2 w-75 my-2" name="student">
                                        <% for (int i=0; i < student.student_idList.size(); i++) {
                                                            %>
                                                <option value="<%=student.student_idList.get(i)%>"><%=student.student_idList.get(i) + " - " +student.first_nameList.get(i) + " " + student.last_nameList.get(i)%></option>
                                        <% } %>
                                     </select><br>

                                    <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                        <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Remove"/>
                                    </div> 

                                </form>    
                            </div>
                        </div>
                    </div>
                    <!-- Component End -->
                    
                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body" >

                                <h5 class="card-title">Modify Student</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form action="student/modStudent.jsp" method="POST" onSubmit="return validateDropdown('studentDropDownId', 'No students found! Add some!')">

                                    <label>Select a student - </label><br/>
                                    <select class="form-select rounded p-2 w-75 my-2" name="student">
                                        <% for (int i=0; i < student.student_idList.size(); i++) {
                                                            %>
                                                <option value="<%=student.student_idList.get(i)%>"><%=student.student_idList.get(i) + " - " +student.first_nameList.get(i) + " " + student.last_nameList.get(i)%></option>
                                        <% } %>
                                     </select>

                                    <label class="m-1" for="firstname">First name:</label><br/>
                                    <input class="border rounded p-2 w-75" type="text"  name="firstname" placeholder="First Name" required>
                                    <br/>
                                    <label class="m-1" for="lastname">Last name:</label><br/>
                                    <input class="border rounded p-2 w-75 mb-2" type="text"  name="lastname" placeholder="Last Name" required>

                                    <br/>
                                    <label for="gpa">GPA:</label>
                                    <label id="gpa-label-modify">0.0</label><br/>

                                    <input class="form-range w-75" type="range" min="0.0" max="4.0" step="0.1" value="0.0" oninput="changeGPAValueModify(this.value)" name="gpa" placeholder="Last Name" required>

                                    <label class="m-1" for="lastname">Current year:</label><br/>
                                    <input class="border rounded p-2 w-75" type="number" min = "0" name="cur_year" placeholder="Current Year" required>
                                    <br/>

                                     <br/><br/>
                                    <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                        <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Modify"/>
                                    </div> 

                                </form>   
                            </div>
                        </div>
                    </div>
           
                </div>
            </div>
        </div>
        <!-- Section End -->                     
        
        <!-- Section Start -->
        <div class="album py-5 bg-light" id="ratingEquivalentDiv">
            
            <div class="text-center mb-4">
                <h1 class="align-self-center">Rating Equivalent Settings</h1>
            </div>
            
            <div class="container">
                <div class="row">

                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body">

                                <h5 class="card-title">Search Equivalent</h5>
                                <p class="card-text">Please enter the details below.</p>
                                    <form action="ratings_ref/searchEquivalent.jsp" method="POST">
                                        <label for="score">Enter a Score - </label></br>
                                        <input class="border rounded p-2 w-75" type="number" name="score" placeholder="Score" required><br><br>

                                        <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                            <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Search"/>
                                        </div>                            
                                    </form>
                            </div>
                        </div>
                    </div>
                    <!-- Component End -->

                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body">

                                <h5 class="card-title">Add New Equivalent</h5>
                                <p class="card-text">Proceed to the next page.</p>
                                <form  action="ratings_ref/addEquivalentMenu.jsp" method="POST">
                                        <br/>
                                        <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                            <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Add"/>
                                        </div>
                                </form>

                            </div>
                        </div>
                    </div>
                    <!-- Component End -->

                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body">

                                <h5 class="card-title">Delete Equivalent</h5>
                                <p class="card-text">Please enter the details below.</p>
                                    <form action="ratings_ref/rmEquivalent.jsp" method="POST">
                                        <label for="score">Enter a Score - </label></br>
                                        <input class="border rounded p-2 w-75" type="number" name="score" placeholder="Score" required><br><br>

                                        <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                            <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Remove"/>
                                        </div>                            
                                    </form>

                            </div>
                        </div>
                    </div>
                    <!-- Component End -->

                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body">

                                <h5 class="card-title">Modify Equivalent</h5>
                                <p class="card-text">Please enter the details below.</p>
                                    <form action="ratings_ref/modEquivalent.jsp" method="POST">
                                        <label for="score">Enter a Score - </label></br>
                                        <input class="border rounded p-2 w-75" type="number" name="score" placeholder="Score" required><br>
                                        <label for="score">Enter an Equivalent - </label></br>
                                        <input class="border rounded p-2 w-75" type="text" name="equivalent" placeholder="Equivalent" required><br><br>

                                        <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                            <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Modify"/>
                                        </div>                            
                                    </form>
                            </div>
                        </div>
                    </div>
                    <!-- Component End -->
                
                </div>
            </div>   
        </div>
        <!-- Section End -->
        
        <!-- Section Start -->
        <div class="album py-5 bg-light" id="ratingsDiv">
            
            <div class="text-center mb-4">
              <h1 class="align-self-center">Ratings</h1>
            </div>
            
            <div class="container">
                <div class="row">
                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body" >

                                <h5 class="card-title">Search and View Rating</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form action="rating/searchRatingMenu.jsp" method="POST" onSubmit="return validateDropdown('studentDropDownId', 'No students found! Add some!')">
                                        <label>Select a student - </label><br/>
                                        <select class="form-select rounded p-2 w-75 my-2" name="student_id">
                                            <% for (int i=0; i < student.student_idList.size(); i++) {
                                                                %>
                                                    <option value="<%=student.student_idList.get(i)%>"><%=student.student_idList.get(i) + " - " +student.first_nameList.get(i) + " " + student.last_nameList.get(i)%></option>
                                            <% } %>
                                     </select><br>

                                    <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                        <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Search"/>
                                    </div> 

                                </form>    
                            </div>
                        </div>
                    </div>
                    <!-- Component End -->

                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body" >

                                <h5 class="card-title">Filter Rating by Student</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form action="rating/filterRatingByStudent.jsp" method="POST" onSubmit="return validateDropdown('studentDropDownId', 'No students found! Add some!')">
                                        <label>Select a student - </label><br/>
                                        <select class="form-select rounded p-2 w-75 my-2" name="student_id">
                                            <% for (int i=0; i < student.student_idList.size(); i++) {
                                                                %>
                                                    <option value="<%=student.student_idList.get(i)%>"><%=student.student_idList.get(i) + " - " +student.first_nameList.get(i) + " " + student.last_nameList.get(i)%></option>
                                            <% } %>
                                     </select><br>

                                    <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                        <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Filter"/>
                                    </div> 

                                </form>    
                            </div>
                        </div>
                    </div>
                    <!-- Component End -->

                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body" >

                                <h5 class="card-title">Filter Rating by Professor</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form  action="rating/filterRatingByProf.jsp" method="POST" onSubmit="return validateDropdown('professorDropDownId', 'No professors found! Add some!')">
                                    <div class="form-group">
                                        <label>Professor - </label><br/>
                                        <select class="form-select rounded p-2 w-75 my-2" name="prof_id">
                                            <% for (int i=0; i < prof.professor_idList.size(); i++) { 
                                                                %>
                                                    <option value="<%=prof.professor_idList.get(i)%>"><%=prof.professor_idList.get(i) + " - " +prof.first_nameList.get(i) + " " + prof.last_nameList.get(i)%></option>            
                                            <% } %>
                                        </select>
                                        <br/>
                                        <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                            <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Filter"/>
                                        </div>

                                    </div>
                                </form>  
                            </div>
                        </div>
                    </div>
                    <!-- Component End -->

                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body" >

                                <h5 class="card-title">Rate a Professor</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form action="rating/addRatingMenu.jsp" method="POST" onSubmit="return validateDropdown('professorDropDownId', 'No professors found! Add some!')">

                                    <label>Select a student - </label><br/>
                                    <select class="form-select rounded p-2 w-75 my-2" name="student_id">
                                        <% for (int i=0; i < student.student_idList.size(); i++) {
                                                            %>
                                                <option value="<%=student.student_idList.get(i)%>"><%=student.student_idList.get(i) + " - " +student.first_nameList.get(i) + " " + student.last_nameList.get(i)%></option>
                                        <% } %>
                                     </select>

                                    <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                        <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Rate"/>
                                    </div> 
                                </form>   
                            </div>
                        </div>
                    </div>
                    <!-- Component End -->

                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body" >

                                <h5 class="card-title">Remove a Rating</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form action="rating/rmRatingMenu.jsp" method="POST" onSubmit="return validateDropdown('studentDropDownId', 'No students found! Add some!')">

                                    <label>Select a student - </label><br/>
                                    <select class="form-select rounded p-2 w-75 my-2" name="student_id">
                                        <% for (int i=0; i < student.student_idList.size(); i++) {
                                                            %>
                                                <option value="<%=student.student_idList.get(i)%>"><%=student.student_idList.get(i) + " - " +student.first_nameList.get(i) + " " + student.last_nameList.get(i)%></option>
                                        <% } %>
                                     </select>

                                    <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                        <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Remove"/>
                                    </div> 
                                </form>   
                            </div>
                        </div>
                    </div>
                    <!-- Component End -->

                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body" >

                                <h5 class="card-title">Modify a Rating</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form action="rating/modRatingMenu.jsp" method="POST" onSubmit="return validateDropdown('studentDropDownId', 'No students found! Add some!')">

                                    <label>Select a student - </label><br/>
                                    <select class="form-select rounded p-2 w-75 my-2" name="student_id">
                                        <% for (int i=0; i < student.student_idList.size(); i++) {
                                                            %>
                                                <option value="<%=student.student_idList.get(i)%>"><%=student.student_idList.get(i) + " - " +student.first_nameList.get(i) + " " + student.last_nameList.get(i)%></option>
                                        <% } %>
                                     </select>

                                    <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                        <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Modify"/>
                                    </div> 
                                </form>   
                            </div>
                        </div>
                    </div>
                    <!-- Component End -->
                </div> 
            </div>
        </div>
                             
        <div class="album py-5 bg-light" id="subjectsDiv">
            <% subject.loadRecord(); %>
            <div class="text-center mb-4">
                <h1 class="align-self-center">Subjects</h1>
            </div>
            
            <div class="container">
                <div class="row">

                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body" >

                                <h5 class="card-title">Search and View Subject</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form action="subject/searchSubject.jsp" method="POST" onSubmit="return validateDropdown('subjectsDropDownId', 'No subjects found! Add some!')">
                                    Select subject -

                                    <select class="form-select rounded p-2 w-75 my-2" name="subjects" id="subjectsDropDownId">
                                        <% for (int i=0; i < subject.subject_idList.size(); i++) { %>
                                            <option value="<%=subject.subject_idList.get(i)%>">
                                                <%=subject.subject_idList.get(i) + " - " + subject.subject_nameList.get(i)%>
                                            </option>
                                        <% } %>
                                    </select><br>

                                    <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                        <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Search"/>
                                    </div> 
                                </form>   
                            </div>
                        </div>
                    </div>
                    <!-- Component End -->

                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body" >

                                <h5 class="card-title">Filter Subject</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form action="subject/filterSubject.jsp" method="POST" onSubmit="return validateDropdown('subjectsDropDownId', 'No subjects found! Add some!')">
                                    Select subject prefix-
                                    <select class="form-select rounded p-2 w-75 my-2" name="prefix">
                                        <%
                                            ArrayList<String> prefixes = subject.getDistinctPrefixes();

                                            for (String prefix : prefixes) { %>
                                            <option value="<%=prefix%>"><%=prefix%></option>
                                        <% } %>
                                    </select>

                                    <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                        <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Filter"/>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Component End -->

                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body" >

                                <h5 class="card-title">Add Subject</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form action="subject/addSubject.jsp" method="POST" onSubmit="return validateDropdown('professorDropDownId', 'No professors available to teach this subject!')">

                                    <label for="subjectname">Subject Name:</label><br/>
                                    <input class="border rounded p-2 w-75 my-2" type="text" name="subjectname" pattern="[A-Za-z0-9]{7}" placeholder="ex. CCPROG1" required>
                                    <br/>
                                    <label for="units">Units:</label><br/>
                                    <input class="border rounded p-2 w-75 my-2" type="number" min="1" max="5" name="units" placeholder="Units" required>

                                    <br>
                                    <label for="professorid">Professor:</label>
                                    <select class="form-select rounded p-2 w-75 my-2" name="professorid">
                                        <% for (int i=0; i < prof.professor_idList.size(); i++) { %>
                                            <option value="<%=prof.professor_idList.get(i)%>">
                                                <%=prof.professor_idList.get(i) + " - " + prof.first_nameList.get(i) + " " + prof.last_nameList.get(i)%>
                                            </option>
                                        <% } %>
                                    </select>

                                    <label for="subject_year">Subject Year:</label><br/>
                                    <input class="border rounded p-2 w-75 my-2" type="number" min = "0" name="subject_year" pattern="[0-9]{4}" placeholder="YYYY" required>
                                    <br/>
                                    <label for="term">Term:</label><br/>
                                    <input class="border rounded p-2 w-75 my-2" type="number" name="term" min="1" max="3" placeholder="1, 2, or 3" required>

                                    <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                        <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Add"/>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Component End -->

                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body" >

                                <h5 class="card-title">Remove Subject</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form action="subject/rmSubject.jsp" method="POST" onSubmit="return validateDropdown('subjectsDropDownId', 'No subjects found! Add some!')">
                                    Select subject -
                                    <select class="form-select rounded p-2 w-75 my-2" name="subject">
                                        <% for (int i=0; i < subject.subject_idList.size(); i++) { %>
                                            <option value="<%=subject.subject_idList.get(i)%>">
                                                <%=subject.subject_idList.get(i) + " - " + subject.subject_nameList.get(i)%>
                                            </option>
                                        <% } %>
                                    </select><br>

                                    <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                        <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Remove"/>
                                    </div> 
                                </form>   
                            </div>
                        </div>
                    </div>
                    <!-- Component End -->

                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body" >

                                <h5 class="card-title">Modify a Subject</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form action="subject/modSubject.jsp" method="POST" onSubmit="return (validateDropdown('subjectsDropDownId', 'No subjects found! Add some!') && validateDropdown('professorDropDownId', 'No subjects found! Add some!'))">
                                     Select a subject -
                                     <select class="form-select rounded p-2 w-75 my-2" name="subjects">
                                         <% for (int i=0; i < subject.subject_idList.size(); i++) { %>
                                             <option value="<%=subject.subject_idList.get(i)%>">
                                                 <%=subject.subject_idList.get(i) + " - " + subject.subject_nameList.get(i)%>
                                             </option>
                                         <% } %>
                                     </select>

                                     <label for="subjectname">New Subject Name:</label><br/>
                                    <input class="border rounded p-2 w-75 my-2" type="text" name="subjectname" pattern="[A-Za-z0-9]{7}" placeholder="ex. CCPROG1" required>
                                    <br/>
                                    <label for="units">Units:</label><br/>
                                    <input class="border rounded p-2 w-75 my-2" type="number" min="1" max="5" name="units" placeholder="Units" required>
                                     <br>
                                     <label for="professor">New Professor - </label><br/>
                                     <select name="professor" class="form-select rounded p-2 w-75 my-2">
                                         <% for (int i=0; i < prof.professor_idList.size(); i++) { %>
                                             <option value="<%=prof.professor_idList.get(i)%>">
                                                 <%=prof.professor_idList.get(i) + " - " + prof.first_nameList.get(i) + " " + prof.last_nameList.get(i)%>
                                             </option>
                                         <% } %>
                                     </select>

                                    <label for="subject_year">New Subject Year:</label><br/>
                                    <input class="border rounded p-2 w-75 my-2" type="number" min = "0" name="subject_year" pattern="[0-9]{4}" placeholder="YYYY" required>
                                    <br/>
                                    <label for="term">New Term:</label><br/>
                                    <input class="border rounded p-2 w-75 my-2" type="number" name="term" min="1" max="3" placeholder="1, 2, or 3" required>

                                    <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                        <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Modify"/>
                                    </div> 

                                 </form>
                            </div>
                        </div>
                    </div>
                    <!-- Component End -->
                
                 </div>  
            </div>
        </div>
                                     
                                     
        <div class="album py-5 bg-light" id="enrollmentDiv">
            <% subject.loadDistinctSubjects(); %>                                     

            <div class="text-center mb-4">
                <h1 class="align-self-center">Enrollment and Ranking</h1>
            </div>

            <div class="container">
                <div class="row">
                    
                    
                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body">

                                <h5 class="card-title">Enroll in a Subject</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form action="subject/enroll.jsp" method="POST" onSubmit="return validateDropdown('studentDropDownId', 'No students found! Add some!')">
                                        <label>Select a student - </label><br/>
                                        <select class="form-select rounded p-2 w-75 my-2" name="studentid">
                                            <% for (int i=0; i < student.student_idList.size(); i++) {
                                                                %>
                                                    <option value="<%=student.student_idList.get(i)%>"><%=student.student_idList.get(i) + " - " +student.first_nameList.get(i) + " " + student.last_nameList.get(i)%></option>
                                            <% } %>
                                        </select><br><br>

                                    <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                        <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Enroll"/>
                                    </div> 

                                 </form>

                            </div>
                        </div>
                    </div>
                    <!-- Component End -->

                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body" >

                                <h5 class="card-title">See Professor Rankings</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form action="rating/rankOfProfSub.jsp" method="POST" onSubmit="return validateDropdown('subjectsDropDownId', 'No subjects found! Add some!')">
                                    <label>Select subject - </label><br/>
                                    <select class="form-select rounded p-2 w-75 my-2" name="subjectname">
                                        <% for (int i=0; i <subject.distinctSubjectNames.size(); i++) { %>
                                            <option value="<%=subject.distinctSubjectNames.get(i)%>">
                                                <%=(i+1) + " - " + subject.distinctSubjectNames.get(i)%>
                                            </option>
                                        <% } %>
                                    </select>

                                    <label>Subject Year:</label><br/>
                                    <input class="border rounded p-2 w-75 my-2" type="number" min = "0" name="subject_year" pattern="[0-9]{4}" placeholder="YYYY" required>

                                    <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                        <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="See Rankings"/>
                                    </div> 

                                </form>  
                            </div>
                        </div>
                    </div>
                    <!-- Component End -->

                    <!-- Component Start -->
                    <div class="col-md-4 h-100">
                        <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                            <div class="card-body" >

                                <h5 class="card-title">Ranking of Professor by Attribute</h5>
                                <p class="card-text">Please enter the details below.</p>
                                <form action="rating/rankOfProfAttr.jsp" method="POST" onSubmit="return validateDropdown('subjectsDropDownId', 'No subjects found! Add some!')">
                                    <label>Select subject - </label><br/>
                                    <select class="form-select rounded p-2 w-75 my-2" name="subjectname">
                                        <% for (int i=0; i <subject.distinctSubjectNames.size(); i++) { %>
                                            <option value="<%=subject.distinctSubjectNames.get(i)%>">
                                                <%=(i+1) + " - " + subject.distinctSubjectNames.get(i)%>
                                            </option>
                                        <% } %>
                                    </select>

                                    <label for="subject_year">Subject Year:</label><br/>
                                    <input class="border rounded p-2 w-75 my-2" type="number" min = "0" name="subject_year" pattern="[0-9]{4}" placeholder="YYYY" required>

                                    <label>Select attribute - </label><br/>
                                    <select class="form-select rounded p-2 w-75 my-2" name="attribute">
                                        <option value="approachability">
                                            Approachability
                                        </option>
                                        <option value="explanation">
                                            Explanation
                                        </option>
                                        <option value="kindness">
                                            Kindness
                                        </option>
                                        <option value="knowledgability">
                                            Knowledgability
                                        </option> 
                                    </select>

                                    <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                        <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="See Rankings"/>
                                    </div> 
                                </form>   
                            </div>
                        </div>
                    </div>
                    <!-- Component End -->                
                    
                </div>
            </div>
        </div>   
                        
                                    
        </div>               
        
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        
        <script>
            function changeGPAValue(value) {
                document.getElementById("gpa-label").innerHTML = value;
            }

            function changeGPAValueModify(value) {
                document.getElementById("gpa-label-modify").innerHTML = value;
            }
            
            $(document).ready(function() {
                
                $('#mainButton').click(function() {
                    $('#professorDiv').show();
                    $('#studentDiv').show();
                    $('#ratingEquivalentDiv').show();
                    $('#ratingsDiv').show();
                    $('#subjectsDiv').show();
                    $('#enrollmentDiv').show();
                });
                $('#profButton').click(function() {
                    $('#professorDiv').show();
                    $('#studentDiv').hide();
                    $('#ratingEquivalentDiv').hide();
                    $('#ratingsDiv').hide();
                    $('#subjectsDiv').hide();
                    $('#enrollmentDiv').hide();
                });
                
                $('#studentButton').click(function() {
                    $('#professorDiv').hide();
                    $('#studentDiv').show();
                    $('#ratingEquivalentDiv').hide();
                    $('#ratingsDiv').hide();
                    $('#subjectsDiv').hide();
                    $('#enrollmentDiv').hide();
                });
                
                $('#ratingEquivalentButton').click(function() {
                    $('#professorDiv').hide();
                    $('#studentDiv').hide();
                    $('#ratingEquivalentDiv').show();
                    $('#ratingsDiv').hide();
                    $('#subjectsDiv').hide();
                    $('#enrollmentDiv').hide();
                });
                
                $('#ratingsButton').click(function() {
                    $('#professorDiv').hide();
                    $('#studentDiv').hide();
                    $('#ratingEquivalentDiv').hide();
                    $('#ratingsDiv').show();
                    $('#subjectsDiv').hide();
                    $('#enrollmentDiv').hide();
                });
                
                $('#subjectsButton').click(function() {
                    $('#professorDiv').hide();
                    $('#studentDiv').hide();
                    $('#ratingEquivalentDiv').hide();
                    $('#ratingsDiv').hide();
                    $('#subjectsDiv').show();
                    $('#enrollmentDiv').hide();
                });
                
                $('#enrollmentButton').click(function() {
                    $('#professorDiv').hide();
                    $('#studentDiv').hide();
                    $('#ratingEquivalentDiv').hide();
                    $('#ratingsDiv').hide();
                    $('#subjectsDiv').hide();
                    $('#enrollmentDiv').show();
                });
                
            });
            
            

            function validateDropdown(elementId, error) {  
                
                error = error.replace(/ /g, '%20');
                
                if (document.getElementById(elementId).value === undefined || 
                        document.getElementById(elementId).value === "") {
                    // The error message goes here
                    var url = "error.jsp?errorMsg=" + error;
                    window.location.href=url;
                    return false;
                }
                return true;
            }

        </script>
        
    </body>
</html>