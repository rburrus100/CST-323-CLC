<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import = "javax.servlet.http.HttpServletRequest.*" %>
<%@ page import = "javax.servlet.http.HttpServletResponse.*" %>
<%@ page import ="javax.servlet.http.HttpSession.*"%>
<html>
  <head>
  <script src="https://kit.fontawesome.com/73d0be2950.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css?family=Montserrat|Righteous&display=swap" rel="stylesheet">
  <!-- Title and stylesheet reference -->
    <title>Login</title>
    <style>
     <%@ include file="stylesheet1.css"%>
	</style>
  </head>
 
 

 
  <body style="background-color:#ecf4f3;">
  <h1 style="padding-top:200px; padding-bottom:30px;">Ballistico<i class="fas fa-long-arrow-alt-down"></i></h1>
   <!-- login form --> 
    <form style="padding-left:35%;width:65%;" action="login.html" method="post">
    <div style="background-color:#3c4245;" class ="form-group">
    <label style="color:white;" for="usernameinput">Username</label>
    <input type="text" class="form-control" id="usernameinput" placeholder="ex. John88" name="userName"/>
    </div>
    <div style="background-color:#3c4245;" class ="form-group">
    <label style="color:white;" for="passwordinput">Password</label>
    <input type="text" class="form-control" id="passwordinput" placeholder="ex. S3cur3p@ssw0rd" name="password"/>
    </div> 
    <input style="width:100px; background-color:#d1eecc; color:black;" type="submit" value="LOGIN"/>
    <button style="margin-left:10px;" type="button" class="btn btn-outline-dark" onclick="window.location.href = 'register.jsp';">REGISTER</button>  
    </form>   
     
    
    
    <!-- upon returning to the main page it ends the session -->
    <%
 
    HttpSession session1 =request.getSession();  
    session.invalidate();  
    %>
  </body>
</html>