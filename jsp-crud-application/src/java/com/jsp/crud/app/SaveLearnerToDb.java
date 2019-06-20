/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jsp.crud.app;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author New
 */
public class SaveLearnerToDb {
    private PreparedStatement preparedStatement;
    private Connection connection;
    private ResultSet resultSet;
    
    public SaveLearnerToDb(){
        initializeJdbc();
    }
    
    private boolean initializeJdbc(){
         String returnStr = "";
         try {
             Class.forName("com.mysql.jdbc.Driver");
             returnStr += "Driver loaded";
             
             connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + ConfigData.dbName,"root",ConfigData.dbPassword);
             returnStr += "\nDatabase Connected";
             
             preparedStatement = connection.prepareStatement("SELECT * FROM learner");
             return true;
         } catch (Exception ex) {
             System.out.println(ex);
         }

         return false;
     }
    
    public boolean addLearnerToDb(HttpServletRequest request){
        String idNumber = (request.getParameter("id_number") == null) ? "":request.getParameter("id_number");
        String firstName = (request.getParameter("first_name") == null) ? "":request.getParameter("first_name");
        String middleName = (request.getParameter("middle_name") == null) ? "":request.getParameter("middle_name");
        String lastName = (request.getParameter("last_name") == null) ? "":request.getParameter("last_name");
        String gender = (request.getParameter("gender") == null) ? "":request.getParameter("gender");
        String dateOfBirth = (request.getParameter("date_of_birth") == null) ? "":request.getParameter("date_of_birth");
        String grade = (request.getParameter("grade") == null) ? "":request.getParameter("grade");
        String learnerClass = (request.getParameter("class") == null) ? "":request.getParameter("class");
        String adminNo = getAdminNo();
        
         try {
             preparedStatement = connection.prepareStatement("INSERT INTO learner(identity_number,first_name,middle_name,last_name,gender,date_of_birth,grade,class,admin_no) VALUES(?,?,?,?,?,?,?,?,?)");
             preparedStatement.setString(1, idNumber);
             preparedStatement.setString(2, firstName);
             preparedStatement.setString(3, middleName);
             preparedStatement.setString(4, lastName);
             preparedStatement.setString(5, gender);
             preparedStatement.setString(6, dateOfBirth);
             preparedStatement.setString(7, grade);
             preparedStatement.setString(8, "A");
             preparedStatement.setString(9, adminNo);
             preparedStatement.executeUpdate();
             connection.close();
             return true;
         } catch (Exception ex) {
             return false;
         }
    }
     
    public boolean doesLearnerExist(String idNumberVal){
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM learner WHERE identity_number = ?");
            preparedStatement.setString(1, idNumberVal);
            
            if (preparedStatement.executeQuery().next()){
                return true;
            }
        } catch (Exception e) {
            return false;
        }

        return false;
    }
    
    private String getAdminNo(){
        ArrayList<String> adminNoList = new ArrayList<>();
        String newAdminNo = "";
        
        try {
            preparedStatement = connection.prepareStatement("SELECT ADMIN_NO FROM learner");
            
            resultSet = preparedStatement.executeQuery();
            
            while (resultSet.next()){
                adminNoList.add(resultSet.getString(1));
            }
            
            newAdminNo = generateAdminNo();
            
            do{
                newAdminNo = generateAdminNo();
            }while (adminNoList.contains(newAdminNo));
            return newAdminNo.substring(7,newAdminNo.length());
        } catch (Exception e) {
            return e.getMessage();
        }
    }
    
    private String generateAdminNo(){
        return Long.toString(System.currentTimeMillis());
    }
    
    private String getLearnerDisplayList(int gradeVal){
        ResultSet learnerRs = getLearnersFrmDb(gradeVal);
        String returnStr = "";
        
        if (learnerRs == null){
            return "<h3>No learners found!</h3>";
        }
        else{
            try {
                while (learnerRs.next()){
                    returnStr += "<tr>\n" +
"        						<td>" + learnerRs.getString(2) + "</td>\n" +
"        						<td>" + learnerRs.getString(1) + "</td>\n" +
"        						<td>" + learnerRs.getString(3) + "</td>\n" +
"        						<td>" + learnerRs.getString(4) + "</td>\n" +
"        						<td>" + learnerRs.getString(5) + "</td>\n" +
"        						<td>" + learnerRs.getString(6) + "</td>\n" +
"        						<td>" + learnerRs.getString(7) + "</td>\n" +
"        						<td>" + learnerRs.getString(8) + "</td>\n" +
"        						<td>" + learnerRs.getString(9) + "</td>\n" +
"        						<td>\n" +
"        							<a href=\"EditLearner?adminNo=" + learnerRs.getString(2) + "\"><span class=\"glyphicon glyphicon-pencil\"></span></a>\n" +
"        							<a href=\"MainPage?delete=true&adminNo=" + learnerRs.getString(2) + "\" onclick=\"return confirm('Are your sure you want to delete " + learnerRs.getString(3) + " " + learnerRs.getString(5) + " from the database?')\"><span class=\"glyphicon glyphicon-remove-sign\"></span></a>\n" +
"        						</td>" +
"        					</tr>";
                }
                return returnStr;
            } catch (Exception e) {
                e.printStackTrace();
                return e.getMessage();
            }
        }
        //return "";
    }
    
    private ResultSet getLearnersFrmDb(int gradeVal){
        String sqlString = "SELECT * FROM learner";

        try {
            if (gradeVal > 0){
                sqlString += " WHERE grade = ?";
                preparedStatement = connection.prepareStatement(sqlString);
                preparedStatement.setInt(1, gradeVal);
            }
            else{
                preparedStatement = connection.prepareStatement(sqlString);
            }

            return preparedStatement.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }
}
