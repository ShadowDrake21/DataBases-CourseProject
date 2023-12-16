<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update opening usage</title>
</head>
<body>
	<p>Please update opening usage fields and press Update opening usage button or
		press Cancel button.</p>
	<c:url var="openingusageUrl" value="/openingusage.jsp/" />
	<form method="post" action="openingusage">
		<input type="hidden" name="actiontype" value="updateopeningusage" />
		<input type="hidden" name="id_opening_usage" value="${param.id_opening_usage }" />
		<p>
			Opening Usage id:
			<c:out value="${param.id_opening_usage }" />
		</p>
		<p>
			Opening id: <input type="text" name="id_opening"
				value="${param.id_opening }" />
		</p>
		<p>
			Player id: <input type="text" name="id_player"
				value="${param.id_player }" />
		</p>
		<p>
			Points: <input type="text" name="usage_points"
				value="${param.usage_points }" />
		</p>
		<input type="submit" name="updateopeningusage" value="Update opening usage" /> <input
			type="button" onClick="window.location.href='${openingusageUrl}'"
			value="Cancel" />
	</form>
</body>
</html>