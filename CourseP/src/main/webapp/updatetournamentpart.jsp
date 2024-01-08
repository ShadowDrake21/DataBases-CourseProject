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
<title>Update tournament participation</title>
</head>
<body>
<p class="error-message"><%=errorMessage%></p>
	<p>Please update tournament participation fields and press Update tournament participation button or
		press Cancel button.</p>
	<c:url var="tournamentpartUrl" value="/tournamentpart.jsp" />
	<form method="post" action="tournamentpart">
		<input type="hidden" name="actiontype" value="updatetournamentpart" /> <input
			type="hidden" name="tournament_part_id" value="${param.tournament_part_id }" />
		<p>
			Tournament participation id:
			<c:out value="${param.tournament_part_id }" />
		</p>
		<p>
			Player id: <input type="text" name="id_player"
				value="${param.id_player }" />
		</p>
		<p>
			Tournament id: <input type="text" name="id_tournament"
				value="${param.id_tournament }" />
		</p>
		<p>
			Registration date: <input type="text" name="registration"
				value="${param.registration }" />
		</p>
		<p>
			Place: <input type="text" name="place"
				value="${param.place }" />
		</p>
		<input type="submit" name="updatetournamentpart" value="Update tournament participation" /> <input
			type="button" onClick="window.location.href='${tournamentpartUrl}'"
			value="Cancel" />
	</form>
</body>
</html>