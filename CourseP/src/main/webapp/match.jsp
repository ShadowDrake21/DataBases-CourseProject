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
<title>Match page</title>
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<jsp:useBean id="MatchListBean" class="databean.MatchListDatabean" />
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
					<li class="nav-item"><a class="nav-link nav__item" href="title.jsp">Title</a></li>
					<li class="nav-item"><a class="nav-link nav__item" href="openingusage.jsp">Opening Usage</a></li>
					<li class="nav-item"><a class="nav-link nav__item" href="opening.jsp">Opening</a></li>
					<li class="nav-item"><a class="nav-link nav__item" href="tournamentpart.jsp">Tournament Participation</a></li>
					<li class="nav-item"><a class="nav-link nav__item" href="tournament.jsp">Tournament</a></li>
					<li class="nav-item"><a class="nav-link nav__item" href="match.jsp">Match</a></li>
					<li class="nav-item"><span class="navbar-text nav__item"> <strong>User:</strong>
							<span id="username"></span>
					</span></li>
				</ul>
				<ul class="navbar-nav ml-md-auto">
					<li class="nav-item">
						<form action="searchServlet" method="get" class="form-inline ml-2">
							<input type="text" class="form-control mr-2" name="query"
								placeholder="Введіть запит">
							<button type="submit" class="btn btn-outline-light">Search</button>
						</form>
					</li>
					<li class="nav-item">
						<button type="button" id="loginButton" class="btn btn-primary ml-2"
							onclick="location.href='login.jsp'">Login</button>
					</li>
					<li class="nav-item">
						<button type="button" id="logoutButton" class="btn btn-danger ml-2"
							onclick="logout()">Logout</button>
					</li>
				</ul>
			</div>
		</nav>
	</header>
	<main class="main">
	<p style="color: red;"><%= errorMessage %></p>
	<form method="post" action="match">
		<table style="width: 100%" border="1">
			<tr>
				<td>Match id</td>
				<td>Tournament id</td>
				<td>Tournament name</td>
				<td>Player 1</td>
				<td>Player 2</td>
				<td>Match date</td>
				<td>Score player 1</td>
				<td>Score player 2</td>
				<td>Action</td>
			</tr>
			<c:forEach var="match" items="${MatchListBean.matchList}">
				<tr>
					<td><c:out value="${match.id}" /></td>
					<td><c:out value="${match.idTournament}" /></td>
					<td><c:out value="${match.tournamentName}" /></td>
					<td><c:out value="${match.player1}" /></td>
					<td><c:out value="${match.player2}" /></td>		
					<td><c:out value="${match.date}" /></td>
					<td><c:out value="${match.score1}" /></td>
					<td><c:out value="${match.score2}" /></td>
					<td><c:url var="deleteUrl" value="/deletematch.jsp">
							<c:param name="id_match" value="${match.id}" />
							<c:param name="id_tournament" value="${match.idTournament}" />
							<c:param name="match_player" value="${match.player1}" />
							<c:param name="match_opponent" value="${match.player2}" />
							<c:param name="match_date" value="${match.date}" />
							<c:param name="match_score_1" value="${match.score1}" />
							<c:param name="match_score_2" value="${match.score2}" />
						</c:url> <c:url var="updateUrl" value="/updatematch.jsp">
							<c:param name="id_match" value="${match.id}" />
							<c:param name="id_tournament" value="${match.idTournament}" />
							<c:param name="match_player" value="${match.player1}" />
							<c:param name="match_opponent" value="${match.player2}" />
							<c:param name="match_date" value="${match.date}" />
							<c:param name="match_score_1" value="${match.score1}" />
							<c:param name="match_score_2" value="${match.score2}" />
						</c:url>
						<p>
							<a href="${deleteUrl }"  data-type="userlink">Delete match</a>
						</p>
						<p>
							<a href="${updateUrl }"  data-type="userlink">Update match</a>
						</p></td>
				</tr>
			</c:forEach>
			<tr>
				<td></td>
				<td><input type="text" data-type="userinput" name="id_tournament" /></td>
				<td></td>
				<td><input type="text" data-type="userinput" name="match_player" /></td>
				<td><input type="text" data-type="userinput" name="match_opponent" /></td>
				<td><input type="text" data-type="userinput" name="match_date" /></td>
				<td><select name="match_score_1" data-type="userinput">
						<option value="0">0</option>
						<option value="0.5">0.5</option>
						<option value="1">1</option>
				</select></td>
				<td><select name="match_score_2" data-type="userinput">
						<option value="0">0</option>
						<option value="0.5">0.5</option>
						<option value="1">1</option>
				</select></td>
				<td><input type="hidden" name="actiontype" value="addmatch" />
					<input type="submit" name="addmatch" data-type="userinput" value="Add match" /></td>
			</tr>
		</table>
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