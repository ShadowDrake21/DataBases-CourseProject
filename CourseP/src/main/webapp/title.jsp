<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title page</title>
</head>
<body>
	<jsp:useBean id="TitleListBean" class="databean.TitleListDatabean" />
	<h1>Title page</h1>
	<form method="post" action="title">
		<table style="width: 100%" border="1">
			<tr>
				<td>Id</td>
				<td>Title name</td>
				<td>Title year</td>
				<td>Player id</td>
				<td>Player name</td>
				<td>Action</td>
			</tr>
			<c:forEach var="title" items="${TitleListBean.titleList}">
				<tr>
					<td><c:out value="${title.id}" /></td>
					<td><c:out value="${title.name}" /></td>
					<td><c:out value="${title.year}" /></td>
					<td><c:out value="${title.idPlayer}" /></td>
					<td><c:out value="${title.playerName}" /></td>
					<td><c:url var="deleteUrl" value="/deletetitle.jsp">
							<c:param name="title_id" value="${title.id}" />
							<c:param name="title_name" value="${title.name}" />
							<c:param name="title_year" value="${title.year}" />
							<c:param name="id_player" value="${title.idPlayer}" />
						</c:url> <c:url var="updateUrl" value="/updatetitle.jsp">
							<c:param name="title_id" value="${title.id}" />
							<c:param name="title_name" value="${title.name}" />
							<c:param name="title_year" value="${title.year}" />
							<c:param name="id_player" value="${title.idPlayer}" />
						</c:url>
						<p>
							<a href="${deleteUrl }">Delete title</a>
						</p>
						<p>
							<a href="${updateUrl }">Update title</a>
						</p></td>
				</tr>
			</c:forEach>
			<tr>
				<td></td>
				<td><input type="text" name="title_name" /></td>
				<td><input type="text" name="title_year" /></td>
				<td><input type="text" name="id_player" /></td>
				<td></td>
				<td><input type="hidden" name="actiontype" value="addtitle" />
					<input type="submit" name="addtitle" value="Add title" /></td>
			</tr>
		</table>
	</form>
</body>
</html>