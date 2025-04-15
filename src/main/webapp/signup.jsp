<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 15-04-2025
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
    <style>
        /* Reuse same CSS as login page */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 300px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        input[type="submit"]:hover {
            background-color: #1e7e34;
        }

        .link {
            text-align: center;
            margin-top: 15px;
        }

        .link a {
            color: #007bff;
            text-decoration: none;
        }

        .link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Sign Up</h2>
    <form action="signup" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>


        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>



        <input type="submit" value="Register">
    </form>

    <div class="link">
        <p>Already have an account? <a href="login">Login</a></p>
    </div>
</div>
</body>
</html>

