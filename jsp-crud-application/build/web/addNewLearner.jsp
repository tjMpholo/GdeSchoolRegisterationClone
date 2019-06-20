<%-- 
    Document   : addNewLearner
    Created on : Jun 17, 2019, 1:54:17 PM
    Author     : New
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.jsp.crud.app.SaveLearnerToDb"%>
<jsp:useBean id="saveLearnerData" class="com.jsp.crud.app.SaveLearnerToDb" scope="request"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
    <%
        if (request.getParameter("btn_add_learner") != null){
            if (saveLearnerData.addLearnerToDb(request)){
                response.sendRedirect("index.jsp");
            }else{
                out.println("Could not add leaner!");
            }
        }
    %>
    
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
            <title>JSP Page</title>
        </head>
        <body>
            <body>
        <div class="container">
        	<div class="row">
        		<div class="col-md-12">
        			
        	<h3>Register new learner</h3>
        <hr>
        <form action="addNewLearner.jsp" method="post" accept-charset="utf-8">
        	<div class="form-group">
        		<label>
        			Identity number
        			<input type="text" class="form-control input-sm" name="id_number" value="">
        		</label>

        		<label>
        			First Name
        			<input type="text" class="form-control input-sm" name="first_name" value="">
        		</label>

        		<label>
        			Middle Name
        			<input type="text" class="form-control input-sm" name="middle_name" value="">
        		</label>
        	    <br>
        		<label>
        			Last Name
        			<input type="text" class="form-control input-sm" name="last_name" value="">
        		</label>
                <label>
                    Home language
                    <select name="homeLang" class="form-control input-sm">
                        <option value="-1">Select home language</option>
                        <option value="M">English</option>
                        <option value="F">Afrikaans</option>
                    </select>
                </label>
        		<br>
        		<label>
        			Gender
        			<select name="gender" class="form-control input-sm">
        				<option value="-1">Select Gender</option>
        				<option value="M">Male</option>
        				<option value="F">Female</option>
        			</select>
        		</label>
        		
        		<label>
        			Date of birth
        			<input type="text" class="form-control input-sm" name="date_of_birth" value="">
        		</label>
        		<br>
        		<label>
        			Grade
        			<select name="grade" class="form-control input-sm">
        				<option value="-1">Select Grade</option>
        				<option value="8">8</option>
        				<option value="9">9</option>
        				<option value="10">10</option>
        				<option value="11">11</option>
        				<option value="12">12</option>
        			</select>
        		</label>
    
        		<label>
        			Class
        			<input type="text" class="form-control input-sm" name="class" disabled="true" value="A">
        		</label>
        		<br>
        		<input type="submit" value="Add Learner" name="btn_add_learner" class="btn btn-success input-sm">

        		<input type="reset" name="btn_add_learner" class="btn btn-warning input-sm">

                <a href="index.jsp" class="btn btn-sm btn-primary">View registered learners</a>
        				</div>
        			</form>	
        		</div>
        </div>
    </body>
        </body>
    </html>
