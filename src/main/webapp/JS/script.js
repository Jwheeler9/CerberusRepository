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
			
			$('#submitProductForm').submit(function(){
				var product = {}
				product["productName"] = $("#productName").val();
				product["productDescription"] = $("#productDescription").val();
				product["productWeight"]=$("#productWeight").val();
				product["currentStock"]=$("#currentStock").val();
				$.ajax({
					 	url: "addProducts.do",
					    type: "POST",
					    data: JSON.stringify({ 
					        // Those property names must match the property names of your PromotionDecision  view model
					        productName: product['productName'], 
					        productDescription: product['productDescription'], 
					        productWeight: product['productWeight'],
					        currentStock:product['currentStock']
					    }),
					    contentType: "application/json; charset=utf-8",
			       		success: function(data, status)
			           {
			       			
			        	   alert("Product named " + data.productName+" added");
			        	   
			        	   // show response from the php script.
			        	   
			           },
			           failure:function(data)
						{
							alert("Product failed to be added");
						}
			         });
				event.preventDefault();
			});
		}
);