<%@page import="com.PharmaSoft.DAO"%>
<%@page import="com.PharmaSoft.Medicine"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Medicine - PharmaSoft</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
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

.button {
	padding: 4px 12px;
	font-size: 18px;
	color: white;
	background-color: #007bff; 
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease, transform 0.2s ease;
	text-decoration: none;
	display: inline-block;
}

.button:hover {
	background-color: #0056b3;
	transform: scale(1.05);
}

.button:active {
	background-color: #004494;
	transform: scale(0.98);
}
.button-delete{
	padding: 4px 12px;
	font-size: 18px;
	color: white;
	background-color: red; 
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease, transform 0.2s ease;
	text-decoration: none;
	display: inline-block;
}
.button-delete:hover {
	background-color: darkred;
	transform: scale(1.05);
}

.button-delete:active {
	background-color: #004494;
	transform: scale(0.98);
}
</style>
</head>
<body>
	<div class="sidebar">
		<h3 class="text-center">PharmaSoft</h3>
			<a href="home.html">🏠 Dashboard</a> 
			<a href="addMed.jsp">➕ Add Medicine</a> 
			<a href="ViewMed.jsp">📋 View Medicines</a> 
			<a href="SellMed.jsp">💊 Sell Medicine</a> 
			<a href="SearchMed.jsp">🔍 Search Medicine</a> 
			<a href="ViewHistory.jsp">📊 View Sales</a> 
			<a href="logoutServlet">🚪 Logout</a>
	</div>
	<div class="content">
		<table class="table">
			<thead class="thead-dark">
				<tr style="text-align: center">
					<th scope="col">ID</th>
					<th scope="col">Medicine Name</th>
					<th scope="col">Medicine Price</th>
					<th scope="col">Medicine Qty</th>
					<th scope="col">Edit</th>
					<th scope="col">Delete</th>
				</tr>
			</thead>
			<%
			List<Medicine> list = DAO.getAllMedicine();
			request.setAttribute("list", list);
			%>
			<tbody>
				<c:forEach items="${list}" var="e">
					<tr style="text-align: center">
						<td>${e.getId()}</td>
						<td>${e.getMedName()}</td>
						<td>${e.getMedPrice()}</td>
						<td>${e.getMedQty()}</td>
						<td><a href="editMed.jsp?id=${e.getId()}" class="button">Edit</a>
						</td>
						<td><a href="deleteMed.jsp?id=${e.getId()}" class="button-delete">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>