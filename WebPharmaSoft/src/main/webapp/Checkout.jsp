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
	<jsp:useBean id="m" class="com.PharmaSoft.Medicine"></jsp:useBean>
	<jsp:setProperty property="*" name="m"/>
	<%
		int status = DAO.checkOut(m);
		if(status>0) 
		{
		    out.print("<script>alert('Medicine Sold Successfully!'); window.location.href='SellMed.jsp';</script>");
		    int status1=DAO.addSellMedOrder(m);
		} else 
		{
		    out.print("<script>alert('Medicine Quantity is Not Sufficient!! OR Something Went Wrong Please Try again Later!!'); window.location.href='SellMed.jsp';</script>");
		}
	%>
</body>
</html>