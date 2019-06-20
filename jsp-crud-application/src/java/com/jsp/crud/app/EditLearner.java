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
public class EditLearner{
    private ArrayList<Learner> learnerList;
    private PreparedStatement preparedStatement;
    private Connection connection;
    public String errorMess = "";
    
    public EditLearner(){
        initializeJdbc();
        learnerList = prepareLearnerList(0);
        
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
    
    public ArrayList<Learner> getLearnerList(){
        return learnerList;
    }
    
    private ArrayList<Learner> prepareLearnerList(int gradeVal){
        ResultSet learnerRs = getLearnerResultSet(gradeVal);
        ArrayList<Learner> list = new ArrayList<>();
        //String returnStr = "";
        
        if (learnerRs == null){
            return null;
        }
        else{
            try {
                while (learnerRs.next()){
                    Learner currlearner = new Learner();
                    currlearner.setAdminNo(learnerRs.getString(2));
                    currlearner.setIdNumber(learnerRs.getString(1));
                    currlearner.setFirstName(learnerRs.getString(3));
                    currlearner.setMiddleName(learnerRs.getString(4));
                    currlearner.setLastName(learnerRs.getString(5));
                    currlearner.setGender(learnerRs.getString(6));
                    currlearner.setDateOfBirth(learnerRs.getString(7));
                    currlearner.setGrade(learnerRs.getString(8));
                    currlearner.setLearnerClass(learnerRs.getString(9));
                    
                    list.add(currlearner);
                }
                
                return list;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
    }
    
    private ResultSet getLearnerResultSet(int gradeVal){
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
    
    public String saveLearnerChangesToDb(HttpServletRequest request){
        if (request.getParameter("adminNo") == null)
            return "Error";
        
        String adminNo = request.getParameter("adminNo");
        String idNumber = "";
        String firstName = (request.getParameter("editFirstName") == null) ? "":request.getParameter("editFirstName");
        String middleName = (request.getParameter("editMiddleName") == null) ? "":request.getParameter("editMiddleName");
        String lastName = (request.getParameter("editLastName") == null) ? "":request.getParameter("editLastName");
        String gender = "";
        String dateOfBirth = "";
        String grade = (request.getParameter("editGrade") == null) ? "":request.getParameter("editGrade");
        String learnerClass = (request.getParameter("editClass") == null) ? "":request.getParameter("editClass");
        
        try {
          preparedStatement = connection.prepareStatement("UPDATE learner SET first_name = ?,middle_name = ?,last_name = ?,grade = ?,class = ? WHERE admin_no = ?");
          preparedStatement.setString(1, firstName);
          preparedStatement.setString(2, middleName);
          preparedStatement.setString(3, lastName);
          preparedStatement.setString(4, grade);
          preparedStatement.setString(5, learnerClass);
          preparedStatement.setString(6, adminNo);
          return Integer.toString(preparedStatement.executeUpdate());

        } catch (Exception e) {
            return e.getMessage() + "ffff";
        }
    }
}
