<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:setLocale value="${sessionScope.local}" />
<fmt:setBundle basename="local" var="loc" />

<fmt:message bundle="${loc}" key="command.name.view" var="view_command" />
<fmt:message bundle="${loc}" key="command.name.edit" var="edit_command" />
<fmt:message bundle="${loc}" key="command.name.delete"
	var="delete_command" />
<fmt:message bundle="${loc}" key="label.name.userid" var="userid" />
<fmt:message bundle="${loc}" key="label.name.username" var="username" />
<fmt:message bundle="${loc}" key="label.name.usersurname"
	var="usersurname" />
<fmt:message bundle="${loc}" key="label.name.userlogin" var="userlogin" />
<fmt:message bundle="${loc}" key="label.name.email" var="usermail" />
<fmt:message bundle="${loc}" key="label.name.userstatus"
	var="userstatus" />

<div class="content">
	<table>
		<thead>
			<tr>
				<th><c:out value="${username}" /></th>
				<th><c:out value="${usersurname}" /></th>
				<th><c:out value="${userlogin}" /></th>
				<th><c:out value="${usermail}" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${requestScope.listOfUsers}">
				<tr>
					<td>${user.name}</td>
					<td>${user.surname}</td>
					<td>${user.login}</td>
					<td>${user.email}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">
		<c:forEach var="pagination" items="${requestScope.numberOfUsersPages}">
			<a href="Controller?command=show_users_page&page=${pagination}">${pagination}</a>
		</c:forEach>
	</div>

</div>
<style>
table {
	margin: 5px;
	width: 100%;
	border-collapse: collapse;
	width: 100%;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

tr:hover {
	background-color: #f5f5f5;
}

th {
	background-color: #eceef7;
	color: #333;
}
</style>
