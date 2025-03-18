<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.PharmaSoft.Medicine"%>
<%@page import="com.PharmaSoft.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String med_name=request.getParameter("med_name");
		List<Medicine> m1 = DAO.searchMedicine(med_name);
		request.setAttribute("medicines", m1);
		request.getRequestDispatcher("SellMed.jsp").forward(request, response);
	%>
</body>
</html>