<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Player page</title>
</head>
<body>
	<jsp:useBean id="PlayerListBean" class="databean.PlayerListDatabean" />
	<h1>Player page</h1>
	<form method="post" action="player">
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
							<c:param name="player_nationality" value="${player.nationality}" />
							<c:param name="player_rate" value="${player.rate}" />
							<c:param name="player_matches" value="${player.matches}" />
							<c:param name="player_wins" value="${player.wins}" />
						</c:url> <c:url var="updateUrl" value="/updateplayer.jsp">
							<c:param name="player_id" value="${player.id}" />
							<c:param name="player_name" value="${player.name}" />
							<c:param name="player_gender" value="${player.gender}" />
							<c:param name="player_birthday" value="${player.birthday}" />
							<c:param name="player_country" value="${player.country}" />
							<c:param name="player_nationality" value="${player.nationality}" />
							<c:param name="player_rate" value="${player.rate}" />
							<c:param name="player_matches" value="${player.matches}" />
							<c:param name="player_wins" value="${player.wins}" />
						</c:url> <c:url var="titlesUrl" value="/playertitles.jsp">
							<c:param name="player_id" value="${player.id}" />
						</c:url>
						<p>
							<a href="${deleteUrl }">Delete player</a>
						</p>
						<p>
							<a href="${updateUrl }">Update player</a>
						</p>
						<p>
							<a href="${titlesUrl}">View titles</a>
						</p>
						<%-- <p>
							<a href="${openingsUrl}">View openings</a>
						</p> --%>
						</td>
				</tr>
			</c:forEach>
			<tr>
				<td></td>
				<td><input type="text" name="player_name" /></td>
				<td><select name="player_gender">
						<option value="Чоловіча">Чоловіча</option>
						<option value="Жіноча">Жіноча</option>
				</select></td>
				<td><input type="text" name="player_birthday" /></td>
				<td><input type="text" name="player_country" /></td>
				<td><input type="text" name="player_nationality" /></td>
				<td><input type="text" name="player_rate" /></td>
				<td><input type="text" name="player_matches" /></td>
				<td><input type="text" name="player_wins" /></td>
				<td></td>
				<td></td>
				<td></td>
				<td><input type="hidden" name="actiontype" value="addplayer" />
					<input type="submit" name="addplayer" value="Add player" /></td>
			</tr>
		</table>
	</form>
</body>
</html>