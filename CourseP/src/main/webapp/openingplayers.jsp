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

Opening opening = HibernateDAOChess.getInstance().getOpeningDAO()
		.getOpeningById(openingId);
String openingName = opening.getName();

request.setAttribute("playerList", playerList);
request.setAttribute("openingName", openingName);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Opening Players</title>
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
					<li class="nav-item"><a class="nav-link nav__item"
						href="statistics.jsp">Statistics</a></li>

				</ul>
				<ul class="navbar-nav ml-md-auto">
					<li class="nav-item"><span class="navbar-text nav__item">
							<strong>User:</strong> <span id="username"></span>
					</span></li>
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
		<h1 class="page__title" style="margin-top: 30px;">Opening Players</h1>
		<p>
			Players Found:
			<c:out value="${playerList.size()}" />
		</p>
		<p>
			<c:out value="${openingName}" />
		</p>

		<table style="width: 100%" border="1">
			<tr class="first-row">
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
			<a style="display: inline-block; margin-top: 15px;" href="opening.jsp">Back to Opening Page</a>
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