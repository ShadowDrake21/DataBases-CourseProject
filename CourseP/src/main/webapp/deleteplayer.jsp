<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete player</title>
</head>
<body>
	<p>Below player will be deleted:</p>
	<p>Player id ${param.playerid}</p>
	<p>Player name ${param.playername}</p>
	<p>Player gender ${param.playergender}</p>
	<p>Player birthday ${param.playerbirthday}</p>
	<p>Player country ${param.playercountry}</p>
	<p>Player nationality ${param.playernationality}</p>
	<p>Player rate ${param.playerrate}</p>
	<p>Player matches ${param.playermatches}</p>
	<p>Player wins ${param.playerwins}</p>
	<p>Could you please confirm?</p>
	<c:url var="playerUrl" value="/player.jsp" />
	<form method="post" action="player">
		<input type="hidden" name="actiontype" value="deleteplayer" /> <input
			type="hidden" name="player_id" value="${param.playerid }" /> <input
			type="submit" name="deleteplayer" value="Delete player" /> <input
			type="button" onclick="window.location.href='${playerUrl}'"
			value="Cancel" />
	</form>
</body>
</html>