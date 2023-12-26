<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login page</title>
</head>
<body>
    <h1>Login page</h1>
    <form method="post" action="login" style="display: flex; flex-direction: column; gap: 20px;">
        <label>User: <input type="text" name="username" /></label>
        <label>Password: <input type="password" name="password" /></label>
        <div>
            <input type="hidden" name="actiontype" value="login" />
            <input type="submit" name="login" value="Login" />
        </div>
    </form>
</body>
</html>