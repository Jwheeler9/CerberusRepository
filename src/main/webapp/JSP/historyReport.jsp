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
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/CSS/styling.css" type="text/css">
    <!----> 
</head>
<body>
	<div class="container">
		<jsp:include page="/JSP/navigation.jsp"/> 	
		<c:choose>
		<c:when test="${not empty orders}">
		<br/><br/><br/>
		<table class="table table-hover">
			<col width="20%">
  			<col width="20%">
  			<col width="20%">
  			<col width="20%">
  			<col width="20%">
  			<thead>
  			<tr>
  				<th><input type="button" id="incInvoice" value="Incoming" class="btn btn-primary"/></th>
  				<th colspan=4><input type="button" id="outInvoice" value="Outgoing" class="btn btn-primary"/></th>
  			</tr>
			<tr><td colspan="5"><hr></td></tr>
			</thead>
			<tbody>
			<c:forEach var="order" items="${orders}">
				<c:if test="${order.client.clientType.clientTypeId eq 1}">
				<tr class="incoming">
					<th>Date</th>
					<th>Client</th>
					<th>Subtotal</th>
					<th>Taxes</th>
					<th>Total</th>
				</tr> 
				<tr class="main-details incoming">
					<td><fmt:formatDate value="${order.purchaseDate}" type="date"/></td>
					<td><c:out value="${order.client.clientName}"/></td>
					<td><fmt:formatNumber value="${order.subtotal}" type="currency"/></td>
					<td><fmt:formatNumber value="${order.taxAmount}"  type="currency"/></td>
					<td><fmt:formatNumber value="${order.poTotal}" type="currency"/></td>
				</tr>
				<c:forEach var ="line" items="${order.lines}">
					<tr class="incoming"><td colspan="5"><hr></td></tr>
					<tr class="incoming"><td>Order #:     </td><td colspan="4"><c:out value="${order.orderNumber}"/></td></tr>
					<tr class="incoming"><td>Product:     </td><td colspan="4"><c:out value="${line.product.productName}"/></td></tr>
					<tr class="incoming"><td>Description: </td><td colspan="4"><c:out value="${line.product.productDescription}"/></td></tr>
					<tr class="incoming"><td>Quantity:    </td><td colspan="4"><c:out value="${line.quantityOrdered}"/></td></tr>
					<tr class="incoming"><td>Unit Price:  </td><td colspan="4"><fmt:formatNumber value="${line.unitPrice}" type="currency"/></td></tr>
					<tr class="incoming"><td colspan="5"><hr></td></tr>
				</c:forEach>
				</c:if>
				<c:if test="${order.client.clientType.clientTypeId eq 2}">
				<tr class="outgoing">
					<th>Date</th>
					<th>Client</th>
					<th>Subtotal</th>
					<th>Taxes</th>
					<th>Total</th>
				</tr> 
				<tr class="main-details outgoing">
					<td><fmt:formatDate value="${order.purchaseDate}" type="date"/></td>
					<td><c:out value="${order.client.clientName}"/></td>
					<td><fmt:formatNumber value="${order.subtotal}" type="currency"/></td>
					<td><fmt:formatNumber value="${order.taxAmount}"  type="currency"/></td>
					<td><fmt:formatNumber value="${order.poTotal}" type="currency"/></td>
				</tr>
				<c:forEach var ="line" items="${order.lines}">
					<tr class="outgoing"><td colspan="5"><hr></td></tr>
					<tr class="outgoing"><td>Order #:     </td><td colspan="4"><c:out value="${order.orderNumber}"/></td></tr>
					<tr class="outgoing"><td>Product:     </td><td colspan="4"><c:out value="${line.product.productName}"/></td></tr>
					<tr class="outgoing"><td>Description: </td><td colspan="4"><c:out value="${line.product.productDescription}"/></td></tr>
					<tr class="outgoing"><td>Quantity:    </td><td colspan="4"><c:out value="${line.quantityOrdered}"/></td></tr>
					<tr class="outgoing"><td>Unit Price:  </td><td colspan="4"><fmt:formatNumber value="${line.unitPrice}" type="currency"/></td></tr>
					<tr class="outgoing"><td colspan="5"><hr></td></tr>
				</c:forEach>
				</c:if>
			</c:forEach>
			</tbody>
		</table>
		</c:when>
		<c:otherwise>
			<br/><br/><br/>
			<i id="noResults"><c:out value="There are currently no past invoices"/></i>
		</c:otherwise>
		</c:choose>
	</div>
</body>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$(".incoming").css("display", "none");
	$(".outgoing").css("display", "none");
	
	$("#incInvoice").click(function(){
		
		$(".outgoing").css("display", "none");
		$(".incoming").css("display", "table-row");
	});
	$("#outInvoice").click(function(){
		
		$(".incoming").css("display", "none");
		$(".outgoing").css("display", "table-row");
	});
});
</script>
</html>
