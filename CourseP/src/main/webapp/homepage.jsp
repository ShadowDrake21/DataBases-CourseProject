<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="ISO-8859-1">
<title>Home Page</title>
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script>
    // Function to handle logout and clear localStorage
    function logout() {
        // Clear localStorage
        localStorage.clear();

        // Redirect to the LogoutServlet
        window.location.href = "logout";
    }
</script>
</head>
<body class="body">
	<header class="header">
		<nav class="navbar navbar-expand-lg navbar-light" >
			<a class="navbar-brand nav__item" href="homepage.jsp">Project</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link nav__item" href="title.jsp">Посилання
							1</a></li>
					<li class="nav-item"><a class="nav-link nav__item" href="#">Посилання
							2</a></li>
					<li class="nav-item"><a class="nav-link nav__item" href="#">Посилання
							3</a></li>
					<li class="nav-item"><a class="nav-link nav__item" href="#">Посилання
							4</a></li>
					<li class="nav-item"><a class="nav-link nav__item" href="#">Посилання
							5</a></li>
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
						<button type="button" class="btn btn-primary ml-2"
							onclick="location.href='login.jsp'">Login</button>
					</li>
					<li class="nav-item">
						<button type="button" class="btn btn-danger ml-2"
							onclick="logout()">Logout</button>
					</li>
				</ul>
			</div>
		</nav>
	</header>
	<main class="main">
		<section class="home">
			<div class="home__container">
				<div class="home__top">
					<h1 class="home__title">Курсовий проект з дисципліни "Бази
						даних": "Шахи"</h1>
				</div>
				<div class="home__content">
					<div class="home__content-left">
						<ul class="home__navbar">
							<li class="home__navbar-item"><a class="home__navbar-link"
								href="player.jsp">Player</a></li>
							<li class="home__navbar-item"><a class="home__navbar-link"
								href="title.jsp">Title</a></li>
							<li class="home__navbar-item"><a class="home__navbar-link"
								href="openingusage.jsp">Opening Usage</a></li>
							<li class="home__navbar-item"><a class="home__navbar-link"
								href="opening.jsp">Opening</a></li>
							<li class="home__navbar-item"><a class="home__navbar-link"
								href="tournamentpart.jsp">Tournament Participation</a></li>
							<li class="home__navbar-item"><a class="home__navbar-link"
								href="tournament.jsp">Tournament</a></li>
							<li class="home__navbar-item"><a class="home__navbar-link"
								href="match.jsp">Match</a></li>
						</ul>
						<div class="home__content-left__bottom">
							<p class="home__content-text">Lorem ipsum dolor sit amet,
								consectetur adipiscing elit. Aenean eu tortor a odio mattis
								pulvinar. Phasellus consectetur commodo nisl ut vulputate. Nulla
								non sem enim. Etiam euismod lectus a luctus tempus. Cras magna
								dolor, tempor nec convallis a, consequat quis enim.</p>
							<p class="home__content-text">Quisque a mollis lorem, in
								dignissim lectus. Fusce quis urna ornare, ultrices tortor vel,
								consequat risus. In hac habitasse platea dictumst. Vestibulum
								ante ipsum primis in faucibus orci luctus et ultrices posuere
								cubilia curae; Nunc ultricies odio vitae mi porttitor, nec
								viverra orci accumsan. Aliquam nec nisl non odio consectetur
								pretium.</p>
						</div>
					</div>
					<div class="home__content-right">
						<div class="home__content-image__wrapper">
							<img class="home__content-image" alt="chess"
								src="https://images.chesscomfiles.com/uploads/v1/blog/390608.aaaf8196.668x375o.a6fff302ce71@2x.jpeg">
						</div>
						<div class="home__content-right__bottom">
							<p class="home__content-text">Lorem ipsum dolor sit amet,
								consectetur adipiscing elit. Aenean eu tortor a odio mattis
								pulvinar. Phasellus consectetur commodo nisl ut vulputate. Nulla
								non sem enim. Etiam euismod lectus a luctus tempus. Cras magna
								dolor, tempor nec convallis a, consequat quis enim.</p>
							<p class="home__content-text">Lorem ipsum dolor sit amet,
								consectetur adipiscing elit. Aenean eu tortor a odio mattis
								pulvinar. Phasellus consectetur commodo nisl ut vulputate. Nulla
								non sem enim. Etiam euismod lectus a luctus tempus. Cras magna
								dolor, tempor nec convallis a, consequat quis enim.</p>
						</div>
					</div>
				</div>
			</div>
		</section>
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
</body>
</html>