<%@ page language="java" import="com.modal.Product" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>product</title>
</head>
<jsp:include page="header.jsp" />

<form:form commandName="product" action="${pageContext.request.contextPath}/InsertProduct"  enctype="multipart/form-data">

    <%-- <table align="center"class="table table-striped table-bordered" cellspacing="2" style="width:50%">
			<tr>
				<td  align="center" colspan="2">Product Detail</td>
			</tr>	
			<tr>
				<td>Product Name</td>
				<td><form:input path="name" class="col-xs-6"/></td>
			</tr>
	
			<tr>
				<td>Product Desc</td>
				<td><form:textarea path="description" class="col-xs-6"/></td>
			</tr>
	
	
			<tr>
				<td>Product Stock</td>
				<td><form:input path="instock" class="col-xs-6"/></td>
			</tr>
	          <tr>
				<td>Product Quantity</td>
				<td><form:input path="quantity" class="col-xs-6"/></td>
			</tr>
	
			<tr>
				<td>Product Price</td>
				<td><form:input path="price" class="col-xs-6"/></td>
			</tr>
	        <tr>
				<td>Category</td>
				<td >
					<form:select path="category" class="col-xs-6">
					<form:option value="0" label="---Select---" class="col-xs-6"/>
					<form:options items="${categoryList}" class="col-xs-6"/>
					</form:select>
				</td>
			</tr>
			<tr>
				<td>Supplier</td>
				<td >
					<form:select path="supplier" class="col-xs-6">
					<form:option value="0" label="---Select---" class="col-xs-6"/>
					<form:options items="${supplierList}" class="col-xs-6"/>
					</form:select>
				</td>
			</tr>
	       <tr>
				<td>Product Image</td>
				<td><input type="file" name="file" /></td>
			</tr> 
			<tr>
				<td colspan="2">
					<center><input type="submit" value="Insert" class="btn btn-primary"/></center>
				</td>
			</tr>
		</table>
		</form:form> --%>
       
     <div class="form-group">
		<label for="category Name" class="col-xs-4 control-label">Product Name</label>
		<div class="col-xs-4">
			<form:input name="id" path="name" placeholder="Product Name" class="form-control" />
		</div>
	</div>

	<div class="form-group">
		<label for="code" class="col-xs-4 control-label">Product Description</label>
		<div class="col-xs-4">
			<form:input name="description" id="description" path="description" placeholder="Product Description" maxlength="15" class="form-control" />
		</div>
	</div>



	<div class="form-group">
		<label for="Product Price" class="col-xs-4 control-label">Product Price</label>
		<div class="col-xs-4">
			<form:input name="id" path="price" placeholder="Product Price" class="form-control" />
		</div>
	</div>
	
	<div class="form-group">
		<label for="Product Quantity" class="col-xs-4 control-label">Product Quantity</label>
		<div class="col-xs-4">
			<form:input name="id" path="quantity" placeholder="Product Quantity" class="form-control" />
		</div>
	</div>
	

<%-- 
	<div class="form-group">
		<label for="Product Price" class="col-xs-4 control-label">Product instock</label>
		<div class="col-xs-4">
			<form:input name="id" path="instock" placeholder="Product instock" class="form-control" />
		</div>
	</div>
 --%>
	<!-- 	List of Category	 -->

	
	<div class="form-group">
		<label for="Product Category" class="col-xs-4 control-label">Product Category</label>
		<div class="col-xs-4">		
	<form:select class="form-control" path="categoryid" required="true">
	<c:forEach items="${categoryList}" var="category">
	<form:option class="form-control" value="${category.categoryid}">${category.categoryname}	     </form:option>
	</c:forEach>
	</form:select>
		</div>
	</div>
	
	<!--  List of Supplier  -->
	
		<div class="form-group">
		<label for="Product Supplier" class="col-xs-4 control-label">Product Supplier</label>
		<div class="col-xs-4">		
	<form:select class="form-control" path="supplierid" required="true">
	<c:forEach items="${supplierList}" var="supplier">
	<form:option class="form-control" value="${supplier.supplierid}">${supplier.suppliername}	     </form:option>
	</c:forEach>
	</form:select>
		</div>
	</div>
	
	
	
	<div class="form-group">
		<label for="Product Image" class="col-xs-4 control-label">Product Image</label>
		<div class="col-xs-4">
		<input type="file" name="file" class="form-control" />
		</div>
	</div>
	


	<div class="form-group">  
	<label for="code" class="col-xs-4 control-label"></label>
		
		<div class="col-xs-4">
		
			
		<c:if test="${product.productid==0}">
		<input type="submit" value="Add Product" id="btn-add" class="btn btn-primary" >
		
		</c:if> <c:if test="${product.productid!=0}">
		
	   <input type="submit" value="Update Product" id="btn-update" class="btn btn-primary" >
	  </c:if>
		
		
		</div>
	</div>
</form:form>
<table class="table table-striped table-bordered"  style="width: 80%">
			<thead>
				<tr>
					<th width="2%">S.No</th>
					<th width="2%">product ID</th>
					<th width="2%">product Name</th>
					<th width="2%">product Description</th>
					<th width="2%">Product Price</th>
					<th width="2%">Product InStock</th>
					<th width="2%">Product Category</th>
					<th width="2%">Product Supplier</th>
					<th width="2%">Product Image</th>
					<th width="2%">Product Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${productList}" var="product" varStatus="loopCounter">
					<tr>
						<td><c:out value="${loopCounter.count}" /></td>
						<td><c:out value="${product.productid}" /></td>
						<td><c:out value="${product.name}" /></td>
						<td><c:out value="${product.description}" /></td>
						<td><c:out value="${product.price}" /></td>
						<td><c:out value="${product.instock}" /></td>
						<td><c:out value="${product.categoryid}" /></td>
						<td><c:out value="${product.supplierid}" /></td>
						<td><c:out value="${product.image}" /></td>
						
						<td><nobr>
<a class="btn btn-primary" href="editproduct/${product.productid}"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Edit</a>

<a class="btn btn-primary"  href="removeproduct/${product.productid}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Delete
								</a>

							</nobr></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
</body>
</html>