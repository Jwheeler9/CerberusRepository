<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Home</title>
	<!--CSS-->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.12/datatables.min.css"/>
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/CSS/dataTable.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/CSS/bootstrap.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/CSS/styling.css" type="text/css">
    <!----> 
</head>
<body>
	<div class="container">
		<jsp:include page="/JSP/navigation.jsp"/>
	</div>
	<br/><br/>
	<div id="dataTable" class="container clear-top" >
		<table id="clientTable" class="table table-hover">
			<col width="14%">
		    <col width="17%">
		    <col width="14%">
		    <col width="14%">
		    <col width="14%">
		    <col width="14%">
		    <col width="13%">
			<thead>
				<tr>
					<th>Name</th>
					<th>Email</th>
					<th>Contact</th>
					<th>Phone</th>
					<th>Fax</th>
					<th>State</th>
					<th>Type</th>
				</tr>
			</thead>
			<tbody>
				<tr id="clientSlot" class="initSlot no-sort" style="display:none;">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td id="stateBlock">
						<select id="icState" class="btn btn-primary">
		            	<c:forEach var="s" items="${states}">
		        			<option value="${s.stateName}"><c:out value="${s.stateName}"></c:out></option>
		        		</c:forEach> 
			            </select>
		            </td>
					<td id="typeBlock">
						<select id="icType" class="btn btn-primary">
						<c:forEach var="t" items="${types}">
		        			<option value="${t.clientType}"><c:out value="${t.clientType}"></c:out></option>
		        		</c:forEach> 
			            </select>
					</td>
				</tr>
				<c:forEach var="c" items="${clients}">
				<tr id="${c.imsClientId}">
					<td id="name${c.imsClientId}"><c:out value="${c.clientName}"></c:out></td>
					<td id="email${c.imsClientId}"><c:out value="${c.clientEmail}"></c:out></td>
					<td id="contact${c.imsClientId}"><c:out value="${c.pointOfContactName}"></c:out></td>
					<td id="phone${c.imsClientId}"><c:out value="${c.clientPhone}"></c:out></td>
					<td id="fax${c.imsClientId}"><c:out value="${c.clientFax}"></c:out></td>
					<td id="state${c.imsClientId}"><c:out value="${c.clientAddress.state.stateName}"></c:out></td>
					<td id="type${c.imsClientId}"><c:out value="${c.clientType.clientType}"></c:out></td>
				</tr>
				<tr id="hideMe${c.imsClientId}" class="hideMe subfield"> 
			      	<td id="street1${c.imsClientId}"><c:out value="${c.clientAddress.streetAddress1}"></c:out></td>
			      	<td id="street2${c.imsClientId}"><c:out value="${c.clientAddress.streetAddress2}"></c:out></td>
			      	<td id="city${c.imsClientId}"><c:out value="${c.clientAddress.addressCity}"></c:out></td>
			      	<td id="zip${c.imsClientId}"><c:out value="${c.clientAddress.addressZip}"></c:out></td>
			      	<td></td>
			        <td><input type="button" id="editClient${c.imsClientId}" class="btn btn-primary" value="Edit"/></td>
			        <td><input type="button" id="deleteClient${c.imsClientId}" class="btn btn-primary" value="Delete"/></td>
		        </tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="container">
		<span id="plusField">
			<input type="button" id="newClient" class="btn btn-primary" value="+"/>
		</span>
		<span id="minusField">
			<input type="button" id="rollbackView" class="btn btn-primary" value="-"/>
		</span>
		<span id="saveSlot">
			<input type="button" id="commitClient" class="btn btn-primary" value="Save"/>
		</span>
	</div>
</body>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.12/datatables.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	//-------------------------------------------------------------------------------------
	// Document init
	
	var states = $("#stateBlock").html();
	var types = $("#typeBlock").html();
	var isAdding = false;
	var isEditing = false; 
	var id;
	
	$(".hideMe").css("display", "none");
	$("#minusField").css("display", "none");
	$("#saveSlot").css("display", "none");
	
	//-------------------------------------------------------------------------------------
	// Building the jQuery DataTable

	var t = $("#clientTable").DataTable({
    	"dom": 'frtp',
    	"lengthMenu": [ 19 ],
    	"pagingType": "numbers",
    	"ordering": false
 	});
 	
 	//-------------------------------------------------------------------------------------
 	// Select the Client that is clicked on && show address
 	
 	$('tbody tr').click(function() {
 		
 		if(isEditing === false){
 		
	 		id = $(this).attr('id');
	 		
	 		if($("#" + id).hasClass("subfield") === false){
	 			
	 			if($("#" + id).hasClass("selected") === false){ 
					 			
		 			// Disable Currently Selected && Hide Subfields
				    $(".subfield").addClass("hideMe");
				    $(".selected").removeClass("selected");
				    $(".shown").removeClass("shown");
		 			
		 			// Open Related Subfield
		 			$("#hideMe" + id).removeClass("hideMe");
		 			$("#hideMe" + id).addClass("shown");
		 			
		 			// Update View
		 			$(".hideMe").css("display", "none");
				    $(".shown").css("display", "table-row");
				    
				    // Highlight Selected Fields
				    $("#" + id).addClass("selected");
				    $("#hideMe" + id).addClass("selected");
			    }
			    else {
			    	
			    	// Hide Subfield for Reselecting Parent When Showing
				    $(".subfield").addClass("hideMe");
				    $(".selected").removeClass("selected");
				    $(".shown").removeClass("shown");
				    
				    // Update View
		 			$(".hideMe").css("display", "none");
			    }
	 		}
 		}
 	 		
 		//---------------------------------------------------------------------------------
		// Change the text in the table to text boxes so the user can edit a client
 		$("#editClient" + id).click(function(){
 			
 			if(isAdding === true){
 					
				stopAdd();
			}
 			
 			if(isEditing === false){
 			
 				isEditing = true;
 				
 				var curName = $("#name" + id).text();
 				var curEmail = $("#email" + id).text();
 				var curContact = $("#contact" + id).text();
 				var curPhone = $("#phone" + id).text();
 				var curFax = $("#fax" + id).text();
 				var curState = $("#state" + id).text();
 				var curType = $("#type" + id).text();
 				var curStreet1 = $("#street1" + id).text();
 				var curStreet2 = $("#street2" + id).text();
 				var curCity = $("#city" + id).text();
 				var curZip = $("#zip" + id).text();
 				
 				$("#" + id).css("display", "none");
 				$("#" + id).after(	"<tr  class=\"editNow selected\">" +
								  	"<td>" + curName +  "<input type=\"text\" id=\"editName\"></input></td>" +
									"<td>" + curEmail + "<input type=\"text\" id=\"editEmail\"></input></td>" + 
									"<td>" + curContact + "<input type=\"text\" id=\"editContact\"></input></td>" +
									"<td>" + curPhone + "<input type=\"text\" id=\"editPhone\"></input></td>" + 
									"<td>" + curFax + "<input type=\"text\" id=\"editFax\"></input></td>" +
									"<td>" + states + "</td>" +
									"<td>" + types + "</td>" +
									"</tr>"
				);
				
				$("#icState").val(curState);
				$("#icType").val(curType);
				
				$("#hideMe" + id).css("display", "none");
				$("#hideMe" + id).after("<tr class=\"editNow selected\">" +
										"<td>" + curStreet1 +  "<input type=\"text\" id=\"editStreet1\"></input></td>" +
										"<td>" + curStreet2 +  "<input type=\"text\" id=\"editStreet2\"></input></td>" +
										"<td>" + curCity +  "<input type=\"text\" id=\"editCity\"></input></td>" +
										"<td>" + curZip +  "<input type=\"text\" id=\"editZip\"></input></td>" +
										"<td></td>" +
										"<td><input type=\"button\" id=\"updateClient" + id + "\" class=\"btn btn-primary\" value=\"Update\"></input></td>" +
										"<td><input type=\"button\" id=\"cancelEdit" + id + "\" class=\"btn btn-primary\" value=\"Cancel\"></input></td>" +
										"</tr>"
 				);
 				
 				$("input[type=\"text\"]").css("width", "100%");
 				
 				$("#updateClient" + id).click(function(){
 		
					// Client Line
					var editClientName = $("#editName").val();
					var editClientEmail = $("#editEmail").val();
					var editClientContact = $("#editContact").val();
					var editClientPhone = $("#editPhone").val();
					var editClientFax = $("#editFax").val();
					var editClientState = $("#icState option:selected").text();
					var editClientType = $("#icType option:selected").text();
					
					// Address Line
					var editAddressSt1 = $("#editStreet1").val();
					var editAddressSt2 = $("#editStreet2").val();
					var editAddressCity = $("#editCity").val();
					var editAddressZip = $("#editZip").val();
					
					$(".addressText").html("");
					
					$("#" + id).replaceWith("<tr>" + 
												"<td>" + editClientName + "</td>" +
												"<td>" + editClientEmail + "</td>" +
												"<td>" + editClientContact + "</td>" +
												"<td>" + editClientPhone + "</td>" +
												"<td>" + editClientFax + "</td>" +
												"<td>" + editClientState + "</td>" +
												"<td>" + editClientType + "</td>" +
											"</tr>"
					);
					
					$("#hideMe" + id).replaceWith("<tr>" + 
													"<td>" + editAddressSt1 + "</td>" +
													"<td>" + editAddressSt2 + "</td>" +
													"<td>" + editCity + "</td>" +
													"<td>" + editZip + "</td>" +
													"<td></td>" +
													"<td><input type=\"button\" id=\"editClient" + id + "\" class=\"btn btn-primary\" value=\"Edit\"></input></td>" +
													"<td><input type=\"button\" id=\"deleteClient" + id + "\" class=\"btn btn-primary\" value=\"Delete\"></input></td>" +
												  "</tr>"
					);
					
					$.ajax({
						url: "http://localhost:7001/IMS/updateClient.do",
						method: "POST",
						data: JSON.stringify({ 
											   imsClientId: id,
											   clientName: editClientName, 
											   clientEmail: editClientEmail, 
											   pointOfContactName: editClientContact,
											   clientPhone: editClientPhone,
											   clientFax: editClientFax,
											   passedStateName: editClientState,
											   passedClientType: editClientType,
											   passedAddressStreet1: editAddressSt1,
											   passedAddressStreet2: editAddressSt2,
											   passedAddressCity: editAddressCity,
											   passedAddressZip: editAddressZip
											}),
						contentType: "application/json"
					});
					
					$("#" + id).css("display", "table-row");
		 			$("#hideMe" + id).css("display", "table-row");
		 			$(".editNow").remove();
		 			isEditing = false;
		 		});
		 		
		 		$("#cancelEdit" + id).click(function(){
		 			
		 			$("#" + id).css("display", "table-row");
		 			$("#hideMe" + id).css("display", "table-row");
		 			$(".editNow").remove();
		 			isEditing = false;
		 		});
 			}
 		});
 		
 		//---------------------------------------------------------------------------------
		// Display a module to confirm the deletion && on true, delete
 		$("#deleteClient" + id).click(function(){
 			
 			alert("delete client on line 172");
 		});					
    });
    
    function stopEdit(){
		 		
		$("#" + id).css("display", "table-row");
		$("#hideMe" + id).css("display", "table-row");
		$(".editNow").remove();
			
		// Hide Subfield for Reselecting Parent When Showing
	    $(".subfield").addClass("hideMe");
	    $(".selected").removeClass("selected");
	    $(".shown").removeClass("shown");
	    
	    // Update View
		$(".hideMe").css("display", "none");
		
		isEditing = false;
	}
    
    //-------------------------------------------------------------------------------------
 	// Unselect selected clients on pagination
 	
 	
 	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 	//---------------------------------------------------------> Broken <----------------------------------------------------------//
 	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 	
 	
 	$(".paginate_button").click(function(){
 		
 		alert("works?");
 		
		$(".shown").removeClass("selected");
		$(".shown").removeClass("shown");
 	});
    

	//-------------------------------------------------------------------------------------
	// Add text fields to the table so they can add a new client when the '+' is clicked
	
	$("#newClient").click(function(){
		
		if(isEditing === true){
			
			stopEdit();
		}
		
		if(isAdding === false) {
		
			isAdding = true;
			
			$("#newClient").css("display", "none");
			$("#plusField").css("display", "none");
			$("#minusField").css("display", "inline");
			$("#saveSlot").css("display", "inline");
			$("#clientSlot").replaceWith( "<tr id=\"inputSlot\">" + 
											  "<td><input type=\"text\" id=\"icName\"/></td>" + 
											  "<td><input type=\"text\" id=\"icEmail\"/></td>" + 
											  "<td><input type=\"text\" id=\"icContact\"/></td>" + 
											  "<td><input type=\"text\" id=\"icPhone\"/></td>" + 
											  "<td><input type=\"text\" id=\"icFax\"/></td>" + 
											  "<td>" + states + "</td><td>" + types + "</td>" + 
										  "</tr>" +
										  "<tr class=\"addressText\">" + 
										  	  "<th>Address</th>" + 
										  	  "<th></th>" + 
											  "<th></th>" + 
											  "<th></th>" + 
											  "<th></th>" + 
											  "<th></th>" + 
											  "<th></th>" + 
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
										  "<tr id=\"clientSlot\" class=\"noSort\"></tr>");
										  
			$("input[type=\"text\"]").css("width", "100%");						  
		}
	});
	
	//-------------------------------------------------------------------------------------
	// Remove text fields from the table when the user doesn't want to add a client when the 
	// '-' is clicked
	
	$("#rollbackView").click(function(){
		
		// stopAdd() Functionality
		
		$("#minusField").css("display", "none");
		$("#saveSlot").css("display", "none");
		
		$("#inputSlot").remove();
		$(".addressText").remove();
		
		$("#newClient").css("display", "inline");
		$("#plusField").css("display", "inline");
		$("#breaks").css("display", "inline");
		
		isAdding = false;
	});
	
	function stopAdd() {
		
		$("#minusField").css("display", "none");
		$("#saveSlot").css("display", "none");
		
		$("#inputSlot").remove();
		$(".addressText").remove();
		
		$("#newClient").css("display", "inline");
		$("#plusField").css("display", "inline");
		$("#breaks").css("display", "inline");
		
		isAdding = false;
	}
	
	//-------------------------------------------------------------------------------------
	// Save the new client && their address to the database when the 'save' is clicked
	
	$("#commitClient").click(function(){
		
		$("#newClient").css("display", "inline");
		$("#plusField").css("display", "inline");
		$("#saveSlot").css("display", "none");
		
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
		
		isAdding = false;
	});
});
</script>
</html>
