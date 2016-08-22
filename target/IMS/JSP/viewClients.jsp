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
		<h2 class="header">Clients</h2>
	</div>
	<div class="container">
	
	<!--
	
	Company Name: <input type="text" name="clientName" class="form-control"> <br/>
	Email: <input type="text" name="clientEmail" class="form-control"> <br/>
	Contact Name: <input type="text" name="contactName" class="form-control"> <br/>
	Phone: <input type="text" name="clientPhone" class="form-control"> <br/>
	Fax: <input type="text" name="clientFax" class="form-control"> <br/>
	Address: <input type="text" name="clientAddress" class="form-control"> <br/>
	Type: <input type="text" name="clientType" class="form-control"> <br/>
	
	-->
	
		<table class="table table-hover">
			<tr>
				<th>Name</th>
				<th>Email</th>
				<th>Contact</th>
				<th>Phone</th>
				<th>Fax</th>
				
		
				
				<th>Address</th>
				<th>Type</th>
				
				
			</tr>
			<c:forEach var="c" items="${clients}">
			<tr>
				<td><c:out value="${c.clientName}"></c:out></td>
				<td><c:out value="${c.clientEmail}"></c:out></td>
				<td><c:out value="${c.pointOfContactName}"></c:out></td>
				<td><c:out value="${c.clientPhone}"></c:out></td>
				<td><c:out value="${c.clientFax}"></c:out></td>
				
			
				
				<td><c:out value="${c.clientAddress.state.stateName}"></c:out></td>
				<td><c:out value="${c.clientType.clientType}"></c:out></td>
				
			
			</tr>
			</c:forEach>
		</table>
		
	jjj
	kkk
	</div>
</body>
</html>
