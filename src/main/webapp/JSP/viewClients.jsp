<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		<h2 class="header">Clients</h2>
	</div>
	<div class="container">
		<table class="table table-hover">
			<col width="14%">
		    <col width="17%">
		    <col width="14%">
		    <col width="14%">
		    <col width="14%">
		    <col width="14%">
		    <col width="13%">
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
			<tr id="clientSlot" class="initSlot"><td></td><td></td><td></td><td></td><td></td>
			
				<td id="stateBlock"><select id="icState">
            	<c:forEach var="s" items="${states}">
        			<option value="${s.stateName}"><c:out value="${s.stateName}"></c:out></option>
        		</c:forEach> 
	            </select>
	            </td>
				<td id="typeBlock"><select id="icType">
				<c:forEach var="t" items="${types}">
        			<option value="${t.clientType}"><c:out value="${t.clientType}"></c:out></option>
        		</c:forEach> 
	            </select>
				</td>
			</tr>
			<tr>
				<td><input type="button" id="newClient" value="+"/></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr id="saveSlot">
				<td id="saveButton"><input type="button" id="commitClient" value="Save"/></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><input type="button" id="rollbackView" value="-"/></td>
			</tr>
		</table>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	var states;
	var types;

	$("#rollbackView").css("display", "none");
	$("#saveSlot td").css("display", "none");

	//-------------------------------------------------------------------------------------
	
	$(document).change(function(){
		$("input [type=\"text\"]").css("width", "100%");
	});

	//-------------------------------------------------------------------------------------
	
	var clicked = false;
	
	$("#newClient").click(function(){
		
		if(clicked === false){
			
			states = $("#stateBlock").html();
			types = $("#typeBlock").html();
		}
		
		$("#newClient").css("display", "none");
		$("#rollbackView").css("display", "inline");
		$("#saveSlot td").css("display", "inline");
		$("#clientSlot").replaceWith( "<tr id=\"inputSlot\">" + 
										  "<td><input type=\"text\" id=\"icName\"/></td>" + 
										  "<td><input type=\"text\" id=\"icEmail\"/></td>" + 
										  "<td><input type=\"text\" id=\"icContact\"/></td>" + 
										  "<td><input type=\"text\" id=\"icPhone\"/></td>" + 
										  "<td><input type=\"text\" id=\"icFax\"/></td>" + 
										  "<td>" + states + "</td><td>" + types + "</td>" + 
									  "</tr>" +
									  "<tr class=\"addressText\"><th>Address</th>" + 
									  	  "<td></td>" + 
										  "<td></td>" + 
										  "<td></td>" +
										  "<td></td>" + 
										  "<td></td>" + 
										  "<td></td>" +  
									  "</tr>" +
									  "<tr class=\"addressText\">" + 
										  "<th>Street 1</th>" + 
										  "<th>Street 2</th>" + 
										  "<th>City</th>" + 
										  "<th>Zip Code</th>" +
										  "<th></th>" +
										  "<th></th>" +
										  "<th></th>" +   
									  "</tr>" +
									  "<tr class=\"addressText\">" + 
										  "<td><input type=\"text\" id=\"iaStreet1\"/></td>" + 
										  "<td><input type=\"text\" id=\"iaStreet2\"/></td>" + 
										  "<td><input type=\"text\" id=\"iaCity\"/></td>" + 
										  "<td><input type=\"text\" id=\"iaZip\"/></td>" +
										  "<td></td>" + 
										  "<td></td>" + 
										  "<td></td>" +  
									  "</tr>" +
									  "<tr id=\"clientSlot\"></tr>");
									  
		clicked = true;
	});
	
	//-------------------------------------------------------------------------------------
	
	$("#rollbackView").click(function(){
		
		$("#rollbackView").css("display", "none");
		$("#saveSlot td").css("display", "none");
		$("#inputSlot").remove();
		$(".addressText").remove();
		
		$("#newClient").css("display", "inline");
	});
	
	//-------------------------------------------------------------------------------------
	
	$("#commitClient").click(function(){
		
		$("#newClient").css("display", "inline");
		$("#saveSlot td").css("display", "none");
		
		// Client Line
		var inputClientName = $("#icName").val();
		var inputClientEmail = $("#icEmail").val();
		var inputClientContact = $("#icContact").val();
		var inputClientPhone = $("#icPhone").val();
		var inputClientFax = $("#icFax").val();
		var inputClientState = $("#icState option:selected").text();
		var inputClientType = $("#icType option:selected").text();
		
		// Address Line
		var inputAddressSt1 = $("#iaStreet1").val();
		var inputAddressSt2 = $("#iaStreet2").val();
		var inputAddressCity = $("#iaCity").val();
		var inputAddressZip = $("#iaZip").val();
		
		$(".addressText").html("");
		
		$("#inputSlot").replaceWith("<tr>" + 
										"<td>" + inputClientName + "</td>" +
										"<td>" + inputClientEmail + "</td>" +
										"<td>" + inputClientContact + "</td>" +
										"<td>" + inputClientPhone + "</td>" +
										"<td>" + inputClientFax + "</td>" +
										"<td>" + inputClientState + "</td>" +
										"<td>" + inputClientType + "</td>" +
									"</tr>");
		
		$.ajax({
			url: "http://localhost:7001/IMS/addClient.do",
			method: "POST",
			data: JSON.stringify({ 
								   clientName: inputClientName, 
								   clientEmail: inputClientEmail, 
								   pointOfContactName: inputClientContact,
								   clientPhone: inputClientPhone,
								   clientFax: inputClientFax,
								   passedStateName: inputClientState,
								   passedClientType: inputClientType,
								   passedAddressStreet1: inputAddressSt1,
								   passedAddressStreet2: inputAddressSt2,
								   passedAddressCity: inputAddressCity,
								   passedAddressZip: inputAddressZip
								}),
			contentType: "application/json"
		});
	});
});
</script>
</html>
