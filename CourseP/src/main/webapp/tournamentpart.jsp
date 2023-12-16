<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tournament participation page</title>
</head>
<body>
	<jsp:useBean id="TournamentPartBean" class="databean.TournamentPartListDatabean" />
	<h1>Tournament participation page</h1>
	<form method="post" action="tournamentpart">
		<table style="width: 100%" border="1">
			<tr>
				<td>Id</td>
				<td>Player id</td>
				<td>Tournament id</td>
				<td>TournamentPart registration</td>
				<td>TournamentPart place</td>
				<td>Action</td>
			</tr>
			<c:forEach var="tournamentpart" items="${TournamentPartBean.tournamentPartList}">
				<tr>
					<td><c:out value="${tournamentpart.id}" /></td>
					<td><c:out value="${tournamentpart.playerName}" /></td>
					<td><c:out value="${tournamentpart.tournamentName}" /></td>
					<td><c:out value="${tournamentpart.registration}" /></td>
					<td><c:out value="${tournamentpart.place}" /></td>
					<td><c:url var="deleteUrl" value="/deletetournamentpart.jsp">
							<c:param name="tournament_part_id" value="${tournamentpart.id}" />
							<c:param name="id_player" value="${tournamentpart.idPlayer}" />
							<c:param name="id_tournament" value="${tournamentpart.idTournament}" />
							<c:param name="registration" value="${tournamentpart.registration}" />
							<c:param name="place" value="${tournamentpart.place}" />
						</c:url> <c:url var="updateUrl" value="/updatetournamentpart.jsp">
							<c:param name="tournament_part_id" value="${tournamentpart.id}" />
							<c:param name="id_player" value="${tournamentpart.idPlayer}" />
							<c:param name="id_tournament" value="${tournamentpart.idTournament}" />
							<c:param name="registration" value="${tournamentpart.registration}" />
							<c:param name="place" value="${tournamentpart.place}" />
						</c:url>
						<p>
							<a href="${deleteUrl }">Delete tournament participation</a>
						</p>
						<p>
							<a href="${updateUrl }">Update tournament participation</a>
						</p></td>
				</tr>
			</c:forEach>
			<tr>
				<td></td>
				<td><input type="text" name="id_player" /></td>
				<td><input type="text" name="id_tournament" /></td>
				<td><input type="text" name="registration" /></td>
				<td><input type="text" name="place" /></td>
				<td><input type="hidden" name="actiontype" value="addtournamentpart" />
					<input type="submit" name="addtournamentpart" value="Add tournament participation" /></td>
			</tr>
		</table>
	</form>
</body>
</html>