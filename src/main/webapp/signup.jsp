<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <style>
        /* Style for the body with background image */
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/bg.jpg'); /* Path to your image */
            background-size: cover; /* Ensures the image covers the whole page */
            background-position: center; /* Centers the image */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Container for the form */
        form {
            background-color: rgba(255, 255, 255, 0.2); /* 80% transparent background */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.9);
            width: 300px;
            display: flex;
            flex-direction: column; /* Stack the elements vertically */
            align-items: center; /* Center the elements */
        }

        /* Heading */
        h3 {
            text-align: center;
            margin-bottom: 20px;
            color: blue;
        }

        /* Style for the form labels and inputs */
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            width: 100%; /* Make label full width */
            text-align: left; /* Align labels to the left */
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 80%; /* Set a width to the input fields */
            max-width: 250px; /* Limit the max width of input fields */
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: rgba(255, 255, 255, 0.2); /* 80% transparent input fields */
        }

        /* Submit button styling */
        input[type="submit"] {
            width: 80%; /* Set a width to the submit button */
            max-width: 250px; /* Limit the max width of the submit button */
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form id="signupForm">
        <h3>Sign Up</h3>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <input type="submit" value="Sign Up">
    </form>

    <script>
    const form = document.getElementById("signupForm");

    form.addEventListener("submit", async (event) => {
        event.preventDefault();

        const password = document.getElementById("password").value;

        // Regular expression to enforce password rules
        const passwordRegex = /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;

        if (!passwordRegex.test(password)) {
            alert("Password must contain at least one uppercase letter, one special character, one number, and be at least 8 characters long.");
            return;
        }

        const user = {
            username: document.getElementById("username").value,
            emailid: document.getElementById("email").value,
            password: password,
        };

        try {
            const response = await fetch("http://localhost:8080/user/register", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(user),
            });

            const result = await response.text();
            if (response.ok) {
                alert(result);
                window.location.href = "/";
            } else {
                alert(`Error: ${result}`);
            }
        } catch (error) {
            alert("Error connecting to the server.");
        }
    });
</script>

</body>
</html>
