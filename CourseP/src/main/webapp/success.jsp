<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Success</title>
    <script>
        // Function to store user data in Local Storage
        function storeUserData() {
            var username = "<%= session.getAttribute("username") %>";
            var password = "<%= session.getAttribute("password") %>";

            // Check if Local Storage is supported
            if (typeof(Storage) !== "undefined") {
                // Store user data in Local Storage
                localStorage.setItem("username", username);
                localStorage.setItem("password", password);
            } else {
                alert("Sorry, your browser does not support Local Storage.");
            }
        }

        // Call the function when the page loads
        window.onload = function() {
            storeUserData();
        };
    </script>
</head>
<body>
    <h2>Login Successful!</h2>
</body>
</html>