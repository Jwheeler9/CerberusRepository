/**
 * 
 */
$(document).ready(function()
		{
			$('.add').click(function()
			{
				$(".add").hide();
				$(".cover").fadeIn();
				$(".form").show();
				$("body").css("overflow","hidden");
			});
			
			$('.close').click(function()
				{
					$(".cover").fadeOut();
					$(".form").fadeOut();
					$(".add").show();
					$("body").css("overflow","auto");
				});
			
			$('#addProductForm').submit(function(){
				$(".cover").fadeOut();
				$(".form").fadeOut();
				var product = {}
				product["productName"] = $("#productName").val();
				product["productDescription"] = $("#productDescription").val();
				product["productWeight"]=$("#productWeight").val();
				product["currentStock"]=$("#currentStock").val();
				product["shortName"] = $("#shortName").val();
				product["packSize"] = $("#packSize").val();
				product["reorderQuantity"]=$("#reorderQuantity").val();
				product["unitCost"]=$("#unitCost").val();
				product["retailPrice"]=$("#retailPrice").val();
				$.ajax({
					 	url: "addProducts.do",
					    type: "POST",
					    data: JSON.stringify({ 
					        // Those property names must match the property names of your PromotionDecision  view model
					        productName: product["productName"], 
					        productDescription: product["productDescription"], 
					        productWeight: product["productWeight"],
					        currentStock:product["currentStock"],
					        shortName:product["shortName"],
							packSize:product["packSize"],
						reorderQuantity:product["reorderQuantity"],
						unitCost:product["unitCost"],
						retailPrice:product["retailPrice"]
					    }),
					    contentType: "application/json; charset=utf-8",
			       		success: function(data, status)
			           {
			       			var table=$(".table").empty();
			       			table.append("<tr><th>Product Name</th>"
							+"<th>Product Description</th>"
							+"<th>Product Weight</th>"
							+"<th>Unit Cost</th>"					
							+"<th>Retail Price</th>"
							+"<th>Current Stock</th>"
							+"</tr>");
			       			$.each(data, function( index, value ) 
			       				{
			       					table.append("<tr>");
			       					table.append($("<td></td>").text(data.productName)); 
			       					table.append($("<td></td>").text(data.productDescription)); 
			       					table.append($("<td></td>").text(data.productWeight)); 
			       					table.append($("<td></td>").text(data.unitCost)); 
			       					table.append($("<td></td>").text(data.retailPrice)); 
			       					table.append($("<td></td>").text(data.currentStock)); 
			       					table.append("</tr>");
			       				});
			        	   alert("Product named " + data.productName+" added");   	   
			           },
			           error: function (xhr, ajaxOptions, thrownError)
			           {
			               alert("status: "+xhr.status+",error: "+thrownError);
			             }
			         });
				console.log("AJAX");
				event.preventDefault();
			});
		}
);