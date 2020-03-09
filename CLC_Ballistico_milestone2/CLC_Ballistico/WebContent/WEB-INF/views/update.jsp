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
  <!-- Title and stylesheet reference -->
    <title>Learn about your favorite weapons</title>
        <style>
     <%@ include file="blogstyle.css"%>
	</style>
	

	
	
  </head>
  <body>
<!-- navigation bar along top of page with logout button/link -->
  <div class="topnav">
  <a class="active" href="http://localhost:8080/Spring-MVC-LoginForm/">Logout</a>

</div>

<div >

<!-- welcome message -->
<br>
<h4 style="font-family: 'Montserrat', sans-serif;" align="center">${message}</h4>


</div>
<div align = "center">

<h3 style="font-family: 'Montserrat', sans-serif;" align="center" >My Blog Entries</h3>
<!-- new blog entry form -->

<div id="accordion" class = "container">
 <!-- connection to database and population of table showing all blog entries by the current sessions user -->
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
		String title = session1.getAttribute("title").toString();
		String content = session1.getAttribute("content").toString();
		
		Statement statement = null;
		statement = connection.createStatement();
		String QueryString = "SELECT * from blogs WHERE username LIKE '" + userName + "%'";
		ResultSet rs = statement.executeQuery(QueryString);
      
		%>
		
		</div>
	<div class = "container" id = "new_post">
      <form action="updateHandler.html" method="post">
        <br />
         <input value=<%=title %> type = "text" name = "title" />
         <br>
         <textarea style="font-family: 'Montserrat', sans-serif;" value=<%= content %> rows = "5" cols = "59" name = "content">
         </textarea>
         
         <input class="btn btn-dark btn-lg" style="font-family: 'Montserrat', sans-serif;" type = "submit"  value = "Update" />
      </form>
      </div>
      
    
		
		
		<%
		while (rs.next()) {
		%>
		<button class="accordion"><%=rs.getString("title")%></button>
		<div class="panel">
		<p><%=rs.getString("content")%>
		<form action= "blogDelete.html" method = "post">
		<input type="hidden" id="clickedValue" name="clickedValue" value=<%=rs.getInt("ID")%>>
		<input class="btn btn-dark btn-lg" style="font-family: 'Montserrat', sans-serif;" type = "submit" value = "Delete Post"/>
		</form>
		
		<form action= "blogUpdateCall.html" method = "post">
		<input type="hidden" id="clickedValue" name="clickedValue" value=<%=rs.getInt("ID")%>>
		<input class="btn btn-dark btn-lg" style="font-family: 'Montserrat', sans-serif;" type = "submit" value = "Update Post" />
		</form>
		
		
		</div>
			<% } %>

      
      

</div>
	 
 
  </body>
</html>