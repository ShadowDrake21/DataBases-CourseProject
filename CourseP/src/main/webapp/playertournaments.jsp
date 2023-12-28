<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.List"%>
<%@ page import="domain.Tournament"%>
<%@ page import="domain.Player"%>
<%@ page import="dao.HibernateDAOChess"%>

<%
String playerIdParam = request.getParameter("player_id");
Long playerId = Long.parseLong(playerIdParam);

List<Tournament> tournamentList = HibernateDAOChess.getInstance().getTournamentDAO()
		.getTournamentsByPlayerId(playerId);

Player player = HibernateDAOChess.getInstance().getPlayerDAO().getPlayerById(playerId);
String playerName = player.getName();

request.setAttribute("tournamentList", tournamentList);
request.setAttribute("playerName", playerName);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Player Tournaments</title>
</head>
<body>
	<h1>Player Tournaments</h1>
	<p>
		Tournaments Found:
		<c:out value="${tournamentList.size()}" />
	</p>
	<p>
		<c:out value="${playerName}" />
	</p>

	<table style="width: 100%" border="1">
		<tr>
			<td>Tournament type</td>
			<td>Tournament name</td>
			<td>Tournament start</td>
			<td>Tournament end</td>
			<td>Tournament winner</td>
			<td>Player registration</td>
		</tr>
		<c:forEach var="tournament" items="${tournamentList}">
			<tr>
				<td><c:out value="${tournament.type}" /></td>
				<td><c:out value="${tournament.name}" /></td>
				<td><c:out value="${tournament.start}" /></td>
				<td><c:out value="${tournament.end}" /></td>
				<td><c:out value="${tournament.champion}" /></td>
				<td><c:out value="${tournament.registration}" /></td>
			</tr>
		</c:forEach>
	</table>
	<p>
		<a href="player.jsp">Back to Player Page</a>
	</p>
</body>
</html>