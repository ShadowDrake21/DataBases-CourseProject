<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete tournament</title>
</head>
<body>
	<p>Below tournament will be deleted:</p>
	<p>Tournament id: ${param.tournament_id }</p>
	<p>Tournament type: ${param.tournament_type }</p>
	<p>Tournament name: ${param.tournament_name }</p>
	<p>Tournament start: ${param.tournament_start }</p>
	<p>Tournament end: ${param.tournament_end }</p>
	<p>Tournament country: ${param.tournament_country }</p>
	<p>Tournament prize: ${param.tournament_prize }</p>
	<p>Tournament number of matches: ${param.tournament_matches }</p>
	<p>Tournament number of players: ${param.tournament_players }</p>
	<p>Tournament winner: ${param.tournament_current_champ }</p>
	<p>Could you please confirm?</p>
	<c:url var="tournamentUrl" value="/tournament.jsp" />
	<form method="post" action="tournament">
		<input type="hidden" name="actiontype" value="deletetournament" /> <input
			type="hidden" name="tournament_id" value="${param.tournament_id }" />
		<input type="submit" name="deletetournament" value="Delete tournament" />
		<input type="button" onclick="window.location.href='${tournamentUrl}'"
			value="Cancel" />
	</form>
</body>
</html>