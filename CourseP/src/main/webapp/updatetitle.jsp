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
<title>Update title</title>
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
		<p class="error-message"><%=errorMessage%></p>
		<div class="login select">
			<p>Please update title fields and press Update title button or
				press Cancel button.</p>
			<c:url var="titleUrl" value="/title.jsp" />
			<form method="post" action="title"
				style="display: flex; flex-direction: column; gap: 20px;">
				<input type="hidden" name="actiontype" value="updatetitle" /> <input
					type="hidden" name="title_id" value="${param.title_id }" />
				<p>
					Title id:
					<c:out value="${param.title_id }" />
				</p>
				<p>
					Title name: <input type="text" name="title_name"
						value="${param.title_name }" />
				</p>
				<p>
					Title year: <input type="text" name="title_year"
						value="${param.title_year }" />
				</p>
				<p>
					Player id: <input type="text" name="id_player"
						value="${param.id_player }" />
				</p>
				<div class="login__btn">
					<input type="submit" name="updatetitle" value="Update title"
						class="btn-custom" /> <input type="button"
						onClick="window.location.href='${titleUrl}'" value="Cancel"
						class="btn-custom" />
				</div>
			</form>
		</div>
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