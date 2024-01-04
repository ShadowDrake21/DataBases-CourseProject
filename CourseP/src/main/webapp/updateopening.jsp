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
<title>Update opening</title>
</head>
<body>
<p style="color: red;"><%= errorMessage %></p>
	<p>Please update opening fields and press Update opening button or
		press Cancel button.</p>
	<c:url var="openingUrl" value="/opening.jsp" />
	<form method="post" action="opening">
		<input type="hidden" name="actiontype" value="updateopening" /> <input
			type="hidden" name="id_opening" value="${param.id_opening }" />
		<p>
			Opening id:
			<c:out value="${param.id_opening }" />
		</p>
		<p>
			Opening name: <input type="text" name="opening_name"
				value="${param.opening_name }" />
		</p>
		<p>
			Opening category: <select name="opening_category">
				<c:choose>
					<c:when test="${param.opening_category eq 'Відкритий'}">
						<option value="Відкритий" selected>Відкритий</option>
						<option value="Напіввідкритий">Напіввідкритий</option>
						<option value="Закритий">Закритий</option>
						<option value="Фланговий">Фланговий</option>
					</c:when>
					<c:when test="${param.opening_category eq 'Напіввідкритий'}">
						<option value="Відкритий">Відкритий</option>
						<option value="Напіввідкритий" selected>Напіввідкритий</option>
						<option value="Закритий">Закритий</option>
						<option value="Фланговий">Фланговий</option>
					</c:when>
					<c:when test="${param.opening_category eq 'Закритий'}">
						<option value="Відкритий">Відкритий</option>
						<option value="Напіввідкритий">Напіввідкритий</option>
						<option value="Закритий" selected>Закритий</option>
						<option value="Фланговий">Фланговий</option>
					</c:when>
					<c:otherwise>
						<option value="Відкритий">Відкритий</option>
						<option value="Напіввідкритий" selected>Напіввідкритий</option>
						<option value="Закритий">Закритий</option>
						<option value="Фланговий" selected>Фланговий</option>
					</c:otherwise>
				</c:choose>
			</select>
		</p>
		<p>
			Opening year: <input type="text" name="opening_year"
				value="${param.opening_year }" />
		</p>
		<p>
			Famous player: <input type="text" name="famous_player"
				value="${param.famous_player }" />
		</p>
		<input type="submit" name="updateopening" value="Update opening" /> <input
			type="button" onClick="window.location.href='${openingUrl}'"
			value="Cancel" />
	</form>
</body>
</html>