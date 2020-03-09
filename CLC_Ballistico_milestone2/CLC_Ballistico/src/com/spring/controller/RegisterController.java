package com.spring.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class RegisterController {
	
	
	//establish connection to database
	public boolean get_connection(String name) throws SQLException {
		Connection connection = null;
		boolean taken = true;
	
			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ballistic", "root", "");
				System.out.println("Connection SUccessful!!!");
			} catch ( ClassNotFoundException e) {
				System.out.println("Connection Fail!!!");
				System.out.print(e);
			}
			
			
			//calls helper method checkUsernames
			taken = checkUsernames(connection,name);


			
		return taken;
		
	}
	
	//helper method that connects to database and checks each index and compares that index username to the input username
	//if that username is taken returns true
	//if not returns false.
	public boolean checkUsernames(Connection conn, String username) throws SQLException {
		
		Statement stmnt = conn.createStatement();
		ResultSet rs = stmnt.executeQuery("SELECT * FROM USERS");
		
		boolean taken = false;
		
		while(rs.next()) {
			String dbUsername = rs.getString("username");

			if (username.equals(dbUsername)) {
				taken = true;
				break;
			}
			else
				taken = false;

		}
	
		return taken;
		
	}
	
	//helper method that connects to database and adds a new index with the provided information from the registration form
	public void registerUser(String fName, String lName, String username, String password, String age) throws SQLException {
		Connection connection = null;

	
			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ballistic", "root", "");
				System.out.println("Connection SUccessful!!!");
			} catch ( ClassNotFoundException e) {
				System.out.println("Connection Fail!!!");
				System.out.print(e);
			}
			Statement stmtID = connection.createStatement();
			ResultSet getID =stmtID.executeQuery("SELECT * FROM USERS");
			int ID = 0;
			while(getID.next()) {
				ID++;
			}
			
			ID= ID +1;
			
			Statement stmnt = connection.createStatement();
			String rs = "INSERT INTO `users` (`fname`, `ID`, `lname`, `password`, `username`) VALUES('" + fName + "','" +  ID + "','" + lName + "','" + password + "','" + username + "')";
			//INSERT INTO `users` (`firstName`, `lastName`, `age`, `password`, `ID`, `username`) VALUES ('Crystal', 'Sciarrino', '26', 'Sciarrino', NULL, 'CSciarrino');

			stmnt.execute(rs);
			
		
	}
	
	
	
	
		//controller method
	   @RequestMapping("/register")  
	   public ModelAndView login(HttpServletRequest request,
			   HttpServletResponse response) {
		   //acquire all input values
		  String userName=request.getParameter("userName");  
	      String password=request.getParameter("password");
	      String passwordValid = request.getParameter("passwordValid");
		  String firstName=request.getParameter("firstName");
		  String lastName = request.getParameter("lastName");
		  String age = "0";

		  boolean usernameTaken = false;
		  
		  //connects to database and checks if the username value is taken
		  //returns false if it is available.
	      String message;
	      try {
	    	usernameTaken = get_connection(userName);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	      

	      
	      //checks that all credentials are filled and meet the minimum criteria
	      //if true calls helper method to add new user to database.
	      //if false prints a prompt with the proper text explaining what went wrong.
	      if(userName != null && 
	    		  !userName.equals("") 
	    		  && usernameTaken== false  && 
	    		  password != null && 
	    		  !password.equals("") && 
	    		  password.equals(passwordValid) && 
	    		  firstName != null && 
	    		  firstName != "" && 
	    		  lastName != null && 
	    		  lastName != "" ){
	    	  message = "You have successfully registered! Please Login " +userName + ".";
	    	  try {
				registerUser(firstName, lastName,userName, password, age);
				System.out.println("Data successfully input to database!");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		      return new ModelAndView("registerSuccess", 
		    		  "message", message);  
	 
	      }
	      else if (usernameTaken == true) {
	    	  message = "That username is taken!! Try another";
	    	  return new ModelAndView("cError", 
	    			  "message", message);
	      }
	      
	      else if(firstName == null || firstName =="") {
	    	  message = "You must enter a first name";
	    	  return new ModelAndView("cError", 
	    			  "message", message);
	      }
	      else if(lastName == null || lastName =="") {
	    	  message = "You must enter a last name";
	    	  return new ModelAndView("cError", 
	    			  "message", message);
	      }
	      
	      else if(password == null || password.length()<5) {
	    	  message = "You must enter a password with at least 5 characters";
	    	  return new ModelAndView("cError","message",message);
	      }
	      
	      else if (password != passwordValid) {
	    	  message = "Your passwords do not match. Please try again.";
	    	  return new ModelAndView ("cError", "message", message);
	      }
	      
	      
	      else{
	    	  message = "Error.";
	    	  return new ModelAndView("cError", 
	    			  "message", message);
	      }
	   }
	

}

