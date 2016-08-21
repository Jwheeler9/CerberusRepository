<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		<h2 class="header">View Reports</h2>
		<p>HI</p>
		<table>
		<tr>
		<th>Order Number</th></tr>
		<c:choose>
		<c:when test="${not empty orders}">
			<c:forEach var="order" items="${orders}"> 
				<tr><c:out value="${order.orderNumber}"/></tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<c:out value="hello"/>
		</c:otherwise>
		</c:choose>
		</table>
		<p>HI</p>
	</div>
</body>
</html>
