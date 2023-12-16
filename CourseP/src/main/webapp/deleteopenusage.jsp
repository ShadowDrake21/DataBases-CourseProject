<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete opening usage</title>
</head>
<body>
	<p>Below opening usage will be deleted:</p>
	<p>Opening Usage id: ${param.id_opening_usage}</p>
	<p>Opening id: ${param.id_opening}</p>
	<p>Points: ${param.usage_points}</p>
	<p>Could you please confirm?</p>
	<c:url var="openingusageUrl" value="/openingusage.jsp" />
	<form method="post" action="openingusage">
		<input type="hidden" name="actiontype" value="deleteopeningusage" /> <input
			type="hidden" name="id_opening_usage" value="${param.id_opening_usage }" /> <input
			type="submit" name="deleteopeningusage" value="Delete opening usage" /> <input
			type="button" onclick="window.location.href='${openingusageUrl}'"
			value="Cancel" />
	</form>
</body>
</html>