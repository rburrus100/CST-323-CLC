package com.spring.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DataController {
	
	   @RequestMapping("/ballistics")  
	   public ModelAndView ballistics(HttpServletRequest request,
			   HttpServletResponse response) {

		 //gets session, verifies the session is not null and gets the username for when a new blog is entered. 
		   HttpSession session = request.getSession();
		   
		      String userName= "";
			if(session.getAttribute("username")!= null) {
		    	  userName = session.getAttribute("username").toString();
		      }
		   //acquire title and entry data from new blog form
			  String cart =request.getParameter("rifles");  

		      //calls get_connection helper method
		      try {
				get_connection(userName, cart);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("unsuccessful in adding to recent searches!");
				e.printStackTrace();
			}
		   //display updated page
		   return new ModelAndView("added", 
		    		  "message", userName + " your new search data is available!"); 

}
	   
	   //Method to make a connection to database
		public Connection get_connection(String username, String cart) throws SQLException {
			Connection connection = null;

		
				try {
					Class.forName("com.mysql.jdbc.Driver");
					connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ballistic", "root", "");
					System.out.println("Connection SUccessful!!!");
				} catch ( ClassNotFoundException e) {
					System.out.println("Connection Fail!!!");
					System.out.print(e);
				}
				//calls helper method
				getData(username, cart);
				

			return connection;
			
		}  
		
		public void getData(String username, String cart) throws SQLException {
			Connection connection = null;

		
				try {
					Class.forName("com.mysql.jdbc.Driver");
					connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ballistic", "root", "");
					System.out.println("Connection SUccessful!!!");
				} catch ( ClassNotFoundException e) {
					System.out.println("Connection Fail!!!");
					System.out.print(e);
				}
				
				
				
				Statement stmnt = connection.createStatement();
				String rs = "INSERT INTO `ballistic_searches` (`cart`, `username`) VALUES('" + cart + "','" +  username  +  "')";
				
				stmnt.execute(rs);
				
			
		}

}
