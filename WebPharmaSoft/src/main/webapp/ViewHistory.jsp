<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.PharmaSoft.Medicine"%>
<%@page import="com.PharmaSoft.DAO"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Sales - PharmaSoft</title>
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
            align-items: flex-start;
        }

        .container {
            width: 90%;
            max-width: 800px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
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
            font-size: 16px;
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
    <h2>PharmaSoft</h2>
    <a href="home.html">🏠 Dashboard</a>
    <a href="addMed.jsp">➕ Add Medicine</a>
    <a href="ViewMed.jsp">📋 View Medicines</a>
    <a href="SellMed.jsp">💊 Sell Medicine</a>
    <a href="SearchMed.jsp">🔍 Search Medicine</a>
    <a href="ViewHistory.jsp">📊 View Sales</a>
    <a href="logoutServlet">🚪 Logout</a>
</div>


<div class="main-content">
    <div class="container">
        <h2>Sales History</h2>
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Medicine Name</th>
                    <th>Customer Name</th>
                    <th>Price</th>
                    <th>Quantity Sold</th>
                    <th>Sold Date</th>
                </tr>
            </thead>
            <%
            	List<Medicine> list=DAO.getSellMedOrder();
            	if(list!=null) {
            %>
            <tbody>
            	<%for(Medicine m:list){ %>
                <tr>
						<td><%=m.getId()%></td>
						<td><%=m.getMedName()%></td>
						<td><%=m.getCust_name()%></td>
						<td><%=m.getMedPrice()%></td>
						<td><%=m.getMedQty()%></td>
						<td><%=m.getSoldDate() %></td>
                </tr>
                <%} %>
            </tbody>
             <%} else {%>
            <tbody>
                <tr>
                    <td colspan="6" class="no-result">No sales records found!</td>
                </tr>
            </tbody>
             <%}%>
        </table>
    </div>
</div>

</body>
</html>
