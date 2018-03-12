<%@ page language="java" contentType="text/html" import="com.modal.Supplier"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>supplier</title>
    </head>
    <jsp:include page="header.jsp"></jsp:include>
    <body>
        <h3>Welcome, Enter The Supplier Details</h3>
        <form:form method="POST" action="${pageContext.request.contextPath}/saveSupplier" modelAttribute="supplier">
     <%-- <div class="form-group">
		<label for="Supplier ID" class="col-xs-4 control-label">Supplier Id</label>
		<div class="col-xs-4">
			<form:input name="supplierid" path="supplierid" placeholder="Supplier ID" class="form-control" />
		</div>
	</div> --%>
	<br><br><br>
	<div class="form-group">
		<label for="Supplier Name" class="col-xs-4 control-label">Supplier Name</label>
		<div class="col-xs-4">
			<form:input name="suppliername" path="suppliername" placeholder="Supplier Name" class="form-control" />
		</div>
	</div><br><br><br>
	 <div class="form-group">
	<label for="supply" class="col-xs-4 control-label"></label>	
		<div class="col-xs-4">
	<input type="submit" value="Add Supplier" id="btn-add" class="btn btn-primary" >	
		</div>
	</div> 
        </form:form>
        <br><br><br>
        <table class="table table-striped table-bordered"  style="width: 80%">
			<thead>
				<tr>
					<th width="2%">S.No</th>
					<th width="2%">supplier ID</th>
					<th width="2%">supplier Name</th>
					<th width="2%">Supplier Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${supplierList}" var="supplier" varStatus="loopCounter">
					<tr>
						<td><c:out value="${loopCounter.count}" /></td>
						<td><c:out value="${supplier.supplierid}" /></td>
						<td><c:out value="${supplier.suppliername}" /></td>
						
						<td>
                <a class="btn btn-danger" href="editsupplier/${supplier.supplierid}"/>EDIT </a>
				<a class="btn btn-success" href="removesupplier/${supplier.supplierid}"/>DELETE</a>
							</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
        
       </body>
       </html>
    
