<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
    <head>
    </head>
    <jsp:include page="Userheader.jsp" />
    <body background="C:\Users\MANEE\Desktop\aplle_iphoneX.jpg">
    <div class="container">
        <h3 style="color:white">Welcome, Enter The Employee Details</h3>
        <form:form method="POST" action="saveUser" modelAttribute="users">
     <div class="form-group">
     <label class="col-md-4 control-label" style="color:white">Username</label> 
		<div class="col-md-4 inputGroupContainer">
        <div class="input-group">
             <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
			 <form:input name="id" path="username" placeholder="User Name" class="form-control" />
		</div>
	</div>	</div>
	<br><br><br>
	<div class="form-group">
		<label class="col-md-4 control-label" style="color:white">E-Mail</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
			<form:input name="id" path="email" placeholder="Email" class="form-control" />
		</div></div>
	</div>
<br><br>
	<div class="form-group">
		<label class="col-md-4 control-label" style="color:white" >Password</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
			<form:input name="password"  path="password" placeholder="User Password" class="form-control" />
		</div></div>
	</div>
<br><br>
		<div class="form-group">
  <label class="col-md-4 control-label" style="color:white">Contact No.</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
			<form:input name="phone"  path="phone" placeholder="+ 91" class="form-control" />
		</div></div>
	</div>
<br>
<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4"><br>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button type="submit" class="btn btn-warning" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspADD USER <span class="glyphicon glyphicon-send"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>
  </div>
</div>
	<!-- <div class="form-group">
	<label for="code" class="col-xs-4 control-label"></label>	
		<div class="col-xs-4">
	<input type="submit" value="Add User" id="btn-add" class="btn btn-primary" >	
		</div>
	</div> -->
        </form:form>     
        <br><br><br>
        </div>
    </body>
    <jsp:include page="Footer.jsp" />
</html>