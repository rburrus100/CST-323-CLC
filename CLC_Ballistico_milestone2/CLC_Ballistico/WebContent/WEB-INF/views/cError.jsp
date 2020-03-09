<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Spring MVC login example.</title>
  </head>
  <!-- stylesheet reference -->
      <style>
     <%@ include file="stylesheet1.css"%>
	</style>
  <body>
  <!-- display error message -->
    <h2>${message}</h2><br/>
    <!-- includes the register page with form below the error message -->
    <jsp:include page="/register.jsp"></jsp:include>  
  </body>
</html>