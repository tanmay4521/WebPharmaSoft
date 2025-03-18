<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.PharmaSoft.Medicine"%>
<%@page import="com.PharmaSoft.DAO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Medicine Search - PharmaSoft</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 250px;
            background-color: #007bff;
            color: white;
            padding-top: 20px;
            position: fixed;
            height: 100%;
            overflow-y: auto;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .sidebar a {
            display: block;
            padding: 15px 20px;
            color: white;
            text-decoration: none;
            font-size: 18px;
            transition: background 0.3s;
        }

        .sidebar a:hover {
            background-color: #0056b3;
        }
        .main-content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            width: 90%;
            max-width: 600px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .search-bar {
            display: flex;
            margin-bottom: 20px;
        }

        .search-bar input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px 0 0 5px;
            font-size: 16px;
            outline: none;
        }

        .search-bar button {
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
            transition: background 0.3s;
        }

        .search-bar button:hover {
            background-color: #218838;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .no-result {
            text-align: center;
            color: #999;
            padding: 20px;
        }
    </style>
</head>
<body>
<div class="sidebar">
    <h2 style="color:white">PharmaSoft</h2>
        <a href="home.html">🏠 Dashboard</a>
        <a href="addMed.jsp">➕ Add Medicine</a>
        <a href="ViewMed.jsp">📋 View Medicines</a>
        <a href="SellMed.jsp">💊 Sell Medicine</a>
        <a href="SearchMed.jsp">🔍 Search Medicine</a>
        <a href="ViewHistory.jsp">📊 View Sales</a>
        <a href="/logoutServlet">🚪 Logout</a>
</div>
<div class="main-content">
    <div class="container">
        <h2>Medicine Search</h2>
        <form action="searchMedicine.jsp">
            <div class="search-bar">
                <input type="text" name="med_name" placeholder="Enter medicine name...">
                <button type="submit">Search</button>
            </div>
        </form>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Medicine Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Medicine> list = (List<Medicine>) request.getAttribute("medicines");
                    if (list != null && !list.isEmpty()) {
                        for (Medicine m : list) {
                %>
                <tr>
                    <td><%= m.getId() %></td>
                    <td><%= m.getMedName() %></td>
                    <td>₹<%= m.getMedPrice() %></td>
                    <td><%= m.getMedQty() %></td>
                </tr>
                <% 
                        }
                    } else { 
                %>
                <tr>
                    <td colspan="4" class="no-result">No medicine found!</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
