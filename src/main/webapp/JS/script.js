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
				$(body).css("overflow","hidden");
			});
			
			$('.close').click(function()
				{
					$(".cover").fadeOut();
					$(".form").fadeOut();
					$(".add").show();
					$(body).css("overflow","auto");
				});
			
			$('#submitProductForm').submit(function(){
				var data = {}
				data["productName"] = $("#productName").val();
				data["productDescription"] = $("#productDescription").val();
				data["productWeight"]=$("#productWeight").val();
				data["currentStock"]=$("#currentStock").val();
				$.ajax({
			           type: "POST",
			           contentType : "application/json",
			           url: "addProducts.do",
			       		data : JSON.stringify(data),
			       		dataType : 'json',
			       		success: function()
			           {
			        	   alert("Product named "+" data['productName'] "+"added");
			        	   // show response from the php script.
			           }
			         });
			event.preventDefault();
			});
		}
);