<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Opening page</title>
</head>
<body>
	<jsp:useBean id="OpeningListBean" class="databean.OpeningListDatabean" />
	<h1>Opening page</h1>
	<form method="post" action="opening">
		<table style="width: 100%" border="1">
			<tr>
				<td>Id</td>
				<td>Name</td>
				<td>Category</td>
				<td>Year</td>
				<td>Famous player</td>
				<td>Action</td>
			</tr>
			<c:forEach var="opening" items="${OpeningListBean.openingList}">
				<tr>
					<td><c:out value="${opening.id}" /></td>
					<td><c:out value="${opening.name}" /></td>
					<td><c:out value="${opening.category}" /></td>
					<td><c:out value="${opening.year}" /></td>
					<td><c:out value="${opening.player}" /></td>
					<td><c:url var="deleteUrl" value="/deleteopening.jsp">
							<c:param name="id_opening" value="${opening.id}" />
							<c:param name="opening_name" value="${opening.name}" />
							<c:param name="opening_category" value="${opening.category}" />
							<c:param name="opening_year" value="${opening.year}" />
							<c:param name="famous_player" value="${opening.player}" />
						</c:url> <c:url var="updateUrl" value="/updateopening.jsp">
							<c:param name="id_opening" value="${opening.id}" />
							<c:param name="opening_name" value="${opening.name}" />
							<c:param name="opening_category" value="${opening.category}" />
							<c:param name="opening_year" value="${opening.year}" />
							<c:param name="famous_player" value="${opening.player}" />
						</c:url>
						<c:url var="playersUrl" value="/openingplayers.jsp">
							<c:param name="opening_id" value="${opening.id}" />
						</c:url>
						<p>
							<a href="${deleteUrl }">Delete opening</a>
						</p>
						<p>
							<a href="${updateUrl }">Update opening</a>
						</p>
						<p>
							<a href="${playersUrl }">View players</a>
						</p>
						</td>
				</tr>
			</c:forEach>
			<tr>
				<td></td>
				<td><input type="text" name="opening_name" /></td>
				<td><select name="opening_category">
						<option value="Відкритий">Відкритий</option>
						<option value="Напіввідкритий">Напіввідкритий</option>
						<option value="Закритий">Закритий</option>
						<option value="Фланговий">Фланговий</option>
				</select></td>
				<td><input type="text" name="opening_year" /></td>
				<td><input type="text" name="famous_player" /></td>
				<td><input type="hidden" name="actiontype" value="addopening" />
					<input type="submit" name="addopening" value="Add opening" /></td>
			</tr>
		</table>
	</form>
</body>
</html>