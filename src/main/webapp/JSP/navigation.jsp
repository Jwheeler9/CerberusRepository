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
	<ul class="nav nav-tabs nav-justified">
		<li><a href="viewInvoice.do"><strong>Generate Invoice</strong></a></li>
      	<li><a href="viewClients.do">Update Clients</a></li>
      	<li><a href="viewProducts.do">Update Products</a></li>
      	<li><a href="viewReports.do">Generate Reports</a></li>
    </ul>
	</div>
</body>
</html>
