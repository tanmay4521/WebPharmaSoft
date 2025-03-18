	<%@page import="com.PharmaSoft.DAO"%>
	<%@page import="java.util.List"%>
	<%@page import="com.PharmaSoft.Medicine"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html lang="en">
	<head>
	    <meta charset="UTF-8" />
	    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	    <title>Pharmacy Medicine Cart</title>
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
	    <style>
	        body {
	            font-family: Arial, sans-serif;
	            background-color: #f8f8f8;
	            margin: 0;
	            padding: 0;
	            box-sizing: border-box;
	        }
	        .header {
	            background-color: #28a745;
	            padding: 15px;
	            text-align: center;
	            color: white;
	            font-size: 24px;
	            font-weight: bold;
	        }
	        .container {
	            display: flex;
	            gap: 10px;
	            padding: 10px;
	            align-items: stretch;
	            box-sizing: border-box;
	        }
	        .left-section, .right-section {
	            border: 1px solid #28a745;
	            padding: 15px;
	            background-color: #ffffff;
	            border-radius: 5px;
	            box-shadow: 0px 4px 8px rgba(0,0,0,0.1);
	            overflow: hidden;
	            box-sizing: border-box;
	            display: flex;
	            flex-direction: column;
	        }
	        .left-section {
	            width: 60%;
	            height: auto;
	        }
	        .right-section {
	            width: 40%;
	            height: auto;
	        }
	        table {
	            width: 100%;
	            border-collapse: collapse;
	            margin-top: 10px;
	        }
	        th, td {
	            border: 1px solid #28a745;
	            padding: 8px;
	            text-align: left;
	        }
	        th {
	            background-color: #28a745;
	            color: white;
	        }
	        input[type="text"], input[type="number"] {
	            width: calc(100% - 10px);
	            padding: 8px;
	            margin-bottom: 10px;
	            border: 1px solid #ccc;
	            border-radius: 3px;
	            box-sizing: border-box;
	        }
	        .btn {
	            padding: 10px;
	            border: none;
	            color: white;
	            border-radius: 3px;
	            cursor: pointer;
	            font-size: 16px;
	            margin-right: 5px;
	            transition: background 0.2s ease;
	        }
	        .btn-green { background-color: #28a745; }
	        .btn-orange { background-color: #ff9800; }
	        .btn-red { background-color: #f44336; }
	        .btn-grey { background-color: #616161; }
	        .btn:hover {
	            opacity: 0.9;
	        }
	        .total-section {
	            text-align: right;
	            font-weight: bold;
	            font-size: 18px;
	            margin-top: 10px;
	        }
	        a {
	            text-decoration: none;
	            color: #28a745;
	            font-weight: bold;
	            cursor: pointer;
	        }
	        a:hover {
	            text-decoration: underline;
	        }
	    </style>
	</head>
	<body>
	
	<div class="header">Pharmacy Medicine Cart</div>
	
	<div class="container">
	    <div class="left-section">
	        <form action="SearchMedicineInSellMed.jsp">
	            <div>
	                <label>🔍 Search Medicine:</label>
	                <input type="text" name="med_name" placeholder="Enter medicine name..." />
	                <button class="btn btn-green">Search</button>
	            </div>
	        </form>
	        <table>
	            <thead>
	                <tr>
	                    <th>ID</th>
	                    <th>Name</th>
	                    <th>Price</th>
	                    <th>Stock</th>
	                    <th>Action</th>
	                </tr>
	            </thead>
	            <%
	                List<Medicine> m2 = (List<Medicine>)request.getAttribute("medicines");
	                if (m2 != null && !m2.isEmpty()) {
	            %>
	            <tbody>
	                <% for (Medicine m : m2) { %>
	                    <tr>
	                        <td><%= m.getId() %></td>
	                        <td><%= m.getMedName() %></td>
	                        <td>₹<%= m.getMedPrice() %></td>
	                        <td><%= m.getMedQty() %></td>
	                        <td><a href="addtoFields.jsp?id=<%=m.getId()%>">Select</a></td>
	                    </tr>
	                <% } %>
	            </tbody>
	            <% } %>
	        </table>
	    </div>

	    <%
		    Medicine m1 = (Medicine) request.getAttribute("selectedMed");
		    if (m1 != null) {	
		%>
		<div class="right-section" >
		    <form action="Checkout.jsp">
		    	<label>🏷 Customer Name:</label>
		        <input type="text" name="cust_name" required>
		    	<label>📋 Medicine ID:</label>
		        <input type="text" name="id" value="<%= m1.getId() %>"	readonly>
		    	<label>🏷 Name:</label>    
		        <input type="text" name="medName" value="<%= m1.getMedName() %>" readonly>
		    	<label><i class="fa-solid fa-indian-rupee-sign"></i> Price:</label>    
		        <input type="text" name="medPrice" value="<%= m1.getMedPrice() %>"readonly>
		        <label>🛒 Quantity:</label>
		        <input type="number" name="sellQty" placeholder="Enter quantity" required />
		        <input type="submit" class="btn btn-orange" value="Checkout">
		    </form>
		</div>
	<% } %>
</body>	
</html>
