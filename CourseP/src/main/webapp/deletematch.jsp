<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete match</title>
</head>
<body>
	<p>Below match will be deleted:</p>
	<p>Match id: ${param.id_match}</p>
	<p>Tournament id: ${param.id_tournament}</p>
	<p>Player 1: ${param.match_player}</p>
	<p>Player 2: ${param.match_opponent}</p>
	<p>Match date: ${param.match_date}</p>
	<p>Score P1: ${param.match_score_1}</p>
	<p>Score P2: ${param.match_score_2}</p>
	<p>Could you please confirm?</p>
	<c:url var="matchUrl" value="/match.jsp" />
	<form method="post" action="match">
		<input type="hidden" name="actiontype" value="deletematch" /> <input
			type="hidden" name="id_match" value="${param.id_match }" /> <input
			type="submit" name="deletematch" value="Delete match" /> <input
			type="button" onclick="window.location.href='${matchUrl}'"
			value="Cancel" />
	</form>
</body>
</html>