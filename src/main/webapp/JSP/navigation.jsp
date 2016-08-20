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
		<li id="nav0"><a href="index.jsp">Home</a></li>
		<li id="nav1"><a href="viewInvoice.do">Invoices</a></li>
      	<li id="nav2"><a href="viewClients.do">Clients</a></li>
      	<li id="nav3"><a href="viewProducts.do">Products</a></li>
      	<li id="nav4"><a href="viewReports.do">Reports</a></li>
    </ul>
	</div>
</body>
</html>
