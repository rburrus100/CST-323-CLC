<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@page import = "javax.servlet.http.HttpServletRequest.*" %>
<%@ page import = "javax.servlet.http.HttpServletResponse.*" %>
<%@ page import ="javax.servlet.http.HttpSession.*"%>

<html>
  <head>
  <script src="https://kit.fontawesome.com/73d0be2950.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css?family=Montserrat|Righteous&display=swap" rel="stylesheet">
  
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script type="text/javascript">
  $(document).ready(function(){
	  $("#blogForm").click(function(){
		  $("#blog_form").show();
		  $("#blogForm").hide();
		  });
	  
	  var acc = document.getElementsByClassName("accordion");
	  var i;

	  for (i = 0; i < acc.length; i++) {
	    acc[i].addEventListener("click", function() {
	      this.classList.toggle("active");
	      var panel = this.nextElementSibling;
	      if (panel.style.maxHeight) {
	        panel.style.maxHeight = null;
	      } else {
	        panel.style.maxHeight = panel.scrollHeight + "px";
	      } 
	    });
	  
	  
	  
	  }});


  

           
        </script>
  
  <script type="text/javascript">

  </script>
  <!-- Title and stylesheet reference -->
    <title>Search Ballistic presets</title>
        <style>
     <%@ include file="blogstyle.css"%>
	</style>
  </head>
  <body>
<!-- navigation bar along top of page with logout button/link -->
  <div class="topnav">


</div>

<div >

<!-- welcome message -->
<br>
<h4 style="font-family: 'Montserrat', sans-serif;" align="center">${message}</h4>


</div>
<div align = "center">

<h3 style="font-family: 'Montserrat', sans-serif;" align="center" >My Ballistic Searches </h3>
<!-- new blog entry form -->


<!--this is where we have our dropdown in our home dashboard. it only gives 4 options right now but that will be expanded upon as we progress.-->
</div>
	<div class = "container">
      <form action="ballistics.html" method="post" id = "ballistic_form">
        <br />
         <select id="rifles" name="rifles">
  			<option value="17Mach2">Cartridge: 17 Mach 2 - Bullet: 15.5 gr. NTX</option>
  			<option value="17HMR">Cartridge: 17 HMR - Bullet: 15.5 gr. NTX </option>
  			<option value="17Hornet"> Cartridge: 17 Hornet - Bullet: 20 gr. V-MAX </option>
  			<option value="204Ruger">Cartridge: 204 Ruger - Bullet: 45gr. SP(26" Bbl)")</option>
		</select>
         <br>
         
         <input class="btn btn-dark btn-lg" style="font-family: 'Montserrat', sans-serif;" type = "submit"  value = "Display Data" />
      </form>
      </div>
      <div class = "container">
      <h2>My recent ballistic searched</h2>
      <h4>click to expand to see associated data</h4>
      </div>
      <div id="accordion" class = "container">
 <!-- connection to database and population of table showing all entries by the current sessions user -->
 <%
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
		
		HttpSession session1 = request.getSession();
		String userName = session1.getAttribute("username").toString();

		
		Statement statement = null;
		statement = connection.createStatement();
		String QueryString = "SELECT * FROM ballistic_searches WHERE username LIKE '" + userName + "'";
		ResultSet rs = statement.executeQuery(QueryString);
		
		
		%>
		

		<%
		while (rs.next()) {


		%>
		
		<!-- this is the accordian menu where the data is meant to be populated.
		for this application we are using 3 different tables at the moment which are
		the users, the dataset searches and the preset data. 
		 -->
		<button class="accordion"><%=rs.getString("cart")%></button>
		<div class="panel">


		<p>Cartridge Name:</p>
		<p>Bullet:</p>
		<p>Weight:</p>
		<p>Velocity</p>
		<p>Energy:</p>
		<p>Trajectory:</p>

		

		</div>
			<% } %>

      
      </div>


	 
 
  </body>
</html>