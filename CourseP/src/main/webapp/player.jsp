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
<title>Player page</title>
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
		<p style="color: red;"><%=errorMessage%></p>
		<h1>Players</h1>
		<form method="post" action="player">
			<select name="field">
				<option value="id_player">Id</option>
				<option value="player_name">Player name</option>
				<option value="player_gender">Player gender</option>
				<option value="player_country">Player country</option>
				<option value="player_rate">Player rate</option>
			</select> <input type="text" name="value" placeholder="Enter search value">
			<input type="hidden" name="actiontype" value="searchplayer">
			<input type="submit" name="searchplayer" value="Search">
			<c:if test="${not empty searchResults}">
				<table style="width: 100%" border="1">
					<tr>
						<td>Id</td>
						<td>Player name</td>
						<td>Player gender</td>
						<td>Player birthday</td>
						<td>Player country</td>
						<td>Player nationality</td>
						<td>Player rate</td>
						<td>Player matches</td>
						<td>Player wins</td>
						<td>Titles</td>
						<td>Openings</td>
						<td>Tournaments</td>
						<td>Action</td>
					</tr>
					<c:forEach var="player" items="${searchResults}">
						<tr>
							<td><c:out value="${player.id}" /></td>
							<td><c:out value="${player.name}" /></td>
							<td><c:out value="${player.gender}" /></td>
							<td><c:out value="${player.birthday}" /></td>
							<td><c:out value="${player.country}" /></td>
							<td><c:out value="${player.nationality}" /></td>
							<td><c:out value="${player.rate}" /></td>
							<td><c:out value="${player.matches}" /></td>
							<td><c:out value="${player.wins}" /></td>
							<td><c:out value="${player.titleNumber}" /></td>
							<td><c:out value="${player.openingNumber}" /></td>
							<td><c:out value="${player.tournamentNumber}" /></td>
							<td><c:url var="deleteUrl" value="/deleteplayer.jsp">
									<c:param name="player_id" value="${player.id}" />
									<c:param name="player_name" value="${player.name}" />
									<c:param name="player_gender" value="${player.gender}" />
									<c:param name="player_birthday" value="${player.birthday}" />
									<c:param name="player_country" value="${player.country}" />
									<c:param name="player_nationality"
										value="${player.nationality}" />
									<c:param name="player_rate" value="${player.rate}" />
									<c:param name="player_matches" value="${player.matches}" />
									<c:param name="player_wins" value="${player.wins}" />
								</c:url> <c:url var="updateUrl" value="/updateplayer.jsp">
									<c:param name="player_id" value="${player.id}" />
									<c:param name="player_name" value="${player.name}" />
									<c:param name="player_gender" value="${player.gender}" />
									<c:param name="player_birthday" value="${player.birthday}" />
									<c:param name="player_country" value="${player.country}" />
									<c:param name="player_nationality"
										value="${player.nationality}" />
									<c:param name="player_rate" value="${player.rate}" />
									<c:param name="player_matches" value="${player.matches}" />
									<c:param name="player_wins" value="${player.wins}" />
								</c:url> <c:url var="titlesUrl" value="/playertitles.jsp">
									<c:param name="player_id" value="${player.id}" />
								</c:url> <c:url var="openingsUrl" value="/playeropenings.jsp">
									<c:param name="player_id" value="${player.id}" />
								</c:url> <c:url var="tournamentsUrl" value="/playertournaments.jsp">
									<c:param name="player_id" value="${player.id}" />
								</c:url>
								<p>
									<a href="${deleteUrl }" data-type="userlink">Delete player</a>
								</p>
								<p>
									<a href="${updateUrl }" data-type="userlink">Update player</a>
								</p>
								<p>
									<a href="${titlesUrl}">View titles</a>
								</p>
								<p>
									<a href="${openingsUrl}">View openings</a>
								</p>
								<p>
									<a href="${tournamentsUrl}">View tournaments</a>
								</p></td>
						</tr>
					</c:forEach>
					<tr>
						<td></td>
						<td><input type="text" data-type="userinput"
							name="player_name" disabled /></td>
						<td><select name="player_gender" data-type="userinput"
							disabled>
								<option value="Чоловіча">Чоловіча</option>
								<option value="Жіноча">Жіноча</option>
						</select></td>
						<td><input type="text" data-type="userinput"
							name="player_birthday" disabled /></td>
						<td><input type="text" data-type="userinput"
							name="player_country" disabled /></td>
						<td><input type="text" data-type="userinput"
							name="player_nationality" disabled /></td>
						<td><input type="text" data-type="userinput"
							name="player_rate" disabled /></td>
						<td><input type="text" data-type="userinput"
							name="player_matches" disabled /></td>
						<td><input type="text" data-type="userinput"
							name="player_wins" disabled /></td>
						<td></td>
						<td></td>
						<td></td>
						<td><input type="hidden" name="actiontype" value="addplayer" />
							<input type="submit" name="addplayer" value="Add player"
							data-type="userinput" disabled /></td>
					</tr>
				</table>
			</c:if>
			<c:if test="${empty searchResults}">
				<jsp:useBean id="PlayerListBean" class="databean.PlayerListDatabean" />
				<table style="width: 100%" border="1">
					<tr>
						<td>Id</td>
						<td>Player name</td>
						<td>Player gender</td>
						<td>Player birthday</td>
						<td>Player country</td>
						<td>Player nationality</td>
						<td>Player rate</td>
						<td>Player matches</td>
						<td>Player wins</td>
						<td>Titles</td>
						<td>Openings</td>
						<td>Tournaments</td>
						<td>Action</td>
					</tr>
					<c:forEach var="player" items="${PlayerListBean.playerList}">
						<tr>
							<td><c:out value="${player.id}" /></td>
							<td><c:out value="${player.name}" /></td>
							<td><c:out value="${player.gender}" /></td>
							<td><c:out value="${player.birthday}" /></td>
							<td><c:out value="${player.country}" /></td>
							<td><c:out value="${player.nationality}" /></td>
							<td><c:out value="${player.rate}" /></td>
							<td><c:out value="${player.matches}" /></td>
							<td><c:out value="${player.wins}" /></td>
							<td><c:out value="${player.titleNumber}" /></td>
							<td><c:out value="${player.openingNumber}" /></td>
							<td><c:out value="${player.tournamentNumber}" /></td>
							<td><c:url var="deleteUrl" value="/deleteplayer.jsp">
									<c:param name="player_id" value="${player.id}" />
									<c:param name="player_name" value="${player.name}" />
									<c:param name="player_gender" value="${player.gender}" />
									<c:param name="player_birthday" value="${player.birthday}" />
									<c:param name="player_country" value="${player.country}" />
									<c:param name="player_nationality"
										value="${player.nationality}" />
									<c:param name="player_rate" value="${player.rate}" />
									<c:param name="player_matches" value="${player.matches}" />
									<c:param name="player_wins" value="${player.wins}" />
								</c:url> <c:url var="updateUrl" value="/updateplayer.jsp">
									<c:param name="player_id" value="${player.id}" />
									<c:param name="player_name" value="${player.name}" />
									<c:param name="player_gender" value="${player.gender}" />
									<c:param name="player_birthday" value="${player.birthday}" />
									<c:param name="player_country" value="${player.country}" />
									<c:param name="player_nationality"
										value="${player.nationality}" />
									<c:param name="player_rate" value="${player.rate}" />
									<c:param name="player_matches" value="${player.matches}" />
									<c:param name="player_wins" value="${player.wins}" />
								</c:url> <c:url var="titlesUrl" value="/playertitles.jsp">
									<c:param name="player_id" value="${player.id}" />
								</c:url> <c:url var="openingsUrl" value="/playeropenings.jsp">
									<c:param name="player_id" value="${player.id}" />
								</c:url> <c:url var="tournamentsUrl" value="/playertournaments.jsp">
									<c:param name="player_id" value="${player.id}" />
								</c:url>
								<p>
									<a href="${deleteUrl }" data-type="userlink">Delete player</a>
								</p>
								<p>
									<a href="${updateUrl }" data-type="userlink">Update player</a>
								</p>
								<p>
									<a href="${titlesUrl}">View titles</a>
								</p>
								<p>
									<a href="${openingsUrl}">View openings</a>
								</p>
								<p>
									<a href="${tournamentsUrl}">View tournaments</a>
								</p></td>
						</tr>
					</c:forEach>
					<tr>
						<td></td>
						<td><input type="text" data-type="userinput"
							name="player_name" disabled /></td>
						<td><select name="player_gender" data-type="userinput"
							disabled>
								<option value="Чоловіча">Чоловіча</option>
								<option value="Жіноча">Жіноча</option>
						</select></td>
						<td><input type="text" data-type="userinput"
							name="player_birthday" disabled /></td>
						<td><input type="text" data-type="userinput"
							name="player_country" disabled /></td>
						<td><input type="text" data-type="userinput"
							name="player_nationality" disabled /></td>
						<td><input type="text" data-type="userinput"
							name="player_rate" disabled /></td>
						<td><input type="text" data-type="userinput"
							name="player_matches" disabled /></td>
						<td><input type="text" data-type="userinput"
							name="player_wins" disabled /></td>
						<td></td>
						<td></td>
						<td></td>
						<td><input type="hidden" name="actiontype" value="addplayer" />
							<input type="submit" name="addplayer" value="Add player"
							data-type="userinput" disabled /></td>
					</tr>
				</table>
			</c:if>
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