<%@ page language="java" contentType="text/html" import="com.modal.Supplier"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    </head>
    <jsp:include page="header.jsp"></jsp:include>
    <body>
        <h3>Welcome, Enter The Category Details</h3>
        <form:form method="POST" action="${pageContext.request.contextPath}/saveCategory"  modelAttribute="category">
     <%-- <div class="form-group">
		<label for="Category ID" class="col-xs-4 control-label">Supplier Id</label>
		<div class="col-xs-4">
			<form:input name="categoryid" path="categoryid" placeholder="Category ID" class="form-control" />
		</div>
	</div> --%>
	<br><br><br>
	<div class="form-group">
		<label for="Category Name" class="col-xs-4 control-label">Category Name</label>
		<div class="col-xs-4">
			<form:input name="categoryname" path="categoryname" placeholder="Category Name" class="form-control" />
		</div>
	</div><br><br><br>
	<div class="form-group">
	<label for="categ" class="col-xs-4 control-label"></label>	
		<div class="col-xs-4">
	<input type="submit" value="Add Category" id="btn-add" class="btn btn-primary">
		</div>
	</div>
        </form:form><br><br><br>
        <table class="table table-striped table-bordered" style="width:100%">
		<thead>
			<tr>
				<th width="2%">S.No</th>
					<th width="2%">Category ID</th>
					<th width="2%">Category Name</th>
					<th width="2%">Category Action</th>
			</tr>
			</thead>
			<tbody>
		<c:forEach items="${categoryList}" var="category" varStatus="loopCounter">
		<tr>
		        <td><c:out value="${loopCounter.count}"/></td>
				<td><c:out value="${category.categoryid}"/></td>
				<td><c:out value="${category.categoryname}"/></td>
				<td>
						<a class="btn btn-danger" href="removecategory/${category.categoryid}"/>DELETE</a>
						<a class="btn btn-success" href="editcategory/${category.categoryid}"/>EDIT</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
		</table><br>
       </body>
       </html>
    
