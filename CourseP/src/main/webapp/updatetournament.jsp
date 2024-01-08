<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

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
<title>Update tournament</title>
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
	<p>Please update tournament fields and press Update tournament
		button or press Cancel button.</p>
	<c:url var="tournamentUrl" value="/tournament.jsp" />
	<form method="post" action="tournament">
		<input type="hidden" name="actiontype" value="updatetournament" /> <input
			type="hidden" name="tournament_id" value="${param.tournament_id }" />
		<p>
			Tournament id:
			<c:out value="${param.tournament_id }" />
		</p>
		<p>
			Tournament type: <select name="tournament_type">
				<c:choose>
					<c:when test="${param.tournament_type eq 'Турнір'}">
						<option value="Турнір" selected>Турнір</option>
						<option value="Чемпіонат">Чемпіонат</option>
						<option value="Олімпіада">Олімпіада</option>
					</c:when>
					<c:when test="${param.tournament_type eq 'Чемпіонат'}">
						<option value="Турнір">Турнір</option>
						<option value="Чемпіонат" selected>Чемпіонат</option>
						<option value="Олімпіада">Олімпіада</option>
					</c:when>
					<c:otherwise>
						<option value="Турнір">Турнір</option>
						<option value="Чемпіонат">Чемпіонат</option>
						<option value="Олімпіада" selected>Олімпіада</option>
					</c:otherwise>
				</c:choose>
			</select>
		</p>
		<p>
			Tournament name: <input type="text" name="tournament_name"
				value="${param.tournament_name }" />
		</p>
		<p>
			Tournament start: <input type="text" name="tournament_start"
				value="${param.tournament_start }" />
		</p>
		<p>
			Tournament end: <input type="text" name="tournament_end"
				value="${param.tournament_end }" />
		</p>
		<p>
			Tournament country: <input type="text" name="tournament_country"
				value="${param.tournament_country }" />
		</p>
		<p>
			Tournament prize: <input type="text" name="tournament_prize"
				value="${param.tournament_prize }" />
		</p>
		<p>
			Tournament number of matches: <input type="text"
				name="tournament_matches" value="${param.tournament_matches }" />
		</p>
		<p>
			Tournament number of players: <input type="text"
				name="tournament_players" value="${param.tournament_players }" />
		</p>
		<p>
			Tournament winner: <input type="text" name="tournament_current_champ"
				value="${param.tournament_current_champ }" />
		</p>
		<input type="submit" name="updatetournament" value="Update tournament" />
		<input type="button" onClick="window.location.href='${tournamentUrl}'"
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