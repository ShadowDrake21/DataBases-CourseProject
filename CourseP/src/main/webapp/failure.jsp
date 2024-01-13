<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Failure</title>
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
#progress-bar-container {
	width: 100%;
	height: 30px;
	position: relative;
}

#progress-bar {
	width: 0%;
	height: 100%;
	background-color: #4CAF50;
	position: absolute;
	top: 0;
	left: 0;
	transition: width 1s linear;
}

#percentage-label {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
}
</style>
<script>
	function redirectToLoginpage() {
		var progressBar = document.getElementById("progress-bar");
		var percentageLabel = document.getElementById("percentage-label");
		var startTime = new Date().getTime();
		var duration = 5000; 
		
		var intervalId = setInterval(function() {
			var currentTime = new Date().getTime();
			var elapsedTime = currentTime - startTime;
			var progress = (elapsedTime / duration) * 100;

			progressBar.style.width = progress + "%";
			percentageLabel.textContent = Math.round(progress) + "%";

			if (elapsedTime >= duration) {
				clearInterval(intervalId);
				window.location.href = "login.jsp";
			}
		}, 50);
	}

	window.onload = function() {
		redirectToLoginpage();
	};
</script>
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
			</div>
		</nav>
	</header>
	<main class="main">
	<div style="position: absolute; top: 50%; left: 50%; transform: translateX(-50%) translateY(-50%); width: 750px;'">
		<h2 style="text-align: center; margin-bottom: 25px;">Login Failed. Please check your credentials.</h2>
		<div id="progress-bar-container">
			<div id="progress-bar"></div>
			<div id="percentage-label" style="color: black;">0%</div>
		</div>
		</div>
	</main>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>