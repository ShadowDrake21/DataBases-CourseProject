<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Opening Usage page</title>
</head>
<body>
	<jsp:useBean id="OpeningUsageListBean" class="databean.OpeningUsageListDatabean" />
	<h1>Opening Usage page</h1>
	<form method="post" action="openingusage">
		<table style="width: 100%" border="1">
			<tr>
				<td>Opening Usage id</td>
				<td>Opening id</td>
				<td>Player id</td>
				<td>Points</td>
				<td>Action</td>
			</tr>
			<c:forEach var="openingUsage" items="${OpeningUsageListBean.openingUsageList}">
				<tr>
					<td><c:out value="${openingUsage.id}" /></td>
					<td><c:out value="${openingUsage.idOpening}" /></td>
					<td><c:out value="${openingUsage.idPlayer}" /></td>
					<td><c:out value="${openingUsage.points}" /></td>		
					<td><c:url var="deleteUrl" value="/deleteopenusage.jsp">
							<c:param name="id_opening_usage" value="${openingUsage.id}" />
							<c:param name="id_opening" value="${openingUsage.idOpening}" />
							<c:param name="id_player" value="${openingUsage.idPlayer}" />
							<c:param name="usage_points" value="${openingUsage.idPlayer}" />
						</c:url> <c:url var="updateUrl" value="/updateopenusage.jsp">
							<c:param name="id_opening_usage" value="${openingUsage.id}" />
							<c:param name="id_opening" value="${openingUsage.idOpening}" />
							<c:param name="id_player" value="${openingUsage.idPlayer}" />
							<c:param name="usage_points" value="${openingUsage.idPlayer}" />			
						</c:url>
						<p>
							<a href="${deleteUrl }">Delete Opening Usage</a>
						</p>
						<p>
							<a href="${updateUrl }">Update Opening Usage</a>
						</p></td>
				</tr>
			</c:forEach>
			<tr>
				<td></td>
				<td><input type="text" name="id_opening" /></td>
				<td><input type="text" name="id_player" /></td>
				<td><input type="text" name="usage_points" /></td>
				<td><input type="hidden" name="actiontype" value="addopeningusage" />
					<input type="submit" name="addopeningusage" value="Add Opening Usage" /></td>
			</tr>
		</table>
	</form>
</body>
</html>