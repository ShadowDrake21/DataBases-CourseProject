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
<title>Opening Usage page</title>
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
		<p style="color: red;"><%=errorMessage%></p>
		<h1 class="page__title">Opening Usages</h1>
		<form method="post" action="openingusage">
			<div style="margin-bottom: 15px;">
				<select name="field">
					<option value="id_opening_usage">Opening usage id</option>
					<option value="id_opening">Opening id</option>
					<option value="id_player">Player id</option>
				</select> <input type="text" name="value" placeholder="Enter search value">
				<input type="hidden" name="actiontype" value="searchopeningusage">
				<input type="submit" name="searchopeningusage" value="Search">
			</div>
			<c:if test="${not empty searchResults}">
				<table style="width: 100%" border="1">
					<tr class="first-row">
						<td>Opening Usage id</td>
						<td>Opening id</td>
						<td>Opening name</td>
						<td>Player id</td>
						<td>Player name</td>
						<td>Points</td>
						<td>Action</td>
					</tr>
					<c:forEach var="openingUsage" items="${searchResults}">
						<tr>
							<td><c:out value="${openingUsage.id}" /></td>
							<td><c:out value="${openingUsage.idOpening}" /></td>
							<td><c:out value="${openingUsage.openingName}" /></td>
							<td><c:out value="${openingUsage.idPlayer}" /></td>
							<td><c:out value="${openingUsage.playerName}" /></td>
							<td><c:out value="${openingUsage.points}" /></td>
							<td><c:url var="deleteUrl" value="/deleteopenusage.jsp">
									<c:param name="id_opening_usage" value="${openingUsage.id}" />
									<c:param name="id_opening" value="${openingUsage.idOpening}" />
									<c:param name="id_player" value="${openingUsage.idPlayer}" />
									<c:param name="usage_points" value="${openingUsage.points}" />
								</c:url> <c:url var="updateUrl" value="/updateopenusage.jsp">
									<c:param name="id_opening_usage" value="${openingUsage.id}" />
									<c:param name="id_opening" value="${openingUsage.idOpening}" />
									<c:param name="id_player" value="${openingUsage.idPlayer}" />
									<c:param name="usage_points" value="${openingUsage.points}" />
								</c:url>
								<p>
									<a href="${deleteUrl }" data-type="userlink">Delete Opening
										Usage</a>
								</p>
								<p>
									<a href="${updateUrl }" data-type="userlink">Update Opening
										Usage</a>
								</p></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${empty searchResults}">
				<jsp:useBean id="OpeningUsageListBean"
					class="databean.OpeningUsageListDatabean" />
				<table style="width: 100%" border="1">
					<tr class="first-row">
						<td>Opening Usage id</td>
						<td>Opening id</td>
						<td>Opening name</td>
						<td>Player id</td>
						<td>Player name</td>
						<td>Points</td>
						<td>Action</td>
					</tr>
					<c:forEach var="openingUsage"
						items="${OpeningUsageListBean.openingUsageList}">
						<tr>
							<td><c:out value="${openingUsage.id}" /></td>
							<td><c:out value="${openingUsage.idOpening}" /></td>
							<td><c:out value="${openingUsage.openingName}" /></td>
							<td><c:out value="${openingUsage.idPlayer}" /></td>
							<td><c:out value="${openingUsage.playerName}" /></td>
							<td><c:out value="${openingUsage.points}" /></td>
							<td><c:url var="deleteUrl" value="/deleteopenusage.jsp">
									<c:param name="id_opening_usage" value="${openingUsage.id}" />
									<c:param name="id_opening" value="${openingUsage.idOpening}" />
									<c:param name="id_player" value="${openingUsage.idPlayer}" />
									<c:param name="usage_points" value="${openingUsage.points}" />
								</c:url> <c:url var="updateUrl" value="/updateopenusage.jsp">
									<c:param name="id_opening_usage" value="${openingUsage.id}" />
									<c:param name="id_opening" value="${openingUsage.idOpening}" />
									<c:param name="id_player" value="${openingUsage.idPlayer}" />
									<c:param name="usage_points" value="${openingUsage.points}" />
								</c:url>
								<p>
									<a href="${deleteUrl }" data-type="userlink">Delete Opening
										Usage</a>
								</p>
								<p>
									<a href="${updateUrl }" data-type="userlink">Update Opening
										Usage</a>
								</p></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</form>
		<h6 class="title-add">Add opening usage:</h6>
		<form method="post" action="openingusage" class="form__add">
			<table style="width: 100%" border="1">
				<tr class="first-row">
					<td>Opening id</td>
					<td>Player id</td>
					<td>Points</td>
					<td>Action</td>
				</tr>
				<tr class="last-row">
					<td><input type="text" data-type="userinput" name="id_opening" /></td>
					<td><input type="text" data-type="userinput" name="id_player" /></td>
					<td><input type="text" data-type="userinput"
						name="usage_points" /></td>
					<td><input type="hidden" name="actiontype"
						value="addopeningusage" /> <input type="submit"
						data-type="userinput" name="addopeningusage"
						value="Add Opening Usage" /></td>
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