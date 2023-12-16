<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete opening</title>
</head>
<body>
	<p>Below opening will be deleted:</p>
	<p>Opening id: ${param.id_opening}</p>
	<p>Opening name: ${param.opening_name}</p>
	<p>Opening category: ${param.opening_category}</p>
	<p>Opening year: ${param.opening_year}</p>
	<p>Famous player: ${param.id_player}</p>
	<p>Could you please confirm?</p>
	<c:url var="openingUrl" value="/opening.jsp" />
	<form method="post" action="opening">
		<input type="hidden" name="actiontype" value="deleteopening" /> <input
			type="hidden" name="id_opening" value="${param.id_opening }" /> <input
			type="submit" name="deleteopening" value="Delete opening" /> <input
			type="button" onclick="window.location.href='${openingUrl}'"
			value="Cancel" />
	</form>
</body>
</html>