<%-- 
    Document   : filtersubject
    Created on : 11 15, 23, 12:43:25 AM
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
        <title>Filter and list subjects</title>
    </head>
    <body>

        <jsp:useBean id="subject" class="profmanagement.Subject" scope="session" />
        <jsp:useBean id="professor" class="profmanagement.Professor" scope="session" />

        <%
            String prefix = request.getParameter("prefix");
            subject.viewFilterRecord(prefix);
        %>    
        

 
        <div class="my-5 container bg-light p-5 rounded shadow-sm w-50" style="min-height: 300px">
            <h3>Subjects starting with <%=prefix%> </h3><br>
            <table class="table">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Subject name</th>
                    <th scope="col">Units</th>
                    <th scope="col">Professor name</th>
                    <th scope="col">Year</th>
                  </tr>
                </thead>
                <tbody>

                  <% for (int i=0; i < subject.subject_idList.size(); i++) { %>
                        <tr>
                            <% 
                                professor.professor_id = subject.professor_idList.get(i);
                                professor.viewRecord();
                            %>
                            <th scope="row"><%= i%></th>
                            <td><%=subject.subject_nameList.get(i)%></td>
                            <td><%=subject.unitsList.get(i)%></td>
                            <td><%=professor.first_name%> <%=professor.last_name%></td>
                            <td><%=subject.subject_yearList.get(i)%>, Term <%=subject.termList.get(i)%></td>
                        </tr>
                   <%  } %><br> 

                </tbody>
            </table>
                   
            <div>
                <a class="btn btn-lg btn-secondary" href="../homepage.jsp" role="button">Back</a>
            </div>
        </div>

    </body>
</html>
