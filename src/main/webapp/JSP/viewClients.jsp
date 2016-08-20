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
			<col id="col1" width="14%">
		    <col id="col2" width="17%">
		    <col id="col3" width="14%">
		    <col id="col4" width="14%">
		    <col id="col5" width="14%">
		    <col id="col6" width="14%">
		    <col id="col7" width="13%">
			<tr>
				<th>Name</th>
				<th>Email</th>
				<th>Contact</th>
				<th>Phone</th>
				<th>Fax</th>
				<th>State</th>
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
			<tr id="clientSlot"></tr>
			<tr><td><input type="button" id="newClient" value="+"/></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
			<tr id="saveSlot"><td><input type="button" id="commitClient" value="Save"/></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
		</table>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	$("#saveSlot td").css("display", "none");
	$("#newClient").click(function(){
		
		$("#saveSlot td").css("display", "inline");
		$("#clientSlot").replaceWith( "<tr>" + 
										  "<td><input type=\"text\" name=\"icName\"/></td>" + 
										  "<td><input type=\"text\" name=\"icEmail\"/></td>" + 
										  "<td><input type=\"text\" name=\"icContact\"/></td>" + 
										  "<td><input type=\"text\" name=\"icPhone\"/></td>" + 
										  "<td><input type=\"text\" name=\"icFax\"/></td>" + 
										  "<td><input type=\"text\" name=\"icState\"/></td>" + 
										  "<td><input type=\"text\" name=\"icType\"/></td>" + 
									  "</tr>" +
									  "<tr id=\"clientSlot\"></tr>");
									  
		$("input [type='text']").css("width", "100%");
	});
	$("#commitClient").click(function(){
		
		$("#saveSlot td").css("display", "none");
		alert("Commit!");
	});
});
</script>
</html>
