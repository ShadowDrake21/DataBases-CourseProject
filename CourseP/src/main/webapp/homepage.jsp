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
							<p class="home__content-text">Шахмати – це витончена гра, що
								вимагає стратегічного мислення та тактичної кмітливості. Кожен
								шаховий постріл розкриває величезний світ логіки та інтелекту.
								Гра складається з 64 клітинок, які створюють неповторний
								ландшафт для поєдинку розуміння та винахідливості. Кожна фігура
								має свої унікальні можливості, що робить шахи надзвичайно
								цікавими та різноманітними. Закладена в правила гри принципова
								справедливість робить шахи спрощеним дзеркалом реального життя.</p>
							<p class="home__content-text">Запам'ятовуючи кожен хід,
								гравець розвиває свою уважність та здатність передбачати
								варіанти. Шахи – це не лише спорт, але й мистецтво, де кожен
								гравець творить своє унікальне стратегічне полотно. Гра в шахи
								сприяє розвитку пам'яті, логічного мислення та самовладання,
								роблячи кожен похід глибоким внутрішнім вирішенням. Шахова дошка
								– це арена, на якій відбувається боротьба за перемогу, і вона
								завжди відкриває нові можливості для вивчення та
								самовдосконалення.</p>
						</div>

					</div>
					<div class="home__content-right">
						<div class="home__content-image__wrapper">
							<img class="home__content-image" alt="chess"
								src="https://images.chesscomfiles.com/uploads/v1/blog/390608.aaaf8196.668x375o.a6fff302ce71@2x.jpeg">
						</div>
						<div class="home__content-right__bottom">
							<p class="home__content-text">У світі шахів блищать імена
								величезних гравців, серед яких виділяється Гаррі Каспаров,
								визнаний майстром атак та генієм стратегії. Великий Анатолій
								Карпов залишає свій слід в історії гри, виграваючи світові
								чемпіонати та відзначаючись винятковим терпінням.</p>
							<p class="home__content-text">Магнус Карлсен, чемпіон світу,
								вражає своєю точністю та винахідливістю в кожній грі. Великий
								Михайло Ботвіннік відомий своєю стратегічною обдуманістю та
								величезним внеском у розвиток шахів. Василій Іванчук –
								український шаховий віртуоз, який здивовує своєю оригінальністю
								та нестандартними рішеннями.</p>
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
	<script type="text/javascript" src="./js/script.js"></script>
</body>
</html>