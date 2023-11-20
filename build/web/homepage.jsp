
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

        <nav class="navbar navbar-light bg-dark justify-content-center">
            <a class="navbar-brand" href="#" style="color: white">Professor Management System</a>
        </nav>
        
        <section class="jumbotron text-center">
            <div class="container py-5">
              <h1 class="jumbotron-heading">Welcome to the Professor Management System.</h1>
              <p class="lead text-muted">To get started, kindly select an option from functions below.</p>
              
            </div>
        </section>

        <div class="album py-5 bg-light">
            
            <div class="text-center mb-4">
            <h1 class="align-self-center">Professor</h1>
            <% prof.loadRecord(); %>
            </div>
            <div class="container">

            <div class="row">

                <!-- Component Start -->
                <div class="col-md-4 h-100">
                  <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                    <div class="card-body">
                        
                        <h5 class="card-title">Search for a Professor</h5>
                        <p class="card-text">Please enter the details below.</p>
                        <form  action="professor/searchProf.jsp" method="POST">

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
                        
                        <h5 class="card-title">Add a Professor</h5>
                        <p class="card-text">Please enter the details below.</p>
                        <form action="professor/addProf.jsp" method="POST">

                                     <label class="m-1" for="firstname">First name:</label><br/>
                                     <input class="border rounded p-2 w-75" type="text"  name="firstname" placeholder="First Name" required>
                                     <br/>
                                     <label class="m-1" for="lastname">Last name:</label><br/>
                                     <input class="border rounded p-2 w-75" type="text"  name="lastname" placeholder="Last Name" required>

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
                        <form  action="professor/removeProf.jsp" method="POST">
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
                        <form action="professor/modProf.jsp" method="POST">
                            
                                    <label>Professor - </label><br/>
                                    <select class="form-select rounded p-2 w-75 my-2" name="professors">
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
              
        <div class="album py-5 bg-light">
            
            <div class="text-center mb-4">
            <h1 class="align-self-center">Student</h1>
            <% student.loadRecord(); %>
            </div>
            <div class="container">

            <div class="row">

                <!-- Component Start -->
                <div class="col-md-4 h-100">
                  <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                    <div class="card-body">
                        
                        <h5 class="card-title">Search for a Student</h5>
                        <p class="card-text">Please enter the details below.</p>
                            <form action="student/searchStudent.jsp" method="POST">
                                <label>Select a student - </label><br/>
                                <select class="form-select rounded p-2 w-75 my-2" name="student">
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
                            <input class="border rounded p-2 w-75" type="text" name="cur_year" placeholder="Current Year" required>

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
                        <form action="student/rmStudent.jsp" method="POST">
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
                        <form action="student/modStudent.jsp" method="POST">

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
                            <input class="border rounded p-2 w-75" type="text"  name="cur_year" placeholder="Current Year" required>
                            <br/>

                             <br/><br/>
                            <div style="bottom: 15px;" class="position-absolute w-100 d-flex justify-content-between align-items-center">
                                <input style="width: 92%" class=" btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Modify"/>
                            </div> 

                        </form>   
                    </div>
                  </div>
                </div>
                <!-- Component End -->
                
                
            </div>           
                             
        <div class="album py-5 bg-light">
            
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
                        <form action="rating/searchRatingMenu.jsp" method="POST">
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
                        <form action="rating/filterRatingByStudent.jsp" method="POST">
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
                        <form  action="rating/filterRatingByProf.jsp" method="POST">
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
                        <form action="rating/addRatingMenu.jsp" method="POST">

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
                        <form action="rating/rmRatingMenu.jsp" method="POST">

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
                        <form action="rating/modRatingMenu.jsp" method="POST">

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
                             
        <div class="album py-5 bg-light">
            
            <div class="text-center mb-4">
            <h1 class="align-self-center">Subjects</h1>
            <% subject.loadRecord(); %>
            </div>
            <div class="container">

            <div class="row">

                <!-- Component Start -->
                <div class="col-md-4 h-100">
                  <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                    <div class="card-body" >
                        
                        <h5 class="card-title">Search and View Subject</h5>
                        <p class="card-text">Please enter the details below.</p>
                        <form action="subject/searchSubject.jsp" method="POST">
                            Select subject -

                            <select class="form-select rounded p-2 w-75 my-2" name="subjects">
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
                        <form action="subject/filterSubject.jsp" method="POST">
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
                        <form action="subject/addSubject.jsp" method="POST">

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
                            <input class="border rounded p-2 w-75 my-2" type="text" name="subject_year" pattern="[0-9]{4}" placeholder="YYYY" required>
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
                        <form action="subject/rmSubject.jsp" method="POST">
                            Select subject -
                            <select class="form-select rounded p-2 w-75 my-2" name="subject">
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
                        
                        <h5 class="card-title">Modify a Subject</h5>
                        <p class="card-text">Please enter the details below.</p>
                        <form action="subject/modSubject.jsp" method="POST">
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
                            <input class="border rounded p-2 w-75 my-2" type="text" name="subject_year" pattern="[0-9]{4}" placeholder="YYYY" required>
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
                             
        <div class="album py-5 bg-light">
            
            <div class="text-center mb-4">
            <h1 class="align-self-center">Enrollment and Ranking</h1>
            <% subject.loadDistinctSubjects(); %>
            </div>
            <div class="container">

            <div class="row">

                <!-- Component Start -->
                <div class="col-md-4 h-100">
                  <div class="card mb-4 shadow-sm box-shadow" id="card-component">
                    <div class="card-body">
                        
                        <h5 class="card-title">Enroll in a Subject</h5>
                        <p class="card-text">Please enter the details below.</p>
                        <form action="enroll.jsp" method="POST">
                                <label>Select a student - </label><br/>
                                <select class="form-select rounded p-2 w-75 my-2" name="student">
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
                        <form action="rankofprofofsub.jsp" method="POST">
                            <label>Select subject - </label><br/>
                            <select class="form-select rounded p-2 w-75 my-2" name="subjectname">
                                <% for (int i=0; i <subject.distinctSubjectNames.size(); i++) { %>
                                    <option value="<%=subject.distinctSubjectNames.get(i)%>">
                                        <%=(i+1) + " - " + subject.distinctSubjectNames.get(i)%>
                                    </option>
                                <% } %>
                            </select>

                            <label>Subject Year:</label><br/>
                            <input class="border rounded p-2 w-75 my-2" type="text" name="subject_year" pattern="[0-9]{4}" placeholder="YYYY" required>

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
                        <form action="" method="POST">
                            <label>Select subject - </label><br/>
                            <select class="form-select rounded p-2 w-75 my-2" name="subjectname">
                                <% for (int i=0; i <subject.distinctSubjectNames.size(); i++) { %>
                                    <option value="<%=subject.distinctSubjectNames.get(i)%>">
                                        <%=(i+1) + " - " + subject.distinctSubjectNames.get(i)%>
                                    </option>
                                <% } %>
                            </select>

                            <label for="subject_year">Subject Year:</label>
                            <input class="border rounded p-2 w-75 my-2" type="text" name="subject_year" pattern="[0-9]{4}" placeholder="YYYY" required>

                            <label>Select attribute - </label><br/>
                            <select class="form-select rounded p-2 w-75 my-2" name="subjectname">
                                <option value="approachability">
                                    Approachability
                                </option>
                                <option value="Explanation">
                                    Explanation
                                </option>
                                <option value="Kindness">
                                    Kindness
                                </option>
                                <option value="Knowledgability">
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

        </script>
        
    </body>
</html>