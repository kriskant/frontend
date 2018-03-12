 <!DOCTYPE html>
<html lang="en">
<head>
  <title>Mobile-store</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<jsp:include page="Userheader.jsp" />
<body background="C:\Users\MANEE\Desktop\scenery.jpg">
<div class="container">
<form  method="post" action="j_spring_security_check" class="form-horizontal" >
		<div class="form-group">
     <label class="col-md-4 control-label" style="color:white">Username</label> 
		<div class="col-md-4 inputGroupContainer">
        <div class="input-group">
             <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
			<input name="j_username" type="email"  placeholder=" User Email" class="form-control" />
		</div></div>
	</div>
<br>
	<div class="form-group">
		<label class="col-md-4 control-label" style="color:white">Password</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
			<input name="j_password"  type="password" placeholder="User Password" class="form-control" />
		</div></div>
	</div>
	<div class="form-group">
	<label for="code" class="col-xs-4 control-label"></label>
		
		<!-- <div class="col-xs-4">	
		<input type="submit" value="Login" id="btn-add" class="btn btn-primary" >		
		</div>-->	
	</div>  
	<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-2">
	<button class="btn btn-primary btn-block login-button" type="submit"><i class="fa fa-sign-in"></i> Login</button></div></div>
</form></div>
</body>
<jsp:include page="Footer.jsp" />
</html>