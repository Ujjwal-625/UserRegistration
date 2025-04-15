<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome | JSP App</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        h1 {
            font-size: 3rem;
            margin-bottom: 20px;
        }

        p {
            font-size: 1.2rem;
            margin-bottom: 40px;
        }

        .button-group {
            display: flex;
            gap: 20px;
        }

        a {
            text-decoration: none;
            color: white;
            background-color: rgba(255, 255, 255, 0.2);
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: rgba(255, 255, 255, 0.4);
        }
    </style>
</head>
<body>

<h1><%= "Hello World!" %></h1>
<p>Welcome to our simple JSP Web Application</p>

<div class="button-group">
    <a href="hello-servlet">Hello Servlet</a>
    <a href="login">Login</a>
    <a href="signup">Sign Up</a>
</div>

</body>
</html>
