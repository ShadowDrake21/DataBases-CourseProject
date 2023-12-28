<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.List"%>
<%@ page import="domain.Opening"%>
<%@ page import="domain.Player"%>
<%@ page import="dao.HibernateDAOChess"%>

<%
String openingIdParam = request.getParameter("opening_id");
Long openingId = Long.parseLong(openingIdParam);

List<Player> playerList = HibernateDAOChess.getInstance().getPlayerDAO()
		.getPlayersByOpeningId(openingId);

Opening opening = HibernateDAOChess.getInstance().getOpeningDAO().getOpeningById(openingId);
String openingName = opening.getName();

request.setAttribute("playerList", playerList);
request.setAttribute("openingName", openingName);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Opening Players</title>
</head>
<body>
	<h1>Opening Players</h1>
	<p>
		Players Found:
		<c:out value="${playerList.size()}" />
	</p>
	<p>
		<c:out value="${openingName}" />
	</p>

	<table style="width: 100%" border="1">
		<tr>
			<td>Player name</td>
			<td>Player birthday</td>
			<td>Player country</td>
			<td>Player rate</td>
			<td>Player matches</td>
			<td>Player wins</td>
			<td>Earned points</td>
		</tr>
		<c:forEach var="player" items="${playerList}">
			<tr>
				<td><c:out value="${player.name}" /></td>
				<td><c:out value="${player.birthday}" /></td>
				<td><c:out value="${player.country}" /></td>
				<td><c:out value="${player.rate}" /></td>
				<td><c:out value="${player.matches}" /></td>
				<td><c:out value="${player.wins}" /></td>
				<td><c:out value="${player.openingUsagePoints}" /></td>
			</tr>
		</c:forEach>
	</table>
	<p>
		<a href="opening.jsp">Back to Opening Page</a>
	</p>
</body>
</html>