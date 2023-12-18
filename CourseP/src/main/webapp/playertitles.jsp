<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.List"%>
<%@ page import="domain.Title"%>
<%@ page import="domain.Player"%>
<%@ page import="dao.HibernateDAOChess"%>

<%
String playerIdParam = request.getParameter("player_id");
Long playerId = Long.parseLong(playerIdParam);

List<Title> titleList = HibernateDAOChess.getInstance().getTitleDAO()
		.getTitlesByPlayerId(playerId);
Player player = HibernateDAOChess.getInstance().getPlayerDAO().getPlayerById(playerId);
String playerName = player.getName();

request.setAttribute("titleList", titleList);
request.setAttribute("playerName", playerName);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Player Titles</title>
</head>
<body>
	<h1>Player Titles</h1>
	<p>
		Titles Found:
		<c:out value="${titleList.size()}" />
	</p>
	<p>
		<c:choose>
			<c:when test="${empty titleList}">
				<c:out value="${playerName}" />
			</c:when>
			<c:otherwise>
				<c:out value="${titleList[0].playerName}" />
			</c:otherwise>
		</c:choose>
	</p>

	<table style="width: 100%" border="1">
		<tr>
			<td>Title name</td>
			<td>Title year</td>
		</tr>
		<c:forEach var="title" items="${titleList}">
			<tr>
				<td><c:out value="${title.name}" /></td>
				<td><c:out value="${title.year}" /></td>
			</tr>
		</c:forEach>
	</table>
	<p>
		<a href="player.jsp">Back to Player Page</a>
	</p>
</body>
<%-- <body>
    <h1>Player Titles</h1>
    <p>Titles Found: <c:out value="${yourTitleList.size()}" /></p>

    <c:forEach var="title" items="${yourTitleList}">
        <p>
            Title Name: <c:out value="${title.name}" />
        </p>
        <p>
            Year: <c:out value="${title.year}" />
        </p>
    </c:forEach>

    <p>
        <a href="/player.jsp">Back to Player Page</a>
    </p>
</body> --%>
</html>