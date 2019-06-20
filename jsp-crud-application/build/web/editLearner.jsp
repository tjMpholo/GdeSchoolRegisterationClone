<%-- 
    Document   : index
    Created on : Jun 17, 2019, 1:09:24 PM
    Author     : New
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.jsp.crud.app.EditLearner"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
        <title>Simple Crud application</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <jsp:useBean id="editObject" class="com.jsp.crud.app.EditLearner" scope="request">
                    </jsp:useBean>
                    
                    <h3>Existing learners</h3>
        				<hr>
        			<table class="table table-bordered table-stripped">
        				<thead>
        					<tr>
                                                        <th>Admin No.</th>
        						<th>ID number</th>
        						<th>First Name</th>
        						<th>Middle Name</th>
        						<th>Last Name</th>
        						<th>Gender</th>
        						<th>Date of birth</th>
        						<th>Grade</th>
        						<th>Class</th>
        					</tr>
        				</thead>
        				<tbody>
                                        <h3> <%= editObject.errorMess %>  </h3>
                                            <%! com.jsp.crud.app.Learner currLearner; %>
                                            <%! String editAdminNoParam = "";%>
                                            
                                             <%if (request.getParameter("adminNo") != null && request.getParameter("editLearner") != null ){%>
                                                <% if (request.getParameter("editLearner").equals("true")){ %>
                                                    <% editAdminNoParam = request.getParameter("adminNo"); %>
                                                <%}%>
                                             <%}%>
                                             
                                             <%if (request.getParameter("btnSave") != null){%>
                                                <% editObject.saveLearnerChangesToDb(request); 
                                                   response.sendRedirect("index.jsp");
                                                %>
                                             <%}%>
                                             
                                            
                                            <% for (int i = 0;i < editObject.getLearnerList().size();i++){%>
                                                <% currLearner = editObject.getLearnerList().get(i);%>
                                                
                                                <% if (editAdminNoParam.equals(currLearner.getAdminNo())){%>
                                                <form method="post" action="editLearner.jsp?saveChanges=true&adminNo=<%=currLearner.getAdminNo()%>">
                                                    <tr>
                                                    <td>
                                                        <%= currLearner.getAdminNo() %>
                                                    </td>
                                                    <td>
                                                        <%= currLearner.getIdNumber()%>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="editFirstName" class="form-control input-xs" value="<%= currLearner.getFirstName()%>">
                                                    </td>
                                                    <td>
                                                        <input type="text" name="editMiddleName" class="form-control input-xs" value="<%= currLearner.getMiddleName()%>">
                                                    </td>
                                                    <td>
                                                        <input type="text" name="editLastName" class="form-control input-xs" value="<%= currLearner.getLastName()%>">
                                                    </td>
                                                    <td>
                                                        <%= currLearner.getGender()%>
                                                    </td>
                                                    <td>
                                                        <%= currLearner.getDateOfBirth()%>
                                                    </td>
                                                    <td>
                                                        <select name="editGrade" class="form-control input-sm">
                                                            <option value="-1">Select Grade</option>
                                                            <% for (int j = 8;j < 13;j++){%>
                                                                <% if ( currLearner.getGrade().equals(Integer.toString(j))){%>
                                                                    <option value="<%= j%>" selected><%= j%></option>
                                                                <%}else{%>
                                                                    <option value="<%= j%>"><%= j%></option>
                                                                <%}%>
                                                            <%}%>
                                                        </select>         
                                                    </td>
                                                    <td>
                                                        <select name="editClass" class="form-control input-sm">
                                                            <option value="-1">Select Class</option>
                                                            <% for (char k = 'A';k < 'F';k++){%>
                                                                <% if ( currLearner.getLearnerClass().equals(Character.toString(k))){%>
                                                                    <option value="<%= k%>" selected><%= k%></option>
                                                                <%}else{%>
                                                                    <option value="<%= k%>"><%= k%></option>
                                                                <%}%>
                                                            <%}%>
                                                        </select>
                                                    </td>
                                                    <td style="width:5%">
                                                            <button type="submit" name="btnSave" class="btn btn-sm btn-link" value="" style="padding:0">
                                                                <span class="glyphicon glyphicon-pencil"/>
                                                            </button>
        							<a href="index.jsp" class="btn btn-link btn-sm" style="padding:0"><span class="glyphicon glyphicon-remove-sign"></span></a>
        						</td>
        					</tr>
                                                </form>
                                                <%}else{%>
                                                    <tr>
                                                    <td>
                                                        <%= currLearner.getAdminNo() %>
                                                    </td>
                                                    <td>
                                                        <%= currLearner.getIdNumber()%>
                                                    </td>
                                                    <td>
                                                        <%= currLearner.getFirstName()%>
                                                    </td>
                                                    <td>
                                                        <%= currLearner.getMiddleName()%>
                                                    </td>
                                                    <td>
                                                        <%= currLearner.getLastName()%>
                                                    </td>
                                                    <td>
                                                        <%= currLearner.getGender()%>
                                                    </td>
                                                    <td>
                                                        <%= currLearner.getDateOfBirth()%>
                                                    </td>
                                                    <td>
                                                        <%= currLearner.getGrade()%>
                                                    </td>
                                                    <td>
                                                        <%= currLearner.getLearnerClass()%>
                                                    </td>
        						<td>
        							<a href="EditLearnerDetails.html?adminNo="><span class="glyphicon glyphicon-pencil"></span></a>
        							<a href="DeleteLearnerDetails.html?adminNo=" onclick="return alert('Are your sure you want to delete from the database?')"><span class="glyphicon glyphicon-remove-sign"></span></a>
        						</td>
        					</tr>
                                                <%}%>
                                           <%}%>
        				</tbody>
        			</table>
                </div>
                <div class="col-md-12">
                    <a href="addNewLearner.jsp" class="btn btn-primary">Add a new Learner</a>
                </div> 
            </div> 
        </div>
    </body>
</html>
