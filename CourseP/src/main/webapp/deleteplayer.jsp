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
	<p>Player id: ${param.player_id}</p>
	<p>Player name: ${param.player_name}</p>
	<p>Player gender: ${param.player_gender}</p>
	<p>Player birthday: ${param.player_birthday}</p>
	<p>Player country: ${param.player_country}</p>
	<p>Player nationality: ${param.player_nationality}</p>
	<p>Player rate: ${param.player_rate}</p>
	<p>Player matches: ${param.player_matches}</p>
	<p>Player wins: ${param.player_wins}</p>
	<p>Could you please confirm?</p>
	<c:url var="playerUrl" value="/player.jsp" />
	<form method="post" action="player">
		<input type="hidden" name="actiontype" value="deleteplayer" /> <input
			type="hidden" name="player_id" value="${param.player_id }" /> <input
			type="submit" name="deleteplayer" value="Delete player" /> <input
			type="button" onclick="window.location.href='${playerUrl}'"
			value="Cancel" />
	</form>
</body>
</html>