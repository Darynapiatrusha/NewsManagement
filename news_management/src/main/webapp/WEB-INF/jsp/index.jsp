<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:setLocale value="${sessionScope.local}" />
<fmt:setBundle basename="local" var="loc" />
<fmt:message bundle="${loc}" key="mess.name.successs"
	var="message_success" />
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>News Management</title>
<link rel="stylesheet" href='./css/style.css'>
</head>
<body>
	<div class="header">
		<c:import url="/WEB-INF/jsp/layers/header.jsp" />
	</div>

	<c:if test="${not empty param.info_message}">
		<div class="info-message">
			<p><c:out value="${message_success}" /></p>
		</div>
	</c:if>
	<div class="main-container">
		<c:import url="/WEB-INF/jsp/layers/menu.jsp" />
		<c:import url="/WEB-INF/jsp/layers/content.jsp" />
	</div>
</body>
</html>