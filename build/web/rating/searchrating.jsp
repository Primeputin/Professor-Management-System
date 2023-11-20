String subject_name = request.getParameter("subjectname");
            String year = request.getParameter("subject_year");
            String attributeType = request.getParameter("attribute");
            ArrayList<Double> attrList = new ArrayList<>();
            rank.subject_name = subject_name;
            rank.year = year;
            rank.showRankAttribute(attributeType);
switch(attributeType)
            {
                case "approachability":
                    attrList = rank.approachabilityAvgList;
                    break;
                case "axplanation":
                    attrList = rank.explanationAvgList;
                    break;
                case "kindess":
                    attrList = rank.kindnessAvgList;
                    break;
                case "knowledgability":
                    attrList = rank.knowledgabilityAvgList;
                    
                    
            }
<h1>Ranking of professor by an attribute in a <%= attributeType%>!</h1>
<table class="table">
            <thead>
              <tr>
                <th scope="col">Professor ID</th>
                <th scope="col">First name</th>
                <th scope="col">Last name</th>
                <th scope="col">Department</th>
                <th scope="col"><%=attributeType%> Average Rate</th>
              </tr>
            </thead>
            <tbody>
                
              <% for (int i=0; i < rank.professor_idList.size(); i++) { %>
                    <tr>
                        <th scope="row"><%=rank.professor_idList.get(i)%></th>
                        <td><%=rank.first_nameList.get(i)%></td>
                        <td> <%=rank.last_nameList.get(i)%></td>
                        <td> <%=rank.departmentList.get(i)%></td>
                        <td> <%=attrList.get(i)%></td>
                    </tr>
               <%  } %><br> 
              
            </tbody>
          </table>