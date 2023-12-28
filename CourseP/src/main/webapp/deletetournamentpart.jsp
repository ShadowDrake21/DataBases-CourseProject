<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete tournament participation</title>
</head>
<body>
	<p>Below tournament participation will be deleted:</p>
	<p>Tournament participation id: ${param.tournament_part_id}</p>
	<p>Player id: ${param.id_player}</p>
	<p>Tournament id: ${param.id_tournament}</p>
	<p>Registration date: ${param.registration}</p>
	<p>Place: ${param.place}</p>
	<p>Could you please confirm?</p>
	<c:url var="tournamentpartUrl" value="/tournamentpart.jsp" />
	<form method="post" action="tournamentpart">
		<input type="hidden" name="actiontype" value="deletetournamentpart" /> <input
			type="hidden" name="tournament_part_id" value="${param.tournament_part_id }" /> <input
			type="submit" name="deletetournamentpart" value="Delete tournament participation" /> <input
			type="button" onclick="window.location.href='${tournamentpartUrl}'"
			value="Cancel" />
	</form>
</body>
</html>