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
<title>Opening page</title>
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
		<p class="error-message"><%=errorMessage%></p>
		<h1 class="page__title">Openings</h1>
		<form method="post" action="opening">
			<div style="margin-bottom: 15px;">
				<select name="field">
					<option value="id_opening">Id</option>
					<option value="opening_name">Opening name</option>
					<option value="opening_category">Opening category</option>
					<option value="opening_year">Opening year</option>
					<option value="opening_famous_player">Famous player</option>
				</select> <input type="text" name="value" placeholder="Enter search value">
				<input type="hidden" name="actiontype" value="searchopening">
				<input type="submit" name="searchopening" value="Search">
			</div>
			<c:if test="${not empty searchResults}">
				<table style="width: 100%" border="1">
					<tr class="first-row">
						<td>Id</td>
						<td>Name</td>
						<td>Category</td>
						<td>Year</td>
						<td>Famous player</td>
						<td>Action</td>
					</tr>
					<c:forEach var="opening" items="${searchResults}">
						<tr>
							<td><c:out value="${opening.id}" /></td>
							<td><c:out value="${opening.name}" /></td>
							<td><c:out value="${opening.category}" /></td>
							<td><c:out value="${opening.year}" /></td>
							<td><c:out value="${opening.player}" /></td>
							<td><c:url var="deleteUrl" value="/deleteopening.jsp">
									<c:param name="id_opening" value="${opening.id}" />
									<c:param name="opening_name" value="${opening.name}" />
									<c:param name="opening_category" value="${opening.category}" />
									<c:param name="opening_year" value="${opening.year}" />
									<c:param name="famous_player" value="${opening.player}" />
								</c:url> <c:url var="updateUrl" value="/updateopening.jsp">
									<c:param name="id_opening" value="${opening.id}" />
									<c:param name="opening_name" value="${opening.name}" />
									<c:param name="opening_category" value="${opening.category}" />
									<c:param name="opening_year" value="${opening.year}" />
									<c:param name="famous_player" value="${opening.player}" />
								</c:url> <c:url var="playersUrl" value="/openingplayers.jsp">
									<c:param name="opening_id" value="${opening.id}" />
								</c:url>
								<p>
									<a href="${deleteUrl }" data-type="userlink">Delete opening</a>
								</p>
								<p>
									<a href="${updateUrl }" data-type="userlink">Update opening</a>
								</p>
								<p>
									<a href="${playersUrl }">View players</a>
								</p></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${empty searchResults}">
				<jsp:useBean id="OpeningListBean"
					class="databean.OpeningListDatabean" />
				<table style="width: 100%" border="1">
					<tr class="first-row">
						<td>Id</td>
						<td>Name</td>
						<td>Category</td>
						<td>Year</td>
						<td>Famous player</td>
						<td>Action</td>
					</tr>
					<c:forEach var="opening" items="${OpeningListBean.openingList}">
						<tr>
							<td><c:out value="${opening.id}" /></td>
							<td><c:out value="${opening.name}" /></td>
							<td><c:out value="${opening.category}" /></td>
							<td><c:out value="${opening.year}" /></td>
							<td><c:out value="${opening.player}" /></td>
							<td><c:url var="deleteUrl" value="/deleteopening.jsp">
									<c:param name="id_opening" value="${opening.id}" />
									<c:param name="opening_name" value="${opening.name}" />
									<c:param name="opening_category" value="${opening.category}" />
									<c:param name="opening_year" value="${opening.year}" />
									<c:param name="famous_player" value="${opening.player}" />
								</c:url> <c:url var="updateUrl" value="/updateopening.jsp">
									<c:param name="id_opening" value="${opening.id}" />
									<c:param name="opening_name" value="${opening.name}" />
									<c:param name="opening_category" value="${opening.category}" />
									<c:param name="opening_year" value="${opening.year}" />
									<c:param name="famous_player" value="${opening.player}" />
								</c:url> <c:url var="playersUrl" value="/openingplayers.jsp">
									<c:param name="opening_id" value="${opening.id}" />
								</c:url>
								<p>
									<a href="${deleteUrl }" data-type="userlink">Delete opening</a>
								</p>
								<p>
									<a href="${updateUrl }" data-type="userlink">Update opening</a>
								</p>
								<p>
									<a href="${playersUrl }">View players</a>
								</p></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</form>
		<h6 class="title-add">Add opening:</h6>
		<form method="post" action="opening" class="form__add">
			<table style="width: 100%" border="1">
				<tr class="first-row">
					<td>Name</td>
					<td>Category</td>
					<td>Year</td>
					<td>Famous player</td>
					<td>Action</td>
				</tr>
				<tr class="last-row">
					<td><input type="text" data-type="userinput"
						name="opening_name" placeholder="Name" /></td>
					<td><select name="opening_category" data-type="userinput"
						class="select">
							<option value="Відкритий">Відкритий</option>
							<option value="Напіввідкритий">Напіввідкритий</option>
							<option value="Закритий">Закритий</option>
							<option value="Фланговий">Фланговий</option>
					</select></td>
					<td><input type="text" data-type="userinput"
						name="opening_year" placeholder="Year" /></td>
					<td><input type="text" data-type="userinput"
						name="famous_player" placeholder="Famous player" /></td>
					<td><input type="hidden" name="actiontype" value="addopening" />
						<input type="submit" data-type="userinput" name="addopening"
						value="Add opening" /></td>
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