<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Verify Certificate</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f9;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label, input {
            display: block;
            margin-bottom: 15px;
            width: 100%;
        }

        input[type="text"],
        input[type="submit"] {
            padding: 10px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form method="get" action="/certificate/verify">
        <h3>Verify Certificate</h3>
        <label for="certificateId">Certificate ID:</label>
        <input type="text" id="certificateId" name="certificateId" required>
        <input type="submit" value="Verify">
    </form>
</body>
</html>
