<%@page import="com.PharmaSoft.Medicine"%>
<%@page import="com.PharmaSoft.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Medicine - PharmaSoft</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            margin: 0;
            height: 100vh;
        }
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #007bff;
            padding-top: 20px;
            color: white;
        }
        .sidebar h3 {
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .sidebar a {
            padding: 12px 20px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
            transition: 0.3s;
        }
        .sidebar a:hover {
            background-color: #0056b3;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            width: calc(100% - 250px);
            height: 100vh;
        }
        .container {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
        }
        h2 {
            margin-bottom: 20px;
            color: #007bff;
        }
        .form-group {
            text-align: left;
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
        }
        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-top: 5px;
        }
        button {
            background-color: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
	<%
		int id=Integer.parseInt(request.getParameter("id"));
		Medicine e=DAO.getMedicineById(id);
	%>
    <div class="sidebar">
        <h3>PharmaSoft</h3>
        <a href="home.html">🏥 Dashboard</a>
        <a href="addMed.jsp">➕ Add Medicine</a>
        <a href="ViewMed.jsp">📋 View Medicines</a>
        <a href="SellMed.jsp">💊 Sell Medicine</a>
        <a href="SearchMed.html">🔍 Search Medicine</a>
        <a href="ViewBill.html">🧾 View Bills</a>
        <a href="/logoutServlet">🚪 Logout</a>
    </div>

    <div class="content">
        <div class="container">
            <h2>Update Medicine</h2>
            <form action="updateMed.jsp">
            <div class="form-group">
                    <label for="medId">Medicine ID:</label>
                    <input type="hidden" id="medId" name="id" value="<%=e.getId()%>">
                </div>
                <div class="form-group">
                    <label for="medName">Medicine Name:</label>
                    <input type="text" id="medName" name="medName" value="<%=e.getMedName()%>">
                </div>
                <div class="form-group">
                    <label for="medPrice">Medicine Price:</label>
                    <input type="number" id="medPrice" name="medPrice" step="0.01" value="<%=e.getMedPrice() %>">
                </div>
                <div class="form-group">
                    <label for="medQty">Quantity:</label>
                    <input type="number" id="medQty" name="medQty" value="<%=e.getMedQty() %>">
                </div>
                <button type="submit">Update Medicine</button>
            </form>
        </div>
    </div>
</body>
</html>