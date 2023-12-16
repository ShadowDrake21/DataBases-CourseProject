<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update match</title>
</head>
<body>
	<p>Please update match fields and press Update match button or
		press Cancel button.</p>
	<c:url var="matchUrl" value="/match.jsp/" />
	<form method="post" action="match">
		<input type="hidden" name="actiontype" value="updatematch" /> <input
			type="hidden" name="id_match" value="${param.id_match }" />
		<p>
			Match id:
			<c:out value="${param.id_opening }" />
		</p>
		<p>
			Tournament id: <input type="text" name="id_tournament"
				value="${param.id_tournament }" />
		</p>
		<p>
			Player 1: <input type="text" name="match_player"
				value="${param.match_player }" />
		</p>
		<p>
			Player 2: <input type="text" name="match_opponent"
				value="${param.match_opponent }" />
		</p>
		<p>
			Match date: <input type="text" name="match_date"
				value="${param.match_date }" />
		</p>
		<p>
			Score player 1: <select name="match_score_1">
				<c:choose>
					<c:when test="${param.match_score_1 eq '0'}">
						<option value="0" selected>0</option>
						<option value="0.5">0.5</option>
						<option value="1">1</option>
					</c:when>
					<c:when test="${param.match_score_1 eq '0.5'}">
						<option value="0">0</option>
						<option value="0.5" selected>0.5</option>
						<option value="1">1</option>
					</c:when>
					<c:otherwise>
						<option value="0">0</option>
						<option value="0.5">0.5</option>
						<option value="1" selected>1</option>
					</c:otherwise>
				</c:choose>
			</select>
		</p>
		<p>
			Score player 2: <select name="match_score_2">
				<c:choose>
					<c:when test="${param.match_score_2 eq '0'}">
						<option value="0" selected>0</option>
						<option value="0.5">0.5</option>
						<option value="1">1</option>
					</c:when>
					<c:when test="${param.match_score_2 eq '0.5'}">
						<option value="0">0</option>
						<option value="0.5" selected>0.5</option>
						<option value="1">1</option>
					</c:when>
					<c:otherwise>
						<option value="0">0</option>
						<option value="0.5">0.5</option>
						<option value="1" selected>1</option>
					</c:otherwise>
				</c:choose>
			</select>
		</p>
		<input type="submit" name="updatematch" value="Update match" /> <input
			type="button" onClick="window.location.href='${matchUrl}'"
			value="Cancel" />
	</form>
</body>
</html>