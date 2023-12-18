<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.List"%>
<%@ page import="domain.Match"%>
<%@ page import="domain.Tournament"%>
<%@ page import="dao.HibernateDAOChess"%>

<%
String tournamentIdParam = request.getParameter("tournament_id");
Long tournamentId = Long.parseLong(tournamentIdParam);

List<Match> matchList = HibernateDAOChess.getInstance().getMatchDAO()
		.getMatchesByTournamentId(tournamentId);

Tournament tournament = HibernateDAOChess.getInstance().getTournamentDAO()
		.getTournamentById(tournamentId);
String tournamentName = tournament.getName();

request.setAttribute("matchList", matchList);
request.setAttribute("tournamentName", tournamentName);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tournament Matches</title>
</head>
<body>
	<h1>Tournament Matches</h1>
	<p>
		Matches Found:
		<c:out value="${matchList.size()}" />
	</p>
	<p>
		<c:choose>
			<c:when test="${empty matchList}">
				<c:out value="${tournamentName}" />
			</c:when>
			<c:otherwise>
				<c:out value="${matchList[0].tournamentName}" />
			</c:otherwise>
		</c:choose>

	</p>

	<table style="width: 100%" border="1">
		<tr>
			<td>Match player 1</td>
			<td>Match player 2</td>
			<td>Match date</td>
			<td>Match score 1</td>
			<td>Match score 2</td>
		</tr>
		<c:forEach var="match" items="${matchList}">
			<tr>
				<td><c:out value="${match.player1}" /></td>
				<td><c:out value="${match.player2}" /></td>
				<td><c:out value="${match.date}" /></td>
				<td><c:out value="${match.score1}" /></td>
				<td><c:out value="${match.score2}" /></td>
			</tr>
		</c:forEach>
	</table>
	<p>
		<a href="tournament.jsp">Back to Tournament Page</a>
	</p>
</body>
</html>