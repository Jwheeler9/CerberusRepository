<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Home</title>
	<!--CSS-->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/CSS/bootstrap.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/CSS/styling1.css" type="text/css">
    <!----> 
</head>
<body>
	<div class="container">
		<jsp:include page="/JSP/navigation.jsp"/> 	
		<h2 class="header">View Reports</h2>
		<c:choose>
		<c:when test="${not empty orders}">
		<table>
		<tr>
		<th>Order Number</th>
		<th>Client</th>
		<th>Purchase Date</th>
		<th>SubTotal</th>
		<th>Tax Amount</th>
		<th>Total</th>
		<th>lines</th>
		</tr>
			<c:forEach var="order" items="${orders}"> 
				<tr>
				<td><c:out value="${order.orderNumber}"/></td>
				<td><c:out value="${order.client.clientName}"/></td>
				<td><c:out value="${order.purchaseDate}"/></td>
				<td><fmt:formatNumber value="${order.subtotal}" type="currency"/></td>
				<td><fmt:formatNumber value="${order.taxAmount}"  type="currency"/></td>
				<td><fmt:formatNumber value="${order.poTotal}" type="currency"/></td>
				<td>
					<c:forEach var ="line" items="${order.lines}">
						<b>Product Name:</b><br><c:out value="${line.product.productName}"/><br>
						<b>Product Description:</b><br><c:out value="${line.product.productDescription}"/><br>
						<b>Quantity Ordered:</b><br><c:out value="${line.quantityOrdered}"/><br>
						<b>Unit Price:</b><br><fmt:formatNumber value="${line.unitPrice}" type="currency"/>
					</c:forEach>
				</td>
				</tr>
			</c:forEach>
				</table>
		</c:when>
		<c:otherwise>
			<c:out value="No invoices"/>
		</c:otherwise>
		</c:choose>
	</div>
</body>
</html>
