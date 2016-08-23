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
	<div class="container" style="text-align: left">
		<jsp:include page="/JSP/navigation.jsp"/> 	
		<br/><br/>
		<h2> Generate an Invoice</h2>
		<br/><br/>
		<table class="invoiceTable">
			<col width="34%">
		    <col width="33%">
		    <col width="33%">
			<thead>
				<tr>
					<th>Client</th>
					<th class="hideMe client">Type</th>
					<th class="hideMe client">Invoice</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="clientField">
					<select id="selectClient" class="btn btn-primary">
			       		<c:forEach var="c" items="${clients}">
				   			<option value="${c.clientName}"><c:out value="${c.clientName}"></c:out></option>
				   		</c:forEach> 
			        </select>
			    	</td>
		        </tr>
	        </tbody>
        </table>
        <hr>
        <table class="invoiceTable">
        	<thead>
        		<tr>
					<th class="hideMe product">Product</th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
        	</thead>
        	<tbody>
        		<tr>
					<td id="productField">
					<select id="productClient" class="btn btn-primary hideMe product">
			       		<c:forEach var="p" items="${products}">
				   			<option value="${p.productName}"><c:out value="${p.productName}"></c:out></option>
				   		</c:forEach> 
			        </select>
			    	</td>
		        </tr>
        	</tbody>
        </table>
	</div>
</body>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$(".hideMe").css("display", "none");
	
	var clientField = $(".clientField").html();
	
	$("#selectClient").change(function(){
		
		var selectedName = $("#selectClient").val();
				
		$.get("http://localhost:7001/IMS/grabType.do?clientName=" + selectedName, function(response){
				
			// Init
			var invoice = null;
			
			if(response === "Retailer"){
				invoice = "Outgoing";
			}
			else if(response === "Supplier"){
				invoice = "Incoming";
			}
			else {
				alert("Invalid client name in database.");
			}
			
			// Alter Body
			$(".clientField").replaceWith("<td class=\"clientField\">" + clientField + "</td>" + 
										  "<td>" + response + "</td>" +
									      "<td>" + invoice  + "</td>");
			
			// Show Hidden	
			$(".client").addClass("shownHead");
			$(".client").removeClass("hideMe");
				
			$(".product").addClass("shown");
			$(".product").removeClass("hideMe");
			
			$(".shownHead").css("display", "table-cell");
			$(".shown").css("display", "table-row");
			$(".hideMe").css("display", "none");
		});
	});
});
</script>
</html>
