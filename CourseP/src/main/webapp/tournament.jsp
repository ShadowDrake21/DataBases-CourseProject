<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<title>Tournament page</title>
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
		<h1 class="page__title">Tournaments</h1>
		<form method="post" action="tournament">
			<div style="margin-bottom: 15px;">
				<select name="field">
					<option value="id_tournament">Id</option>
					<option value="tournament_type">Type</option>
					<option value="tournament_name">Name</option>
					<option value="tournament_country">Country</option>
					<option value="tournament_current_champ">Champion</option>
				</select> <input type="text" name="value" placeholder="Enter search value">
				<input type="hidden" name="actiontype" value="searchtournament">
				<input type="submit" name="searchtournament" value="Search">
			</div>
			<c:if test="${not empty searchResults}">
				<table style="width: 100%" border="1">
					<tr class="first-row">
						<td>Id</td>
						<td>Type</td>
						<td>Name</td>
						<td>Start</td>
						<td>End</td>
						<td>Country</td>
						<td>Prize</td>
						<td>Matches</td>
						<td>Players</td>
						<td>Champion</td>
						<td>DB matches</td>
						<td>Action</td>
					</tr>
					<c:forEach var="tournament" items="${searchResults}">
						<tr>
							<td><c:out value="${tournament.id}" /></td>
							<td><c:out value="${tournament.type}" /></td>
							<td><c:out value="${tournament.name}" /></td>
							<td><c:out value="${tournament.start}" /></td>
							<td><c:out value="${tournament.end}" /></td>
							<td><c:out value="${tournament.country}" /></td>
							<td><c:out value="${tournament.prize}" /></td>
							<td><c:out value="${tournament.numMatches}" /></td>
							<td><c:out value="${tournament.players}" /></td>
							<td><c:out value="${tournament.champion}" /></td>
							<td><c:out value="${tournament.matchNumber}" /></td>
							<td><c:url var="deleteUrl" value="/deletetournament.jsp">
									<c:param name="tournament_id" value="${tournament.id}" />
									<c:param name="tournament_type" value="${tournament.type}" />
									<c:param name="tournament_name" value="${tournament.name}" />
									<c:param name="tournament_start" value="${tournament.start}" />
									<c:param name="tournament_end" value="${tournament.end}" />
									<c:param name="tournament_country"
										value="${tournament.country}" />
									<c:param name="tournament_prize" value="${tournament.prize}" />
									<c:param name="tournament_matches"
										value="${tournament.numMatches}" />
									<c:param name="tournament_players"
										value="${tournament.players}" />
									<c:param name="tournament_current_champ"
										value="${tournament.champion}" />
								</c:url> <c:url var="updateUrl" value="/updatetournament.jsp">
									<c:param name="tournament_id" value="${tournament.id}" />
									<c:param name="tournament_type" value="${tournament.type}" />
									<c:param name="tournament_name" value="${tournament.name}" />
									<c:param name="tournament_start" value="${tournament.start}" />
									<c:param name="tournament_end" value="${tournament.end}" />
									<c:param name="tournament_country"
										value="${tournament.country}" />
									<c:param name="tournament_prize" value="${tournament.prize}" />
									<c:param name="tournament_matches"
										value="${tournament.numMatches}" />
									<c:param name="tournament_players"
										value="${tournament.players}" />
									<c:param name="tournament_current_champ"
										value="${tournament.champion}" />
								</c:url> <c:url var="playersUrl" value="/tournamentplayers.jsp">
									<c:param name="tournament_id" value="${tournament.id}" />
								</c:url> <c:url var="matchesUrl" value="/tournamentmatches.jsp">
									<c:param name="tournament_id" value="${tournament.id}" />
								</c:url>
								<p>
									<a href="${deleteUrl }" data-type="userlink">Delete
										tournament</a>
								</p>
								<p>
									<a href="${updateUrl }" data-type="userlink">Update
										tournament</a>
								</p>
								<p>
									<a href="${playersUrl}">View players</a>
								</p>
								<p>
									<a href="${matchesUrl}">View matches</a>
								</p></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${empty searchResults}">
				<jsp:useBean id="TournamentListBean"
					class="databean.TournamentListDatabean" />
				<table style="width: 100%" border="1">
					<tr class="first-row">
						<td>Id</td>
						<td>Type</td>
						<td>Name</td>
						<td>Start</td>
						<td>End</td>
						<td>Country</td>
						<td>Prize</td>
						<td>Matches</td>
						<td>Players</td>
						<td>Champion</td>
						<td>DB matches</td>
						<td>Action</td>
					</tr>
					<c:forEach var="tournament"
						items="${TournamentListBean.tournamentList}">
						<tr>
							<td><c:out value="${tournament.id}" /></td>
							<td><c:out value="${tournament.type}" /></td>
							<td><c:out value="${tournament.name}" /></td>
							<td><c:out value="${tournament.start}" /></td>
							<td><c:out value="${tournament.end}" /></td>
							<td><c:out value="${tournament.country}" /></td>
							<td><c:out value="${tournament.prize}" /></td>
							<td><c:out value="${tournament.numMatches}" /></td>
							<td><c:out value="${tournament.players}" /></td>
							<td><c:out value="${tournament.champion}" /></td>
							<td><c:out value="${tournament.matchNumber}" /></td>
							<td><c:url var="deleteUrl" value="/deletetournament.jsp">
									<c:param name="tournament_id" value="${tournament.id}" />
									<c:param name="tournament_type" value="${tournament.type}" />
									<c:param name="tournament_name" value="${tournament.name}" />
									<c:param name="tournament_start" value="${tournament.start}" />
									<c:param name="tournament_end" value="${tournament.end}" />
									<c:param name="tournament_country"
										value="${tournament.country}" />
									<c:param name="tournament_prize" value="${tournament.prize}" />
									<c:param name="tournament_matches"
										value="${tournament.numMatches}" />
									<c:param name="tournament_players"
										value="${tournament.players}" />
									<c:param name="tournament_current_champ"
										value="${tournament.champion}" />
								</c:url> <c:url var="updateUrl" value="/updatetournament.jsp">
									<c:param name="tournament_id" value="${tournament.id}" />
									<c:param name="tournament_type" value="${tournament.type}" />
									<c:param name="tournament_name" value="${tournament.name}" />
									<c:param name="tournament_start" value="${tournament.start}" />
									<c:param name="tournament_end" value="${tournament.end}" />
									<c:param name="tournament_country"
										value="${tournament.country}" />
									<c:param name="tournament_prize" value="${tournament.prize}" />
									<c:param name="tournament_matches"
										value="${tournament.numMatches}" />
									<c:param name="tournament_players"
										value="${tournament.players}" />
									<c:param name="tournament_current_champ"
										value="${tournament.champion}" />
								</c:url> <c:url var="playersUrl" value="/tournamentplayers.jsp">
									<c:param name="tournament_id" value="${tournament.id}" />
								</c:url> <c:url var="matchesUrl" value="/tournamentmatches.jsp">
									<c:param name="tournament_id" value="${tournament.id}" />
								</c:url>
								<p>
									<a href="${deleteUrl }" data-type="userlink">Delete
										tournament</a>
								</p>
								<p>
									<a href="${updateUrl }" data-type="userlink">Update
										tournament</a>
								</p>
								<p>
									<a href="${playersUrl}">View players</a>
								</p>
								<p>
									<a href="${matchesUrl}">View matches</a>
								</p></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</form>
		<h6 class="title-add">Add tournament:</h6>
		<form method="post" action="tournament" class="form__add">
			<table style="width: 100%" border="1">
				<tr class="first-row">
					<td>Type</td>
					<td>Name</td>
					<td>Start</td>
					<td>End</td>
					<td>Country</td>
					<td>Prize</td>
					<td>Matches</td>
					<td>Players</td>
					<td>Champion</td>
					<td>Action</td>
				</tr>
				<tr class="last-row">
					<td><select name="tournament_type" data-type="userinput"
						class="select">
							<option value="Турнір">Турнір</option>
							<option value="Чемпіонат">Чемпіонат</option>
							<option value="Олімпіада">Олімпіада</option>
					</select></td>
					<td><input type="text" data-type="userinput"
						name="tournament_name" /></td>
					<td><input type="text" data-type="userinput"
						name="tournament_start" /></td>
					<td><input type="text" data-type="userinput"
						name="tournament_end" /></td>
					<td><input type="text" data-type="userinput"
						name="tournament_country" /></td>
					<td><input type="text" data-type="userinput"
						name="tournament_prize" /></td>
					<td><input type="text" data-type="userinput"
						name="tournament_matches" /></td>
					<td><input type="text" data-type="userinput"
						name="tournament_players" /></td>
					<td><input type="text" data-type="userinput"
						name="tournament_current_champ" /></td>
					<td><input type="hidden" name="actiontype"
						value="addtournament" /> <input type="submit"
						data-type="userinput" name="addtournament" value="Add tournament" /></td>
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