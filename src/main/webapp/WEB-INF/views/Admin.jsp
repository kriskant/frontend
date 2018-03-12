  <!DOCTYPE html>
<html lang="en">
<head>
  <title>Mobile-store</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
   		<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
   		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
</head>
<body background="C:\Users\MANEE\Desktop\aplle_iphoneX.jpg">
<!-- <h3>welcome to ADMIN</h3>
             <a href="supplier">Supplier</a>
            <a href="category">Category</a>
            <a href="product">Product</a>  --> 
            <div class="bs-example">
   <nav class="navbar navbar-inverse " role="navigation">
 <div class="container-fluid">
    <div class="navbar-header">
       <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
       </button>
      <a class="navbar-brand" href="my-page">Mobile-store</a></div>
     <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
 <ul class="nav navbar-nav"> 
      <li class="active"><a href="home">Home</a></li>
       <li><a href="supplier">Supplier</a></li>
       <li><a href="category">Category</a></li>
       <li><a href="product">Product</a></li>  
     
      <sec:authorize access="!isAuthenticated()">
        <li role="presentation"><a href="login">Login</a></li> 
        <li role="presentation"><a href="register">Register</a></li>
      </sec:authorize>     
          <sec:authorize access="isAuthenticated()">
          
           <li><c:url value="/j_spring_security_logout" var="logoutUrl" />
							<a href="${logoutUrl}">Log Out</a>
			</li>  
			<li><a style="color: white"
							href="${pageContext.request.contextPath}/home">Hello <b><sec:authentication
										property="principal.username" /></b></a></li>
		  </sec:authorize>   
</ul> 
  </div></div>
 </nav></div>
</body>
<jsp:include page="Footer.jsp"></jsp:include>
</html>


  <%-- <li class="dropdown">
     <a href="${pageContext.request.contextPath}/admin" class="dropdown-toggle" data-toggle="dropdown" class="dropdown-toggle" >Admin <span class="caret"></span></a>
          <ul class="dropdown-menu">   
            <li><a href="supplier">Supplier</a></li>
            <li><a href="category">Category</a></li>
            <li><a href="product">Product</a></li>      
           </ul>
    </li>  --%>