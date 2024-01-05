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
<title>Update player</title>
</head>
<body>
	<p style="color: red;"><%=errorMessage%></p>
	<p>Please update player fields and press Update player button or
		press Cancel button.</p>
	<c:url var="playerUrl" value="/player.jsp" />
	<form method="post" action="player">
		<input type="hidden" name="actiontype" value="updateplayer" /> <input
			type="hidden" name="player_id" value="${param.player_id }" />
		<p>
			Player id:
			<c:out value="${param.player_id }" />
		</p>
		<p>
			Player name: <input type="text" name="player_name"
				value="${param.player_name }" />
		</p>
		<p>
			Player gender: <select name="player_gender">
				<c:choose>
					<c:when test="${param.player_gender eq 'Чоловіча'}">
						<option value="Чоловіча" selected>Чоловіча</option>
						<option value="Жіноча">Жіноча</option>
					</c:when>
					<c:otherwise>
						<option value="Чоловіча">Чоловіча</option>
						<option value="Жіноча" selected>Жіноча</option>
					</c:otherwise>
				</c:choose>
			</select>
		</p>
		<p>
			Player birthday: <input type="text" name="player_birthday"
				value="${param.player_birthday }" />
		</p>
		<p>
			Player country: <input type="text" name="player_country"
				value="${param.player_country }" />
		</p>
		<p>
			Player nationality: <input type="text" name="player_nationality"
				value="${param.player_nationality }" />
		</p>
		<p>
			Player rate: <input type="text" name="player_rate"
				value="${param.player_rate }" />
		</p>
		<p>
			Player matches: <input type="text" name="player_matches"
				value="${param.player_matches }" />
		</p>
		<p>
			Player wins: <input type="text" name="player_wins"
				value="${param.player_wins }" />
		</p>
		<input type="submit" name="updateplayer" value="Update player" /> <input
			type="button" onClick="window.location.href='${playerUrl}'"
			value="Cancel" />
	</form>
</body>
</html>