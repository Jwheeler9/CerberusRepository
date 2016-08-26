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
			<col width="20%">
		    <col width="20%">
		    <col width="20%">
		    <col width="20%">
		    <col width="20%">
			<thead>
				<tr>
					<th>Client</th>
					<th class="hideMe client">Type</th>
					<th class="hideMe client">Invoice</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="clientField">
					<select id="selectClient" class="btn btn-primary">
						<option disabled selected value=""> -- Select a Client -- </option>
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
        	<col width="20%">
		    <col width="20%">
		    <col width="20%">
		    <col width="20%">
		    <col width="20%">
        	<thead>
        		<tr>
					<th class="hideMe product">Product</th>
					<th id="pCost" class="hideMe">Price</th>
					<th id="pStock" class="hideMe">Quantity</th>
					<th id="pTotal" class="hideMe">Total</th>
					<th></th>
				</tr>
        	</thead>
        	<tbody id="productDelegate">
        		<tr id="productEvent">
					<td id="productField">
					<select id="selectProduct" class="btn btn-primary hideMe product">
						<option disabled selected value=""> -- Select a Product -- </option>
			       		<c:forEach var="p" items="${products}">
				   			<option class="${p.productName}" value="${p.productName}"><c:out value="${p.productName}"></c:out></option>
				   		</c:forEach>
			        </select>
			    	</td>
		        </tr>
		        <tr id="lineSlot"><td colspan=5><hr></td></tr>
		        <tr class="hideMe addNew">
		        	<td colspan=5>
		        		<img src="${pageContext.servletContext.contextPath}/Images/plus.png" id="addLine" width="34px" height="34px" style="cursor: pointer"/>
		        	</td>
		        </tr>
        	</tbody>
        </table>
        <br/><br/>
        <h3> Send Invoice</h3>
        <hr>
        <span style="text-align: center">
	        <input type="text" id="grandSub" class="form-control" disabled/>
	        <input type="text" id="taxes" class="form-control" disabled/>
	        <input type="text" id="grandTotal" class="form-control" disabled/>
	        <input type="button" id="sendInvoice" value="Send" class="btn btn-primary form-control" disabled/>
        </span>
        <br/><br/><br/><br/>
	</div>
</body>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$(".hideMe").css("display", "none");
	
	var clientField = $(".clientField").html();
	var productField = $("#productField").html();
	var invoice = null;
	var taxes = 0;
	var grandSubtotal = 0;
	var finalTotal = 0;
	
	// -------------------------------------------------
	// Start Client Ajax
		
	$("#selectClient").change(function(){
		
		var selectedName = $("#selectClient").val();
		
		$.get("http://localhost:7001/IMS/grabType.do?clientName=" + selectedName, function(response){
				
			if(response === "Retailer"){
				invoice = "Outgoing";
			}
			else if(response === "Supplier"){
				invoice = "Incoming";
			}
			else {
				alert("Invalid client name in database.");
			}
			
			// Alter Client Body
			$(".clientField").replaceWith("<td class=\"clientField\">" + clientField + "</td>" + 
										  "<td>" + response + "</td>" +
									      "<td>" + invoice  + "</td>" + 
									      "<td></td><td></td>");
									      
			$("#selectClient").val(selectedName);
			document.getElementById("selectClient").disabled=true;
			
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
	
	var selectedProduct = "";
	
	// -------------------------------------------------
	// Start Product Ajax	
	
	$("#productDelegate").on("change", "#selectProduct", function(){
	
		selectedProduct = $("#selectProduct").val();
		
		$.get("http://localhost:7001/IMS/grabProduct.do?productName=" + selectedProduct, function(response){
			
			var stockHTML;
			
			if(invoice === "Outgoing"){
			
				stockHTML = "<td class=\"stockField\"><select id=\"selectStock\" class=\"btn btn-primary\">";
				
				for(var i = 0; i <= response.currentStock; i++){
					
					stockHTML += "<option value=" + i + ">" + i + "</option>";
				} 
				
				stockHTML += "</select></td>";
			}
			else if (invoice === "Incoming"){
				
				stockHTML = "<td class=\"stockField\"><input type=\"number\" id=\"selectStock\" value=0>";
			}
			
			$("#productField").removeAttr("id");
			
			// Alter Product Body
			$("#productEvent").html( "<td>" + productField + "</td>" + 
								     "<td> $" + response.retailPrice + "</td>" +
							         stockHTML + 
							         "<td id=\"subTotal\"> $" + response.retailPrice + "</td>" + 
							         "<td></td>");
							         				         						        
			$("#selectProduct").val(selectedProduct);
			document.getElementById("selectProduct").disabled=true;
			
			$("#productEvent").removeAttr("id");
			$("#selectProduct").removeAttr("id");
			
			// Show Hidden	
			$("#pCost").addClass("shownHead");
			$("#pStock").addClass("shownHead");
			$("#pTotal").addClass("shownHead");
			$(".product").addClass("shown");
			
			$("#pCost").removeClass("hideMe");
			$("#pStock").removeClass("hideMe");
			$("#pTotal").removeClass("hideMe");
			$(".product").removeClass("hideMe");
					
			$(".shownHead").css("display", "table-cell");
			$(".shown").css("display", "table-row");
			$(".hideMe").css("display", "none");
			
			
			$("#selectStock").change(function(){
				
				var subtotal = response.retailPrice * $("#selectStock").val();
				grandSubtotal += subtotal;
				taxes += grandSubtotal * 0.0825;
				finalTotal += grandSubtotal + taxes;
				
				$("#subTotal").text("$" + (subtotal).toFixed(2));
				$("#grandSub").val("Subtotal: $" + (grandSubtotal).toFixed(2));
				$("#taxes").val("Taxes: $" + (taxes).toFixed(2));
				$("#grandTotal").val("Total: $" + (finalTotal).toFixed(2));
				
				document.getElementById("sendInvoice").disabled=false;
				document.getElementById("selectStock").disabled=true;
				$("#selectStock").removeAttr("id");
				
				$(".addNew").addClass("shown");
				$(".addNew").removeClass("hideMe");
				$(".shown").css("display", "table-row");
			});
			
			// -------------------------------------------------
			// Add a Line
			
			$("#addLine").click(function(){
				
				$("#lineSlot").before("<tr><td colspan=4><hr></td></tr>" + 
									  "<tr id='productEvent'><td id='productField'>" + productField + "</td></tr>");
				
				$(".product").addClass("shown");
				$(".product").removeClass("hideMe");
				
				$(".shown").css("display", "table-row");
				$(".hideMe").css("display", "none");
			});
		});
	});
});
</script>
</html>
