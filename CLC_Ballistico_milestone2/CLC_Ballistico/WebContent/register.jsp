<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <!-- Title and stylesheet reference -->
  <script src="https://kit.fontawesome.com/73d0be2950.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css?family=Montserrat|Righteous&display=swap" rel="stylesheet">
    <title>Register</title>
            <style>
     <%@ include file="stylesheet1.css"%>
	</style>
  </head>
 
 

  <body style="background-color:#ecf4f3;">
  <h1 style="padding-top:50px; padding-bottom:30px;">Register for Ballistico</h1>
  <!-- Registration form -->
    <form style="padding-left:35%;width:65%;" action="register.html" method="post">
	    <div style="background-color:#3c4245;" class="form-group">
		    <label style="color:white;" for="firstnameinput">First Name</label>
		    <input id="firstnameinput"type="text" name="firstName" placeholder="ex. Severus"/>
	    </div>
	    <div style="background-color:#3c4245;" class="form-group">
		    <label style="color:white;" for="lastnameinput">Last Name</label>
		    <input id="lastnameinput"type="text" name="lastName" placeholder="ex. Snape"/>
	    </div>
	    <div style="background-color:#3c4245;" class="form-group">
		    <label style="color:white;" for="userinput">Username</label>
		    <input id="userinput" type="text" name="userName" placeholder="ex. severus33"/>
	    </div>
	    <div style="background-color:#3c4245;" class="form-group">
		    <label style="color:white;" for="passinput">Password</label>
		    <input id="passinput" type="text" name="password" placeholder="ex. potterstinks"/>
	    </div>
	    <div style="background-color:#3c4245;" class="form-group">
		    <label style="color:white;" for="passvalidinput">Verify Password</label>
		    <input id="passvalidinput" type="text" name="passwordValid" placeholder="ex. potterstinks"/>
	    </div> 
    <input style="width:100px; background-color:#d1eecc; color:black;" type="submit" value="REGISTER"/>
    <button style="margin-left:10px;" type="button" class="btn btn-outline-dark" onclick="window.location.href = 'index.jsp';">Already a member?</button>     
    </form>  
    
  </body>
</html>