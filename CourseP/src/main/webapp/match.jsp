<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Match page</title>
</head>
<body>
	<jsp:useBean id="MatchListBean" class="databean.MatchListDatabean" />
	<h1>Match page</h1>
	<form method="post" action="match">
		<table style="width: 100%" border="1">
			<tr>
				<td>Match id</td>
				<td>Tournament id</td>
				<td>Tournament name</td>
				<td>Player 1</td>
				<td>Player 2</td>
				<td>Match date</td>
				<td>Score player 1</td>
				<td>Score player 2</td>
				<td>Action</td>
			</tr>
			<c:forEach var="match" items="${MatchListBean.matchList}">
				<tr>
					<td><c:out value="${match.id}" /></td>
					<td><c:out value="${match.idTournament}" /></td>
					<td><c:out value="${match.tournamentName}" /></td>
					<td><c:out value="${match.player1}" /></td>
					<td><c:out value="${match.player2}" /></td>		
					<td><c:out value="${match.date}" /></td>
					<td><c:out value="${match.score1}" /></td>
					<td><c:out value="${match.score2}" /></td>
					<td><c:url var="deleteUrl" value="/deletematch.jsp">
							<c:param name="id_match" value="${match.id}" />
							<c:param name="id_tournament" value="${match.idTournament}" />
							<c:param name="match_player" value="${match.player1}" />
							<c:param name="match_opponent" value="${match.player2}" />
							<c:param name="match_date" value="${match.date}" />
							<c:param name="match_score_1" value="${match.score1}" />
							<c:param name="match_score_2" value="${match.score2}" />
						</c:url> <c:url var="updateUrl" value="/updatematch.jsp">
							<c:param name="id_match" value="${match.id}" />
							<c:param name="id_tournament" value="${match.idTournament}" />
							<c:param name="match_player" value="${match.player1}" />
							<c:param name="match_opponent" value="${match.player2}" />
							<c:param name="match_date" value="${match.date}" />
							<c:param name="match_score_1" value="${match.score1}" />
							<c:param name="match_score_2" value="${match.score2}" />
						</c:url>
						<p>
							<a href="${deleteUrl }">Delete match</a>
						</p>
						<p>
							<a href="${updateUrl }">Update match</a>
						</p></td>
				</tr>
			</c:forEach>
			<tr>
				<td></td>
				<td><input type="text" name="id_tournament" /></td>
				<td></td>
				<td><input type="text" name="match_player" /></td>
				<td><input type="text" name="match_opponent" /></td>
				<td><input type="text" name="match_date" /></td>
				<td><select name="match_score_1">
						<option value="0">0</option>
						<option value="0.5">0.5</option>
						<option value="1">1</option>
				</select></td>
				<td><select name="match_score_2">
						<option value="0">0</option>
						<option value="0.5">0.5</option>
						<option value="1">1</option>
				</select></td>
				<td><input type="hidden" name="actiontype" value="addmatch" />
					<input type="submit" name="addmatch" value="Add match" /></td>
			</tr>
		</table>
	</form>
</body>
</html>