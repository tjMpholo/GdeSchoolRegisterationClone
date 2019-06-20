<%-- 
    Document   : index
    Created on : Jun 17, 2019, 1:09:24 PM
    Author     : New
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.jsp.crud.app.MainPage"%>
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
                    <jsp:useBean id="mainObject" class="com.jsp.crud.app.MainPage" scope="request">
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
                                        <h3> <%= mainObject.errorMess %>  </h3>
                                            <%! com.jsp.crud.app.Learner currLearner; %>
                                            

                                            <% for (int i = 0;i < mainObject.getLearnerList().size();i++){%>
                                                <% currLearner = mainObject.getLearnerList().get(i);%>
                                                
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
        							<a href="editLearner.jsp?editLearner=true&adminNo=<%= currLearner.getAdminNo() %>"><span class="glyphicon glyphicon-pencil"></span></a>
        							<a href="DeleteLearnerDetails.html?adminNo=" onclick="return alert('Are your sure you want to delete from the database?')"><span class="glyphicon glyphicon-remove-sign"></span></a>
        						</td>
        					</tr>
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
