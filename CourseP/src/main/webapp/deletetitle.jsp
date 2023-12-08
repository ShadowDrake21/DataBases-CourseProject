<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete title</title>
</head>
<body>
	<p>Below title will be deleted:</p>
	<p>Title id: ${param.title_id}</p>
	<p>Title name: ${param.title_name}</p>
	<p>Title year: ${param.title_year}</p>
	<p>Player id: ${param.id_player}</p>
	<p>Could you please confirm?</p>
	<c:url var="titleUrl" value="/title.jsp" />
	<form method="post" action="title">
		<input type="hidden" name="actiontype" value="deletetitle" /> <input
			type="hidden" name="title_id" value="${param.title_id }" /> <input
			type="submit" name="deletetitle" value="Delete title" /> <input
			type="button" onclick="window.location.href='${titleUrl}'"
			value="Cancel" />
	</form>
</body>
</html>