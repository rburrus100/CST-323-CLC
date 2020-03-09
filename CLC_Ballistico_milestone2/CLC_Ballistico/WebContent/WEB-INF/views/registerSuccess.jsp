<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Thank you for registering!</title>
  </head>
  <!-- stylesheet reference -->
      <style>
     <%@ include file="stylesheet1.css"%>
	</style>
  <body>
  <!-- Successful register message -->
    <h2>${message}</h2>
  <!-- includes login page with form to login -->
    <jsp:include page="/index.jsp"></jsp:include>
  </body>
</html>