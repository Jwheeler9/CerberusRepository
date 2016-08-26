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
<body id="ajaxBod">
	<div class="container">
		<jsp:include page="/JSP/navigation.jsp"/>
	</div>
	<br/><br/>
	<input type="button" id="addClient" value="New" class="btn btn-primary"/>
	<input type="button" id="cancelAdd" value="Cancel" class="btn btn-primary hideMe"/>
	<div id="dataTable" class="container clear-top" >
		<table id="clientTable" class="table table-hover">
			<col width="5%">
	  		<col width="12%">
	  		<col width="13%">
	  		<col width="16%">
	  		<col width="13%">
	  		<col width="15%">
	  		<col width="13%">
	  		<col width="13%">
			<thead>
				<tr>
					<th></th>
					<th>Name</th>
					<th>Email</th>
					<th>Contact</th>
					<th>Phone</th>
					<th>Fax</th>
					<th>State</th>
					<th>Type</th>
				</tr>
			</thead>
			<tfoot>
				<tr class="newClientSlot hideMe">
					<td class="noDetails"></td>
					<td><input type="text" id="icName"/></td> 
					<td><input type="text" id="icEmail"/></td> 
					<td><input type="text" id="icContact"/></td> 
					<td><input type="text" id="icPhone"/></td> 
					<td><input type="text" id="icFax"/></td>
					<td id="stateBlock">
					<select id="icState" class="btn btn-primary">
						<option disabled selected value=""> -- Select a State -- </option>
				       	<c:forEach var="s" items="${states}">
				   			<option value="${s.stateName}"><c:out value="${s.stateName}"></c:out></option>
				   		</c:forEach> 
				    </select>
				    </td> 
				    <td id="typeBlock">
					<select id="icType" class="btn btn-primary">
						<option disabled selected value=""> -- Select a Type -- </option>
				       	<c:forEach var="t" items="${types}">
				   			<option value="${t.clientType}"><c:out value="${t.clientType}"></c:out></option>
				   		</c:forEach> 
				    </select>
				    </td>
				</tr>
				<tr class="newClientSlot hideMe">
					<th class="noDetails"></th>
					<th>Address</th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
				<tr class="newClientSlot hideMe">
					<th class="noDetails"></th>
					<th>Street 1</th>
					<th>Street 2</th>
					<th>City</th>
					<th>Zip</th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
				<tr class="newClientSlot hideMe">
					<td class="noDetails"></td>
					<td><input type="text" id="iaStreet1"/></td> 
					<td><input type="text" id="iaStreet2"/></td> 
					<td><input type="text" id="iaCity"/></td> 
					<td><input type="text" id="iaZip"/></td> 
					<td></td>
					<td></td>
					<td><input type="button" id="saveClient" value="Save" class="btn btn-primary"/></td>
				</tr>
			</tfoot>
		</table>
	</div>
	
	<!-- Edit Modal -->
	<div id="editModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h3 class="modal-title">Fix Client</h3>
	      </div>
	      <div class="modal-body">
	        <p>We can rebuild them. We have the technology. We can make them better than they were. Better, stronger, faster.</p>
	        <hr>
	        <h4 class="header">Client</h4>
	        <input type="text" id="editId" class="form-control" placeholder="Id" disabled/> 
	        <input type="text" id="editName" class="form-control" placeholder="Name"/> 
			<input type="text" id="editEmail" class="form-control" placeholder="Email"/> 
			<input type="text" id="editContact" class="form-control" placeholder="Contact"/> 
			<input type="text" id="editPhone" class="form-control" placeholder="Phone"/>
			<input type="text" id="editFax" class="form-control" placeholder="Fax"/>
			<select id="editType" class="btn btn-primary form-control">
				<option disabled selected value=""> -- Select a Type -- </option>
				<c:forEach var="t" items="${types}">
					<option value="${t.clientType}"><c:out value="${t.clientType}"></c:out></option>
				</c:forEach> 
		    </select>
			<hr>
			<h4 class="header">Address</h4>
			<input type="text" id="editStreet1" class="form-control" placeholder="Street 1" /> 
			<input type="text" id="editStreet2" class="form-control" placeholder="Street 2" /> 
			<input type="text" id="editCity" class="form-control" placeholder="City" />
		  	<select id="editState" class="btn btn-primary form-control">
				<option disabled selected value=""> -- Select a State -- </option>
		     	<c:forEach var="s" items="${states}">
		   	  		<option value="${s.stateName}"><c:out value="${s.stateName}"></c:out></option>
		   	  	</c:forEach> 
	      	</select>
	      	<input type="text" id="editZip" class="form-control" placeholder="Zip"/>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-default" data-dismiss="modal" id="confirmEdit">Commit!</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal" id="denyEdit">Rollback.</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Delete Modal -->
	<div id="deleteModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Confirm Deletion</h4>
	      </div>
	      <div class="modal-body">
	        <p>This client is at your mercy and your action cannot be undone.</p>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-default" data-dismiss="modal" id="confirmDel">Destroy them!</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal" id="denyDel">Spare them.</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.12/datatables.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	//-------------------------------------------------------------------------------------
	// Document Init

	var states = $("#stateBlock").html();
	var types = $("#typeBlock").html();
	var id;
	
	//-------------------------------------------------------------------------------------
	// Building the jQuery DataTable
	
	function format (client) {
	    
	    return  "<table class=\"detailsTab\" style=\"width:100%\">" +
	    			"<col width=\"4.25%\">"  +
			  		"<col width=\"12.75%\">" +
			  		"<col width=\"13%\">" +
			  		"<col width=\"16%\">" +
			  		"<col width=\"13%\">" +
			  		"<col width=\"15%\">" +
			  		"<col width=\"13%\">" +
			  		"<col width=\"13%\">" +
			        "<tr>" +
			        	"<td>" + client.imsClientId + "</td>" +
			            "<td colspan=5>" + client.clientAddress.streetAddress1 + "&nbsp&nbsp&nbsp&nbsp" +
			            				   client.clientAddress.streetAddress2 + "&nbsp&nbsp&nbsp&nbsp" +
			            				   client.clientAddress.addressCity + ", " + client.clientAddress.state.stateAbbrv + "&nbsp&nbsp&nbsp&nbsp" +
			            				   client.clientAddress.addressZip + "</td>" +
			           	"<td><input type=\"button\" id='editClient" + client.imsClientId + "' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#editModal\" value=\"Edit\"/></td>" + 
						"<td><input type=\"button\" id='deleteClient" + client.imsClientId  + "' class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#deleteModal\" value=\"Delete\"/></td>"
			        "</tr>" +
		        "</table>";
	}
	
	var table = $("#clientTable").DataTable({
    	
    	"ajax": {
    		"url": "http://localhost:7001/IMS/grabClients.do", 
    		"dataSrc": ""
    	},
    	"dom": 'frtp',
    	"lengthMenu": [ 6 ],
    	"pagingType": "numbers",
    	"columns": [
            {
                "className":      'details-control',
                "orderable":      false,
                "data":           "imsClientId",
                "defaultContent": ''
            },
            { "data": "clientName" },
            { "data": "clientEmail" },
            { "data": "pointOfContactName" },
            { "data": "clientPhone" },
            { "data": "clientFax" },
            { "data": "clientAddress.state.stateName" },
            { "data": "clientType.clientType" }
        ],
 	});
 	
 	$(".details-control").css("color", "rgba(0, 0, 0, 0)");
 	$(".noDetails").removeClass("details-control");
 
 	//-------------------------------------------------------------------------------------
 	// Show Extra Details
 		 	
 	$("#clientTable tbody").on("click", "td.details-control", function () {
 		 
 		var element = $(this); 
 			 
 		if(id !== $(element).text()){
 		
	 		table.row($(".shown")).child.hide();
	 		$(".shown").removeClass("shown");
 		}
 		  
        var tr = $(this);
        var row = table.row(tr);
        
        if ( row.child.isShown() ) {
            
            tr.removeClass("shown");
            row.child.hide();
        }
        else {
           	
            tr.addClass("shown");
            row.child( format(row.data())).show();
            id = $(tr).text();
        }
        
        $(".shown").attr("style", "background-size: 26px 26px !important");
        $(".shown").css("color", "rgba(0, 0, 0, 0)");
         
        //---------------------------------------------------------------------------------
		// Enable Editing && Prepopulate Modal
			
		$("#clientTable").on("click", "#editClient" + id, function(){
	 		
	 		$.get("http://localhost:7001/IMS/grabClient.do?q=" + id, function(data){
	 		
		 		// Client
		 		$("#editId").val(id);
		 		$("#editName").val(data.clientName);
				$("#editEmail").val(data.clientEmail);
				$("#editContact").val(data.pointOfContactName);
				$("#editPhone").val(data.clientPhone);
				$("#editFax").val(data.clientFax);
				$("#editType").val(data.clientType.clientType);
								
				// Address
				$("#editStreet1").val(data.clientAddress.streetAddress1);
				$("#editStreet2").val(data.clientAddress.streetAddress2);
				$("#editCity").val(data.clientAddress.addressCity);
				$("#editState").val(data.clientAddress.state.stateName);
				$("#editZip").val(data.clientAddress.addressZip);
	 		});
	 	
 			//---------------------------------------------------------------------------------
			// Edit Client -- Update Database
 	
			$("#confirmEdit").click(function(){
			
			// Client Line
			var editClientName = $("#editName").val();
			var editClientEmail = $("#editEmail").val();
			var editClientContact = $("#editContact").val();
			var editClientPhone = $("#editPhone").val();
			var editClientFax = $("#editFax").val();
			var editClientState = $("#editState option:selected").text();
			var editClientType = $("#editType option:selected").text();
						
			// Address Line
			var editAddressSt1 = $("#editStreet1").val();
			var editAddressSt2 = $("#editStreet2").val();
			var editAddressCity = $("#editCity").val();
			var editAddressZip = $("#editZip").val();
	
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
					contentType: "application/json",
					success: function(){
						
						alert("Client successfully edited! Well done.");
						location.reload();
					}
				});
			});
		});
		
		//---------------------------------------------------------------------------------
		// Trigger Modal for Delete	
			
		$("#clientTable").on("click", "#deleteClient" + id, function(){
			
			$("#confirmDel").click(function(){
				
				$.get("http://localhost:7001/IMS/deleteClient.do?q=" + id, function(){
					
					alert("The act is done... ");
					location.reload();
				});
			});
		});
    });
    
    //-------------------------------------------------------------------------------------
	// Show Add Client Fields
	
    $("#addClient").on("click", function () {
        
		$("#addClient").addClass("hideMe");
		$("#cancelAdd").removeClass("hideMe");
		$(".newClientSlot").removeClass("hideMe");
	});	
	
	//-------------------------------------------------------------------------------------
	// Hide Added Client Fields
	
	$("#cancelAdd").on("click", function(){

		// Reset Input
		$("#icName").val("");
		$("#icEmail").val("");
		$("#icContact").val("");
		$("#icPhone").val("");
		$("#icFax").val("");
		$("#icState").val("");
		$("#icType").val("");
		
		// Update View
		$("#addClient").removeClass("hideMe");
		$("#cancelAdd").addClass("hideMe");
		$(".newClientSlot").addClass("hideMe");
	});
	
	//-------------------------------------------------------------------------------------
	// Add Client -- Update Database
	
	$("#saveClient").on("click", function(){
	
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
		
		// Reset Input
		$("#icName").val("");
		$("#icEmail").val("");
		$("#icContact").val("");
		$("#icPhone").val("");
		$("#icFax").val("");
		$("#icState").val("");
		$("#icType").val("");
		
		// Update View
		$("#addClient").removeClass("hideMe");
		$("#cancelAdd").addClass("hideMe");
		$(".newClientSlot").addClass("hideMe");
		
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
			contentType: "application/json",
			success: function(){
					
				alert("New client added. Welcome aboard!");
				location.reload();
			}
		});
	});
});
</script>
</html>
