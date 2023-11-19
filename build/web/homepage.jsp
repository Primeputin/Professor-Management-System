
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, profmanagement.*"%>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <title>Professor Management System</title>
        
        <style>
            #card-component {
                height: 420px;
            }
        </style>
        
    </head>
    <body>

        <!-- Global Beans -->
        <jsp:useBean id="prof" class="profmanagement.Professor" scope="session" />
        <jsp:useBean id="student" class="profmanagement.Student" scope="session" />

        <nav class="navbar navbar-light bg-dark justify-content-center">
            <a class="navbar-brand" href="#" style="color: white">Professor Management System</a>
        </nav>
        
        <section class="jumbotron text-center">
            <div class="container">
              <h1 class="jumbotron-heading">Welcome to the Professor Management System.</h1>
              <p class="lead text-muted">To get started, kindly select an option from functions below.</p>
              
            </div>
        </section>

        <div class="album py-5 bg-light">
            
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
                        <form  action="professor/searchProf.jsp" method="POST">
                            <% prof.loadRecord(); %>
                            <div class="form-group">
                                <label>Professor - </label><br/>
                                <select class="form-select rounded p-2 w-75" name="professors">
                                    <% for (int i=0; i < prof.professor_idList.size(); i++) { 
                                                        %>
                                            <option value="<%=prof.professor_idList.get(i)%>"><%=prof.professor_idList.get(i) + " - " +prof.first_nameList.get(i) + " " + prof.last_nameList.get(i)%></option>            
                                    <% } %>
                                </select>
                                <br/>
                                <input style="bottom: 15px; width: 90%" class="position-absolute btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Search"/>

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


                                    <input style="bottom: 15px; width: 90%" class="position-absolute btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Filter"/>
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

                                     <label class="m-1" for="lastname">Last name:</label><br/>
                                     <input class="border rounded p-2 w-75" type="text"  name="lastname" placeholder="Last Name" required>

                                    <input style="bottom: 15px; width: 90%" class="position-absolute btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Filter"/>

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

                                     <label class="m-1" for="lastname">Last name:</label><br/>
                                     <input class="border rounded p-2 w-75" type="text"  name="lastname" placeholder="Last Name" required>

                                    <input style="bottom: 15px; width: 90%" class="position-absolute btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Add"/>

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
                            <% prof.loadRecord(); %>
                            <div class="form-group">
                                <label>Professor - </label><br/>
                                <select class="form-select rounded p-2 w-75" name="professors">
                                    <% for (int i=0; i < prof.professor_idList.size(); i++) { 
                                                        %>
                                            <option value="<%=prof.professor_idList.get(i)%>"><%=prof.professor_idList.get(i) + " - " +prof.first_nameList.get(i) + " " + prof.last_nameList.get(i)%></option>            
                                    <% } %>
                                </select>
                                <br/>
                                <input style="bottom: 15px; width: 90%" class="position-absolute btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Remove"/>

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
                                    <select class="form-select rounded p-2 w-75 mb-2" name="professors">
                                        <% for (int i=0; i < prof.professor_idList.size(); i++) { 
                                                            %>
                                                <option value="<%=prof.professor_idList.get(i)%>"><%=prof.professor_idList.get(i) + " - " +prof.first_nameList.get(i) + " " + prof.last_nameList.get(i)%></option>            
                                        <% } %>
                                    </select>

                                     <label class="m-1" for="firstname">First name:</label><br/>
                                     <input class="border rounded p-2 w-75" type="text"  name="firstname" placeholder="First Name" required>

                                     <label class="m-1" for="lastname">Last name:</label><br/>
                                     <input class="border rounded p-2 w-75" type="text"  name="lastname" placeholder="Last Name" required>

                                    <input style="bottom: 15px; width: 90%" class="position-absolute btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Modify"/>

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
                            <% prof.loadRecord(); %>
                            <div class="form-group">
                                <label>Professor - </label><br/>
                                <select class="form-select rounded p-2 w-75" name="professors">
                                    <% for (int i=0; i < prof.professor_idList.size(); i++) { 
                                                        %>
                                            <option value="<%=prof.professor_idList.get(i)%>"><%=prof.professor_idList.get(i) + " - " +prof.first_nameList.get(i) + " " + prof.last_nameList.get(i)%></option>            
                                    <% } %>
                                </select>
                                <br/>
                                <input style="bottom: 15px; width: 90%" class="position-absolute btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Search"/>

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


                                    <input style="bottom: 15px; width: 90%" class="position-absolute btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Filter"/>
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

                                     <label class="m-1" for="lastname">Last name:</label><br/>
                                     <input class="border rounded p-2 w-75" type="text"  name="lastname" placeholder="Last Name" required>

                                    <input style="bottom: 15px; width: 90%" class="position-absolute btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Filter"/>

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

                                     <label class="m-1" for="lastname">Last name:</label><br/>
                                     <input class="border rounded p-2 w-75" type="text"  name="lastname" placeholder="Last Name" required>

                                    <input style="bottom: 15px; width: 90%" class="position-absolute btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Add"/>

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
                            <% prof.loadRecord(); %>
                            <div class="form-group">
                                <label>Professor - </label><br/>
                                <select class="form-select rounded p-2 w-75" name="professors">
                                    <% for (int i=0; i < prof.professor_idList.size(); i++) { 
                                                        %>
                                            <option value="<%=prof.professor_idList.get(i)%>"><%=prof.professor_idList.get(i) + " - " +prof.first_nameList.get(i) + " " + prof.last_nameList.get(i)%></option>            
                                    <% } %>
                                </select>
                                <br/>
                                <input style="bottom: 15px; width: 90%" class="position-absolute btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Remove"/>

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
                                    <select class="form-select rounded p-2 w-75 mb-2" name="professors">
                                        <% for (int i=0; i < prof.professor_idList.size(); i++) { 
                                                            %>
                                                <option value="<%=prof.professor_idList.get(i)%>"><%=prof.professor_idList.get(i) + " - " +prof.first_nameList.get(i) + " " + prof.last_nameList.get(i)%></option>            
                                        <% } %>
                                    </select>

                                     <label class="m-1" for="firstname">First name:</label><br/>
                                     <input class="border rounded p-2 w-75" type="text"  name="firstname" placeholder="First Name" required>

                                     <label class="m-1" for="lastname">Last name:</label><br/>
                                     <input class="border rounded p-2 w-75" type="text"  name="lastname" placeholder="Last Name" required>

                                    <input style="bottom: 15px; width: 90%" class="position-absolute btn btn-primary btn-block rounded mt-3 px-3 shadow-none" type="submit" value="Modify"/>

                        </form>     
                    </div>
                  </div>
                </div>
                <!-- Component End -->
                
            </div>                                 
                                    
        </div>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>