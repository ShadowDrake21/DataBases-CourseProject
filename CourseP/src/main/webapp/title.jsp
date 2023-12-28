<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title page</title>
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<jsp:useBean id="TitleListBean" class="databean.TitleListDatabean" />
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
	<form method="post" action="title">
		<table style="width: 100%" border="1">
			<tr>
				<td>Id</td>
				<td>Title name</td>
				<td>Title year</td>
				<td>Player id</td>
				<td>Player name</td>
				<td>Action</td>
			</tr>
			<c:forEach var="title" items="${TitleListBean.titleList}">
				<tr>
					<td><c:out value="${title.id}" /></td>
					<td><c:out value="${title.name}" /></td>
					<td><c:out value="${title.year}" /></td>
					<td><c:out value="${title.idPlayer}" /></td>
					<td><c:out value="${title.playerName}" /></td>
					<td><c:url var="deleteUrl" value="/deletetitle.jsp">
							<c:param name="title_id" value="${title.id}" />
							<c:param name="title_name" value="${title.name}" />
							<c:param name="title_year" value="${title.year}" />
							<c:param name="id_player" value="${title.idPlayer}" />
						</c:url> <c:url var="updateUrl" value="/updatetitle.jsp">
							<c:param name="title_id" value="${title.id}" />
							<c:param name="title_name" value="${title.name}" />
							<c:param name="title_year" value="${title.year}" />
							<c:param name="id_player" value="${title.idPlayer}" />
						</c:url>
						<p>
							<a href="${deleteUrl }">Delete title</a>
						</p>
						<p>
							<a href="${updateUrl }">Update title</a>
						</p></td>
				</tr>
			</c:forEach>
			<tr>
				<td></td>
				<td><input type="text" data-type="userinput" name="title_name" /></td>
				<td><input type="text" data-type="userinput" name="title_year" /></td>
				<td><input type="text" data-type="userinput" name="id_player" /></td>
				<td></td>
				<td><input type="hidden" name="actiontype" value="addtitle" />
					<input type="submit" data-type="userinput" name="addtitle" value="Add title" /></td>
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