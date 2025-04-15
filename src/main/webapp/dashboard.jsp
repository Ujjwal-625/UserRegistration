<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 15-04-2025
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            display: flex;
            height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 220px;
            background-color: #2c3e50;
            color: white;
            padding: 20px;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .sidebar ul {
            list-style: none;
        }

        .sidebar ul li {
            margin: 20px 0;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: white;
            display: block;
            padding: 10px;
            transition: 0.3s;
        }

        .sidebar ul li a:hover {
            background-color: #34495e;
            border-radius: 5px;
        }

        /* Main content */
        .main {
            flex: 1;
            background-color: #ecf0f1;
            padding: 20px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: white;
            padding: 15px 20px;
            box-shadow: 0 1px 4px rgba(0,0,0,0.1);
        }

        .content {
            margin-top: 20px;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }

        .card {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

<div class="sidebar">
    <h2>My Dashboard</h2>
    <ul>
        <li><a href="#">Dashboard</a></li>
        <li><a href="#">Analytics</a></li>
        <li><a href="#">Reports</a></li>
        <li><a href="#">Settings</a></li>
    </ul>
</div>

<div class="main">
    <div class="header">
        <h1>Welcome Back!</h1>
        <button><a href="">logout</a></button>
    </div>

    <div class="content">
        <div class="card">
            <h3>Total Users</h3>
            <p>1,230</p>
        </div>
        <div class="card">
            <h3>Revenue</h3>
            <p>$45,000</p>
        </div>
        <div class="card">
            <h3>Active Sessions</h3>
            <p>342</p>
        </div>
        <div class="card">
            <h3>New Signups</h3>
            <p>120</p>
        </div>
    </div>
</div>

</body>
</html>

