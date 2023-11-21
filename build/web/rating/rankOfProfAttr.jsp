<%-- 
    Document   : rankOfProfAttr
    Created on : Nov 19, 2023, 7:15:17 PM
    Author     : hans
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
        <title>Ranking of professor by an attribute in a subject</title>
    </head>
    <body>
        <jsp:useBean id="rank" class="profmanagement.Ranking" scope="session" />
        <jsp:useBean id="rr" class="profmanagement.RatingRef" scope="session" />
        <%
            
            String subject_name = request.getParameter("subjectname");
            String year = request.getParameter("subject_year");
            String attributeType = request.getParameter("attribute");
            rank.subject_name = subject_name;
            rank.year = year;
            rank.showRankAttribute(attributeType);
            rr.viewRecordAll();

        %> 

        <div class="text-center">
            <h1 class="m-5"><%= attributeType.substring(0, 1).toUpperCase() + attributeType.substring(1)%> Rankings</h1>
        </div>
        
        <div class="container bg-light p-5 rounded shadow-sm w-50" style="min-height: 300px">
            <table class="table">
                <thead>
                  <tr>
                    <th scope="col">Professor ID</th>
                    <th scope="col">First name</th>
                    <th scope="col">Last name</th>
                    <th scope="col">Department</th>
                    <th scope="col"><%= attributeType.substring(0, 1).toUpperCase() + attributeType.substring(1)%> Average Rate</th>
                    <th scope="col">Equivalent</th>
                  </tr>
                </thead>
                <tbody>

                  <% for (int i=0; i < rank.professor_idList.size(); i++) { %>
                        <tr>
                            <th scope="row"><%=rank.professor_idList.get(i)%></th>
                            <td><%=rank.first_nameList.get(i)%></td>
                            <td> <%=rank.last_nameList.get(i)%></td>
                            <td> <%=rank.departmentList.get(i)%></td>
                            <td> <%=rank.attrList.get(i)%></td>
                            <td> <%=rr.equivalentList.get((int) Math.floor(rank.attrList.get(i)))%></td>
                        </tr>
                   <%  } %><br> 

                </tbody>
            </table>
                  
            <div style="bottom: 10px" class="mt-5">
                <a class="btn btn-lg btn-secondary" href="../homepage.jsp" role="button">Back</a>
            </div>
        </div>
               

               
    </body>
</html>
