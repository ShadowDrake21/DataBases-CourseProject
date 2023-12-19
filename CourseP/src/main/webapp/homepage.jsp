<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="ISO-8859-1">
<title>Home Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

<link href="css/style.css" rel="stylesheet">
</head>
<body style="font-size: 16px; line-height: 22px; height: 100%;">
	<header>
		<nav class="position-absolute w-100 bg-secondary"
			style="height: 100px; top: 0;"></nav>
	</header>
	<main style="padding: 100px; min-height: 100vh;">
		<section style="padding-top: 50px;">
			<div class="container"
				style="max-width: 1470px; margin: 0 auto; padding: 0 10px;">
				<div
					style="display: flex; justify-content: space-between; gap: 50px;">
					<div
						style="width: 35%; max-width: 100%; display: flex; flex-direction: column; gap: 50px;">
						<ul class="list-unstyled" style="color: #000; text-align: center;">
							<li style="margin-bottom: 10px;"><a href="player.jsp"
								style="color: inherit; text-decoration: none; padding: 10px 20px; display: inline-block; background-color: #eee; width: 100%;">Player</a></li>
							<li style="margin-bottom: 10px;"><a href="title.jsp"
								style="color: inherit; text-decoration: none; padding: 10px 20px; display: inline-block; background-color: #eee; width: 100%;">Title</a></li>
							<li style="margin-bottom: 10px;"><a href="openingusage.jsp"
								style="color: inherit; text-decoration: none; padding: 10px 20px; display: inline-block; background-color: #eee; width: 100%;">Opening Usage</a></li>
							<li style="margin-bottom: 10px;"><a href="opening.jsp"
								style="color: inherit; text-decoration: none; padding: 10px 20px; display: inline-block; background-color: #eee; width: 100%;">Opening</a></li>
							<li style="margin-bottom: 10px;"><a href="tournamentpart.jsp"
								style="color: inherit; text-decoration: none; padding: 10px 20px; display: inline-block; background-color: #eee; width: 100%;">Tournament
									Participation</a></li>
							<li style="margin-bottom: 10px;"><a href="tournament.jsp"
								style="color: inherit; text-decoration: none; padding: 10px 20px; display: inline-block; background-color: #eee; width: 100%;">Tournament</a></li>
							<li style="margin-bottom: 10px;"><a href="match.jsp"
								style="color: inherit; text-decoration: none; padding: 10px 20px; display: inline-block; background-color: #eee; width: 100%;">Match</a></li>
						</ul>
						<div style="text-align: center;">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Aenean eu tortor a odio mattis pulvinar. Phasellus consectetur
								commodo nisl ut vulputate. Nulla non sem enim. Etiam euismod
								lectus a luctus tempus. Cras magna dolor, tempor nec convallis
								a, consequat quis enim.</p>
							<p>Quisque a mollis lorem, in dignissim lectus. Fusce quis
								urna ornare, ultrices tortor vel, consequat risus. In hac
								habitasse platea dictumst. Vestibulum ante ipsum primis in
								faucibus orci luctus et ultrices posuere cubilia curae; Nunc
								ultricies odio vitae mi porttitor, nec viverra orci accumsan.
								Aliquam nec nisl non odio consectetur pretium.</p>
						</div>
					</div>
					<div style="width: 65%; max-width: 100%;">
						<div style="display: flex; justify-content: center;">
							<img alt=""
								src="https://images.chesscomfiles.com/uploads/v1/blog/390608.aaaf8196.668x375o.a6fff302ce71@2x.jpeg"
								style="max-width: 75%;">
						</div>
						<div style="margin-top: 50px; text-align: center;">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Aenean eu tortor a odio mattis pulvinar. Phasellus consectetur
								commodo nisl ut vulputate. Nulla non sem enim. Etiam euismod
								lectus a luctus tempus. Cras magna dolor, tempor nec convallis
								a, consequat quis enim.</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Aenean eu tortor a odio mattis pulvinar. Phasellus consectetur
								commodo nisl ut vulputate. Nulla non sem enim. Etiam euismod
								lectus a luctus tempus. Cras magna dolor, tempor nec convallis
								a, consequat quis enim.</p>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<footer class=" w-100 bg-secondary"
			style="height: 100px; margin-top: -100px;"></footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>