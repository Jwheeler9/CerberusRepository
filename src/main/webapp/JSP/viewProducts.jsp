<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Home</title>
	<!--CSS-->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/CSS/bootstrap.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/CSS/stylingstockReport.do.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/CSS/style.css" type="text/css">
    <!--JavaScript--> 
   <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="JS/script.js"></script>
</head>
<body>
	<c:out value="${NewProduct.productName} added"/>
	<div class="container">
		<jsp:include page="/JSP/navigation.jsp"/>	
		<h2 class="header">View Products</h2>
		<button value="addProduct" class= "add" id="addProduct" name="addProduct">Add Product</button><br>
		<c:choose>
			
				<c:when  test="${not empty gotData}">
				<c:choose>
					<c:when test="${not empty products}">
						<c:remove var="loading"/>
						<table class="table">
							<tr>
								<th>Product Name</th>
								<th>Product Description</th>
								<th>Product Weight</th>
								<th>Unit Cost</th>					
								<th>Retail Price</th>
								<th>Current Stock</th>
							</tr>
						<c:forEach var="product" items="${products}">
							<tr>
								<td><c:out value="${product.productName}"/></td>
								<td><c:out value="${product.productDescription}"/></td>
								<td><c:out value="${product.productWeight}"/></td>
								<td><fmt:formatNumber value="${product.unitCost}" type="currency"/></td>
								<td><fmt:formatNumber value="${product.retailPrice}" type="currency"/></td>
								<td><c:out value="${product.currentStock}"/></td>
							</tr>
						</c:forEach>
					</table>
				</c:when>
				<c:otherwise>
					<c:out value="No products"/>
				</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<c:out value="Loading data please standby.."/>
			</c:otherwise>
		</c:choose>
	
	</div>
	<div class="cover">
		
	</div>
	<form class="form" id="submitProductForm" name="submitProductForm">
		<p class="close">X</p><h2>Add Product</h2>
		<label for="productName">Product Name</label>
		<input type="text" name="productName" id="productName"/>
		<label for="">Product Description</label>
		<input type="text" name="productDescription" id="productDescription"/>
		<label for="">Product Weight</label>
		<input type="text" name="productWeight" id="productWeight"/>
		<label for="">Current Stock</label>
		<input type="text" name="currentStock" id="currentStock"/><br>
		<button id="submitProduct" name="submitProduct">Add Product</button>
	</form>
</body>
</html>
