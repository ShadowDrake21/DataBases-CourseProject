<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Success</title>
    <style>
        /* Style for the progress bar container */
        #progress-bar-container {
            width: 100%;
            height: 30px;
            position: relative;
        }

        /* Style for the progress bar */
        #progress-bar {
            width: 0%;
            height: 100%;
            background-color: #4CAF50;
            position: absolute;
            top: 0;
            left: 0;
            transition: width 1s linear;
        }

        /* Style for the percentage label */
        #percentage-label {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
        }
    </style>
    <script>
        // Function to store user data in Local Storage as an object
        function storeUserData() {
            var username = "<%= session.getAttribute("username") %>";
            var password = "<%= session.getAttribute("password") %>";
            var userData = { username: username, password: password };

            // Check if Local Storage is supported
            if (typeof(Storage) !== "undefined") {
                // Store user data object in Local Storage
                localStorage.setItem("userData", JSON.stringify(userData));
            } else {
                alert("Sorry, your browser does not support Local Storage.");
            }
        }

        // Function to update the progress bar and redirect to homepage after 5 seconds
        function redirectToHomepage() {
            var progressBar = document.getElementById("progress-bar");
            var percentageLabel = document.getElementById("percentage-label");
            var startTime = new Date().getTime();
            var duration = 5000; // 5000 milliseconds = 5 seconds

            // Update the progress bar and percentage label every 50 milliseconds
            var intervalId = setInterval(function () {
                var currentTime = new Date().getTime();
                var elapsedTime = currentTime - startTime;
                var progress = (elapsedTime / duration) * 100;

                progressBar.style.width = progress + "%";
                percentageLabel.textContent = Math.round(progress) + "%";

                if (elapsedTime >= duration) {
                    clearInterval(intervalId);
                    window.location.href = "homepage.jsp";
                }
            }, 50);
        }

        // Call the function when the page loads
        window.onload = function() {
            storeUserData();
            redirectToHomepage();
        };
    </script>
</head>
<body>
    <h2>Login Successful!</h2>
    <div id="progress-bar-container">
        <div id="progress-bar"></div>
        <div id="percentage-label" style="color: black;">0%</div>
    </div>
</body>
</html>
