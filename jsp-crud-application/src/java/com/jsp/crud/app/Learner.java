/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jsp.crud.app;

/**
 *
 * @author New
 */
public class Learner {
    private String idNumber;
    private String adminNo;
    private String firstName;
    private String middleName;
    private String lastName;
    private String gender;
    private String dateOfBirth;
    private String grade;
    private String learnerClass;
    
    public Learner(){
        
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public String getAdminNo() {
        return adminNo;
    }

    public void setAdminNo(String adminNo) {
        this.adminNo = adminNo;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getLearnerClass() {
        return learnerClass;
    }

    public void setLearnerClass(String learnerClass) {
        this.learnerClass = learnerClass;
    }
    
    
}
