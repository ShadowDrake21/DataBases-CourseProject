<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.List"%>
<%@ page import="domain.Opening"%>
<%@ page import="domain.Player"%>
<%@ page import="dao.HibernateDAOChess"%>

<%
String playerIdParam = request.getParameter("player_id");
Long playerId = Long.parseLong(playerIdParam);

List<Opening> openingList = HibernateDAOChess.getInstance().getOpeningDAO()
		.getOpeningsByPlayerId(playerId);

Player player = HibernateDAOChess.getInstance().getPlayerDAO().getPlayerById(playerId);
String playerName = player.getName();

request.setAttribute("openingList", openingList);
request.setAttribute("playerName", playerName);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Player Openings</title>
</head>
<body>
	<h1>Player Openings</h1>
	<p>
		Openings Found:
		<c:out value="${openingList.size()}" />
	</p>
	<p>
		<c:out value="${playerName}" />
	</p>

	<table style="width: 100%" border="1">
		<tr>
			<td>Opening name</td>
			<td>Openings category</td>
			<td>Openings year</td>
			<td>Earned points</td>
		</tr>
		<c:forEach var="opening" items="${openingList}">
			<tr>
				<td><c:out value="${opening.name}" /></td>
				<td><c:out value="${opening.category}" /></td>
				<td><c:out value="${opening.year}" /></td>
				<td><c:out value="${opening.openingUsagePoints}" /></td>
			</tr>
		</c:forEach>
	</table>
	<p>
		<a href="player.jsp">Back to Player Page</a>
	</p>
</body>
</html>