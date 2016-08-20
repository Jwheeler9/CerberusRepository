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
	<c:choose>
		<c:when test="${empty gotData}">
			<c:redirect url="pullData.do"/>
		</c:when>
		<c:when test="${gotData eq false}">
			<c:redirect url="pullData.do"/>
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>

	<div class="container">
	<jsp:include page="/JSP/navigation.jsp"/> 			
	<h3 class="header"> °º¤ø,¸¸,ø¤º°`°º¤ø,¸,ø¤°º¤ø,¸ <strong>Welcome Back, Team Cerberus </strong> °º¤ø,¸¸,ø¤º°`°º¤ø,¸,ø¤°º¤ø,¸ </h3>
	</div>
</body>
</html>
