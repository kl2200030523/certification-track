<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Upload Certificate</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body */
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/bg.jpg'); /* Path to your image */
            background-size: cover; /* Ensures the image covers the whole page */
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 20px;
        }

        /* Container */
        .container {
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.9);
            width: 100%;
            max-width: 600px;
            padding: 30px;
        }

        /* Inner Container for Header */
        .inner_container_1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .inner_container_1 h3 {
            font-size: 24px;
            font-weight: 600;
            color: #333;
        }

        /* Inner Container for Form */
        .inner_container_2 {
            display: flex;
            flex-direction: column;
        }

        /* Form Elements */
        label {
            font-size: 16px;
            margin-bottom: 8px;
            color: #555;
        }

        input[type="number"],
        input[type="file"] {
            padding: 10px;
            margin-bottom: 20px;
            border-bottom: 1px solid black;
            font-size: 14px;
            width: 100%;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="inner_container_1">
            <h3>Upload Certificate</h3>
        </div>
        <div class="inner_container_2">
            <form action="http://localhost:8080/certificate/upload" method="post" enctype="multipart/form-data">
                <label for="userId">User ID:</label>
                <input type="number" id="userId" name="userId" required>

                <label for="file">Certificate File (Image/PDF):</label>
                <input type="file" id="file" name="file" accept="image/*,application/pdf" required>

                <input type="submit" value="Upload">
            </form>
        </div>
    </div>
</body>
</html>
