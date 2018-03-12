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
<body>
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
      <sec:authorize access="!isAuthenticated()">
        <li role="presentation"><a href="login">Login</a></li> 
        <li role="presentation"><a href="register">Register</a></li>
      </sec:authorize>     
          <sec:authorize access="isAuthenticated()">
          
           <li><c:url value="/j_spring_security_logout" var="logoutUrl" />
							<a href="${logoutUrl}">Log Out</a>
			</li>  
			<%-- <c:when test="loggedin"></c:when> --%>
			<li  role="presentation" ><a href="http://localhost:8080/Mobilestore/cart">Cart</a></li>
			<%-- <li><a style="color: white"
							href="${pageContext.request.contextPath}/home">Hello <b><sec:authentication
										property="principal.username" /></b></a></li> --%>
		  </sec:authorize>   
</ul> 
  </div></div>
 </nav></div>
<!-- Carousel -->
<c:forEach items="${productList}" var="product">
    <div class="container">
        <div class="row product">
            <div class="col-md-5 col-md-offset-0">
            <img src="/Mobilestore/myImage/imageDisplay?id=${product.productid}" alt="" width="300" height="200" /></div>
            <div class="col-md-7">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Specifications </th>
                                <th>Details </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td> Name</td>
                                <td>${product.name}</td>
                            </tr>
                            <tr>
                                <td>Price </td>
                                <td>${product.price} </td>
                            </tr>
                            <tr>
                                <td>Description</td>
                                <td>${product.description} </td>
                            </tr>
                            </tbody>
                    </table>
                </div>
                <form:form action="addToCart/${product.productid}" method="POST">
                <button  class="btn btn-warning" type="submit">Add to cart</button>
                </form:form>
            </div>
        </div>
        
        <div class="media">
            <div class="media-body"></div>
        </div>
        <div class="media">
            <div class="media-body"></div>
        </div>
    </div>
    </c:forEach>  
</body>
<jsp:include page="Footer.jsp" />
</html>