<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

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
<title>Update tournament</title>
</head>
<body>
<p style="color: red;"><%= errorMessage %></p>
	<p>Please update tournament fields and press Update tournament
		button or press Cancel button.</p>
	<c:url var="tournamentUrl" value="/tournament.jsp" />
	<form method="post" action="tournament">
		<input type="hidden" name="actiontype" value="updatetournament" /> <input
			type="hidden" name="tournament_id" value="${param.tournament_id }" />
		<p>
			Tournament id:
			<c:out value="${param.tournament_id }" />
		</p>
		<p>
			Tournament type: <select name="tournament_type">
				<c:choose>
					<c:when test="${param.tournament_type eq 'Турнір'}">
						<option value="Турнір" selected>Турнір</option>
						<option value="Чемпіонат">Чемпіонат</option>
						<option value="Олімпіада">Олімпіада</option>
					</c:when>
					<c:when test="${param.tournament_type eq 'Чемпіонат'}">
						<option value="Турнір">Турнір</option>
						<option value="Чемпіонат" selected>Чемпіонат</option>
						<option value="Олімпіада">Олімпіада</option>
					</c:when>
					<c:otherwise>
						<option value="Турнір">Турнір</option>
						<option value="Чемпіонат">Чемпіонат</option>
						<option value="Олімпіада" selected>Олімпіада</option>
					</c:otherwise>
				</c:choose>
			</select>
		</p>
		<p>
			Tournament name: <input type="text" name="tournament_name"
				value="${param.tournament_name }" />
		</p>
		<p>
			Tournament start: <input type="text" name="tournament_start"
				value="${param.tournament_start }" />
		</p>
		<p>
			Tournament end: <input type="text" name="tournament_end"
				value="${param.tournament_end }" />
		</p>
		<p>
			Tournament country: <input type="text" name="tournament_country"
				value="${param.tournament_country }" />
		</p>
		<p>
			Tournament prize: <input type="text" name="tournament_prize"
				value="${param.tournament_prize }" />
		</p>
		<p>
			Tournament number of matches: <input type="text"
				name="tournament_matches" value="${param.tournament_matches }" />
		</p>
		<p>
			Tournament number of players: <input type="text"
				name="tournament_players" value="${param.tournament_players }" />
		</p>
		<p>
			Tournament winner: <input type="text" name="tournament_current_champ"
				value="${param.tournament_current_champ }" />
		</p>
		<input type="submit" name="updatetournament" value="Update tournament" />
		<input type="button" onClick="window.location.href='${tournamentUrl}'"
			value="Cancel" />
	</form>
</body>
</html>