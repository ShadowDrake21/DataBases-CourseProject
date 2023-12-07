<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1251">
<title>Update player</title>
</head>
<body>
	<p>Please update player fields and press Update player button or
		press Cancel button.</p>
	<c:url var="playerUrl" value="/player.jsp/" />
	<form method="post" action="player">
		<input type="hidden" name="actiontype" value="updateplayer" /> <input
			type="hidden" name="player_id" value="${param.playerid }" />
		<p>
			Player id:
			<c:out value="${param.playerid }" />
		</p>
		<p>
			Player name: <input type="text" name="player_name"
				value="${param.playername }" />
		</p>
		<p>
			Player gender: <input type="text" name="player_gender"
				value="${param.playergender }" />
		</p>
		<p>
			Player birthday: <input type="text" name="player_birthday"
				value="${param.playerbirthday }" />
		</p>
		<p>
			Player country: <input type="text" name="player_country"
				value="${param.playercountry }" />
		</p>
		<p>
			Player nationality: <input type="text" name="player_nationality"
				value="${param.playernationality }" />
		</p>
		<p>
			Player rate: <input type="text" name="player_rate"
				value="${param.playerrate }" />
		</p>
		<p>
			Player matches: <input type="text" name="player_matches"
				value="${param.playermatches }" />
		</p>
		<p>
			Player wins: <input type="text" name="player_wins"
				value="${param.playerwins }" />
		</p>
		<input type="submit" name="updateplayer" value="Update player" /> <input
			type="button" onClick="window.location.href='${playerUrl}'"
			value="Cancel" />
	</form>
</body>
</html>