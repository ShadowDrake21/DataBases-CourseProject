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
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<header class="header">
		<nav class="navbar navbar-expand-lg navbar-light">
			<a class="navbar-brand nav__item" href="homepage.jsp">Chess2D</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link nav__item"
						href="player.jsp">Player</a></li>
					<li class="nav-item"><a class="nav-link nav__item"
						href="title.jsp">Title</a></li>
					<li class="nav-item"><a class="nav-link nav__item"
						href="openingusage.jsp">Opening Usage</a></li>
					<li class="nav-item"><a class="nav-link nav__item"
						href="opening.jsp">Opening</a></li>
					<li class="nav-item"><a class="nav-link nav__item"
						href="tournamentpart.jsp">Tournament Participation</a></li>
					<li class="nav-item"><a class="nav-link nav__item"
						href="tournament.jsp">Tournament</a></li>
					<li class="nav-item"><a class="nav-link nav__item"
						href="match.jsp">Match</a></li>
					<li class="nav-item"><span class="navbar-text nav__item">
							<strong>User:</strong> <span id="username"></span>
					</span></li>
				</ul>
				<ul class="navbar-nav ml-md-auto">
					<li class="nav-item">
						<button type="button" id="loginButton"
							class="btn btn-primary ml-2" onclick="location.href='login.jsp'">Login</button>
					</li>
					<li class="nav-item">
						<button type="button" id="logoutButton"
							class="btn btn-danger ml-2" onclick="logout()">Logout</button>
					</li>
				</ul>
			</div>
		</nav>
	</header>
	<main class="main">
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
	</main>
	<footer class="footer">
		<p class="footer__descr">©2023-2024 Krapyvianskyi "Drake21" Dmytro
			& Turevskyi "DTure" Dmytro</p>
	</footer>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./js/script.js"></script>
</body>
</html>