<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.List"%>
<%@ page import="domain.Title"%>
<%@ page import="dao.HibernateDAOChess"%>

<%
String playerIdParam = request.getParameter("player_id");
Long playerId = Long.parseLong(playerIdParam);

List<Title> titleList = HibernateDAOChess.getInstance().getTitleDAO()
		.getTitlesByPlayerId(playerId);
System.out.println(titleList);
request.setAttribute("titleList", titleList);
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
		<c:out value="${titleList[0].playerName}" />
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