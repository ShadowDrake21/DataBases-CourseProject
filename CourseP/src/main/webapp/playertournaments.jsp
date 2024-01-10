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

List<Tournament> tournamentList = HibernateDAOChess.getInstance()
		.getTournamentDAO().getTournamentsByPlayerId(playerId);

Player player = HibernateDAOChess.getInstance().getPlayerDAO()
		.getPlayerById(playerId);
String playerName = player.getName();

request.setAttribute("tournamentList", tournamentList);
request.setAttribute("playerName", playerName);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Player Tournaments</title>
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
		<h1 class="page__title" style="margin-top: 30px;">Player Tournaments</h1>
		<p>
			Tournaments Found:
			<c:out value="${tournamentList.size()}" />
		</p>
		<p>
			<c:out value="${playerName}" />
		</p>

		<table style="width: 100%" border="1">
			<tr class="first-row">
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
			<a style="display: inline-block; margin-top: 15px;" href="player.jsp">Back to Player Page</a>
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