<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update title</title>
</head>
<body>
	<p>Please update title fields and press Update title button or
		press Cancel button.</p>
	<c:url var="titleUrl" value="/title.jsp/" />
	<form method="post" action="title">
		<input type="hidden" name="actiontype" value="updatetitle" /> <input
			type="hidden" name="title_id" value="${param.title_id }" />
		<p>
			Title id:
			<c:out value="${param.title_id }" />
		</p>
		<p>
			Title name: <input type="text" name="title_name"
				value="${param.title_name }" />
		</p>
		<p>
			Title year: <input type="text" name="title_year"
				value="${param.title_year }" />
		</p>
		<p>
			Player id: <input type="text" name="id_player"
				value="${param.id_player }" />
		</p>
		<input type="submit" name="updatetitle" value="Update title" /> <input
			type="button" onClick="window.location.href='${titleUrl}'"
			value="Cancel" />
	</form>
</body>
</html>