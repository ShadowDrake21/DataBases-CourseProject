    // Function to handle logout and clear localStorage
    function logout() {
        // Clear localStorage
        localStorage.clear();

        // Redirect to the LogoutServlet
        window.location.href = "logout";
    }

    function populateUserData() {
        var userDataString = localStorage.getItem("userData");
        var logoutButton = document.getElementById("logoutButton");
        var loginButton = document.getElementById("loginButton");
        var inputFields = document.querySelectorAll('[data-type="userinput"]');
        var isUserAuthorized = userDataString !== null;

        if (isUserAuthorized) {
            var userData = JSON.parse(userDataString);
            document.getElementById("username").innerText = userData.username;
            logoutButton.style.display = 'block';
            loginButton.style.display = 'none'; // Enable the logout button

            if (inputFields.lenght !== 0) {
                // Enable input fields
                inputFields.forEach(function(input) {
                    input.removeAttribute('disabled');
                });
            }
        } else {
            document.getElementById("username").innerText = "unauthorized";
            logoutButton.style.display = 'none'; // Disable the logout button
            loginButton.style.display = 'block';

            if (inputFields.lenght !== 0) {
                // Disable input fields
                inputFields.forEach(function(input) {
                    input.setAttribute('disabled', 'disabled');
                });
            }
        }
    }

    // Call the function when the page loads
    window.onload = function() {
        populateUserData();
    };