<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>

<%
String errorMessage = (String) request.getAttribute("error");
if (errorMessage == null) {
	errorMessage = "";
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update player</title>
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="body">
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
	<p class="error-message"><%=errorMessage%></p>
	<p>Please update player fields and press Update player button or
		press Cancel button.</p>
	<c:url var="playerUrl" value="/player.jsp" />
	<form method="post" action="player">
		<input type="hidden" name="actiontype" value="updateplayer" /> <input
			type="hidden" name="player_id" value="${param.player_id }" />
		<p>
			Player id:
			<c:out value="${param.player_id }" />
		</p>
		<p>
			Player name: <input type="text" name="player_name"
				value="${param.player_name }" />
		</p>
		<p>
			Player gender: <select name="player_gender">
				<c:choose>
					<c:when test="${param.player_gender eq 'Чоловіча'}">
						<option value="Чоловіча" selected>Чоловіча</option>
						<option value="Жіноча">Жіноча</option>
					</c:when>
					<c:otherwise>
						<option value="Чоловіча">Чоловіча</option>
						<option value="Жіноча" selected>Жіноча</option>
					</c:otherwise>
				</c:choose>
			</select>
		</p>
		<p>
			Player birthday: <input type="text" name="player_birthday"
				value="${param.player_birthday }" />
		</p>
		<p>
			Player country: <input type="text" name="player_country"
				value="${param.player_country }" />
		</p>
		<p>
			Player nationality: <input type="text" name="player_nationality"
				value="${param.player_nationality }" />
		</p>
		<p>
			Player rate: <input type="text" name="player_rate"
				value="${param.player_rate }" />
		</p>
		<p>
			Player matches: <input type="text" name="player_matches"
				value="${param.player_matches }" />
		</p>
		<p>
			Player wins: <input type="text" name="player_wins"
				value="${param.player_wins }" />
		</p>
		<input type="submit" name="updateplayer" value="Update player" /> <input
			type="button" onClick="window.location.href='${playerUrl}'"
			value="Cancel" />
	</form>
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