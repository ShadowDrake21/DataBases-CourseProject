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

Player player = HibernateDAOChess.getInstance().getPlayerDAO()
		.getPlayerById(playerId);
String playerName = player.getName();

request.setAttribute("openingList", openingList);
request.setAttribute("playerName", playerName);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Player Openings</title>
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