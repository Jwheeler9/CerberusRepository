<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<!--CSS-->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/CSS/bootstrap.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/CSS/style.css" type="text/css">
    <!----> 
</head>
<body>
	<div class="container">
	<ul class="nav nav-tabs nav-justified">
		<c:if test="${empty isReports}">
			<li id="nav0"><a href="home.do">Home</a></li>
			<li id="nav1"><a href="viewInvoice.do">Invoices</a></li>
	      	<li id="nav2"><a href="viewClients.do">Clients</a></li>
	      	<li id="nav3"><a href="viewProducts.do">Products</a></li>
	      	<li id="nav4"><a href="viewReports.do">Reports</a></li>
		</c:if>
		<c:if test="${isReports eq false}">
			<li id="nav0"><a href="home.do">Home</a></li>
			<li id="nav1"><a href="viewInvoice.do">Invoices</a></li>
	      	<li id="nav2"><a href="viewClients.do">Clients</a></li>
	      	<li id="nav3"><a href="viewProducts.do">Products</a></li>
	      	<li id="nav4"><a href="viewReports.do">Reports</a></li>
      	</c:if>
      	<c:if test="${isReports eq true}">
			<li id="nav0"><a href="home.do">Home</a></li>
			<li id="nav1"><a href="historyReport.do">Invoice History</a></li>
	      	<li id="nav2"><a href="profitReport.do">Profit Report</a></li>
	      	<li id="nav3"><a href="stockReport.do">Stock Report</a></li>
		</c:if>
    </ul>
	</div>
</body>
</html>
