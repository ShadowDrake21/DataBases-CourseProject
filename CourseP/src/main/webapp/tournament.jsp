<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tournament page</title>
</head>
<body>
	<jsp:useBean id="TournamentListBean" class="databean.TournamentListDatabean" />
	<h1>Tournament page</h1>
	<form method="post" action="tournament">
		<table style="width: 100%" border="1">
			<tr>
				<td>Id</td>
				<td>Type</td>
				<td>Name</td>
				<td>Start</td>
				<td>End</td>
				<td>Country</td>
				<td>Prize</td>
				<td>Matches</td>
				<td>Players</td>
				<td>Champion</td>
				<td>DB matches</td>
				<td>Action</td>
			</tr>
			<c:forEach var="tournament" items="${TournamentListBean.tournamentList}">
				<tr>
					<td><c:out value="${tournament.id}" /></td>
					<td><c:out value="${tournament.type}" /></td>
					<td><c:out value="${tournament.name}" /></td>
					<td><c:out value="${tournament.start}" /></td>
					<td><c:out value="${tournament.end}" /></td>
					<td><c:out value="${tournament.country}" /></td>
					<td><c:out value="${tournament.prize}" /></td>
					<td><c:out value="${tournament.numMatches}" /></td>
					<td><c:out value="${tournament.players}" /></td>
					<td><c:out value="${tournament.champion}" /></td>
					<td><c:out value="${tournament.matchNumber}" /></td>
					<td><c:url var="deleteUrl" value="/deletetournament.jsp">
							<c:param name="tournament_id" value="${tournament.id}" />
							<c:param name="tournament_type" value="${tournament.type}" />
							<c:param name="tournament_name" value="${tournament.name}" />
							<c:param name="tournament_start" value="${tournament.start}" />
							<c:param name="tournament_end" value="${tournament.end}" />
							<c:param name="tournament_country" value="${tournament.country}" />
							<c:param name="tournament_prize" value="${tournament.prize}" />
							<c:param name="tournament_matches" value="${tournament.numMatches}" />
							<c:param name="tournament_players" value="${tournament.players}" />
							<c:param name="tournament_current_champ" value="${tournament.champion}" />
						</c:url> <c:url var="updateUrl" value="/updatetournament.jsp">
							<c:param name="tournament_id" value="${tournament.id}" />
							<c:param name="tournament_type" value="${tournament.type}" />
							<c:param name="tournament_name" value="${tournament.name}" />
							<c:param name="tournament_start" value="${tournament.start}" />
							<c:param name="tournament_end" value="${tournament.end}" />
							<c:param name="tournament_country" value="${tournament.country}" />
							<c:param name="tournament_prize" value="${tournament.prize}" />
							<c:param name="tournament_matches" value="${tournament.numMatches}" />
							<c:param name="tournament_players" value="${tournament.players}" />
							<c:param name="tournament_current_champ" value="${tournament.champion}" />
						</c:url>
						<c:url var="playersUrl" value="/tournamentplayers.jsp">
							<c:param name="tournament_id" value="${tournament.id}" />
						</c:url>
						<c:url var="matchesUrl" value="/tournamentmatches.jsp">
							<c:param name="tournament_id" value="${tournament.id}" />
						</c:url>
						<p>
							<a href="${deleteUrl }">Delete tournament</a>
						</p>
						<p>
							<a href="${updateUrl }">Update tournament</a>
						</p>
						<p>
							<a href="${playersUrl}">View players</a>
						</p>
						<p>
							<a href="${matchesUrl}">View matches</a>
						</p>
						</td>
				</tr>
			</c:forEach>
			<tr>
				<td></td>
				<td><select name="tournament_type">
						<option value="Турнір">Турнір</option>
						<option value="Чемпіонат">Чемпіонат</option>
						<option value="Олімпіада">Олімпіада</option>
				</select></td>
				<td><input type="text" name="tournament_name" /></td>
				<td><input type="text" name="tournament_start" /></td>
				<td><input type="text" name="tournament_end" /></td>
				<td><input type="text" name="tournament_country" /></td>
				<td><input type="text" name="tournament_prize" /></td>
				<td><input type="text" name="tournament_matches" /></td>
				<td><input type="text" name="tournament_players" /></td>
				<td><input type="text" name="tournament_current_champ" /></td>
				<td></td>
				<td><input type="hidden" name="actiontype" value="addtournament" />
					<input type="submit" name="addtournament" value="Add tournament" /></td>
			</tr>
		</table>
	</form>
</body>
</html>