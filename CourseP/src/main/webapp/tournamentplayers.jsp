<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.List"%>
<%@ page import="domain.Player"%>
<%@ page import="domain.Tournament"%>
<%@ page import="dao.HibernateDAOChess"%>

<%
String tournamentIdParam = request.getParameter("tournament_id");
Long tournamentId = Long.parseLong(tournamentIdParam);

List<Player> playerList = HibernateDAOChess.getInstance().getPlayerDAO()
		.getPlayersByTournamentId(tournamentId);

Tournament tournament = HibernateDAOChess.getInstance().getTournamentDAO()
		.getTournamentById(tournamentId);
String tournamentName = tournament.getName();

request.setAttribute("playerList", playerList);
request.setAttribute("tournamentName", tournamentName);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tournament Players</title>
</head>
<body>
	<h1>Tournament Players</h1>
	<p>
		Players Found:
		<c:out value="${playerList.size()}" />
	</p>
	<p>
		<c:out value="${tournamentName}" />
	</p>

	<table style="width: 100%" border="1">
		<tr>
			<td>Player name</td>
			<td>Player birthday</td>
			<td>Player country</td>
			<td>Player rate</td>
			<td>Player matches</td>
			<td>Player wins</td>
			<td>Tournament registration</td>
		</tr>
		<c:forEach var="player" items="${playerList}">
			<tr>
				<td><c:out value="${player.name}" /></td>
				<td><c:out value="${player.birthday}" /></td>
				<td><c:out value="${player.country}" /></td>
				<td><c:out value="${player.rate}" /></td>
				<td><c:out value="${player.matches}" /></td>
				<td><c:out value="${player.wins}" /></td>
				<td><c:out value="${player.registration}" /></td>
			</tr>
		</c:forEach>
	</table>
	<p>
		<a href="tournament.jsp">Back to Tournament Page</a>
	</p>
</body>
</html>