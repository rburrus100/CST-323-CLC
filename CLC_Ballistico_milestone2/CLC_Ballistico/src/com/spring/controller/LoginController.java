package com.spring.controller;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
 
@Controller
public class LoginController {
	
	
	//connect to database
	public boolean get_connection(String name, String password) throws SQLException {
		Connection connection = null;
		boolean loginStatus = true;
	
			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ballistic", "root", "");
				System.out.println("Connection SUccessful!!!");
			} catch ( ClassNotFoundException e) {
				System.out.println("Connection Fail!!!");
				System.out.print(e);
			}
			//returns true if the input values are valid username and password
			loginStatus = checkCredentials(connection,name,password);
			

		return loginStatus;
		
	}

	//checks the users credentials to see if it is all a valid login credential set
	public boolean checkCredentials(Connection conn, String username, String password) throws SQLException {
		
		Statement stmnt = conn.createStatement();
		ResultSet rs = stmnt.executeQuery("SELECT * FROM USERS");
		
		boolean success = false;
		
		while(rs.next()) {
			String dbUsername = rs.getString("username");
			String dbPass = rs.getString("password");
			


			
			if (username.equals(dbUsername) && password.equals(dbPass)) {
				success = true;
				break;
			}
			else
				success = false;

		}

		return success;
		
	}
	
	
	//the main login method which calls helper methods such as the check credentials and gets parameters from the former text boxes. 
	//this is also where  a session is set for access to user information later on
   @RequestMapping("/login")  
   public ModelAndView login(HttpServletRequest request,
		   HttpServletResponse response) {
	   
	  
	   
	  String userName=request.getParameter("userName");  
      String password=request.getParameter("password");
      String message;
 
      
     HttpSession session = request.getSession();
      if(session.getAttribute(userName)!= null && session.getAttribute(password)!=null) {
    	  userName = session.getAttribute("userName").toString();
    	  password = session.getAttribute("password").toString();
      }
      
      boolean credentialsMet = false;
      
      try {
		credentialsMet = get_connection(userName,password);
		

	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
      
	

      if(credentialsMet == true) {
    	  System.out.println("status in the thing: " + credentialsMet);
    	  message = "Welcome " +userName + ".";
    	  session.setAttribute("username", userName);
    	  session.setAttribute("password", password);
	      return new ModelAndView("welcome", 
	    		  "message", message);  

      }else{
    	  message = "Wrong username or password." 
      + session.getAttribute("username").toString()
      + " "+ session.getAttribute("password").toString();
    	  return new ModelAndView("errorPage", 
    			  "message", message);
      }
    	  

   }
}
