<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="css/styles.css" />
    <style>
    	/* styles.css */

body {
    font-family: Arial, sans-serif;
    background-image: url('images/bg.jpg');
     /* Path to your image */
    background-size: cover; /* Ensures the image covers the whole page */
    background-position: center;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    
    
}

.loginWindow {
	background-color: rgba(255, 255, 255, 0.2);
    width: 330px;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.9);
    border-radius: 8px;
}

.loginHeader {
    font-size: 24px;
    font-weight: bold;
    text-align: center;
    color: #333;
    margin-bottom: 20px;
}

.loginContent label {
    display: block;
    margin-bottom: 6px;
    font-size: 14px;
    color: #555;
}

.loginContent input[type="text"],
.loginContent input[type="password"] {
    width: 300px;
    padding: 10px;
    margin-bottom: 16px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 14px;
}

.signinButton {
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    border: none;
    border-radius: 4px;
    color: white;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.signinButton:hover {
    background-color: #0056b3;
}

.signupLabel {
    text-align: center;
    margin-top: 16px;
    font-size: 14px;
    color: #555;
}

.signupLabel a {
    color: #007bff;
    text-decoration: none;
    font-weight: bold;
}

.signupLabel a:hover {
    text-decoration: underline;
}
    	
    </style>
</head>
<body>
    <div class="loginWindow">
        <div class="loginHeader">Sign In</div>
        <div class="loginContent">
            <form id="loginForm">
                <label for="username">Username:</label>
                <input type="text" id="username" required>

                <label for="password">Password:</label>
                <input type="password" id="password" required>

                <input type="submit" value="Login" class="signinButton">
            </form>
            <p class="signupLabel">Don't have an account? <a href="signup.jsp">Register here</a></p>
        </div>
    </div>

    <script>
        const loginForm = document.getElementById("loginForm");
        loginForm.addEventListener("submit", async (event) => {
            event.preventDefault();

            const user = {
                username: document.getElementById("username").value,
                password: document.getElementById("password").value,
            };

            try {
                const response = await fetch("http://localhost:8080/user/login", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    body: JSON.stringify(user),
                });

                const result = await response.text();
                if (response.ok && result.includes("200")) {
                    alert("Login successful!");
                    window.location.href = "/home";
                } else {
                    alert("Invalid credentials!");
                }
            } catch (error) {
                alert("Error connecting to the server.");
            }
        });
    </script>
</body>
</html>
